.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:F

.field public final b:Landroid/graphics/Paint;

.field public c:F

.field public d:Landroid/animation/ValueAnimator;

.field public e:Landroid/graphics/RectF;

.field public f:F

.field public g:F

.field public h:I

.field public i:Ljava/lang/Runnable;

.field public j:Landroid/animation/Animator;

.field public final k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->a:F

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->c:F

    .line 22
    .line 23
    const-string p1, "#80000000"

    .line 24
    .line 25
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->k:I

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->c(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->k:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 27
    .line 28
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic c(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->g:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->f:F

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/Float;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->c:F

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    neg-float p1, p1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->c:F

    .line 34
    .line 35
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->j:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(FF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->f:F

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->g:F

    .line 4
    .line 5
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->f:F

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->c:F

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d()V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->f:F

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->g:F

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v2, v2, [F

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aput v0, v2, v3

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    aput v1, v2, v0

    .line 20
    .line 21
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->h:I

    .line 28
    .line 29
    int-to-long v1, v1

    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 36
    .line 37
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    new-instance v1, Ll/lz50;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/lz50;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->i:Ljava/lang/Runnable;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->j:Landroid/animation/Animator;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->e:Landroid/graphics/RectF;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/RectF;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->a:F

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->a:F

    .line 18
    .line 19
    sub-float/2addr v2, v3

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    int-to-float v3, v3

    .line 25
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->a:F

    .line 26
    .line 27
    sub-float/2addr v3, v4

    .line 28
    invoke-direct {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->e:Landroid/graphics/RectF;

    .line 32
    .line 33
    :cond_0
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->e:Landroid/graphics/RectF;

    .line 34
    .line 35
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->c:F

    .line 36
    .line 37
    const/4 v8, 0x1

    .line 38
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 39
    .line 40
    const/high16 v6, -0x3d4c0000    # -90.0f

    .line 41
    .line 42
    move-object v4, p1

    .line 43
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public setColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnEnd(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method
