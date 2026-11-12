.class public final Lcr8;
.super Lfr8;
.source "SourceFile"

# interfaces
.implements Lgq8;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public A:Landroid/animation/ValueAnimator;

.field public final B:Z

.field public final s:I

.field public final t:I

.field public final u:I

.field public v:Ltq8;

.field public final w:Lzzj;

.field public final x:Ljava/util/ArrayList;

.field public y:Ld03;

.field public final z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltta;Lvr8;Lzzj;)V
    .registers 7

    invoke-direct {p0, p1, p2, p3}, Lfr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    new-instance p2, Ljava/util/ArrayList;

    const/4 p3, 0x4

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lcr8;->x:Ljava/util/ArrayList;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcr8;->B:Z

    iput-object p4, p0, Lcr8;->w:Lzzj;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const/high16 p4, 0x40e00000    # 7.0f

    invoke-static {p4, p3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p3

    iput p3, p0, Lcr8;->s:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {v0, p3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p3

    iput p3, p0, Lcr8;->t:I

    iget p3, p0, Lfr8;->c:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-static {p4, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p4

    shl-int/2addr p4, p2

    sub-int/2addr p3, p4

    sub-int/2addr p3, v0

    const/4 p2, 0x2

    div-int/2addr p3, p2

    iput p3, p0, Lcr8;->u:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f0c0011

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcr8;->z:I

    new-array p1, p2, [F

    fill-array-data p1, :array_5a

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Lfr8;->l()V

    return-void

    nop

    :array_5a
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final Q(Lhq8;)V
    .registers 2

    return-void
.end method

.method public final b(Lvr8;Z)V
    .registers 8

    invoke-super {p0, p1, p2}, Lfr8;->b(Lvr8;Z)V

    invoke-virtual {p0}, Lfr8;->e()Ld03;

    move-result-object p1

    iput-object p1, p0, Lcr8;->y:Ld03;

    iget-boolean p1, p0, Lcr8;->B:Z

    if-eqz p1, :cond_3a

    iget-object p1, p0, Lcr8;->x:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x0

    :goto_14
    if-ge v0, p2, :cond_3a

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lbr8;

    iget v2, p0, Lfr8;->f:I

    if-nez v2, :cond_32

    iget-object v2, v1, Lbr8;->d:Lcr8;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f04047f

    const v4, 0x7f06063b

    invoke-static {v3, v2, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    :cond_32
    iput v2, v1, Lbr8;->c:I

    iget-object v1, v1, Lbr8;->b:Lyr8;

    invoke-virtual {v1}, Lyr8;->h()V

    goto :goto_14

    :cond_3a
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 12

    iget-object v0, p0, Lcr8;->A:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, v0, v2

    const/4 v3, 0x0

    if-lez v2, :cond_15

    const/4 v2, 0x1

    goto :goto_16

    :cond_15
    move v2, v3

    :goto_16
    if-eqz v2, :cond_28

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v5

    invoke-virtual {p2}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v6

    invoke-virtual {p1, v0, v0, v5, v6}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_29

    :cond_28
    const/4 v4, -0x1

    :goto_29
    iget-object v0, p0, Lcr8;->y:Ld03;

    if-eqz v0, :cond_35

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcr8;->y:Ld03;

    invoke-virtual {v0, p1}, Ld03;->draw(Landroid/graphics/Canvas;)V

    :cond_35
    if-eqz v2, :cond_3a

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_3a
    move v6, v3

    :goto_3b
    iget-object v0, p0, Lcr8;->x:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v6, v2, :cond_6d

    div-int/lit8 v2, v6, 0x2

    rem-int/lit8 v3, v6, 0x2

    iget v4, p2, Landroid/graphics/Rect;->left:I

    iget v5, p0, Lcr8;->s:I

    add-int/2addr v4, v5

    iget v7, p0, Lcr8;->t:I

    iget v8, p0, Lcr8;->u:I

    add-int/2addr v7, v8

    mul-int/2addr v3, v7

    add-int/2addr v3, v4

    iget v4, p2, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v5

    mul-int/2addr v7, v2

    add-int/2addr v7, v4

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbr8;

    add-int v4, v3, v8

    add-int v5, v7, v8

    iget-object v0, v0, Lbr8;->b:Lyr8;

    move-object v1, p1

    move v2, v3

    move v3, v7

    invoke-virtual/range {v0 .. v5}, Lyr8;->a(Landroid/graphics/Canvas;IIII)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_3b

    :cond_6d
    return-void
.end method

.method public final q(Z)V
    .registers 2

    iget-object p1, p0, Lcr8;->v:Ltq8;

    if-nez p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcr8;->t(Z)V

    return-void
.end method

.method public final r(ILhq8;)V
    .registers 4

    const/4 p2, 0x4

    if-ne p1, p2, :cond_7

    invoke-virtual {p0}, Lcr8;->s()V

    return-void

    :cond_7
    const/4 p2, 0x1

    if-eq p1, p2, :cond_11

    const/4 v0, 0x3

    if-eq p1, v0, :cond_11

    const/4 v0, 0x2

    if-eq p1, v0, :cond_11

    return-void

    :cond_11
    invoke-virtual {p0, p2}, Lcr8;->t(Z)V

    return-void
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Lcr8;->v:Ltq8;

    if-eqz v0, :cond_28

    iget-boolean v1, p0, Lfr8;->l:Z

    if-nez v1, :cond_d

    invoke-virtual {v0}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_d
    const-string v0, " "

    :goto_f
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const-string v1, ""

    if-ne v0, v1, :cond_28

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f140b0c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_28
    return-void
.end method

.method public final t(Z)V
    .registers 9

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    const/4 v2, 0x4

    const/4 v3, 0x0

    iget-object v4, p0, Lcr8;->x:Ljava/util/ArrayList;

    if-ge v1, v2, :cond_57

    iget-object v2, p0, Lcr8;->v:Ltq8;

    iget-object v2, v2, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_57

    iget-object v2, p0, Lcr8;->v:Ltq8;

    invoke-virtual {v2, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v2

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_41

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbr8;

    iget-object v6, v5, Lbr8;->a:Lhq8;

    if-eq v2, v6, :cond_49

    invoke-virtual {v6, v5}, Lhq8;->o(Lgq8;)V

    iget-object v5, v5, Lbr8;->b:Lyr8;

    iput-object v3, v5, Lyr8;->f:Lhq8;

    iput v0, v5, Lyr8;->j:I

    invoke-virtual {v5}, Lyr8;->e()V

    iput-object v3, v5, Lyr8;->k:Ljava/lang/String;

    iput-object v3, v5, Lyr8;->l:Lvmj;

    new-instance v3, Lbr8;

    invoke-direct {v3, p0, v2}, Lbr8;-><init>(Lcr8;Lhq8;)V

    invoke-virtual {v4, v1, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_49

    :cond_41
    new-instance v3, Lbr8;

    invoke-direct {v3, p0, v2}, Lbr8;-><init>(Lcr8;Lhq8;)V

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_49
    :goto_49
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbr8;

    iget-object v2, v2, Lbr8;->b:Lyr8;

    invoke-virtual {v2, p1}, Lyr8;->f(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_57
    :goto_57
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v1, p1, :cond_76

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbr8;

    iget-object v2, p1, Lbr8;->a:Lhq8;

    invoke-virtual {v2, p1}, Lhq8;->o(Lgq8;)V

    iget-object p1, p1, Lbr8;->b:Lyr8;

    iput-object v3, p1, Lyr8;->f:Lhq8;

    iput v0, p1, Lyr8;->j:I

    invoke-virtual {p1}, Lyr8;->e()V

    iput-object v3, p1, Lyr8;->k:Ljava/lang/String;

    iput-object v3, p1, Lyr8;->l:Lvmj;

    goto :goto_57

    :cond_76
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
