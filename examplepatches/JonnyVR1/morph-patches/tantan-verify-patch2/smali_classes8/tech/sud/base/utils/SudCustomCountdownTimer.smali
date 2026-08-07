.class public abstract Ltech/sud/base/utils/SudCustomCountdownTimer;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static MSG:I = 0x1


# instance fields
.field private isRunning:Z

.field private mCountdownInterval:J

.field private final mHandler:Landroid/os/Handler;

.field private mStopTimeInFuture:J

.field private mTotalCount:I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    const-wide/16 v0, 0x3e8

    .line 23
    invoke-direct {p0, p1, v0, v1}, Ltech/sud/base/utils/SudCustomCountdownTimer;-><init>(IJ)V

    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->isRunning:Z

    .line 6
    .line 7
    new-instance v0, Ltech/sud/base/utils/SudCustomCountdownTimer$1;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, p0, v1}, Ltech/sud/base/utils/SudCustomCountdownTimer$1;-><init>(Ltech/sud/base/utils/SudCustomCountdownTimer;Landroid/os/Looper;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mHandler:Landroid/os/Handler;

    .line 17
    .line 18
    iput p1, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mTotalCount:I

    .line 19
    .line 20
    iput-wide p2, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mCountdownInterval:J

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic a(Ltech/sud/base/utils/SudCustomCountdownTimer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->isRunning:Z

    return p0
.end method

.method public static bridge synthetic b(Ltech/sud/base/utils/SudCustomCountdownTimer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mCountdownInterval:J

    return-wide v0
.end method

.method public static bridge synthetic c(Ltech/sud/base/utils/SudCustomCountdownTimer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mStopTimeInFuture:J

    return-wide v0
.end method

.method public static bridge synthetic d(Ltech/sud/base/utils/SudCustomCountdownTimer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mTotalCount:I

    return p0
.end method

.method public static bridge synthetic e(Ltech/sud/base/utils/SudCustomCountdownTimer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->isRunning:Z

    return-void
.end method

.method public static bridge synthetic f(Ltech/sud/base/utils/SudCustomCountdownTimer;I)V
    .locals 0

    .line 1
    iput p1, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mTotalCount:I

    return-void
.end method

.method public static bridge synthetic g()I
    .locals 1

    .line 1
    sget v0, Ltech/sud/base/utils/SudCustomCountdownTimer;->MSG:I

    return v0
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->isRunning:Z

    .line 4
    .line 5
    iget-object v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mHandler:Landroid/os/Handler;

    .line 6
    .line 7
    sget v1, Ltech/sud/base/utils/SudCustomCountdownTimer;->MSG:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method public getCurrentCount()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mTotalCount:I

    .line 2
    .line 3
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->isRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method public abstract onFinish()V
.end method

.method public abstract onTick(I)V
.end method

.method public declared-synchronized start()Ltech/sud/base/utils/SudCustomCountdownTimer;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->isRunning:Z

    .line 4
    .line 5
    iget v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mTotalCount:I

    .line 6
    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mCountdownInterval:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iget v2, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mTotalCount:I

    .line 23
    .line 24
    int-to-long v3, v2

    .line 25
    iget-wide v5, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mCountdownInterval:J

    .line 26
    .line 27
    mul-long/2addr v3, v5

    .line 28
    add-long/2addr v3, v0

    .line 29
    iput-wide v3, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mStopTimeInFuture:J

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Ltech/sud/base/utils/SudCustomCountdownTimer;->onTick(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mHandler:Landroid/os/Handler;

    .line 35
    .line 36
    sget v1, Ltech/sud/base/utils/SudCustomCountdownTimer;->MSG:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mHandler:Landroid/os/Handler;

    .line 42
    .line 43
    sget v1, Ltech/sud/base/utils/SudCustomCountdownTimer;->MSG:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-wide v2, p0, Ltech/sud/base/utils/SudCustomCountdownTimer;->mCountdownInterval:J

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    .line 54
    monitor-exit p0

    .line 55
    return-object p0

    .line 56
    :catchall_0
    move-exception v0

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->onFinish()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    .line 60
    .line 61
    monitor-exit p0

    .line 62
    return-object p0

    .line 63
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    throw v0
.end method
