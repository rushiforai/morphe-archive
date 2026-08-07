.class Lorg/eclipse/jetty/continuation/FauxContinuation;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/continuation/ContinuationFilter$FilteredContinuation;


# static fields
.field private static final __COMPLETE:I = 0x7

.field private static final __COMPLETING:I = 0x4

.field private static final __HANDLING:I = 0x1

.field private static final __RESUMING:I = 0x3

.field private static final __SUSPENDED:I = 0x5

.field private static final __SUSPENDING:I = 0x2

.field private static final __UNSUSPENDING:I = 0x6

.field private static final __exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;


# instance fields
.field private _initial:Z

.field private _listeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/eclipse/jetty/continuation/ContinuationListener;",
            ">;"
        }
    .end annotation
.end field

.field private final _request:Ll/gse0;

.field private _response:Ll/lse0;

.field private _responseWrapped:Z

.field private _resumed:Z

.field private _state:I

.field private _timeout:Z

.field private _timeoutMs:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/continuation/ContinuationThrowable;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/eclipse/jetty/continuation/FauxContinuation;->__exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/gse0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_responseWrapped:Z

    .line 15
    .line 16
    const-wide/16 v0, 0x7530

    .line 17
    .line 18
    iput-wide v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeoutMs:J

    .line 19
    .line 20
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_request:Ll/gse0;

    .line 21
    .line 22
    return-void
.end method

.method private fauxResume()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeoutMs:J

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private fauxSuspend()V
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeoutMs:J

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    :goto_0
    iget-wide v4, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeoutMs:J

    .line 9
    .line 10
    const-wide/16 v6, 0x0

    .line 11
    .line 12
    cmp-long v4, v4, v6

    .line 13
    .line 14
    if-lez v4, :cond_0

    .line 15
    .line 16
    cmp-long v4, v2, v6

    .line 17
    .line 18
    if-lez v4, :cond_0

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    sub-long v2, v0, v2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    :cond_0
    iget-wide v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeoutMs:J

    .line 31
    .line 32
    cmp-long v0, v0, v6

    .line 33
    .line 34
    if-lez v0, :cond_1

    .line 35
    .line 36
    cmp-long v0, v2, v6

    .line 37
    .line 38
    if-gtz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->expire()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method


