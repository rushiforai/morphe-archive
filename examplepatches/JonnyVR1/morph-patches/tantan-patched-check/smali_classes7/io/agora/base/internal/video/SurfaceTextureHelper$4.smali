.class Lio/agora/base/internal/video/SurfaceTextureHelper$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/SurfaceTextureHelper;-><init>(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;II)V
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
    iput-object p1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$4;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$4;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$302(Lio/agora/base/internal/video/SurfaceTextureHelper;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$4;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 8
    .line 9
    invoke-static {p0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$1000(Lio/agora/base/internal/video/SurfaceTextureHelper;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
