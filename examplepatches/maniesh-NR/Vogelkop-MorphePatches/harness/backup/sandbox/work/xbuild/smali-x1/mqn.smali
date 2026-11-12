.class public final Lmqn;
.super Llqn;
.source "SourceFile"


# instance fields
.field public final R:Lnw3;

.field public S:Ly83;

.field public T:Lvl6;

.field public final U:Lkze;


# direct methods
.method public constructor <init>(Lru9;Lpjn;Lcom/opera/android/Lazy;Lorm;Lhq3;Lvsn;Lwll;Lqwe;Ld7h;Lsw3;Lcom/opera/android/Lazy;Lnw3;)V
    .registers 26

    const v0, 0x7f0d048e

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v1

    iget-object v0, v1, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v2, 0x0

    iput-boolean v2, v0, Litl;->h:Z

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    invoke-direct/range {v0 .. v12}, Llqn;-><init>(Lu7k;Lru9;Lpjn;Lcom/opera/android/Lazy;Lorm;Lhq3;Lvsn;Lwll;Lqwe;Ld7h;Lsw3;Lcom/opera/android/Lazy;)V

    move-object/from16 v1, p12

    iput-object v1, p0, Lmqn;->R:Lnw3;

    new-instance v1, Lkze;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lmqn;->U:Lkze;

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1, p2}, Llqn;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p1, Lnga;

    iget-object p2, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Lnga;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;I)V

    iget-object p2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v1, Le73;

    const/16 v2, 0x10

    invoke-direct {v1, p1, p0, v2}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2, v1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    iget-object v1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0600ab

    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v1

    invoke-direct {p2, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0700a3

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget-object p2, p0, Lmqn;->S:Ly83;

    const/4 v1, 0x0

    if-nez p2, :cond_48

    move-object p2, v1

    :cond_48
    iget-object p2, p2, Ly83;->h:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object v2, p0, Lmqn;->U:Lkze;

    invoke-virtual {p2, v2}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c(Lkze;)V

    iget-object p2, p0, Lmqn;->S:Ly83;

    if-nez p2, :cond_56

    move-object p2, v1

    :cond_56
    iget-object p2, p2, Ly83;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object p2

    new-instance v2, Lr42;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v3}, Lr42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x(Lnjf;)V

    new-instance p2, Lm9f;

    iget-object v2, p0, Lmqn;->S:Ly83;

    if-nez v2, :cond_6e

    move-object v2, v1

    :cond_6e
    iget-object v2, v2, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-direct {p2, v2, p1}, Lm9f;-><init>(Landroid/view/View;I)V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p1}, Lm9f;->v(F)V

    new-instance p1, Lvl6;

    iget-object p2, p0, Lmqn;->S:Ly83;

    if-nez p2, :cond_81

    move-object p2, v1

    :cond_81
    iget-object p2, p2, Ly83;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance v2, Lbxk;

    const/16 v3, 0xc

    invoke-direct {v2, p0, v3}, Lbxk;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x6

    invoke-direct {p1, p2, v4, v2}, Lvl6;-><init>(Landroidx/core/widget/NestedScrollView;ILnj8;)V

    iput-object p1, p0, Lmqn;->T:Lvl6;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    iget-object p2, p0, Lmqn;->T:Lvl6;

    if-nez p2, :cond_9f

    move-object p2, v1

    :cond_9f
    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    new-instance p1, Ls6h;

    invoke-direct {p1, v3}, Ls6h;-><init>(B)V

    iget-object p2, p0, Lmqn;->S:Ly83;

    if-nez p2, :cond_ac

    move-object p2, v1

    :cond_ac
    iget-object p2, p2, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p2, Landroid/widget/LinearLayout;

    new-instance v2, Lobn;

    const/16 v3, 0x9

    invoke-direct {v2, p1, p0, v3}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lmqn;->S:Ly83;

    if-nez p1, :cond_bf

    move-object p1, v1

    :cond_bf
    iget-object p1, p1, Ly83;->g:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    new-instance p2, Lm42;

    invoke-direct {p2, p0, v3}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Lmqn;->S:Ly83;

    if-nez p1, :cond_d1

    move-object p2, v1

    goto :goto_d2

    :cond_d1
    move-object p2, p1

    :goto_d2
    iget-object p2, p2, Ly83;->f:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v0, p2, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    if-eqz p1, :cond_db

    move-object v1, p1

    :cond_db
    iget-object p1, v1, Ly83;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance p2, Lr2n;

    const/16 v0, 0x11

    invoke-direct {p2, p0, v0}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    return-void
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 28

    move-object/from16 v0, p0

    const v1, 0x7f0a04d0

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0269

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    if-eqz v6, :cond_1b4

    const v2, 0x7f0a04c3

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1b4

    invoke-static {v3}, Lrvg;->a(Landroid/view/View;)Lrvg;

    move-result-object v7

    move-object v5, v1

    check-cast v5, Landroid/widget/LinearLayout;

    const v2, 0x7f0a05f1

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    if-eqz v8, :cond_1b4

    const v2, 0x7f0a0a45

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lcom/opera/android/widget/MeasurableHeightScrollView;

    if-eqz v9, :cond_1b4

    const v2, 0x7f0a0a48

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    if-eqz v3, :cond_1b4

    const v2, 0x7f0a0bba

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v10, :cond_1b4

    const v2, 0x7f0a0cda

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    if-eqz v11, :cond_1b4

    new-instance v4, Ly83;

    const/16 v12, 0xd

    invoke-direct/range {v4 .. v12}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v4, v0, Lmqn;->S:Ly83;

    new-instance v7, Lmrn;

    iget-object v1, v0, Lmqn;->S:Ly83;

    const/4 v2, 0x0

    if-nez v1, :cond_73

    move-object v1, v2

    :cond_73
    iget-object v1, v1, Ly83;->d:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Lrvg;

    iget-object v11, v0, Llqn;->Q:Ldcl;

    iget-object v12, v0, Lmqn;->R:Lnw3;

    iget-object v8, v0, Llqn;->t:Lcom/opera/android/Lazy;

    iget-object v10, v0, Llqn;->P:Ltvk;

    invoke-direct/range {v7 .. v12}, Lmrn;-><init>(Lcom/opera/android/Lazy;Lrvg;Lcrn;Lkrn;Lesk;)V

    iget-object v1, v0, Lmqn;->S:Ly83;

    if-nez v1, :cond_88

    move-object v1, v2

    :cond_88
    iget-object v1, v1, Ly83;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    iget-object v3, v0, Llqn;->v:Lhq3;

    iget-object v4, v3, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v4}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    iput-object v4, v0, Llqn;->J:Lorg/chromium/content_public/browser/WebContents;

    new-instance v5, Ls8n;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f040557

    invoke-direct {v5, v8, v9}, Ls8n;-><init>(Landroid/content/Context;I)V

    const v8, 0x7f0402ed

    const v9, 0x7f061084

    invoke-static {v8, v5, v9}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v5

    iget-object v8, v0, Llqn;->x:Lwll;

    invoke-virtual {v8, v4, v5}, Lwll;->a(Lorg/chromium/content_public/browser/WebContents;I)Lp8f;

    move-result-object v5

    iput-object v5, v0, Llqn;->I:Lp8f;

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget-object v5, v5, Lp8f;->b:Ljava/lang/Object;

    check-cast v5, Lzll;

    iget-object v3, v3, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v10, v0, Llqn;->y:Lqwe;

    invoke-virtual {v9, v5, v3, v10}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->a(Lzll;Lcom/opera/android/browser/WebContentsWrapper;Lqwe;)V

    invoke-interface {v4}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object v3

    if-eqz v3, :cond_d3

    iget-object v3, v3, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    new-instance v4, Lga7;

    invoke-direct {v4, v3}, Lga7;-><init>(Landroid/view/View;)V

    :cond_d3
    new-instance v3, Lmlj;

    iget-object v4, v0, Llqn;->A:Lsw3;

    invoke-virtual {v4}, Lsw3;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lysj;

    iget-object v5, v7, Lmrn;->m:Landroid/view/View;

    invoke-direct {v3, v4, v5}, Lmlj;-><init>(Lysj;Landroid/view/View;)V

    iput-object v3, v0, Llqn;->F:Lmlj;

    iget-object v3, v0, Lltl;->n:Lqm9;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v4

    iput-object v5, v3, Lqm9;->g:Landroid/view/View;

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    new-instance v9, Ld62;

    invoke-direct {v9, v3, v5}, Ld62;-><init>(Lqm9;Landroid/view/View;)V

    invoke-virtual {v4, v9}, Ltcc;->a(Lmdc;)V

    iget-object v3, v0, Llqn;->w:Lvsn;

    iget-object v3, v3, Lvsn;->c:Ls62;

    invoke-virtual {v3}, Ls62;->f()Lqyj;

    move-result-object v3

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v4

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lob;

    const/16 v9, 0x10

    invoke-direct {v5, v3, v9}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Ltcc;->a(Lmdc;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v12

    new-instance v15, Ly1n;

    const/16 v3, 0x1a

    invoke-direct {v15, v0, v3}, Ly1n;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lnqi;

    const/16 v4, 0x12

    invoke-direct {v3, v0, v4}, Lnqi;-><init>(Ljava/lang/Object;B)V

    iget-object v4, v0, Llqn;->F:Lmlj;

    if-nez v4, :cond_132

    move-object/from16 v17, v2

    goto :goto_134

    :cond_132
    move-object/from16 v17, v4

    :goto_134
    new-instance v2, Liqn;

    invoke-direct {v2, v0, v7}, Liqn;-><init>(Lmqn;Lmrn;)V

    iget-object v4, v0, Llqn;->z:Ld7h;

    iget-object v5, v4, Ld7h;->b:Ljava/lang/Object;

    check-cast v5, Lhq3;

    new-instance v10, Lgq3;

    iget-object v4, v4, Ld7h;->c:Ljava/lang/Object;

    check-cast v4, Lsrn;

    iget-object v13, v4, Lsrn;->e:Lzv3;

    iget-object v14, v4, Lsrn;->d:Lkze;

    new-instance v8, Lqrn;

    const/4 v9, 0x1

    invoke-direct {v8, v4, v9}, Lqrn;-><init>(Lsrn;B)V

    new-instance v9, Lilm;

    move-object/from16 v23, v2

    const/16 v2, 0x10

    invoke-direct {v9, v4, v2}, Lilm;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v4, Lsrn;->b:Lnw3;

    move-object/from16 v20, v2

    iget-object v2, v5, Ls62;->c:Lg7m;

    move-object/from16 v21, v2

    iget-object v2, v4, Lsrn;->n:Lzv3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Lk42;

    iget-object v2, v4, Lsrn;->o:Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v24, v2

    check-cast v24, Lgjm;

    move-object/from16 v19, v3

    move-object/from16 v16, v8

    move-object/from16 v18, v9

    invoke-direct/range {v10 .. v24}, Lgq3;-><init>(Landroid/content/Context;Lndc;Lzv3;Lize;Ljava/lang/Runnable;Lesk;Lmlj;Lcom/opera/api/Callback;Lkotlin/jvm/functions/Function2;Lesk;Lg7m;Lk42;Lv5n;Lgjm;)V

    invoke-interface {v12}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    new-instance v3, Ld62;

    const/4 v4, 0x1

    invoke-direct {v3, v5, v10, v4}, Ld62;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Ltcc;->a(Lmdc;)V

    iput-object v6, v0, Llqn;->C:Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    iput-object v7, v0, Llqn;->G:Lmrn;

    iput-object v1, v0, Llqn;->D:Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    invoke-virtual {v1}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->c()Ljrc;

    move-result-object v2

    iget-object v2, v2, Ljrc;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance v3, Lfqn;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lfqn;-><init>(Lmqn;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;->a()Ljrc;

    move-result-object v1

    iget-object v1, v1, Ljrc;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lfqn;

    const/4 v4, 0x1

    invoke-direct {v2, v0, v4}, Lfqn;-><init>(Lmqn;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v0, Llqn;->H:Lkqn;

    invoke-virtual {v6, v0}, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->F(Ljava/lang/Object;)V

    return-void

    :cond_1b4
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
