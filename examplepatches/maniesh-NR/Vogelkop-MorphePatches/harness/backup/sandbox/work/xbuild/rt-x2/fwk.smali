.class public final Lfwk;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# static fields
.field public static final h:J


# instance fields
.field public final a:Z

.field public b:Landroid/content/res/ColorStateList;

.field public c:F

.field public d:F

.field public e:F

.field public f:Z

.field public final g:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x96

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lfwk;->h:J

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 5

    new-instance v0, Lewk;

    invoke-direct {v0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v1, Lewk;

    invoke-direct {v1}, Landroid/graphics/drawable/Drawable;-><init>()V

    filled-new-array {v0, v1}, [Lewk;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    const/4 v1, 0x0

    new-array v1, v1, [Lewk;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-boolean p1, p0, Lfwk;->a:Z

    const/4 v0, 0x2

    sget-wide v1, Lfwk;->h:J

    if-eqz p1, :cond_2b

    invoke-static {v0, v1, v2}, Lpn7;->n(IJ)J

    move-result-wide v1

    :cond_2b
    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lfwk;->c:F

    iput p1, p0, Lfwk;->e:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lfwk;->f:Z

    new-array p1, v0, [F

    fill-array-data p1, :array_5c

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v1, Lwo1;

    invoke-direct {v1, p0, p1, v0}, Lwo1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Ldf1;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Ldf1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iput-object p1, p0, Lfwk;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Lfwk;->c()V

    return-void

    nop

    :array_5c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a(FF)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lfwk;->c:F

    iget v2, p0, Lfwk;->d:F

    mul-float/2addr v1, v2

    mul-float/2addr v1, p1

    const/high16 p1, 0x437f0000    # 255.0f

    mul-float/2addr v1, p1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lfwk;->c:F

    mul-float/2addr v1, p2

    mul-float/2addr v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    return-void

    :cond_c
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object v1, p0, Lfwk;->b:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_1d

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_1d
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object v1, p0, Lfwk;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    iget-boolean v2, p0, Lfwk;->f:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_3e

    iput-boolean v3, p0, Lfwk;->f:Z

    invoke-virtual {p0, v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :cond_3e
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v3, v2}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v3}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x437f0000    # 255.0f

    div-float/2addr p1, v0

    iput p1, p0, Lfwk;->d:F

    iget p1, p0, Lfwk;->e:F

    const/4 v0, 0x0

    cmpg-float p1, v0, p1

    if-eqz p1, :cond_62

    iput v0, p0, Lfwk;->e:F

    invoke-virtual {p0}, Lfwk;->c()V

    :cond_62
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final c()V
    .registers 6

    iget v0, p0, Lfwk;->e:F

    const/high16 v1, 0x3f800000    # 1.0f

    iget-boolean v2, p0, Lfwk;->a:Z

    if-eqz v2, :cond_26

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v0, v2

    sub-float/2addr v0, v1

    const/4 v3, 0x0

    cmpg-float v4, v0, v3

    if-gez v4, :cond_12

    move v0, v3

    :cond_12
    invoke-static {v1, v3, v0}, Lcs5;->O(FFF)F

    move-result v0

    iget v4, p0, Lfwk;->e:F

    mul-float/2addr v4, v2

    cmpl-float v2, v4, v1

    if-lez v2, :cond_1e

    move v4, v1

    :cond_1e
    invoke-static {v3, v1, v4}, Lcs5;->O(FFF)F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lfwk;->a(FF)V

    return-void

    :cond_26
    sub-float/2addr v1, v0

    invoke-virtual {p0, v1, v0}, Lfwk;->a(FF)V

    return-void
.end method

.method public final getAlpha()I
    .registers 2

    iget p0, p0, Lfwk;->c:F

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public final jumpToCurrentState()V
    .registers 3

    iget-object v0, p0, Lfwk;->g:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iget v0, p0, Lfwk;->e:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v1, v0

    if-eqz v0, :cond_12

    iput v1, p0, Lfwk;->e:F

    invoke-virtual {p0}, Lfwk;->c()V

    :cond_12
    invoke-super {p0}, Landroid/graphics/drawable/LayerDrawable;->jumpToCurrentState()V

    return-void
.end method

.method public final setAlpha(I)V
    .registers 3

    int-to-float p1, p1

    const/high16 v0, 0x437f0000    # 255.0f

    div-float/2addr p1, v0

    iput p1, p0, Lfwk;->c:F

    invoke-virtual {p0}, Lfwk;->c()V

    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .registers 2

    iput-object p1, p0, Lfwk;->b:Landroid/content/res/ColorStateList;

    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method
