.class public Ltq3;
.super Lzp1;
.source "SourceFile"


# instance fields
.field public g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public j:Landroid/widget/FrameLayout;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Lsq3;

.field public final o:Z

.field public p:Lg77;

.field public final q:Lrq3;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 6

    const/4 v0, 0x1

    if-nez p2, :cond_1b

    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f0400f0

    invoke-virtual {v1, v2, p2, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_18

    iget p2, p2, Landroid/util/TypedValue;->resourceId:I

    goto :goto_1b

    :cond_18
    const p2, 0x7f1504f9

    :cond_1b
    :goto_1b
    invoke-direct {p0, p1, p2}, Lzp1;-><init>(Landroid/content/Context;I)V

    iput-boolean v0, p0, Ltq3;->k:Z

    iput-boolean v0, p0, Ltq3;->l:Z

    new-instance p1, Lrq3;

    invoke-direct {p1, p0}, Lrq3;-><init>(Ltq3;)V

    iput-object p1, p0, Ltq3;->q:Lrq3;

    invoke-virtual {p0}, Lzp1;->d()Lpp1;

    move-result-object p1

    invoke-virtual {p1, v0}, Lpp1;->g(I)Z

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const p2, 0x7f04040f

    filled-new-array {p2}, [I

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Ltq3;->o:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 2

    iget-object v0, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-nez v0, :cond_7

    invoke-virtual {p0}, Ltq3;->f()V

    :cond_7
    invoke-super {p0}, Landroid/app/Dialog;->cancel()V

    return-void
.end method

.method public final f()V
    .registers 7

    iget-object v0, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    if-nez v0, :cond_77

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0d00f8

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    const v1, 0x7f0a0884

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/core/view/insets/ProtectionLayout;

    iget-object v0, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    const v1, 0x7f0a0291

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    iput-object v0, p0, Ltq3;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    iget-object v0, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    const v1, 0x7f0a02d2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object v0

    iput-object v0, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a0:Ljava/util/ArrayList;

    iget-object v1, p0, Ltq3;->q:Lrq3;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4a

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4a
    iget-object v0, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-boolean v1, p0, Ltq3;->k:Z

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K(Z)V

    new-instance v0, Lg77;

    iget-object v1, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v3, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x22

    if-lt v4, v5, :cond_66

    new-instance v2, Lcdd;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    goto :goto_6f

    :cond_66
    const/16 v5, 0x21

    if-lt v4, v5, :cond_6f

    new-instance v2, Ladd;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    :cond_6f
    :goto_6f
    iput-object v2, v0, Lg77;->a:Ljava/lang/Object;

    iput-object v1, v0, Lg77;->b:Ljava/lang/Object;

    iput-object v3, v0, Lg77;->c:Ljava/lang/Object;

    iput-object v0, p0, Ltq3;->p:Lg77;

    :cond_77
    return-void
.end method

.method public final g(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout;
    .registers 7

    invoke-virtual {p0}, Ltq3;->f()V

    iget-object v0, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    const v1, 0x7f0a0291

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    if-eqz p2, :cond_1b

    if-nez p1, :cond_1b

    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    :cond_1b
    iget-boolean p2, p0, Ltq3;->o:Z

    if-eqz p2, :cond_2d

    iget-object p2, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    new-instance v1, Lu59;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lu59;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p2, v1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    :cond_2d
    iget-object p2, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object p2, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    if-nez p3, :cond_3a

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_3d

    :cond_3a
    invoke-virtual {p2, p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_3d
    const p1, 0x7f0a0bd7

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lic;

    const/4 p3, 0x3

    invoke-direct {p2, p0, p3}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    new-instance p2, Lja3;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lja3;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lr5n;->l(Landroid/view/View;Lf8;)V

    iget-object p1, p0, Ltq3;->j:Landroid/widget/FrameLayout;

    new-instance p2, Lma3;

    invoke-direct {p2, p3}, Lma3;-><init>(B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p0, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method public onAttachedToWindow()V
    .registers 7

    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_43

    iget-boolean v2, p0, Ltq3;->o:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_25

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x23

    if-ge v2, v4, :cond_1a

    invoke-virtual {v0}, Landroid/view/Window;->getNavigationBarColor()I

    move-result v2

    goto :goto_1b

    :cond_1a
    move v2, v1

    :goto_1b
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    const/16 v4, 0xff

    if-ge v2, v4, :cond_25

    move v2, v3

    goto :goto_26

    :cond_25
    move v2, v1

    :goto_26
    iget-object v4, p0, Ltq3;->h:Landroid/widget/FrameLayout;

    if-eqz v4, :cond_2f

    xor-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Landroid/view/View;->setFitsSystemWindows(Z)V

    :cond_2f
    iget-object v4, p0, Ltq3;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    if-eqz v4, :cond_38

    xor-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setFitsSystemWindows(Z)V

    :cond_38
    xor-int/2addr v2, v3

    invoke-static {v0, v2}, Locp;->p(Landroid/view/Window;Z)V

    iget-object v2, p0, Ltq3;->n:Lsq3;

    if-eqz v2, :cond_43

    invoke-virtual {v2, v0}, Lsq3;->e(Landroid/view/Window;)V

    :cond_43
    iget-object v0, p0, Ltq3;->p:Lg77;

    if-eqz v0, :cond_62

    iget-object v2, v0, Lg77;->c:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    iget-boolean p0, p0, Ltq3;->k:Z

    iget-object v3, v0, Lg77;->a:Ljava/lang/Object;

    check-cast v3, Ladd;

    if-eqz p0, :cond_5d

    if-eqz v3, :cond_62

    iget-object p0, v0, Lg77;->b:Ljava/lang/Object;

    check-cast p0, Lzcd;

    invoke-virtual {v3, p0, v2, v1}, Ladd;->b(Lzcd;Landroid/view/View;Z)V

    return-void

    :cond_5d
    if-eqz v3, :cond_62

    invoke-virtual {v3, v2}, Ladd;->c(Landroid/view/View;)V

    :cond_62
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Lzp1;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_1c

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x23

    if-ge p1, v0, :cond_13

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    :cond_13
    const/high16 p1, -0x80000000

    invoke-virtual {p0, p1}, Landroid/view/Window;->addFlags(I)V

    const/4 p1, -0x1

    invoke-virtual {p0, p1, p1}, Landroid/view/Window;->setLayout(II)V

    :cond_1c
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    iget-object v0, p0, Ltq3;->n:Lsq3;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lsq3;->e(Landroid/view/Window;)V

    :cond_8
    iget-object p0, p0, Ltq3;->p:Lg77;

    if-eqz p0, :cond_19

    iget-object v0, p0, Lg77;->a:Ljava/lang/Object;

    check-cast v0, Ladd;

    if-eqz v0, :cond_19

    iget-object p0, p0, Lg77;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {v0, p0}, Ladd;->c(Landroid/view/View;)V

    :cond_19
    return-void
.end method

.method public onStart()V
    .registers 3

    invoke-super {p0}, Lce5;->onStart()V

    iget-object p0, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-eqz p0, :cond_10

    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->P:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M(I)V

    :cond_10
    return-void
.end method

.method public final setCancelable(Z)V
    .registers 4

    invoke-super {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    iget-boolean v0, p0, Ltq3;->k:Z

    if-eq v0, p1, :cond_36

    iput-boolean p1, p0, Ltq3;->k:Z

    iget-object v0, p0, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-eqz v0, :cond_10

    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K(Z)V

    :cond_10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_36

    iget-object p1, p0, Ltq3;->p:Lg77;

    if-eqz p1, :cond_36

    iget-object v0, p1, Lg77;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-boolean p0, p0, Ltq3;->k:Z

    iget-object v1, p1, Lg77;->a:Ljava/lang/Object;

    check-cast v1, Ladd;

    if-eqz p0, :cond_31

    if-eqz v1, :cond_36

    iget-object p0, p1, Lg77;->b:Ljava/lang/Object;

    check-cast p0, Lzcd;

    const/4 p1, 0x0

    invoke-virtual {v1, p0, v0, p1}, Ladd;->b(Lzcd;Landroid/view/View;Z)V

    return-void

    :cond_31
    if-eqz v1, :cond_36

    invoke-virtual {v1, v0}, Ladd;->c(Landroid/view/View;)V

    :cond_36
    return-void
.end method

.method public final setCanceledOnTouchOutside(Z)V
    .registers 4

    invoke-super {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    const/4 v0, 0x1

    if-eqz p1, :cond_c

    iget-boolean v1, p0, Ltq3;->k:Z

    if-nez v1, :cond_c

    iput-boolean v0, p0, Ltq3;->k:Z

    :cond_c
    iput-boolean p1, p0, Ltq3;->l:Z

    iput-boolean v0, p0, Ltq3;->m:Z

    return-void
.end method

.method public setContentView(I)V
    .registers 3

    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0, p1, v0}, Ltq3;->g(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout;

    move-result-object p1

    invoke-super {p0, p1}, Lzp1;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Ltq3;->g(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout;

    move-result-object p1

    invoke-super {p0, p1}, Lzp1;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4

    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0, p2}, Ltq3;->g(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout;

    move-result-object p1

    invoke-super {p0, p1}, Lzp1;->setContentView(Landroid/view/View;)V

    return-void
.end method
