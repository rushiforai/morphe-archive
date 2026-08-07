.class public Ll/kse0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gse0;


# instance fields
.field private request:Ll/gse0;


# direct methods
.method public constructor <init>(Ll/gse0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/kse0;->request:Ll/gse0;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Request cannot be null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    throw p0
.end method


# virtual methods
.method public getAsyncContext()Ll/o21;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getAsyncContext()Ll/o21;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAttributeNames()Ljava/util/Enumeration;
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
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getAttributeNames()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCharacterEncoding()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getCharacterEncoding()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContentLength()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getContentLength()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getContentType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDispatcherType()Ljavax/servlet/DispatcherType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getDispatcherType()Ljavax/servlet/DispatcherType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInputStream()Ll/dse0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getInputStream()Ll/dse0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getLocalAddr()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getLocalName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalPort()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getLocalPort()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getLocale()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocales()Ljava/util/Enumeration;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getLocales()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getParameterMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getParameterMap()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getParameterNames()Ljava/util/Enumeration;
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
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getParameterNames()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getParameterValues(Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getParameterValues(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getProtocol()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getReader()Ljava/io/BufferedReader;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getReader()Ljava/io/BufferedReader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRealPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getRealPath(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRemoteAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getRemoteAddr()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getRemoteHost()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRemotePort()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getRemotePort()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRequest()Ll/gse0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestDispatcher(Ljava/lang/String;)Ll/c2d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getRequestDispatcher(Ljava/lang/String;)Ll/c2d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getScheme()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServerName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getServerName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServerPort()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getServerPort()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getServletContext()Ll/ase0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->getServletContext()Ll/ase0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isAsyncStarted()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->isAsyncStarted()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isAsyncSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->isAsyncSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isSecure()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->isSecure()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isWrapperFor(Ljava/lang/Class;)Z
    .locals 3

    .line 1
    const-class v0, Ll/gse0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Ll/kse0;->request:Ll/gse0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 25
    .line 26
    instance-of v0, p0, Ll/kse0;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    check-cast p0, Ll/kse0;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/kse0;->isWrapperFor(Ljava/lang/Class;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_1
    return v2

    .line 38
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, " not a subinterface of "

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "Given class "

    .line 49
    .line 50
    invoke-static {v1, p0, p1, v0}, Ll/jse0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return v2
.end method

.method public isWrapperFor(Ll/gse0;)Z
    .locals 1

    .line 54
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 55
    :cond_0
    instance-of v0, p0, Ll/kse0;

    if-eqz v0, :cond_1

    .line 56
    check-cast p0, Ll/kse0;

    invoke-virtual {p0, p1}, Ll/kse0;->isWrapperFor(Ll/gse0;)Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->removeAttribute(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCharacterEncoding(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->setCharacterEncoding(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRequest(Ll/gse0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/kse0;->request:Ll/gse0;

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Request cannot be null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public startAsync()Ll/o21;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->startAsync()Ll/o21;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public startAsync(Ll/gse0;Ll/lse0;)Ll/o21;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 8
    iget-object p0, p0, Ll/kse0;->request:Ll/gse0;

    invoke-interface {p0, p1, p2}, Ll/gse0;->startAsync(Ll/gse0;Ll/lse0;)Ll/o21;

    move-result-object p0

    return-object p0
.end method
