.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public final d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/RectF;

.field public f:Landroid/graphics/RectF;

.field public g:J

.field public h:F

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;

.field public j:Landroid/graphics/SweepGradient;

.field public k:Landroid/animation/ValueAnimator;

.field public l:Landroid/animation/AnimatorSet;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 110
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 109
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->m:Z

    .line 6
    .line 7
    sget-object v0, Ll/vhc0;->T:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget v0, Ll/vhc0;->W:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/n9c0;->b:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->a:I

    .line 30
    .line 31
    sget v0, Ll/vhc0;->V:I

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget v1, Ll/n9c0;->b:I

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->b:I

    .line 48
    .line 49
    sget p1, Ll/vhc0;->X:I

    .line 50
    .line 51
    const/high16 v0, 0x40800000    # 4.0f

    .line 52
    .line 53
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    int-to-float p1, p1

    .line 62
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->c:F

    .line 63
    .line 64
    sget p1, Ll/vhc0;->U:I

    .line 65
    .line 66
    const/16 v0, 0x3c

    .line 67
    .line 68
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    int-to-long v0, p1

    .line 73
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->g:J

    .line 74
    .line 75
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 76
    .line 77
    .line 78
    new-instance p1, Landroid/graphics/Paint;

    .line 79
    .line 80
    const/4 p2, 0x1

    .line 81
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 82
    .line 83
    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d:Landroid/graphics/Paint;

    .line 85
    .line 86
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p3}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 95
    .line 96
    .line 97
    iget-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->g:J

    .line 98
    .line 99
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->e(J)Landroid/animation/ValueAnimator;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->f()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->g(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->m:Z

    return-void
.end method


# virtual methods
.method public final d(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-int v0, v0

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->j:Landroid/graphics/SweepGradient;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Landroid/graphics/SweepGradient;

    .line 13
    .line 14
    int-to-float v2, v0

    .line 15
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->a:I

    .line 16
    .line 17
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->b:I

    .line 18
    .line 19
    filled-new-array {v3, v4}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-direct {v1, v2, v2, v3, v4}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->j:Landroid/graphics/SweepGradient;

    .line 28
    .line 29
    :cond_0
    new-instance v1, Landroid/graphics/Matrix;

    .line 30
    .line 31
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 32
    .line 33
    .line 34
    div-int/lit8 v0, v0, 0x2

    .line 35
    .line 36
    int-to-float v0, v0

    .line 37
    const/high16 v2, -0x3d4c0000    # -90.0f

    .line 38
    .line 39
    invoke-virtual {v1, v2, v0, v0}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->j:Landroid/graphics/SweepGradient;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d:Landroid/graphics/Paint;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->j:Landroid/graphics/SweepGradient;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d:Landroid/graphics/Paint;

    .line 55
    .line 56
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d:Landroid/graphics/Paint;

    .line 62
    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->c:F

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d:Landroid/graphics/Paint;

    .line 69
    .line 70
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->e:Landroid/graphics/RectF;

    .line 76
    .line 77
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->h:F

    .line 78
    .line 79
    const/high16 v1, 0x43b40000    # 360.0f

    .line 80
    .line 81
    mul-float/2addr v0, v1

    .line 82
    sub-float v5, v1, v0

    .line 83
    .line 84
    const/4 v6, 0x0

    .line 85
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d:Landroid/graphics/Paint;

    .line 86
    .line 87
    const/high16 v4, -0x3d4c0000    # -90.0f

    .line 88
    .line 89
    move-object v2, p1

    .line 90
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final e(J)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :array_0
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data
.end method

.method public final f()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sget-object v2, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 8
    .line 9
    invoke-static {p0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v2, 0x12c

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    const/16 v4, 0x1e

    .line 27
    .line 28
    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 29
    .line 30
    .line 31
    new-array v0, v0, [F

    .line 32
    .line 33
    fill-array-data v0, :array_1

    .line 34
    .line 35
    .line 36
    sget-object v5, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 37
    .line 38
    invoke-static {p0, v5, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 43
    .line 44
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 57
    .line 58
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->l:Landroid/animation/AnimatorSet;

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic g(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/high16 v0, 0x42c80000    # 100.0f

    .line 12
    .line 13
    div-float/2addr p1, v0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->h:F

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->a:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->b:I

    .line 4
    .line 5
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    new-instance v1, Ll/tjg;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/tjg;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->d(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 5

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->e:Landroid/graphics/RectF;

    .line 13
    .line 14
    const/4 p4, 0x0

    .line 15
    if-nez p3, :cond_0

    .line 16
    .line 17
    new-instance p3, Landroid/graphics/RectF;

    .line 18
    .line 19
    iget p5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->c:F

    .line 20
    .line 21
    const/high16 v0, 0x40000000    # 2.0f

    .line 22
    .line 23
    div-float v1, p5, v0

    .line 24
    .line 25
    add-float/2addr v1, p4

    .line 26
    div-float v2, p5, v0

    .line 27
    .line 28
    add-float/2addr v2, p4

    .line 29
    int-to-float v3, p1

    .line 30
    div-float v4, p5, v0

    .line 31
    .line 32
    sub-float/2addr v3, v4

    .line 33
    int-to-float v4, p2

    .line 34
    div-float/2addr p5, v0

    .line 35
    sub-float/2addr v4, p5

    .line 36
    invoke-direct {p3, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 37
    .line 38
    .line 39
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->e:Landroid/graphics/RectF;

    .line 40
    .line 41
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->f:Landroid/graphics/RectF;

    .line 42
    .line 43
    if-nez p3, :cond_1

    .line 44
    .line 45
    new-instance p3, Landroid/graphics/RectF;

    .line 46
    .line 47
    iget p5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->c:F

    .line 48
    .line 49
    add-float v0, p5, p4

    .line 50
    .line 51
    const/high16 v1, 0x3f800000    # 1.0f

    .line 52
    .line 53
    sub-float/2addr v0, v1

    .line 54
    add-float/2addr p4, p5

    .line 55
    sub-float/2addr p4, v1

    .line 56
    int-to-float p1, p1

    .line 57
    sub-float/2addr p1, p5

    .line 58
    add-float/2addr p1, v1

    .line 59
    int-to-float p2, p2

    .line 60
    sub-float/2addr p2, p5

    .line 61
    add-float/2addr p2, v1

    .line 62
    invoke-direct {p3, v0, p4, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 63
    .line 64
    .line 65
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->f:Landroid/graphics/RectF;

    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public setBorderWidth(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    int-to-float p1, p1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->c:F

    .line 8
    .line 9
    return-void
.end method

.method public setCountdownTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->g:J

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->e(J)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->k:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    return-void
.end method

.method public setOnCountDownListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/FastGiftCountDownView$b;

    .line 2
    .line 3
    return-void
.end method
