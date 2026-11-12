.class public final Lpvl;
.super Luul;
.source "SourceFile"


# instance fields
.field public final l:I

.field public final m:Lp12;

.field public n:Z

.field public final o:Lk6l;

.field public final p:Lcom/opera/android/bar/LimitedSideActionsAppbar;

.field public final q:Lz8b;


# direct methods
.method public constructor <init>(Lpt3;Lk6l;Ltt3;Lcom/opera/android/bar/TopToolbarContainer;Lysl;Lcom/opera/android/BrowserActivity;Lz8b;Lpde;)V
    .registers 18

    move-object/from16 v8, p7

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v1, p6

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Luul;-><init>(Lcom/opera/android/BrowserActivity;Lpt3;Lk6l;Lesk;Lcom/opera/android/bar/TopToolbarContainer;Lysl;Lpde;)V

    invoke-virtual {p4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f070a0b

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lpvl;->l:I

    iput-object p2, p0, Lpvl;->o:Lk6l;

    const p1, 0x7f0a010a

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/bar/LimitedSideActionsAppbar;

    iput-object p1, p0, Lpvl;->p:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    iput-object v8, p0, Lpvl;->q:Lz8b;

    new-instance p3, Lmvl;

    invoke-direct {p3, p0}, Lmvl;-><init>(Lpvl;)V

    new-instance p4, Lp7l;

    const/16 p5, 0x12

    invoke-direct {p4, p0, p5}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p6}, Lndc;->getLifecycle()Ltcc;

    move-result-object p5

    invoke-static {p2, p5, p3, p4}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p2, v8, Lz8b;->a:Ljava/lang/Object;

    check-cast p2, Lpde;

    new-instance p3, Lkvl;

    const/4 p4, 0x0

    invoke-direct {p3, p0, p4}, Lkvl;-><init>(Lpvl;B)V

    invoke-virtual {p2, p6, p3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, v8, Lz8b;->b:Ljava/lang/Object;

    check-cast p2, Lpde;

    new-instance p3, Lkvl;

    const/4 p5, 0x1

    invoke-direct {p3, p0, p5}, Lkvl;-><init>(Lpvl;B)V

    invoke-virtual {p2, p6, p3}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p2, Lp12;

    new-instance p3, Llvl;

    invoke-direct {p3, p0, p4}, Llvl;-><init>(Lpvl;B)V

    new-instance v1, Llvl;

    invoke-direct {v1, p0, p5}, Llvl;-><init>(Lpvl;B)V

    new-instance p5, Llvl;

    const/4 v2, 0x2

    invoke-direct {p5, p0, v2}, Llvl;-><init>(Lpvl;B)V

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lx43;

    sget-object v3, Lyul;->d:Lyul;

    invoke-direct {v2, v3}, Lx43;-><init>(Lyul;)V

    iput-object v2, p2, Lp12;->e:Ljava/lang/Object;

    iput-object p1, p2, Lp12;->a:Ljava/lang/Object;

    iput-object p3, p2, Lp12;->b:Ljava/lang/Object;

    iput-object v1, p2, Lp12;->c:Ljava/lang/Object;

    iput-object p5, p2, Lp12;->d:Ljava/lang/Object;

    new-instance p5, Lesg;

    const v2, 0x7f0a0793

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Ldvj;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Ldvj;-><init>(B)V

    invoke-direct {p5, v2, v3}, Lesg;-><init>(Landroid/view/View;Lybf;)V

    iput-object p5, p2, Lp12;->h:Ljava/lang/Object;

    iput-object p2, p1, Lu43;->c:Lt43;

    iget-object p5, p2, Lp12;->e:Ljava/lang/Object;

    check-cast p5, Lx43;

    iget-object p5, p5, Lx43;->a:Lyul;

    iget p5, p5, Lyul;->a:F

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {p3, v2}, Llvl;->run(Ljava/lang/Object;)V

    invoke-virtual {p1, p5}, Landroid/view/View;->setAlpha(F)V

    const/4 p3, 0x0

    cmpl-float p3, p5, p3

    if-nez p3, :cond_ac

    const/16 p4, 0x8

    :cond_ac
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p2, Lp12;->e:Ljava/lang/Object;

    check-cast p1, Lx43;

    iget-object p1, p1, Lx43;->a:Lyul;

    iget p1, p1, Lyul;->a:F

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {v1, p1}, Llvl;->run(Ljava/lang/Object;)V

    iput-object p2, p0, Lpvl;->m:Lp12;

    return-void
.end method


# virtual methods
.method public final A(Lx43;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lpvl;->n:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_10

    iget-boolean v2, v0, Lz43;->a:Z

    if-eqz v2, :cond_10

    move v2, v4

    goto :goto_11

    :cond_10
    move v2, v3

    :goto_11
    iget-object v0, v0, Lpvl;->m:Lp12;

    iget-object v5, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v5, Lx43;

    invoke-virtual {v1, v5}, Lx43;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    return-void

    :cond_1e
    iget-object v5, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v5, Lx43;

    iput-object v1, v0, Lp12;->e:Ljava/lang/Object;

    iget-object v5, v5, Lx43;->a:Lyul;

    iget-object v1, v1, Lx43;->a:Lyul;

    iget v8, v1, Lyul;->a:F

    iget-object v6, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v6, Landroid/animation/ValueAnimator;

    const/4 v13, 0x0

    iput-object v13, v0, Lp12;->f:Ljava/lang/Object;

    if-eqz v6, :cond_3b

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v7

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->cancel()V

    goto :goto_3d

    :cond_3b
    iget v7, v5, Lyul;->a:F

    :goto_3d
    sub-float v6, v8, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v9

    const/4 v14, 0x0

    cmpl-float v6, v9, v14

    const/4 v15, 0x4

    if-lez v6, :cond_6f

    if-eqz v2, :cond_53

    invoke-virtual {v5, v1}, Lyul;->d(Lyul;)Z

    move-result v6

    if-eqz v6, :cond_53

    move v6, v4

    goto :goto_54

    :cond_53
    move v6, v3

    :goto_54
    new-instance v10, Lnvl;

    invoke-direct {v10, v0, v3}, Lnvl;-><init>(Lp12;B)V

    new-instance v11, Lrl;

    invoke-direct {v11, v15}, Lrl;-><init>(B)V

    new-instance v12, Lovl;

    invoke-direct {v12, v0, v3}, Lovl;-><init>(Lp12;B)V

    invoke-static/range {v6 .. v12}, Lp12;->y(ZFFFLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    move-result-object v6

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v7

    if-eqz v7, :cond_6f

    iput-object v6, v0, Lp12;->f:Ljava/lang/Object;

    :cond_6f
    iget v6, v1, Lyul;->a:F

    iget-object v7, v0, Lp12;->g:Ljava/lang/Object;

    check-cast v7, Landroid/animation/ValueAnimator;

    iput-object v13, v0, Lp12;->g:Ljava/lang/Object;

    if-eqz v7, :cond_83

    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v8

    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->cancel()V

    :goto_80
    move/from16 v17, v8

    goto :goto_86

    :cond_83
    iget v8, v5, Lyul;->a:F

    goto :goto_80

    :goto_86
    sub-float v7, v6, v17

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v19

    cmpl-float v7, v19, v14

    if-lez v7, :cond_c0

    if-eqz v2, :cond_9b

    invoke-virtual {v5, v1}, Lyul;->d(Lyul;)Z

    move-result v1

    if-eqz v1, :cond_9b

    move/from16 v16, v4

    goto :goto_9d

    :cond_9b
    move/from16 v16, v3

    :goto_9d
    new-instance v1, Lnvl;

    invoke-direct {v1, v0, v4}, Lnvl;-><init>(Lp12;B)V

    new-instance v2, Lrl;

    invoke-direct {v2, v15}, Lrl;-><init>(B)V

    new-instance v3, Lovl;

    invoke-direct {v3, v0, v4}, Lovl;-><init>(Lp12;B)V

    move-object/from16 v20, v1

    move-object/from16 v21, v2

    move-object/from16 v22, v3

    move/from16 v18, v6

    invoke-static/range {v16 .. v22}, Lp12;->y(ZFFFLandroid/animation/ValueAnimator$AnimatorUpdateListener;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_c0

    iput-object v1, v0, Lp12;->g:Ljava/lang/Object;

    :cond_c0
    iget-object v1, v0, Lp12;->d:Ljava/lang/Object;

    check-cast v1, Llvl;

    iget-object v0, v0, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Lx43;

    invoke-virtual {v1, v0}, Llvl;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final B(Z)V
    .registers 2

    iput-boolean p1, p0, Lpvl;->n:Z

    return-void
.end method

.method public final E()V
    .registers 4

    iget-object v0, p0, Lpvl;->o:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    goto :goto_d

    :cond_b
    sget-object v0, Lp6l;->a:Lp6l;

    :goto_d
    iget-object v1, p0, Lpvl;->q:Lz8b;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_24

    if-ne v0, v2, :cond_20

    iget-object v0, v1, Lz8b;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    goto :goto_28

    :cond_20
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_24
    iget-object v0, v1, Lz8b;->a:Ljava/lang/Object;

    check-cast v0, Lpde;

    :goto_28
    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8k;

    iget-object v0, v0, Lf8k;->f:Lv8k;

    iget-object p0, p0, Lpvl;->p:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    iget-object p0, p0, Lcom/opera/android/bar/LimitedSideActionsAppbar;->d:Liec;

    sget-object v1, Lv8k;->b:Lv8k;

    if-eq v0, v1, :cond_39

    const/4 v2, 0x0

    :cond_39
    iget-boolean v0, p0, Liec;->b:Z

    if-ne v0, v2, :cond_3e

    return-void

    :cond_3e
    iput-boolean v2, p0, Liec;->b:Z

    iget-object p0, p0, Liec;->h:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final b(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)Lv73;
    .registers 23

    new-instance v0, Lodg;

    new-instance v7, Lcrk;

    const/16 v1, 0x12

    invoke-direct {v7, p0, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    invoke-direct/range {v0 .. v11}, Lodg;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lcrk;Lin3;Lk5o;Likc;Lu0a;)V

    return-object v0
.end method

.method public final e()I
    .registers 1

    iget p0, p0, Lpvl;->l:I

    return p0
.end method

.method public final i()Lbp;
    .registers 4

    iget-object p0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    invoke-virtual {p0}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object p0

    if-eqz p0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v1, 0x258

    if-lt v0, v1, :cond_29

    new-instance v0, Lbp;

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    neg-int v1, v1

    invoke-direct {v0, p0, v1}, Lbp;-><init>(Ljava/lang/Object;I)V

    return-object v0

    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public final j()J
    .registers 8

    iget-object p0, p0, Lpvl;->m:Lp12;

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lx43;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lx43;->a:Lyul;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_1e

    const/4 v3, 0x1

    if-ne p0, v3, :cond_28

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    move-result-wide v3

    goto :goto_29

    :cond_1e
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getDuration()J

    move-result-wide v3

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    goto :goto_29

    :cond_28
    move-wide v3, v1

    :goto_29
    long-to-float p0, v3

    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-lez p0, :cond_30

    return-wide v3

    :cond_30
    return-wide v1
.end method

.method public final k()Lx43;
    .registers 1

    iget-object p0, p0, Lpvl;->m:Lp12;

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lx43;

    return-object p0
.end method

.method public final n()Z
    .registers 2

    iget-object p0, p0, Lpvl;->m:Lp12;

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1a

    :cond_e
    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p0

    if-eqz p0, :cond_1c

    :cond_1a
    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final o()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final s()V
    .registers 4

    invoke-super {p0}, Luul;->s()V

    iget-object v0, p0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v2, v1

    if-eqz v1, :cond_29

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    iget-object p0, p0, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_19
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly43;

    invoke-interface {v0, v2}, Ly43;->p(F)V

    goto :goto_19

    :cond_29
    return-void
.end method

.method public final v()V
    .registers 2

    iget-object p0, p0, Lpvl;->m:Lp12;

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    :cond_b
    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    :cond_14
    return-void
.end method

.method public final w(Z)V
    .registers 3

    iget-object p0, p0, Lpvl;->m:Lp12;

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bar/LimitedSideActionsAppbar;

    iget-object p0, p0, Lcom/opera/android/bar/LimitedSideActionsAppbar;->d:Liec;

    iget-boolean v0, p0, Liec;->c:Z

    if-ne v0, p1, :cond_d

    return-void

    :cond_d
    iput-boolean p1, p0, Liec;->c:Z

    iget-object p0, p0, Liec;->h:Lcom/opera/android/bar/LimitedSideActionsAppbar;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
