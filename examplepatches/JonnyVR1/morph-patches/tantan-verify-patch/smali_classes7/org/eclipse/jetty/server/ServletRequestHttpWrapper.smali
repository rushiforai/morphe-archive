.class public Lorg/eclipse/jetty/server/ServletRequestHttpWrapper;
.super Ll/kse0;
.source "SourceFile"

# interfaces
.implements Ljavax/servlet/http/HttpServletRequest;


# direct methods
.method public constructor <init>(Ll/gse0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kse0;-><init>(Ll/gse0;)V

    .line 2
    .line 3
    .line 4
    return-void
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

    const/4 p0, 0x0

    return p0
.end method

.method public getAuthType()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getContextPath()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getCookies()[Ljavax/servlet/http/Cookie;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDateHeader(Ljava/lang/String;)J
    .locals 0

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getHeaderNames()Ljava/util/Enumeration;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getIntHeader(Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

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
    const/4 p0, 0x0

    .line 2
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

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPathInfo()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPathTranslated()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getQueryString()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRemoteUser()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRequestURI()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRequestURL()Ljava/lang/StringBuffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRequestedSessionId()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getServletPath()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getSession()Ll/hnl;
    .locals 0

    .line 3
    const/4 p0, 0x0

    return-object p0
.end method

.method public getSession(Z)Ll/hnl;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getUserPrincipal()Ljava/security/Principal;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public isRequestedSessionIdFromCookie()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isRequestedSessionIdFromURL()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isRequestedSessionIdFromUrl()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isRequestedSessionIdValid()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isUserInRole(Ljava/lang/String;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    return-void
.end method

.method public logout()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    return-void
.end method
