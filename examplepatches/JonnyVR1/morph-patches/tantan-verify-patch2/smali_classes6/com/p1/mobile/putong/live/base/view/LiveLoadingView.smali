.class public Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final h:I

.field public static final i:I


# instance fields
.field public a:Landroid/graphics/LinearGradient;

.field public b:I

.field public c:I

.field public d:Landroid/graphics/Path;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/animation/ValueAnimator;

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->f:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->h:I

    .line 4
    .line 5
    sget v0, Ll/qa00;->g:I

    .line 6
    .line 7
    sput v0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->i:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;II)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->c:I

    .line 2
    .line 3
    sub-int v0, p2, v0

    .line 4
    .line 5
    if-le v0, p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v1, "draw path"

    .line 9
    .line 10
    invoke-static {v1}, Ll/cej0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 19
    .line 20
    int-to-float v2, p2

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 26
    .line 27
    sget v4, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->h:I

    .line 28
    .line 29
    add-int v5, p2, v4

    .line 30
    .line 31
    int-to-float v5, v5

    .line 32
    invoke-virtual {v1, v5, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 36
    .line 37
    add-int v5, p2, v4

    .line 38
    .line 39
    iget v6, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->c:I

    .line 40
    .line 41
    sub-int/2addr v5, v6

    .line 42
    int-to-float v5, v5

    .line 43
    iget v6, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->b:I

    .line 44
    .line 45
    int-to-float v6, v6

    .line 46
    invoke-virtual {v1, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 50
    .line 51
    int-to-float v0, v0

    .line 52
    iget v5, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->b:I

    .line 53
    .line 54
    int-to-float v5, v5

    .line 55
    invoke-virtual {v1, v0, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 59
    .line 60
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->e:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/cej0;->b()V

    .line 71
    .line 72
    .line 73
    add-int/2addr p2, v4

    .line 74
    sget v0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->i:I

    .line 75
    .line 76
    add-int/2addr p2, v0

    .line 77
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->b(Landroid/graphics/Canvas;II)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final c()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->e:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->e:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d:Landroid/graphics/Path;

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->h:I

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->i:I

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    neg-int v0, v0

    .line 32
    const/4 v1, 0x0

    .line 33
    filled-new-array {v1, v0}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 44
    .line 45
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    const/4 v1, -0x1

    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    const-wide/16 v1, 0x190

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    new-instance v1, Ll/u2t;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/u2t;-><init>(Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final d(I)V
    .locals 8

    .line 1
    int-to-float p1, p1

    .line 2
    const v0, 0x3f4ccccd    # 0.8f

    .line 3
    .line 4
    .line 5
    mul-float/2addr p1, v0

    .line 6
    float-to-int p1, p1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->b:I

    .line 8
    .line 9
    int-to-double v0, p1

    .line 10
    const-wide/high16 v2, 0x4039000000000000L    # 25.0

    .line 11
    .line 12
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    invoke-static {v2, v3}, Ljava/lang/Math;->tan(D)D

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    mul-double/2addr v0, v2

    .line 21
    double-to-int p1, v0

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->c:I

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 25
    .line 26
    iget p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->b:I

    .line 27
    .line 28
    int-to-float v4, p1

    .line 29
    const p1, -0x7f000001

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    filled-new-array {p1, v1}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const/4 p1, 0x2

    .line 38
    new-array v6, p1, [F

    .line 39
    .line 40
    fill-array-data v6, :array_0

    .line 41
    .line 42
    .line 43
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    const/4 v2, 0x0

    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->a:Landroid/graphics/LinearGradient;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->e:Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic f(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->g:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->f:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->g:I

    .line 16
    .line 17
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->a:Landroid/graphics/LinearGradient;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string v1, "LiveLoadingView#drawLine"

    .line 17
    .line 18
    invoke-static {v1}, Ll/cej0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->g:I

    .line 22
    .line 23
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->b(Landroid/graphics/Canvas;II)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/cej0;->b()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->d(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
