.class public Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;
.super Lorg/fourthline/cling/transport/spi/AbstractStreamClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/fourthline/cling/transport/spi/AbstractStreamClient<",
        "Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;",
        "Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;",
        ">;"
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field protected final client:Lorg/eclipse/jetty/client/HttpClient;

.field protected final configuration:Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/transport/spi/StreamClient;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/transport/spi/InitializationException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/fourthline/cling/transport/spi/AbstractStreamClient;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->configuration:Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;

    .line 5
    .line 6
    sget-object v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->log:Ljava/util/logging/Logger;

    .line 7
    .line 8
    const-string v1, "Starting Jetty HttpClient..."

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lorg/eclipse/jetty/client/HttpClient;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/eclipse/jetty/client/HttpClient;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->client:Lorg/eclipse/jetty/client/HttpClient;

    .line 19
    .line 20
    new-instance v1, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$1;

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->getConfiguration()Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->getRequestExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-direct {v1, p0, v2}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$1;-><init>(Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;Ljava/util/concurrent/ExecutorService;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpClient;->setThreadPool(Lorg/eclipse/jetty/util/thread/ThreadPool;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->getTimeoutSeconds()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/lit8 p0, p0, 0x5

    .line 41
    .line 42
    mul-int/lit16 p0, p0, 0x3e8

    .line 43
    .line 44
    int-to-long v1, p0

    .line 45
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/client/HttpClient;->setTimeout(J)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;->getTimeoutSeconds()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    add-int/lit8 p0, p0, 0x5

    .line 53
    .line 54
    mul-int/lit16 p0, p0, 0x3e8

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/client/HttpClient;->setConnectTimeout(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;->getRequestRetryCount()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/client/HttpClient;->setMaxRetries(I)V

    .line 64
    .line 65
    .line 66
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_0
    move-exception p0

    .line 71
    new-instance p1, Lorg/fourthline/cling/transport/spi/InitializationException;

    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v1, "Could not start Jetty HTTP client: "

    .line 76
    .line 77
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-direct {p1, v0, p0}, Lorg/fourthline/cling/transport/spi/InitializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    throw p1
.end method

.method public static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public bridge synthetic abort(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->abort(Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abort(Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)V
    .locals 0

    .line 7
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpExchange;->cancel()V

    return-void
.end method

.method public bridge synthetic createCallable(Lorg/fourthline/cling/model/message/StreamRequestMessage;Ljava/lang/Object;)Ljava/util/concurrent/Callable;
    .locals 0

    .line 1
    check-cast p2, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->createCallable(Lorg/fourthline/cling/model/message/StreamRequestMessage;Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)Ljava/util/concurrent/Callable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public createCallable(Lorg/fourthline/cling/model/message/StreamRequestMessage;Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)Ljava/util/concurrent/Callable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/message/StreamRequestMessage;",
            "Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;",
            ")",
            "Ljava/util/concurrent/Callable<",
            "Lorg/fourthline/cling/model/message/StreamResponseMessage;",
            ">;"
        }
    .end annotation

    .line 8
    new-instance v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;

    invoke-direct {v0, p0, p1, p2}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;-><init>(Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;Lorg/fourthline/cling/model/message/StreamRequestMessage;Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)V

    return-object v0
.end method

.method public bridge synthetic createRequest(Lorg/fourthline/cling/model/message/StreamRequestMessage;)Ljava/lang/Object;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->createRequest(Lorg/fourthline/cling/model/message/StreamRequestMessage;)Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    move-result-object p0

    return-object p0
.end method

.method public createRequest(Lorg/fourthline/cling/model/message/StreamRequestMessage;)Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->getConfiguration()Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->client:Lorg/eclipse/jetty/client/HttpClient;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0, p1}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;-><init>(Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;Lorg/eclipse/jetty/client/HttpClient;Lorg/fourthline/cling/model/message/StreamRequestMessage;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public getConfiguration()Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;
    .locals 0

    .line 6
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->configuration:Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;

    return-object p0
.end method

.method public bridge synthetic getConfiguration()Lorg/fourthline/cling/transport/spi/StreamClientConfiguration;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->getConfiguration()Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public logExecutionException(Ljava/lang/Throwable;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public stop()V
    .locals 3

    .line 1
    :try_start_0
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->client:Lorg/eclipse/jetty/client/HttpClient;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    sget-object v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->log:Ljava/util/logging/Logger;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "Error stopping HTTP client: "

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
