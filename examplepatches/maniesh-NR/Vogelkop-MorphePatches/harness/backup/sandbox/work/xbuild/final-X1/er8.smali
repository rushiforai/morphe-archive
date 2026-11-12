.class public Ler8;
.super Lfr8;
.source "SourceFile"

# interfaces
.implements Lgq8;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public A:I

.field public s:Lhq8;

.field public final t:Lyr8;

.field public u:Z

.field public v:Landroid/animation/ValueAnimator;

.field public w:Landroid/animation/ValueAnimator;

.field public final x:F

.field public final y:I

.field public final z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltta;Lvr8;Lzzj;)V
    .registers 11

    invoke-direct {p0, p1, p2, p3}, Lfr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 p3, 0x40000000    # 2.0f

    invoke-static {p3, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Ler8;->x:F

    iget p2, p0, Lfr8;->c:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p3, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p3

    const/high16 v1, 0x40e00000    # 7.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    sub-int/2addr p2, v0

    sub-int/2addr p2, p3

    div-int/lit8 p2, p2, 0x2

    iput p2, p0, Ler8;->y:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0c0012

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    iput p2, p0, Ler8;->z:I

    new-instance v0, Lyr8;

    new-instance v2, Lnv6;

    invoke-direct {v2, p0}, Lnv6;-><init>(Ljava/lang/Object;)V

    iget-object v3, p0, Lfr8;->a:Lgjf;

    iget v4, p0, Lfr8;->b:I

    move-object v1, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lyr8;-><init>(Landroid/content/Context;Lxr8;Lgjf;ILzzj;)V

    iput-object v0, p0, Ler8;->t:Lyr8;

    return-void
.end method


# virtual methods
.method public final Q(Lhq8;)V
    .registers 2

    return-void
.end method

.method public final b(Lvr8;Z)V
    .registers 3

    invoke-super {p0, p1, p2}, Lfr8;->b(Lvr8;Z)V

    iget-object p1, p0, Ler8;->t:Lyr8;

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lyr8;->h()V

    :cond_a
    if-eqz p2, :cond_10

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ler8;->q(Z)V

    :cond_10
    return-void
.end method

.method public final n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 9

    iget-object v0, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_3c

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    invoke-virtual {p1, v0, v0, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v3, p0, Lfr8;->b:I

    iget-object v4, p0, Lfr8;->a:Lgjf;

    invoke-virtual {v4, v0, v3}, Lgjf;->b(II)Lbcd;

    move-result-object v0

    iget v3, p2, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    iget v4, p2, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    iget v5, p0, Ler8;->A:I

    invoke-virtual {v0, p1, v3, v4, v5}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_3c
    iget-object v0, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_8c

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_8c

    iget-object v0, p0, Ler8;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    iget v3, p0, Ler8;->x:F

    mul-float/2addr v3, v0

    invoke-virtual {p1, v3, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget v5, p0, Ler8;->y:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    mul-float/2addr v4, v0

    sub-float/2addr v3, v4

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    iget v4, p2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    iget v5, p2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {p1, v3, v3, v4, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    sub-float/2addr v2, v0

    invoke-virtual {p0, p1, p2, v2}, Ler8;->v(Landroid/graphics/Canvas;Landroid/graphics/Rect;F)V

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    :cond_8c
    invoke-virtual {p0, p1, p2, v2}, Ler8;->v(Landroid/graphics/Canvas;Landroid/graphics/Rect;F)V

    return-void
.end method

.method public o()V
    .registers 4

    invoke-super {p0}, Lfr8;->o()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f04047c

    const v2, 0x7f061084

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Ler8;->A:I

    iget-object p0, p0, Ler8;->t:Lyr8;

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Lyr8;->h()V

    :cond_1a
    return-void
.end method

.method public final q(Z)V
    .registers 2

    iget-object p0, p0, Ler8;->t:Lyr8;

    invoke-virtual {p0, p1}, Lyr8;->f(Z)V

    return-void
.end method

.method public final r(ILhq8;)V
    .registers 3

    const/4 p2, 0x4

    if-ne p1, p2, :cond_7

    invoke-virtual {p0}, Ler8;->s()V

    return-void

    :cond_7
    const/4 p2, 0x7

    if-eq p1, p2, :cond_e

    const/4 p2, 0x5

    if-eq p1, p2, :cond_e

    return-void

    :cond_e
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ler8;->q(Z)V

    return-void
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Ler8;->s:Lhq8;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-boolean v1, p0, Lfr8;->l:Z

    if-nez v1, :cond_14

    invoke-virtual {v0}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_16

    const-string v0, ""

    goto :goto_16

    :cond_14
    const-string v0, " "

    :cond_16
    :goto_16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final t()Ljava/lang/Float;
    .registers 4

    iget-object v0, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iget-object v2, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object v2, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    invoke-virtual {v2, p0}, Landroid/animation/ValueAnimator;->removeUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iput-object v1, p0, Ler8;->v:Landroid/animation/ValueAnimator;

    return-object v0

    :cond_18
    return-object v1
.end method

.method public u(Ljava/lang/String;)Lvmj;
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lvmj;->g:I

    const/16 v1, 0x30

    iget p0, p0, Lfr8;->c:I

    invoke-static {v0, p1, p0, p0, v1}, Ltmj;->j(Landroid/content/Context;Ljava/lang/String;III)Lvmj;

    move-result-object p0

    return-object p0
.end method

.method public v(Landroid/graphics/Canvas;Landroid/graphics/Rect;F)V
    .registers 13

    iget-object p3, p0, Ler8;->t:Lyr8;

    iget-object v0, p3, Lyr8;->g:Ljl6;

    if-nez v0, :cond_25

    iget-object v0, p3, Lyr8;->l:Lvmj;

    if-nez v0, :cond_25

    iget-object p3, p3, Lyr8;->h:Lgk6;

    if-nez p3, :cond_25

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p3

    iget v0, p0, Lfr8;->b:I

    iget-object v1, p0, Lfr8;->a:Lgjf;

    invoke-virtual {v1, p3, v0}, Lgjf;->b(II)Lbcd;

    move-result-object p3

    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    iget v2, p0, Ler8;->A:I

    invoke-virtual {p3, p1, v0, v1, v2}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    :cond_25
    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    iget v7, p2, Landroid/graphics/Rect;->right:I

    iget v8, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v3, p0, Ler8;->t:Lyr8;

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lyr8;->a(Landroid/graphics/Canvas;IIII)V

    return-void
.end method

.method public w()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Ler8;->s:Lhq8;

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public x()V
    .registers 1

    return-void
.end method

.method public y()V
    .registers 1

    return-void
.end method
