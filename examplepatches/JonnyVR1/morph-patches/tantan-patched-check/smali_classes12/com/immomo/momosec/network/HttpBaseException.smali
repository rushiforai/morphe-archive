.class public Lcom/immomo/momosec/network/HttpBaseException;
.super Ljava/lang/Exception;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momosec/network/HttpBaseException$a;,
        Lcom/immomo/momosec/network/HttpBaseException$ErrorType;
    }
.end annotation


# static fields
.field private static final DEFAULT_VALUE:Ljava/lang/String;

.field private static final MESSAGE_FORMAT:Ljava/lang/String;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final errorType:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

.field private final rawResponse:Ljava/lang/String;

.field private final requestParams:Ljava/lang/String;

.field private final retryCount:I

.field private final sdkVersion:Ljava/lang/String;

.field private final statusCode:I

.field private final totalTime:J

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x3

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/immomo/momosec/network/HttpBaseException;->DEFAULT_VALUE:Ljava/lang/String;

    const/16 v0, 0x95

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/immomo/momosec/network/HttpBaseException;->MESSAGE_FORMAT:Ljava/lang/String;

    return-void

    :array_0
    .array-data 1
        0x7et
        0x49t
        0x70t
    .end array-data

    :array_1
    .array-data 1
        0x78t
        0x32t
        0x65t
        0x67t
        0x41t
        0x34t
        0x55t
        0x17t
        0x44t
        0x52t
        0x12t
        0x12t
        0x10t
        0x20t
        0x50t
        0x5et
        0xdt
        0x3t
        0x54t
        0x5ct
        0x3bt
        0x72t
        0x13t
        0x14t
        0x5ft
        0x14t
        0x11t
        0x63t
        0x18t
        0x16t
        0x55t
        0x5ct
        0x11t
        0x12t
        0x12t
        0x6ct
        0x7dt
        0x3t
        0x42t
        0x44t
        0x0t
        0x1t
        0x55t
        0x5ct
        0x11t
        0x12t
        0x12t
        0x6ct
        0x65t
        0x34t
        0x7dt
        0xdt
        0x41t
        0x43t
        0x43t
        0x6ct
        0x61t
        0x56t
        0x13t
        0x7t
        0x5dt
        0x15t
        0xbt
        0x17t
        0x44t
        0x15t
        0x3at
        0x35t
        0x45t
        0x56t
        0x15t
        0x13t
        0x43t
        0x46t
        0x72t
        0x58t
        0x5t
        0x3t
        0xat
        0x46t
        0x14t
        0x53t
        0x6bt
        0x34t
        0x55t
        0x12t
        0x43t
        0x4et
        0x41t
        0x25t
        0x5ft
        0x13t
        0x5ft
        0x43t
        0x5bt
        0x46t
        0x15t
        0x2t
        0x3bt
        0x63t
        0xet
        0x12t
        0x51t
        0xat
        0x11t
        0x63t
        0x8t
        0xbt
        0x55t
        0x5ct
        0x11t
        0x12t
        0x4ft
        0x54t
        0x56t
        0x15t
        0x3bt
        0x65t
        0x0t
        0x11t
        0x10t
        0x34t
        0x54t
        0x44t
        0x11t
        0x9t
        0x5et
        0x15t
        0x54t
        0xdt
        0x41t
        0x43t
        0x43t
        0x6ct
        0x62t
        0x73t
        0x2at
        0x46t
        0x66t
        0x3t
        0x43t
        0x44t
        0x8t
        0x9t
        0x5et
        0x5ct
        0x11t
        0x12t
        0x12t
    .end array-data
.end method

