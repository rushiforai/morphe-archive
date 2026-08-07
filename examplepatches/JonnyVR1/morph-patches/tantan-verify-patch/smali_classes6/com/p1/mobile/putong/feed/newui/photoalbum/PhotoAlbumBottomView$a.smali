.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B1(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/ImageView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->a:Landroid/widget/ImageView;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onFinished()V
    .locals 9

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->n:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->a:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->x:Lcom/tantan/library/svga/SVGAnimationView;

    .line 28
    .line 29
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    new-array v8, v0, [F

    .line 36
    .line 37
    fill-array-data v8, :array_0

    .line 38
    .line 39
    .line 40
    const-string v2, "alpha"

    .line 41
    .line 42
    const-wide/16 v3, 0x0

    .line 43
    .line 44
    const-wide/16 v5, 0xfa

    .line 45
    .line 46
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/h970;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/h970;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView$a;->a:Landroid/widget/ImageView;

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
