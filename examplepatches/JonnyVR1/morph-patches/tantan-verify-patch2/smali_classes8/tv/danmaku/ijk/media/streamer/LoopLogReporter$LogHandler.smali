.class Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/LoopLogReporter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LogHandler"
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/LoopLogReporter;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;->a:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

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
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;->a:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 5
    .line 6
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->a(Ltv/danmaku/ijk/media/streamer/LoopLogReporter;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;->a:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 13
    .line 14
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->b(Ltv/danmaku/ijk/media/streamer/LoopLogReporter;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    .line 22
    .line 23
    const/16 v0, 0x5a

    .line 24
    .line 25
    if-ne p1, v0, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;->a:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 28
    .line 29
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter$LogHandler;->a:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 36
    .line 37
    iget p1, p1, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->a:I

    .line 38
    .line 39
    int-to-long v1, p1

    .line 40
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-void
.end method
