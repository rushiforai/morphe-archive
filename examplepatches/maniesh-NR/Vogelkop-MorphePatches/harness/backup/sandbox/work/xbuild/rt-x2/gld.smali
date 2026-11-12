.class public Lgld;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Ljbl;


# instance fields
.field public A:Lsjg;

.field public B:Lpgh;

.field public C:Lg77;

.field public final D:Lyn4;

.field public final E:Lald;

.field public final F:Lwe7;

.field public final G:Ld8d;

.field public final H:Lmig;

.field public r:Ld4c;

.field public s:Lu02;

.field public t:Li4d;

.field public u:Li4d;

.field public v:Lxbf;

.field public w:I

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v0, 0x0

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v1

    iget-object v1, v1, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    const v1, 0x7f08051a

    iput v1, p0, Lgld;->w:I

    new-instance v1, Lfld;

    invoke-direct {v1, p0}, Lfld;-><init>(Lgld;)V

    new-instance v2, Lald;

    invoke-direct {v2, p0, v0}, Lald;-><init>(Lk24;B)V

    iput-object v2, p0, Lgld;->E:Lald;

    new-instance v0, Lwe7;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v1, v2}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v0, p0, Lgld;->F:Lwe7;

    new-instance v0, Ld8d;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lgld;->G:Ld8d;

    new-instance v0, Lmig;

    new-instance v1, Ldld;

    invoke-direct {v1, p0}, Ldld;-><init>(Lgld;)V

    invoke-direct {v0, v1}, Lmig;-><init>(Llig;)V

    iput-object v0, p0, Lgld;->H:Lmig;

    new-instance v0, Lyn4;

    invoke-direct {v0, p0}, Lyn4;-><init>(Lgld;)V

    iput-object v0, p0, Lgld;->D:Lyn4;

    return-void
.end method


# virtual methods
.method public final C0(Litl;)Litl;
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ld4c;->a(Landroid/content/Context;)Ld4c;

    move-result-object p1

    iput-object p1, p0, Lgld;->r:Ld4c;

    iget p0, p1, Ld4c;->b:I

    invoke-static {p0}, Lu7k;->j(I)Lu7k;

    move-result-object p0

    iget-object p0, p0, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Litl;

    const p1, 0x7f10001c

    iput p1, p0, Litl;->b:I

    return-object p0
.end method

.method public final G0()V
    .registers 5

    iget-object v0, p0, Lgld;->s:Lu02;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, v0, Lu02;->f:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/PlayerContainerView;

    iget-object v1, v1, Lcom/opera/android/media/PlayerContainerView;->j:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liig;

    if-eqz v1, :cond_29

    iget v0, v1, Liig;->a:I

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    const/4 v1, 0x0

    goto :goto_44

    :cond_29
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const v2, 0x7f0600a8

    invoke-virtual {v0, v2}, Landroid/content/Context;->getColor(I)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    const v3, 0x7f061084

    invoke-static {v2, v3, v0}, Landroidx/core/content/res/ResourcesCompat;->a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_44
    iget-object v2, p0, Lgld;->s:Lu02;

    iget-object v2, v2, Lu02;->f:Ljava/lang/Object;

    check-cast v2, Lor2;

    iget-object v2, v2, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->f:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    iget-object v1, p0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->f:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lgld;->s:Lu02;

    iget-object p0, p0, Lu02;->f:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final H0()V
    .registers 3

    iget-object v0, p0, Lgld;->s:Lu02;

    if-eqz v0, :cond_71

    iget-object v0, v0, Lu02;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    iget-object v0, v0, Lcom/opera/android/media/PlayerContainerView;->j:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liig;

    iget-object p0, p0, Lgld;->s:Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lxgh;

    instance-of v1, p0, Llck;

    if-eqz v1, :cond_71

    check-cast p0, Llck;

    iget-object p0, p0, Llck;->c:Lcom/opera/android/OverlaidStatusBarDrawingView;

    if-eqz v0, :cond_44

    sget-object v0, Lwuf;->a:Lwuf;

    iget-object v1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    if-eq v0, v1, :cond_32

    iput-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz v0, :cond_32

    invoke-virtual {v0}, Lc1f;->e()V

    :cond_32
    iget v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    if-eqz v0, :cond_71

    const/4 v0, 0x0

    iput v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz p0, :cond_71

    invoke-virtual {p0}, Lc1f;->e()V

    return-void

    :cond_44
    sget-object v0, Lwuf;->b:Lwuf;

    iget-object v1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    if-eq v0, v1, :cond_56

    iput-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz v0, :cond_56

    invoke-virtual {v0}, Lc1f;->e()V

    :cond_56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600aa

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    iget v1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    if-eq v0, v1, :cond_71

    iput v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz p0, :cond_71

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_71
    return-void
.end method

.method public final I0()V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->Z:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzkd;

    iget-object p0, p0, Lgld;->s:Lu02;

    iget-object p0, p0, Lu02;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    iget-boolean p0, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    iget-boolean v1, v0, Lzkd;->j:Z

    if-ne p0, v1, :cond_23

    return-void

    :cond_23
    iput-boolean p0, v0, Lzkd;->j:Z

    invoke-virtual {v0}, Lzkd;->T()V

    return-void
