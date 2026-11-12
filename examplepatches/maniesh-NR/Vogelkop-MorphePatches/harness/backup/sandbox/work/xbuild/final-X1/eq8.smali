.class public final Leq8;
.super Liph;
.source "SourceFile"

# interfaces
.implements Lnph;


# static fields
.field public static final C:[I

.field public static final D:[I


# instance fields
.field public A:B

.field public final B:Lig;

.field public final a:I

.field public final b:I

.field public final c:Landroid/graphics/drawable/StateListDrawable;

.field public final d:Landroid/graphics/drawable/Drawable;

.field public final e:I

.field public final f:I

.field public final g:Landroid/graphics/drawable/StateListDrawable;

.field public final h:Landroid/graphics/drawable/Drawable;

.field public final i:I

.field public final j:I

.field public k:I

.field public l:I

.field public m:F

.field public n:I

.field public o:I

.field public p:F

.field public q:I

.field public r:I

.field public final s:Landroidx/recyclerview/widget/RecyclerView;

.field public t:Z

.field public u:Z

.field public v:B

.field public w:B

.field public final x:[I

.field public final y:[I

.field public final z:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a7

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Leq8;->C:[I

    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Leq8;->D:[I

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;III)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Leq8;->q:I

    iput v0, p0, Leq8;->r:I

    iput-boolean v0, p0, Leq8;->t:Z

    iput-boolean v0, p0, Leq8;->u:Z

    iput-byte v0, p0, Leq8;->v:B

    iput-byte v0, p0, Leq8;->w:B

    const/4 v1, 0x2

    new-array v2, v1, [I

    iput-object v2, p0, Leq8;->x:[I

    new-array v2, v1, [I

    iput-object v2, p0, Leq8;->y:[I

    new-array v2, v1, [F

    fill-array-data v2, :array_aa

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    iput-object v2, p0, Leq8;->z:Landroid/animation/ValueAnimator;

    iput-byte v0, p0, Leq8;->A:B

    new-instance v0, Lig;

    const/16 v3, 0x1c

    invoke-direct {v0, p0, v3}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Leq8;->B:Lig;

    new-instance v3, Lyc3;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lyc3;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Leq8;->c:Landroid/graphics/drawable/StateListDrawable;

    iput-object p3, p0, Leq8;->d:Landroid/graphics/drawable/Drawable;

    iput-object p4, p0, Leq8;->g:Landroid/graphics/drawable/StateListDrawable;

    iput-object p5, p0, Leq8;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-static {p6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Leq8;->e:I

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-static {p6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Leq8;->f:I

    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p4

    invoke-static {p6, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    iput p4, p0, Leq8;->i:I

    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p4

    invoke-static {p6, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    iput p4, p0, Leq8;->j:I

    iput p7, p0, Leq8;->a:I

    iput p8, p0, Leq8;->b:I

    const/16 p4, 0xff

    invoke-virtual {p2, p4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p3, p4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    new-instance p2, Lin8;

    invoke-direct {p2, p0}, Lin8;-><init>(Leq8;)V

    invoke-virtual {v2, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-instance p2, Ljq3;

    invoke-direct {p2, p0, v1}, Ljq3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p2, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    if-ne p2, p1, :cond_86

    return-void

    :cond_86
    if-eqz p2, :cond_9a

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->q0(Liph;)V

    iget-object p2, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->s0(Lnph;)V

    iget-object p2, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, v3}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    iget-object p2, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_9a
    iput-object p1, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object p1, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    iget-object p0, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    return-void

    :array_aa
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static g(FF[IIII)I
    .registers 8

    const/4 v0, 0x1

    aget v0, p2, v0

    const/4 v1, 0x0

    aget p2, p2, v1

    sub-int/2addr v0, p2

    if-eqz v0, :cond_16

    sub-float/2addr p1, p0

    int-to-float p0, v0

    div-float/2addr p1, p0

    sub-int/2addr p3, p5

    int-to-float p0, p3

    mul-float/2addr p1, p0

    float-to-int p0, p1

    add-int/2addr p4, p0

    if-ge p4, p3, :cond_16

    if-ltz p4, :cond_16

    return p0

    :cond_16
    return v1
.end method


# virtual methods
.method public final b(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 7

    iget-byte p1, p0, Leq8;->v:B

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-ne p1, v1, :cond_45

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p0, p1, v2}, Leq8;->f(FF)Z

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, v2, v3}, Leq8;->e(FF)Z

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_48

    if-nez p1, :cond_28

    if-eqz v2, :cond_48

    :cond_28
    if-eqz v2, :cond_35

    iput-byte v1, p0, Leq8;->w:B

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Leq8;->p:F

    goto :goto_41

    :cond_35
    if-eqz p1, :cond_41

    iput-byte v0, p0, Leq8;->w:B

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Leq8;->m:F

    :cond_41
    :goto_41
    invoke-virtual {p0, v0}, Leq8;->h(I)V

    return v1

    :cond_45
    if-ne p1, v0, :cond_48

    return v1

    :cond_48
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Z)V
    .registers 2

    return-void
.end method

.method public final d(Landroid/view/MotionEvent;)V
    .registers 15

    iget-byte v0, p0, Leq8;->v:B

    if-eqz v0, :cond_ea

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-nez v0, :cond_45

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, v0, v3}, Leq8;->f(FF)Z

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {p0, v3, v4}, Leq8;->e(FF)Z

    move-result v3

    if-nez v0, :cond_28

    if-eqz v3, :cond_ea

    :cond_28
    if-eqz v3, :cond_35

    iput-byte v2, p0, Leq8;->w:B

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Leq8;->p:F

    goto :goto_41

    :cond_35
    if-eqz v0, :cond_41

    iput-byte v1, p0, Leq8;->w:B

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Leq8;->m:F

    :cond_41
    :goto_41
    invoke-virtual {p0, v1}, Leq8;->h(I)V

    return-void

    :cond_45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v3, 0x0

    if-ne v0, v2, :cond_5b

    iget-byte v0, p0, Leq8;->v:B

    if-ne v0, v1, :cond_5b

    const/4 p1, 0x0

    iput p1, p0, Leq8;->m:F

    iput p1, p0, Leq8;->p:F

    invoke-virtual {p0, v2}, Leq8;->h(I)V

    iput-byte v3, p0, Leq8;->w:B

    return-void

    :cond_5b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_ea

    iget-byte v0, p0, Leq8;->v:B

    if-ne v0, v1, :cond_ea

    invoke-virtual {p0}, Leq8;->i()V

    iget-byte v0, p0, Leq8;->w:B

    iget-object v4, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    const/high16 v5, 0x40000000    # 2.0f

    iget v6, p0, Leq8;->b:I

    if-ne v0, v2, :cond_ac

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v9, p0, Leq8;->y:[I

    aput v6, v9, v3

    iget v7, p0, Leq8;->q:I

    sub-int/2addr v7, v6

    aput v7, v9, v2

    int-to-float v8, v6

    int-to-float v7, v7

    invoke-static {v7, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iget v0, p0, Leq8;->o:I

    int-to-float v0, v0

    sub-float/2addr v0, v8

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v5

    if-ltz v0, :cond_ac

    iget v7, p0, Leq8;->p:F

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollRange()I

    move-result v10

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    move-result v11

    iget v12, p0, Leq8;->q:I

    invoke-static/range {v7 .. v12}, Leq8;->g(FF[IIII)I

    move-result v0

    if-eqz v0, :cond_aa

    invoke-virtual {v4, v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    :cond_aa
    iput v8, p0, Leq8;->p:F

    :cond_ac
    iget-byte v0, p0, Leq8;->w:B

    if-ne v0, v1, :cond_ea

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v9, p0, Leq8;->x:[I

    aput v6, v9, v3

    iget v0, p0, Leq8;->r:I

    sub-int/2addr v0, v6

    aput v0, v9, v2

    int-to-float v1, v6

    int-to-float v0, v0

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iget p1, p0, Leq8;->l:I

    int-to-float p1, p1

    sub-float/2addr p1, v8

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpg-float p1, p1, v5

    if-ltz p1, :cond_ea

    iget v7, p0, Leq8;->m:F

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    move-result v10

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result v11

    iget v12, p0, Leq8;->r:I

    invoke-static/range {v7 .. v12}, Leq8;->g(FF[IIII)I

    move-result p1

    if-eqz p1, :cond_e8

    invoke-virtual {v4, v3, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    :cond_e8
    iput v8, p0, Leq8;->m:F

    :cond_ea
    return-void
.end method

.method public final e(FF)Z
    .registers 5

    iget v0, p0, Leq8;->r:I

    iget v1, p0, Leq8;->i:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_21

    iget p2, p0, Leq8;->o:I

    iget p0, p0, Leq8;->n:I

    div-int/lit8 v0, p0, 0x2

    sub-int v0, p2, v0

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_21

    div-int/lit8 p0, p0, 0x2

    add-int/2addr p0, p2

    int-to-float p0, p0

    cmpg-float p0, p1, p0

    if-gtz p0, :cond_21

    const/4 p0, 0x1

    return p0

    :cond_21
    const/4 p0, 0x0

    return p0
.end method

.method public final f(FF)Z
    .registers 6

    iget-object v0, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    iget v1, p0, Leq8;->e:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_11

    int-to-float v0, v1

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_2d

    goto :goto_19

    :cond_11
    iget v0, p0, Leq8;->q:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_2d

    :goto_19
    iget p1, p0, Leq8;->l:I

    iget p0, p0, Leq8;->k:I

    div-int/lit8 p0, p0, 0x2

    sub-int v0, p1, p0

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_2d

    add-int/2addr p0, p1

    int-to-float p0, p0

    cmpg-float p0, p2, p0

    if-gtz p0, :cond_2d

    return v2

    :cond_2d
    const/4 p0, 0x0

    return p0
.end method

.method public final h(I)V
    .registers 7

    iget-object v0, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Leq8;->B:Lig;

    iget-object v2, p0, Leq8;->c:Landroid/graphics/drawable/StateListDrawable;

    const/4 v3, 0x2

    if-ne p1, v3, :cond_15

    iget-byte v4, p0, Leq8;->v:B

    if-eq v4, v3, :cond_15

    sget-object v4, Leq8;->C:[I

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_15
    if-nez p1, :cond_1b

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    goto :goto_1e

    :cond_1b
    invoke-virtual {p0}, Leq8;->i()V

    :goto_1e
    iget-byte v4, p0, Leq8;->v:B

    if-ne v4, v3, :cond_32

    if-eq p1, v3, :cond_32

    sget-object v3, Leq8;->D:[I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3d

    :cond_32
    const/4 v2, 0x1

    if-ne p1, v2, :cond_3d

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3d
    :goto_3d
    iput-byte p1, p0, Leq8;->v:B

    return-void
.end method

.method public final i()V
    .registers 5

    iget-byte v0, p0, Leq8;->A:B

    iget-object v1, p0, Leq8;->z:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_d

    const/4 v2, 0x3

    if-eq v0, v2, :cond_a

    return-void

    :cond_a
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_d
    const/4 v0, 0x1

    iput-byte v0, p0, Leq8;->A:B

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput p0, v2, v3

    const/high16 p0, 0x3f800000    # 1.0f

    aput p0, v2, v0

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 12

    iget p2, p0, Leq8;->q:I

    iget-object p3, p0, Leq8;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    if-ne p2, v0, :cond_a3

    iget p2, p0, Leq8;->r:I

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v0

    if-ne p2, v0, :cond_a3

    iget-byte p2, p0, Leq8;->A:B

    if-eqz p2, :cond_a2

    iget-boolean p2, p0, Leq8;->t:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_6f

    iget p2, p0, Leq8;->q:I

    iget v2, p0, Leq8;->e:I

    sub-int/2addr p2, v2

    iget v3, p0, Leq8;->l:I

    iget v4, p0, Leq8;->k:I

    div-int/lit8 v5, v4, 0x2

    sub-int/2addr v3, v5

    iget-object v5, p0, Leq8;->c:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v5, v1, v1, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget v4, p0, Leq8;->f:I

    iget v6, p0, Leq8;->r:I

    iget-object v7, p0, Leq8;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v1, v1, v4, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p3}, Landroid/view/View;->getLayoutDirection()I

    move-result p3

    const/4 v4, 0x1

    if-ne p3, v4, :cond_5a

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    int-to-float p2, v2

    int-to-float p3, v3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 p2, -0x40800000    # -1.0f

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->scale(FF)V

    neg-int p2, v2

    int-to-float p2, p2

    neg-int p3, v3

    int-to-float p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_6f

    :cond_5a
    int-to-float p3, p2

    invoke-virtual {p1, p3, v0}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    int-to-float p3, v3

    invoke-virtual {p1, v0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-int p2, p2

    int-to-float p2, p2

    neg-int p3, v3

    int-to-float p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_6f
    :goto_6f
    iget-boolean p2, p0, Leq8;->u:Z

    if-eqz p2, :cond_a2

    iget p2, p0, Leq8;->r:I

    iget p3, p0, Leq8;->i:I

    sub-int/2addr p2, p3

    iget v2, p0, Leq8;->o:I

    iget v3, p0, Leq8;->n:I

    div-int/lit8 v4, v3, 0x2

    sub-int/2addr v2, v4

    iget-object v4, p0, Leq8;->g:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v4, v1, v1, v3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget p3, p0, Leq8;->q:I

    iget v3, p0, Leq8;->j:I

    iget-object p0, p0, Leq8;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v1, p3, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    int-to-float p3, p2

    invoke-virtual {p1, v0, p3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    int-to-float p0, v2

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    neg-int p0, v2

    int-to-float p0, p0

    neg-int p2, p2

    int-to-float p2, p2

    invoke-virtual {p1, p0, p2}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_a2
    return-void

    :cond_a3
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result p1

    iput p1, p0, Leq8;->q:I

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p1

    iput p1, p0, Leq8;->r:I

    invoke-virtual {p0, v1}, Leq8;->h(I)V

    return-void
.end method
