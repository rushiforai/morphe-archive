.class Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->returnTextureFrame()V
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
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

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
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$602(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 8
    .line 9
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$700(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 16
    .line 17
    invoke-static {v0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1400(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)Lio/agora/base/internal/video/TextureBufferPool;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lio/agora/base/internal/video/TextureBufferPool;->anyTextureInUse()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$14;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 28
    .line 29
    invoke-static {p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1500(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
