.class public abstract Lorg/eclipse/jetty/server/AbstractConnector;
.super Lorg/eclipse/jetty/util/component/AggregateLifeCycle;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/http/HttpBuffers;
.implements Lorg/eclipse/jetty/server/Connector;
.implements Lorg/eclipse/jetty/util/component/Dumpable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _acceptQueueSize:I

.field private _acceptorPriorityOffset:I

.field private transient _acceptorThreads:[Ljava/lang/Thread;

.field private _acceptors:I

.field protected final _buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

.field private _confidentialPort:I

.field private _confidentialScheme:Ljava/lang/String;

.field private final _connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

.field private final _connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

.field private _forwarded:Z

.field private _forwardedCipherSuiteHeader:Ljava/lang/String;

.field private _forwardedForHeader:Ljava/lang/String;

.field private _forwardedHostHeader:Ljava/lang/String;

.field private _forwardedProtoHeader:Ljava/lang/String;

.field private _forwardedServerHeader:Ljava/lang/String;

.field private _forwardedSslSessionIdHeader:Ljava/lang/String;

.field private _host:Ljava/lang/String;

.field private _hostHeader:Ljava/lang/String;

.field private _integralPort:I

.field private _integralScheme:Ljava/lang/String;

.field protected _lowResourceMaxIdleTime:I

.field protected _maxIdleTime:I

.field private _name:Ljava/lang/String;

.field private _port:I

.field private final _requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

.field private _reuseAddress:Z

.field private _server:Lorg/eclipse/jetty/server/Server;

.field protected _soLingerTime:I

.field private final _statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

.field private _threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

.field private _useDNS:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/AbstractConnector;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_port:I

    .line 6
    .line 7
    const-string v1, "https"

    .line 8
    .line 9
    iput-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_integralScheme:Ljava/lang/String;

    .line 10
    .line 11
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_integralPort:I

    .line 12
    .line 13
    iput-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_confidentialScheme:Ljava/lang/String;

    .line 14
    .line 15
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_confidentialPort:I

    .line 16
    .line 17
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptQueueSize:I

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    iput v1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptors:I

    .line 21
    .line 22
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorPriorityOffset:I

    .line 23
    .line 24
    const-string v0, "X-Forwarded-Host"

    .line 25
    .line 26
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedHostHeader:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "X-Forwarded-Server"

    .line 29
    .line 30
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedServerHeader:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "X-Forwarded-For"

    .line 33
    .line 34
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedForHeader:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "X-Forwarded-Proto"

    .line 37
    .line 38
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedProtoHeader:Ljava/lang/String;

    .line 39
    .line 40
    iput-boolean v1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_reuseAddress:Z

    .line 41
    .line 42
    const v0, 0x30d40

    .line 43
    .line 44
    .line 45
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_maxIdleTime:I

    .line 46
    .line 47
    const/4 v0, -0x1

    .line 48
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_lowResourceMaxIdleTime:I

    .line 49
    .line 50
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_soLingerTime:I

    .line 51
    .line 52
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 53
    .line 54
    const-wide/16 v1, -0x1

    .line 55
    .line 56
    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 60
    .line 61
    new-instance v0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 62
    .line 63
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 67
    .line 68
    new-instance v0, Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 69
    .line 70
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 74
    .line 75
    new-instance v0, Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 76
    .line 77
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 81
    .line 82
    new-instance v0, Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 83
    .line 84
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorThreads:[Ljava/lang/Thread;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/server/AbstractConnector;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorPriorityOffset:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200()Lorg/eclipse/jetty/util/log/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    return-object v0
.end method

.method private updateNotEqual(Ljava/util/concurrent/atomic/AtomicLong;JJ)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :goto_0
    cmp-long p0, p2, v0

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1, p4, p5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public abstract accept(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public checkForwardedHeaders(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->getConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequestFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedCipherSuiteHeader()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedCipherSuiteHeader()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Lorg/eclipse/jetty/http/HttpFields;->getStringField(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v1, "javax.servlet.request.cipher_suite"

    .line 26
    .line 27
    invoke-virtual {p2, v1, v0}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedSslSessionIdHeader()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedSslSessionIdHeader()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Lorg/eclipse/jetty/http/HttpFields;->getStringField(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    const-string v1, "javax.servlet.request.ssl_session_id"

    .line 47
    .line 48
    invoke-virtual {p2, v1, v0}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    const-string v0, "https"

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/server/Request;->setScheme(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedHostHeader()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/server/AbstractConnector;->getLeftMostFieldValue(Lorg/eclipse/jetty/http/HttpFields;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedServerHeader()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p0, p1, v1}, Lorg/eclipse/jetty/server/AbstractConnector;->getLeftMostFieldValue(Lorg/eclipse/jetty/http/HttpFields;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedForHeader()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p0, p1, v2}, Lorg/eclipse/jetty/server/AbstractConnector;->getLeftMostFieldValue(Lorg/eclipse/jetty/http/HttpFields;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getForwardedProtoHeader()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {p0, p1, v3}, Lorg/eclipse/jetty/server/AbstractConnector;->getLeftMostFieldValue(Lorg/eclipse/jetty/http/HttpFields;Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_hostHeader:Ljava/lang/String;

    .line 89
    .line 90
    const/4 v5, -0x1

    .line 91
    const/4 v6, 0x0

    .line 92
    if-eqz v4, :cond_2

    .line 93
    .line 94
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->HOST_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 95
    .line 96
    invoke-virtual {p1, v0, v4}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, v6}, Lorg/eclipse/jetty/server/Request;->setServerName(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2, v5}, Lorg/eclipse/jetty/server/Request;->setServerPort(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->getServerName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    if-eqz v0, :cond_3

    .line 110
    .line 111
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaders;->HOST_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 112
    .line 113
    invoke-virtual {p1, v1, v0}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p2, v6}, Lorg/eclipse/jetty/server/Request;->setServerName(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v5}, Lorg/eclipse/jetty/server/Request;->setServerPort(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->getServerName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    if-eqz v1, :cond_4

    .line 127
    .line 128
    invoke-virtual {p2, v1}, Lorg/eclipse/jetty/server/Request;->setServerName(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_4
    :goto_0
    if-eqz v2, :cond_7

    .line 132
    .line 133
    invoke-virtual {p2, v2}, Lorg/eclipse/jetty/server/Request;->setRemoteAddr(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_useDNS:Z

    .line 137
    .line 138
    if-eqz p0, :cond_5

    .line 139
    .line 140
    :try_start_0
    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 141
    .line 142
    .line 143
    move-result-object v6
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    goto :goto_1

    .line 145
    :catch_0
    move-exception p0

    .line 146
    sget-object p1, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 147
    .line 148
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 149
    .line 150
    .line 151
    :cond_5
    :goto_1
    if-nez v6, :cond_6

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_6
    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    :goto_2
    invoke-virtual {p2, v2}, Lorg/eclipse/jetty/server/Request;->setRemoteHost(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :cond_7
    if-eqz v3, :cond_8

    .line 162
    .line 163
    invoke-virtual {p2, v3}, Lorg/eclipse/jetty/server/Request;->setScheme(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_8
    return-void
.end method

.method public configure(Ljava/net/Socket;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 3
    .line 4
    .line 5
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_soLingerTime:I

    .line 6
    .line 7
    if-ltz p0, :cond_0

    .line 8
    .line 9
    div-int/lit16 p0, p0, 0x3e8

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    invoke-virtual {p1, p0, p0}, Ljava/net/Socket;->setSoLinger(ZI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    sget-object p1, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 22
    .line 23
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public connectionClosed(Lorg/eclipse/jetty/io/Connection;)V
    .locals 5

    .line 1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Connection;->onClose()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide/16 v2, -0x1

    .line 11
    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Connection;->getTimeStamp()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sub-long/2addr v0, v2

    .line 26
    instance-of v2, p1, Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    check-cast p1, Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 31
    .line 32
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequests()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 39
    .line 40
    int-to-long v3, p1

    .line 41
    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 45
    .line 46
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public connectionOpened(Lorg/eclipse/jetty/io/Connection;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long p1, v0, v2

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->increment()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public connectionUpgraded(Lorg/eclipse/jetty/io/Connection;Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    instance-of p2, p1, Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 8
    .line 9
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequests()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-long p1, p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-wide/16 p1, 0x0

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public customize(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->isForwarded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/AbstractConnector;->checkForwardedHeaders(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V

    .line 8
    .line 9
    .line 10
    :cond_0
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
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_server:Lorg/eclipse/jetty/server/Server;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->open()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_server:Lorg/eclipse/jetty/server/Server;

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Server;->getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->doStart()V

    .line 25
    .line 26
    .line 27
    monitor-enter p0

    .line 28
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getAcceptors()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    new-array v0, v0, [Ljava/lang/Thread;

    .line 33
    .line 34
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorThreads:[Ljava/lang/Thread;

    .line 35
    .line 36
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorThreads:[Ljava/lang/Thread;

    .line 37
    .line 38
    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 40
    .line 41
    if-ge v1, v0, :cond_2

    .line 42
    .line 43
    :try_start_1
    new-instance v0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;

    .line 44
    .line 45
    invoke-direct {v0, p0, v1}, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;-><init>(Lorg/eclipse/jetty/server/AbstractConnector;I)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v2, v0}, Lorg/eclipse/jetty/util/thread/ThreadPool;->dispatch(Ljava/lang/Runnable;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 58
    .line 59
    const-string v1, "!accepting"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw v0

    .line 65
    :catchall_0
    move-exception v0

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    invoke-interface {v2}, Lorg/eclipse/jetty/util/thread/ThreadPool;->isLowOnThreads()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    sget-object v0, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 74
    .line 75
    const-string v1, "insufficient threads configured for {}"

    .line 76
    .line 77
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :cond_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    sget-object v0, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 86
    .line 87
    const-string v1, "Started {}"

    .line 88
    .line 89
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-interface {v0, v1, p0}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    throw v0

    .line 99
    :cond_4
    const-string p0, "No server"

    .line 100
    .line 101
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public doStop()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catch_0
    move-exception v0

    .line 6
    sget-object v1, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 7
    .line 8
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->doStop()V

    .line 12
    .line 13
    .line 14
    monitor-enter p0

    .line 15
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorThreads:[Ljava/lang/Thread;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorThreads:[Ljava/lang/Thread;

    .line 19
    .line 20
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    array-length p0, v0

    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_1
    if-ge v1, p0, :cond_1

    .line 26
    .line 27
    aget-object v2, v0, v1

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 32
    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    return-void

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    throw v0
.end method

.method public getAcceptQueueSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptQueueSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptorPriorityOffset()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorPriorityOffset:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptors()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptors:I

    .line 2
    .line 3
    return p0
.end method

.method public getConfidentialPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_confidentialPort:I

    .line 2
    .line 3
    return p0
.end method

.method public getConfidentialScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_confidentialScheme:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConnections()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getConnectionsDurationMax()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getConnectionsDurationMean()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMean()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getConnectionsDurationStdDev()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getStdDev()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getConnectionsDurationTotal()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getConnectionsOpen()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getCurrent()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getConnectionsOpenMax()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getConnectionsRequestsMax()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getConnectionsRequestsMean()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMean()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getConnectionsRequestsStdDev()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getStdDev()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getForwardedCipherSuiteHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedCipherSuiteHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForwardedForHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedForHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForwardedHostHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedHostHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForwardedProtoHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedProtoHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForwardedServerHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedServerHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getForwardedSslSessionIdHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedSslSessionIdHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_host:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHostHeader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_hostHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIntegralPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_integralPort:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntegralScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_integralScheme:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeftMostFieldValue(Lorg/eclipse/jetty/http/HttpFields;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->getStringField(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_1
    const/16 p0, 0x2c

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 p2, -0x1

    .line 19
    if-ne p0, p2, :cond_2

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_2
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p1, p2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final getLowResourceMaxIdleTime()I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getLowResourcesMaxIdleTime()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getLowResourcesMaxIdleTime()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_lowResourceMaxIdleTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxBuffers()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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

.method public getMaxIdleTime()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_maxIdleTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_name:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getHost()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const-string v1, "0.0.0.0"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getHost()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ":"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getLocalPort()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-gtz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getPort()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getLocalPort()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_name:Ljava/lang/String;

    .line 54
    .line 55
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_name:Ljava/lang/String;

    .line 56
    .line 57
    return-object p0
.end method

.method public getPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_port:I

    .line 2
    .line 3
    return p0
.end method

.method public getRequestBufferSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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

.method public getRequests()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getResolveNames()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_useDNS:Z

    .line 2
    .line 3
    return p0
.end method

.method public getResponseBufferSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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

.method public getReuseAddress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_reuseAddress:Z

    .line 2
    .line 3
    return p0
.end method

.method public getServer()Lorg/eclipse/jetty/server/Server;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_server:Lorg/eclipse/jetty/server/Server;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoLingerTime()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_soLingerTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getStatsOn()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public getStatsOnMs()J
    .locals 4

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v2, v0

    .line 18
    return-wide v2

    .line 19
    :cond_0
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    return-wide v0
.end method

.method public getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 2
    .line 3
    return-object p0
.end method

.method public isConfidential(Lorg/eclipse/jetty/server/Request;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwarded:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Request;->getScheme()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "https"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public isForwarded()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwarded:Z

    .line 2
    .line 3
    return p0
.end method

.method public isIntegral(Lorg/eclipse/jetty/server/Request;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isLowResources()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/eclipse/jetty/util/thread/ThreadPool;->isLowOnThreads()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_server:Lorg/eclipse/jetty/server/Server;

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Server;->getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lorg/eclipse/jetty/util/thread/ThreadPool;->isLowOnThreads()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public join()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorThreads:[Ljava/lang/Thread;

    .line 3
    .line 4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    array-length p0, v0

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, p0, :cond_1

    .line 10
    .line 11
    aget-object v2, v0, v1

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V

    .line 16
    .line 17
    .line 18
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public persist(Lorg/eclipse/jetty/io/EndPoint;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public setAcceptQueueSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptQueueSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setAcceptorPriorityOffset(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptorPriorityOffset:I

    .line 2
    .line 3
    return-void
.end method

.method public setAcceptors(I)V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-le p1, v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "Acceptors should be <=2*availableProcessors: "

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    new-array v2, v2, [Ljava/lang/Object;

    .line 31
    .line 32
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_acceptors:I

    .line 36
    .line 37
    return-void
.end method

.method public setConfidentialPort(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_confidentialPort:I

    .line 2
    .line 3
    return-void
.end method

.method public setConfidentialScheme(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_confidentialScheme:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForwarded(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    const-string v1, "{} is forwarded"

    .line 6
    .line 7
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwarded:Z

    .line 15
    .line 16
    return-void
.end method

.method public setForwardedCipherSuiteHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedCipherSuiteHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForwardedForHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedForHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForwardedHostHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedHostHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForwardedProtoHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedProtoHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForwardedServerHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedServerHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForwardedSslSessionIdHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_forwardedSslSessionIdHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_host:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHostHeader(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_hostHeader:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIntegralPort(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_integralPort:I

    .line 2
    .line 3
    return-void
.end method

.method public setIntegralScheme(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_integralScheme:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final setLowResourceMaxIdleTime(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->setLowResourcesMaxIdleTime(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setLowResourcesMaxIdleTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_lowResourceMaxIdleTime:I

    .line 2
    .line 3
    return-void
.end method

.method public setMaxBuffers(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setMaxBuffers(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxIdleTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_maxIdleTime:I

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPort(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_port:I

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBufferSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestHeaderSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setResolveNames(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_useDNS:Z

    .line 2
    .line 3
    return-void
.end method

.method public setResponseBufferSize(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseHeaderSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setReuseAddress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_reuseAddress:Z

    .line 2
    .line 3
    return-void
.end method

.method public setServer(Lorg/eclipse/jetty/server/Server;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_server:Lorg/eclipse/jetty/server/Server;

    .line 2
    .line 3
    return-void
.end method

.method public setSoLingerTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_soLingerTime:I

    .line 2
    .line 3
    return-void
.end method

.method public setStatsOn(Z)V
    .locals 5

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    cmp-long v2, v2, v0

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v2, Lorg/eclipse/jetty/server/AbstractConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 17
    .line 18
    invoke-interface {v2}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v4, "Statistics on = "

    .line 27
    .line 28
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v4, " for "

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const/4 v4, 0x0

    .line 47
    new-array v4, v4, [Ljava/lang/Object;

    .line 48
    .line 49
    invoke-interface {v2, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->statsReset()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    :cond_2
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setThreadPool(Lorg/eclipse/jetty/util/thread/ThreadPool;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->removeBean(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public statsReset()V
    .locals 6

    .line 1
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v4

    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/server/AbstractConnector;->updateNotEqual(Ljava/util/concurrent/atomic/AtomicLong;JJ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, v0, Lorg/eclipse/jetty/server/AbstractConnector;->_requestStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object p0, v0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->reset()V

    .line 21
    .line 22
    .line 23
    iget-object p0, v0, Lorg/eclipse/jetty/server/AbstractConnector;->_connectionDurationStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 24
    .line 25
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->reset()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public stopAccept(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getHost()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "0.0.0.0"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getHost()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getLocalPort()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-gtz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getPort()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getLocalPort()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "%s@%s:%d"

    .line 46
    .line 47
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method
