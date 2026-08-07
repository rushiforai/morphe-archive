.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/animation/ValueAnimator;

.field public b:F

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:I

.field public f:I

.field public g:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0xa

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->e:I

    .line 7
    .line 8
    const/16 p1, 0x8

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f:I

    .line 11
    .line 12
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0xa

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->e:I

    const/16 p1, 0x8

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0xa

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->e:I

    const/16 p1, 0x8

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->i(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->h(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;IID)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d:Landroid/graphics/Paint;

    .line 2
    .line 3
    const-wide v1, 0x406fe00000000000L    # 255.0

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    mul-double v3, p4, v1

    .line 9
    .line 10
    sub-double/2addr v1, v3

    .line 11
    double-to-int v1, v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 13
    .line 14
    .line 15
    int-to-float p2, p2

    .line 16
    int-to-float p3, p3

    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->e:I

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d:Landroid/graphics/Paint;

    .line 26
    .line 27
    double-to-int v1, v3

    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->e(D)F

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d:Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-virtual {p1, p2, p3, p4, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final e(D)F
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f:I

    .line 10
    .line 11
    int-to-double v0, v0

    .line 12
    mul-double/2addr v0, p1

    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->e:I

    .line 14
    .line 15
    int-to-double p0, p0

    .line 16
    add-double/2addr v0, p0

    .line 17
    double-to-float p0, v0

    .line 18
    return p0
.end method

.method public final f(FIIIIDD)D
    .locals 3

    .line 1
    int-to-float p2, p2

    .line 2
    cmpl-float p2, p1, p2

    .line 3
    .line 4
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    const/high16 v2, 0x40000000    # 2.0f

    .line 10
    .line 11
    if-lez p2, :cond_0

    .line 12
    .line 13
    int-to-float p2, p3

    .line 14
    cmpg-float p2, p1, p2

    .line 15
    .line 16
    if-gez p2, :cond_0

    .line 17
    .line 18
    div-float/2addr p1, v2

    .line 19
    float-to-double p1, p1

    .line 20
    mul-double/2addr p1, v0

    .line 21
    add-double/2addr p1, p6

    .line 22
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide p1

    .line 26
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    .line 27
    .line 28
    .line 29
    move-result-wide p1

    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    .line 31
    .line 32
    :goto_0
    float-to-double p3, p0

    .line 33
    mul-double/2addr p1, p3

    .line 34
    return-wide p1

    .line 35
    :cond_0
    int-to-float p2, p4

    .line 36
    cmpl-float p2, p1, p2

    .line 37
    .line 38
    if-lez p2, :cond_1

    .line 39
    .line 40
    int-to-float p2, p5

    .line 41
    cmpg-float p2, p1, p2

    .line 42
    .line 43
    if-gez p2, :cond_1

    .line 44
    .line 45
    div-float/2addr p1, v2

    .line 46
    float-to-double p1, p1

    .line 47
    mul-double/2addr p1, v0

    .line 48
    add-double/2addr p1, p8

    .line 49
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide p1

    .line 53
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide p1

    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-wide/16 p0, 0x0

    .line 61
    .line 62
    return-wide p0
.end method

.method public final g()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    new-instance v1, Ll/p280;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/p280;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    const/4 v1, -0x1

    .line 40
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    const-wide/16 v1, 0x1388

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x41200000    # 10.0f
    .end array-data
.end method

.method public final synthetic h(Landroid/animation/ValueAnimator;)V
    .locals 0

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
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->b:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic i(Landroid/animation/ValueAnimator;)V
    .locals 0

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
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g:F

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    new-array v0, v0, [F

    .line 16
    .line 17
    fill-array-data v0, :array_0

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    new-instance v1, Ll/q280;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/q280;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    const-wide/16 v1, 0x12c

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->a:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v1, :cond_0

    .line 4
    .line 5
    new-instance v1, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c:Landroid/graphics/Paint;

    .line 11
    .line 12
    const-string v2, "#e9e9e9"

    .line 13
    .line 14
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c:Landroid/graphics/Paint;

    .line 22
    .line 23
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d:Landroid/graphics/Paint;

    .line 34
    .line 35
    const-string v3, "#ff3a00"

    .line 36
    .line 37
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d:Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    div-int/lit8 v10, v1, 0x5

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    div-int/lit8 v11, v1, 0x2

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->b:F

    .line 62
    .line 63
    const-wide/16 v6, 0x0

    .line 64
    .line 65
    const-wide v8, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    const/4 v3, 0x2

    .line 72
    const/4 v4, 0x7

    .line 73
    const/16 v5, 0x9

    .line 74
    .line 75
    move-object v0, p0

    .line 76
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f(FIIIIDD)D

    .line 77
    .line 78
    .line 79
    move-result-wide v4

    .line 80
    move-object v1, p1

    .line 81
    move v2, v10

    .line 82
    move v3, v11

    .line 83
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c(Landroid/graphics/Canvas;IID)V

    .line 84
    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->b:F

    .line 87
    .line 88
    const-wide v6, -0x4006de04abbbd2e8L    # -1.5707963267948966

    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    const-wide v8, 0x400921fb54442d18L    # Math.PI

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    const/4 v2, 0x1

    .line 99
    const/4 v3, 0x3

    .line 100
    const/4 v4, 0x6

    .line 101
    const/16 v5, 0x8

    .line 102
    .line 103
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f(FIIIIDD)D

    .line 104
    .line 105
    .line 106
    move-result-wide v4

    .line 107
    mul-int/lit8 v2, v10, 0x2

    .line 108
    .line 109
    move-object v1, p1

    .line 110
    move v3, v11

    .line 111
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c(Landroid/graphics/Canvas;IID)V

    .line 112
    .line 113
    .line 114
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->b:F

    .line 115
    .line 116
    const-wide v6, 0x400921fb54442d18L    # Math.PI

    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    const-wide v8, -0x4006de04abbbd2e8L    # -1.5707963267948966

    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    const/4 v2, 0x2

    .line 127
    const/4 v3, 0x4

    .line 128
    const/4 v4, 0x5

    .line 129
    const/4 v5, 0x7

    .line 130
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f(FIIIIDD)D

    .line 131
    .line 132
    .line 133
    move-result-wide v4

    .line 134
    mul-int/lit8 v2, v10, 0x3

    .line 135
    .line 136
    move-object v1, p1

    .line 137
    move v3, v11

    .line 138
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c(Landroid/graphics/Canvas;IID)V

    .line 139
    .line 140
    .line 141
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->b:F

    .line 142
    .line 143
    const-wide v6, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    const-wide/16 v8, 0x0

    .line 149
    .line 150
    const/4 v2, 0x3

    .line 151
    const/4 v3, 0x5

    .line 152
    const/4 v4, -0x1

    .line 153
    const/4 v5, -0x1

    .line 154
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->f(FIIIIDD)D

    .line 155
    .line 156
    .line 157
    move-result-wide v4

    .line 158
    mul-int/lit8 v2, v10, 0x4

    .line 159
    .line 160
    move-object v1, p1

    .line 161
    move v3, v11

    .line 162
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->c(Landroid/graphics/Canvas;IID)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
