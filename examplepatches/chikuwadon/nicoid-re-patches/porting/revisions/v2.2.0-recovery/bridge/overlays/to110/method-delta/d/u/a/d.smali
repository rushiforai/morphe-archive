.class public Ld/u/a/d;
.super Landroid/graphics/drawable/Drawable;
.source ""

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/u/a/d$a;
    }
.end annotation


# static fields
.field public static final g:Landroid/view/animation/Interpolator;

.field public static final i:Landroid/view/animation/Interpolator;

.field public static final j:[I


# instance fields
.field public final a:Ld/u/a/d$a;

.field public b:F

.field public c:Landroid/content/res/Resources;

.field public d:Landroid/animation/Animator;

.field public e:F

.field public f:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    sput-object v0, Ld/u/a/d;->g:Landroid/view/animation/Interpolator;

    new-instance v0, Ld/l/a/a/b;

    invoke-direct {v0}, Ld/l/a/a/b;-><init>()V

    sput-object v0, Ld/u/a/d;->i:Landroid/view/animation/Interpolator;

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/high16 v2, -0x1000000

    aput v2, v0, v1

    sput-object v0, Ld/u/a/d;->j:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Ld/u/a/d;->c:Landroid/content/res/Resources;

    new-instance p1, Ld/u/a/d$a;

    invoke-direct {p1}, Ld/u/a/d$a;-><init>()V

    iput-object p1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    iget-object p1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    sget-object v0, Ld/u/a/d;->j:[I

    .line 1
    iput-object v0, p1, Ld/u/a/d$a;->i:[I

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ld/u/a/d$a;->a(I)V

    const/high16 p1, 0x40200000    # 2.5f

    .line 2
    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    .line 3
    iput p1, v0, Ld/u/a/d$a;->h:F

    iget-object v0, v0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 5
    iget-object p1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    new-instance v1, Ld/u/a/b;

    invoke-direct {v1, p0, p1}, Ld/u/a/b;-><init>(Ld/u/a/d;Ld/u/a/d$a;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    sget-object v1, Ld/u/a/d;->g:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Ld/u/a/c;

    invoke-direct {v1, p0, p1}, Ld/u/a/c;-><init>(Ld/u/a/d;Ld/u/a/d$a;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iput-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    return-void

    .line 6
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a(FFFF)V
    .registers 8

    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    iget-object v1, p0, Ld/u/a/d;->c:Landroid/content/res/Resources;

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float p2, p2, v1

    .line 19
    iput p2, v0, Ld/u/a/d$a;->h:F

    iget-object v2, v0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    mul-float p1, p1, v1

    .line 20
    iput p1, v0, Ld/u/a/d$a;->q:F

    const/4 p1, 0x0

    .line 21
    invoke-virtual {v0, p1}, Ld/u/a/d$a;->a(I)V

    mul-float p3, p3, v1

    mul-float p4, p4, v1

    float-to-int p1, p3

    .line 22
    iput p1, v0, Ld/u/a/d$a;->r:I

    float-to-int p1, p4

    iput p1, v0, Ld/u/a/d$a;->s:I

    return-void
.end method

.method public a(FLd/u/a/d$a;)V
    .registers 11

    const/high16 v0, 0x3f400000    # 0.75f

    cmpl-float v1, p1, v0

    if-lez v1, :cond_0

    sub-float/2addr p1, v0

    const/high16 v0, 0x3e800000    # 0.25f

    div-float/2addr p1, v0

    .line 23
    iget-object v0, p2, Ld/u/a/d$a;->i:[I

    iget v1, p2, Ld/u/a/d$a;->j:I

    aget v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 24
    array-length v3, v0

    rem-int/2addr v1, v3

    .line 25
    aget v0, v0, v1

    shr-int/lit8 v1, v2, 0x18

    and-int/lit16 v1, v1, 0xff

    shr-int/lit8 v3, v2, 0x10

    and-int/lit16 v3, v3, 0xff

    shr-int/lit8 v4, v2, 0x8

    and-int/lit16 v4, v4, 0xff

    and-int/lit16 v2, v2, 0xff

    shr-int/lit8 v5, v0, 0x18

    and-int/lit16 v5, v5, 0xff

    shr-int/lit8 v6, v0, 0x10

    and-int/lit16 v6, v6, 0xff

    shr-int/lit8 v7, v0, 0x8

    and-int/lit16 v7, v7, 0xff

    and-int/lit16 v0, v0, 0xff

    sub-int/2addr v5, v1

    int-to-float v5, v5

    mul-float v5, v5, p1

    float-to-int v5, v5

    add-int/2addr v1, v5

    shl-int/lit8 v1, v1, 0x18

    sub-int/2addr v6, v3

    int-to-float v5, v6

    mul-float v5, v5, p1

    float-to-int v5, v5

    add-int/2addr v3, v5

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v1, v3

    sub-int/2addr v7, v4

    int-to-float v3, v7

    mul-float v3, v3, p1

    float-to-int v3, v3

    add-int/2addr v4, v3

    shl-int/lit8 v3, v4, 0x8

    or-int/2addr v1, v3

    sub-int/2addr v0, v2

    int-to-float v0, v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    add-int/2addr v2, p1

    or-int p1, v1, v2

    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p2, Ld/u/a/d$a;->i:[I

    iget v0, p2, Ld/u/a/d$a;->j:I

    aget p1, p1, v0

    .line 27
    :goto_0
    iput p1, p2, Ld/u/a/d$a;->u:I

    return-void
.end method

.method public a(FLd/u/a/d$a;Z)V
    .registers 11

    iget-boolean v0, p0, Ld/u/a/d;->f:Z

    const v1, 0x3c23d70a    # 0.01f

    if-eqz v0, :cond_0

    .line 1
    invoke-virtual {p0, p1, p2}, Ld/u/a/d;->a(FLd/u/a/d$a;)V

    .line 2
    iget p3, p2, Ld/u/a/d$a;->m:F

    const v0, 0x3f4ccccd    # 0.8f

    div-float/2addr p3, v0

    float-to-double v2, p3

    .line 3
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    add-double/2addr v2, v4

    double-to-float p3, v2

    .line 4
    iget v0, p2, Ld/u/a/d$a;->k:F

    .line 5
    iget v2, p2, Ld/u/a/d$a;->l:F

    sub-float v1, v2, v1

    sub-float/2addr v1, v0

    mul-float v1, v1, p1

    add-float/2addr v1, v0

    .line 6
    iput v1, p2, Ld/u/a/d$a;->e:F

    .line 7
    iput v2, p2, Ld/u/a/d$a;->f:F

    .line 8
    iget v0, p2, Ld/u/a/d$a;->m:F

    sub-float/2addr p3, v0

    mul-float p3, p3, p1

    add-float/2addr p3, v0

    .line 9
    iput p3, p2, Ld/u/a/d$a;->g:F

    goto :goto_1

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v0

    if-nez v2, :cond_1

    if-eqz p3, :cond_3

    .line 10
    :cond_1
    iget p3, p2, Ld/u/a/d$a;->m:F

    const v2, 0x3f4a3d71    # 0.79f

    const/high16 v3, 0x3f000000    # 0.5f

    cmpg-float v4, p1, v3

    if-gez v4, :cond_2

    div-float v0, p1, v3

    .line 11
    iget v3, p2, Ld/u/a/d$a;->k:F

    .line 12
    sget-object v4, Ld/u/a/d;->i:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    add-float/2addr v0, v3

    move v6, v3

    move v3, v0

    move v0, v6

    goto :goto_0

    :cond_2
    sub-float v4, p1, v3

    div-float/2addr v4, v3

    .line 13
    iget v3, p2, Ld/u/a/d$a;->k:F

    add-float/2addr v3, v2

    .line 14
    sget-object v5, Ld/u/a/d;->i:Landroid/view/animation/Interpolator;

    invoke-interface {v5, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    sub-float/2addr v0, v4

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    sub-float v0, v3, v0

    :goto_0
    const v1, 0x3e570a3c    # 0.20999998f

    mul-float v1, v1, p1

    add-float/2addr v1, p3

    const/high16 p3, 0x43580000    # 216.0f

    iget v2, p0, Ld/u/a/d;->e:F

    add-float/2addr p1, v2

    mul-float p1, p1, p3

    .line 15
    iput v0, p2, Ld/u/a/d$a;->e:F

    .line 16
    iput v3, p2, Ld/u/a/d$a;->f:F

    .line 17
    iput v1, p2, Ld/u/a/d$a;->g:F

    .line 18
    iput p1, p0, Ld/u/a/d;->b:F

    :cond_3
    :goto_1
    return-void
.end method

.method public a(I)V
    .registers 5

    if-nez p1, :cond_0

    const/high16 p1, 0x41300000    # 11.0f

    const/high16 v0, 0x40400000    # 3.0f

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x40c00000    # 6.0f

    goto :goto_0

    :cond_0
    const/high16 p1, 0x40f00000    # 7.5f

    const/high16 v0, 0x40200000    # 2.5f

    const/high16 v1, 0x41200000    # 10.0f

    const/high16 v2, 0x40a00000    # 5.0f

    :goto_0
    invoke-virtual {p0, p1, v0, v1, v2}, Ld/u/a/d;->a(FFFF)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 397
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 398
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 399
    iget v1, p0, Ld/u/a/d;->b:F

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 400
    iget-object v1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v1, p1, v0}, Ld/u/a/d$a;->draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 401
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 402
    return-void
.end method

.method public getAlpha()I
    .registers 2

    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    .line 1
    iget v0, v0, Ld/u/a/d$a;->t:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    iget-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    .line 1
    iput p1, v0, Ld/u/a/d$a;->t:I

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public setArrowEnabled(Z)V
    .registers 3
    .param p1, "show"    # Z

    .line 279
    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v0, p1}, Ld/u/a/d$a;->setShowArrow(Z)V

    .line 280
    invoke-virtual {p0}, Ld/u/a/d;->invalidateSelf()V

    .line 281
    return-void
.end method

.method public setArrowScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .line 298
    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v0, p1}, Ld/u/a/d$a;->setArrowScale(F)V

    .line 299
    invoke-virtual {p0}, Ld/u/a/d;->invalidateSelf()V

    .line 300
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    .line 1
    iget-object v0, v0, Ld/u/a/d$a;->b:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public setProgressRotation(F)V
    .registers 3
    .param p1, "rotation"    # F

    .line 349
    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v0, p1}, Ld/u/a/d$a;->setRotation(F)V

    .line 350
    invoke-virtual {p0}, Ld/u/a/d;->invalidateSelf()V

    .line 351
    return-void
.end method

.method public setStartEndTrim(FF)V
    .registers 4
    .param p1, "start"    # F
    .param p2, "end"    # F

    .line 329
    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v0, p1}, Ld/u/a/d$a;->setStartTrim(F)V

    .line 330
    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v0, p2}, Ld/u/a/d$a;->setEndTrim(F)V

    .line 331
    invoke-virtual {p0}, Ld/u/a/d;->invalidateSelf()V

    .line 332
    return-void
.end method

.method public start()V
    .registers 5

    iget-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    .line 1
    iget v1, v0, Ld/u/a/d$a;->e:F

    iput v1, v0, Ld/u/a/d$a;->k:F

    iget v2, v0, Ld/u/a/d$a;->f:F

    iput v2, v0, Ld/u/a/d$a;->l:F

    iget v3, v0, Ld/u/a/d$a;->g:F

    iput v3, v0, Ld/u/a/d$a;->m:F

    cmpl-float v1, v2, v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ld/u/a/d;->f:Z

    iget-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    const-wide/16 v1, 0x29a

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ld/u/a/d$a;->a(I)V

    iget-object v0, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    const/4 v1, 0x0

    .line 3
    iput v1, v0, Ld/u/a/d$a;->k:F

    iput v1, v0, Ld/u/a/d$a;->l:F

    iput v1, v0, Ld/u/a/d$a;->m:F

    .line 4
    iput v1, v0, Ld/u/a/d$a;->e:F

    .line 5
    iput v1, v0, Ld/u/a/d$a;->f:F

    .line 6
    iput v1, v0, Ld/u/a/d$a;->g:F

    .line 7
    iget-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    const-wide/16 v1, 0x534

    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    iget-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method public stop()V
    .registers 4

    iget-object v0, p0, Ld/u/a/d;->d:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Ld/u/a/d;->b:F

    .line 2
    iget-object v1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ld/u/a/d$a;->a(Z)V

    iget-object v1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    invoke-virtual {v1, v2}, Ld/u/a/d$a;->a(I)V

    iget-object v1, p0, Ld/u/a/d;->a:Ld/u/a/d$a;

    .line 3
    iput v0, v1, Ld/u/a/d$a;->k:F

    iput v0, v1, Ld/u/a/d$a;->l:F

    iput v0, v1, Ld/u/a/d$a;->m:F

    .line 4
    iput v0, v1, Ld/u/a/d$a;->e:F

    .line 5
    iput v0, v1, Ld/u/a/d$a;->f:F

    .line 6
    iput v0, v1, Ld/u/a/d$a;->g:F

    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method
