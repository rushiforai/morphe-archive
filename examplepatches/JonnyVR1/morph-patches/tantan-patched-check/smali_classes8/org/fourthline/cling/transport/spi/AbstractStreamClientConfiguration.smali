.class public abstract Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/transport/spi/StreamClientConfiguration;


# instance fields
.field protected logWarningSeconds:I

.field protected requestExecutorService:Ljava/util/concurrent/ExecutorService;

.field protected timeoutSeconds:I


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3c

    .line 5
    .line 6
    iput v0, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->timeoutSeconds:I

    .line 7
    .line 8
    const/4 v0, 0x5

    .line 9
    iput v0, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->logWarningSeconds:I

    .line 10
    .line 11
    iput-object p1, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->requestExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;I)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 15
    iput v0, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->logWarningSeconds:I

    .line 16
    iput-object p1, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->requestExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 17
    iput p2, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->timeoutSeconds:I

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;II)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->requestExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 20
    iput p2, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->timeoutSeconds:I

    .line 21
    iput p3, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->logWarningSeconds:I

    return-void
.end method


# virtual methods
.method public getLogWarningSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->logWarningSeconds:I

    .line 2
    .line 3
    return p0
.end method

.method public getRequestExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->requestExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeoutSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->timeoutSeconds:I

    .line 2
    .line 3
    return p0
.end method

.method public getUserAgentValue(II)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/model/ServerClientTokens;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/model/ServerClientTokens;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/fourthline/cling/model/ServerClientTokens;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public setLogWarningSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->logWarningSeconds:I

    .line 2
    .line 3
    return-void
.end method

.method public setRequestExecutorService(Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->requestExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeoutSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->timeoutSeconds:I

    .line 2
    .line 3
    return-void
.end method
