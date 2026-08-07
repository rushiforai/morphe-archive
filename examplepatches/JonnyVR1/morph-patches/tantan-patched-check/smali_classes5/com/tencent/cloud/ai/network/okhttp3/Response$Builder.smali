.class public Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field public body:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

.field public cacheResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

.field public code:I

.field public exchange:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

.field public handshake:Lcom/tencent/cloud/ai/network/okhttp3/n;

.field public headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

.field public message:Ljava/lang/String;

.field public networkResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

.field public priorResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

.field public protocol:Lcom/tencent/cloud/ai/network/okhttp3/q;

.field public receivedResponseAtMillis:J

.field public request:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public sentRequestAtMillis:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 65
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    .line 66
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    .line 6
    .line 7
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->b:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 14
    .line 15
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->c:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->d:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->e:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->handshake:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->f:Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a()Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 34
    .line 35
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->g:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 38
    .line 39
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->h:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->networkResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 42
    .line 43
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->i:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->cacheResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->j:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->priorResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 50
    .line 51
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->k:J

    .line 52
    .line 53
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis:J

    .line 54
    .line 55
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->l:J

    .line 56
    .line 57
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    .line 58
    .line 59
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->m:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->exchange:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 62
    .line 63
    return-void
.end method

.method private checkPriorResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/Response;->g:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "priorResponse.body != null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private checkSupportResponse(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    .locals 0

    .line 1
    iget-object p0, p2, Lcom/tencent/cloud/ai/network/okhttp3/Response;->g:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 2
    .line 3
    if-nez p0, :cond_3

    .line 4
    .line 5
    iget-object p0, p2, Lcom/tencent/cloud/ai/network/okhttp3/Response;->h:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 6
    .line 7
    if-nez p0, :cond_2

    .line 8
    .line 9
    iget-object p0, p2, Lcom/tencent/cloud/ai/network/okhttp3/Response;->i:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p2, Lcom/tencent/cloud/ai/network/okhttp3/Response;->j:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, ".priorResponse != null"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-string p0, ".cacheResponse != null"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    const-string p0, ".networkResponse != null"

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_3
    const-string p0, ".body != null"

    .line 37
    .line 38
    invoke-static {p1, p0}, Ll/ulk0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    .line 10
    .line 11
    if-ltz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    const-string p0, "message == null"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const/4 p0, 0x0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string v0, "code < 0: "

    .line 31
    .line 32
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    .line 33
    .line 34
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string p0, "protocol == null"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    const-string p0, "request == null"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0
.end method

.method public cacheResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "cacheResponse"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->checkSupportResponse(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->cacheResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 9
    .line 10
    return-object p0
.end method

.method public code(I)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code:I

    .line 2
    .line 3
    return-object p0
.end method

.method public handshake(Lcom/tencent/cloud/ai/network/okhttp3/n;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->handshake:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public headers(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a()Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 6
    .line 7
    return-object p0
.end method

.method public initExchange(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->exchange:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    return-void
.end method

.method public message(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public networkResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "networkResponse"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->checkSupportResponse(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->networkResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 9
    .line 10
    return-object p0
.end method

.method public priorResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->checkPriorResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->priorResponse:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 7
    .line 8
    return-object p0
.end method

.method public protocol(Lcom/tencent/cloud/ai/network/okhttp3/q;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 2
    .line 3
    return-object p0
.end method

.method public receivedResponseAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    .line 2
    .line 3
    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers:Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public request(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    return-object p0
.end method

.method public sentRequestAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis:J

    .line 2
    .line 3
    return-object p0
.end method
