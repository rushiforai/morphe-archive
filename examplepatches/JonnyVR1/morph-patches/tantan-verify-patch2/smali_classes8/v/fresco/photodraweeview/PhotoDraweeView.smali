.class public Lv/fresco/photodraweeview/PhotoDraweeView;
.super Lv/VDraweeView;
.source "SourceFile"


# instance fields
.field public o:Ll/t31;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 9
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->u()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/wlj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Ll/wlj;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->u()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getDoubleTapScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->v()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMaximumScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->z()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMediumScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->A()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMinimumScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->C()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOnDismissDragGesterListener()Ll/zl50;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->D()Ll/zl50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOnPhotoTapListener()Ll/cn50;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->E()Ll/cn50;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public getOnViewTapListener()Ll/fp50;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->F()Ll/fp50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getScale()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t31;->G()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->u()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/facebook/drawee/view/DraweeView;->onAttachedToWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t31;->K()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/facebook/drawee/view/DraweeView;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/t31;->w()Landroid/graphics/Matrix;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0, p1}, Lv/VDraweeView;->onDraw(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->N(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setController(Ll/lde;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/t31;->Q(Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setDismissDragDetector(Ll/i5e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->O(Ll/i5e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDoubleTapScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->P(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaximumScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->R(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMediumScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->S(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMinimumScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->T(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->U(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnDragDismissListenler(Ll/am50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->V(Ll/am50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->W(Landroid/view/View$OnLongClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnPhotoTapListener(Ll/cn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->X(Ll/cn50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnScaleChangeListener(Ll/mn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->Y(Ll/mn50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnViewTapListener(Ll/fp50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->Z(Ll/fp50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScale(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t31;->a0(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setZoomTransitionDuration(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/t31;->d0(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/t31;->x()Lcom/facebook/drawee/view/DraweeView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    new-instance v0, Ll/t31;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/t31;-><init>(Lcom/facebook/drawee/view/DraweeView;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 19
    .line 20
    return-void
.end method

.method public v(FFFZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/t31;->b0(FFFZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/t31;->Q(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lv/fresco/photodraweeview/PhotoDraweeView;->o:Ll/t31;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/t31;->e0(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
