.class public Ll/fnl;
.super Ll/kse0;
.source "SourceFile"

# interfaces
.implements Ljavax/servlet/http/HttpServletRequest;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kse0;-><init>(Ll/gse0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private _getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/kse0;->getRequest()Ll/gse0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljavax/servlet/http/HttpServletRequest;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public authenticate(Ljavax/servlet/http/HttpServletResponse;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->authenticate(Ljavax/servlet/http/HttpServletResponse;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getAuthType()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getAuthType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContextPath()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getContextPath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCookies()[Ljavax/servlet/http/Cookie;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getCookies()[Ljavax/servlet/http/Cookie;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDateHeader(Ljava/lang/String;)J
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getDateHeader(Ljava/lang/String;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHeaderNames()Ljava/util/Enumeration;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getHeaderNames()Ljava/util/Enumeration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIntHeader(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getIntHeader(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPart(Ljava/lang/String;)Ll/qg60;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getPart(Ljava/lang/String;)Ll/qg60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getParts()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ll/qg60;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getParts()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPathInfo()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPathTranslated()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getPathTranslated()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getQueryString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRemoteUser()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getRemoteUser()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRequestURI()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRequestURL()Ljava/lang/StringBuffer;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getRequestURL()Ljava/lang/StringBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRequestedSessionId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getRequestedSessionId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getServletPath()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSession()Ll/hnl;
    .locals 0

    .line 10
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    move-result-object p0

    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getSession()Ll/hnl;

    move-result-object p0

    return-object p0
.end method

.method public getSession(Z)Ll/hnl;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ll/hnl;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserPrincipal()Ljava/security/Principal;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->getUserPrincipal()Ljava/security/Principal;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public isRequestedSessionIdFromCookie()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->isRequestedSessionIdFromCookie()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isRequestedSessionIdFromURL()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->isRequestedSessionIdFromURL()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isRequestedSessionIdFromUrl()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->isRequestedSessionIdFromUrl()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isRequestedSessionIdValid()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->isRequestedSessionIdValid()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isUserInRole(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljavax/servlet/http/HttpServletRequest;->isUserInRole(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Ljavax/servlet/http/HttpServletRequest;->login(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public logout()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/fnl;->_getHttpServletRequest()Ljavax/servlet/http/HttpServletRequest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljavax/servlet/http/HttpServletRequest;->logout()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
