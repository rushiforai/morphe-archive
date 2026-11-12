.class public final Lv35;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lv35;->a:B

    iput-object p1, p0, Lv35;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 11

    iget-byte v0, p0, Lv35;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lv35;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_68

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :sswitch_d
    check-cast v2, Lhdo;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p0

    iput p0, v2, Lhdo;->j:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p0

    iput p0, v2, Lhdo;->k:F

    iput-byte v1, v2, Lhdo;->l:B

    return v1

    :sswitch_1e
    sget v0, Lydb;->H:I

    move-object v3, v2

    check-cast v3, Lydb;

    iget-boolean v0, v3, Lydb;->D:Z

    if-eqz v0, :cond_63

    iget-object v0, v3, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isQuickScaleEnabled()Z

    move-result v0

    if-nez v0, :cond_67

    iput-boolean v1, v3, Lydb;->e:Z

    invoke-virtual {v3}, Lydb;->h()F

    move-result v0

    invoke-virtual {v3}, Lydb;->f()F

    move-result v1

    invoke-virtual {v3}, Lydb;->g()F

    move-result v2

    iget v4, v3, Lydb;->y:F

    add-float/2addr v0, v4

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_45

    move v2, v0

    :cond_45
    invoke-virtual {v3}, Lydb;->f()F

    move-result v0

    invoke-virtual {v3}, Lydb;->g()F

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iget v0, v3, Lydb;->m:I

    int-to-long v7, v0

    invoke-virtual/range {v3 .. v8}, Lydb;->p(FFFJ)V

    :cond_63
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v1

    :cond_67
    return v1

    :sswitch_data_68
    .sparse-switch
        0x2 -> :sswitch_1e
        0x7 -> :sswitch_d
    .end sparse-switch
.end method

.method public final onDown(Landroid/view/MotionEvent;)Z
    .registers 4

    iget-byte v0, p0, Lv35;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_b
    return v1

    :pswitch_c
    sget p1, Lydb;->H:I

    iget-object p0, p0, Lv35;->b:Ljava/lang/Object;

    check-cast p0, Lydb;

    iget-object p1, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    const/4 p1, 0x0

    iput-object p1, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    :cond_1c
    iget-boolean p0, p0, Lydb;->l:Z

    xor-int/2addr p0, v1

    return p0

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method

