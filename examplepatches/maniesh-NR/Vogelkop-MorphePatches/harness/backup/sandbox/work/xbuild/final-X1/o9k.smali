.class public final Lo9k;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Leak;


# instance fields
.field public final a:Likc;

.field public final b:Lmsl;

.field public final c:Lcom/opera/android/startup/WelcomeActivity;

.field public final d:Lmcj;

.field public final e:Lpde;

.field public final f:Lpde;

.field public g:Lor2;

.field public h:Ld0n;

.field public i:Ld0n;

.field public j:Ld0n;

.field public k:Z

.field public l:Z

.field public m:Z


# direct methods
.method public constructor <init>(Likc;Lmsl;Lcom/opera/android/startup/WelcomeActivity;Lmcj;)V
    .registers 5

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    iput-object p1, p0, Lo9k;->a:Likc;

    iput-object p2, p0, Lo9k;->b:Lmsl;

    iput-object p3, p0, Lo9k;->c:Lcom/opera/android/startup/WelcomeActivity;

    iput-object p4, p0, Lo9k;->d:Lmcj;

    new-instance p1, Lpde;

    sget-object p2, Lkl0;->j:Lkl0;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lo9k;->e:Lpde;

    new-instance p1, Lpde;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lo9k;->f:Lpde;

    return-void
.end method


# virtual methods
.method public final T()Likc;
    .registers 1

    iget-object p0, p0, Lo9k;->e:Lpde;

    return-object p0
.end method

.method public final f0(Ld0n;Z)V
    .registers 8

    iget-object v0, p1, Ld0n;->h:Lpde;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->q(Lndc;)V

    const/4 v0, 0x0

    iput-boolean v0, p1, Ld0n;->g:Z

    iget-object v1, p1, Ld0n;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p1, Ld0n;->i:Lnl2;

    iget-object v3, v1, Ln2d;->d:Lf3d;

    iget-object v4, v3, Lf3d;->b:Lp3d;

    invoke-virtual {v4, v2}, Lp3d;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    invoke-virtual {v3, v0}, Lf3d;->p(I)V

    invoke-virtual {v1}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->w()V

    iget-object v0, p1, Ld0n;->e:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz p2, :cond_50

    iget-object p2, p0, Lo9k;->g:Lor2;

    if-nez p2, :cond_41

    const/4 p2, 0x0

    :cond_41
    iget-object p2, p2, Lor2;->c:Landroid/view/View;

    check-cast p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v0, Ljri;

    const/16 v1, 0xd

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_50
    invoke-virtual {p1, v1}, Ld0n;->a(F)V

    return-void
.end method

.method public final g0()Ld0n;
    .registers 4

    iget-object v0, p0, Lo9k;->h:Ld0n;

    const/4 v1, 0x0

    if-nez v0, :cond_7

    move-object v2, v1

    goto :goto_8

    :cond_7
    move-object v2, v0

    :goto_8
    iget-boolean v2, v2, Ld0n;->g:Z

    if-eqz v2, :cond_f

    if-eqz v0, :cond_2b

    return-object v0

    :cond_f
    iget-object v0, p0, Lo9k;->i:Ld0n;

    if-nez v0, :cond_15

    move-object v2, v1

    goto :goto_16

    :cond_15
    move-object v2, v0

    :goto_16
    iget-boolean v2, v2, Ld0n;->g:Z

    if-eqz v2, :cond_1d

    if-eqz v0, :cond_2b

    return-object v0

    :cond_1d
    iget-object p0, p0, Lo9k;->j:Ld0n;

    if-nez p0, :cond_23

    move-object v0, v1

    goto :goto_24

    :cond_23
    move-object v0, p0

    :goto_24
    iget-boolean v0, v0, Ld0n;->g:Z

    if-eqz v0, :cond_2b

    if-eqz p0, :cond_2b

    return-object p0

    :cond_2b
    return-object v1
.end method

