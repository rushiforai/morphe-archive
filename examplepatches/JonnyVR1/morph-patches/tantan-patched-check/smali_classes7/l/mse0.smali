.class public Ll/mse0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lse0;


# instance fields
.field private response:Ll/lse0;


# direct methods
.method public constructor <init>(Ll/lse0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/mse0;->response:Ll/lse0;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Response cannot be null"

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
.method public flushBuffer()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->flushBuffer()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getBufferSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->getBufferSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCharacterEncoding()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->getCharacterEncoding()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->getContentType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->getLocale()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOutputStream()Ll/ese0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getResponse()Ll/lse0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWriter()Ljava/io/PrintWriter;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public isCommitted()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->isCommitted()Z

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
    const-class v0, Ll/lse0;

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
    iget-object v0, p0, Ll/mse0;->response:Ll/lse0;

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
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 25
    .line 26
    instance-of v0, p0, Ll/mse0;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    check-cast p0, Ll/mse0;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/mse0;->isWrapperFor(Ljava/lang/Class;)Z

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

.method public isWrapperFor(Ll/lse0;)Z
    .locals 1

    .line 54
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 55
    :cond_0
    instance-of v0, p0, Ll/mse0;

    if-eqz v0, :cond_1

    .line 56
    check-cast p0, Ll/mse0;

    invoke-virtual {p0, p1}, Ll/mse0;->isWrapperFor(Ll/lse0;)Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public reset()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->reset()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public resetBuffer()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/lse0;->resetBuffer()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBufferSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/lse0;->setBufferSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCharacterEncoding(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/lse0;->setCharacterEncoding(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setContentLength(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/lse0;->setContentLength(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mse0;->response:Ll/lse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/lse0;->setLocale(Ljava/util/Locale;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setResponse(Ll/lse0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/mse0;->response:Ll/lse0;

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "Response cannot be null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
