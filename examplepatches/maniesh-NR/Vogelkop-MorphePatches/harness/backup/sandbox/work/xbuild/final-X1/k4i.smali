.class public final Lk4i;
.super Lltl;
.source "SourceFile"


# instance fields
.field public final r:Lua7;

.field public final s:Lzyk;

.field public t:Lkf;

.field public u:Li4i;

.field public v:Z

.field public w:Z


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    const v0, 0x7f0d01e4

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lk4i;->r:Lua7;

    new-instance p1, Lyse;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v0}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lk4i;->s:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0(Landroid/view/LayoutInflater;Li4i;)V
    .registers 12

    iput-object p2, p0, Lk4i;->u:Li4i;

    iget-object v0, p0, Lk4i;->t:Lkf;

    if-nez v0, :cond_7

    const/4 v0, 0x0

    :cond_7
    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-boolean v1, p2, Li4i;->a:Z

    iget-boolean p2, p2, Li4i;->b:Z

    const v2, 0x7f0a0c86

    const/4 v3, 0x0

    const v4, 0x7f0a026e

    const v5, 0x7f0a056f

    const v6, 0x7f0a086c

    const v7, 0x7f0a092c

    const-string v8, "Missing required view with ID: "

    if-eqz v1, :cond_cc

    if-eqz p2, :cond_78

    const p2, 0x7f0d01f2

    invoke-virtual {p1, p2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_67

    invoke-static {p2}, Lom9;->a(Landroid/view/View;)Lom9;

    invoke-static {v5, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    if-eqz p2, :cond_65

    invoke-static {v6, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    if-eqz p2, :cond_63

    invoke-static {v7, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;

    if-eqz v0, :cond_61

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v0, :cond_68

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lj4i;

    invoke-direct {p1, p2}, Lj4i;-><init>(Lcom/google/android/material/button/MaterialButton;)V

    goto/16 :goto_152

    :cond_61
    move v2, v7

    goto :goto_68

    :cond_63
    move v2, v6

    goto :goto_68

    :cond_65
    move v2, v5

    goto :goto_68

    :cond_67
    move v2, v4

    :cond_68
    :goto_68
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_78
    const p2, 0x7f0d01f3

    invoke-virtual {p1, p2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_bc

    invoke-static {p2}, Lom9;->a(Landroid/view/View;)Lom9;

    invoke-static {v5, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    if-eqz p2, :cond_bb

    const v4, 0x7f0a0570

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/widget/Guideline;

    if-eqz p2, :cond_bc

    invoke-static {v6, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    if-eqz p2, :cond_b9

    invoke-static {v7, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;

    if-eqz v0, :cond_b7

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lj4i;

    invoke-direct {p1, p2}, Lj4i;-><init>(Lcom/google/android/material/button/MaterialButton;)V

    goto/16 :goto_152

    :cond_b7
    move v4, v7

    goto :goto_bc

    :cond_b9
    move v4, v6

    goto :goto_bc

    :cond_bb
    move v4, v5

    :cond_bc
    :goto_bc
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_cc
    if-eqz p2, :cond_120

    const p2, 0x7f0d01f0

    invoke-virtual {p1, p2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_10f

    invoke-static {p2}, Lom9;->a(Landroid/view/View;)Lom9;

    invoke-static {v5, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    if-eqz p2, :cond_10d

    invoke-static {v6, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    if-eqz p2, :cond_10b

    invoke-static {v7, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;

    if-eqz v0, :cond_109

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v0, :cond_110

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lj4i;

    invoke-direct {p1, p2}, Lj4i;-><init>(Lcom/google/android/material/button/MaterialButton;)V

    goto :goto_152

    :cond_109
    move v2, v7

    goto :goto_110

    :cond_10b
    move v2, v6

    goto :goto_110

    :cond_10d
    move v2, v5

    goto :goto_110

    :cond_10f
    move v2, v4

    :cond_110
    :goto_110
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_120
    const p2, 0x7f0d01f1

    invoke-virtual {p1, p2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v4, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_162

    invoke-static {p2}, Lom9;->a(Landroid/view/View;)Lom9;

    invoke-static {v5, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    if-eqz p2, :cond_161

    invoke-static {v6, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/button/MaterialButton;

    if-eqz p2, :cond_15f

    invoke-static {v7, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/TopPaddingFadingScrollView;

    if-eqz v0, :cond_15d

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p1, Lj4i;

    invoke-direct {p1, p2}, Lj4i;-><init>(Lcom/google/android/material/button/MaterialButton;)V

    :goto_152
    new-instance p2, Lh4i;

    invoke-direct {p2, p0, v3}, Lh4i;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lj4i;->a:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_15d
    move v4, v7

    goto :goto_162

    :cond_15f
    move v4, v6

    goto :goto_162

    :cond_161
    move v4, v5

    :cond_162
    :goto_162
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v8, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final H0(Landroid/content/res/Configuration;)Li4i;
    .registers 3

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_7

    const/4 p1, 0x1

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    :goto_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_20

    invoke-static {}, Li0l;->g()Z

    move-result p0

    if-nez p0, :cond_20

    if-eqz p1, :cond_1d

    sget-object p0, Li4i;->d:Li4i;

    return-object p0

    :cond_1d
    sget-object p0, Li4i;->c:Li4i;

    return-object p0

    :cond_20
    if-eqz p1, :cond_25

    sget-object p0, Li4i;->f:Li4i;

    return-object p0

    :cond_25
    sget-object p0, Li4i;->e:Li4i;

    return-object p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0, p1}, Lk4i;->H0(Landroid/content/res/Configuration;)Li4i;

    move-result-object p1

    iget-object v0, p0, Lk4i;->u:Li4i;

    if-eq p1, v0, :cond_2c

    iget-object v0, p0, Lk4i;->t:Lkf;

    const/4 v1, 0x0

    if-nez v0, :cond_11

    move-object v0, v1

    :cond_11
    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p0, Lk4i;->t:Lkf;

    if-eqz v0, :cond_1d

    move-object v1, v0

    :cond_1d
    iget-object v0, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lk4i;->G0(Landroid/view/LayoutInflater;Li4i;)V

    :cond_2c
    return-void
.end method

.method public final onDestroy()V
    .registers 8

    iget-object v0, p0, Lk4i;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll4i;

    iget-object v1, p0, Lk4i;->r:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lg4i;

    iget-object v1, v1, Lg4i;->a:Lo3i;

    iget-boolean v2, p0, Lk4i;->w:Z

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v2, :cond_1c

    sget-object v2, Lvb0;->b:Lvb0;

    goto :goto_1e

    :cond_1c
    sget-object v2, Lvb0;->c:Lvb0;

    :goto_1e
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_40

    const/4 v3, 0x1

    if-eq v1, v3, :cond_3d

    const/4 v3, 0x2

    if-eq v1, v3, :cond_3a

    const/4 v3, 0x3

    if-eq v1, v3, :cond_37

    const/4 v3, 0x4

    if-ne v1, v3, :cond_33

    sget-object v1, Lyo0;->f:Lyo0;

    goto :goto_42

    :cond_33
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_37
    sget-object v1, Lyo0;->e:Lyo0;

    goto :goto_42

    :cond_3a
    sget-object v1, Lyo0;->d:Lyo0;

    goto :goto_42

    :cond_3d
    sget-object v1, Lyo0;->c:Lyo0;

    goto :goto_42

    :cond_40
    sget-object v1, Lyo0;->b:Lyo0;

    :goto_42
    iget-object v0, v0, Ll4i;->b:Lorm;

    check-cast v0, Lx5f;

    iget-boolean v3, v0, Lx5f;->h:Z

    if-eqz v3, :cond_66

    iget-object v3, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lck0;

    invoke-direct {v5, v3, v4}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v5}, Lck0;->d()Ltd0;

    move-result-object v3

    new-instance v5, Ljkc;

    const/16 v6, 0x18

    invoke-direct {v5, v1, v2, v6}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v5}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    :cond_66
    invoke-super {p0}, Lryl;->onDestroy()V

    return-void
.end method

.method public final onStart()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-boolean v0, p0, Lk4i;->v:Z

    if-nez v0, :cond_15

    const/4 v0, 0x1

    iput-boolean v0, p0, Lk4i;->v:Z

    new-instance v0, Lm4i;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lm4i;-><init>(I)V

    iget-object p0, p0, Lk4i;->r:Lua7;

    invoke-static {p0, v0}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    :cond_15
    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 4

    const v0, 0x7f0a02a9

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Lkf;->e(Landroid/view/View;)Lkf;

    move-result-object p2

    iput-object p2, p0, Lk4i;->t:Lkf;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-virtual {p0, p2}, Lk4i;->H0(Landroid/content/res/Configuration;)Li4i;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lk4i;->G0(Landroid/view/LayoutInflater;Li4i;)V

    return-void
.end method
