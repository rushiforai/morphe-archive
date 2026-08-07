.class public Lorg/eclipse/jetty/server/AsyncContinuation;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o21;
.implements Lorg/eclipse/jetty/continuation/Continuation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;,
        Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;
    }
.end annotation


# static fields
.field private static final DEFAULT_TIMEOUT:J = 0x7530L

.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static final __ASYNCSTARTED:I = 0x2

.field private static final __ASYNCWAIT:I = 0x4

.field private static final __COMPLETED:I = 0x9

.field private static final __COMPLETING:I = 0x7

.field private static final __DISPATCHED:I = 0x1

.field private static final __IDLE:I = 0x0

.field private static final __REDISPATCH:I = 0x5

.field private static final __REDISPATCHED:I = 0x6

.field private static final __REDISPATCHING:I = 0x3

.field private static final __UNCOMPLETED:I = 0x8

.field private static final __exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;


# instance fields
.field private _asyncListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r21;",
            ">;"
        }
    .end annotation
.end field

.field protected _connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

.field private volatile _continuation:Z

.field private _continuationListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/eclipse/jetty/continuation/ContinuationListener;",
            ">;"
        }
    .end annotation
.end field

.field private _event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

.field private volatile _expireAt:J

.field private _expired:Z

.field private _initial:Z

.field private _lastAsyncListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r21;",
            ">;"
        }
    .end annotation
.end field

.field private volatile _responseWrapped:Z

.field private _resumed:Z

.field private _state:I

.field private _timeoutMs:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    new-instance v0, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 10
    .line 11
    invoke-direct {v0}, Lorg/eclipse/jetty/continuation/ContinuationThrowable;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lorg/eclipse/jetty/server/AsyncContinuation;->__exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x7530

    .line 5
    .line 6
    iput-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 13
    .line 14
    return-void
.end method