.method public final h0(Le0n;)Ld0n;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1d

    const/4 v1, 0x1

    if-eq p1, v1, :cond_17

    const/4 v1, 0x2

    if-ne p1, v1, :cond_13

    iget-object p0, p0, Lo9k;->j:Ld0n;

    if-nez p0, :cond_12

    return-object v0

    :cond_12
    return-object p0

    :cond_13
    invoke-static {}, Lh9o;->p()V

    return-object v0

    :cond_17
    iget-object p0, p0, Lo9k;->i:Ld0n;

    if-nez p0, :cond_1c

    return-object v0

    :cond_1c
    return-object p0

    :cond_1d
    iget-object p0, p0, Lo9k;->h:Ld0n;

    if-nez p0, :cond_22

    return-object v0

    :cond_22
    return-object p0
.end method

.method public final i0()V
    .registers 4

    iget-boolean v0, p0, Lo9k;->l:Z

    if-eqz v0, :cond_39

    iget-object v0, p0, Lo9k;->a:Likc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Ls9k;->a:Ls9k;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    iget-object v0, p0, Lo9k;->g:Lor2;

    const/4 v1, 0x0

    if-nez v0, :cond_18

    move-object v0, v1

    :cond_18
    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    iget-object v0, p0, Lo9k;->g:Lor2;

    if-eqz v0, :cond_26

    move-object v1, v0

    :cond_26
    iget-object v0, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    iget-object v0, p0, Lo9k;->b:Lmsl;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmsl;->b(Z)V

    iget-object p0, p0, Lo9k;->c:Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->X()V

    :cond_39
    return-void
.end method

.method public final j0()V
    .registers 6

    iget-boolean v0, p0, Lo9k;->k:Z

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lo9k;->g:Lor2;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    move-object v0, v1

    :cond_a
    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const-wide/16 v2, 0x1b8

    if-eqz v0, :cond_41

    iget-object v0, p0, Lo9k;->g:Lor2;

    if-nez v0, :cond_1b

    move-object v0, v1

    :cond_1b
    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V

    iget-object v0, p0, Lo9k;->g:Lor2;

    if-nez v0, :cond_27

    move-object v0, v1

    :cond_27
    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/startup/ContentWrapperLayout;

    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V

    iget-object v0, p0, Lo9k;->g:Lor2;

    if-eqz v0, :cond_33

    move-object v1, v0

    :cond_33
    iget-object v0, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v1, Lmni;

    const/16 v4, 0x19

    invoke-direct {v1, p0, v4}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_41
    sget-object v0, Le0n;->a:Le0n;

    invoke-virtual {p0, v0}, Lo9k;->h0(Le0n;)Ld0n;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v3}, Lo9k;->k0(Ld0n;J)V

    :cond_4a
    return-void
.end method

