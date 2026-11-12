.class public final Lq4h;
.super Landroid/graphics/drawable/GradientDrawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/animation/AccelerateInterpolator;

.field public final b:Landroid/view/animation/DecelerateInterpolator;

.field public final c:Landroid/graphics/Rect;

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:I

.field public i:I

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v0, p0, Lq4h;->a:Landroid/view/animation/AccelerateInterpolator;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lq4h;->b:Landroid/view/animation/DecelerateInterpolator;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lq4h;->c:Landroid/graphics/Rect;

    return-void
.end method

.method public static b(I)F
    .registers 2

    const v0, 0x461c4000    # 10000.0f

    int-to-float p0, p0

    mul-float/2addr p0, v0

    const/high16 v0, 0x44fa0000    # 2000.0f

    div-float/2addr p0, v0

    return p0
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .registers 7

    iget v0, p0, Lq4h;->j:I

    if-lez v0, :cond_1e

    iget v0, p0, Lq4h;->k:I

    if-lez v0, :cond_1e

    iget v1, p0, Lq4h;->h:I

    const/4 v2, 0x0

    iget v3, p0, Lq4h;->i:I

    iget-object v4, p0, Lq4h;->c:Landroid/graphics/Rect;

    invoke-virtual {v4, v1, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    invoke-super {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_1e
    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 9

    const/16 v0, 0x640

    invoke-static {v0}, Lq4h;->b(I)F

    move-result v0

    const/16 v1, 0x3e8

    invoke-static {v1}, Lq4h;->b(I)F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    iput v3, p0, Lq4h;->j:I

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    iput v2, p0, Lq4h;->k:I

    iget v2, p0, Lq4h;->j:I

    int-to-float v2, v2

    const v3, -0x40ce38e4

    mul-float/2addr v3, v2

    iput v3, p0, Lq4h;->d:F

    const v3, 0x3e638e39

    mul-float/2addr v3, v2

    iput v3, p0, Lq4h;->e:F

    iput v2, p0, Lq4h;->f:F

    const v3, 0x3f871c72

    mul-float/2addr v2, v3

    iput v2, p0, Lq4h;->g:F

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v2

    int-to-float v2, v2

    const/16 v3, 0x320

    invoke-static {v3}, Lq4h;->b(I)F

    move-result v3

    cmpg-float v2, v2, v3

    iget-object v4, p0, Lq4h;->b:Landroid/view/animation/DecelerateInterpolator;

    if-gez v2, :cond_67

    iget v2, p0, Lq4h;->e:F

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v3

    iget-object v6, p0, Lq4h;->a:Landroid/view/animation/AccelerateInterpolator;

    invoke-virtual {v6, v5}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v5

    mul-float/2addr v5, v2

    float-to-int v2, v5

    iput v2, p0, Lq4h;->h:I

    iget v2, p0, Lq4h;->f:F

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v3

    invoke-virtual {v6, v5}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v3

    mul-float/2addr v3, v2

    float-to-int v2, v3

    iput v2, p0, Lq4h;->i:I

    goto :goto_9a

    :cond_67
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_9a

    iget v2, p0, Lq4h;->e:F

    iget v5, p0, Lq4h;->f:F

    sub-float/2addr v5, v2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v6, v3

    div-float/2addr v6, v3

    invoke-virtual {v4, v6}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v6

    mul-float/2addr v6, v5

    add-float/2addr v6, v2

    float-to-int v2, v6

    iput v2, p0, Lq4h;->h:I

    iget v2, p0, Lq4h;->f:F

    iget v5, p0, Lq4h;->g:F

    sub-float/2addr v5, v2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v6, v3

    div-float/2addr v6, v3

    invoke-virtual {v4, v6}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v3

    mul-float/2addr v3, v5

    add-float/2addr v3, v2

    float-to-int v2, v3

    iput v2, p0, Lq4h;->i:I

    :cond_9a
    :goto_9a
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v0, v2, v0

    if-gtz v0, :cond_a6

    invoke-virtual {p0, p1}, Lq4h;->a(Landroid/graphics/Canvas;)V

    :cond_a6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_b0

    return-void

    :cond_b0
    iget v0, p0, Lq4h;->d:F

    iget v2, p0, Lq4h;->f:F

    sub-float/2addr v2, v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v1

    div-float/2addr v3, v1

    invoke-virtual {v4, v3}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v3

    mul-float/2addr v3, v2

    add-float/2addr v3, v0

    float-to-int v0, v3

    iput v0, p0, Lq4h;->h:I

    iget v0, p0, Lq4h;->g:F

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v1

    div-float/2addr v2, v1

    invoke-virtual {v4, v2}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v1

    mul-float/2addr v1, v0

    float-to-int v0, v1

    iput v0, p0, Lq4h;->i:I

    invoke-virtual {p0, p1}, Lq4h;->a(Landroid/graphics/Canvas;)V

    return-void
.end method
