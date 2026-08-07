.class public Lorg/eclipse/jetty/client/HttpExchange;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/client/HttpExchange$ContentExchange;,
        Lorg/eclipse/jetty/client/HttpExchange$CachedExchange;,
        Lorg/eclipse/jetty/client/HttpExchange$Listener;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field public static final STATUS_CANCELLED:I = 0xb

.field public static final STATUS_CANCELLING:I = 0xa

.field public static final STATUS_COMPLETED:I = 0x7

.field public static final STATUS_EXCEPTED:I = 0x9

.field public static final STATUS_EXPIRED:I = 0x8

.field public static final STATUS_PARSING_CONTENT:I = 0x6

.field public static final STATUS_PARSING_HEADERS:I = 0x5

.field public static final STATUS_SENDING_REQUEST:I = 0x3

.field public static final STATUS_START:I = 0x0

.field public static final STATUS_WAITING_FOR_COMMIT:I = 0x2

.field public static final STATUS_WAITING_FOR_CONNECTION:I = 0x1

.field public static final STATUS_WAITING_FOR_RESPONSE:I = 0x4


# instance fields
.field private _address:Lorg/eclipse/jetty/client/Address;

.field private _configureListeners:Z

.field private volatile _connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

.field private _lastState:I

.field private _lastStateChange:J

.field private _lastStatePeriod:I

.field private _listener:Lorg/eclipse/jetty/client/HttpEventListener;

.field private _localAddress:Lorg/eclipse/jetty/client/Address;

.field private _method:Ljava/lang/String;

.field _onDone:Z

.field _onRequestCompleteDone:Z

.field _onResponseCompleteDone:Z

.field private _requestContent:Lorg/eclipse/jetty/io/Buffer;

.field private _requestContentSource:Ljava/io/InputStream;

.field private final _requestFields:Lorg/eclipse/jetty/http/HttpFields;

.field private _retryStatus:Z

.field private _scheme:Lorg/eclipse/jetty/io/Buffer;

.field private _sent:J

.field private _status:Ljava/util/concurrent/atomic/AtomicInteger;

.field private _timeout:J

.field private volatile _timeoutTask:Lorg/eclipse/jetty/util/thread/Timeout$Task;

.field private _uri:Ljava/lang/String;

