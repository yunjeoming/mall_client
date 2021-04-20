<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookCalendar</title>
</head>
<body>
<!-- Header -->
	<header id="header">
		<h1><strong><a href="${pageContext.request.contextPath}/IndexController">EbookMall</a></strong> for you</h1>
		<nav id="nav">
			<ul>
				<li><jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include></li>
			</ul>
		</nav>
	</header>
	
	<section id="main" class="wrapper">
		<div class="container">
			<header class="major special">
				<h1>Ebook Calendar</h1>
			</header>
		
			<div class="table-wrapper">
	
				<!-- n행 7열 -->
				<div>
					<a href="${pageContext.request.contextPath }/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}">이전 달</a>
					<span>${currentYear}년</span>
					<span>${currentMonth}월</span>
					<a href="${pageContext.request.contextPath }/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}">다음 달</a>
				</div>
				
				<table class="alt">
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
					
					<tr>
						<!-- 공백 +endDay만큼 td가 필요 -->
						<c:forEach var="i" begin="1" end="${endDay+(firstDayOfWeek-1)}" step="1">
							<!-- 앞 공백 -->
							<c:if test="${i-(firstDayOfWeek-1) <= 0}">
								<td>&nbsp;</td>
							</c:if>
							<!-- 1-30/31 날짜 -->
							<c:if test="${i-(firstDayOfWeek-1) > 0}">
								<td>
									<div>${i-(firstDayOfWeek-1)}</div>
									<div>
										<c:forEach var="m" items="${ebookListByDay}">
											<c:if test="${(i-(firstDayOfWeek-1)) == m.d}">
												<div>
													<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
														<c:if test="${m.ebookTitle.length()>10 }">
															${m.ebookTitle.substring(0,10)}...
														</c:if>
														 <c:if test="${m.ebookTitle.length()<= 10}">
			                                 				${m.ebookTitle}
			                                			</c:if>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</td>
							</c:if>
							<!-- 아랫줄로 넘어가라 -->
							<c:if test="${i%7==0}">
								<tr></tr>
							</c:if>
						</c:forEach>
						
						<!-- td반복 후 채워지지 않는 자리 채우기 -->
						<c:if test="${(endDay+(firstDayOfWeek-1))%7 != 0}">
							<c:forEach begin="1" end="${7-((endDay+(firstDayOfWeek-1))%7)}" step="1">
								<td>&nbsp;</td>
							</c:forEach>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
	</section>
	
<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-facebook"></a></li>
				<li><a href="#" class="icon fa-twitter"></a></li>
				<li><a href="#" class="icon fa-instagram"></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; yunjeong</li>
				<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
				<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
			</ul>
		</div>
	</footer>
</body>
</html>