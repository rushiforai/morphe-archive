.class Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;
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
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

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
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Setting listener to "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 9
    .line 10
    invoke-static {v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoSink;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "TSurfaceTextureHelper"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 27
    .line 28
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$100(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/VideoSink;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$202(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Lio/agora/base/internal/video/VideoSink;)Lio/agora/base/internal/video/VideoSink;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {v0, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$102(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Lio/agora/base/internal/video/VideoSink;)Lio/agora/base/internal/video/VideoSink;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 42
    .line 43
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$300(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 50
    .line 51
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$400(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$2;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-static {p0, v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$302(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Z)Z

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method
