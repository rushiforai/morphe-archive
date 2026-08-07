.class Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;
.super Landroid/os/Handler;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HandlerWithFrameSyncControl"
.end annotation


# static fields
.field private static final MSG_SEND_CHOREOGRAPHER_QUIT_SIGNAL:I = 0x0

.field private static final MSG_SEND_DROP_FRAME:I = 0x1

.field private static final MSG_SEND_RENDER_FRAME_SIGNAL:I = 0x2

.field private static final QUEUE_BUFFER:I = 0x3


# instance fields
.field private final exceptionCallback:Ljava/lang/Runnable;

.field private isPreviousFrameDrawn:Z

.field private lastPersionStats:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

.field private mLastFrameTimeNanos:J

.field private final queueLock:Ljava/lang/Object;

.field private final renderFrames:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;",
            ">;"
        }
    .end annotation
.end field

.field private weakRenderer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lio/agora/base/internal/video/EglRenderer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;Ljava/lang/Runnable;Lio/agora/base/internal/video/EglRenderer;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->queueLock:Ljava/lang/Object;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->mLastFrameTimeNanos:J

    .line 14
    .line 15
    sget-object p1, Lio/agora/base/internal/video/EglRenderer$VsyncStats;->NORMAL:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 16
    .line 17
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->lastPersionStats:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 18
    .line 19
    iput-object p2, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->exceptionCallback:Ljava/lang/Runnable;

    .line 20
    .line 21
    new-instance p1, Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 27
    .line 28
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 34
    .line 35
    iput-wide v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->mLastFrameTimeNanos:J

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->isPreviousFrameDrawn:Z

    .line 39
    .line 40
    return-void
.end method