.method public final k0(Ld0n;J)V
    .registers 11

    const/4 v0, 0x1

    iput-boolean v0, p1, Ld0n;->g:Z

    iget-object v1, p1, Ld0n;->d:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget v2, p1, Ld0n;->b:I

    invoke-virtual {v1, v2}, Ln2d;->j(I)V

    new-instance v2, Li3d;

    sget-object v3, Lk3d;->a:Landroid/graphics/PointF;

    const v3, 0x7f0402ed

    const-string v4, "Neutral colors/surface"

    const/4 v5, 0x0

    invoke-direct {v2, v3, v0, v4, v5}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v0, Li3d;

    const-string v4, "Stroke/Neutral colors/surface"

    const/4 v6, 0x2

    invoke-direct {v0, v3, v6, v4, v5}, Li3d;-><init>(IILjava/lang/String;Z)V

    filled-new-array {v2, v0}, [Li3d;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->z([Li3d;)V

    iget-object v0, p1, Ld0n;->i:Lnl2;

    iget-object v2, v1, Ln2d;->d:Lf3d;

    iget-object v2, v2, Lf3d;->b:Lp3d;

    invoke-virtual {v2, v0}, Lp3d;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, p1, Ld0n;->g:Z

    if-eqz v0, :cond_50

    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    iget-object v0, p1, Ld0n;->e:Landroid/widget/TextView;

    iget-object v1, p1, Ld0n;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V

    new-instance v1, Lnpl;

    const/16 v2, 0x11

    invoke-direct {v1, p1, v0, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-wide/16 v2, 0x1b8

    add-long/2addr p2, v2

    invoke-virtual {v0, v1, p2, p3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_50
    iget-object p2, p1, Ld0n;->h:Lpde;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p3

    new-instance v0, Lq59;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lq59;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, p3, v0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 34

    move-object/from16 v0, p0

    const v1, 0x7f0d03c6

    const/4 v2, 0x0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-virtual {v3, v1, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a0277

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/opera/android/startup/ContentWrapperLayout;

    if-eqz v7, :cond_13a

    const v3, 0x7f0a0281

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v8, :cond_13a

    const v3, 0x7f0a04a9

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    if-eqz v15, :cond_13a

    const v3, 0x7f0a0876

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v4, :cond_13a

    const v3, 0x7f0a0951

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v22, v4

    check-cast v22, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    if-eqz v22, :cond_13a

    const v3, 0x7f0a0ab2

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v11, :cond_13a

    const v3, 0x7f0a0b85

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    if-eqz v12, :cond_13a

    const v3, 0x7f0a0c7c

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v13, :cond_13a

    const v3, 0x7f0a0c7d

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v14, :cond_13a

    const v3, 0x7f0a0c7e

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v28, v4

    check-cast v28, Landroid/widget/TextView;

    if-eqz v28, :cond_13a

    new-instance v5, Lor2;

    move-object v6, v1

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    move-object v9, v15

    move-object/from16 v10, v22

    move-object/from16 v15, v28

    invoke-direct/range {v5 .. v15}, Lor2;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/startup/ContentWrapperLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Lcom/opera/android/widget/ThemeableLottieAnimationView;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextView;)V

    move-object/from16 v29, v12

    move-object v15, v9

    new-instance v1, La3j;

    const/16 v3, 0xd

    invoke-direct {v1, v3}, La3j;-><init>(B)V

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v13, v1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    const/4 v1, 0x1

    iget-object v3, v0, Lo9k;->d:Lmcj;

    invoke-virtual {v3, v1}, Lmcj;->t(Z)V

    invoke-virtual {v3, v2}, Lmcj;->r(Z)V

    new-instance v1, Lal9;

    const/4 v3, 0x3

    invoke-direct {v1, v3, v5, v0, v2}, Lal9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v2, v11, Ln2d;->d:Lf3d;

    iget-object v2, v2, Lf3d;->b:Lp3d;

    invoke-virtual {v2, v1}, Lp3d;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Ld7k;

    invoke-direct {v2, v0, v5, v3}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lt7d;

    const/16 v4, 0x14

    invoke-direct {v3, v2, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v2, v0, Lo9k;->f:Lpde;

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v9, Ld0n;

    sget-object v10, Le0n;->a:Le0n;

    const v11, 0x7f130044

    const-string v12, "Browse with confidence"

    move-object v13, v14

    move-object/from16 v14, v28

    invoke-direct/range {v9 .. v15}, Ld0n;-><init>(Le0n;ILjava/lang/String;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;)V

    move-object v14, v13

    iput-object v9, v0, Lo9k;->h:Ld0n;

    new-instance v16, Ld0n;

    sget-object v17, Le0n;->b:Le0n;

    const v18, 0x7f130045

    const-string v19, "Block ads, boost speed!"

    move-object/from16 v20, v14

    move-object/from16 v21, v28

    invoke-direct/range {v16 .. v22}, Ld0n;-><init>(Le0n;ILjava/lang/String;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;)V

    move-object/from16 v1, v16

    iput-object v1, v0, Lo9k;->i:Ld0n;

    new-instance v23, Ld0n;

    sget-object v24, Le0n;->c:Le0n;

    const v25, 0x7f130046

    const-string v26, "Chat with browser AI"

    move-object/from16 v27, v14

    invoke-direct/range {v23 .. v29}, Ld0n;-><init>(Le0n;ILjava/lang/String;Lcom/opera/android/widget/ThemeableLottieAnimationView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;)V

    move-object/from16 v1, v23

    iput-object v1, v0, Lo9k;->j:Ld0n;

    new-instance v1, Lj5g;

    const/16 v2, 0x13

    invoke-direct {v1, v0, v5, v2}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v8, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v1, Lkl0;->j:Lkl0;

    iput-object v1, v7, Lcom/opera/android/startup/ContentWrapperLayout;->d:Lkl0;

    iput-object v5, v0, Lo9k;->g:Lor2;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Ln6k;

    const/16 v3, 0x9

    invoke-direct {v2, v0, v3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v2, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v2, v0, Lo9k;->a:Likc;

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-boolean v1, v0, Lo9k;->m:Z

    if-nez v1, :cond_134

    iget-object v1, v0, Lo9k;->b:Lmsl;

    invoke-virtual {v1}, Lmsl;->a()V

    :cond_134
    iget-object v0, v0, Lo9k;->c:Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->Y()V

    return-object v6

    :cond_13a
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final onPause()V
    .registers 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lo9k;->k:Z

    iget-object v1, p0, Lo9k;->g:Lor2;

    const/4 v2, 0x0

    if-nez v1, :cond_c

    move-object v1, v2

    :cond_c
    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_23

    iget-object v1, p0, Lo9k;->g:Lor2;

    if-eqz v1, :cond_1b

    move-object v2, v1

    :cond_1b
    iget-object v1, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    goto :goto_44

    :cond_23
    invoke-virtual {p0}, Lo9k;->g0()Ld0n;

    move-result-object v1

    if-eqz v1, :cond_2c

    invoke-virtual {p0, v1, v0}, Lo9k;->f0(Ld0n;Z)V

    :cond_2c
    iget-object v1, p0, Lo9k;->g:Lor2;

    if-nez v1, :cond_31

    move-object v1, v2

    :cond_31
    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    iget-object v1, p0, Lo9k;->g:Lor2;

    if-eqz v1, :cond_3d

    move-object v2, v1

    :cond_3d
    iget-object v1, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/startup/ContentWrapperLayout;

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    :goto_44
    iget-object p0, p0, Lo9k;->b:Lmsl;

    invoke-virtual {p0, v0}, Lmsl;->b(Z)V

    return-void
.end method

.method public final onResume()V
    .registers 6

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lo9k;->k:Z

    iget-object v1, p0, Lo9k;->g:Lor2;

    const/4 v2, 0x0

    if-nez v1, :cond_c

    move-object v1, v2

    :cond_c
    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_5c

    iget-object v1, p0, Lo9k;->g:Lor2;

    if-eqz v1, :cond_1b

    move-object v2, v1

    :cond_1b
    iget-object v1, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v2, v1, Ln2d;->d:Lf3d;

    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    iget-object v3, v2, Lf3d;->b:Lp3d;

    invoke-virtual {v3}, Lp3d;->b()F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_3c

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2, v0}, Ln2d;->o(FZ)V

    iget-object v0, p0, Lo9k;->f:Lpde;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    goto :goto_5f

    :cond_3c
    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    iget-object v0, v2, Lf3d;->a:Lp2d;

    if-nez v0, :cond_4f

    iget-object v0, v2, Lf3d;->e:Ljava/util/ArrayList;

    new-instance v3, Lc3d;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4, v4}, Lc3d;-><init>(Lf3d;IB)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_58

    :cond_4f
    iget-object v0, v2, Lf3d;->b:Lp3d;

    iget v2, v0, Lp3d;->k:F

    float-to-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v0, v4, v2}, Lp3d;->l(FF)V

    :goto_58
    invoke-virtual {v1}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    goto :goto_5f

    :cond_5c
    invoke-virtual {p0}, Lo9k;->j0()V

    :goto_5f
    iget-boolean v0, p0, Lo9k;->m:Z

    if-nez v0, :cond_68

    iget-object p0, p0, Lo9k;->b:Lmsl;

    invoke-virtual {p0}, Lmsl;->a()V

    :cond_68
    return-void
.end method
