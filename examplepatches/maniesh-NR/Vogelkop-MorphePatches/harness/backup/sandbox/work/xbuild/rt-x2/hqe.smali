.class public final synthetic Lhqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Llqe;

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:I

.field public final synthetic h:I

.field public final synthetic i:I

.field public final synthetic j:I

.field public final synthetic k:I

.field public final synthetic l:I

.field public final synthetic m:I

.field public final synthetic n:I

.field public final synthetic o:S


# direct methods
.method public synthetic constructor <init>(IILlqe;IIIIIIIIIIII)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lhqe;->a:I

    iput p2, p0, Lhqe;->b:I

    iput-object p3, p0, Lhqe;->c:Llqe;

    iput p4, p0, Lhqe;->d:I

    iput p5, p0, Lhqe;->e:I

    iput p6, p0, Lhqe;->f:I

    iput p7, p0, Lhqe;->g:I

    iput p8, p0, Lhqe;->h:I

    iput p9, p0, Lhqe;->i:I

    iput p10, p0, Lhqe;->j:I

    iput p11, p0, Lhqe;->k:I

    iput p12, p0, Lhqe;->l:I

    iput p13, p0, Lhqe;->m:I

    iput p14, p0, Lhqe;->n:I

    iput-short p15, p0, Lhqe;->o:S

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 14

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    iget v0, p0, Lhqe;->a:I

    int-to-float v1, v0

    iget v2, p0, Lhqe;->b:I

    sub-int/2addr v2, v0

    int-to-float v0, v2

    mul-float/2addr v0, p1

    add-float/2addr v0, v1

    invoke-static {v0}, Lzed;->b(F)I

    move-result v0

    iget-object v1, p0, Lhqe;->c:Llqe;

    iget-object v2, v1, Llqe;->k:Ljqe;

    iget-object v3, v1, Llqe;->c:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object v4, v2, Ljqe;->b:Liqe;

    sget-object v5, Ljqe;->e:[Lxtb;

    const/4 v6, 0x1

    aget-object v7, v5, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object v4, v1, Llqe;->l:Ljqe;

    iget-object v7, v4, Ljqe;->b:Liqe;

    aget-object v8, v5, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object v7, v1, Llqe;->m:Ljqe;

    iget-object v8, v7, Ljqe;->b:Liqe;

    aget-object v6, v5, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v6, v9}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget v6, p0, Lhqe;->d:I

    int-to-float v8, v6

    iget v9, p0, Lhqe;->e:I

    sub-int/2addr v9, v6

    int-to-float v6, v9

    mul-float/2addr v6, p1

    add-float/2addr v6, v8

    invoke-static {v6}, Lzed;->b(F)I

    move-result v6

    iget-object v8, v2, Ljqe;->c:Liqe;

    const/4 v9, 0x2

    aget-object v10, v5, v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object v8, v4, Ljqe;->c:Liqe;

    aget-object v10, v5, v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object v7, v7, Ljqe;->c:Liqe;

    aget-object v8, v5, v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v7, v8, v6}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget v6, p0, Lhqe;->f:I

    iget v7, p0, Lhqe;->g:I

    invoke-static {p1, v6, v7}, Lp37;->R(FII)I

    move-result v6

    iget-object v2, v2, Ljqe;->a:Liqe;

    const/4 v7, 0x0

    aget-object v8, v5, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v8, v6}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget v2, p0, Lhqe;->h:I

    iget v6, p0, Lhqe;->i:I

    invoke-static {p1, v2, v6}, Lp37;->R(FII)I

    move-result v2

    iget-object v4, v4, Ljqe;->a:Liqe;

    aget-object v5, v5, v7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget v2, p0, Lhqe;->j:I

    int-to-float v4, v2

    iget v5, p0, Lhqe;->k:I

    sub-int/2addr v5, v2

    int-to-float v2, v5

    mul-float/2addr v2, p1

    add-float/2addr v2, v4

    invoke-static {v2}, Lzed;->b(F)I

    move-result v2

    iput v2, v1, Llqe;->o:I

    iget v2, p0, Lhqe;->l:I

    int-to-float v4, v2

    iget v5, p0, Lhqe;->m:I

    sub-int/2addr v5, v2

    int-to-float v2, v5

    mul-float/2addr v2, p1

    add-float/2addr v2, v4

    invoke-static {v2}, Lzed;->b(F)I

    move-result v2

    iput v2, v1, Llqe;->p:I

    iget v2, p0, Lhqe;->n:I

    int-to-float v4, v2

    iget-short p0, p0, Lhqe;->o:S

    sub-int/2addr p0, v2

    int-to-float p0, p0

    mul-float/2addr p0, p1

    add-float/2addr p0, v4

    invoke-static {p0}, Lzed;->b(F)I

    move-result p0

    iput p0, v1, Llqe;->n:I

    iget-object p0, v1, Llqe;->a:Lcom/opera/android/feed/FeedContainerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidateOutline()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget p1, p0, Lcom/opera/android/feed/FeedContainerView;->a:I

    if-eq v0, p1, :cond_d3

    iput v0, p0, Lcom/opera/android/feed/FeedContainerView;->a:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_d3
    iget-object p0, v1, Llqe;->f:Lk26;

    iget p1, v1, Llqe;->n:I

    iget v0, p0, Lk26;->c:I

    if-eq v0, p1, :cond_e5

    iput p1, p0, Lk26;->c:I

    iget-object v0, p0, Lk26;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_e5
    iget-object p0, v1, Llqe;->q:Lc1f;

    if-eqz p0, :cond_ec

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_ec
    iget-object p0, v1, Llqe;->b:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget p0, v1, Llqe;->o:I

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    iget v0, v1, Llqe;->p:I

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {v3, p0, p1, v0, v1}, Landroid/view/View;->setPaddingRelative(IIII)V

    return-void
.end method