.method private doLut10Frame([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/internal/video/EglRenderer;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "EglRenderer"

    .line 12
    .line 13
    const-string p1, "handleMessage: weak is null"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p0, p1}, Lio/agora/base/internal/video/EglRenderer;->access$3100(Lio/agora/base/internal/video/EglRenderer;[B)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private doRenderFrame(J)V
    .locals 12

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lio/agora/base/internal/video/EglRenderer;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "EglRenderer"

    .line 12
    .line 13
    const-string p1, "handleMessage: weak is null"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1400(Lio/agora/base/internal/video/EglRenderer;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    const-wide/16 v3, 0x0

    .line 24
    .line 25
    cmp-long v1, v1, v3

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_1
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->mLastFrameTimeNanos:J

    .line 31
    .line 32
    cmp-long v1, v1, v3

    .line 33
    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->mLastFrameTimeNanos:J

    .line 37
    .line 38
    :cond_2
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->mLastFrameTimeNanos:J

    .line 39
    .line 40
    sub-long v10, p1, v1

    .line 41
    .line 42
    iput-wide p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->mLastFrameTimeNanos:J

    .line 43
    .line 44
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1400(Lio/agora/base/internal/video/EglRenderer;)J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1400(Lio/agora/base/internal/video/EglRenderer;)J

    .line 49
    .line 50
    .line 51
    move-result-wide v5

    .line 52
    const-wide/16 v7, 0x2

    .line 53
    .line 54
    div-long/2addr v5, v7

    .line 55
    add-long/2addr v1, v5

    .line 56
    cmp-long v1, v10, v1

    .line 57
    .line 58
    if-ltz v1, :cond_3

    .line 59
    .line 60
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1400(Lio/agora/base/internal/video/EglRenderer;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    div-long v3, v10, v1

    .line 65
    .line 66
    sget-object v1, Lio/agora/base/internal/video/EglRenderer$VsyncStats;->DELAY:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 67
    .line 68
    iput-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->lastPersionStats:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 69
    .line 70
    :goto_0
    move-wide v8, v3

    .line 71
    goto :goto_1

    .line 72
    :cond_3
    sget-object v1, Lio/agora/base/internal/video/EglRenderer$VsyncStats;->NORMAL:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 73
    .line 74
    iput-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->lastPersionStats:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :goto_1
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$200(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    iget-object v6, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->lastPersionStats:Lio/agora/base/internal/video/EglRenderer$VsyncStats;

    .line 82
    .line 83
    iget-boolean v7, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->isPreviousFrameDrawn:Z

    .line 84
    .line 85
    invoke-static/range {v5 .. v11}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->access$2900(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;Lio/agora/base/internal/video/EglRenderer$VsyncStats;ZJJ)V

    .line 86
    .line 87
    .line 88
    const/4 v1, 0x0

    .line 89
    iput-boolean v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->isPreviousFrameDrawn:Z

    .line 90
    .line 91
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->queueLock:Ljava/lang/Object;

    .line 92
    .line 93
    monitor-enter v1

    .line 94
    :try_start_0
    iget-object v2, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 95
    .line 96
    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;

    .line 101
    .line 102
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    if-nez v2, :cond_4

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_4
    const/4 v1, 0x1

    .line 107
    iput-boolean v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->isPreviousFrameDrawn:Z

    .line 108
    .line 109
    invoke-static {v0, v2, p1, p2}, Lio/agora/base/internal/video/EglRenderer;->access$3000(Lio/agora/base/internal/video/EglRenderer;Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;J)V

    .line 110
    .line 111
    .line 112
    iget-object p0, v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 113
    .line 114
    invoke-virtual {p0}, Lio/agora/base/VideoFrame;->getAlphaBuffer()Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    if-eqz p0, :cond_5

    .line 119
    .line 120
    iget-object p0, v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 121
    .line 122
    invoke-virtual {p0}, Lio/agora/base/VideoFrame;->releaseAlphaBuffer()V

    .line 123
    .line 124
    .line 125
    :cond_5
    :goto_2
    return-void

    .line 126
    :catchall_0
    move-exception v0

    .line 127
    move-object p0, v0

    .line 128
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    throw p0
.end method

.method private stopChoreographer()V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->queueLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;

    .line 21
    .line 22
    iget-object v3, v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 23
    .line 24
    invoke-virtual {v3}, Lio/agora/base/VideoFrame;->release()V

    .line 25
    .line 26
    .line 27
    iget-object v3, v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 28
    .line 29
    invoke-virtual {v3}, Lio/agora/base/VideoFrame;->getAlphaBuffer()Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v2, v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 36
    .line 37
    invoke-virtual {v2}, Lio/agora/base/VideoFrame;->releaseAlphaBuffer()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lio/agora/base/internal/video/EglRenderer;

    .line 55
    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    const-string p0, "EglRenderer"

    .line 59
    .line 60
    const-string v1, "handleMessage: weak is null"

    .line 61
    .line 62
    invoke-static {p0, v1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    monitor-exit v0

    .line 66
    return-void

    .line 67
    :cond_2
    invoke-static {v1}, Lio/agora/base/internal/video/EglRenderer;->access$2800(Lio/agora/base/internal/video/EglRenderer;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    monitor-exit v0

    .line 81
    return-void

    .line 82
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    throw p0
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p1

    .line 6
    const-string v0, "EglRenderer"

    .line 7
    .line 8
    const-string v1, "Exception on EglRenderer thread"

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->exceptionCallback:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public doFrame(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lio/agora/base/internal/video/EglRenderer;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "EglRenderer"

    .line 12
    .line 13
    const-string p1, "doFrame: weak is null"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$2600(Lio/agora/base/internal/video/EglRenderer;)Z

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$2602(Lio/agora/base/internal/video/EglRenderer;Z)Z

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/Long;

    .line 27
    .line 28
    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x2

    .line 32
    invoke-virtual {p0, p1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 37
    .line 38
    .line 39
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lio/agora/base/internal/video/EglRenderer;

    .line 8
    .line 9
    const-string v1, "EglRenderer"

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "handleMessage: weak is null"

    .line 14
    .line 15
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget v2, p1, Landroid/os/Message;->what:I

    .line 20
    .line 21
    if-eqz v2, :cond_5

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    if-eq v2, v3, :cond_3

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    if-eq v2, v0, :cond_1

    .line 28
    .line 29
    :try_start_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v0, "setRepeatingRequest failed, error message : "

    .line 37
    .line 38
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    check-cast p1, Ljava/lang/Long;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    :cond_2
    invoke-direct {p0, v0, v1}, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->doRenderFrame(J)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p0, v0, Lio/agora/base/internal/video/EglRenderer;->rendererEvents:Lio/agora/base/internal/video/RendererCommon$RendererEvents;

    .line 75
    .line 76
    if-eqz p0, :cond_4

    .line 77
    .line 78
    invoke-interface {p0}, Lio/agora/base/internal/video/RendererCommon$RendererEvents;->onFrameDropped()V

    .line 79
    .line 80
    .line 81
    :cond_4
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$200(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {p0}, Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;->access$2700(Lio/agora/base/internal/video/EglRenderer$StatisticsInfo;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_5
    invoke-direct {p0}, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->stopChoreographer()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public sendFrameToRenderThread(JLio/agora/base/VideoFrame;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->queueLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p3}, Lio/agora/base/VideoFrame;->retain()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x3

    .line 14
    if-lt v1, v2, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v2, v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 27
    .line 28
    invoke-virtual {v2}, Lio/agora/base/VideoFrame;->release()V

    .line 29
    .line 30
    .line 31
    iget-object v2, v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 32
    .line 33
    invoke-virtual {v2}, Lio/agora/base/VideoFrame;->getAlphaBuffer()Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    iget-object v1, v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 40
    .line 41
    invoke-virtual {v1}, Lio/agora/base/VideoFrame;->releaseAlphaBuffer()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    :goto_0
    const/4 v1, 0x1

    .line 48
    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 53
    .line 54
    .line 55
    :cond_1
    new-instance v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;

    .line 56
    .line 57
    invoke-direct {v1, p3, p1, p2}, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;-><init>(Lio/agora/base/VideoFrame;J)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 61
    .line 62
    invoke-interface {p1, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    const-string p1, "EglRenderer"

    .line 69
    .line 70
    const-string p2, "offer error "

    .line 71
    .line 72
    invoke-static {p1, p2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    iget-object p1, v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 77
    .line 78
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getAlphaBuffer()Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    iget-object p1, v1, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 85
    .line 86
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->retainAlphaBuffer()V

    .line 87
    .line 88
    .line 89
    :cond_3
    :goto_1
    iget-object p1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lio/agora/base/internal/video/EglRenderer;

    .line 96
    .line 97
    if-eqz p1, :cond_4

    .line 98
    .line 99
    invoke-static {p1}, Lio/agora/base/internal/video/EglRenderer;->access$2600(Lio/agora/base/internal/video/EglRenderer;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_4

    .line 104
    .line 105
    const/4 p1, 0x2

    .line 106
    invoke-virtual {p0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 111
    .line 112
    .line 113
    :cond_4
    monitor-exit v0

    .line 114
    return-void

    .line 115
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    throw p0
.end method

.method public sendLastFrameToRenderThread(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->weakRenderer:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lio/agora/base/internal/video/EglRenderer;

    .line 8
    .line 9
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->queueLock:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    invoke-static {}, Lio/agora/base/internal/video/EglRenderer;->access$2400()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    new-instance v2, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;

    .line 21
    .line 22
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$2500(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/VideoFrame;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {v2, v0, p1, p2}, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;-><init>(Lio/agora/base/VideoFrame;J)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lio/agora/base/internal/video/EglRenderer$HandlerWithFrameSyncControl;->renderFrames:Ljava/util/Queue;

    .line 30
    .line 31
    invoke-interface {p0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    const-string p0, "EglRenderer"

    .line 38
    .line 39
    const-string p1, "sendLastFrameToRenderThread offer error "

    .line 40
    .line 41
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    monitor-exit v1

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method

.method public sendStopChoreographer()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method
