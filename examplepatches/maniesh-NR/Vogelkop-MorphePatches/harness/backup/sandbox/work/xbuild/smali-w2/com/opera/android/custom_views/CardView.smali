.class public Lcom/opera/android/custom_views/CardView;
.super Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;
.source "SourceFile"


# instance fields
.field public final c:I

.field public final d:Lua7;

.field public e:Landroid/content/res/ColorStateList;

.field public final f:I

.field public g:Landroid/graphics/Path;

.field public h:Landroid/graphics/drawable/Drawable;

.field public i:Luk4;

.field public final j:I

.field public k:Landroid/view/View;

.field public l:I

.field public final m:Z

.field public n:Lvk4;

.field public final o:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const v0, 0x7f040165

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_1e

    const v3, 0x101011f

    filled-new-array {v3}, [I

    move-result-object v3

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    invoke-virtual {v3, v2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/opera/android/custom_views/CardView;->c:I

    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1e
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    new-instance v4, Lua7;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5, v3}, Lua7;-><init>(Landroid/view/View;ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v4, p0, Lcom/opera/android/custom_views/CardView;->d:Lua7;

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/opera/android/custom_views/CardView;->o:Landroid/graphics/Paint;

    sget-object v3, Lmhh;->a:[I

    invoke-virtual {p1, p2, v3, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {v4, p1, p2}, Lua7;->A(Landroid/content/res/TypedArray;I)V

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/custom_views/CardView;->e:Landroid/content/res/ColorStateList;

    const/16 p2, 0xe

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/CardView;->j:I

    const/16 p2, 0xd

    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/CardView;->l:I

    const/16 p2, 0xf

    invoke-virtual {p1, p2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/CardView;->m:Z

    const/4 p2, 0x3

    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/CardView;->f:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-lez p2, :cond_6e

    invoke-virtual {p0, v5}, Landroid/view/View;->setClipToOutline(Z)V

    new-instance p1, Ltk4;

    invoke-direct {p1, p0, v2}, Ltk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    :cond_6e
    invoke-virtual {p0}, Lcom/opera/android/custom_views/CardView;->d()V

    return-void
.end method


# virtual methods
.method public final d()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->i:Luk4;

    if-eqz v0, :cond_1c

    iget v1, p0, Lcom/opera/android/custom_views/CardView;->l:I

    iget-object v2, v0, Luk4;->a:Landroid/graphics/drawable/Drawable;

    new-instance v3, Landroid/graphics/PorterDuffColorFilter;

    iget-boolean v0, v0, Luk4;->b:Z

    if-eqz v0, :cond_11

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    goto :goto_13

    :cond_11
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    :goto_13
    invoke-direct {v3, v1, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_1c
    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 12

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v0

    if-nez v0, :cond_3c

    iget v0, p0, Lcom/opera/android/custom_views/CardView;->f:I

    if-lez v0, :cond_3c

    iget-object v1, p0, Lcom/opera/android/custom_views/CardView;->g:Landroid/graphics/Path;

    if-nez v1, :cond_15

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/opera/android/custom_views/CardView;->g:Landroid/graphics/Path;

    :cond_15
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    iget-object v2, p0, Lcom/opera/android/custom_views/CardView;->g:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v5, v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v6, v1

    int-to-float v7, v0

    int-to-float v8, v0

    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->g:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_3c
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 13

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->e:Landroid/content/res/ColorStateList;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    goto :goto_f

    :cond_e
    move v0, v1

    :goto_f
    iget-object v2, p0, Lcom/opera/android/custom_views/CardView;->h:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_2f

    if-eqz v0, :cond_2f

    iget-object v10, p0, Lcom/opera/android/custom_views/CardView;->o:Landroid/graphics/Paint;

    invoke-virtual {v10, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v6, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v7, v0

    iget v0, p0, Lcom/opera/android/custom_views/CardView;->f:I

    int-to-float v8, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v9, v8

    move-object v3, p1

    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto :goto_30

    :cond_2f
    move-object v3, p1

    :goto_30
    iget-object p1, p0, Lcom/opera/android/custom_views/CardView;->h:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->d:Lua7;

    if-eqz p1, :cond_42

    iget-object v2, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    invoke-virtual {v0, v2, v1, p1}, Lua7;->X([IILandroid/graphics/drawable/Drawable;)V

    goto :goto_45

    :cond_42
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_45
    iget-object p1, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    if-eqz p1, :cond_5e

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result p1

    if-eqz p1, :cond_54

    iget-object p1, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    invoke-virtual {p1}, Lvk4;->onGlobalLayout()V

    :cond_54
    iget-object p1, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    iget-object p1, p1, Lvk4;->a:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->i:Luk4;

    iput p1, v0, Luk4;->c:I

    :cond_5e
    :try_start_5e
    invoke-super {p0, v3}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_61} :catch_61

    :catch_61
    return-void
.end method

.method public final drawableStateChanged()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    iget-object p0, p0, Lcom/opera/android/custom_views/CardView;->d:Lua7;

    invoke-virtual {p0}, Lua7;->G()V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_10
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/CardView;->d:Lua7;

    invoke-virtual {p0}, Lua7;->F()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_10
    return-void
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const/4 v0, -0x1

    iget v1, p0, Lcom/opera/android/custom_views/CardView;->j:I

    if-eq v1, v0, :cond_23

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/custom_views/CardView;->k:Landroid/view/View;

    if-eqz v0, :cond_18

    new-instance v0, Lvk4;

    invoke-direct {v0, p0}, Lvk4;-><init>(Lcom/opera/android/custom_views/CardView;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/CardView;->n:Lvk4;

    return-void

    :cond_18
    const-string p0, "Child with id "

    const-string v0, " not found"

    invoke-static {v1, p0, v0}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_23
    return-void
.end method

.method public final onMeasure(II)V
    .registers 5

    iget v0, p0, Lcom/opera/android/custom_views/CardView;->c:I

    if-lez v0, :cond_16

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    if-ge v0, v1, :cond_16

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    invoke-static {v0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->onMeasure(II)V

    return-void

    :cond_16
    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->onMeasure(II)V

    return-void
.end method

.method public final setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 5

    iput-object p1, p0, Lcom/opera/android/custom_views/CardView;->h:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_10

    new-instance v0, Luk4;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-boolean v2, p0, Lcom/opera/android/custom_views/CardView;->m:Z

    invoke-direct {v0, v1, p1, v2}, Luk4;-><init>(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;Z)V

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    iput-object v0, p0, Lcom/opera/android/custom_views/CardView;->i:Luk4;

    invoke-super {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/CardView;->d()V

    return-void
.end method
