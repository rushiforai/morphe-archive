.class Ltech/sud/base/utils/SudCustomCountdownTimer$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/base/utils/SudCustomCountdownTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ltech/sud/base/utils/SudCustomCountdownTimer;


# direct methods
.method public constructor <init>(Ltech/sud/base/utils/SudCustomCountdownTimer;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/base/utils/SudCustomCountdownTimer$1;->this$0:Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ltech/sud/base/utils/SudCustomCountdownTimer$1;->this$0:Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 5
    .line 6
    monitor-enter p1

    .line 7
    :try_start_0
    iget-object v0, p0, Ltech/sud/base/utils/SudCustomCountdownTimer$1;->this$0:Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 8
    .line 9
    invoke-static {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->a(Ltech/sud/base/utils/SudCustomCountdownTimer;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    monitor-exit p1

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-static {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->d(Ltech/sud/base/utils/SudCustomCountdownTimer;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    add-int/lit8 v1, v1, -0x1

    .line 24
    .line 25
    invoke-static {v0, v1}, Ltech/sud/base/utils/SudCustomCountdownTimer;->f(Ltech/sud/base/utils/SudCustomCountdownTimer;I)V

    .line 26
    .line 27
    .line 28
    if-gtz v1, :cond_1

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    invoke-static {v0, p0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->e(Ltech/sud/base/utils/SudCustomCountdownTimer;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->onFinish()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-static {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->b(Ltech/sud/base/utils/SudCustomCountdownTimer;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 43
    .line 44
    .line 45
    move-result-wide v2

    .line 46
    iget-object v4, p0, Ltech/sud/base/utils/SudCustomCountdownTimer$1;->this$0:Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 47
    .line 48
    invoke-static {v4}, Ltech/sud/base/utils/SudCustomCountdownTimer;->d(Ltech/sud/base/utils/SudCustomCountdownTimer;)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    int-to-long v5, v5

    .line 53
    invoke-static {v4}, Ltech/sud/base/utils/SudCustomCountdownTimer;->b(Ltech/sud/base/utils/SudCustomCountdownTimer;)J

    .line 54
    .line 55
    .line 56
    move-result-wide v7

    .line 57
    mul-long/2addr v5, v7

    .line 58
    add-long/2addr v5, v2

    .line 59
    invoke-static {v4}, Ltech/sud/base/utils/SudCustomCountdownTimer;->c(Ltech/sud/base/utils/SudCustomCountdownTimer;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v9

    .line 63
    sub-long/2addr v5, v9

    .line 64
    const-wide/16 v11, 0x3e8

    .line 65
    .line 66
    cmp-long v5, v5, v11

    .line 67
    .line 68
    if-lez v5, :cond_2

    .line 69
    .line 70
    sub-long/2addr v9, v2

    .line 71
    div-long v2, v9, v7

    .line 72
    .line 73
    long-to-int v2, v2

    .line 74
    invoke-static {v4, v2}, Ltech/sud/base/utils/SudCustomCountdownTimer;->f(Ltech/sud/base/utils/SudCustomCountdownTimer;I)V

    .line 75
    .line 76
    .line 77
    rem-long/2addr v9, v7

    .line 78
    add-long/2addr v0, v9

    .line 79
    :cond_2
    invoke-static {v4}, Ltech/sud/base/utils/SudCustomCountdownTimer;->d(Ltech/sud/base/utils/SudCustomCountdownTimer;)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v4, v2}, Ltech/sud/base/utils/SudCustomCountdownTimer;->onTick(I)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ltech/sud/base/utils/SudCustomCountdownTimer;->g()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {p0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {p0, v2, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 95
    .line 96
    .line 97
    :goto_0
    monitor-exit p1

    .line 98
    return-void

    .line 99
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    throw p0
.end method
