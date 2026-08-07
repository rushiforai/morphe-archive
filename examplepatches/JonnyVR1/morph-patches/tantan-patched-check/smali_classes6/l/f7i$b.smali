.class public Ll/f7i$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f7i;->v(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

.field public final synthetic c:Ll/dj70;

.field public final synthetic d:Ll/f7i;


# direct methods
.method public constructor <init>(Ll/f7i;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f7i$b;->d:Ll/f7i;

    .line 2
    .line 3
    iput-object p2, p0, Ll/f7i$b;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/f7i$b;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 6
    .line 7
    iput-object p4, p0, Ll/f7i$b;->c:Ll/dj70;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/f7i$b;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/f7i$b;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f7i$b;->d:Ll/f7i;

    .line 2
    .line 3
    iget-object v0, v0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/f7i$b;->d:Ll/f7i;

    .line 11
    .line 12
    iget-object p0, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p2, Ll/dj70;->b:Ljava/lang/String;

    .line 18
    .line 19
    const-string p1, "from_like"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onFinished()V
    .locals 9

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/f7i$b;->d:Ll/f7i;

    .line 5
    .line 6
    iget-object v1, v0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 9
    .line 10
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    new-array v8, v0, [F

    .line 15
    .line 16
    fill-array-data v8, :array_0

    .line 17
    .line 18
    .line 19
    const-string v2, "alpha"

    .line 20
    .line 21
    const-wide/16 v3, 0x0

    .line 22
    .line 23
    const-wide/16 v5, 0xfa

    .line 24
    .line 25
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/f7i$b;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 30
    .line 31
    iget-object v2, p0, Ll/f7i$b;->c:Ll/dj70;

    .line 32
    .line 33
    iget-object v3, p0, Ll/f7i$b;->a:Landroid/view/View;

    .line 34
    .line 35
    new-instance v4, Ll/g7i;

    .line 36
    .line 37
    invoke-direct {v4, p0, v1, v2, v3}, Ll/g7i;-><init>(Ll/f7i$b;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v4}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/f7i$b;->a:Landroid/view/View;

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
