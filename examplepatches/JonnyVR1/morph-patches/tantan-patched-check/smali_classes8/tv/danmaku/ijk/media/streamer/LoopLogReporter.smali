.class public abstract Ltv/danmaku/ijk/media/streamer/LoopLogReporter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;
    }
.end annotation


# instance fields
.field protected a:I

.field private b:I

.field private c:Z

.field private d:Z

.field protected e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field f:Landroid/os/HandlerThread;

.field g:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e8

    .line 5
    .line 6
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->a:I

    .line 7
    .line 8
    const/16 v0, 0x1e

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->b:I

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->d:Z

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e:Ljava/util/ArrayList;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->f:Landroid/os/HandlerThread;

    .line 26
    .line 27
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g:Landroid/os/Handler;

    .line 28
    .line 29
    new-instance v0, Landroid/os/HandlerThread;

    .line 30
    .line 31
    const-string v1, "loopReportCmdHandle"

    .line 32
    .line 33
    const/4 v2, -0x4

    .line 34
    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->f:Landroid/os/HandlerThread;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->f:Landroid/os/HandlerThread;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;

    .line 49
    .line 50
    invoke-direct {v1, p0, v0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;-><init>(Ltv/danmaku/ijk/media/streamer/LoopLogReporter;Landroid/os/Looper;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g:Landroid/os/Handler;

    .line 54
    .line 55
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/LoopLogReporter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/LoopLogReporter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->d:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->b:I

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->d()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public abstract d()V
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g:Landroid/os/Handler;

    .line 6
    .line 7
    const/16 p1, 0x5a

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public f(I)V
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public g(I)V
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->b:I

    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->d:Z

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g:Landroid/os/Handler;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g:Landroid/os/Handler;

    .line 16
    .line 17
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->a:I

    .line 18
    .line 19
    int-to-long v1, p0

    .line 20
    const/16 p0, 0x5a

    .line 21
    .line 22
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->d:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g:Landroid/os/Handler;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->f:Landroid/os/HandlerThread;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->d()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
