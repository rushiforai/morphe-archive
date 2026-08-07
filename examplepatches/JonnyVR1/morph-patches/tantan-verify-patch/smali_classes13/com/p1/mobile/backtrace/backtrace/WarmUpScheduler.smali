.class public Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;
    }
.end annotation


# static fields
.field static final DELAY_CLEAN_UP:J = 0xbb8L

.field static final DELAY_CONSUME_REQ_QUT:J = 0xbb8L

.field static final DELAY_SHORTLY:J = 0xbb8L

.field static final DELAY_WARM_UP:J = 0xbb8L

.field private static final MSG_CLEAN_UP:I = 0x3

.field private static final MSG_COMPUTE_DISK_USAGE:I = 0x4

.field private static final MSG_CONSUME_REQ_QUT:I = 0x2

.field private static final MSG_WARM_UP:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Matrix.WarmUpScheduler"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

.field private mHandler:Landroid/os/Handler;

.field private mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

.field private mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

.field private mWarmUpDelay:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    new-instance p1, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p1, v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 24
    .line 25
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mContext:Landroid/content/Context;

    .line 26
    .line 27
    iput-object p3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 28
    .line 29
    const-wide/16 p1, 0xbb8

    .line 30
    .line 31
    invoke-static {p4, p5, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    iput-wide p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 36
    .line 37
    return-void
.end method

.method private arrangeTaskDirectly(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$2;->$SwitchMap$com$p1$mobile$backtrace$backtrace$WarmUpScheduler$TaskType:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const-wide/16 v0, 0x3e8

    .line 10
    .line 11
    const-string v2, "Matrix.WarmUpScheduler"

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-eq p1, v3, :cond_2

    .line 15
    .line 16
    const/4 v3, 0x3

    .line 17
    const/4 v4, 0x2

    .line 18
    if-eq p1, v4, :cond_1

    .line 19
    .line 20
    if-eq p1, v3, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-wide v5, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 24
    .line 25
    div-long/2addr v5, v0

    .line 26
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "Schedule request consuming in %ss"

    .line 35
    .line 36
    invoke-static {v2, v0, p1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 40
    .line 41
    new-instance v0, Landroid/os/CancellationSignal;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v4, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 51
    .line 52
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-wide v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 57
    .line 58
    div-long/2addr v4, v0

    .line 59
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string v0, "Schedule clean-up in %ss"

    .line 68
    .line 69
    invoke-static {v2, v0, p1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 73
    .line 74
    new-instance v0, Landroid/os/CancellationSignal;

    .line 75
    .line 76
    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {p1, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-wide v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 84
    .line 85
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    iget-wide v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 90
    .line 91
    div-long/2addr v4, v0

    .line 92
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    const-string v0, "Schedule warm-up in %ss"

    .line 101
    .line 102
    invoke-static {v2, v0, p1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 106
    .line 107
    new-instance v0, Landroid/os/CancellationSignal;

    .line 108
    .line 109
    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {p1, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-wide v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 117
    .line 118
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method private declared-synchronized arrangeTaskToIdleReceiver(Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 11
    .line 12
    iget-wide v5, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mWarmUpDelay:J

    .line 13
    .line 14
    move-object v2, p1

    .line 15
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;J)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 19
    .line 20
    invoke-virtual {v1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->arrange(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 21
    .line 22
    .line 23
    const-string p1, "Matrix.WarmUpScheduler"

    .line 24
    .line 25
    const-string p2, "Register idle receiver."

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    new-array v0, v0, [Ljava/lang/Object;

    .line 29
    .line 30
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Landroid/content/IntentFilter;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string p2, "android.intent.action.SCREEN_ON"

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string p2, "android.intent.action.SCREEN_OFF"

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string p2, "android.intent.action.ACTION_POWER_CONNECTED"

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string p2, "android.intent.action.ACTION_POWER_DISCONNECTED"

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 59
    .line 60
    invoke-static {v2, p2, p1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->refreshIdleStatus(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    monitor-exit p0

    .line 69
    return-void

    .line 70
    :catchall_0
    move-exception v0

    .line 71
    move-object p1, v0

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    :try_start_1
    invoke-virtual {v0, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->arrange(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    .line 75
    .line 76
    monitor-exit p0

    .line 77
    return-void

    .line 78
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    throw p1
.end method

.method private declared-synchronized finishTaskToIdleReceiver(Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->finish(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    const-string p2, "Matrix.WarmUpScheduler"

    .line 13
    .line 14
    const-string v0, "Unregister idle receiver."

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    new-array v1, v1, [Ljava/lang/Object;

    .line 18
    .line 19
    invoke-static {p2, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mIdleReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Landroid/os/CancellationSignal;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->computeDiskUsage(Landroid/os/CancellationSignal;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Landroid/os/CancellationSignal;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->cleaningUp(Landroid/os/CancellationSignal;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p1, Landroid/os/CancellationSignal;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->consumingRequestedQut(Landroid/os/CancellationSignal;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p1, Landroid/os/CancellationSignal;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->warmingUp(Landroid/os/CancellationSignal;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public scheduleTask(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public scheduleTaskImpl(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$2;->$SwitchMap$com$p1$mobile$backtrace$backtrace$WeChatBacktrace$WarmUpTiming:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mContext:Landroid/content/Context;

    .line 22
    .line 23
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->arrangeTaskToIdleReceiver(Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->arrangeTaskDirectly(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$2;->$SwitchMap$com$p1$mobile$backtrace$backtrace$WeChatBacktrace$WarmUpTiming:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->mContext:Landroid/content/Context;

    .line 19
    .line 20
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->finishTaskToIdleReceiver(Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
