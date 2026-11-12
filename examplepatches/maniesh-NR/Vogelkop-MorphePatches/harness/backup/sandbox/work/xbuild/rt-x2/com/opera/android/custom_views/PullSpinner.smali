.class public Lcom/opera/android/custom_views/PullSpinner;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# static fields
.field public static final synthetic u:I


# instance fields
.field public a:I

.field public final b:F

.field public final c:F

.field public final d:Z

.field public final e:Lz9h;

.field public final f:F

.field public final g:I

.field public h:F

.field public i:F

.field public final j:F

.field public final k:F

.field public l:F

.field public m:J

.field public n:Landroid/animation/ValueAnimator;

.field public o:Z

.field public p:I

.field public q:I

.field public r:Landroid/animation/ValueAnimator;

.field public final s:Lix5;

.field public t:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 v0, 0x3d800000    # 0.0625f

    iput v0, p0, Lcom/opera/android/custom_views/PullSpinner;->b:F

    const v0, 0x3f066666    # 0.525f

    iput v0, p0, Lcom/opera/android/custom_views/PullSpinner;->c:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/PullSpinner;->d:Z

    new-instance v1, Lz9h;

    invoke-direct {v1}, Lz9h;-><init>()V

    iput-object v1, p0, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    const/high16 v2, 0x3f400000    # 0.75f

    iput v2, p0, Lcom/opera/android/custom_views/PullSpinner;->f:F

    const/high16 v2, 0x3f000000    # 0.5f

    iput v2, p0, Lcom/opera/android/custom_views/PullSpinner;->k:F

    new-instance v2, Lix5;

    const/16 v3, 0x1a

    invoke-direct {v2, v3}, Lix5;-><init>(B)V

    iput-object v2, p0, Lcom/opera/android/custom_views/PullSpinner;->s:Lix5;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07088d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f060f80

    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f060f7f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    move-result v2

    iput v2, v1, Lz9h;->c:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f060f83

    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    const/4 v2, 0x0

    const/4 v3, 0x4

    if-eqz p2, :cond_bb

    sget-object v4, Lkhh;->B:[I

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/16 p2, 0x8

    iget v4, v1, Lz9h;->b:I

    invoke-virtual {p1, p2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, v1, Lz9h;->b:I

    iget p2, v1, Lz9h;->a:I

    invoke-virtual {p1, v3, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, v1, Lz9h;->a:I

    iget p2, v1, Lz9h;->c:I

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, v1, Lz9h;->c:I

    const/4 p2, 0x5

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    iget p2, p0, Lcom/opera/android/custom_views/PullSpinner;->j:F

    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PullSpinner;->j:F

    const/4 p2, 0x6

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->f:F

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PullSpinner;->f:F

    const/4 p2, 0x7

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->k:F

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PullSpinner;->k:F

    const/16 p2, 0x9

    iget-boolean v0, p0, Lcom/opera/android/custom_views/PullSpinner;->d:Z

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/PullSpinner;->d:Z

    const/4 p2, 0x3

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->b:F

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PullSpinner;->b:F

    const/4 p2, 0x2

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->c:F

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/PullSpinner;->c:F

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_bb
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setWillNotDraw(Z)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    return-void
.end method


# virtual methods
.method public final a(F)V
    .registers 5

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->a:I

    const/4 v1, 0x0

    if-nez v0, :cond_b

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    const/4 v2, 0x3

    if-eq v0, v2, :cond_b

    move p1, v1

    :cond_b
    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_3a

    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    cmpg-float p1, p1, v1

    const/4 v0, 0x4

    if-gtz p1, :cond_1c

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_23

    :cond_1c
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :goto_23
    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_3a

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->a:I

    const/4 v1, 0x5

    if-eq p1, v1, :cond_2f

    if-ne p1, v0, :cond_3a

    :cond_2f
    const/high16 p1, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    :cond_3a
    return-void
.end method

.method public final b(I)V
    .registers 8

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->a:I

    const/4 v1, 0x2

    const/4 v2, 0x5

    const/4 v3, 0x4

    if-eq v0, v3, :cond_d

    if-eq v0, v2, :cond_b

    move v4, v0

    goto :goto_e

    :cond_b
    move v4, v1

    goto :goto_e

    :cond_d
    const/4 v4, 0x0

    :goto_e
    const/4 v5, 0x3

    if-ne v4, v1, :cond_13

    if-ne p1, v5, :cond_21

    :cond_13
    if-eq v0, p1, :cond_21

    if-eqz p1, :cond_1e

    if-eq p1, v1, :cond_1c

    if-eq p1, v5, :cond_1e

    goto :goto_1f

    :cond_1c
    move p1, v2

    goto :goto_1f

    :cond_1e
    move p1, v3

    :goto_1f
    if-ne v0, p1, :cond_22

    :cond_21
    return-void

    :cond_22
    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/PullSpinner;->c(I)V

    return-void
.end method

.method public final c(I)V
    .registers 14

    iget-object v0, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    iput-object v1, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    :cond_a
    const/4 v0, 0x2

    if-eq p1, v0, :cond_12

    iget-object v2, p0, Lcom/opera/android/custom_views/PullSpinner;->s:Lix5;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_12
    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->a:I

    const/4 v2, 0x0

    if-eqz p1, :cond_ca

    const/4 v3, 0x1

    if-eq p1, v3, :cond_c7

    const/4 v4, 0x5

    const/4 v5, 0x4

    if-eq p1, v5, :cond_20

    if-ne p1, v4, :cond_a5

    :cond_20
    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    if-eq p1, v5, :cond_7f

    if-ne p1, v4, :cond_a5

    iput-boolean v3, p0, Lcom/opera/android/custom_views/PullSpinner;->o:Z

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->k:F

    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->l:F

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    if-ne p1, v3, :cond_34

    iput-object v1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    goto :goto_58

    :cond_34
    new-array p1, v0, [F

    fill-array-data p1, :array_ce

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    iget v1, p0, Lcom/opera/android/custom_views/PullSpinner;->l:F

    sub-float v1, v6, v1

    float-to-double v8, v1

    const-wide v10, 0x4095b38e2a6bda1dL    # 1388.8888336994053

    mul-double/2addr v8, v10

    double-to-long v8, v8

    invoke-virtual {p1, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :goto_58
    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    if-ne p1, v3, :cond_63

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    invoke-static {v6, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    goto :goto_8e

    :cond_63
    iget v1, p0, Lcom/opera/android/custom_views/PullSpinner;->q:I

    int-to-float v1, v1

    const/4 v6, 0x3

    if-ne p1, v6, :cond_7c

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    const/high16 v6, 0x42f00000    # 120.0f

    mul-float/2addr p1, v6

    const/high16 v6, 0x43700000    # 240.0f

    add-float/2addr p1, v6

    iget v6, p0, Lcom/opera/android/custom_views/PullSpinner;->j:F

    add-float/2addr p1, v6

    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->i:F

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/opera/android/custom_views/PullSpinner;->m:J

    :cond_7c
    move p1, v1

    :goto_7d
    move v6, v7

    goto :goto_8e

    :cond_7f
    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    if-ne p1, v3, :cond_8a

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    invoke-static {v6, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    goto :goto_7d

    :cond_8a
    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->q:I

    int-to-float p1, p1

    goto :goto_7d

    :goto_8e
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    cmpl-float v1, p1, v6

    if-nez v1, :cond_a6

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    if-nez p1, :cond_a5

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->a:I

    if-eq p1, v5, :cond_a1

    if-eq p1, v4, :cond_a2

    move v0, p1

    goto :goto_a2

    :cond_a1
    move v0, v2

    :cond_a2
    :goto_a2
    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/PullSpinner;->c(I)V

    :cond_a5
    return-void

    :cond_a6
    new-array v0, v0, [F

    aput p1, v0, v2

    aput v6, v0, v3

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0xfa

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :cond_c7
    iput-boolean v2, p0, Lcom/opera/android/custom_views/PullSpinner;->o:Z

    return-void

    :cond_ca
    iput-boolean v2, p0, Lcom/opera/android/custom_views/PullSpinner;->o:Z

    return-void

    nop

    :array_ce
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x3

    iput v0, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/PullSpinner;->a(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    if-nez p1, :cond_9

    iget-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    if-nez p1, :cond_9

    return-void

    :cond_9
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->r:Landroid/animation/ValueAnimator;

    iput-object p1, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->a:I

    const/4 v0, 0x4

    if-eq p1, v0, :cond_18

    const/4 v0, 0x5

    if-ne p1, v0, :cond_19

    const/4 p1, 0x2

    goto :goto_19

    :cond_18
    const/4 p1, 0x0

    :cond_19
    :goto_19
    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/PullSpinner;->c(I)V

    return-void
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 6

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_19

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/PullSpinner;->a(F)V

    return-void

    :cond_19
    float-to-int p1, p1

    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->q:I

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->q:I

    int-to-float p1, p1

    const/4 v0, 0x0

    mul-float/2addr p1, v0

    float-to-int p1, p1

    iget v1, p0, Lcom/opera/android/custom_views/PullSpinner;->p:I

    sub-int v1, p1, v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    iget-object v3, v2, Lz9h;->f:Landroid/graphics/RectF;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v2, v2, Lz9h;->g:Landroid/graphics/RectF;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iput p1, p0, Lcom/opera/android/custom_views/PullSpinner;->p:I

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/PullSpinner;->a(F)V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 12

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_c2

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/opera/android/custom_views/PullSpinner;->m:J

    sub-long v2, v0, v2

    iput-wide v0, p0, Lcom/opera/android/custom_views/PullSpinner;->m:J

    iget-boolean v0, p0, Lcom/opera/android/custom_views/PullSpinner;->o:Z

    const-wide v4, 0x4076800000000000L    # 360.0

    const/high16 v1, 0x43b40000    # 360.0f

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    if-eqz v0, :cond_5d

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->i:F

    long-to-float v2, v2

    const v3, 0x3e3851ec    # 0.18f

    mul-float/2addr v3, v2

    mul-float/2addr v3, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v3, v1

    add-float/2addr v3, v0

    float-to-double v8, v3

    rem-double/2addr v8, v4

    double-to-float v0, v8

    iput v0, p0, Lcom/opera/android/custom_views/PullSpinner;->i:F

    iget v3, p0, Lcom/opera/android/custom_views/PullSpinner;->l:F

    const v4, 0x3f3851ec    # 0.72f

    mul-float/2addr v2, v4

    div-float/2addr v2, v1

    add-float/2addr v2, v3

    rem-float/2addr v2, v6

    iput v2, p0, Lcom/opera/android/custom_views/PullSpinner;->l:F

    invoke-virtual {v7, p1, v0, v2}, Lz9h;->c(Landroid/graphics/Canvas;FF)V

    iget-object v0, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_59

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_59

    iget-object v0, p0, Lcom/opera/android/custom_views/PullSpinner;->n:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iget v1, p0, Lcom/opera/android/custom_views/PullSpinner;->i:F

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v7, p1, v1, v0}, Lz9h;->a(Landroid/graphics/Canvas;FF)V

    :cond_59
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :cond_5d
    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    const/high16 v2, 0x42f00000    # 120.0f

    mul-float/2addr v2, v0

    const/high16 v3, 0x43700000    # 240.0f

    add-float/2addr v2, v3

    iget v3, p0, Lcom/opera/android/custom_views/PullSpinner;->j:F

    add-float/2addr v2, v3

    iput v2, p0, Lcom/opera/android/custom_views/PullSpinner;->i:F

    invoke-static {v6, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v2, 0x3f400000    # 0.75f

    sub-float/2addr v0, v2

    const/high16 v2, 0x40800000    # 4.0f

    mul-float/2addr v0, v2

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float/2addr v0, v2

    float-to-int v0, v0

    iget v2, p0, Lcom/opera/android/custom_views/PullSpinner;->i:F

    iget v3, p0, Lcom/opera/android/custom_views/PullSpinner;->h:F

    invoke-static {v6, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    const/16 v6, 0xff

    if-ge v0, v6, :cond_93

    iget-object v6, v7, Lz9h;->f:Landroid/graphics/RectF;

    const/16 v8, 0x1f

    invoke-virtual {p1, v6, v0, v8}, Landroid/graphics/Canvas;->saveLayerAlpha(Landroid/graphics/RectF;II)I

    move-result v0

    goto :goto_94

    :cond_93
    const/4 v0, 0x0

    :goto_94
    iget-object v6, v7, Lz9h;->h:Landroid/graphics/Paint;

    iget v8, v7, Lz9h;->a:I

    if-eqz v8, :cond_a7

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v8, v7, Lz9h;->g:Landroid/graphics/RectF;

    invoke-virtual {p1, v8, v6}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_a7
    invoke-virtual {v7, p1}, Lz9h;->d(Landroid/graphics/Canvas;)V

    iget v6, p0, Lcom/opera/android/custom_views/PullSpinner;->f:F

    mul-float/2addr v6, v1

    add-float/2addr v1, v2

    sub-float/2addr v1, v6

    float-to-double v8, v1

    rem-double/2addr v8, v4

    double-to-float v1, v8

    invoke-virtual {v7, p1, v1, v6}, Lz9h;->b(Landroid/graphics/Canvas;FF)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/PullSpinner;->d:Z

    if-eqz p0, :cond_bc

    invoke-virtual {v7, p1, v2, v3}, Lz9h;->a(Landroid/graphics/Canvas;FF)V

    :cond_bc
    const/4 p0, 0x1

    if-lt v0, p0, :cond_c2

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_c2
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 14

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    add-int/2addr p2, p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p3

    add-int/2addr p3, p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p2

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    iget p4, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    const/4 p5, 0x2

    invoke-static {p1, p4, p5, p3}, Lz1m;->d(IIII)I

    move-result p1

    iget p3, p0, Lcom/opera/android/custom_views/PullSpinner;->t:I

    const/4 p4, 0x3

    if-ne p3, p4, :cond_3a

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    iget p4, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    invoke-static {p2, p4, p5, p3}, Lz1m;->d(IIII)I

    move-result p2

    goto :goto_41

    :cond_3a
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    iget p3, p0, Lcom/opera/android/custom_views/PullSpinner;->p:I

    add-int/2addr p2, p3

    :goto_41
    int-to-float v1, p1

    int-to-float v2, p2

    iget p3, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    add-int/2addr p1, p3

    int-to-float v3, p1

    add-int/2addr p2, p3

    int-to-float v4, p2

    int-to-float v5, p3

    iget p1, p0, Lcom/opera/android/custom_views/PullSpinner;->b:F

    mul-float v6, p1, v5

    iget v7, p0, Lcom/opera/android/custom_views/PullSpinner;->c:F

    iget-object v0, p0, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    invoke-virtual/range {v0 .. v7}, Lz9h;->e(FFFFFFF)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 7

    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    add-int/2addr v0, v1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/high16 v2, -0x80000000

    const/high16 v3, 0x40000000    # 2.0f

    if-eq v1, v3, :cond_24

    if-ne v1, v2, :cond_20

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_20
    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    :cond_24
    iget v0, p0, Lcom/opera/android/custom_views/PullSpinner;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    add-int/2addr v0, v1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-eq v1, v3, :cond_44

    if-ne v1, v2, :cond_40

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_40
    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    :cond_44
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method
