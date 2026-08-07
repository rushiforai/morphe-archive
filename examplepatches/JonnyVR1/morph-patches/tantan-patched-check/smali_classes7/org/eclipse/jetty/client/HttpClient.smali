.class public Lorg/eclipse/jetty/client/HttpClient;
.super Lorg/eclipse/jetty/util/component/AggregateLifeCycle;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/http/HttpBuffers;
.implements Lorg/eclipse/jetty/util/Attributes;
.implements Lorg/eclipse/jetty/util/component/Dumpable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/client/HttpClient$LocalQueuedThreadPool;,
        Lorg/eclipse/jetty/client/HttpClient$Connector;
    }
.end annotation


# static fields
.field public static final CONNECTOR_SELECT_CHANNEL:I = 0x2

.field public static final CONNECTOR_SOCKET:I


# instance fields
.field private _attributes:Lorg/eclipse/jetty/util/AttributesMap;

.field private final _buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

.field private _connectBlocking:Z

.field private _connectTimeout:I

.field _connector:Lorg/eclipse/jetty/client/HttpClient$Connector;

.field private _connectorType:I

.field private _destinations:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Lorg/eclipse/jetty/client/Address;",
            "Lorg/eclipse/jetty/client/HttpDestination;",
            ">;"
        }
    .end annotation
.end field

.field private _idleTimeout:J

.field private _idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

.field private _maxConnectionsPerAddress:I

.field private _maxQueueSizePerAddress:I

.field private _maxRedirects:I

.field private _maxRetries:I

.field private _noProxy:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _proxy:Lorg/eclipse/jetty/client/Address;

.field private _proxyAuthentication:Lorg/eclipse/jetty/client/security/Authentication;

.field private _realmResolver:Lorg/eclipse/jetty/client/security/RealmResolver;

.field private _registeredListeners:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

.field _threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

.field private _timeout:J

.field private _timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

.field private _useDirectBuffers:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 84
    new-instance v0, Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    invoke-direct {v0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;-><init>()V

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/client/HttpClient;-><init>(Lorg/eclipse/jetty/util/ssl/SslContextFactory;)V

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/util/ssl/SslContextFactory;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectorType:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_useDirectBuffers:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectBlocking:Z

    .line 11
    .line 12
    const v0, 0x7fffffff

    .line 13
    .line 14
    .line 15
    iput v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxConnectionsPerAddress:I

    .line 16
    .line 17
    iput v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxQueueSizePerAddress:I

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_destinations:Ljava/util/concurrent/ConcurrentMap;

    .line 25
    .line 26
    const-wide/16 v0, 0x4e20

    .line 27
    .line 28
    iput-wide v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeout:J

    .line 29
    .line 30
    const-wide/32 v0, 0x4e200

    .line 31
    .line 32
    .line 33
    iput-wide v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeout:J

    .line 34
    .line 35
    const v0, 0x124f8

    .line 36
    .line 37
    .line 38
    iput v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectTimeout:I

    .line 39
    .line 40
    new-instance v0, Lorg/eclipse/jetty/util/thread/Timeout;

    .line 41
    .line 42
    invoke-direct {v0}, Lorg/eclipse/jetty/util/thread/Timeout;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 46
    .line 47
    new-instance v0, Lorg/eclipse/jetty/util/thread/Timeout;

    .line 48
    .line 49
    invoke-direct {v0}, Lorg/eclipse/jetty/util/thread/Timeout;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 53
    .line 54
    const/4 v0, 0x3

    .line 55
    iput v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxRetries:I

    .line 56
    .line 57
    const/16 v0, 0x14

    .line 58
    .line 59
    iput v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxRedirects:I

    .line 60
    .line 61
    new-instance v0, Lorg/eclipse/jetty/util/AttributesMap;

    .line 62
    .line 63
    invoke-direct {v0}, Lorg/eclipse/jetty/util/AttributesMap;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_attributes:Lorg/eclipse/jetty/util/AttributesMap;

    .line 67
    .line 68
    new-instance v0, Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 69
    .line 70
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 74
    .line 75
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/client/HttpClient;)Lorg/eclipse/jetty/util/thread/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lorg/eclipse/jetty/client/HttpClient;)Lorg/eclipse/jetty/util/thread/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 2
    .line 3
    return-object p0
.end method

