.class public Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->h(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 2
    .line 3
    new-instance p3, Landroid/view/Surface;

    .line 4
    .line 5
    invoke-direct {p3, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->e(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Landroid/view/Surface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->d(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)Ljava/lang/Runnable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->d(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)Ljava/lang/Runnable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->f(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView$a;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->e(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Landroid/view/Surface;)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method
