.class public Lcom/p1/mobile/putong/core/newui/view/LightningView;
.super Lv/VText;
.source "SourceFile"


# instance fields
.field public i:Landroid/graphics/Shader;

.field public j:Landroid/graphics/Matrix;

.field public k:Landroid/graphics/Paint;

.field public l:I

.field public m:I

.field public n:F

.field public o:F

.field public p:Z

.field public q:Landroid/graphics/Rect;

.field public r:Landroid/animation/ValueAnimator;

.field public s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->n:F

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->o:F

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->s:Z

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    const/4 p2, 0x0

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->n:F

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->o:F

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->s:Z

    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    const/4 p2, 0x0

    .line 30
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->n:F

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->o:F

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->s:Z

    .line 33
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r()V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/view/LightningView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->t(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/view/LightningView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->u()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/newui/view/LightningView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/newui/view/LightningView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    return-void
.end method

.method private r()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->q:Landroid/graphics/Rect;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->k:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->s()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->j:Landroid/graphics/Matrix;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->q:Landroid/graphics/Rect;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->k:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->q:Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0, v0, p2, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    .line 19
    .line 20
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 21
    .line 22
    if-lez p3, :cond_0

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 25
    .line 26
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 27
    .line 28
    int-to-float p3, p3

    .line 29
    const/high16 p4, 0x40000000    # 2.0f

    .line 30
    .line 31
    div-float v3, p3, p4

    .line 32
    .line 33
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    .line 34
    .line 35
    int-to-float v4, p3

    .line 36
    const/4 p3, -0x1

    .line 37
    const p4, 0x33ffffff

    .line 38
    .line 39
    .line 40
    filled-new-array {p4, p3, p4}, [I

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    const/4 p3, 0x3

    .line 45
    new-array v6, p3, [F

    .line 46
    .line 47
    fill-array-data v6, :array_0

    .line 48
    .line 49
    .line 50
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->i:Landroid/graphics/Shader;

    .line 58
    .line 59
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->k:Landroid/graphics/Paint;

    .line 60
    .line 61
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 62
    .line 63
    .line 64
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->k:Landroid/graphics/Paint;

    .line 65
    .line 66
    new-instance p4, Landroid/graphics/PorterDuffXfermode;

    .line 67
    .line 68
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->LIGHTEN:Landroid/graphics/PorterDuff$Mode;

    .line 69
    .line 70
    invoke-direct {p4, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3, p4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 74
    .line 75
    .line 76
    new-instance p3, Landroid/graphics/Matrix;

    .line 77
    .line 78
    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->j:Landroid/graphics/Matrix;

    .line 82
    .line 83
    iget p4, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 84
    .line 85
    mul-int/lit8 p4, p4, -0x2

    .line 86
    .line 87
    int-to-float p4, p4

    .line 88
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    .line 89
    .line 90
    int-to-float v0, v0

    .line 91
    invoke-virtual {p3, p4, v0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 92
    .line 93
    .line 94
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->i:Landroid/graphics/Shader;

    .line 95
    .line 96
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->j:Landroid/graphics/Matrix;

    .line 97
    .line 98
    invoke-virtual {p3, p4}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->q:Landroid/graphics/Rect;

    .line 102
    .line 103
    const/4 p3, 0x0

    .line 104
    invoke-virtual {p0, p3, p3, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 105
    .line 106
    .line 107
    :cond_0
    return-void

    .line 108
    nop

    .line 109
    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final s()V
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    const-wide/16 v1, 0xbb8

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    new-instance v1, Ll/ser;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ser;-><init>(Lcom/p1/mobile/putong/core/newui/view/LightningView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    new-instance v1, Ll/ter;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/ter;-><init>(Lcom/p1/mobile/putong/core/newui/view/LightningView;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->s:Z

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    const/4 v1, -0x1

    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Lcom/p1/mobile/putong/core/newui/view/LightningView$a;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView$a;-><init>(Lcom/p1/mobile/putong/core/newui/view/LightningView;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void

    .line 61
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setAutoRun(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t(Landroid/animation/ValueAnimator;)V
    .locals 2

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
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->l:I

    .line 12
    .line 13
    mul-int/lit8 v1, v0, 0x4

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    mul-float/2addr v1, p1

    .line 17
    mul-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    sub-float/2addr v1, v0

    .line 21
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->n:F

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->m:I

    .line 24
    .line 25
    int-to-float v0, v0

    .line 26
    mul-float/2addr v0, p1

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->o:F

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->j:Landroid/graphics/Matrix;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->i:Landroid/graphics/Shader;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->j:Landroid/graphics/Matrix;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 3
    .line 4
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->r:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/view/LightningView;->p:Z

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