.method private setBufferTypes()V
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectorType:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lorg/eclipse/jetty/io/Buffers$Type;->BYTE_ARRAY:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object v0, Lorg/eclipse/jetty/io/Buffers$Type;->DIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 34
    .line 35
    iget-boolean v2, p0, Lorg/eclipse/jetty/client/HttpClient;->_useDirectBuffers:Z

    .line 36
    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    move-object v2, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget-object v2, Lorg/eclipse/jetty/io/Buffers$Type;->INDIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 52
    .line 53
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_useDirectBuffers:Z

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    sget-object v0, Lorg/eclipse/jetty/io/Buffers$Type;->INDIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 59
    .line 60
    :goto_1
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public cancel(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/thread/Timeout$Task;->cancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public clearAttributes()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_attributes:Lorg/eclipse/jetty/util/AttributesMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/AttributesMap;->clearAttributes()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public doStart()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpClient;->setBufferTypes()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 5
    .line 6
    iget-wide v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeout:J

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/util/thread/Timeout;->setDuration(J)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 12
    .line 13
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/thread/Timeout;->setNow()J

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 17
    .line 18
    iget-wide v1, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeout:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/util/thread/Timeout;->setDuration(J)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 24
    .line 25
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/thread/Timeout;->setNow()J

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Lorg/eclipse/jetty/client/HttpClient$LocalQueuedThreadPool;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-direct {v0, v2}, Lorg/eclipse/jetty/client/HttpClient$LocalQueuedThreadPool;-><init>(Lorg/eclipse/jetty/client/HttpClient$1;)V

    .line 37
    .line 38
    .line 39
    const/16 v2, 0x10

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->setMaxThreads(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->setDaemon(Z)V

    .line 45
    .line 46
    .line 47
    const-string v2, "HttpClient"

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;->setName(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 55
    .line 56
    .line 57
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectorType:I

    .line 58
    .line 59
    const/4 v2, 0x2

    .line 60
    if-ne v0, v2, :cond_1

    .line 61
    .line 62
    new-instance v0, Lorg/eclipse/jetty/client/SelectConnector;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/client/SelectConnector;-><init>(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    new-instance v0, Lorg/eclipse/jetty/client/SocketConnector;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/client/SocketConnector;-><init>(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connector:Lorg/eclipse/jetty/client/HttpClient$Connector;

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 76
    .line 77
    .line 78
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->doStart()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 82
    .line 83
    new-instance v1, Lorg/eclipse/jetty/client/HttpClient$1;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Lorg/eclipse/jetty/client/HttpClient$1;-><init>(Lorg/eclipse/jetty/client/HttpClient;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/util/thread/ThreadPool;->dispatch(Ljava/lang/Runnable;)Z

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public doStop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_destinations:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lorg/eclipse/jetty/client/HttpDestination;

    .line 22
    .line 23
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpDestination;->close()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 28
    .line 29
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/thread/Timeout;->cancelAll()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 33
    .line 34
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/thread/Timeout;->cancelAll()V

    .line 35
    .line 36
    .line 37
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->doStop()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 41
    .line 42
    instance-of v1, v0, Lorg/eclipse/jetty/client/HttpClient$LocalQueuedThreadPool;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->removeBean(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connector:Lorg/eclipse/jetty/client/HttpClient$Connector;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->removeBean(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_attributes:Lorg/eclipse/jetty/util/AttributesMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/AttributesMap;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAttributeNames()Ljava/util/Enumeration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_attributes:Lorg/eclipse/jetty/util/AttributesMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/AttributesMap;->getAttributeNames()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getConnectTimeout()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public getConnectorType()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectorType:I

    .line 2
    .line 3
    return p0
.end method

.method public getDestination(Lorg/eclipse/jetty/client/Address;Z)Lorg/eclipse/jetty/client/HttpDestination;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_destinations:Ljava/util/concurrent/ConcurrentMap;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lorg/eclipse/jetty/client/HttpDestination;

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    new-instance v0, Lorg/eclipse/jetty/client/HttpDestination;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jetty/client/HttpDestination;-><init>(Lorg/eclipse/jetty/client/HttpClient;Lorg/eclipse/jetty/client/Address;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxy:Lorg/eclipse/jetty/client/Address;

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    iget-object p2, p0, Lorg/eclipse/jetty/client/HttpClient;->_noProxy:Ljava/util/Set;

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/Address;->getHost()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {p2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    :cond_0
    iget-object p2, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxy:Lorg/eclipse/jetty/client/Address;

    .line 37
    .line 38
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/client/HttpDestination;->setProxy(Lorg/eclipse/jetty/client/Address;)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxyAuthentication:Lorg/eclipse/jetty/client/security/Authentication;

    .line 42
    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/client/HttpDestination;->setProxyAuthentication(Lorg/eclipse/jetty/client/security/Authentication;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_destinations:Ljava/util/concurrent/ConcurrentMap;

    .line 49
    .line 50
    invoke-interface {p0, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lorg/eclipse/jetty/client/HttpDestination;

    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_2
    return-object v0

    .line 60
    :cond_3
    new-instance p0, Ljava/net/UnknownHostException;

    .line 61
    .line 62
    const-string p1, "Remote socket address cannot be null."

    .line 63
    .line 64
    invoke-direct {p0, p1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p0
.end method

.method public getIdleTimeout()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeout:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getKeyManagerAlgorithm()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getSslKeyManagerFactoryAlgorithm()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getKeyStoreInputStream()Ljava/io/InputStream;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getKeyStoreInputStream()Ljava/io/InputStream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getKeyStoreLocation()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getKeyStorePath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getKeyStoreType()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getKeyStoreType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMaxBuffers()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getMaxBuffers()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMaxConnectionsPerAddress()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxConnectionsPerAddress:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxQueueSizePerAddress()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxQueueSizePerAddress:I

    .line 2
    .line 3
    return p0
.end method

.method public getNoProxy()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_noProxy:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getProtocol()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getProvider()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getProvider()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getProxy()Lorg/eclipse/jetty/client/Address;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxy:Lorg/eclipse/jetty/client/Address;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProxyAuthentication()Lorg/eclipse/jetty/client/security/Authentication;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxyAuthentication:Lorg/eclipse/jetty/client/security/Authentication;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRealmResolver()Lorg/eclipse/jetty/client/security/RealmResolver;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_realmResolver:Lorg/eclipse/jetty/client/security/RealmResolver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegisteredListeners()Ljava/util/LinkedList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_registeredListeners:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestBufferSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getRequestBufferSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRequestBufferType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getRequestBufferType()Lorg/eclipse/jetty/io/Buffers$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRequestBuffers()Lorg/eclipse/jetty/io/Buffers;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getRequestBuffers()Lorg/eclipse/jetty/io/Buffers;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRequestHeaderSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getRequestHeaderSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRequestHeaderType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getRequestHeaderType()Lorg/eclipse/jetty/io/Buffers$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getResponseBufferSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getResponseBufferSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponseBufferType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getResponseBufferType()Lorg/eclipse/jetty/io/Buffers$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getResponseBuffers()Lorg/eclipse/jetty/io/Buffers;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getResponseBuffers()Lorg/eclipse/jetty/io/Buffers;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getResponseHeaderSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getResponseHeaderSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponseHeaderType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getResponseHeaderType()Lorg/eclipse/jetty/io/Buffers$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSSLContext()Ljavax/net/ssl/SSLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getSslContext()Ljavax/net/ssl/SSLContext;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSecureRandomAlgorithm()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getSecureRandomAlgorithm()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSoTimeout()I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpClient;->getTimeout()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getSslContextFactory()Lorg/eclipse/jetty/util/ssl/SslContextFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeout()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeout:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTrustManagerAlgorithm()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getTrustManagerFactoryAlgorithm()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTrustStoreInputStream()Ljava/io/InputStream;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getTrustStoreInputStream()Ljava/io/InputStream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTrustStoreLocation()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getTrustStore()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTrustStoreType()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->getTrustStoreType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUseDirectBuffers()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_useDirectBuffers:Z

    .line 2
    .line 3
    return p0
.end method

.method public hasRealms()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_realmResolver:Lorg/eclipse/jetty/client/security/RealmResolver;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public isConnectBlocking()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectBlocking:Z

    .line 2
    .line 3
    return p0
.end method

.method public isProxied()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxy:Lorg/eclipse/jetty/client/Address;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public maxRedirects()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxRedirects:I

    .line 2
    .line 3
    return p0
.end method

.method public maxRetries()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxRetries:I

    .line 2
    .line 3
    return p0
.end method

.method public registerListener(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_registeredListeners:Ljava/util/LinkedList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/LinkedList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_registeredListeners:Ljava/util/LinkedList;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_registeredListeners:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_attributes:Lorg/eclipse/jetty/util/AttributesMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/AttributesMap;->removeAttribute(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V
    .locals 0

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/thread/Timeout;->schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    return-void
.end method

.method public schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/thread/Timeout;->getDuration()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sub-long/2addr p2, v0

    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/util/thread/Timeout;->schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public scheduleIdle(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeoutQ:Lorg/eclipse/jetty/util/thread/Timeout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/thread/Timeout;->schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public send(Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpSchemes;->HTTPS_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpExchange;->getScheme()Lorg/eclipse/jetty/io/Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/io/Buffer;->equalsIgnoreCase(Lorg/eclipse/jetty/io/Buffer;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jetty/client/HttpClient;->getDestination(Lorg/eclipse/jetty/client/Address;Z)Lorg/eclipse/jetty/client/HttpDestination;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_attributes:Lorg/eclipse/jetty/util/AttributesMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/AttributesMap;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setConnectBlocking(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectBlocking:Z

    .line 2
    .line 3
    return-void
.end method

.method public setConnectTimeout(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectTimeout:I

    .line 2
    .line 3
    return-void
.end method

.method public setConnectorType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_connectorType:I

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpClient;->setBufferTypes()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIdleTimeout(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_idleTimeout:J

    .line 2
    .line 3
    return-void
.end method

.method public setKeyManagerAlgorithm(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setSslKeyManagerFactoryAlgorithm(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeyManagerPassword(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setKeyManagerPassword(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeyStoreInputStream(Ljava/io/InputStream;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setKeyStoreInputStream(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeyStoreLocation(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setKeyStorePath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeyStorePassword(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setKeyStorePassword(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeyStoreType(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setKeyStoreType(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxBuffers(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setMaxBuffers(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxConnectionsPerAddress(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxConnectionsPerAddress:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaxQueueSizePerAddress(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxQueueSizePerAddress:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaxRedirects(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxRedirects:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaxRetries(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_maxRetries:I

    .line 2
    .line 3
    return-void
.end method

.method public setNoProxy(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_noProxy:Ljava/util/Set;

    .line 2
    .line 3
    return-void
.end method

.method public setProtocol(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setProtocol(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setProvider(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProxy(Lorg/eclipse/jetty/client/Address;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxy:Lorg/eclipse/jetty/client/Address;

    .line 2
    .line 3
    return-void
.end method

.method public setProxyAuthentication(Lorg/eclipse/jetty/client/security/Authentication;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_proxyAuthentication:Lorg/eclipse/jetty/client/security/Authentication;

    .line 2
    .line 3
    return-void
.end method

.method public setRealmResolver(Lorg/eclipse/jetty/client/security/RealmResolver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_realmResolver:Lorg/eclipse/jetty/client/security/RealmResolver;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBufferSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestBufferSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRequestBuffers(Lorg/eclipse/jetty/io/Buffers;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestBuffers(Lorg/eclipse/jetty/io/Buffers;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRequestHeaderSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestHeaderSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setResponseBufferSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseBufferSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setResponseBuffers(Lorg/eclipse/jetty/io/Buffers;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseBuffers(Lorg/eclipse/jetty/io/Buffers;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setResponseHeaderSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseHeaderSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSecureRandomAlgorithm(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setSecureRandomAlgorithm(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSoTimeout(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    int-to-long v0, p1

    .line 2
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/client/HttpClient;->setTimeout(J)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setThreadPool(Lorg/eclipse/jetty/util/thread/ThreadPool;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->removeBean(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTimeout(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_timeout:J

    .line 2
    .line 3
    return-void
.end method

.method public setTrustManagerAlgorithm(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setTrustManagerFactoryAlgorithm(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTrustStoreInputStream(Ljava/io/InputStream;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setTrustStoreInputStream(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTrustStoreLocation(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setTrustStore(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTrustStorePassword(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setTrustStorePassword(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTrustStoreType(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_sslContextFactory:Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->setTrustStoreType(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setUseDirectBuffers(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpClient;->_useDirectBuffers:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpClient;->setBufferTypes()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