.end method

.method public final J0()V
    .registers 6

    iget-object v0, p0, Lgld;->F:Lwe7;

    invoke-virtual {v0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->w()Lfzl;

    move-result-object v0

    iget-object v0, v0, Lfzl;->a:Lh1b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lh1b;->u(I)La1b;

    move-result-object v0

    :cond_11
    invoke-virtual {v0}, Lq4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-virtual {v0}, Lq4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezl;

    iget v3, v2, Lezl;->a:I

    if-lez v3, :cond_11

    iget-object v2, v2, Lezl;->b:Leyl;

    iget-object v2, v2, Leyl;->d:[Loj9;

    aget-object v2, v2, v1

    iget v2, v2, Loj9;->u:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_11

    const/4 v0, 0x1

    goto :goto_2f

    :cond_2e
    move v0, v1

    :goto_2f
    iget-object v2, p0, Lgld;->s:Lu02;

    iget-object v2, v2, Lu02;->f:Ljava/lang/Object;

    check-cast v2, Lor2;

    iget-object v3, v2, Lor2;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v2, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    iget-boolean p0, p0, Lgld;->y:Z

    const/16 v4, 0x8

    if-eqz p0, :cond_47

    if-eqz v0, :cond_47

    move p0, v1

    goto :goto_48

    :cond_47
    move p0, v4

    :goto_48
    invoke-virtual {v3, p0}, Landroid/view/View;->setVisibility(I)V

    if-nez v0, :cond_4e

    move v1, v4

    :cond_4e
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final h0(Landroidx/fragment/app/w;)V
    .registers 4

    const/4 p0, 0x1

    const/4 v0, -0x1

    const-string v1, "media-player"

    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    return-void
.end method

.method public final l0(Z)V
    .registers 4

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    iget-boolean v1, v0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    if-eqz v1, :cond_f

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b(Z)V

    return-void

    :cond_f
    iget-object v0, p0, Lgld;->v:Lxbf;

    if-eqz v0, :cond_1d

    iget-object v0, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lp12;

    invoke-virtual {v0}, Lp12;->w()Z

    move-result v0

    iput-boolean v0, p0, Lgld;->x:Z

    :cond_1d
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ld4c;->a(Landroid/content/Context;)Ld4c;

    move-result-object p1

    iget-object v0, p0, Lgld;->r:Ld4c;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2b

    const/4 p1, 0x0

    invoke-static {p1}, Lu7k;->j(I)Lu7k;

    move-result-object p1

    iget-object p1, p1, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Litl;

    iput-object p1, p0, Lltl;->h:Litl;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_2f

    const/4 p1, 0x1

    iput-boolean p1, p0, Lltl;->o:Z

    invoke-virtual {p0}, Lltl;->D0()V

    return-void

    :cond_2b
    iget-object p1, p0, Lgld;->s:Lu02;

    if-nez p1, :cond_30

    :cond_2f
    return-void

    :cond_30
    iget-object p1, p1, Lu02;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lp92;->a(Landroid/content/res/Resources;)Lp92;

    move-result-object p0

    iput-object p0, p1, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    invoke-virtual {p1}, Lcom/opera/android/media/PlayerContainerView;->a()V

    return-void
.end method

.method public final onCreateAnimator(IZI)Landroid/animation/Animator;
    .registers 12

    iget-boolean v0, p0, Lltl;->p:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    :cond_6
    if-nez p2, :cond_1b

    iget-boolean v0, p0, Lgld;->z:Z

    if-eqz v0, :cond_1b

    const/4 p0, 0x0

    filled-new-array {p0}, [I

    move-result-object p0

    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p0

    const-wide/16 p1, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    return-object p0

    :cond_1b
    iget-boolean v0, p0, Lgld;->x:Z

    if-eqz v0, :cond_53

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v3

    iget-object p1, p0, Lgld;->s:Lu02;

    iget-object p1, p1, Lu02;->a:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Landroid/view/ViewGroup;

    iget-object p0, p0, Lgld;->v:Lxbf;

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lp12;

    invoke-virtual {p0}, Lp12;->m()Z

    move-result p1

    if-eqz p1, :cond_49

    iget-object p0, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/MediaPlayerMini;

    invoke-static {p0}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    :cond_49
    move-object v7, v1

    new-instance v2, Lvkd;

    move v6, p2

    invoke-direct/range {v2 .. v7}, Lvkd;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/ViewGroup;ZLandroid/graphics/Rect;)V

    iget-object p0, v2, Lvkd;->g:Landroid/animation/ValueAnimator;

    return-object p0

    :cond_53
    move v6, p2

    invoke-super {p0, p1, v6, p3}, Landroidx/fragment/app/Fragment;->onCreateAnimator(IZI)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 6

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lgld;->v:Lxbf;

    const/4 v1, 0x0

    if-eqz v0, :cond_a9

    iget-object v0, p0, Lgld;->D:Lyn4;

    iget-object v2, v0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    if-eqz v2, :cond_17

    iget-object v3, v0, Lyn4;->d:Lxn4;

    const-class v4, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/cast/framework/SessionManager;->removeSessionManagerListener(Lcom/google/android/gms/cast/framework/SessionManagerListener;Ljava/lang/Class;)V

    iput-object v1, v0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    :cond_17
    iput-object v1, v0, Lyn4;->f:Lxbf;

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    iget-object v0, v0, Lcom/opera/android/media/PlayerContainerView;->j:Lpde;

    iget-object v2, p0, Lgld;->G:Ld8d;

    invoke-virtual {v0, v2}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    iget-object v2, p0, Lgld;->v:Lxbf;

    invoke-virtual {v0, v2}, Lcom/opera/android/media/PlayerContainerView;->c(Lxbf;)V

    iget-object v0, p0, Lgld;->F:Lwe7;

    iget-object v2, p0, Lgld;->v:Lxbf;

    invoke-virtual {v0, v2}, Lhkg;->b(Lxbf;)V

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/QuickJumpPlayerView;

    iput-object v1, v0, Lcom/opera/android/media/QuickJumpPlayerView;->D:Landroid/view/GestureDetector;

    iput-object v1, p0, Lgld;->B:Lpgh;

    iget-object v0, p0, Lgld;->C:Lg77;

    iget-object v0, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v0, Ldnb;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lgld;->C:Lg77;

    iget-object v0, p0, Lgld;->H:Lmig;

    iget-object v2, p0, Lgld;->v:Lxbf;

    invoke-virtual {v0, v2}, Lmig;->b(Lxbf;)V

    iget-object v0, p0, Lgld;->t:Li4d;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lzld;

    iget-object v2, v0, Lzld;->e:Lmig;

    iget-object v3, v0, Lzld;->b:Lxbf;

    invoke-virtual {v2, v3}, Lmig;->b(Lxbf;)V

    iget-object v0, v0, Lzld;->d:Lwe7;

    invoke-virtual {v0, v3}, Lhkg;->b(Lxbf;)V

    iput-object v1, p0, Lgld;->t:Li4d;

    iget-object v0, p0, Lgld;->u:Li4d;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lzld;

    iget-object v2, v0, Lzld;->e:Lmig;

    iget-object v3, v0, Lzld;->b:Lxbf;

    invoke-virtual {v2, v3}, Lmig;->b(Lxbf;)V

    iget-object v0, v0, Lzld;->d:Lwe7;

    invoke-virtual {v0, v3}, Lhkg;->b(Lxbf;)V

    iput-object v1, p0, Lgld;->u:Li4d;

    iget-object v0, p0, Lgld;->v:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v2, p0, Lgld;->A:Lsjg;

    invoke-virtual {v0, v2}, Ltjg;->j(Lsjg;)V

    iget-object v0, p0, Lgld;->v:Lxbf;

    iget-object v0, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Luuj;

    iget-object v0, v0, Luuj;->b:Ljava/lang/Object;

    check-cast v0, Lh7f;

    iget-object v2, p0, Lgld;->E:Lald;

    invoke-virtual {v0, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    iput-object v1, p0, Lgld;->A:Lsjg;

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->d:Ljava/lang/Object;

    check-cast v0, Lwkd;

    iget-object v0, v0, Lwkd;->g:Lcom/opera/android/media/PlayerControlView;

    iget-object v2, p0, Lgld;->v:Lxbf;

    iget-object v0, v0, Lcom/opera/android/media/PlayerControlView;->b:Lmig;

    invoke-virtual {v0, v2}, Lmig;->b(Lxbf;)V

    iput-object v1, p0, Lgld;->v:Lxbf;

    :cond_a9
    iput-object v1, p0, Lgld;->s:Lu02;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0682

    const/4 v1, 0x0

    if-ne p1, v0, :cond_39

    iget-object p1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    sget-object v0, Lq9n;->c:Ll5b;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Lpih;

    invoke-direct {v2, v0}, Lpih;-><init>(Ljava/util/ArrayList;)V

    const-class v3, Lqe;

    invoke-static {p1, v3, v2}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-object v0, p0, Lgld;->v:Lxbf;

    if-eqz v0, :cond_37

    new-instance v2, Lakg;

    new-instance v3, Lrl;

    const/16 v4, 0x15

    invoke-direct {v3, p0, v4}, Lrl;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-direct {v2, v0, v1, v3, p0}, Lakg;-><init>(Lxbf;ZLjava/lang/Runnable;Lga6;)V

    invoke-virtual {v2, p1}, Lo73;->p(Landroid/view/View;)V

    :cond_37
    const/4 p0, 0x1

    return p0

    :cond_39
    return v1
.end method

.method public final onPause()V
    .registers 3

    invoke-super {p0}, Lltl;->onPause()V

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    iget-object p0, p0, Lgld;->D:Lyn4;

    iget-object v1, p0, Lyn4;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-eqz p0, :cond_18

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    :cond_18
    return-void
.end method

.method public final onResume()V
    .registers 3

    invoke-super {p0}, Lltl;->onResume()V

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    iget-object p0, p0, Lgld;->D:Lyn4;

    iget-object v1, p0, Lyn4;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-eqz p0, :cond_17

    invoke-virtual {v0, p0}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    :cond_17
    return-void
.end method

.method public final s0()I
    .registers 2

    iget p0, p0, Lgld;->w:I

    const v0, 0x7f08051a

    if-ne p0, v0, :cond_b

    const p0, 0x7f140828

    return p0

    :cond_b
    const p0, 0x7f14044d

    return p0
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    iget p0, p0, Lgld;->w:I

    return p0
.end method

.method public final x0(Litd;)V
    .registers 5

    const v0, 0x7f0a067e

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    instance-of v0, p1, Lmsk;

    const/4 v1, 0x0

    if-eqz v0, :cond_13

    check-cast p1, Lmsk;

    invoke-interface {p1}, Lmsk;->z()Lff;

    move-result-object p1

    goto :goto_14

    :cond_13
    move-object p1, v1

    :goto_14
    check-cast p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;

    iget-object p0, p0, Lgld;->D:Lyn4;

    iget-object v0, p0, Lyn4;->h:Ldod;

    if-eqz v0, :cond_1e

    iget-object v1, p0, Lyn4;->e:Lvnd;

    :cond_1e
    if-eqz v1, :cond_4d

    iget-object p0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->e:Llmd;

    iget-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->d:Ldod;

    iget-object v2, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->f:Lvnd;

    invoke-virtual {v2, v1}, Lvnd;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4d

    iget-object v2, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->f:Lvnd;

    invoke-virtual {v2}, Lvnd;->d()Z

    move-result v2

    if-nez v2, :cond_37

    invoke-virtual {v0, p0}, Ldod;->j(Lwnd;)V

    :cond_37
    invoke-virtual {v1}, Lvnd;->d()Z

    move-result v2

    if-nez v2, :cond_41

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Ldod;->a(Lvnd;Lwnd;I)V

    :cond_41
    iput-object v1, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->f:Lvnd;

    invoke-virtual {p1}, Lff;->h()V

    iget-object p0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->h:Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz p0, :cond_4d

    invoke-virtual {p0, v1}, Landroidx/mediarouter/app/OperaMediaRouteButton;->e(Lvnd;)V

    :cond_4d
    new-instance p0, Lao4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->g:Lcnd;

    if-eq v0, p0, :cond_5e

    iput-object p0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->g:Lcnd;

    iget-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->h:Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz v0, :cond_5e

    iput-object p0, v0, Landroidx/mediarouter/app/OperaMediaRouteButton;->d:Lcnd;

    :cond_5e
    new-instance p0, Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->i:Lr16;

    if-eq p0, v0, :cond_7c

    iput-object p0, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->i:Lr16;

    invoke-virtual {p1}, Lff;->h()V

    iget-object p1, p1, Landroidx/mediarouter/app/OperaMediaRouteActionProvider;->h:Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz p1, :cond_7c

    iget-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteButton;->e:Lr16;

    if-eq p0, v0, :cond_7c

    iput-object p0, p1, Landroidx/mediarouter/app/OperaMediaRouteButton;->e:Lr16;

    invoke-virtual {p1}, Landroidx/mediarouter/app/OperaMediaRouteButton;->c()V

    invoke-virtual {p1}, Landroidx/mediarouter/app/OperaMediaRouteButton;->b()V

    :cond_7c
    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "media-player"

    return-object p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 35

    move-object/from16 v0, p0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    const v1, 0x7f0a0678

    move-object/from16 v2, p2

    invoke-static {v2, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget-object v3, v3, Ld4c;->a:Lfpj;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const-string v6, "Missing required view with ID: "

    const v13, 0x7f0a088f

    const v14, 0x7f0a088e

    const v15, 0x7f0a0847

    const v7, 0x7f0a0845

    const v8, 0x7f0a07d7

    const v9, 0x7f0a0672

    const v10, 0x7f0a028d

    const v11, 0x7f0a0262

    const v12, 0x7f0a0192

    if-eqz v3, :cond_146

    if-eq v3, v5, :cond_48

    if-eq v3, v4, :cond_48

    const/4 v4, 0x3

    if-eq v3, v4, :cond_48

    const/4 v4, 0x4

    if-eq v3, v4, :cond_48

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_48
    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    if-eqz v18, :cond_135

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_133

    invoke-static {v3}, Lcc6;->a(Landroid/view/View;)Lcc6;

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_131

    invoke-static {v3}, Lwkd;->a(Landroid/view/View;)Lwkd;

    move-result-object v20

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v25

    if-eqz v25, :cond_12f

    move-object/from16 v17, v1

    check-cast v17, Landroid/widget/LinearLayout;

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_12d

    invoke-static {v3}, Lor2;->d(Landroid/view/View;)Lor2;

    move-result-object v22

    const v3, 0x7f0a0844

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v28, v4

    check-cast v28, Lcom/opera/android/media/PlayerAndControlsAspectLayout;

    if-eqz v28, :cond_12b

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v21, v3

    check-cast v21, Lcom/opera/android/media/PlayerContainerView;

    if-eqz v21, :cond_136

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v19, v3

    check-cast v19, Lcom/opera/android/media/QuickJumpPlayerView;

    if-eqz v19, :cond_129

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_127

    invoke-static {v13, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v27, v3

    check-cast v27, Landroid/widget/LinearLayout;

    if-eqz v27, :cond_125

    const v3, 0x7f0a0890

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_121

    new-instance v3, Ldmd;

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-direct {v3, v4}, Ldmd;-><init>(Landroid/widget/LinearLayout;)V

    const v4, 0x7f0a0891

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_11d

    new-instance v4, Ldmd;

    check-cast v7, Landroid/widget/LinearLayout;

    invoke-direct {v4, v7}, Ldmd;-><init>(Landroid/widget/LinearLayout;)V

    const v7, 0x7f0a0892

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v29, v8

    check-cast v29, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v29, :cond_119

    const v7, 0x7f0a0893

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v23, v8

    check-cast v23, Lcom/opera/android/theme/ThemeableRecyclerView;

    if-eqz v23, :cond_115

    const v7, 0x7f0a0894

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_111

    invoke-static {v8}, Lpt1;->a(Landroid/view/View;)Lpt1;

    move-result-object v26

    const v7, 0x7f0a0bba

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v8, :cond_10d

    new-instance v16, Lu02;

    sget-object v31, Ljck;->b:Ljck;

    move-object/from16 v30, v3

    move-object/from16 v24, v4

    invoke-direct/range {v16 .. v31}, Lu02;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_109
    move-object/from16 v1, v16

    goto/16 :goto_228

    :cond_10d
    const v7, 0x7f0a0bba

    goto :goto_136

    :cond_111
    const v7, 0x7f0a0894

    goto :goto_136

    :cond_115
    const v7, 0x7f0a0893

    goto :goto_136

    :cond_119
    const v7, 0x7f0a0892

    goto :goto_136

    :cond_11d
    const v7, 0x7f0a0891

    goto :goto_136

    :cond_121
    const v7, 0x7f0a0890

    goto :goto_136

    :cond_125
    move v7, v13

    goto :goto_136

    :cond_127
    move v7, v14

    goto :goto_136

    :cond_129
    move v7, v15

    goto :goto_136

    :cond_12b
    move v7, v3

    goto :goto_136

    :cond_12d
    move v7, v8

    goto :goto_136

    :cond_12f
    move v7, v9

    goto :goto_136

    :cond_131
    move v7, v10

    goto :goto_136

    :cond_133
    move v7, v11

    goto :goto_136

    :cond_135
    move v7, v12

    :cond_136
    :goto_136
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_146
    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v18, v3

    check-cast v18, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    if-eqz v18, :cond_52a

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_528

    invoke-static {v3}, Lcc6;->a(Landroid/view/View;)Lcc6;

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_526

    invoke-static {v3}, Lwkd;->a(Landroid/view/View;)Lwkd;

    move-result-object v20

    const v3, 0x7f0a0390

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_524

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v25

    if-eqz v25, :cond_522

    move-object/from16 v17, v1

    check-cast v17, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v3, 0x7f0a07d4

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/OverlaidStatusBarDrawingView;

    if-eqz v9, :cond_524

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_520

    invoke-static {v3}, Lor2;->d(Landroid/view/View;)Lor2;

    move-result-object v22

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v21, v3

    check-cast v21, Lcom/opera/android/media/PlayerContainerView;

    if-eqz v21, :cond_52b

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v19, v3

    check-cast v19, Lcom/opera/android/media/QuickJumpPlayerView;

    if-eqz v19, :cond_51e

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_51c

    invoke-static {v13, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v27, v3

    check-cast v27, Landroid/widget/LinearLayout;

    if-eqz v27, :cond_51a

    const v3, 0x7f0a0890

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_524

    new-instance v3, Ldmd;

    check-cast v7, Landroid/widget/LinearLayout;

    invoke-direct {v3, v7}, Ldmd;-><init>(Landroid/widget/LinearLayout;)V

    const v7, 0x7f0a0891

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_52b

    new-instance v7, Ldmd;

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-direct {v7, v8}, Ldmd;-><init>(Landroid/widget/LinearLayout;)V

    const v8, 0x7f0a0892

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v29, v10

    check-cast v29, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v29, :cond_520

    const v10, 0x7f0a0893

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v23, v8

    check-cast v23, Lcom/opera/android/theme/ThemeableRecyclerView;

    if-eqz v23, :cond_526

    const v8, 0x7f0a0894

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_520

    invoke-static {v10}, Lpt1;->a(Landroid/view/View;)Lpt1;

    move-result-object v26

    const v8, 0x7f0a0aca

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/FrameLayout;

    if-eqz v10, :cond_520

    const v10, 0x7f0a0bba

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v8, :cond_526

    new-instance v16, Lu02;

    new-instance v1, Llck;

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4, v9}, Llck;-><init>(Ljava/util/List;Lcom/opera/android/OverlaidStatusBarDrawingView;)V

    const/16 v28, 0x0

    move-object/from16 v31, v1

    move-object/from16 v30, v3

    move-object/from16 v24, v7

    invoke-direct/range {v16 .. v31}, Lu02;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_109

    :goto_228
    iput-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->d:Ljava/lang/Object;

    check-cast v1, Lwkd;

    iget-object v1, v1, Lwkd;->j:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v3, Lbld;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lbld;-><init>(Lgld;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    new-instance v3, Lcld;

    invoke-direct {v3, v0, v4}, Lcld;-><init>(Lgld;B)V

    iput-object v3, v1, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->c:Lcld;

    invoke-virtual {v0}, Lgld;->I0()V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v1

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v3, v3, Lu02;->a:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Lqwe;->b(Landroid/view/View;)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/QuickJumpPlayerView;

    invoke-virtual {v1}, Landroidx/media3/ui/PlayerView;->h()Z

    move-result v3

    invoke-virtual {v1, v3}, Landroidx/media3/ui/PlayerView;->i(Z)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/QuickJumpPlayerView;

    iget-object v3, v1, Landroidx/media3/ui/PlayerView;->k:Luig;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v6, 0xbb8

    iput v6, v1, Landroidx/media3/ui/PlayerView;->y:I

    invoke-virtual {v3}, Luig;->g()Z

    move-result v3

    if-eqz v3, :cond_289

    invoke-virtual {v1}, Landroidx/media3/ui/PlayerView;->h()Z

    move-result v3

    invoke-virtual {v1, v3}, Landroidx/media3/ui/PlayerView;->i(Z)V

    :cond_289
    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/QuickJumpPlayerView;

    invoke-virtual {v1}, Landroidx/media3/ui/PlayerView;->e()V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/QuickJumpPlayerView;

    new-instance v3, Lyzb;

    const/16 v6, 0x1a

    invoke-direct {v3, v0, v6}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v1, Landroidx/media3/ui/PlayerView;->s:Lyzb;

    iget-object v1, v1, Landroidx/media3/ui/PlayerView;->k:Luig;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->d:Ljava/lang/Object;

    check-cast v1, Lwkd;

    iget-object v1, v1, Lwkd;->g:Lcom/opera/android/media/PlayerControlView;

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget v3, v3, Ld4c;->g:I

    iget-object v6, v1, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v6, v6, Lwkd;->q:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    move-result v8

    invoke-virtual {v6, v3, v7, v3, v8}, Landroid/view/View;->setPadding(IIII)V

    iget-object v1, v1, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v1, v1, Lwkd;->n:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v1, v3, v6, v3, v7}, Landroid/view/View;->setPadding(IIII)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->d:Ljava/lang/Object;

    check-cast v1, Lwkd;

    iget-object v1, v1, Lwkd;->g:Lcom/opera/android/media/PlayerControlView;

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget-boolean v3, v3, Ld4c;->c:Z

    invoke-virtual {v1, v3}, Lcom/opera/android/media/PlayerControlView;->a(Z)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->k:Ljava/lang/Object;

    check-cast v1, Landroid/widget/LinearLayout;

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget-boolean v3, v3, Ld4c;->c:Z

    const/16 v6, 0x8

    if-eqz v3, :cond_2ef

    move v3, v4

    goto :goto_2f0

    :cond_2ef
    move v3, v6

    :goto_2f0
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->d:Ljava/lang/Object;

    check-cast v1, Lwkd;

    iget-object v1, v1, Lwkd;->j:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget-boolean v3, v3, Ld4c;->c:Z

    if-eqz v3, :cond_303

    move v3, v6

    goto :goto_304

    :cond_303
    move v3, v4

    :goto_304
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->l:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/PlayerAndControlsAspectLayout;

    if-eqz v1, :cond_31e

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget v3, v3, Ld4c;->d:F

    iget v7, v1, Lcom/opera/android/media/PlayerAndControlsAspectLayout;->a:F

    cmpl-float v7, v3, v7

    if-eqz v7, :cond_31e

    iput v3, v1, Lcom/opera/android/media/PlayerAndControlsAspectLayout;->a:F

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    :cond_31e
    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->d:Ljava/lang/Object;

    check-cast v1, Lwkd;

    iget-object v1, v1, Lwkd;->a:Lcom/opera/android/media/PlayerControlView;

    iget-object v3, v0, Lgld;->r:Ld4c;

    iget v7, v3, Ld4c;->e:I

    iget v3, v3, Ld4c;->f:I

    invoke-virtual {v1, v7, v3, v7, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-object v1, v0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v3, v3, Lu02;->o:Ljava/lang/Object;

    check-cast v3, Lxgh;

    instance-of v7, v3, Ljck;

    if-eqz v7, :cond_33f

    invoke-virtual {v1, v5}, Lcom/opera/android/StatusBarDrawingFrameLayout;->c(Z)V

    goto :goto_367

    :cond_33f
    instance-of v7, v3, Llck;

    if-eqz v7, :cond_516

    invoke-virtual {v1, v4}, Lcom/opera/android/StatusBarDrawingFrameLayout;->c(Z)V

    check-cast v3, Llck;

    iget-object v1, v3, Llck;->b:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_350
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_367

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    new-instance v7, Lkje;

    invoke-direct {v7, v3, v5}, Lkje;-><init>(Landroid/view/View;B)V

    sget-object v8, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v3, v7}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    goto :goto_350

    :cond_367
    :goto_367
    iget-object v1, v0, Lgld;->s:Lu02;

    if-eqz v1, :cond_37c

    iget-object v1, v1, Lu02;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3}, Lp92;->a(Landroid/content/res/Resources;)Lp92;

    move-result-object v3

    iput-object v3, v1, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    invoke-virtual {v1}, Lcom/opera/android/media/PlayerContainerView;->a()V

    :cond_37c
    invoke-virtual {v0}, Lgld;->H0()V

    invoke-virtual {v0}, Lgld;->G0()V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lrm5;->D(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, v0, Lgld;->y:Z

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v1

    iget-object v1, v1, Ltjg;->o:Lxbf;

    iget-object v2, v0, Lgld;->v:Lxbf;

    if-nez v2, :cond_515

    iget-object v2, v0, Lgld;->s:Lu02;

    if-eqz v2, :cond_515

    iput-object v1, v0, Lgld;->v:Lxbf;

    iget-object v2, v1, Lxbf;->f:Ljava/lang/Object;

    check-cast v2, Lp12;

    invoke-virtual {v2}, Lp12;->m()Z

    move-result v2

    iput-boolean v2, v0, Lgld;->x:Z

    new-instance v2, Li4d;

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v7, v3, Lu02;->g:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/theme/ThemeableRecyclerView;

    iget-object v3, v3, Lu02;->h:Ljava/lang/Object;

    check-cast v3, Ldmd;

    iget-object v3, v3, Ldmd;->b:Landroid/widget/LinearLayout;

    invoke-direct {v2, v7, v3, v1}, Li4d;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lxbf;)V

    iput-object v2, v0, Lgld;->t:Li4d;

    iget-object v2, v2, Li4d;->b:Ljava/lang/Object;

    check-cast v2, Lzld;

    iget-object v3, v2, Lzld;->d:Lwe7;

    iget-object v7, v2, Lzld;->b:Lxbf;

    invoke-virtual {v3, v7}, Lhkg;->a(Lxbf;)V

    iget-object v2, v2, Lzld;->e:Lmig;

    invoke-virtual {v2, v7}, Lmig;->a(Lxbf;)V

    new-instance v2, Li4d;

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v7, v3, Lu02;->m:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v3, v3, Lu02;->n:Ljava/lang/Object;

    check-cast v3, Ldmd;

    iget-object v3, v3, Ldmd;->b:Landroid/widget/LinearLayout;

    invoke-direct {v2, v7, v3, v1}, Li4d;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lxbf;)V

    iput-object v2, v0, Lgld;->u:Li4d;

    iget-object v2, v2, Li4d;->b:Ljava/lang/Object;

    check-cast v2, Lzld;

    iget-object v3, v2, Lzld;->d:Lwe7;

    iget-object v7, v2, Lzld;->b:Lxbf;

    invoke-virtual {v3, v7}, Lhkg;->a(Lxbf;)V

    iget-object v2, v2, Lzld;->e:Lmig;

    invoke-virtual {v2, v7}, Lmig;->a(Lxbf;)V

    new-instance v2, Lsjg;

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v3, v3, Lu02;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/media/QuickJumpPlayerView;

    invoke-direct {v2, v5, v3}, Lsjg;-><init>(ILandroidx/media3/ui/PlayerView;)V

    iput-object v2, v0, Lgld;->A:Lsjg;

    iget-object v3, v0, Lgld;->v:Lxbf;

    iget-object v3, v3, Lxbf;->b:Ljava/lang/Object;

    check-cast v3, Ltjg;

    invoke-virtual {v3, v2, v5}, Ltjg;->b(Lsjg;Z)V

    iget-object v2, v0, Lgld;->s:Lu02;

    iget-object v2, v2, Lu02;->d:Ljava/lang/Object;

    check-cast v2, Lwkd;

    iget-object v2, v2, Lwkd;->g:Lcom/opera/android/media/PlayerControlView;

    iget-object v2, v2, Lcom/opera/android/media/PlayerControlView;->b:Lmig;

    invoke-virtual {v2, v1}, Lmig;->a(Lxbf;)V

    iget-object v2, v0, Lgld;->s:Lu02;

    iget-object v2, v2, Lu02;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v2, v1}, Lcom/opera/android/media/PlayerContainerView;->b(Lxbf;)V

    iget-object v2, v0, Lgld;->s:Lu02;

    iget-object v2, v2, Lu02;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/media/PlayerContainerView;

    iget-object v2, v2, Lcom/opera/android/media/PlayerContainerView;->j:Lpde;

    iget-object v3, v0, Lgld;->G:Ld8d;

    invoke-virtual {v2, v3}, Lekc;->k(Lf7f;)V

    iget-object v2, v0, Lgld;->F:Lwe7;

    invoke-virtual {v2, v1}, Lhkg;->a(Lxbf;)V

    new-instance v1, Lg77;

    new-instance v2, Li4d;

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v7, v3, Lu02;->i:Ljava/lang/Object;

    check-cast v7, Landroid/view/View;

    const/4 v8, 0x2

    invoke-direct {v2, v7, v8}, Li4d;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v3, Lu02;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/media/QuickJumpPlayerView;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v7, Ldnb;

    const/16 v8, 0x1b

    invoke-direct {v7, v1, v8}, Ldnb;-><init>(Ljava/lang/Object;B)V

    iput-object v7, v1, Lg77;->c:Ljava/lang/Object;

    iput-object v2, v1, Lg77;->a:Ljava/lang/Object;

    iput-object v3, v1, Lg77;->b:Ljava/lang/Object;

    iput-object v1, v0, Lgld;->C:Lg77;

    new-instance v1, Lpgh;

    new-instance v2, Lrgh;

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v3, v3, Lu02;->j:Ljava/lang/Object;

    check-cast v3, Lpt1;

    invoke-direct {v2, v3}, Lrgh;-><init>(Lpt1;)V

    iget-object v3, v0, Lgld;->s:Lu02;

    iget-object v3, v3, Lu02;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/media/QuickJumpPlayerView;

    iget-object v7, v0, Lgld;->C:Lg77;

    iget-object v8, v0, Lgld;->H:Lmig;

    invoke-direct {v1, v2, v8, v3, v7}, Lpgh;-><init>(Lrgh;Lmig;Landroid/view/View;Logh;)V

    iput-object v1, v0, Lgld;->B:Lpgh;

    new-instance v2, Landroid/view/GestureDetector;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    new-instance v9, Lsgh;

    invoke-direct {v9, v3, v1}, Lsgh;-><init>(Lcom/opera/android/media/QuickJumpPlayerView;Lpgh;)V

    invoke-direct {v2, v7, v9}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v2, v3, Lcom/opera/android/media/QuickJumpPlayerView;->D:Landroid/view/GestureDetector;

    iget-object v1, v0, Lgld;->v:Lxbf;

    invoke-virtual {v8, v1}, Lmig;->a(Lxbf;)V

    iget-object v1, v0, Lgld;->v:Lxbf;

    iget-object v1, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Luuj;

    iget-object v1, v1, Luuj;->b:Ljava/lang/Object;

    check-cast v1, Lh7f;

    iget-object v2, v0, Lgld;->E:Lald;

    invoke-virtual {v1, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->f:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v2, Lbld;

    invoke-direct {v2, v0, v5}, Lbld;-><init>(Lgld;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lgld;->v:Lxbf;

    iget-object v1, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Luuj;

    invoke-virtual {v1}, Luuj;->i()I

    move-result v1

    iget-object v2, v0, Lgld;->s:Lu02;

    iget-object v2, v2, Lu02;->f:Ljava/lang/Object;

    check-cast v2, Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    if-nez v1, :cond_4c4

    const v1, 0x7f080629

    goto :goto_4c7

    :cond_4c4
    const v1, 0x7f080626

    :goto_4c7
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->f:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    iget-boolean v2, v0, Lgld;->y:Z

    if-nez v2, :cond_4d9

    move v4, v6

    :cond_4d9
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Lbld;

    const/4 v8, 0x2

    invoke-direct {v2, v0, v8}, Lbld;-><init>(Lgld;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->f:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v2, Lks8;

    invoke-direct {v2, v0, v5}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lgld;->J0()V

    iget-object v1, v0, Lgld;->v:Lxbf;

    iget-object v0, v0, Lgld;->D:Lyn4;

    iput-object v1, v0, Lyn4;->f:Lxbf;

    iget-boolean v1, v0, Lyn4;->i:Z

    if-eqz v1, :cond_515

    invoke-static {}, Lcom/google/android/gms/cast/framework/CastContext;->getSharedInstance()Lcom/google/android/gms/cast/framework/CastContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/cast/framework/CastContext;->getSessionManager()Lcom/google/android/gms/cast/framework/SessionManager;

    move-result-object v1

    iput-object v1, v0, Lyn4;->g:Lcom/google/android/gms/cast/framework/SessionManager;

    iget-object v0, v0, Lyn4;->d:Lxn4;

    const-class v2, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/cast/framework/SessionManager;->addSessionManagerListener(Lcom/google/android/gms/cast/framework/SessionManagerListener;Ljava/lang/Class;)V

    :cond_515
    return-void

    :cond_516
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_51a
    move v7, v13

    goto :goto_52b

    :cond_51c
    move v7, v14

    goto :goto_52b

    :cond_51e
    move v7, v15

    goto :goto_52b

    :cond_520
    move v7, v8

    goto :goto_52b

    :cond_522
    move v7, v9

    goto :goto_52b

    :cond_524
    move v7, v3

    goto :goto_52b

    :cond_526
    move v7, v10

    goto :goto_52b

    :cond_528
    move v7, v11

    goto :goto_52b

    :cond_52a
    move v7, v12

    :cond_52b
    :goto_52b
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
