.class public final Lcwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpvk;


# instance fields
.field public final a:Lcom/opera/android/StatusBarDrawingFrameLayout;

.field public final b:Landroid/view/View;

.field public final c:Landroid/view/View;

.field public final d:Lxt3;

.field public final e:Lcom/opera/android/custom_views/StylingTextView;

.field public final f:Landroid/view/animation/PathInterpolator;

.field public final g:Lqsh;

.field public final h:Lwt3;

.field public final i:Lwv1;

.field public final j:Landroid/view/animation/PathInterpolator;

.field public k:I

.field public l:Lb2l;

.field public m:Lb2l;

.field public n:Z

.field public o:Ls03;

.field public final p:I

.field public final q:I

.field public final r:I

.field public s:I

.field public final t:I

.field public u:I

.field public v:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/StatusBarDrawingFrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/opera/android/browser/chromium/ChromiumContainerView;Lwt3;Lwv1;Lxt3;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Llf1;->j:Landroid/view/animation/PathInterpolator;

    iput-object v0, p0, Lcwk;->f:Landroid/view/animation/PathInterpolator;

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const/4 v1, 0x0

    const v2, 0x3f28f5c3    # 0.66f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v1, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object v0, p0, Lcwk;->j:Landroid/view/animation/PathInterpolator;

    iput-object p1, p0, Lcwk;->a:Lcom/opera/android/StatusBarDrawingFrameLayout;

    iput-object p2, p0, Lcwk;->b:Landroid/view/View;

    iput-object p3, p0, Lcwk;->c:Landroid/view/View;

    iput-object p8, p0, Lcwk;->d:Lxt3;

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    const p2, 0x7f0a0b44

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    iput-object p2, p0, Lcwk;->e:Lcom/opera/android/custom_views/StylingTextView;

    new-instance p2, Lqsh;

    const/4 p3, 0x5

    invoke-direct {p2, p4, p5, p3}, Lqsh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lcwk;->g:Lqsh;

    iput-object p6, p0, Lcwk;->h:Lwt3;

    iput-object p7, p0, Lcwk;->i:Lwv1;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 p2, 0x42c80000    # 100.0f

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lcwk;->p:I

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    const/4 p3, 0x1

    const/high16 p4, 0x41200000    # 10.0f

    invoke-static {p3, p4, p2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Lcwk;->q:I

    const/high16 p2, 0x43200000    # 160.0f

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p4

    invoke-static {p3, p2, p4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Lcwk;->t:I

    const/high16 p2, 0x430c0000    # 140.0f

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {p3, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcwk;->r:I

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    if-eqz p1, :cond_7

    const/4 p0, 0x2

    if-eq p1, p0, :cond_7

    const/4 p0, 0x0

    return p0

    :cond_7
    const/4 p0, 0x1

    return p0
.end method

.method public final b(IIIIII)V
    .registers 7

    invoke-virtual {p0, p5}, Lcwk;->g(I)V

    return-void
.end method

.method public final c(IIIIII)V
    .registers 7

    invoke-static {p6}, Ljava/lang/Math;->abs(I)I

    move-result p1

    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-le p1, p2, :cond_b

    return-void

    :cond_b
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcwk;->v:Z

    iget-object p1, p0, Lcwk;->g:Lqsh;

    iget-object p1, p1, Lqsh;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    const/high16 p2, 0x3f000000    # 0.5f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    int-to-float p2, p5

    const p4, 0x3d088889

    mul-float/2addr p2, p4

    neg-int p4, p1

    int-to-float p4, p4

    int-to-float p1, p1

    invoke-static {p2, p4, p1}, Lnb6;->i(FFF)F

    move-result p1

    float-to-int p1, p1

    add-int/2addr p3, p1

    invoke-virtual {p0, p3}, Lcwk;->g(I)V

    return-void
.end method

.method public final d()V
    .registers 12

    iget-object v0, p0, Lcwk;->g:Lqsh;

    iget-object v1, v0, Lqsh;->b:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcwk;->m:Lb2l;

    const/4 v4, 0x0

    if-eqz v3, :cond_20

    iget v3, p0, Lcwk;->p:I

    if-ge v2, v3, :cond_1e

    iget v3, p0, Lcwk;->s:I

    div-int/lit8 v3, v3, 0x3

    if-lt v2, v3, :cond_20

    :cond_1e
    const/4 v3, 0x1

    goto :goto_21

    :cond_20
    move v3, v4

    :goto_21
    if-nez v3, :cond_26

    invoke-virtual {p0, v4}, Lcwk;->f(Z)V

    :cond_26
    iget v5, p0, Lcwk;->s:I

    sub-int v2, v5, v2

    mul-int/lit16 v2, v2, 0xc8

    div-int/2addr v2, v5

    iget v5, p0, Lcwk;->k:I

    if-nez v5, :cond_39

    if-eqz v3, :cond_3f

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    neg-int v4, v4

    goto :goto_3f

    :cond_39
    if-eqz v3, :cond_3f

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v4

    :cond_3f
    :goto_3f
    new-instance v5, Lwr9;

    invoke-direct {v5, p0, v3}, Lwr9;-><init>(Lcwk;Z)V

    new-instance v6, Lvr9;

    const/4 v7, 0x2

    invoke-direct {v6, v5, v7}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    iget-object v0, v0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v7, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v9, v2

    invoke-virtual {v0, v9, v10}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-float v2, v4

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v7, v8}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9, v10}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcwk;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v7, v8}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9, v10}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lcwk;->u:I

    add-int/2addr v1, v4

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    iget-object v0, p0, Lcwk;->e:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_a3

    iget-boolean v1, p0, Lcwk;->v:Z

    if-nez v1, :cond_a3

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v1

    const v2, 0x3e4ccccd    # 0.2f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_a3

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_a4

    :cond_a3
    const/4 v1, 0x0

    :goto_a4
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v9, v10}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lcwk;->f:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    const/4 v0, 0x0

    iput-object v0, p0, Lcwk;->m:Lb2l;

    return-void
