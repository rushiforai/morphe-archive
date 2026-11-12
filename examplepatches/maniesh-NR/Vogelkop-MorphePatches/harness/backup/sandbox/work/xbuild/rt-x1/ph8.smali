.class public final synthetic Lph8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lir;

.field public final synthetic b:Landroid/graphics/Rect;

.field public final synthetic c:Landroid/graphics/Rect;

.field public final synthetic d:Z

.field public final synthetic e:Lqh8;


# direct methods
.method public synthetic constructor <init>(Lir;Landroid/graphics/Rect;Landroid/graphics/Rect;ZLqh8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lph8;->a:Lir;

    iput-object p2, p0, Lph8;->b:Landroid/graphics/Rect;

    iput-object p3, p0, Lph8;->c:Landroid/graphics/Rect;

    iput-boolean p4, p0, Lph8;->d:Z

    iput-object p5, p0, Lph8;->e:Lqh8;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 9

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lph8;->b:Landroid/graphics/Rect;

    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Lph8;->c:Landroid/graphics/Rect;

    iget v4, v3, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    sub-float/2addr v4, v2

    mul-float/2addr v4, v0

    add-float/2addr v4, v2

    invoke-static {v4}, Lzed;->b(F)I

    move-result v2

    iget v4, v1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    iget v5, v3, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    sub-float/2addr v5, v4

    mul-float/2addr v5, v0

    add-float/2addr v5, v4

    invoke-static {v5}, Lzed;->b(F)I

    move-result v4

    iget v5, v1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    iget v6, v3, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    sub-float/2addr v6, v5

    mul-float/2addr v6, v0

    add-float/2addr v6, v5

    invoke-static {v6}, Lzed;->b(F)I

    move-result v5

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, v1

    mul-float/2addr v3, v0

    add-float/2addr v3, v1

    invoke-static {v3}, Lzed;->b(F)I

    move-result v0

    iget-object v1, p0, Lph8;->a:Lir;

    invoke-virtual {v1, v2, v4, v5, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, v1, Lir;->h:Lgr;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v2

    invoke-interface {v0, v2}, Lgr;->l(F)V

    iget-boolean v0, p0, Lph8;->d:Z

    iget-object p0, p0, Lph8;->e:Lqh8;

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_74

    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    sub-float/2addr v2, p1

    iget p1, v1, Lir;->i:F

    cmpg-float p1, p1, v2

    if-eqz p1, :cond_82

    iput v2, v1, Lir;->i:F

    iget p1, v1, Lir;->c:I

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    if-lez p1, :cond_82

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    goto :goto_82

    :cond_74
    sget-object v0, Lrh8;->u:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/animation/LinearInterpolator;->getInterpolation(F)F

    move-result p1

    sub-float/2addr v2, p1

    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V

    :cond_82
    :goto_82
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
