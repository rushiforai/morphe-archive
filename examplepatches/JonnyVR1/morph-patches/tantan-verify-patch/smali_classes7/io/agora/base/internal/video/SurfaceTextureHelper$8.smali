.class Lio/agora/base/internal/video/SurfaceTextureHelper$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/SurfaceTextureHelper;->returnTextureFrame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$8;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

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
    iget-object v0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$8;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$602(Lio/agora/base/internal/video/SurfaceTextureHelper;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$8;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 8
    .line 9
    invoke-static {v0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$500(Lio/agora/base/internal/video/SurfaceTextureHelper;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$8;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$700(Lio/agora/base/internal/video/SurfaceTextureHelper;)Lio/agora/base/internal/video/TextureBufferPool;

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
    iget-object p0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$8;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 28
    .line 29
    invoke-static {p0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/SurfaceTextureHelper;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    invoke-static {v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$1000(Lio/agora/base/internal/video/SurfaceTextureHelper;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
