.class public Ll/uai0;
.super Lcom/p1/mobile/account_core/network/DefaultCall;
.source "SourceFile"


# instance fields
.field public final a:[I

.field public b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/network/DefaultCall;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x17

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/uai0;->a:[I

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/uai0;->b:Ljava/util/Set;

    .line 19
    .line 20
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->getNormalHttp()Ll/rg50;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->okHttpClient:Ll/rg50;

    .line 27
    .line 28
    new-instance v0, Ll/rai0;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/rai0;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->errorHandler:Ll/qcj;

    .line 34
    .line 35
    new-instance v0, Ll/sai0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/sai0;-><init>(Ll/uai0;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/account_core/network/DefaultCall;->apiCallBack:Ll/pcj;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    :goto_0
    iget-object v1, p0, Ll/uai0;->a:[I

    .line 44
    .line 45
    array-length v2, v1

    .line 46
    if-ge v0, v2, :cond_0

    .line 47
    .line 48
    iget-object v2, p0, Ll/uai0;->b:Ljava/util/Set;

    .line 49
    .line 50
    aget v1, v1, v0

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void

    .line 63
    :array_0
    .array-data 4
        0x9c40
        0x9c48
        0x9c54
        0x9c9b
        0x9c55
        0x9c4f
        0x9c56
        0x9c4b
        0x9c65
        0x9c61
        0x9c50
        0x9c4c
        0x9c4e
        0x9c5a
        0x9c7f
        0x9c9a
        0x9c43
        0x9c5c
        0x9c47
        0x9c49
        0x9c4a
        0x9c4d
        0x9c9f
    .end array-data
.end method

.method public static synthetic d(Ll/uai0;)Lcom/p1/mobile/account_core/network/ApiCallBack;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uai0;->j()Lcom/p1/mobile/account_core/network/ApiCallBack;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/uai0;Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uai0;->h(Ljava/lang/Throwable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic f(Ll/uai0;Ll/k5d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uai0;->k(Ll/k5d0;)V

    return-void
.end method


# virtual methods
.method public execute(Ll/x1d0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/account_core/network/DefaultCall;->execute(Ll/x1d0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/tai0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/tai0;-><init>(Ll/uai0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public executeWithTimeout(Ll/x1d0;J)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            "J)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/account_core/network/DefaultCall;->executeWithTimeout(Ll/x1d0;J)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/tai0;

    .line 6
    .line 7
    invoke-direct {p2, p0}, Ll/tai0;-><init>(Ll/uai0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final g(I)I
    .locals 1

    .line 1
    const p0, 0x61adf

    .line 2
    .line 3
    .line 4
    if-ge p1, p0, :cond_0

    .line 5
    .line 6
    div-int/lit16 p0, p1, 0x3e8

    .line 7
    .line 8
    mul-int/lit8 p0, p0, 0x64

    .line 9
    .line 10
    const v0, 0x186a0

    .line 11
    .line 12
    .line 13
    rem-int/2addr p1, v0

    .line 14
    add-int/2addr p0, p1

    .line 15
    return p0

    .line 16
    :cond_0
    const p0, 0x61af7

    .line 17
    .line 18
    .line 19
    if-ne p1, p0, :cond_1

    .line 20
    .line 21
    const p0, 0x9c9f

    .line 22
    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    return p1
.end method

.method public final h(Ljava/lang/Throwable;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/account_core/exception/AccountException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/account_core/exception/AccountException;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/uai0;->i(Lcom/p1/mobile/account_core/exception/AccountException;)Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {p1}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final i(Lcom/p1/mobile/account_core/exception/AccountException;)Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/account_core/exception/AccountException;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/account_core/reponse_data/Meta;->code:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/uai0;->g(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Ll/uai0;->b:Ljava/util/Set;

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {p0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/account_core/exception/AccountException;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Meta;->message:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 32
    .line 33
    iget v0, p1, Lcom/p1/mobile/account_core/reponse_data/Meta;->code:I

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/account_core/reponse_data/Meta;->message:Ljava/lang/String;

    .line 36
    .line 37
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method public interceptRequest(Ll/x1d0;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->auth(Ll/x1d0$a;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/ike;->i()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp(Ll/x1d0$a;)Ll/x1d0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->basic(Ll/x1d0$a;)Ll/x1d0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :goto_0
    const-string p1, "X-Putong-One-Id"

    .line 52
    .line 53
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public final synthetic j()Lcom/p1/mobile/account_core/network/ApiCallBack;
    .locals 1

    .line 1
    new-instance v0, Ll/uai0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uai0$a;-><init>(Ll/uai0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final k(Ll/k5d0;)V
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ll/k5d0;->source()Lokio/BufferedSource;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-wide v1, 0x7fffffffffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1, v2}, Lokio/BufferedSource;->request(J)Z

    .line 12
    .line 13
    .line 14
    invoke-interface {v0}, Lokio/BufferedSource;->buffer()Lokio/Buffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lokio/Buffer;->clone()Lokio/Buffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1}, Ll/k5d0;->contentType()Ll/e7y;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1}, Ll/k5d0;->contentLength()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-static {v1, v2, v3, v0}, Ll/k5d0;->create(Ll/e7y;JLokio/BufferedSource;)Ll/k5d0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Ll/v3l0;->e()Ll/v3l0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ll/v3l0;->c(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ll/esf0;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception p1

    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