.method private doSuspend(Ll/ase0;Ll/gse0;Ll/lse0;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p1

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_4

    .line 23
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_resumed:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

    .line 27
    .line 28
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/p21;->getSuppliedRequest()Ll/gse0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-ne p2, v0, :cond_3

    .line 37
    .line 38
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/p21;->getSuppliedResponse()Ll/lse0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-ne p3, v0, :cond_3

    .line 45
    .line 46
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 47
    .line 48
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->getServletContext()Ll/ase0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eq p1, v0, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    iget-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 56
    .line 57
    const/4 p2, 0x0

    .line 58
    invoke-static {p1, p2}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$002(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ll/ase0;)Ll/ase0;

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 62
    .line 63
    invoke-static {p1, p2}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$102(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    :goto_1
    new-instance v0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 68
    .line 69
    invoke-direct {v0, p0, p1, p2, p3}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;-><init>(Lorg/eclipse/jetty/server/AsyncContinuation;Ll/ase0;Ll/gse0;Ll/lse0;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 73
    .line 74
    :goto_2
    const/4 p1, 0x2

    .line 75
    iput p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 76
    .line 77
    iget-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_lastAsyncListeners:Ljava/util/List;

    .line 78
    .line 79
    iget-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 80
    .line 81
    iput-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_lastAsyncListeners:Ljava/util/List;

    .line 82
    .line 83
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 84
    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 88
    .line 89
    .line 90
    :cond_4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    iget-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_lastAsyncListeners:Ljava/util/List;

    .line 92
    .line 93
    if-eqz p1, :cond_5

    .line 94
    .line 95
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_5

    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    check-cast p2, Ll/r21;

    .line 110
    .line 111
    :try_start_1
    iget-object p3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 112
    .line 113
    invoke-interface {p2, p3}, Ll/r21;->onStartAsync(Ll/p21;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :catch_0
    move-exception p2

    .line 118
    sget-object p3, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 119
    .line 120
    invoke-interface {p3, p2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_5
    return-void

    .line 125
    :goto_4
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    throw p1
.end method


# virtual methods
.method public addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p1
.end method

.method public addListener(Ll/r21;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p1
.end method

.method public addListener(Ll/r21;Ll/gse0;Ll/lse0;)V
    .locals 0

    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    iget-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    if-nez p2, :cond_0

    .line 27
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public cancel()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->cancelTimeout()V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw v0
.end method

.method public cancelTimeout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractConnection;->getEndPoint()Lorg/eclipse/jetty/io/EndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isBlocking()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    monitor-enter p0

    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    :try_start_0
    iput-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expireAt:J

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0

    .line 26
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    check-cast v0, Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 31
    .line 32
    invoke-static {p0}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$200(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;)Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->cancelTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public complete()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq v0, v1, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x7

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x6

    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw v0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 30
    .line 31
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

    .line 32
    .line 33
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->cancelTimeout()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->scheduleDispatch()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void

    .line 43
    :cond_2
    :try_start_1
    iput v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw v0

    .line 57
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw v0
.end method

.method public createListener(Ljava/lang/Class;)Ll/r21;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/r21;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/r21;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    new-instance p1, Ljavax/servlet/ServletException;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    throw p1
.end method

.method public dispatch()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    const/4 v3, 0x5

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    if-ne v0, v3, :cond_0

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw v0

    .line 28
    :cond_1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

    .line 29
    .line 30
    iput v3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 31
    .line 32
    iput-boolean v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_resumed:Z

    .line 33
    .line 34
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->cancelTimeout()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->scheduleDispatch()V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void

    .line 44
    :cond_3
    const/4 v0, 0x3

    .line 45
    :try_start_1
    iput v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 46
    .line 47
    iput-boolean v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_resumed:Z

    .line 48
    .line 49
    monitor-exit p0

    .line 50
    return-void

    .line 51
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw v0
.end method

.method public dispatch(Ljava/lang/String;)V
    .locals 1

    .line 56
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    invoke-static {v0, p1}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$102(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/String;)Ljava/lang/String;

    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->dispatch()V

    return-void
.end method

.method public dispatch(Ll/ase0;Ljava/lang/String;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    invoke-static {v0, p1}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$002(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ll/ase0;)Ll/ase0;

    .line 54
    iget-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    invoke-static {p1, p2}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$102(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->dispatch()V

    return-void
.end method

.method public doComplete(Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/16 v1, 0x8

    .line 5
    .line 6
    if-ne v0, v1, :cond_3

    .line 7
    .line 8
    const/16 v0, 0x9

    .line 9
    .line 10
    iput v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 11
    .line 12
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 13
    .line 14
    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 15
    .line 16
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ll/r21;

    .line 34
    .line 35
    iget-object v3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    :try_start_1
    invoke-virtual {v3}, Ll/p21;->getSuppliedRequest()Ll/gse0;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "javax.servlet.error.exception"

    .line 44
    .line 45
    invoke-interface {v3, v4, p1}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 49
    .line 50
    invoke-virtual {v3}, Ll/p21;->getSuppliedRequest()Ll/gse0;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v4, "javax.servlet.error.message"

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-interface {v3, v4, v5}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object v3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 64
    .line 65
    invoke-interface {v2, v3}, Ll/r21;->onError(Ll/p21;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catch_0
    move-exception v2

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    invoke-interface {v2, v3}, Ll/r21;->onComplete(Ll/p21;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :goto_1
    sget-object v3, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 76
    .line 77
    invoke-interface {v3, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 98
    .line 99
    :try_start_2
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onComplete(Lorg/eclipse/jetty/continuation/Continuation;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :catch_1
    move-exception v0

    .line 104
    sget-object v1, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 105
    .line 106
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_2
    return-void

    .line 111
    :catchall_0
    move-exception p1

    .line 112
    goto :goto_3

    .line 113
    :cond_3
    :try_start_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 114
    .line 115
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p1

    .line 123
    :goto_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    throw p1
.end method

.method public expired()V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x4

    .line 5
    const/4 v2, 0x2

    .line 6
    if-eq v0, v2, :cond_0

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_4

    .line 14
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 15
    .line 16
    iget-object v3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 17
    .line 18
    const/4 v4, 0x1

    .line 19
    iput-boolean v4, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

    .line 20
    .line 21
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Ll/r21;

    .line 39
    .line 40
    :try_start_1
    iget-object v5, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 41
    .line 42
    invoke-interface {v4, v5}, Ll/r21;->onTimeout(Ll/p21;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception v4

    .line 47
    sget-object v5, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 48
    .line 49
    invoke-interface {v5, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 70
    .line 71
    :try_start_2
    invoke-interface {v3, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onTimeout(Lorg/eclipse/jetty/continuation/Continuation;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :catch_1
    move-exception v3

    .line 76
    sget-object v4, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 77
    .line 78
    invoke-interface {v4, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    monitor-enter p0

    .line 83
    :try_start_3
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 84
    .line 85
    if-eq v0, v2, :cond_3

    .line 86
    .line 87
    if-eq v0, v1, :cond_3

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuation:Z

    .line 91
    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->dispatch()V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :catchall_1
    move-exception v0

    .line 99
    goto :goto_3

    .line 100
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->complete()V

    .line 101
    .line 102
    .line 103
    :goto_2
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 104
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->scheduleDispatch()V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :goto_3
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 109
    throw v0

    .line 110
    :goto_4
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 111
    throw v0
.end method

.method public getAsyncEventState()Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

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

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getBaseRequest()Lorg/eclipse/jetty/server/Request;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->getServletContext()Ll/ase0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getRequest()Ll/gse0;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p21;->getSuppliedRequest()Ll/gse0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getResponse()Ll/lse0;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/p21;->getSuppliedResponse()Ll/lse0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/p21;->getSuppliedResponse()Ll/lse0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getResponse()Lorg/eclipse/jetty/server/Response;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public getServletResponse()Ll/lse0;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/p21;->getSuppliedResponse()Ll/lse0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/p21;->getSuppliedResponse()Ll/lse0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getResponse()Lorg/eclipse/jetty/server/Response;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public getStatusString()Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "UNKNOWN?"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    const-string v0, "IDLE"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto/16 :goto_4

    .line 18
    .line 19
    :cond_0
    const/4 v3, 0x1

    .line 20
    if-ne v2, v3, :cond_1

    .line 21
    .line 22
    const-string v0, "DISPATCHED"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v3, 0x2

    .line 26
    if-ne v2, v3, :cond_2

    .line 27
    .line 28
    const-string v0, "ASYNCSTARTED"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 v3, 0x4

    .line 32
    if-ne v2, v3, :cond_3

    .line 33
    .line 34
    const-string v0, "ASYNCWAIT"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    const/4 v3, 0x3

    .line 38
    if-ne v2, v3, :cond_4

    .line 39
    .line 40
    const-string v0, "REDISPATCHING"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_4
    const/4 v3, 0x5

    .line 44
    if-ne v2, v3, :cond_5

    .line 45
    .line 46
    const-string v0, "REDISPATCH"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_5
    const/4 v3, 0x6

    .line 50
    if-ne v2, v3, :cond_6

    .line 51
    .line 52
    const-string v0, "REDISPATCHED"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_6
    const/4 v3, 0x7

    .line 56
    if-ne v2, v3, :cond_7

    .line 57
    .line 58
    const-string v0, "COMPLETING"

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_7
    const/16 v3, 0x8

    .line 62
    .line 63
    if-ne v2, v3, :cond_8

    .line 64
    .line 65
    const-string v0, "UNCOMPLETED"

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_8
    const/16 v3, 0x9

    .line 69
    .line 70
    if-ne v2, v3, :cond_9

    .line 71
    .line 72
    const-string v0, "COMPLETE"

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 81
    .line 82
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 93
    .line 94
    if-eqz v0, :cond_a

    .line 95
    .line 96
    const-string v0, ",initial"

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_a
    const-string v0, ""

    .line 100
    .line 101
    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_resumed:Z

    .line 105
    .line 106
    if-eqz v0, :cond_b

    .line 107
    .line 108
    const-string v0, ",resumed"

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_b
    const-string v0, ""

    .line 112
    .line 113
    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

    .line 117
    .line 118
    if-eqz v0, :cond_c

    .line 119
    .line 120
    const-string v0, ",expired"

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_c
    const-string v0, ""

    .line 124
    .line 125
    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    monitor-exit p0

    .line 133
    return-object v0

    .line 134
    :goto_4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    throw v0
.end method

.method public getTimeout()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-wide v0

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

.method public handling()Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuation:Z

    .line 4
    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 6
    .line 7
    iget v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    const/4 v3, 0x7

    .line 13
    if-eq v1, v3, :cond_2

    .line 14
    .line 15
    const/4 v3, 0x4

    .line 16
    if-eq v1, v3, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-ne v1, v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x6

    .line 22
    iput v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return v2

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw v0

    .line 38
    :cond_1
    monitor-exit p0

    .line 39
    return v0

    .line 40
    :cond_2
    const/16 v1, 0x8

    .line 41
    .line 42
    iput v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 43
    .line 44
    monitor-exit p0

    .line 45
    return v0

    .line 46
    :cond_3
    iput-boolean v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 47
    .line 48
    iput v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 49
    .line 50
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_lastAsyncListeners:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_lastAsyncListeners:Ljava/util/List;

    .line 66
    .line 67
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_asyncListeners:Ljava/util/List;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_lastAsyncListeners:Ljava/util/List;

    .line 71
    .line 72
    :goto_0
    monitor-exit p0

    .line 73
    return v2

    .line 74
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw v0
.end method

.method public hasOriginalRequestAndResponse()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/p21;->getSuppliedRequest()Ll/gse0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 11
    .line 12
    iget-object v1, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/p21;->getSuppliedResponse()Ll/lse0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 23
    .line 24
    iget-object v1, v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 25
    .line 26
    if-ne v0, v1, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    :goto_0
    monitor-exit p0

    .line 34
    return v0

    .line 35
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw v0
.end method

.method public isAsync()Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-eq v0, v2, :cond_0

    .line 12
    .line 13
    const/16 v2, 0x9

    .line 14
    .line 15
    if-eq v0, v2, :cond_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return v1

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    monitor-exit p0

    .line 23
    return v0

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0
.end method

.method public isAsyncStarted()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    monitor-exit p0

    .line 18
    return v0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    monitor-exit p0

    .line 23
    return v0

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0
.end method

.method public isComplete()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/16 v1, 0x9

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    monitor-exit p0

    .line 12
    return v0

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

.method public isCompleting()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x7

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    monitor-exit p0

    .line 11
    return v0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw v0
.end method

.method public isDispatchable()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x5

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x6

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x7

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    monitor-exit p0

    .line 18
    return v0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    monitor-exit p0

    .line 23
    return v0

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0
.end method

.method public isExpired()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

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

.method public isInitial()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

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

.method public isResponseWrapped()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 2
    .line 3
    return p0
.end method

.method public isResumed()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_resumed:Z

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

.method public isSuspended()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x7

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    monitor-exit p0

    .line 18
    return v0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    monitor-exit p0

    .line 23
    return v0

    .line 24
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0
.end method

.method public isSuspending()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    monitor-exit p0

    .line 12
    return v0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x1

    .line 16
    monitor-exit p0

    .line 17
    return v0

    .line 18
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v0
.end method

.method public isUncompleted()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/16 v1, 0x8

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    monitor-exit p0

    .line 12
    return v0

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

.method public recycle()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v2, 0x6

    .line 8
    if-eq v0, v2, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 12
    .line 13
    iput-boolean v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_resumed:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expired:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->cancelTimeout()V

    .line 22
    .line 23
    .line 24
    const-wide/16 v0, 0x7530

    .line 25
    .line 26
    iput-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuationListeners:Ljava/util/List;

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw v0
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->removeAttribute(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public resume()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->dispatch()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public scheduleDispatch()V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractConnection;->getEndPoint()Lorg/eclipse/jetty/io/EndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->isBlocking()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 14
    .line 15
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->asyncDispatch()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public scheduleTimeout()V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractConnection;->getEndPoint()Lorg/eclipse/jetty/io/EndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v1, v1, v3

    .line 12
    .line 13
    if-lez v1, :cond_3

    .line 14
    .line 15
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isBlocking()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    monitor-enter p0

    .line 22
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iget-wide v5, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 27
    .line 28
    add-long/2addr v0, v5

    .line 29
    iput-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expireAt:J

    .line 30
    .line 31
    iget-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 32
    .line 33
    :goto_0
    iget-wide v5, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expireAt:J

    .line 34
    .line 35
    cmp-long v2, v5, v3

    .line 36
    .line 37
    if-lez v2, :cond_0

    .line 38
    .line 39
    cmp-long v2, v0, v3

    .line 40
    .line 41
    if-lez v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 44
    .line 45
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 50
    .line 51
    .line 52
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    if-eqz v2, :cond_0

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto :goto_2

    .line 61
    :catch_0
    move-exception v0

    .line 62
    :try_start_2
    sget-object v1, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 63
    .line 64
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    :goto_1
    iget-wide v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expireAt:J

    .line 68
    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 70
    .line 71
    .line 72
    move-result-wide v5

    .line 73
    sub-long/2addr v0, v5

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    iget-wide v5, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_expireAt:J

    .line 76
    .line 77
    cmp-long v2, v5, v3

    .line 78
    .line 79
    if-lez v2, :cond_1

    .line 80
    .line 81
    cmp-long v0, v0, v3

    .line 82
    .line 83
    if-gtz v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 86
    .line 87
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->expired()V

    .line 98
    .line 99
    .line 100
    :cond_1
    monitor-exit p0

    .line 101
    goto :goto_3

    .line 102
    :goto_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 103
    throw v0

    .line 104
    :cond_2
    check-cast v0, Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 105
    .line 106
    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 107
    .line 108
    invoke-static {v1}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$200(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;)Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iget-wide v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 113
    .line 114
    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/jetty/io/AsyncEndPoint;->scheduleTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V

    .line 115
    .line 116
    .line 117
    :cond_3
    :goto_3
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setConnection(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw p1
.end method

.method public setTimeout(J)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-wide p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_timeoutMs:J

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw p1
.end method

.method public start(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 6
    .line 7
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Server;->getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Lorg/eclipse/jetty/server/AsyncContinuation$1;

    .line 16
    .line 17
    invoke-direct {v2, p0, v0, p1}, Lorg/eclipse/jetty/server/AsyncContinuation$1;-><init>(Lorg/eclipse/jetty/server/AsyncContinuation;Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v1, v2}, Lorg/eclipse/jetty/util/thread/ThreadPool;->dispatch(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public suspend()V
    .locals 3

    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuation:Z

    .line 49
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getServletContext()Ll/ase0;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    invoke-virtual {v2}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getResponse()Lorg/eclipse/jetty/server/Response;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/eclipse/jetty/server/AsyncContinuation;->doSuspend(Ll/ase0;Ll/gse0;Ll/lse0;)V

    return-void
.end method

.method public suspend(Ll/ase0;Ll/gse0;Ll/lse0;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    instance-of v0, p3, Lorg/eclipse/jetty/server/Response;

    .line 3
    .line 4
    xor-int/lit8 v0, v0, 0x1

    .line 5
    .line 6
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/server/AsyncContinuation;->doSuspend(Ll/ase0;Ll/gse0;Ll/lse0;)V

    .line 9
    .line 10
    .line 11
    instance-of p1, p2, Ljavax/servlet/http/HttpServletRequest;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 16
    .line 17
    move-object p3, p2

    .line 18
    check-cast p3, Ljavax/servlet/http/HttpServletRequest;

    .line 19
    .line 20
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    check-cast p2, Ljavax/servlet/http/HttpServletRequest;

    .line 25
    .line 26
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p3, p2}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p1, p2}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->access$102(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p1
.end method

.method public suspend(Ll/lse0;)V
    .locals 2

    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_continuation:Z

    .line 45
    instance-of v1, p1, Lorg/eclipse/jetty/server/Response;

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_responseWrapped:Z

    .line 46
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getServletContext()Ll/ase0;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    move-result-object v1

    invoke-direct {p0, v0, v1, p1}, Lorg/eclipse/jetty/server/AsyncContinuation;->doSuspend(Ll/ase0;Ll/gse0;Ll/lse0;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "@"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    monitor-exit p0

    .line 31
    return-object v0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw v0
.end method

.method public undispatch()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isSuspended()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Lorg/eclipse/jetty/server/AsyncContinuation;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    invoke-interface {p0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    new-instance p0, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 16
    .line 17
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/ContinuationThrowable;-><init>()V

    .line 18
    .line 19
    .line 20
    throw p0

    .line 21
    :cond_0
    sget-object p0, Lorg/eclipse/jetty/server/AsyncContinuation;->__exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 22
    .line 23
    throw p0

    .line 24
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    const-string v0, "!suspended"

    .line 27
    .line 28
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0
.end method

.method public unhandle()Z
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 3
    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v2, :cond_5

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    const/4 v4, 0x7

    .line 13
    const/4 v5, 0x6

    .line 14
    const/4 v6, 0x0

    .line 15
    if-eq v0, v3, :cond_2

    .line 16
    .line 17
    const/4 v3, 0x3

    .line 18
    if-eq v0, v3, :cond_1

    .line 19
    .line 20
    if-eq v0, v5, :cond_5

    .line 21
    .line 22
    if-ne v0, v4, :cond_0

    .line 23
    .line 24
    iput-boolean v6, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 25
    .line 26
    iput v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return v2

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw v0

    .line 42
    :cond_1
    iput-boolean v6, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 43
    .line 44
    iput v5, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return v6

    .line 48
    :cond_2
    iput-boolean v6, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 49
    .line 50
    const/4 v0, 0x4

    .line 51
    iput v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 52
    .line 53
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->scheduleTimeout()V

    .line 54
    .line 55
    .line 56
    iget v3, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 57
    .line 58
    if-ne v3, v0, :cond_3

    .line 59
    .line 60
    monitor-exit p0

    .line 61
    return v2

    .line 62
    :cond_3
    if-ne v3, v4, :cond_4

    .line 63
    .line 64
    iput v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 65
    .line 66
    monitor-exit p0

    .line 67
    return v2

    .line 68
    :cond_4
    iput-boolean v6, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_initial:Z

    .line 69
    .line 70
    iput v5, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 71
    .line 72
    monitor-exit p0

    .line 73
    return v6

    .line 74
    :cond_5
    iput v1, p0, Lorg/eclipse/jetty/server/AsyncContinuation;->_state:I

    .line 75
    .line 76
    monitor-exit p0

    .line 77
    return v2

    .line 78
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 79
    .line 80
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getStatusString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw v0

    .line 88
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    throw v0
.end method
