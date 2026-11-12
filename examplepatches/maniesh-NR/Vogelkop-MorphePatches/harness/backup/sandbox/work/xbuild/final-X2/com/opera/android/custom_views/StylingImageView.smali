.class public Lcom/opera/android/custom_views/StylingImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"

# interfaces
.implements Lk2c;


# instance fields
.field public final a:I

.field public final b:Z

.field public c:Z

.field public final d:Lua7;

.field public final e:Lua7;

.field public final f:Ll2c;

.field public final g:Lfr;

.field public h:I

.field public i:Z

.field public j:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 103
    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9

    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lua7;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2, v1}, Lua7;-><init>(Landroid/view/View;ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingImageView;->d:Lua7;

    new-instance v3, Lua7;

    invoke-direct {v3, p0, v2, v1}, Lua7;-><init>(Landroid/view/View;ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v3, p0, Lcom/opera/android/custom_views/StylingImageView;->e:Lua7;

    const/4 v1, 0x0

    iput v1, p0, Lcom/opera/android/custom_views/StylingImageView;->h:I

    new-instance v4, Ll2c;

    invoke-direct {v4, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v4, p0, Lcom/opera/android/custom_views/StylingImageView;->f:Ll2c;

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object v4

    iput-object v4, p0, Lcom/opera/android/custom_views/StylingImageView;->g:Lfr;

    if-eqz v4, :cond_29

    invoke-virtual {v4, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_29
    sget-object v4, Lkhh;->N:[I

    invoke-virtual {p1, p2, v4, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 p3, 0x5

    invoke-virtual {v0, p2, p3}, Lua7;->A(Landroid/content/res/TypedArray;I)V

    const/4 p3, 0x2

    invoke-virtual {v3, p2, p3}, Lua7;->A(Landroid/content/res/TypedArray;I)V

    const/4 p3, 0x3

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/opera/android/custom_views/StylingImageView;->a:I

    invoke-virtual {p2, v1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/opera/android/custom_views/StylingImageView;->b:Z

    const/4 p3, 0x6

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p3, :cond_5d

    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :cond_5d
    if-eqz v0, :cond_66

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_66
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget v0, p0, Lcom/opera/android/custom_views/StylingImageView;->a:I

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1b

    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageView;->c:Z

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1b

    iget v0, p0, Lcom/opera/android/custom_views/StylingImageView;->a:I

    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :cond_1b
    return-void
.end method

.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingImageView;->f:Ll2c;

    return-object p0
.end method

.method public final c(Landroid/content/res/ColorStateList;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingImageView;->d:Lua7;

    invoke-virtual {p0, p1}, Lua7;->M(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final d()Z
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v2, :cond_17

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-lez v0, :cond_17

    invoke-virtual {p0}, Landroid/widget/ImageView;->getAdjustViewBounds()Z

    move-result p0

    if-nez p0, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    return v1
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/opera/android/custom_views/StylingImageView;->d:Lua7;

    if-eqz v0, :cond_15

    iget-object v3, v2, Lua7;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getDrawableState()[I

    move-result-object v3

    invoke-virtual {v2, v3, v1, v0}, Lua7;->X([IILandroid/graphics/drawable/Drawable;)V

    goto :goto_18

    :cond_15
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_18
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p0, Lcom/opera/android/custom_views/StylingImageView;->e:Lua7;

    if-eqz v0, :cond_2c

    iget-object v3, v2, Lua7;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getDrawableState()[I

    move-result-object v3

    invoke-virtual {v2, v3, v1, v0}, Lua7;->X([IILandroid/graphics/drawable/Drawable;)V

    goto :goto_2f

    :cond_2c
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_2f
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final drawableStateChanged()V
    .registers 5

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    goto :goto_11

    :cond_f
    const/4 v1, 0x0

    move v2, v1

    :goto_11
    invoke-super {p0}, Landroidx/appcompat/widget/AppCompatImageView;->drawableStateChanged()V

    iget-object v3, p0, Lcom/opera/android/custom_views/StylingImageView;->d:Lua7;

    invoke-virtual {v3}, Lua7;->G()V

    iget-object v3, p0, Lcom/opera/android/custom_views/StylingImageView;->e:Lua7;

    invoke-virtual {v3}, Lua7;->G()V

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    if-ne v1, v3, :cond_2c

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    if-eq v2, v1, :cond_33

    :cond_2c
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_33
    return-void
.end method

.method public final hasOverlappingRendering()Z
    .registers 2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Ls8i;

    if-nez v0, :cond_10

    invoke-super {p0}, Landroidx/appcompat/widget/AppCompatImageView;->hasOverlappingRendering()Z

    move-result p0

    if-nez p0, :cond_10

    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method public final i(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingImageView;->g:Lfr;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_7
    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageView;->b:Z

    if-eqz v0, :cond_19

    iget v0, p0, Lcom/opera/android/custom_views/StylingImageView;->h:I

    if-eq v0, p1, :cond_19

    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f

    mul-float/2addr v0, v1

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    :cond_19
    iput p1, p0, Lcom/opera/android/custom_views/StylingImageView;->h:I

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageView;->c:Z

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageView;->a()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/opera/android/custom_views/StylingImageView;->d:Lua7;

    invoke-virtual {p1}, Lua7;->F()V

    iget-object p1, p0, Lcom/opera/android/custom_views/StylingImageView;->e:Lua7;

    invoke-virtual {p1}, Lua7;->F()V

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageView;->c:Z

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingImageView;->j:[F

    if-nez v0, :cond_10

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingImageView;->j:[F

    :cond_10
    invoke-virtual {p0}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/custom_views/StylingImageView;->j:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingImageView;->j:[F

    const/4 v1, 0x2

    aget v1, v0, v1

    float-to-int v2, v1

    int-to-float v2, v2

    sub-float/2addr v1, v2

    const/4 v2, 0x5

    aget v0, v0, v2

    float-to-int v2, v0

    int-to-float v2, v2

    sub-float/2addr v0, v2

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-nez v3, :cond_30

    cmpl-float v2, v0, v2

    if-eqz v2, :cond_3a

    :cond_30
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    neg-float v1, v1

    neg-float v0, v0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v0, 0x1

    goto :goto_3b

    :cond_3a
    const/4 v0, 0x0

    :goto_3b
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    if-eqz v0, :cond_43

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_43
    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/opera/android/custom_views/StylingImageView;->d:Lua7;

    if-nez p1, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageView;->a()V

    return-void
.end method

.method public final requestLayout()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageView;->i:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageView;->d()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageView;->i:Z

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/custom_views/StylingImageView;->i:Z

    return-void
.end method
