.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;
    }
.end annotation


# instance fields
.field public a:Landroid/animation/ValueAnimator;

.field public b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

.field public c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->d:Landroid/graphics/Paint;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->d(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public b(Ll/grr;Ll/grr;)Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c(Landroid/view/View;Ll/grr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 9
    .line 10
    invoke-virtual {p0, p0, p2}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c(Landroid/view/View;Ll/grr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    const-wide/16 v0, 0x1f4

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    new-instance p2, Ll/irr;

    .line 26
    .line 27
    invoke-direct {p2, p0}, Ll/irr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    return-object p0
.end method

.method public final c(Landroid/view/View;Ll/grr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;
    .locals 7

    .line 1
    invoke-static {}, Ll/mbs;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p2}, Ll/grr;->g()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    move-object v6, p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :goto_1
    new-instance v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 24
    .line 25
    invoke-interface {p2}, Ll/grr;->e()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-interface {p2}, Ll/grr;->f()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-interface {p2}, Ll/grr;->i()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-interface {p2}, Ll/grr;->a()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-interface {p2}, Ll/grr;->d()I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;-><init>(IIIIILandroid/graphics/Bitmap;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public final synthetic d(Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 8
    .line 9
    iget v1, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->b:I

    .line 10
    .line 11
    int-to-float v2, v1

    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 13
    .line 14
    iget v4, v3, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->b:I

    .line 15
    .line 16
    sub-int/2addr v4, v1

    .line 17
    int-to-float v1, v4

    .line 18
    mul-float/2addr v1, p1

    .line 19
    add-float/2addr v2, v1

    .line 20
    float-to-int v1, v2

    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->c:I

    .line 22
    .line 23
    int-to-float v2, v0

    .line 24
    iget v3, v3, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->c:I

    .line 25
    .line 26
    sub-int/2addr v3, v0

    .line 27
    int-to-float v0, v3

    .line 28
    mul-float/2addr p1, v0

    .line 29
    add-float/2addr v2, p1

    .line 30
    float-to-int p1, v2

    .line 31
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->f(II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public e(Ll/grr;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c(Landroid/view/View;Ll/grr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/grr;->e()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-interface {p1}, Ll/grr;->f()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->f(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final f(II)V
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
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

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
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->a:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    sub-float/2addr v2, v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v2, v1

    .line 27
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->b:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 32
    .line 33
    iget v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->d:I

    .line 34
    .line 35
    iget v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->d:I

    .line 36
    .line 37
    sub-int/2addr v1, v0

    .line 38
    int-to-float v0, v1

    .line 39
    mul-float v1, v0, v2

    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->c:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;

    .line 42
    .line 43
    iget v2, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->d:I

    .line 44
    .line 45
    int-to-float v2, v2

    .line 46
    sub-float/2addr v2, v1

    .line 47
    float-to-int v1, v2

    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->d:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    const/4 v5, 0x0

    .line 59
    invoke-virtual {v0, v5, v3, v4}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground$a;->a(III)Landroid/graphics/Shader;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    int-to-float v5, v0

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    int-to-float v6, v0

    .line 76
    int-to-float v7, v1

    .line 77
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;->d:Landroid/graphics/Paint;

    .line 78
    .line 79
    const/4 v3, 0x0

    .line 80
    const/4 v4, 0x0

    .line 81
    move v8, v7

    .line 82
    move-object v2, p1

    .line 83
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method
