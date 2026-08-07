.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ThreadTaskExecutor"
.end annotation


# static fields
.field private static final BLOCKED_CHECK_INTERVAL:J = 0x493e0L

.field private static final MSG_BLOCKED_CHECK:I = 0x1


# instance fields
.field private mBlockedChecker:Landroid/os/Handler;

.field private mRunnableTasks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mTaskQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mTaskStartTS:[J

.field private mThreadBlocked:Z

.field private mThreadExecutor:Ljava/lang/Thread;

.field private mThreadName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mRunnableTasks:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskQueue:Ljava/util/Queue;

    .line 17
    .line 18
    new-instance v0, Landroid/os/Handler;

    .line 19
    .line 20
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mBlockedChecker:Landroid/os/Handler;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadBlocked:Z

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    new-array v1, v1, [J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    aput-wide v2, v1, v0

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadName:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public arrangeTask(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskQueue:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskQueue:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {v1, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_2

    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskQueue:Ljava/util/Queue;

    .line 17
    .line 18
    invoke-interface {v1, p2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mRunnableTasks:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    monitor-enter p0

    .line 28
    :try_start_1
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadExecutor:Ljava/lang/Thread;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_1
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/Thread;

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadName:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {p1, p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadExecutor:Ljava/lang/Thread;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mBlockedChecker:Landroid/os/Handler;

    .line 54
    .line 55
    const/4 p2, 0x1

    .line 56
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mBlockedChecker:Landroid/os/Handler;

    .line 60
    .line 61
    const-wide/32 v0, 0x493e0

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 65
    .line 66
    .line 67
    :cond_2
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 70
    throw p1

    .line 71
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    throw p0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 7

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ne p1, v1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 8
    .line 9
    monitor-enter p1

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 11
    .line 12
    aget-wide v3, v2, v0

    .line 13
    .line 14
    const-wide/16 v5, 0x0

    .line 15
    .line 16
    cmp-long v2, v3, v5

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    monitor-exit p1

    .line 21
    return v0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iput-boolean v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadBlocked:Z

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->WarmUpThreadBlocked:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 32
    .line 33
    new-array v1, v0, [Ljava/lang/Object;

    .line 34
    .line 35
    invoke-interface {p0, p1, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p0

    .line 41
    :cond_1
    :goto_1
    return v0
.end method

.method public isThreadBlocked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadBlocked:Z

    .line 2
    .line 3
    return p0
.end method

.method public run()V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mThreadBlocked:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 5
    .line 6
    monitor-enter v1

    .line 7
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    aput-wide v3, v2, v0

    .line 14
    .line 15
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 16
    const/4 v1, 0x0

    .line 17
    move-object v2, v1

    .line 18
    :goto_0
    const/4 v3, 0x1

    .line 19
    const-wide/16 v4, 0x0

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v6

    .line 27
    const-string v8, "Matrix.WarmUpDelegate"

    .line 28
    .line 29
    const-string v9, "Before \'%s\' task execution.."

    .line 30
    .line 31
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v10

    .line 35
    invoke-static {v8, v9, v10}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 39
    .line 40
    .line 41
    const-string v1, "Matrix.WarmUpDelegate"

    .line 42
    .line 43
    const-string v8, "After \'%s\' task execution.."

    .line 44
    .line 45
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    invoke-static {v1, v8, v9}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v8

    .line 56
    sub-long/2addr v8, v6

    .line 57
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    const-string v6, "warm-up"

    .line 62
    .line 63
    invoke-virtual {v6, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    if-eqz v6, :cond_0

    .line 68
    .line 69
    sget-object v2, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->WarmUpDuration:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 70
    .line 71
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    invoke-interface {v1, v2, v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catchall_0
    move-exception v1

    .line 84
    goto :goto_4

    .line 85
    :cond_0
    const-string v6, "consuming-up"

    .line 86
    .line 87
    invoke-virtual {v6, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_1

    .line 92
    .line 93
    sget-object v2, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->ConsumeRequestDuration:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 94
    .line 95
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    invoke-interface {v1, v2, v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskQueue:Ljava/util/Queue;

    .line 107
    .line 108
    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    :try_start_2
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskQueue:Ljava/util/Queue;

    .line 110
    .line 111
    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Ljava/lang/String;

    .line 116
    .line 117
    if-nez v2, :cond_2

    .line 118
    .line 119
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 120
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 121
    .line 122
    monitor-enter v2

    .line 123
    :try_start_3
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 124
    .line 125
    aput-wide v4, v1, v0

    .line 126
    .line 127
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 128
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mBlockedChecker:Landroid/os/Handler;

    .line 129
    .line 130
    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :catchall_1
    move-exception p0

    .line 135
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 136
    throw p0

    .line 137
    :catchall_2
    move-exception v2

    .line 138
    goto :goto_3

    .line 139
    :cond_2
    :try_start_5
    iget-object v6, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mRunnableTasks:Ljava/util/HashMap;

    .line 140
    .line 141
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    check-cast v6, Ljava/lang/Runnable;

    .line 146
    .line 147
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 148
    if-nez v6, :cond_3

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 151
    .line 152
    monitor-enter v1

    .line 153
    :try_start_6
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 154
    .line 155
    aput-wide v4, v2, v0

    .line 156
    .line 157
    monitor-exit v1

    .line 158
    goto :goto_2

    .line 159
    :catchall_3
    move-exception p0

    .line 160
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 161
    throw p0

    .line 162
    :cond_3
    move-object v1, v6

    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :goto_3
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 166
    :try_start_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 167
    :goto_4
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 168
    .line 169
    monitor-enter v2

    .line 170
    :try_start_9
    iget-object v6, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mTaskStartTS:[J

    .line 171
    .line 172
    aput-wide v4, v6, v0

    .line 173
    .line 174
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 175
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->mBlockedChecker:Landroid/os/Handler;

    .line 176
    .line 177
    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 178
    .line 179
    .line 180
    throw v1

    .line 181
    :catchall_4
    move-exception p0

    .line 182
    :try_start_a
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 183
    throw p0

    .line 184
    :catchall_5
    move-exception p0

    .line 185
    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 186
    throw p0
.end method
