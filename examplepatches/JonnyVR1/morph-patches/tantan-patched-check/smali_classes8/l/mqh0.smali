.class public Ll/mqh0;
.super Ll/nqh0;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# static fields
.field public static final r:Z = true


# instance fields
.field public d:F

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/animation/ValueAnimator;

.field public g:Landroid/graphics/LightingColorFilter;

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Landroid/graphics/Paint;

.field public o:Landroid/graphics/ColorMatrix;

.field public p:F

.field public q:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nqh0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x3e99999a    # 0.3f

    .line 5
    .line 6
    .line 7
    iput p1, p0, Ll/mqh0;->d:F

    .line 8
    .line 9
    new-instance p1, Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    iput-object p1, p0, Ll/mqh0;->g:Landroid/graphics/LightingColorFilter;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput p1, p0, Ll/mqh0;->j:I

    .line 23
    .line 24
    iput p1, p0, Ll/mqh0;->m:I

    .line 25
    .line 26
    new-instance p1, Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/mqh0;->n:Landroid/graphics/Paint;

    .line 32
    .line 33
    new-instance p1, Landroid/graphics/ColorMatrix;

    .line 34
    .line 35
    invoke-direct {p1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/mqh0;->o:Landroid/graphics/ColorMatrix;

    .line 39
    .line 40
    iget p1, p0, Ll/mqh0;->d:F

    .line 41
    .line 42
    iput p1, p0, Ll/mqh0;->p:F

    .line 43
    .line 44
    new-instance p1, Ll/mqh0$a;

    .line 45
    .line 46
    invoke-direct {p1, p0}, Ll/mqh0$a;-><init>(Ll/mqh0;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/mqh0;->q:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public d(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mqh0;->j()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/mqh0;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/mqh0;->j()V

    .line 12
    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    iget-object p1, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 17
    .line 18
    iget-object p2, p0, Ll/mqh0;->n:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    invoke-virtual {p1, v0, p2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, Ll/mqh0;->p:F

    .line 25
    .line 26
    iget-object p2, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/view/View;->isEnabled()Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    const/high16 p2, 0x3f800000    # 1.0f

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget p2, p0, Ll/mqh0;->d:F

    .line 38
    .line 39
    :goto_0
    new-array v0, v0, [F

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    aput p1, v0, v1

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    aput p2, v0, p1

    .line 46
    .line 47
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-wide/16 v0, 0x190

    .line 52
    .line 53
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    iget-object p2, p0, Ll/mqh0;->q:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-virtual {p0, v0}, Ll/mqh0;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mqh0;->j()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 8
    .line 9
    iget-object v1, p0, Ll/mqh0;->g:Landroid/graphics/LightingColorFilter;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 15
    .line 16
    iget-object p0, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p1, v0, p0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-array p1, v0, [F

    .line 23
    .line 24
    fill-array-data p1, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-wide/16 v0, 0x3e8

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public g(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    const p1, 0xcccccc

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Ll/hhc0;->v:[I

    .line 14
    .line 15
    invoke-virtual {v0, p2, v1, p3, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    sget v0, Ll/hhc0;->x:I

    .line 20
    .line 21
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    sget v0, Ll/hhc0;->w:I

    .line 26
    .line 27
    invoke-virtual {p2, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {p0, p1, p2}, Ll/mqh0;->h(II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p0, p1, p3}, Ll/mqh0;->h(II)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public h(II)V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/LightingColorFilter;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/mqh0;->g:Landroid/graphics/LightingColorFilter;

    .line 7
    .line 8
    const/high16 v1, 0xff0000

    .line 9
    .line 10
    and-int v2, p1, v1

    .line 11
    .line 12
    shr-int/lit8 v2, v2, 0x10

    .line 13
    .line 14
    iput v2, p0, Ll/mqh0;->h:I

    .line 15
    .line 16
    const v2, 0xff00

    .line 17
    .line 18
    .line 19
    and-int v3, p1, v2

    .line 20
    .line 21
    shr-int/lit8 v3, v3, 0x8

    .line 22
    .line 23
    iput v3, p0, Ll/mqh0;->i:I

    .line 24
    .line 25
    and-int/lit16 p1, p1, 0xff

    .line 26
    .line 27
    iput p1, p0, Ll/mqh0;->j:I

    .line 28
    .line 29
    and-int p1, p2, v1

    .line 30
    .line 31
    shr-int/lit8 p1, p1, 0x10

    .line 32
    .line 33
    iput p1, p0, Ll/mqh0;->k:I

    .line 34
    .line 35
    and-int p1, p2, v2

    .line 36
    .line 37
    shr-int/lit8 p1, p1, 0x8

    .line 38
    .line 39
    iput p1, p0, Ll/mqh0;->l:I

    .line 40
    .line 41
    and-int/lit16 p1, p2, 0xff

    .line 42
    .line 43
    iput p1, p0, Ll/mqh0;->m:I

    .line 44
    .line 45
    iget-object p1, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/nqh0;->f()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public i(F)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    iput p1, p0, Ll/mqh0;->p:F

    .line 2
    .line 3
    iget-object v0, p0, Ll/mqh0;->o:Landroid/graphics/ColorMatrix;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/mqh0;->n:Landroid/graphics/Paint;

    .line 9
    .line 10
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    .line 11
    .line 12
    iget-object v1, p0, Ll/mqh0;->o:Landroid/graphics/ColorMatrix;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 18
    .line 19
    .line 20
    sget-boolean p1, Ll/mqh0;->r:Z

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 25
    .line 26
    iget-object v0, p0, Ll/mqh0;->n:Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayerPaint(Landroid/graphics/Paint;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget-object v1, p0, Ll/mqh0;->g:Landroid/graphics/LightingColorFilter;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {v0, p1, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x2

    .line 18
    iget-object v2, p0, Ll/mqh0;->n:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {v0, p1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    iget p1, p0, Ll/mqh0;->d:F

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/mqh0;->i(F)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iput-object v1, p0, Ll/mqh0;->f:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Ll/mqh0;->h:I

    .line 6
    .line 7
    iget v1, p0, Ll/mqh0;->i:I

    .line 8
    .line 9
    iget v2, p0, Ll/mqh0;->j:I

    .line 10
    .line 11
    int-to-float v3, v0

    .line 12
    rsub-int v0, v0, 0xff

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    mul-float/2addr v0, p1

    .line 16
    add-float/2addr v3, v0

    .line 17
    float-to-int v0, v3

    .line 18
    int-to-float v3, v1

    .line 19
    rsub-int v1, v1, 0xff

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    mul-float/2addr v1, p1

    .line 23
    add-float/2addr v3, v1

    .line 24
    float-to-int v1, v3

    .line 25
    int-to-float v3, v2

    .line 26
    rsub-int v2, v2, 0xff

    .line 27
    .line 28
    int-to-float v2, v2

    .line 29
    mul-float/2addr v2, p1

    .line 30
    add-float/2addr v3, v2

    .line 31
    float-to-int p1, v3

    .line 32
    shl-int/lit8 v0, v0, 0x10

    .line 33
    .line 34
    shl-int/lit8 v1, v1, 0x8

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    add-int/2addr v0, p1

    .line 38
    iget-object p1, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 39
    .line 40
    new-instance v1, Landroid/graphics/LightingColorFilter;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-direct {v1, v0, v2}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 47
    .line 48
    .line 49
    sget-boolean p1, Ll/mqh0;->r:Z

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    iget-object p1, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 54
    .line 55
    iget-object v0, p0, Ll/mqh0;->e:Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayerPaint(Landroid/graphics/Paint;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Ll/nqh0;->a:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 63
    .line 64
    .line 65
    return-void
.end method
