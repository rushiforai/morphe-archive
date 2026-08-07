.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;
    }
.end annotation


# instance fields
.field public a:Landroid/animation/ValueAnimator;

.field public b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

.field public c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

.field public final d:Landroid/graphics/Paint;


# direct methods
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
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->d:Landroid/graphics/Paint;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->f(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;)Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->g(II)V

    return-void
.end method


# virtual methods
.method public d(Ll/ftn;Ll/ftn;)Landroid/animation/Animator;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->e(Ll/ftn;)Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->e(Ll/ftn;)Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 17
    .line 18
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 22
    .line 23
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a:I

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 31
    .line 32
    iget p2, p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a:I

    .line 33
    .line 34
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 39
    .line 40
    iget p2, p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->b:I

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 43
    .line 44
    iget v0, v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->b:I

    .line 45
    .line 46
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->g(II)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    const-wide/16 v0, 0x320

    .line 56
    .line 57
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    new-instance p2, Ll/ktn;

    .line 63
    .line 64
    invoke-direct {p2, p0}, Ll/ktn;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    new-instance p2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$a;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    return-object p0
.end method

.method public final e(Ll/ftn;)Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ftn;->e()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-interface {p1}, Ll/ftn;->f()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-interface {p1}, Ll/ftn;->i()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-interface {p1}, Ll/ftn;->a()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-interface {p1}, Ll/ftn;->d()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;-><init>(IIIII)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public final synthetic f(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    .line 7
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    fill-array-data v0, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 18
    .line 19
    iget v2, v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a:I

    .line 20
    .line 21
    int-to-float v3, v2

    .line 22
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;

    .line 23
    .line 24
    iget v5, v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a:I

    .line 25
    .line 26
    sub-int/2addr v5, v2

    .line 27
    int-to-float v2, v5

    .line 28
    mul-float/2addr v2, v0

    .line 29
    add-float/2addr v3, v2

    .line 30
    float-to-int v2, v3

    .line 31
    iget v3, v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->b:I

    .line 32
    .line 33
    int-to-float v5, v3

    .line 34
    iget v6, v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->b:I

    .line 35
    .line 36
    sub-int/2addr v6, v3

    .line 37
    int-to-float v3, v6

    .line 38
    mul-float/2addr v3, v0

    .line 39
    add-float/2addr v5, v3

    .line 40
    float-to-int v3, v5

    .line 41
    iget v1, v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->c:I

    .line 42
    .line 43
    int-to-float v5, v1

    .line 44
    iget v6, v4, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->c:I

    .line 45
    .line 46
    sub-int/2addr v6, v1

    .line 47
    int-to-float v1, v6

    .line 48
    mul-float/2addr v0, v1

    .line 49
    add-float/2addr v5, v0

    .line 50
    float-to-int v0, v5

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->d:Landroid/graphics/Paint;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    sub-int/2addr v5, v2

    .line 58
    invoke-virtual {v4, v5, v2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground$b;->a(II)Landroid/graphics/Shader;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    sub-int/2addr v1, v2

    .line 70
    int-to-float v5, v1

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    sub-int/2addr v1, v3

    .line 76
    int-to-float v6, v1

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    int-to-float v7, v1

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    int-to-float v8, v1

    .line 87
    int-to-float v9, v0

    .line 88
    iget-object v11, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryAnimBackground;->d:Landroid/graphics/Paint;

    .line 89
    .line 90
    move v10, v9

    .line 91
    move-object v4, p1

    .line 92
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 93
    .line 94
    .line 95
    :cond_0
    return-void
.end method
