.class public Lcom/p1/mobile/putong/feed/ui/PlayerView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/ui/PlayerView;->C()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/PlayerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 2
    .line 3
    new-instance p3, Landroid/view/Surface;

    .line 4
    .line 5
    invoke-direct {p3, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->s(Lcom/p1/mobile/putong/feed/ui/PlayerView;Landroid/view/Surface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->o(Lcom/p1/mobile/putong/feed/ui/PlayerView;)Ljava/lang/Runnable;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->g(Lcom/p1/mobile/putong/feed/ui/PlayerView;)Ljava/lang/Runnable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->g(Lcom/p1/mobile/putong/feed/ui/PlayerView;)Ljava/lang/Runnable;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    new-instance p1, Landroid/graphics/Matrix;

    .line 42
    .line 43
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 47
    .line 48
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/ui/PlayerView;->a:Landroid/view/TextureView;

    .line 49
    .line 50
    invoke-virtual {p2, p1}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/ui/PlayerView;->a:Landroid/view/TextureView;

    .line 56
    .line 57
    invoke-virtual {p2, p1}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->s(Lcom/p1/mobile/putong/feed/ui/PlayerView;Landroid/view/Surface;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->j(Lcom/p1/mobile/putong/feed/ui/PlayerView;)Ll/ie80;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->j(Lcom/p1/mobile/putong/feed/ui/PlayerView;)Ll/ie80;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ll/ie80;->c()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    const/high16 v0, 0x3f800000    # 1.0f

    .line 39
    .line 40
    cmpl-float p1, p1, v0

    .line 41
    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    cmpl-float p1, p1, v0

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView$a;->a:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->j(Lcom/p1/mobile/putong/feed/ui/PlayerView;)Ll/ie80;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Ll/ie80;->resume()V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method