.end method

.method public final e(III)V
    .registers 6

    iget-object p2, p0, Lcwk;->g:Lqsh;

    iget-object p3, p2, Lqsh;->b:Ljava/lang/Object;

    check-cast p3, Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroid/view/View;->setTranslationX(F)V

    iget-object p2, p2, Lqsh;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationX(F)V

    iget-object p2, p0, Lcwk;->c:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcwk;->a:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p2, p3}, Lcom/opera/android/StatusBarDrawingFrameLayout;->setVisibility(I)V

    iget-object p2, p0, Lcwk;->b:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p2, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object p2, p0, Lcwk;->o:Ls03;

    if-eqz p2, :cond_50

    invoke-static {p2}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v1, 0x1

    iput-boolean v1, p2, Ls03;->b:Z

    const/4 p2, 0x0

    iput-object p2, p0, Lcwk;->o:Ls03;

    :cond_50
    iget-object p2, p0, Lcwk;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    iput-boolean p3, p0, Lcwk;->v:Z

    invoke-virtual {p0, p1}, Lcwk;->h(I)Z

    invoke-virtual {p0, p3}, Lcwk;->f(Z)V

    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-boolean v0, p0, Lcwk;->n:Z

    if-eq v0, p1, :cond_12

    if-nez p1, :cond_a

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcwk;->n:Z

    return-void

    :cond_a
    iget-object p1, p0, Lcwk;->m:Lb2l;

    if-eqz p1, :cond_12

    iget-object p1, p0, Lcwk;->l:Lb2l;

    if-eqz p1, :cond_13

    :cond_12
    return-void

    :cond_13
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcwk;->n:Z

    return-void
.end method