.field private _version:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "GET"

    .line 5
    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_method:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Lorg/eclipse/jetty/http/HttpSchemes;->HTTP_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_scheme:Lorg/eclipse/jetty/io/Buffer;

    .line 11
    .line 12
    const/16 v0, 0xb

    .line 13
    .line 14
    iput v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_version:I

    .line 15
    .line 16
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields;

    .line 17
    .line 18
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpFields;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 22
    .line 23
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 30
    .line 31
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_retryStatus:Z

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_configureListeners:Z

    .line 35
    .line 36
    new-instance v0, Lorg/eclipse/jetty/client/HttpExchange$Listener;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-direct {v0, p0, v1}, Lorg/eclipse/jetty/client/HttpExchange$Listener;-><init>(Lorg/eclipse/jetty/client/HttpExchange;Lorg/eclipse/jetty/client/HttpExchange$1;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 43
    .line 44
    iput-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_localAddress:Lorg/eclipse/jetty/client/Address;

    .line 45
    .line 46
    const-wide/16 v0, -0x1

    .line 47
    .line 48
    iput-wide v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeout:J

    .line 49
    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    iput-wide v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStateChange:J

    .line 55
    .line 56
    iput-wide v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_sent:J

    .line 57
    .line 58
    const/4 v0, -0x1

    .line 59
    iput v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastState:I

    .line 60
    .line 61
    iput v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStatePeriod:I

    .line 62
    .line 63
    return-void
.end method

.method private abort()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    :try_start_1
    sget-object v1, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 25
    .line 26
    .line 27
    throw v0

    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpExchange;->done()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private done()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw v0
.end method

.method private setStatusExpired(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onExpire()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return p1
.end method

.method public static toState(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const-string p0, "UNKNOWN"

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    const-string p0, "CANCELLED"

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    const-string p0, "CANCELLING"

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    const-string p0, "EXCEPTED"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    const-string p0, "EXPIRED"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    const-string p0, "COMPLETED"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    const-string p0, "CONTENT"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    const-string p0, "HEADERS"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_7
    const-string p0, "WAITING"

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_8
    const-string p0, "SENDING"

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_9
    const-string p0, "CONNECTED"

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_a
    const-string p0, "CONNECTING"

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_b
    const-string p0, "START"

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public addRequestHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestFields()Lorg/eclipse/jetty/http/HttpFields;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public associate(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/AbstractConnection;->getEndPoint()Lorg/eclipse/jetty/io/EndPoint;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalAddr()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lorg/eclipse/jetty/client/Address;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/AbstractConnection;->getEndPoint()Lorg/eclipse/jetty/io/EndPoint;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lorg/eclipse/jetty/io/EndPoint;->getLocalAddr()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/AbstractConnection;->getEndPoint()Lorg/eclipse/jetty/io/EndPoint;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Lorg/eclipse/jetty/io/EndPoint;->getLocalPort()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-direct {v0, v1, v2}, Lorg/eclipse/jetty/client/Address;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_localAddress:Lorg/eclipse/jetty/client/Address;

    .line 33
    .line 34
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/16 v0, 0xa

    .line 41
    .line 42
    if-ne p1, v0, :cond_1

    .line 43
    .line 44
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpExchange;->abort()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public cancel()V
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpExchange;->abort()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public cancelTimeout(Lorg/eclipse/jetty/client/HttpClient;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeoutTask:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lorg/eclipse/jetty/client/HttpClient;->cancel(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeoutTask:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 10
    .line 11
    return-void
.end method

.method public configureListeners()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_configureListeners:Z

    .line 2
    .line 3
    return p0
.end method

.method public disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/16 v2, 0xa

    .line 11
    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    const/16 v1, 0xb

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-object v0
.end method

.method public expire(Lorg/eclipse/jetty/client/HttpDestination;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x7

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/client/HttpDestination;->exchangeExpired(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->exchangeExpired(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public getAddress()Lorg/eclipse/jetty/client/Address;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_address:Lorg/eclipse/jetty/client/Address;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalAddress()Lorg/eclipse/jetty/client/Address;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_localAddress:Lorg/eclipse/jetty/client/Address;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_method:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestContent()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContent:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestContentChunk(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 9
    .line 10
    const/16 v0, 0x2000

    .line 11
    .line 12
    invoke-direct {p1, v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 23
    .line 24
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v1, v2, v3, v0}, Ljava/io/InputStream;->read([BII)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-ltz v0, :cond_1

    .line 37
    .line 38
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->putIndex()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/2addr v1, v0

    .line 43
    invoke-interface {p1, v1}, Lorg/eclipse/jetty/io/Buffer;->setPutIndex(I)V

    .line 44
    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-object p1

    .line 48
    :cond_1
    const/4 p1, 0x0

    .line 49
    monitor-exit p0

    .line 50
    return-object p1

    .line 51
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p1
.end method

.method public getRequestContentSource()Ljava/io/InputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestFields()Lorg/eclipse/jetty/http/HttpFields;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestURI()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_uri:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRetryStatus()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_retryStatus:Z

    .line 2
    .line 3
    return p0
.end method

.method public getScheme()Lorg/eclipse/jetty/io/Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_scheme:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatus()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTimeout()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeout:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestURI()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_version:I

    .line 2
    .line 3
    return p0
.end method

.method public isAssociated()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

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

.method public isDone()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw v0
.end method

.method public isDone(I)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->isDone()Z

    move-result p0

    return p0
.end method

.method public onConnectionFailed(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget-object v0, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "CONNECTION FAILED "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v0, p0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget-object v0, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "EXCEPTION "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v0, p0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onExpire()V
    .locals 3

    .line 1
    sget-object v0, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "EXPIRED "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v1, v1, [Ljava/lang/Object;

    .line 19
    .line 20
    invoke-interface {v0, p0, v1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onRequestCommitted()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onRequestComplete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseComplete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseHeaderComplete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onRetry()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContent:Lorg/eclipse/jetty/io/Buffer;

    .line 13
    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "Unsupported retry attempt"

    .line 21
    .line 22
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public onSwitchProtocol(Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/io/Connection;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public reset()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeoutTask:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_onRequestCompleteDone:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_onResponseCompleteDone:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v0
.end method

.method public scheduleTimeout(Lorg/eclipse/jetty/client/HttpDestination;)V
    .locals 4

    .line 1
    new-instance v0, Lorg/eclipse/jetty/client/HttpExchange$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/eclipse/jetty/client/HttpExchange$1;-><init>(Lorg/eclipse/jetty/client/HttpExchange;Lorg/eclipse/jetty/client/HttpDestination;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeoutTask:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 7
    .line 8
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getTimeout()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    cmp-long v2, v0, v2

    .line 19
    .line 20
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeoutTask:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 21
    .line 22
    if-lez v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1, p0, v0, v1}, Lorg/eclipse/jetty/client/HttpClient;->schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/client/HttpClient;->schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setAddress(Lorg/eclipse/jetty/client/Address;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_address:Lorg/eclipse/jetty/client/Address;

    .line 2
    .line 3
    return-void
.end method

.method public setConfigureListeners(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_configureListeners:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_method:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestContent(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContent:Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestContentSource(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_requestContentSource:Ljava/io/InputStream;

    .line 12
    .line 13
    const p1, 0x7fffffff

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setRequestContentType(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CONTENT_TYPE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setRequestHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setRequestHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getRequestFields()Lorg/eclipse/jetty/http/HttpFields;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public setRequestURI(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_uri:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRetryStatus(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_retryStatus:Z

    .line 2
    .line 3
    return-void
.end method

.method public setScheme(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const-string v0, "http"

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p1, Lorg/eclipse/jetty/http/HttpSchemes;->HTTP_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Lorg/eclipse/jetty/io/Buffer;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "https"

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object p1, Lorg/eclipse/jetty/http/HttpSchemes;->HTTPS_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Lorg/eclipse/jetty/io/Buffer;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 32
    .line 33
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Lorg/eclipse/jetty/io/Buffer;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public setScheme(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_scheme:Lorg/eclipse/jetty/io/Buffer;

    return-void
.end method

.method public setStatus(I)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x3

    .line 9
    if-eq v1, p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    iget-wide v5, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStateChange:J

    .line 16
    .line 17
    sub-long v5, v3, v5

    .line 18
    .line 19
    long-to-int v5, v5

    .line 20
    iput v5, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStatePeriod:I

    .line 21
    .line 22
    iput v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastState:I

    .line 23
    .line 24
    iput-wide v3, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStateChange:J

    .line 25
    .line 26
    if-ne p1, v2, :cond_0

    .line 27
    .line 28
    iput-wide v3, p0, Lorg/eclipse/jetty/client/HttpExchange;->_sent:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    goto/16 :goto_5

    .line 33
    .line 34
    :cond_0
    :goto_0
    const/4 v3, 0x2

    .line 35
    const/4 v4, 0x4

    .line 36
    const-string v5, " => "

    .line 37
    .line 38
    const/4 v6, 0x1

    .line 39
    packed-switch v1, :pswitch_data_0

    .line 40
    .line 41
    .line 42
    :try_start_1
    new-instance p0, Ljava/lang/AssertionError;

    .line 43
    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :pswitch_0
    const/16 v2, 0x9

    .line 67
    .line 68
    if-eq p1, v2, :cond_1

    .line 69
    .line 70
    const/16 v2, 0xb

    .line 71
    .line 72
    if-eq p1, v2, :cond_1

    .line 73
    .line 74
    goto/16 :goto_3

    .line 75
    .line 76
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 79
    .line 80
    .line 81
    move-result v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    :try_start_2
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpExchange;->done()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :catch_1
    move-exception p0

    .line 89
    move v0, v2

    .line 90
    goto/16 :goto_5

    .line 91
    .line 92
    :cond_2
    :goto_1
    move v6, v0

    .line 93
    move v0, v2

    .line 94
    goto/16 :goto_3

    .line 95
    .line 96
    :pswitch_1
    if-eqz p1, :cond_4

    .line 97
    .line 98
    const/4 v2, 0x7

    .line 99
    if-eq p1, v2, :cond_3

    .line 100
    .line 101
    goto/16 :goto_3

    .line 102
    .line 103
    :cond_3
    :try_start_3
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpExchange;->done()V

    .line 104
    .line 105
    .line 106
    goto/16 :goto_3

    .line 107
    .line 108
    :cond_4
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 109
    .line 110
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    goto :goto_1

    .line 115
    :pswitch_2
    if-eqz p1, :cond_5

    .line 116
    .line 117
    if-eq p1, v4, :cond_5

    .line 118
    .line 119
    packed-switch p1, :pswitch_data_1

    .line 120
    .line 121
    .line 122
    move v6, v0

    .line 123
    goto/16 :goto_3

    .line 124
    .line 125
    :cond_5
    :pswitch_3
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 126
    .line 127
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    goto :goto_1

    .line 132
    :pswitch_4
    packed-switch p1, :pswitch_data_2

    .line 133
    .line 134
    .line 135
    :goto_2
    move v2, v0

    .line 136
    goto :goto_1

    .line 137
    :pswitch_5
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 138
    .line 139
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    goto :goto_1

    .line 144
    :pswitch_6
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    goto :goto_1

    .line 149
    :pswitch_7
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 150
    .line 151
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 152
    .line 153
    .line 154
    move-result v2
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 155
    if-eqz v2, :cond_2

    .line 156
    .line 157
    :try_start_4
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-interface {v3}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseComplete()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :pswitch_8
    packed-switch p1, :pswitch_data_3

    .line 166
    .line 167
    .line 168
    :pswitch_9
    goto :goto_2

    .line 169
    :pswitch_a
    :try_start_5
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 170
    .line 171
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    goto :goto_1

    .line 176
    :pswitch_b
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    goto :goto_1

    .line 181
    :pswitch_c
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 182
    .line 183
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 184
    .line 185
    .line 186
    move-result v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 187
    if-eqz v2, :cond_2

    .line 188
    .line 189
    :try_start_6
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-interface {v3}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseHeaderComplete()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :pswitch_d
    const/4 v2, 0x5

    .line 198
    if-eq p1, v2, :cond_6

    .line 199
    .line 200
    packed-switch p1, :pswitch_data_4

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :pswitch_e
    :try_start_7
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    goto :goto_1

    .line 209
    :cond_6
    :pswitch_f
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 210
    .line 211
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    goto :goto_1

    .line 216
    :pswitch_10
    if-eq p1, v4, :cond_7

    .line 217
    .line 218
    packed-switch p1, :pswitch_data_5

    .line 219
    .line 220
    .line 221
    goto :goto_2

    .line 222
    :pswitch_11
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 223
    .line 224
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    goto/16 :goto_1

    .line 229
    .line 230
    :pswitch_12
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    goto/16 :goto_1

    .line 235
    .line 236
    :cond_7
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 237
    .line 238
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 239
    .line 240
    .line 241
    move-result v2
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    .line 242
    if-eqz v2, :cond_2

    .line 243
    .line 244
    :try_start_8
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    invoke-interface {v3}, Lorg/eclipse/jetty/client/HttpEventListener;->onRequestCommitted()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1

    .line 249
    .line 250
    .line 251
    goto/16 :goto_1

    .line 252
    .line 253
    :pswitch_13
    if-eq p1, v2, :cond_8

    .line 254
    .line 255
    packed-switch p1, :pswitch_data_6

    .line 256
    .line 257
    .line 258
    goto :goto_2

    .line 259
    :pswitch_14
    :try_start_9
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    goto/16 :goto_1

    .line 264
    .line 265
    :cond_8
    :pswitch_15
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 266
    .line 267
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 268
    .line 269
    .line 270
    move-result v2

    .line 271
    goto/16 :goto_1

    .line 272
    .line 273
    :pswitch_16
    if-eq p1, v3, :cond_9

    .line 274
    .line 275
    packed-switch p1, :pswitch_data_7

    .line 276
    .line 277
    .line 278
    goto/16 :goto_2

    .line 279
    .line 280
    :pswitch_17
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    goto/16 :goto_1

    .line 285
    .line 286
    :cond_9
    :pswitch_18
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 287
    .line 288
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    goto/16 :goto_1

    .line 293
    .line 294
    :pswitch_19
    if-eqz p1, :cond_a

    .line 295
    .line 296
    if-eq p1, v6, :cond_a

    .line 297
    .line 298
    if-eq p1, v3, :cond_a

    .line 299
    .line 300
    packed-switch p1, :pswitch_data_8

    .line 301
    .line 302
    .line 303
    goto/16 :goto_2

    .line 304
    .line 305
    :pswitch_1a
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatusExpired(II)Z

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    goto/16 :goto_1

    .line 310
    .line 311
    :cond_a
    :pswitch_1b
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 312
    .line 313
    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    goto/16 :goto_1

    .line 318
    .line 319
    :goto_3
    :pswitch_1c
    if-nez v0, :cond_c

    .line 320
    .line 321
    if-eqz v6, :cond_b

    .line 322
    .line 323
    goto :goto_4

    .line 324
    :cond_b
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 325
    .line 326
    new-instance v2, Ljava/lang/StringBuilder;

    .line 327
    .line 328
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .line 330
    .line 331
    invoke-static {v1}, Lorg/eclipse/jetty/client/HttpExchange;->toState(I)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-static {p1}, Lorg/eclipse/jetty/client/HttpExchange;->toState(I)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    throw p0

    .line 356
    :cond_c
    :goto_4
    sget-object v1, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 357
    .line 358
    const-string v2, "setStatus {} {}"

    .line 359
    .line 360
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    invoke-interface {v1, v2, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    .line 369
    .line 370
    .line 371
    return v0

    .line 372
    :goto_5
    sget-object p1, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 373
    .line 374
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 375
    .line 376
    .line 377
    return v0

    .line 378
    nop

    .line 379
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_8
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    :pswitch_data_1
    .packed-switch 0x8
        :pswitch_1c
        :pswitch_3
        :pswitch_1c
    .end packed-switch

    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    :pswitch_data_2
    .packed-switch 0x7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
    .end packed-switch

    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    :pswitch_data_3
    .packed-switch 0x6
        :pswitch_c
        :pswitch_9
        :pswitch_b
        :pswitch_a
        :pswitch_a
    .end packed-switch

    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    :pswitch_data_4
    .packed-switch 0x8
        :pswitch_e
        :pswitch_f
        :pswitch_f
    .end packed-switch

    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    :pswitch_data_5
    .packed-switch 0x8
        :pswitch_12
        :pswitch_11
        :pswitch_11
    .end packed-switch

    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    :pswitch_data_6
    .packed-switch 0x8
        :pswitch_14
        :pswitch_15
        :pswitch_15
    .end packed-switch

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    :pswitch_data_7
    .packed-switch 0x8
        :pswitch_17
        :pswitch_18
        :pswitch_18
    .end packed-switch

    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    :pswitch_data_8
    .packed-switch 0x8
        :pswitch_1a
        :pswitch_1b
        :pswitch_1b
    .end packed-switch
.end method

.method public setTimeout(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_timeout:J

    .line 2
    .line 3
    return-void
.end method

.method public setURI(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 101
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    return-void
.end method

.method public setURI(Ljava/net/URI;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/net/URI;->isAbsolute()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/net/URI;->isOpaque()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_4

    .line 12
    .line 13
    sget-object v0, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "URI = {}"

    .line 30
    .line 31
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-gtz v1, :cond_2

    .line 43
    .line 44
    const-string v1, "https"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    const/16 v1, 0x1bb

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/16 v1, 0x50

    .line 56
    .line 57
    :cond_2
    :goto_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Lorg/eclipse/jetty/client/Address;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-direct {v0, v2, v1}, Lorg/eclipse/jetty/client/Address;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setAddress(Lorg/eclipse/jetty/client/Address;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Lorg/eclipse/jetty/http/HttpURI;

    .line 73
    .line 74
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/http/HttpURI;-><init>(Ljava/net/URI;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpURI;->getCompletePath()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    const-string p1, "/"

    .line 84
    .line 85
    :cond_3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    const-string p0, "Opaque URI: "

    .line 90
    .line 91
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    const-string p0, "!Absolute URI: "

    .line 96
    .line 97
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public setURL(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setURI(Ljava/net/URI;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setVersion(I)V
    .locals 0

    .line 21
    iput p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_version:I

    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->get(Ljava/lang/String;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/16 p1, 0xa

    .line 10
    .line 11
    iput p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_version:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_version:I

    .line 19
    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 14

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lorg/eclipse/jetty/client/HttpExchange;->toState(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v10

    .line 13
    iget-wide v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStateChange:J

    .line 14
    .line 15
    sub-long v0, v10, v0

    .line 16
    .line 17
    iget v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastState:I

    .line 18
    .line 19
    if-ltz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    move-wide v4, v0

    .line 38
    move-object v1, v2

    .line 39
    move-object v2, v3

    .line 40
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpExchange;->_method:Ljava/lang/String;

    .line 41
    .line 42
    move-wide v7, v4

    .line 43
    iget-object v4, p0, Lorg/eclipse/jetty/client/HttpExchange;->_address:Lorg/eclipse/jetty/client/Address;

    .line 44
    .line 45
    iget-object v5, p0, Lorg/eclipse/jetty/client/HttpExchange;->_uri:Ljava/lang/String;

    .line 46
    .line 47
    iget v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastState:I

    .line 48
    .line 49
    invoke-static {v0}, Lorg/eclipse/jetty/client/HttpExchange;->toState(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v9, p0, Lorg/eclipse/jetty/client/HttpExchange;->_lastStatePeriod:I

    .line 54
    .line 55
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    move-wide v12, v7

    .line 60
    move-object v7, v9

    .line 61
    move-wide v8, v12

    .line 62
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v9

    .line 66
    move-object v8, v6

    .line 67
    move-object v6, v0

    .line 68
    filled-new-array/range {v1 .. v9}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "%s@%x=%s//%s%s#%s(%dms)->%s(%dms)"

    .line 73
    .line 74
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    move-wide v8, v0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpExchange;->_method:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v4, p0, Lorg/eclipse/jetty/client/HttpExchange;->_address:Lorg/eclipse/jetty/client/Address;

    .line 99
    .line 100
    iget-object v5, p0, Lorg/eclipse/jetty/client/HttpExchange;->_uri:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    filled-new-array/range {v1 .. v7}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const-string v1, "%s@%x=%s//%s%s#%s(%dms)"

    .line 111
    .line 112
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getStatus()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    const/4 v2, 0x3

    .line 121
    if-lt v1, v2, :cond_1

    .line 122
    .line 123
    iget-wide v1, p0, Lorg/eclipse/jetty/client/HttpExchange;->_sent:J

    .line 124
    .line 125
    const-wide/16 v3, 0x0

    .line 126
    .line 127
    cmp-long v1, v1, v3

    .line 128
    .line 129
    if-lez v1, :cond_1

    .line 130
    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v0, "sent="

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-wide v2, p0, Lorg/eclipse/jetty/client/HttpExchange;->_sent:J

    .line 145
    .line 146
    sub-long/2addr v10, v2

    .line 147
    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string p0, "ms"

    .line 151
    .line 152
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    return-object p0

    .line 160
    :cond_1
    return-object v0
.end method

.method public waitForDone()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->isDone()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange;->_status:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    monitor-exit p0

    .line 21
    return v0

    .line 22
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v0
.end method

.method public waitForStatus(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method