.method public final onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 14

    iget-byte v0, p0, Lv35;->a:B

    packed-switch v0, :pswitch_data_11c

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lv35;->b:Ljava/lang/Object;

    check-cast p0, Lydb;

    iget-boolean v0, p0, Lydb;->F:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_11b

    if-eqz p1, :cond_11b

    if-eqz p2, :cond_11b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_11b

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-gt p1, v0, :cond_11b

    iget-object p1, p0, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result p1

    if-nez p1, :cond_11b

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iget-wide v2, p0, Lydb;->G:J

    sub-long/2addr p1, v2

    const-wide/16 v2, 0x96

    cmp-long p1, p1, v2

    if-lez p1, :cond_11b

    invoke-virtual {p0}, Lydb;->h()F

    move-result p1

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_45

    move p1, v0

    goto :goto_52

    :cond_45
    iget-object p1, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {p0, p1}, Lydb;->b(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    iget-object p2, p0, Lydb;->u:Landroid/graphics/RectF;

    invoke-virtual {p2, p1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result p1

    xor-int/2addr p1, v0

    :goto_52
    if-eqz p1, :cond_11b

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lydb;->n:I

    const/4 v2, 0x2

    shl-int/2addr p2, v2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-gtz p1, :cond_6d

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lydb;->n:I

    shl-int/2addr p2, v2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_11b

    :cond_6d
    invoke-virtual {p0}, Lydb;->h()F

    move-result p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    const/high16 p2, 0x40400000    # 3.0f

    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iget p2, p0, Lydb;->o:I

    int-to-float p2, p2

    div-float/2addr p3, p2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p2

    int-to-float p2, p2

    mul-float/2addr p2, p1

    mul-float/2addr p2, p3

    iget p3, p0, Lydb;->o:I

    int-to-float p3, p3

    div-float/2addr p4, p3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p3

    int-to-float p3, p3

    mul-float/2addr p3, p1

    mul-float/2addr p3, p4

    iput-boolean v0, p0, Lydb;->e:Z

    float-to-double v3, p2

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    float-to-double v7, p3

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    add-double/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    const-wide/high16 v5, 0x4014000000000000L    # 5.0

    div-double/2addr v3, v5

    const-wide v5, 0x4072c00000000000L    # 300.0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    const-wide/high16 v5, 0x4089000000000000L    # 800.0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v3

    double-to-long v3, v3

    new-array p1, v2, [F

    const/4 p4, 0x0

    aput p4, p1, v1

    aput p2, p1, v0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    new-array p2, v2, [F

    aput p4, p2, v1

    aput p3, p2, v0

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    invoke-virtual {p2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p2

    iget-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    if-eqz p3, :cond_e1

    invoke-virtual {p3}, Landroid/animation/Animator;->cancel()V

    const/4 p3, 0x0

    iput-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    :cond_e1
    new-instance p3, Landroid/animation/AnimatorSet;

    invoke-direct {p3}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    new-array p4, v2, [Landroid/animation/Animator;

    aput-object p1, p4, v1

    aput-object p2, p4, v0

    invoke-virtual {p3, p4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    invoke-virtual {p3, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    iget-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    new-instance p4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p3, p4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p3, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    invoke-virtual {p3}, Landroid/animation/Animator;->start()V

    new-instance p3, Le0b;

    invoke-direct {p3, p0, p1, p2}, Le0b;-><init>(Lydb;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lydb;->w:Landroid/animation/AnimatorSet;

    new-instance p2, Ldf1;

    invoke-direct {p2, p0, v2}, Ldf1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    move v1, v0

    :cond_11b
    return v1

    :pswitch_data_11c
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final onLongPress(Landroid/view/MotionEvent;)V
    .registers 6

    iget-byte v0, p0, Lv35;->a:B

    iget-object v1, p0, Lv35;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6e

    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    return-void

    :pswitch_b
    check-cast v1, Lflb;

    iget-object p0, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v1, Lflb;->q:Lblb;

    if-eqz p0, :cond_54

    invoke-virtual {v1, p1}, Lflb;->m(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_54

    iget-object v2, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p0

    if-eqz p0, :cond_54

    iget-object v2, v1, Lflb;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2, p0}, Lblb;->h(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getLayoutDirection()I

    move-result v2

    invoke-static {v3, v2}, Lblb;->e(II)I

    move-result v2

    const/high16 v3, 0xff0000

    and-int/2addr v2, v3

    if-eqz v2, :cond_54

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iget v2, v1, Lflb;->p:I

    if-ne p1, v2, :cond_54

    iget p1, v1, Lflb;->g:F

    iput p1, v1, Lflb;->e:F

    iget p1, v1, Lflb;->h:F

    iput p1, v1, Lflb;->f:F

    const/4 p1, 0x0

    iput p1, v1, Lflb;->m:F

    iput p1, v1, Lflb;->l:F

    invoke-virtual {v0}, Lblb;->m()Z

    move-result p1

    if-eqz p1, :cond_54

    const/4 p1, 0x2

    invoke-virtual {v1, p0, p1}, Lflb;->r(Landroidx/recyclerview/widget/i;I)V

    :cond_54
    return-void

    :pswitch_55
    check-cast v1, Lydb;

    invoke-virtual {v1}, Landroid/view/View;->isLongClickable()Z

    move-result p0

    if-eqz p0, :cond_6c

    iget-object p0, v1, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result p0

    if-nez p0, :cond_6c

    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Landroid/view/View;->setPressed(Z)V

    invoke-virtual {v1}, Landroid/view/View;->performLongClick()Z

    :cond_6c
    return-void

    nop

    :pswitch_data_6e
    .packed-switch 0x2
        :pswitch_55
        :pswitch_b
    .end packed-switch
.end method

.method public final onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6

    iget-byte v0, p0, Lv35;->a:B

    packed-switch v0, :pswitch_data_56

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lv35;->b:Ljava/lang/Object;

    check-cast p0, Lydb;

    iget-boolean v0, p0, Lydb;->F:Z

    if-eqz v0, :cond_53

    if-eqz p1, :cond_53

    if-eqz p2, :cond_53

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_53

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-gt p1, v0, :cond_53

    iget-object p1, p0, Lydb;->z:Landroid/view/ScaleGestureDetector;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result p1

    if-nez p1, :cond_53

    invoke-virtual {p0}, Lydb;->h()F

    move-result p1

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_37

    move p1, v0

    goto :goto_44

    :cond_37
    iget-object p1, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {p0, p1}, Lydb;->b(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    iget-object p2, p0, Lydb;->u:Landroid/graphics/RectF;

    invoke-virtual {p2, p1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result p1

    xor-int/2addr p1, v0

    :goto_44
    if-eqz p1, :cond_53

    iput-boolean v0, p0, Lydb;->e:Z

    neg-float p1, p3

    neg-float p2, p4

    float-to-double p3, p1

    float-to-double p1, p2

    invoke-virtual {p0, p3, p4, p1, p2}, Lydb;->k(DD)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_54

    :cond_53
    const/4 v0, 0x0

    :goto_54
    return v0

    nop

    :pswitch_data_56
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 5

    iget-byte v0, p0, Lv35;->a:B

    iget-object v1, p0, Lv35;->b:Ljava/lang/Object;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_4a

    :pswitch_8
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_d
    check-cast v1, Lsue;

    iget-object p0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    :pswitch_14
    return v2

    :pswitch_15
    check-cast v1, Lota;

    invoke-virtual {v1}, Landroid/view/View;->performClick()Z

    iget-object p0, v1, Lota;->e:Lghf;

    if-eqz p0, :cond_2f

    const-class p1, Lwg7;

    invoke-static {p1}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    :cond_2f
    return v2

    :pswitch_30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p0

    float-to-int p0, p0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    check-cast v1, Lcom/opera/android/widget/ClickAwareCardView;

    invoke-static {v1, v1, p0, p1}, Lfan;->b(Landroid/view/ViewGroup;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_49

    iget-object p1, v1, Lcom/opera/android/widget/ClickAwareCardView;->q:Landroid/view/View$OnClickListener;

    if-eqz p1, :cond_49

    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_49
    return v2

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_30
        :pswitch_15
        :pswitch_14
        :pswitch_8
        :pswitch_8
        :pswitch_d
    .end packed-switch
.end method

.method public final onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 7

    iget-byte v0, p0, Lv35;->a:B

    iget-object v1, p0, Lv35;->b:Ljava/lang/Object;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_44

    :pswitch_8
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    :pswitch_d
    check-cast v1, Lorg/chromium/components/browser_ui/widget/list_view/AppMenuListView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p0

    new-array v0, p0, [I

    const/4 v3, 0x0

    :goto_16
    if-ge v3, p0, :cond_21

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getToolType(I)I

    move-result v4

    aput v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getMetaState()I

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return v2

    :pswitch_2e
    check-cast v1, Lfge;

    iget-object p0, v1, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p0, :cond_3c

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    iget-object p0, v1, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_3c
    return v2

    :pswitch_3d
    check-cast v1, Lydb;

    iget-boolean p0, v1, Lydb;->l:Z

    xor-int/2addr p0, v2

    return p0

    nop

    :pswitch_data_44
    .packed-switch 0x2
        :pswitch_3d
        :pswitch_8
        :pswitch_2e
        :pswitch_8
        :pswitch_d
    .end packed-switch
.end method