.method public final g(I)V
    .registers 9

    iget v0, p0, Lcwk;->k:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_f

    if-lez p1, :cond_f

    invoke-virtual {p0, v1}, Lcwk;->h(I)Z

    move-result v0

    if-nez v0, :cond_1a

    goto :goto_19

    :cond_f
    if-ne v0, v1, :cond_1a

    if-gez p1, :cond_1a

    invoke-virtual {p0, v2}, Lcwk;->h(I)Z

    move-result v0

    if-nez v0, :cond_1a

    :goto_19
    return-void

    :cond_1a
    iget-object v0, p0, Lcwk;->m:Lb2l;

    const/4 v1, 0x1

    if-nez v0, :cond_21

    move v0, v1

    goto :goto_22

    :cond_21
    move v0, v2

    :goto_22
    if-eqz v0, :cond_27

    iget v3, p0, Lcwk;->t:I

    goto :goto_29

    :cond_27
    iget v3, p0, Lcwk;->s:I

    :goto_29
    iget v4, p0, Lcwk;->k:I

    if-nez v4, :cond_33

    neg-int v4, v3

    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    goto :goto_37

    :cond_33
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_37
    if-eqz v0, :cond_4c

    int-to-float p1, p1

    int-to-float v3, v3

    div-float v3, p1, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget-object v4, p0, Lcwk;->j:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v4, v3}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    move-result v3

    mul-float/2addr v3, p1

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr v3, p1

    float-to-int p1, v3

    :cond_4c
    iget v3, p0, Lcwk;->u:I

    add-int/2addr v3, p1

    int-to-float v3, v3

    iget-object v4, p0, Lcwk;->c:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setTranslationX(F)V

    iget-object v3, p0, Lcwk;->g:Lqsh;

    iget-object v4, v3, Lqsh;->b:Ljava/lang/Object;

    check-cast v4, Landroid/view/View;

    int-to-float v5, p1

    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationX(F)V

    iget-object v3, v3, Lqsh;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    iget-boolean v3, p0, Lcwk;->v:Z

    iget v4, p0, Lcwk;->q:I

    const/4 v6, 0x0

    if-nez v3, :cond_86

    if-nez v0, :cond_86

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v3

    int-to-float v5, v4

    sub-float/2addr v3, v5

    iget v5, p0, Lcwk;->p:I

    sub-int/2addr v5, v4

    int-to-float v5, v5

    div-float/2addr v3, v5

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v3, v6, v5}, Lnb6;->i(FFF)F

    move-result v3

    iget-object v5, p0, Lcwk;->f:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v5, v3}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    move-result v6

    :cond_86
    iget-object v3, p0, Lcwk;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, v6}, Landroid/view/View;->setAlpha(F)V

    if-nez v0, :cond_94

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-lt p1, v4, :cond_94

    move v2, v1

    :cond_94
    invoke-virtual {p0, v2}, Lcwk;->f(Z)V

    return-void
.end method

