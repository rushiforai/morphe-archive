.class public Landroidx/core/widget/NestedScrollView;
.super Landroid/widget/FrameLayout;
.source ""

# interfaces
.implements Ld/h/l/i;
.implements Ld/h/l/e;
.implements Ld/h/l/n;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/widget/NestedScrollView$a;,
        Landroidx/core/widget/NestedScrollView$SavedState;,
        Landroidx/core/widget/NestedScrollView$b;
    }
.end annotation


# static fields
.field public static final B:Landroidx/core/widget/NestedScrollView$a;

.field public static final C:[I


# instance fields
.field public A:Landroidx/core/widget/NestedScrollView$b;

.field public a:J

.field public final b:Landroid/graphics/Rect;

.field public c:Landroid/widget/OverScroller;

.field public d:Landroid/widget/EdgeEffect;

.field public e:Landroid/widget/EdgeEffect;

.field public f:I

.field public g:Z

.field public i:Z

.field public j:Landroid/view/View;

.field public k:Z

.field public l:Landroid/view/VelocityTracker;

.field public m:Z

.field public n:Z

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public final s:[I

.field public final t:[I

.field public u:I

.field public v:I

.field public w:Landroidx/core/widget/NestedScrollView$SavedState;

.field public final x:Ld/h/l/k;

.field public final y:Ld/h/l/g;

.field public z:F


# virtual methods
.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const v2, 0x400000

    and-int/2addr v0, v2

    if-eqz v0, :cond_4

    const/16 v2, 0x1a

    goto :goto_0

    :cond_0
    const/16 v2, 0x9

    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    goto :goto_2

    :cond_1
    iget-boolean v0, p0, Landroidx/core/widget/NestedScrollView;->k:Z

    if-nez v0, :cond_4

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Landroidx/core/widget/NestedScrollView;->getVerticalScrollFactorCompat()F

    move-result v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v2

    sub-int p1, v2, p1

    if-gez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    if-le p1, v0, :cond_3

    move p1, v0

    :cond_3
    :goto_1
    if-eq p1, v2, :cond_4

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getScrollX()I

    move-result v0

    invoke-super {p0, v0, p1}, Landroid/widget/FrameLayout;->scrollTo(II)V

    const/4 p1, 0x1

    return p1

    :cond_4
    :goto_2
    const/4 v1, 0x0

    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 24

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    .line 1
    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, v9, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/VelocityTracker;

    .line 2
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v11, 0x0

    if-nez v0, :cond_1

    iput v11, v9, Landroidx/core/widget/NestedScrollView;->u:I

    :cond_1
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v12

    iget v1, v9, Landroidx/core/widget/NestedScrollView;->u:I

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v12, v2, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    const/4 v1, 0x2

    const/4 v13, 0x1

    if-eqz v0, :cond_14

    const/4 v3, -0x1

    if-eq v0, v13, :cond_11

    if-eq v0, v1, :cond_5

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x5

    if-eq v0, v1, :cond_3

    const/4 v1, 0x6

    if-eq v0, v1, :cond_2

    goto/16 :goto_6

    :cond_2
    invoke-virtual/range {p0 .. p1}, Landroidx/core/widget/NestedScrollView;->a(Landroid/view/MotionEvent;)V

    iget v0, v9, Landroidx/core/widget/NestedScrollView;->r:I

    invoke-virtual {v10, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    invoke-virtual {v10, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    float-to-int v0, v0

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->f:I

    goto/16 :goto_6

    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {v10, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, v9, Landroidx/core/widget/NestedScrollView;->f:I

    invoke-virtual {v10, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->r:I

    goto/16 :goto_6

    :cond_4
    iget-boolean v0, v9, Landroidx/core/widget/NestedScrollView;->k:Z

    if-eqz v0, :cond_13

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    if-lez v0, :cond_13

    iget-object v14, v9, Landroidx/core/widget/NestedScrollView;->c:Landroid/widget/OverScroller;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollX()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    move-result v20

    invoke-virtual/range {v14 .. v20}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    move-result v0

    if-eqz v0, :cond_13

    goto/16 :goto_4

    :cond_5
    iget v0, v9, Landroidx/core/widget/NestedScrollView;->r:I

    invoke-virtual {v10, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v14

    if-ne v14, v3, :cond_6

    const-string v0, "Invalid pointerId="

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v9, Landroidx/core/widget/NestedScrollView;->r:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " in onTouchEvent"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NestedScrollView"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    :cond_6
    invoke-virtual {v10, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    float-to-int v6, v0

    iget v0, v9, Landroidx/core/widget/NestedScrollView;->f:I

    sub-int v7, v0, v6

    iget-boolean v0, v9, Landroidx/core/widget/NestedScrollView;->k:Z

    if-nez v0, :cond_9

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v1, v9, Landroidx/core/widget/NestedScrollView;->o:I

    if-le v0, v1, :cond_9

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-interface {v0, v13}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_7
    iput-boolean v13, v9, Landroidx/core/widget/NestedScrollView;->k:Z

    iget v0, v9, Landroidx/core/widget/NestedScrollView;->o:I

    if-lez v7, :cond_8

    sub-int/2addr v7, v0

    goto :goto_0

    :cond_8
    add-int/2addr v7, v0

    :cond_9
    :goto_0
    iget-boolean v0, v9, Landroidx/core/widget/NestedScrollView;->k:Z

    if-eqz v0, :cond_18

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->s:[I

    aput v11, v0, v11

    aput v11, v0, v13

    const/4 v1, 0x0

    iget-object v3, v9, Landroidx/core/widget/NestedScrollView;->t:[I

    iget-object v4, v9, Landroidx/core/widget/NestedScrollView;->s:[I

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move v2, v7

    invoke-virtual/range {v0 .. v5}, Landroidx/core/widget/NestedScrollView;->a(II[I[II)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->t:[I

    aget v0, v0, v13

    sub-int/2addr v7, v0

    iget v0, v9, Landroidx/core/widget/NestedScrollView;->u:I

    iget-object v1, v9, Landroidx/core/widget/NestedScrollView;->s:[I

    aget v1, v1, v13

    add-int/2addr v0, v1

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->u:I

    :cond_a
    move v15, v7

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->s:[I

    aget v0, v0, v13

    sub-int/2addr v6, v0

    iput v6, v9, Landroidx/core/widget/NestedScrollView;->f:I

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v16

    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getOverScrollMode()I

    move-result v0

    if-eqz v0, :cond_c

    if-ne v0, v13, :cond_b

    if-lez v8, :cond_b

    goto :goto_1

    :cond_b
    const/4 v0, 0x0

    const/16 v17, 0x0

    goto :goto_2

    :cond_c
    :goto_1
    const/4 v0, 0x1

    const/16 v17, 0x1

    :goto_2
    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v4

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move v2, v15

    move v6, v8

    move/from16 v21, v8

    move/from16 v8, v18

    invoke-virtual/range {v0 .. v8}, Landroidx/core/widget/NestedScrollView;->a(IIIIIIII)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {v9, v11}, Landroidx/core/widget/NestedScrollView;->e(I)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v0

    sub-int v2, v0, v16

    sub-int v4, v15, v2

    iget-object v7, v9, Landroidx/core/widget/NestedScrollView;->t:[I

    aput v11, v7, v13

    const/4 v1, 0x0

    const/4 v3, 0x0

    iget-object v5, v9, Landroidx/core/widget/NestedScrollView;->s:[I

    aput v11, v5, v11

    aput v11, v5, v13

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v7}, Landroidx/core/widget/NestedScrollView;->a(IIII[II[I)V

    iget v0, v9, Landroidx/core/widget/NestedScrollView;->f:I

    iget-object v1, v9, Landroidx/core/widget/NestedScrollView;->s:[I

    aget v2, v1, v13

    sub-int/2addr v0, v2

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->f:I

    iget v0, v9, Landroidx/core/widget/NestedScrollView;->u:I

    aget v1, v1, v13

    add-int/2addr v0, v1

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->u:I

    if-eqz v17, :cond_18

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->t:[I

    aget v0, v0, v13

    sub-int/2addr v15, v0

    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->b()V

    add-int v0, v16, v15

    if-gez v0, :cond_e

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->d:Landroid/widget/EdgeEffect;

    int-to-float v1, v15

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v10, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v0, v1, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->a(Landroid/widget/EdgeEffect;FF)V

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->e:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_f

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->e:Landroid/widget/EdgeEffect;

    goto :goto_3

    :cond_e
    move/from16 v1, v21

    if-le v0, v1, :cond_f

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->e:Landroid/widget/EdgeEffect;

    int-to-float v1, v15

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v10, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-static {v0, v1, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->a(Landroid/widget/EdgeEffect;FF)V

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->d:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_f

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->d:Landroid/widget/EdgeEffect;

    :goto_3
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    :cond_f
    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->d:Landroid/widget/EdgeEffect;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->e:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    move-result v0

    if-nez v0, :cond_18

    :cond_10
    invoke-static/range {p0 .. p0}, Ld/h/l/p;->u(Landroid/view/View;)V

    goto/16 :goto_6

    :cond_11
    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    iget v4, v9, Landroidx/core/widget/NestedScrollView;->q:I

    int-to-float v4, v4

    invoke-virtual {v0, v1, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget v1, v9, Landroidx/core/widget/NestedScrollView;->r:I

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v0

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v4, v9, Landroidx/core/widget/NestedScrollView;->p:I

    if-le v1, v4, :cond_12

    neg-int v0, v0

    int-to-float v1, v0

    invoke-virtual {v9, v2, v1}, Landroidx/core/widget/NestedScrollView;->dispatchNestedPreFling(FF)Z

    move-result v4

    if-nez v4, :cond_13

    invoke-virtual {v9, v2, v1, v13}, Landroidx/core/widget/NestedScrollView;->dispatchNestedFling(FFZ)Z

    invoke-virtual {v9, v0}, Landroidx/core/widget/NestedScrollView;->c(I)V

    goto :goto_5

    :cond_12
    iget-object v14, v9, Landroidx/core/widget/NestedScrollView;->c:Landroid/widget/OverScroller;

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollX()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    move-result v20

    invoke-virtual/range {v14 .. v20}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    move-result v0

    if-eqz v0, :cond_13

    :goto_4
    invoke-static/range {p0 .. p0}, Ld/h/l/p;->u(Landroid/view/View;)V

    :cond_13
    :goto_5
    iput v3, v9, Landroidx/core/widget/NestedScrollView;->r:I

    .line 3
    iput-boolean v11, v9, Landroidx/core/widget/NestedScrollView;->k:Z

    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->c()V

    invoke-virtual {v9, v11}, Landroidx/core/widget/NestedScrollView;->g(I)V

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->d:Landroid/widget/EdgeEffect;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->e:Landroid/widget/EdgeEffect;

    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->onRelease()V

    goto :goto_6

    .line 4
    :cond_14
    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    if-nez v0, :cond_15

    return v11

    :cond_15
    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->c:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    xor-int/2addr v0, v13

    iput-boolean v0, v9, Landroidx/core/widget/NestedScrollView;->k:Z

    if-eqz v0, :cond_16

    invoke-virtual/range {p0 .. p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-interface {v0, v13}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_16
    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->c:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->a()V

    :cond_17
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->f:I

    invoke-virtual {v10, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v9, Landroidx/core/widget/NestedScrollView;->r:I

    invoke-virtual {v9, v1, v11}, Landroidx/core/widget/NestedScrollView;->c(II)Z

    :cond_18
    :goto_6
    iget-object v0, v9, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_19

    invoke-virtual {v0, v12}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_19
    invoke-virtual {v12}, Landroid/view/MotionEvent;->recycle()V

    return v13
.end method