# virtual methods
.method public addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_listeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_listeners:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_listeners:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public complete()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x4

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw v0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :pswitch_0
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :pswitch_1
    iput v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 23
    .line 24
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->fauxResume()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :pswitch_2
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :pswitch_3
    iput v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 31
    .line 32
    :goto_0
    :pswitch_4
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :pswitch_5
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw v0

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public enter(Ll/lse0;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_response:Ll/lse0;

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0
.end method

.method public exit()Z
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x7

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v2, :cond_5

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    const/4 v4, 0x4

    .line 10
    const/4 v5, 0x0

    .line 11
    if-eq v0, v3, :cond_2

    .line 12
    .line 13
    const/4 v3, 0x3

    .line 14
    if-eq v0, v3, :cond_1

    .line 15
    .line 16
    if-ne v0, v4, :cond_0

    .line 17
    .line 18
    iput-boolean v5, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

    .line 19
    .line 20
    iput v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->onComplete()V

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return v2

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw v0

    .line 39
    :cond_1
    iput-boolean v5, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

    .line 40
    .line 41
    iput v2, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return v5

    .line 45
    :cond_2
    iput-boolean v5, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

    .line 46
    .line 47
    const/4 v0, 0x5

    .line 48
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 49
    .line 50
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->fauxSuspend()V

    .line 51
    .line 52
    .line 53
    iget v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 54
    .line 55
    if-eq v1, v0, :cond_4

    .line 56
    .line 57
    if-ne v1, v4, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    iput-boolean v5, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

    .line 61
    .line 62
    iput v2, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return v5

    .line 66
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->onComplete()V

    .line 67
    .line 68
    .line 69
    monitor-exit p0

    .line 70
    return v2

    .line 71
    :cond_5
    iput v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 72
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->onComplete()V

    .line 74
    .line 75
    .line 76
    monitor-exit p0

    .line 77
    return v2

    .line 78
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw v0
.end method

.method public expire()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 4
    .line 5
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->onTimeout()V

    .line 7
    .line 8
    .line 9
    monitor-enter p0

    .line 10
    :try_start_1
    iget v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 11
    .line 12
    packed-switch v1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :pswitch_0
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :pswitch_1
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 32
    .line 33
    const/4 v0, 0x6

    .line 34
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :pswitch_2
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :pswitch_3
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :pswitch_4
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 43
    .line 44
    const/4 v0, 0x3

    .line 45
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 46
    .line 47
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->fauxResume()V

    .line 48
    .line 49
    .line 50
    monitor-exit p0

    .line 51
    return-void

    .line 52
    :pswitch_5
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw v0

    .line 56
    :catchall_1
    move-exception v0

    .line 57
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 58
    throw v0

    .line 59
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServletResponse()Ll/lse0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_response:Ll/lse0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatusString()Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "???"

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
    iget v2, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-ne v2, v3, :cond_0

    .line 13
    .line 14
    const-string v0, "HANDLING"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_4

    .line 19
    :cond_0
    const/4 v3, 0x2

    .line 20
    if-ne v2, v3, :cond_1

    .line 21
    .line 22
    const-string v0, "SUSPENDING"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v3, 0x5

    .line 26
    if-ne v2, v3, :cond_2

    .line 27
    .line 28
    const-string v0, "SUSPENDED"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 v3, 0x3

    .line 32
    if-ne v2, v3, :cond_3

    .line 33
    .line 34
    const-string v0, "RESUMING"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    const/4 v3, 0x6

    .line 38
    if-ne v2, v3, :cond_4

    .line 39
    .line 40
    const-string v0, "UNSUSPENDING"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_4
    const/4 v3, 0x4

    .line 44
    if-ne v2, v3, :cond_5

    .line 45
    .line 46
    const-string v0, "COMPLETING"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

    .line 67
    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    const-string v0, ",initial"

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_6
    const-string v0, ""

    .line 74
    .line 75
    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 79
    .line 80
    if-eqz v0, :cond_7

    .line 81
    .line 82
    const-string v0, ",resumed"

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_7
    const-string v0, ""

    .line 86
    .line 87
    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 91
    .line 92
    if-eqz v0, :cond_8

    .line 93
    .line 94
    const-string v0, ",timeout"

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_8
    const-string v0, ""

    .line 98
    .line 99
    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    monitor-exit p0

    .line 107
    return-object v0

    .line 108
    :goto_4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    throw v0
.end method

.method public handling()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_responseWrapped:Z

    .line 6
    .line 7
    iget v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 8
    .line 9
    packed-switch v1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 13
    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 20
    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw v1

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_0

    .line 34
    :pswitch_0
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->fauxResume()V

    .line 35
    .line 36
    .line 37
    :pswitch_1
    const/4 v0, 0x1

    .line 38
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :pswitch_2
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :pswitch_3
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw v0

    .line 54
    :pswitch_4
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 55
    .line 56
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0

    .line 64
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    throw v0

    .line 66
    nop

    .line 67
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public isExpired()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

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
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_initial:Z

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
    iget-boolean p0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_responseWrapped:Z

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
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

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
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v2, :cond_1

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq v0, v3, :cond_0

    .line 10
    .line 11
    const/4 v3, 0x3

    .line 12
    if-eq v0, v3, :cond_0

    .line 13
    .line 14
    const/4 v3, 0x4

    .line 15
    if-eq v0, v3, :cond_0

    .line 16
    .line 17
    const/4 v3, 0x5

    .line 18
    if-eq v0, v3, :cond_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return v1

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit p0

    .line 25
    return v2

    .line 26
    :cond_1
    monitor-exit p0

    .line 27
    return v1

    .line 28
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw v0
.end method

.method public onComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_listeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 20
    .line 21
    invoke-interface {v1, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onComplete(Lorg/eclipse/jetty/continuation/Continuation;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public onTimeout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_listeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 20
    .line 21
    invoke-interface {v1, p0}, Lorg/eclipse/jetty/continuation/ContinuationListener;->onTimeout(Lorg/eclipse/jetty/continuation/Continuation;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->removeAttribute(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public resume()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw v0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_0

    .line 20
    :pswitch_0
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :pswitch_1
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->fauxResume()V

    .line 25
    .line 26
    .line 27
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 28
    .line 29
    const/4 v0, 0x6

    .line 30
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :pswitch_2
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :pswitch_3
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 37
    .line 38
    const/4 v0, 0x3

    .line 39
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 40
    .line 41
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :pswitch_4
    iput-boolean v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw v0

    .line 49
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTimeout(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeoutMs:J

    .line 2
    .line 3
    return-void
.end method

.method public suspend()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget v1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 5
    .line 6
    packed-switch v1, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw v1

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_0

    .line 31
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 32
    .line 33
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw v0

    .line 41
    :pswitch_1
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :pswitch_2
    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_timeout:Z

    .line 45
    .line 46
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_resumed:Z

    .line 47
    .line 48
    const/4 v0, 0x2

    .line 49
    iput v0, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_state:I

    .line 50
    .line 51
    monitor-exit p0

    .line 52
    return-void

    .line 53
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw v0

    .line 55
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public suspend(Ll/lse0;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_response:Ll/lse0;

    .line 56
    instance-of p1, p1, Ll/mse0;

    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->_responseWrapped:Z

    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->suspend()V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->getStatusString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public undispatch()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;->isSuspended()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-boolean p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->__debug:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/ContinuationThrowable;-><init>()V

    .line 14
    .line 15
    .line 16
    throw p0

    .line 17
    :cond_0
    sget-object p0, Lorg/eclipse/jetty/continuation/FauxContinuation;->__exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 18
    .line 19
    throw p0

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 21
    .line 22
    const-string v0, "!suspended"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method
