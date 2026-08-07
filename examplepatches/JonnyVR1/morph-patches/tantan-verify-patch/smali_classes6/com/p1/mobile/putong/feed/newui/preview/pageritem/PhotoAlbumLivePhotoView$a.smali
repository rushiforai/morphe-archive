.class public Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    new-instance p3, Landroid/view/Surface;

    .line 4
    .line 5
    invoke-direct {p3, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/Surface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->h(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/lang/Runnable;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    new-instance p1, Landroid/graphics/Matrix;

    .line 21
    .line 22
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->t()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->z()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->f(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->B()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/Surface;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ll/ie80;

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
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->t()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ll/ie80;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ll/ie80;->c()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

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
    if-nez p1, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ll/ie80;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Ll/ie80;->resume()V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method
