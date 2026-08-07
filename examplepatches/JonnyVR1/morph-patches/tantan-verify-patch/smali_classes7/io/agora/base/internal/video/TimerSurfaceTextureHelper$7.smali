.class Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/TimerSurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$600(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 10
    .line 11
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$700(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 18
    .line 19
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$200(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoSink;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 26
    .line 27
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->updateIncomingFramerate()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 35
    .line 36
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoDecimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoDecimator;->dropFrame()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    const-string p0, "TSurfaceTextureHelper"

    .line 47
    .line 48
    const-string v0, "smoothDecimator dropFrame."

    .line 49
    .line 50
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 55
    .line 56
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$900(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Landroid/os/Handler;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 61
    .line 62
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->timerNotifyRunnable:Ljava/lang/Runnable;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method
