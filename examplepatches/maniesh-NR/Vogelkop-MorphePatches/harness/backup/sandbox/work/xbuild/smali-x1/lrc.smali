.class public final Llrc;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final A:Lyqc;

.field public B:Lor2;

.field public C:Lvl6;

.field public final D:Lkze;

.field public final r:Lurc;

.field public final s:Lqrc;

.field public final t:Lwll;

.field public final u:Lqwe;

.field public v:Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

.field public w:Lp8f;

.field public x:Lorg/chromium/content_public/browser/WebContents;

.field public y:Z

.field public final z:Lew3;


# direct methods
.method public constructor <init>(Lurc;Lqrc;Lwll;Lqwe;Lew3;Lyqc;Lu55;Lorm;)V
    .registers 12

    const v0, 0x7f0d0243

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x0

    iput-boolean v2, v1, Litl;->h:Z

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->f:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Llrc;->r:Lurc;

    iput-object p2, p0, Llrc;->s:Lqrc;

    iput-object p3, p0, Llrc;->t:Lwll;

    iput-object p4, p0, Llrc;->u:Lqwe;

    iput-object p5, p0, Llrc;->z:Lew3;

    iput-object p6, p0, Llrc;->A:Lyqc;

    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Llrc;->D:Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    new-instance p1, Lkrc;

    invoke-direct {p1, p7, p8}, Lkrc;-><init>(Lu55;Lorm;)V

    invoke-virtual {p0, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 5

    iget-object v0, p0, Llrc;->v:Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object v2, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    if-eqz v2, :cond_13

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_13
    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v2, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    if-eqz v2, :cond_22

    iget-object v3, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->g:Laq8;

    iget-object v2, v2, Lqwe;->b:Li7f;

    invoke-virtual {v2, v3}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_22
    iput-object v1, v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    :cond_24
    iget-object v0, p0, Llrc;->w:Lp8f;

    if-eqz v0, :cond_2f

    iget-object v0, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Lzll;

    invoke-static {v0}, Lu8n;->h(Landroid/view/View;)V

    :cond_2f
    iget-object v0, p0, Llrc;->w:Lp8f;

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Lp8f;->j()V

    :cond_36
    iput-object v1, p0, Llrc;->w:Lp8f;

    iput-object v1, p0, Llrc;->x:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method

.method public final g0()V
    .registers 2

    iget-boolean v0, p0, Lryl;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Lryl;->g0()V

    invoke-virtual {p0}, Llrc;->G0()V

    return-void
.end method

.method public final k0()I
    .registers 1

    const p0, 0x7f040557

    return p0
.end method

.method public final l0(Z)V
    .registers 3

    iget-object p1, p0, Llrc;->x:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p1, :cond_14

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p1

    if-eqz p1, :cond_14

    invoke-interface {p1}, Lorg/chromium/content_public/browser/NavigationController;->f()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-interface {p1}, Lorg/chromium/content_public/browser/NavigationController;->e()V

    return-void

    :cond_14
    iget-object p0, p0, Llrc;->C:Lvl6;

    if-nez p0, :cond_19

    const/4 p0, 0x0

    :cond_19
    invoke-virtual {p0}, Lvl6;->S()Z

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Llrc;->y:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_15

    invoke-static {p1}, Lp37;->E(Landroid/os/Bundle;)Ln37;

    move-result-object p1

    check-cast p1, Lmrc;

    iget-object p1, p1, Lmrc;->a:Lirc;

    goto :goto_16

    :cond_15
    const/4 p1, 0x0

    :goto_16
    if-nez p1, :cond_1a

    sget-object p1, Lcrc;->a:Lcrc;

    :cond_1a
    iget-object p0, p0, Llrc;->s:Lqrc;

    invoke-virtual {p0, p1}, Lqrc;->a(Lirc;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, Llrc;->r:Lurc;

    iget-object p0, p0, Lurc;->e:Lqdc;

    sget-object v0, Locc;->ON_DESTROY:Locc;

    invoke-virtual {p0, v0}, Lqdc;->e(Locc;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 1

    invoke-super {p0}, Lltl;->onDestroyView()V

    invoke-virtual {p0}, Llrc;->G0()V

    return-void
.end method

.method public final onStart()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-object p0, p0, Llrc;->x:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_b

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    :cond_b
    return-void
.end method

.method public final onStop()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    iget-object p0, p0, Llrc;->x:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_b

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lorg/chromium/content_public/browser/WebContents;->y1(I)V

    :cond_b
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 12

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p2, p0, Llrc;->s:Lqrc;

    iget-object p2, p2, Lqrc;->c:Lwnm;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v1, Lrkc;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lrkc;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Liwa;

    const/4 v3, 0x3

    invoke-direct {v2, v1, v3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p0, Llrc;->w:Lp8f;

    const/4 v0, 0x5

    if-eqz p2, :cond_37

    iget-object p2, p2, Lp8f;->b:Ljava/lang/Object;

    check-cast p2, Lzll;

    new-instance v1, Llzb;

    invoke-direct {v1, p0, v0}, Llzb;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lq9n;->c:Ll5b;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_37

    invoke-static {v2, p2, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_37
    iget-object p2, p0, Llrc;->v:Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

    const/4 v1, 0x0

    if-nez p2, :cond_3d

    move-object p2, v1

    :cond_3d
    invoke-virtual {p2}, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->a()Ljrc;

    move-result-object p2

    iget-object p2, p2, Ljrc;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lsma;

    const/16 v4, 0x13

    invoke-direct {v2, p0, v4}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lca;

    invoke-direct {p2, p1, v3}, Lca;-><init>(Landroid/view/View;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    new-instance p1, Lnga;

    iget-object p2, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v2, 0x0

    invoke-direct {p1, p2, v2}, Lnga;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;I)V

    iget-object p2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v4, Le73;

    const/16 v5, 0x9

    invoke-direct {v4, p1, p0, v5}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2, v4}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    iget-object v4, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v6, 0x7f0600ab

    invoke-virtual {v4, v6}, Landroid/content/Context;->getColor(I)I

    move-result v4

    invoke-direct {p2, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object p1, p0, Llrc;->B:Lor2;

    if-nez p1, :cond_8e

    move-object p1, v1

    :cond_8e
    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object p2, p0, Llrc;->D:Lkze;

    invoke-virtual {p1, p2}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c(Lkze;)V

    iget-object p1, p0, Llrc;->B:Lor2;

    if-nez p1, :cond_9c

    move-object p1, v1

    :cond_9c
    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object p1

    new-instance p2, Lr42;

    const/4 v4, 0x2

    invoke-direct {p2, p0, v4}, Lr42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x(Lnjf;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0700a3

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    new-instance p2, Lm9f;

    iget-object v4, p0, Llrc;->B:Lor2;

    if-nez v4, :cond_bf

    move-object v4, v1

    :cond_bf
    iget-object v4, v4, Lor2;->e:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-direct {p2, v4, p1}, Lm9f;-><init>(Landroid/view/View;I)V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p1}, Lm9f;->v(F)V

    new-instance p1, Lvl6;

    iget-object p2, p0, Llrc;->B:Lor2;

    if-nez p2, :cond_d2

    move-object p2, v1

    :cond_d2
    iget-object p2, p2, Lor2;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance v4, Lqfb;

    invoke-direct {v4, p0, v0}, Lqfb;-><init>(Ljava/lang/Object;B)V

    const/4 v0, 0x6

    invoke-direct {p1, p2, v0, v4}, Lvl6;-><init>(Landroidx/core/widget/NestedScrollView;ILnj8;)V

    iput-object p1, p0, Llrc;->C:Lvl6;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    iget-object p2, p0, Llrc;->C:Lvl6;

    if-nez p2, :cond_ee

    move-object p2, v1

    :cond_ee
    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    new-instance p1, Ls6h;

    const/16 p2, 0xc

    invoke-direct {p1, p2}, Ls6h;-><init>(B)V

    iget-object p2, p0, Llrc;->B:Lor2;

    if-nez p2, :cond_fd

    move-object p2, v1

    :cond_fd
    iget-object p2, p2, Lor2;->c:Landroid/view/View;

    check-cast p2, Landroid/widget/LinearLayout;

    new-instance v0, Ljf7;

    const/16 v4, 0x11

    invoke-direct {v0, p1, p0, v4}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Llrc;->B:Lor2;

    if-nez p1, :cond_110

    move-object p1, v1

    :cond_110
    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    new-instance p2, Lm42;

    invoke-direct {p2, p0, v3}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Llrc;->B:Lor2;

    if-nez p1, :cond_122

    move-object p2, v1

    goto :goto_123

    :cond_122
    move-object p2, p1

    :goto_123
    iget-object p2, p2, Lor2;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v2, p2, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    if-eqz p1, :cond_12c

    move-object v1, p1

    :cond_12c
    iget-object p1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance p2, Lyzb;

    invoke-direct {p2, p0, v5}, Lyzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    new-instance p2, Leq6;

    iget-object v0, p0, Llrc;->z:Lew3;

    invoke-direct {p2, v0}, Leq6;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Llrc;->A:Lyqc;

    iget-object p0, p0, Lyqc;->a:Lurc;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v3

    new-instance v5, Lsrc;

    invoke-direct {v5, p0, p2, v2}, Lsrc;-><init>(Lurc;Leq6;B)V

    new-instance v7, Lsrc;

    const/4 p1, 0x1

    invoke-direct {v7, p0, p2, p1}, Lsrc;-><init>(Lurc;Leq6;B)V

    const/4 v8, 0x5

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method

.method public final setArguments(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iget-boolean p1, p0, Llrc;->y:Z

    if-nez p1, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_17

    invoke-static {p1}, Lp37;->E(Landroid/os/Bundle;)Ln37;

    move-result-object p1

    check-cast p1, Lmrc;

    iget-object p1, p1, Lmrc;->a:Lirc;

    goto :goto_18

    :cond_17
    const/4 p1, 0x0

    :goto_18
    if-nez p1, :cond_1c

    sget-object p1, Lcrc;->a:Lcrc;

    :cond_1c
    iget-object p0, p0, Llrc;->s:Lqrc;

    invoke-virtual {p0, p1}, Lqrc;->a(Lirc;)V

    return-void
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 11

    const p1, 0x7f0a04d0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0269

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/live_score/LivescoreSheetContentWrapper;

    if-eqz v3, :cond_95

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    const p2, 0x7f0a05f1

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

    if-eqz v4, :cond_95

    const p2, 0x7f0a0a45

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/widget/MeasurableHeightScrollView;

    if-eqz v5, :cond_95

    const p2, 0x7f0a0a48

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    if-eqz v0, :cond_95

    const p2, 0x7f0a0bba

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v6, :cond_95

    const p2, 0x7f0a0cda

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    if-eqz v7, :cond_95

    new-instance v1, Lor2;

    invoke-direct/range {v1 .. v7}, Lor2;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/live_score/LivescoreSheetContentWrapper;Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;Lcom/opera/android/widget/MeasurableHeightScrollView;Lcom/opera/android/custom_views/LayoutDirectionToolbar;Lcom/opera/android/webcore/FastResizeWebViewContainer;)V

    iput-object v1, p0, Llrc;->B:Lor2;

    iget-object p1, p0, Llrc;->r:Lurc;

    iget-object p2, p1, Lurc;->a:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    iput-object p2, p0, Llrc;->x:Lorg/chromium/content_public/browser/WebContents;

    new-instance v0, Ls8n;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f040557

    invoke-direct {v0, v1, v2}, Ls8n;-><init>(Landroid/content/Context;I)V

    const v1, 0x7f0402f0

    const v2, 0x7f061084

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v1, p0, Llrc;->t:Lwll;

    invoke-virtual {v1, p2, v0}, Lwll;->a(Lorg/chromium/content_public/browser/WebContents;I)Lp8f;

    move-result-object p2

    iput-object p2, p0, Llrc;->w:Lp8f;

    const/4 v0, 0x0

    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object p2, p2, Lp8f;->b:Ljava/lang/Object;

    check-cast p2, Lzll;

    iget-object p1, p1, Lurc;->a:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v1, p0, Llrc;->u:Lqwe;

    invoke-virtual {v0, p2, p1, v1}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->a(Lzll;Lcom/opera/android/browser/WebContentsWrapper;Lqwe;)V

    iput-object v4, p0, Llrc;->v:Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

    return-void

    :cond_95
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
