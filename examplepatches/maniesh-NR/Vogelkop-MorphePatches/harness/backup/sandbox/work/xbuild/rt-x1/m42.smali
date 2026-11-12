.class public final synthetic Lm42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lm42;->a:B

    iput-object p1, p0, Lm42;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lm42;->a:B

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x3

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object v0, v0, Lm42;->b:Ljava/lang/Object;

    packed-switch v3, :pswitch_data_2b8

    check-cast v0, Lo7p;

    iget-object v3, v0, Lo7p;->p:Ljkp;

    if-eqz v3, :cond_1f

    invoke-virtual {v0, v1}, Lo7p;->f(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v1, v0, v2}, Ljkp;->b(Landroid/view/View;Ljava/lang/String;Landroid/view/MotionEvent;)V

    :cond_1f
    return v8

    :pswitch_20
    check-cast v0, Lads_mobile_sdk/jz2;

    iget-object v0, v0, Lads_mobile_sdk/jz2;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-virtual {v1}, Landroid/view/View;->performClick()Z

    return v8

    :pswitch_2b
    check-cast v0, Lmqn;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_45

    if-eq v1, v7, :cond_39

    if-eq v1, v6, :cond_39

    move v7, v8

    goto :goto_50

    :cond_39
    iget-object v0, v0, Lmqn;->S:Ly83;

    if-eqz v0, :cond_3e

    move-object v5, v0

    :cond_3e
    iget-object v0, v5, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v8, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    goto :goto_50

    :cond_45
    iget-object v0, v0, Lmqn;->S:Ly83;

    if-eqz v0, :cond_4a

    move-object v5, v0

    :cond_4a
    iget-object v0, v5, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v7, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    :goto_50
    return v7

    :pswitch_51
    check-cast v0, Lghf;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_62

    iget-object v0, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_62

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_62
    return v8

    :pswitch_63
    check-cast v0, Lknh;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_77

    if-eq v1, v7, :cond_71

    if-eq v1, v6, :cond_71

    move v7, v8

    goto :goto_7c

    :cond_71
    iput-boolean v8, v0, Lknh;->G:Z

    invoke-virtual {v0}, Lknh;->J0()V

    goto :goto_7c

    :cond_77
    iput-boolean v7, v0, Lknh;->G:Z

    invoke-virtual {v0}, Lknh;->J0()V

    :goto_7c
    return v7

    :pswitch_7d
    sget v0, Lorg/chromium/components/browser_ui/modaldialog/ModalDialogView;->D:I

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getFlags()I

    move-result v0

    and-int/2addr v0, v4

    if-nez v0, :cond_87

    move v7, v8

    :cond_87
    return v7

    :pswitch_88
    check-cast v0, Lnld;

    invoke-virtual {v0}, Lnld;->c()V

    return v8

    :pswitch_8e
    check-cast v0, Lkld;

    invoke-virtual {v0, v2}, Lkld;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :pswitch_95
    check-cast v0, Llrc;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_af

    if-eq v1, v7, :cond_a3

    if-eq v1, v6, :cond_a3

    move v7, v8

    goto :goto_ba

    :cond_a3
    iget-object v0, v0, Llrc;->B:Lor2;

    if-eqz v0, :cond_a8

    move-object v5, v0

    :cond_a8
    iget-object v0, v5, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v8, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    goto :goto_ba

    :cond_af
    iget-object v0, v0, Llrc;->B:Lor2;

    if-eqz v0, :cond_b4

    move-object v5, v0

    :cond_b4
    iget-object v0, v5, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v7, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    :goto_ba
    return v7

    :pswitch_bb
    check-cast v0, Lym7;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v7, :cond_e3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lym7;->o:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-ltz v3, :cond_d6

    const-wide/16 v3, 0x12c

    cmp-long v1, v1, v3

    if-lez v1, :cond_d8

    :cond_d6
    iput-boolean v8, v0, Lym7;->m:Z

    :cond_d8
    invoke-virtual {v0}, Lym7;->t()V

    iput-boolean v7, v0, Lym7;->m:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lym7;->o:J

    :cond_e3
    return v8

    :pswitch_e4
    check-cast v0, Lni7;

    iget v1, v0, Lni7;->s:I

    iget-object v3, v0, Lni7;->x:Lji7;

    iget-object v9, v0, Lni7;->u:Landroid/graphics/PointF;

    iget-object v10, v0, Lni7;->a:Landroid/view/View;

    iget-boolean v11, v0, Lni7;->w:Z

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v12

    if-nez v12, :cond_11d

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v12

    iput-object v12, v0, Lni7;->t:Landroid/view/VelocityTracker;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v12

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v13

    invoke-virtual {v9, v12, v13}, Landroid/graphics/PointF;->set(FF)V

    new-instance v12, Landroid/util/Size;

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v13

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v14

    invoke-direct {v12, v13, v14}, Landroid/util/Size;-><init>(II)V

    iput-object v12, v0, Lni7;->v:Landroid/util/Size;

    iget-object v12, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-eqz v12, :cond_11d

    invoke-virtual {v0, v12, v2}, Lni7;->a(Landroid/view/VelocityTracker;Landroid/view/MotionEvent;)V

    :cond_11d
    iget-object v12, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-nez v12, :cond_124

    move v7, v8

    goto/16 :goto_298

    :cond_124
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v12

    if-eq v12, v6, :cond_282

    iget-object v6, v0, Lni7;->v:Landroid/util/Size;

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v6

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v12

    if-ne v6, v12, :cond_282

    iget-object v6, v0, Lni7;->v:Landroid/util/Size;

    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v6

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v12

    if-ne v6, v12, :cond_282

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    if-ne v6, v7, :cond_1e5

    if-eqz v11, :cond_1b1

    iget-boolean v1, v0, Lni7;->k:Z

    if-nez v1, :cond_1b1

    iget-object v1, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_1b1

    iget v2, v0, Lni7;->r:I

    int-to-float v2, v2

    const/16 v4, 0x3e8

    invoke-virtual {v1, v4, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v1

    mul-float v4, v2, v2

    mul-float v6, v1, v1

    add-float/2addr v6, v4

    float-to-double v12, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    double-to-float v4, v12

    iget v6, v0, Lni7;->q:F

    cmpl-float v4, v4, v6

    if-lez v4, :cond_1b1

    iget-object v4, v0, Lni7;->n:Lii7;

    invoke-virtual {v4}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    const/high16 v6, 0x41200000    # 10.0f

    div-float/2addr v2, v6

    add-float/2addr v2, v4

    iget-object v4, v0, Lni7;->o:Lii7;

    invoke-virtual {v4}, Lii7;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    div-float/2addr v1, v6

    add-float/2addr v1, v4

    invoke-virtual {v0, v2, v1}, Lni7;->f(FF)Z

    move-result v4

    if-eqz v4, :cond_19b

    invoke-virtual {v0}, Lni7;->e()V

    goto :goto_1b1

    :cond_19b
    invoke-virtual {v3, v2, v1}, Lji7;->c(FF)V

    iget-object v12, v0, Lni7;->x:Lji7;

    sget-object v13, Lmi7;->d:Lmi7;

    sget-wide v14, Lni7;->B:J

    iget-object v1, v0, Lni7;->f:Lkotlin/jvm/functions/Function0;

    const/16 v19, 0xc

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v18, v1

    invoke-static/range {v12 .. v19}, Lji7;->b(Lji7;Lmi7;JLli7;Lwg5;Lkotlin/jvm/functions/Function0;I)V

    :cond_1b1
    :goto_1b1
    iget-object v1, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_1b8

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    :cond_1b8
    iput-object v5, v0, Lni7;->t:Landroid/view/VelocityTracker;

    iput-boolean v8, v0, Lni7;->w:Z

    if-eqz v11, :cond_1e0

    iget-object v1, v3, Lji7;->c:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_1cb

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-ne v1, v7, :cond_1cb

    iget-object v1, v3, Lji7;->b:Lmi7;

    goto :goto_1cd

    :cond_1cb
    sget-object v1, Lmi7;->a:Lmi7;

    :goto_1cd
    sget-object v2, Lmi7;->b:Lmi7;

    if-eq v1, v2, :cond_298

    iget-object v1, v0, Lni7;->d:Lkotlin/jvm/functions/Function1;

    iget-boolean v2, v0, Lni7;->k:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iput-boolean v8, v0, Lni7;->k:Z

    goto/16 :goto_298

    :cond_1e0
    invoke-virtual {v10}, Landroid/view/View;->performClick()Z

    goto/16 :goto_298

    :cond_1e5
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    if-ne v5, v4, :cond_298

    iget-object v4, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-eqz v4, :cond_1f2

    invoke-virtual {v0, v4, v2}, Lni7;->a(Landroid/view/VelocityTracker;Landroid/view/MotionEvent;)V

    :cond_1f2
    iget-boolean v4, v0, Lni7;->w:Z

    if-nez v4, :cond_227

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget v5, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    int-to-float v1, v1

    cmpl-float v4, v4, v1

    if-gtz v4, :cond_215

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iget v5, v9, Landroid/graphics/PointF;->y:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v1, v4, v1

    if-lez v1, :cond_227

    :cond_215
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v9, v1, v4}, Landroid/graphics/PointF;->set(FF)V

    iput-boolean v7, v0, Lni7;->w:Z

    iget-object v1, v0, Lni7;->c:Lkotlin/jvm/functions/Function0;

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_227
    iget-boolean v1, v0, Lni7;->w:Z

    if-eqz v1, :cond_298

    invoke-virtual {v10}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    add-float/2addr v4, v1

    iget v1, v9, Landroid/graphics/PointF;->x:F

    sub-float/2addr v4, v1

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    add-float/2addr v2, v1

    iget v1, v9, Landroid/graphics/PointF;->y:F

    sub-float/2addr v2, v1

    invoke-virtual {v0, v4, v2}, Lni7;->f(FF)Z

    move-result v1

    iget-boolean v5, v0, Lni7;->k:Z

    if-eqz v1, :cond_253

    if-nez v5, :cond_27e

    invoke-virtual {v0}, Lni7;->e()V

    goto :goto_27e

    :cond_253
    if-eqz v5, :cond_27b

    if-eqz v5, :cond_27e

    invoke-virtual {v10, v8}, Landroid/view/View;->performHapticFeedback(I)Z

    iput-boolean v8, v0, Lni7;->k:Z

    invoke-virtual {v3, v4, v2}, Lji7;->c(FF)V

    iget-object v11, v0, Lni7;->x:Lji7;

    sget-object v12, Lmi7;->c:Lmi7;

    sget-wide v13, Lni7;->A:J

    new-instance v15, Lli7;

    invoke-direct {v15}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lwg5;

    const/16 v2, 0x17

    invoke-direct {v1, v0, v2}, Lwg5;-><init>(Ljava/lang/Object;B)V

    const/16 v17, 0x0

    const/16 v18, 0x10

    move-object/from16 v16, v1

    invoke-static/range {v11 .. v18}, Lji7;->b(Lji7;Lmi7;JLli7;Lwg5;Lkotlin/jvm/functions/Function0;I)V

    goto :goto_27e

    :cond_27b
    invoke-virtual {v3, v4, v2}, Lji7;->c(FF)V

    :cond_27e
    :goto_27e
    invoke-virtual {v0}, Lni7;->g()V

    goto :goto_298

    :cond_282
    iget-object v1, v0, Lni7;->t:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_289

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    :cond_289
    iput-object v5, v0, Lni7;->t:Landroid/view/VelocityTracker;

    iput-boolean v8, v0, Lni7;->w:Z

    if-eqz v11, :cond_298

    iget-object v1, v0, Lni7;->d:Lkotlin/jvm/functions/Function1;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iput-boolean v8, v0, Lni7;->k:Z

    :cond_298
    :goto_298
    return v7

    :pswitch_299
    check-cast v0, Lt42;

    iget-object v0, v0, Lt42;->w:Lei;

    invoke-virtual {v2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_2b0

    if-eq v1, v7, :cond_2a9

    if-eq v1, v6, :cond_2a9

    move v7, v8

    goto :goto_2b6

    :cond_2a9
    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v8, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    goto :goto_2b6

    :cond_2b0
    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    iput-boolean v7, v0, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    :goto_2b6
    return v7

    nop

    :pswitch_data_2b8
    .packed-switch 0x0
        :pswitch_299
        :pswitch_e4
        :pswitch_bb
        :pswitch_95
        :pswitch_8e
        :pswitch_88
        :pswitch_7d
        :pswitch_63
        :pswitch_51
        :pswitch_2b
        :pswitch_20
    .end packed-switch
.end method
