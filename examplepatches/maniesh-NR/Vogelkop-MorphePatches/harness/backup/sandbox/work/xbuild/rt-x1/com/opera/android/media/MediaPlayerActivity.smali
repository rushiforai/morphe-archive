.class public Lcom/opera/android/media/MediaPlayerActivity;
.super Lhjf;
.source "SourceFile"


# static fields
.field public static final synthetic t:I


# instance fields
.field public final j:Landroid/graphics/Rect;

.field public final k:Lskd;

.field public final l:Ltkd;

.field public m:Lsjg;

.field public n:Landroidx/media3/ui/PlayerView;

.field public o:Lcom/opera/android/media/PlayerContainerView;

.field public p:Lxbf;

.field public q:Lwld;

.field public r:Z

.field public s:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lhjf;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->j:Landroid/graphics/Rect;

    new-instance v0, Lskd;

    invoke-direct {v0, p0}, Lskd;-><init>(Lcom/opera/android/media/MediaPlayerActivity;)V

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->k:Lskd;

    new-instance v0, Ltkd;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ltkd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->l:Ltkd;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->s:Z

    return-void
.end method


# virtual methods
.method public final F()V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->r:Z

    if-nez v0, :cond_4b

    invoke-static {p0}, La26;->m0(Lhjf;)Z

    move-result v0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v0}, Lcom/opera/android/media/PlayerContainerView;->d()Landroid/graphics/Rect;

    move-result-object v0

    if-nez v0, :cond_24

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_23

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->n:Landroidx/media3/ui/PlayerView;

    new-instance v1, Lrkd;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lrkd;-><init>(Lcom/opera/android/media/MediaPlayerActivity;B)V

    invoke-static {v1, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    :cond_23
    return-void

    :cond_24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_39

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_39

    const-string v2, "sourceBounds"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    goto :goto_3a

    :cond_39
    const/4 v1, 0x0

    :goto_3a
    new-instance v2, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-direct {v2, v3, v0}, Landroid/util/Size;-><init>(II)V

    invoke-static {p0, v2, v1}, La26;->D(Lhjf;Landroid/util/Size;Landroid/graphics/Rect;)Z

    return-void

    :cond_4b
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->s:Z

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_PIP"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    return-void
.end method

.method public final G()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v0}, Lcom/opera/android/media/PlayerContainerView;->d()Landroid/graphics/Rect;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-eqz v1, :cond_26

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-eqz v1, :cond_26

    new-instance v1, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/util/Size;-><init>(II)V

    invoke-static {p0, v1}, La26;->k0(Landroidx/fragment/app/r;Landroid/util/Size;)V

    return-void

    :cond_26
    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    new-instance v1, Lrkd;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lrkd;-><init>(Lcom/opera/android/media/MediaPlayerActivity;B)V

    invoke-static {v1, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 11

    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v0

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_19

    const-string v2, "sourceBounds"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    goto :goto_1a

    :cond_19
    const/4 v1, 0x0

    :goto_1a
    iget-object v2, p0, Lcom/opera/android/media/MediaPlayerActivity;->j:Landroid/graphics/Rect;

    const/4 v3, 0x0

    if-eqz v1, :cond_8b

    if-nez v0, :cond_8b

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    sget-object v5, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v4}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v4

    if-eqz v4, :cond_55

    iget-object v4, v4, Lg3o;->a:Ld3o;

    const/16 v5, 0x207

    invoke-virtual {v4, v5}, Ld3o;->i(I)Lr9b;

    move-result-object v6

    iget v6, v6, Lr9b;->a:I

    invoke-virtual {v4, v5}, Ld3o;->i(I)Lr9b;

    move-result-object v5

    iget v5, v5, Lr9b;->b:I

    invoke-virtual {v4}, Ld3o;->h()Ljb7;

    move-result-object v4

    if-eqz v4, :cond_52

    iget-object v4, v4, Ljb7;->a:Landroid/view/DisplayCutout;

    invoke-virtual {v4}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    move-result v7

    invoke-virtual {v4}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    move-result v4

    goto :goto_59

    :cond_52
    move v4, v3

    move v7, v4

    goto :goto_59

    :cond_55
    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    :goto_59
    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v9, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v6

    invoke-static {v3, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    iput v6, v2, Landroid/graphics/Rect;->left:I

    iget v6, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v5

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    iput v5, v2, Landroid/graphics/Rect;->top:I

    iget v5, v8, Landroid/util/DisplayMetrics;->widthPixels:I

    add-int/2addr v5, v7

    iget v6, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v5, v6

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    iput v5, v2, Landroid/graphics/Rect;->right:I

    iget v5, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    add-int/2addr v5, v4

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v1

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v2, Landroid/graphics/Rect;->bottom:I

    :cond_8b
    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    if-eqz v0, :cond_93

    invoke-static {p0, v3, v3, v3, v3}, Lq9n;->D(Landroid/view/View;IIII)V

    return-void

    :cond_93
    iget v0, v2, Landroid/graphics/Rect;->left:I

    iget v1, v2, Landroid/graphics/Rect;->top:I

    iget v3, v2, Landroid/graphics/Rect;->right:I

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    invoke-static {p0, v0, v1, v3, v2}, Lq9n;->D(Landroid/view/View;IIII)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Lhjf;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0d0281

    invoke-virtual {p0, p1}, Lfp1;->setContentView(I)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p1

    const v0, 0x7f0a090b

    invoke-virtual {p0, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Lqwe;->b(Landroid/view/View;)V

    const p1, 0x7f0a0847

    invoke-virtual {p0, p1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/media3/ui/PlayerView;

    iput-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->n:Landroidx/media3/ui/PlayerView;

    new-instance v0, Lsjg;

    const/4 v1, 0x5

    invoke-direct {v0, v1, p1}, Lsjg;-><init>(ILandroidx/media3/ui/PlayerView;)V

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->m:Lsjg;

    invoke-virtual {p1}, Landroidx/media3/ui/PlayerView;->e()V

    const p1, 0x7f0a0845

    invoke-virtual {p0, p1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/media/PlayerContainerView;

    iput-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lp92;

    const v2, 0x7f0705d0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct/range {v1 .. v6}, Lp92;-><init>(ZFIIZ)V

    iput-object v1, p1, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    invoke-virtual {p1}, Lcom/opera/android/media/PlayerContainerView;->a()V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->n:Landroidx/media3/ui/PlayerView;

    new-instance v0, Lrkd;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lrkd;-><init>(Lcom/opera/android/media/MediaPlayerActivity;B)V

    iget-object p1, p1, Landroidx/media3/ui/PlayerView;->b:Landroidx/media3/ui/AspectRatioFrameLayout;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v0, p1, Landroidx/media3/ui/AspectRatioFrameLayout;->b:Lpa2;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object p1

    iget-object p1, p1, Ltjg;->o:Lxbf;

    iput-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->m:Lsjg;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Ltjg;->b(Lsjg;Z)V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->k:Lskd;

    invoke-virtual {p1, v0}, Ltjg;->a(Lrjg;)V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    invoke-virtual {p1, v0}, Lcom/opera/android/media/PlayerContainerView;->b(Lxbf;)V

    iget-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object p1, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast p1, Lode;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgig;

    if-eqz p1, :cond_a5

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->l:Ltkd;

    invoke-interface {p1, v0}, Lgig;->S(Leig;)V

    :cond_a5
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->b0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwld;

    iput-object p1, p0, Lcom/opera/android/media/MediaPlayerActivity;->q:Lwld;

    invoke-virtual {p0}, Lcom/opera/android/media/MediaPlayerActivity;->F()V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lhjf;->onDestroy()V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    invoke-virtual {v0, v1}, Lcom/opera/android/media/PlayerContainerView;->c(Lxbf;)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerActivity;->k:Lskd;

    invoke-virtual {v0, v1}, Ltjg;->i(Lrjg;)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerActivity;->m:Lsjg;

    invoke-virtual {v0, v1}, Ltjg;->j(Lsjg;)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    if-eqz v0, :cond_33

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerActivity;->l:Ltkd;

    invoke-interface {v0, v1}, Lgig;->g0(Leig;)V

    :cond_33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->m:Lsjg;

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->q:Lwld;

    return-void
.end method

.method public final onPictureInPictureModeChanged(Z)V
    .registers 9

    invoke-super {p0, p1}, Lxd5;->onPictureInPictureModeChanged(Z)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->o:Lcom/opera/android/media/PlayerContainerView;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_d

    invoke-static {v0, v2, v2, v2, v2}, Lq9n;->D(Landroid/view/View;IIII)V

    goto :goto_2f

    :cond_d
    iget-object v3, p0, Lcom/opera/android/media/MediaPlayerActivity;->j:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->left:I

    iget v5, v3, Landroid/graphics/Rect;->top:I

    iget v6, v3, Landroid/graphics/Rect;->right:I

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-static {v0, v4, v5, v6, v3}, Lq9n;->D(Landroid/view/View;IIII)V

    iput-boolean v1, p0, Lcom/opera/android/media/MediaPlayerActivity;->r:Z

    const-string v0, "HUAWEI"

    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    new-instance v0, Lukd;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-direct {v0, p0, v3}, Lukd;-><init>(Lcom/opera/android/media/MediaPlayerActivity;Ltcc;)V

    :cond_2f
    :goto_2f
    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    if-eqz v0, :cond_43

    invoke-interface {v0}, Lgig;->e0()Z

    move-result v0

    if-nez v0, :cond_44

    :cond_43
    move v1, v2

    :cond_44
    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->q:Lwld;

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lpod;

    invoke-virtual {v0, p0, p1, v1}, Lsc;->l(Ljava/lang/Object;ZZ)V

    return-void
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Landroidx/fragment/app/r;->onResume()V

    iget-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->r:Z

    if-eqz v0, :cond_1c

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->s:Z

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_PIP"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    :cond_1c
    return-void
.end method

.method public final onStop()V
    .registers 4

    invoke-super {p0}, Lfp1;->onStop()V

    iget-boolean v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->s:Z

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    invoke-interface {v0}, Lgig;->pause()V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->q:Lwld;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v1, v1, Lxbf;->d:Ljava/lang/Object;

    check-cast v1, Lpod;

    invoke-virtual {v0, v1}, Lsc;->n(Ljava/lang/Object;)V

    :cond_21
    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    const/4 v1, 0x0

    if-eqz v0, :cond_38

    invoke-interface {v0}, Lgig;->e0()Z

    move-result v0

    if-eqz v0, :cond_38

    const/4 v0, 0x1

    goto :goto_39

    :cond_38
    move v0, v1

    :goto_39
    iget-object v2, p0, Lcom/opera/android/media/MediaPlayerActivity;->q:Lwld;

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerActivity;->p:Lxbf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lpod;

    invoke-virtual {v2, p0, v1, v0}, Lsc;->l(Ljava/lang/Object;ZZ)V

    return-void
.end method

.method public final w()I
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, v0}, Lqbe;->z(Lg7j;ZZZ)I

    move-result p0

    return p0
.end method