.method public final h(I)Z
    .registers 15

    invoke-virtual {p0, p1}, Lcwk;->a(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6b

    iget-object v0, p0, Lcwk;->h:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lk6l;

    iget-object v3, v2, Lk6l;->o:Lb2l;

    iput-object v3, p0, Lcwk;->l:Lb2l;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk6l;

    iget-object v3, v0, Lk6l;->o:Lb2l;

    iget-object v4, v0, Lk6l;->b:Ljava/util/ArrayList;

    const/4 v5, 0x2

    iget-object v6, p0, Lcwk;->a:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v7, 0x1

    const/4 v8, -0x1

    if-eqz v3, :cond_58

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v9

    if-ltz v9, :cond_58

    invoke-static {v6}, Lcs5;->W(Landroid/view/View;)Z

    move-result v10

    if-eqz v10, :cond_33

    if-ne p1, v5, :cond_37

    goto :goto_35

    :cond_33
    if-nez p1, :cond_37

    :goto_35
    add-int/2addr v9, v7

    goto :goto_38

    :cond_37
    sub-int/2addr v9, v7

    :goto_38
    if-ltz v9, :cond_58

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v9, v4, :cond_58

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->m()Z

    move-result v3

    if-eqz v3, :cond_51

    invoke-virtual {v0}, Lk6l;->q()I

    move-result v0

    if-ge v9, v0, :cond_57

    goto :goto_58

    :cond_51
    invoke-virtual {v0}, Lk6l;->q()I

    move-result v0

    if-ge v9, v0, :cond_58

    :cond_57
    move v8, v9

    :cond_58
    :goto_58
    const/4 v0, 0x0

    if-gez v8, :cond_5d

    move-object v2, v0

    goto :goto_65

    :cond_5d
    iget-object v2, v2, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2l;

    :goto_65
    iput-object v2, p0, Lcwk;->m:Lb2l;

    iget-object v2, p0, Lcwk;->l:Lb2l;

    if-nez v2, :cond_6c

    :cond_6b
    return v1

    :cond_6c
    iput p1, p0, Lcwk;->k:I

    iget-object p1, p0, Lcwk;->g:Lqsh;

    iget-object p1, p1, Lqsh;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    iput v2, p0, Lcwk;->s:I

    iget v2, p0, Lcwk;->k:I

    if-nez v2, :cond_80

    move v3, v7

    goto :goto_81

    :cond_80
    move v3, v1

    :goto_81
    invoke-static {v6}, Lcs5;->W(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_8a

    if-ne v2, v5, :cond_8e

    goto :goto_8c

    :cond_8a
    if-nez v2, :cond_8e

    :goto_8c
    move v2, v7

    goto :goto_8f

    :cond_8e
    move v2, v1

    :goto_8f
    iget-object v4, p0, Lcwk;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, v4, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    if-eqz v2, :cond_9b

    const/4 v8, 0x6

    goto :goto_9c

    :cond_9b
    const/4 v8, 0x5

    :goto_9c
    iget-object v9, v6, Lvr3;->c:Ljava/lang/Object;

    check-cast v9, Landroid/widget/TextView;

    iget v10, v6, Lvr3;->a:I

    if-eq v10, v8, :cond_c3

    iput v8, v6, Lvr3;->a:I

    invoke-virtual {v9}, Landroid/widget/TextView;->getGravity()I

    move-result v8

    iget v10, v6, Lvr3;->a:I

    if-eq v10, v7, :cond_c0

    move-object v10, v9

    check-cast v10, Llgl;

    invoke-interface {v10}, Llgl;->l()Z

    move-result v10

    const v11, -0x800008

    and-int/2addr v8, v11

    iget v11, v6, Lvr3;->a:I

    invoke-virtual {v6, v11, v10}, Lvr3;->e(IZ)I

    move-result v6

    or-int/2addr v8, v6

    :cond_c0
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setGravity(I)V

    :cond_c3
    if-eqz v3, :cond_c9

    const v6, 0x7f0803df

    goto :goto_cc

    :cond_c9
    const v6, 0x7f08051e

    :goto_cc
    invoke-static {v6, v5}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v2, :cond_d5

    move-object v12, v6

    move-object v6, v0

    move-object v0, v12

    :cond_d5
    invoke-virtual {v4, v6, v0}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-eqz v2, :cond_e2

    const v2, 0x7f140807

    goto :goto_e5

    :cond_e2
    const v2, 0x7f140808

    :goto_e5
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v1, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iget v2, p0, Lcwk;->r:I

    if-le v1, v2, :cond_106

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, " "

    const-string v2, "\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_106
    iget-object v0, p0, Lcwk;->c:Landroid/view/View;

    if-eqz v3, :cond_10f

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    goto :goto_114

    :cond_10f
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result p1

    neg-int p1, p1

    :goto_114
    iput p1, p0, Lcwk;->u:I

    int-to-float p0, p1

    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationX(F)V

    if-eqz v3, :cond_120

    const p0, 0x7f0809a0

    goto :goto_123

    :cond_120
    const p0, 0x7f08099e

    :goto_123
    invoke-static {p0, v5}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return v7
.end method
