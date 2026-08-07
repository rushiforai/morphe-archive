.class public Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;
    }
.end annotation


# instance fields
.field public a:Landroid/view/TextureView;

.field public b:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public c:Lv/VLinear;

.field public d:Lv/VProgressBar;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VProgressBar;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

.field public final j:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/ie80$b;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroid/view/Surface;

.field public l:Lcom/p1/mobile/putong/data/Video;

.field public m:Z

.field public n:Ll/ie80;

.field public o:Z

.field public p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

.field public q:Ljava/lang/Runnable;

.field public r:Ll/y3h;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j:Ljava/util/Set;

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$c;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->r:Ll/y3h;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->s()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 31
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j:Ljava/util/Set;

    .line 32
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->r:Ll/y3h;

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->s()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->v(Landroid/view/View;FF)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->w()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->u()V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j:Ljava/util/Set;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ll/ie80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m:Z

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->o:Z

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->q:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k:Landroid/view/Surface;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m:Z

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->r(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final A(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->q:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/fi70;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/fi70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->q:Ljava/lang/Runnable;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->q:Ljava/lang/Runnable;

    .line 21
    .line 22
    const-wide/16 v1, 0x2710

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m:Z

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k:Landroid/view/Surface;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 57
    .line 58
    invoke-interface {v0, p0, p1}, Ll/ie80;->d(Ll/ie80$a;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->c()V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->q:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public getDragBackListener()Ll/y3h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->r:Ll/y3h;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gi70;->b(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o(Ll/ie80$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->p()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-interface {p0, p1}, Ll/ie80;->f(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v0, :cond_5

    .line 10
    .line 11
    if-lez v1, :cond_5

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget-object v3, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 35
    .line 36
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 37
    .line 38
    if-lez v3, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 44
    .line 45
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 54
    .line 55
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 56
    .line 57
    if-lez v3, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 61
    .line 62
    const/16 v3, 0x168

    .line 63
    .line 64
    const/16 v4, 0x280

    .line 65
    .line 66
    invoke-direct {v2, v3, v4}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 70
    .line 71
    int-to-float v3, v3

    .line 72
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 73
    .line 74
    int-to-float v2, v2

    .line 75
    div-float/2addr v3, v2

    .line 76
    int-to-float v2, v0

    .line 77
    int-to-float v4, v1

    .line 78
    div-float v5, v2, v4

    .line 79
    .line 80
    cmpl-float v5, v5, v3

    .line 81
    .line 82
    if-lez v5, :cond_3

    .line 83
    .line 84
    mul-float/2addr v4, v3

    .line 85
    float-to-int v0, v4

    .line 86
    goto :goto_1

    .line 87
    :cond_3
    div-float/2addr v2, v3

    .line 88
    float-to-int v1, v2

    .line 89
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 90
    .line 91
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 96
    .line 97
    if-ne v3, v0, :cond_4

    .line 98
    .line 99
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 100
    .line 101
    if-eq v3, v1, :cond_5

    .line 102
    .line 103
    :cond_4
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 104
    .line 105
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 108
    .line 109
    new-instance v1, Ll/di70;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/di70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 115
    .line 116
    .line 117
    :cond_5
    :goto_2
    return-void
.end method

.method public q(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 25
    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 42
    .line 43
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 44
    .line 45
    if-lez v1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 49
    .line 50
    const/16 v1, 0x168

    .line 51
    .line 52
    const/16 v2, 0x280

    .line 53
    .line 54
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 58
    .line 59
    int-to-float v1, v1

    .line 60
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 61
    .line 62
    int-to-float v0, v0

    .line 63
    div-float/2addr v1, v0

    .line 64
    int-to-float v0, p1

    .line 65
    int-to-float v2, p2

    .line 66
    div-float v3, v0, v2

    .line 67
    .line 68
    cmpl-float v3, v3, v1

    .line 69
    .line 70
    if-lez v3, :cond_3

    .line 71
    .line 72
    mul-float/2addr v2, v1

    .line 73
    float-to-int p1, v2

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    div-float/2addr v0, v1

    .line 76
    float-to-int p2, v0

    .line 77
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 84
    .line 85
    if-ne v1, p1, :cond_5

    .line 86
    .line 87
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 88
    .line 89
    if-eq v1, p2, :cond_4

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    :goto_2
    return-void

    .line 93
    :cond_5
    :goto_3
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 94
    .line 95
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final r(I)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 4
    .line 5
    float-to-int p0, p0

    .line 6
    div-int/lit8 p0, p0, 0x3c

    .line 7
    .line 8
    div-int/lit8 p0, p0, 0x3c

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    new-instance v0, Ljava/text/DecimalFormat;

    .line 16
    .line 17
    const-string v1, "00"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    div-int/lit16 p1, p1, 0x3e8

    .line 23
    .line 24
    rem-int/lit8 v1, p1, 0x3c

    .line 25
    .line 26
    div-int/lit8 p1, p1, 0x3c

    .line 27
    .line 28
    rem-int/lit8 v2, p1, 0x3c

    .line 29
    .line 30
    div-int/lit8 p1, p1, 0x3c

    .line 31
    .line 32
    new-instance v3, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const/16 v4, 0x3a

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    :cond_1
    if-eqz p0, :cond_2

    .line 48
    .line 49
    int-to-long p0, v2

    .line 50
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :goto_1
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    int-to-long p0, v1

    .line 66
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method public final s()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 13
    .line 14
    new-instance v1, Ll/ei70;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ei70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnViewTapListener(Ll/fp50;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setOnTapListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

    .line 2
    .line 3
    return-void
.end method

.method public setPlayer(Ll/ie80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 2
    .line 3
    return-void
.end method

.method public setProgressBarsEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRadius(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$b;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setVideo(Lcom/p1/mobile/putong/data/Video;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->B()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->l:Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->o:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->f:Lv/VText;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->r(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->h:Lv/VText;

    .line 38
    .line 39
    iget v2, p1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 40
    .line 41
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 42
    .line 43
    mul-float/2addr v2, v3

    .line 44
    float-to-int v2, v2

    .line 45
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->r(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g:Lv/VProgressBar;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 81
    .line 82
    const-string v1, "normal"

    .line 83
    .line 84
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p1, v1, v0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1, v1, v0}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 113
    .line 114
    const-string v1, "http"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_4

    .line 121
    .line 122
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    sget v1, Ll/k9c0;->a:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 145
    .line 146
    .line 147
    :cond_5
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic v(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->k:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->A4:I

    .line 14
    .line 15
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->i:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView$d;->d()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->j:Ljava/util/Set;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/ie80$b;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->n:Ll/ie80;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/ie80;->mute(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->p:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->A(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