.method public constructor <init>(Lcom/immomo/momosec/network/HttpBaseException$a;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->a(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->b(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->c(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->url:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->d(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->requestParams:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->e(Lcom/immomo/momosec/network/HttpBaseException$a;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->statusCode:I

    .line 29
    .line 30
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->f(Lcom/immomo/momosec/network/HttpBaseException$a;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->retryCount:I

    .line 35
    .line 36
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->g(Lcom/immomo/momosec/network/HttpBaseException$a;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    iput-wide v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->totalTime:J

    .line 41
    .line 42
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->h(Lcom/immomo/momosec/network/HttpBaseException$a;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->rawResponse:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Ll/eiw;->b()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->sdkVersion:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/immomo/momosec/network/HttpBaseException$a;->i(Lcom/immomo/momosec/network/HttpBaseException$a;)Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/immomo/momosec/network/HttpBaseException;->errorType:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 59
    .line 60
    return-void
.end method

.method private static buildFullMessage(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    :goto_0
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/16 p0, 0xe

    .line 12
    .line 13
    new-array p0, p0, [B

    .line 14
    .line 15
    fill-array-data p0, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    new-array p0, p0, [B

    .line 38
    .line 39
    fill-array-data p0, :array_1

    .line 40
    .line 41
    .line 42
    invoke-static {p0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    nop

    .line 67
    :array_0
    .array-data 1
        0x10t
        0x1at
        0x11t
        0x74t
        0x0t
        0x13t
        0x43t
        0x3t
        0x55t
        0x17t
        0x3t
        0x1ft
        0xat
        0x46t
    .end array-data

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    nop

    .line 79
    :array_1
    .array-data 1
        0xat
        0x46t
    .end array-data
.end method


# virtual methods
.method public getErrorType()Lcom/immomo/momosec/network/HttpBaseException$ErrorType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->errorType:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFormattedTotalTime()Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    new-array v1, v1, [B

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-wide v2, p0, Lcom/immomo/momosec/network/HttpBaseException;->totalTime:J

    .line 14
    .line 15
    long-to-double v2, v2

    .line 16
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-double/2addr v2, v4

    .line 22
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :array_0
    .array-data 1
        0x15t
        0x48t
        0x3t
        0x51t
        0x12t
    .end array-data
.end method

.method public getMessage()Ljava/lang/String;
    .locals 13

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momosec/network/HttpBaseException;->MESSAGE_FORMAT:Ljava/lang/String;

    .line 4
    .line 5
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-static {v2, v3}, Lcom/immomo/momosec/network/HttpBaseException;->buildFullMessage(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    iget-object v6, p0, Lcom/immomo/momosec/network/HttpBaseException;->url:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v7, p0, Lcom/immomo/momosec/network/HttpBaseException;->requestParams:Ljava/lang/String;

    .line 24
    .line 25
    iget v2, p0, Lcom/immomo/momosec/network/HttpBaseException;->statusCode:I

    .line 26
    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    iget v2, p0, Lcom/immomo/momosec/network/HttpBaseException;->retryCount:I

    .line 32
    .line 33
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v9

    .line 37
    iget-wide v2, p0, Lcom/immomo/momosec/network/HttpBaseException;->totalTime:J

    .line 38
    .line 39
    long-to-double v2, v2

    .line 40
    const-wide v10, 0x408f400000000000L    # 1000.0

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    div-double/2addr v2, v10

    .line 46
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 47
    .line 48
    .line 49
    move-result-object v10

    .line 50
    iget-object v11, p0, Lcom/immomo/momosec/network/HttpBaseException;->rawResponse:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v12, p0, Lcom/immomo/momosec/network/HttpBaseException;->sdkVersion:Ljava/lang/String;

    .line 53
    .line 54
    filled-new-array/range {v4 .. v12}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public getRawResponse()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->rawResponse:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestParams()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->requestParams:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRetryCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->retryCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->sdkVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShortMessage()Ljava/lang/String;
    .locals 10

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    const/16 v1, 0x32

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/immomo/momosec/network/HttpBaseException;->sdkVersion:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/immomo/momosec/network/HttpBaseException;->errorType:Lcom/immomo/momosec/network/HttpBaseException$ErrorType;

    .line 17
    .line 18
    invoke-virtual {v3}, Lcom/immomo/momosec/network/HttpBaseException$ErrorType;->getDescription()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget v5, p0, Lcom/immomo/momosec/network/HttpBaseException;->statusCode:I

    .line 27
    .line 28
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    iget-wide v6, p0, Lcom/immomo/momosec/network/HttpBaseException;->totalTime:J

    .line 33
    .line 34
    long-to-double v6, v6

    .line 35
    const-wide v8, 0x408f400000000000L    # 1000.0

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    div-double/2addr v6, v8

    .line 41
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    iget p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->retryCount:I

    .line 46
    .line 47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    filled-new-array/range {v2 .. v7}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    nop

    .line 61
    :array_0
    .array-data 1
        0x6bt
        0x43t
        0x42t
        0x6at
        0x3at
        0x43t
        0x43t
        0x3bt
        0x11t
        0x12t
        0x12t
        0x46t
        0x18t
        0x35t
        0x45t
        0x56t
        0x15t
        0x13t
        0x43t
        0x5ct
        0x11t
        0x12t
        0x5t
        0x4at
        0x10t
        0x32t
        0x58t
        0x5at
        0x4t
        0x5ct
        0x10t
        0x43t
        0x1ft
        0x5t
        0x7t
        0x15t
        0x1ct
        0x46t
        0x63t
        0x52t
        0x15t
        0x14t
        0x59t
        0x3t
        0x42t
        0xdt
        0x41t
        0x43t
        0x54t
        0x4ft
    .end array-data
.end method

.method public getStatusCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->statusCode:I

    .line 2
    .line 3
    return p0
.end method

.method public getTotalTimeMillis()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->totalTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTotalTimeSeconds()D
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/momosec/network/HttpBaseException;->totalTime:J

    .line 2
    .line 3
    long-to-double v0, v0

    .line 4
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    div-double/2addr v0, v2

    .line 10
    return-wide v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momosec/network/HttpBaseException;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
