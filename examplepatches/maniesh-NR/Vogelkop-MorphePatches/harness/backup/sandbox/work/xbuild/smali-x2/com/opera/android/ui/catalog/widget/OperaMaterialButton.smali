.class public Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;
.super Lcom/google/android/material/button/MaterialButton;
.source "SourceFile"


# instance fields
.field public R:Lx05;

.field public S:Ljava/lang/CharSequence;

.field public T:Landroid/graphics/drawable/Drawable;

.field public U:I

.field public V:I

.field public W:I

.field public a0:I

.field public b0:I

.field public c0:I

.field public d0:I

.field public e0:Z

.field public final f0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/google/android/material/button/MaterialButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object v0, Lohh;->c:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->f0:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->P()V

    return-void
.end method


# virtual methods
.method public final D(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_7

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->T:Landroid/graphics/drawable/Drawable;

    return-void

    :cond_7
    invoke-super {p0, p1}, Lcom/google/android/material/button/MaterialButton;->D(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final E(I)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_7

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->U:I

    return-void

    :cond_7
    invoke-super {p0, p1}, Lcom/google/android/material/button/MaterialButton;->E(I)V

    return-void
.end method

.method public final P()V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->f0:Z

    if-eqz v0, :cond_39

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v1, :cond_39

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    const v1, 0x7f0a029d

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Lcom/opera/android/graphics/OperaGradientDrawable;

    if-eqz v1, :cond_39

    check-cast v0, Lcom/opera/android/graphics/OperaGradientDrawable;

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lo8f;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lcom/opera/android/graphics/OperaGradientDrawable;->c:Lo8f;

    iget-object p0, v0, Lcom/opera/android/graphics/OperaGradientDrawable;->b:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object p0

    if-eqz p0, :cond_39

    iget-object v0, v0, Lcom/opera/android/graphics/OperaGradientDrawable;->c:Lo8f;

    if-eqz v0, :cond_39

    invoke-virtual {v0, p0}, Lo8f;->run(Ljava/lang/Object;)V

    :cond_39
    return-void
.end method

.method public final Q()Lx05;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    if-nez v0, :cond_13

    new-instance v0, Lx05;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lx05;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lx05;->d(I)V

    :cond_13
    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Lx05;->b([I)V

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    return-object p0
.end method

.method public final R(Z)V
    .registers 6

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eq v0, p1, :cond_184

    const-string v0, "iconGravity cannot have the same alignment as secondaryIconGravity"

    const/4 v1, -0x2

    const/4 v2, 0x0

    if-eqz p1, :cond_e0

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne p1, v1, :cond_18

    invoke-virtual {p0}, Landroid/widget/TextView;->getMinWidth()I

    move-result p1

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->W:I

    :cond_18
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne p1, v1, :cond_26

    invoke-virtual {p0}, Landroid/widget/TextView;->getMinHeight()I

    move-result p1

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->a0:I

    :cond_26
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->S:Ljava/lang/CharSequence;

    iget-object p1, p0, Lcom/google/android/material/button/MaterialButton;->j:Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->T:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/google/android/material/button/MaterialButton;->p:I

    if-nez v3, :cond_3e

    if-nez v3, :cond_3c

    if-eqz p1, :cond_3c

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    :cond_3c
    iput v3, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->U:I

    :cond_3e
    iget p1, p0, Lcom/google/android/material/button/MaterialButton;->x:I

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->V:I

    iget p1, p0, Lcom/google/android/material/button/MaterialButton;->s:I

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->d0:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->b0:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p1

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->c0:I

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne p1, v1, :cond_61

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->setMinWidth(I)V

    :cond_61
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne p1, v1, :cond_70

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->setMinHeight(I)V

    :cond_70
    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->Q()Lx05;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->D(Landroid/graphics/drawable/Drawable;)V

    iget p1, p0, Lcom/google/android/material/button/MaterialButton;->p:I

    const/4 v1, 0x1

    if-nez p1, :cond_96

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {v1, v3, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->E(I)V

    :cond_96
    iget-boolean p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    const/4 v3, 0x2

    if-eqz p1, :cond_9e

    iput v3, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->V:I

    goto :goto_c1

    :cond_9e
    iget p1, p0, Lcom/google/android/material/button/MaterialButton;->x:I

    if-eq p1, v3, :cond_c1

    iget-object p1, p0, Lcom/google/android/material/button/MaterialButton;->j:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_b4

    iget-object p1, p0, Lcom/google/android/material/button/MaterialButton;->m:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_b4

    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButton;->g()Z

    move-result p1

    if-eqz p1, :cond_b4

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_b4
    iput v3, p0, Lcom/google/android/material/button/MaterialButton;->x:I

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/button/MaterialButton;->L(II)V

    :cond_c1
    :goto_c1
    iget-boolean p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz p1, :cond_c8

    iput v2, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->d0:I

    goto :goto_d1

    :cond_c8
    iget p1, p0, Lcom/google/android/material/button/MaterialButton;->s:I

    if-eqz p1, :cond_d1

    iput v2, p0, Lcom/google/android/material/button/MaterialButton;->s:I

    invoke-virtual {p0, v2}, Lcom/google/android/material/button/MaterialButton;->setCompoundDrawablePadding(I)V

    :cond_d1
    :goto_d1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    invoke-virtual {p0, v2, p1, v2, v0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->setPadding(IIII)V

    iput-boolean v1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    goto/16 :goto_161

    :cond_e0
    iput-boolean v2, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne p1, v1, :cond_ef

    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->W:I

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->setMinWidth(I)V

    :cond_ef
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne p1, v1, :cond_fc

    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->a0:I

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->setMinHeight(I)V

    :cond_fc
    iget-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->S:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->T:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->D(Landroid/graphics/drawable/Drawable;)V

    iget p1, p0, Lcom/google/android/material/button/MaterialButton;->p:I

    if-nez p1, :cond_10f

    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->U:I

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->E(I)V

    :cond_10f
    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->V:I

    iget-boolean v1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v1, :cond_118

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->V:I

    goto :goto_13b

    :cond_118
    iget v1, p0, Lcom/google/android/material/button/MaterialButton;->x:I

    if-eq v1, p1, :cond_13b

    iget-object v1, p0, Lcom/google/android/material/button/MaterialButton;->j:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_12e

    iget-object v1, p0, Lcom/google/android/material/button/MaterialButton;->m:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_12e

    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButton;->g()Z

    move-result v1

    if-eqz v1, :cond_12e

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_12e
    iput p1, p0, Lcom/google/android/material/button/MaterialButton;->x:I

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/button/MaterialButton;->L(II)V

    :cond_13b
    :goto_13b
    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->b0:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    iget v1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->c0:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->setPadding(IIII)V

    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->d0:I

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_153

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->d0:I

    goto :goto_15c

    :cond_153
    iget v0, p0, Lcom/google/android/material/button/MaterialButton;->s:I

    if-eq v0, p1, :cond_15c

    iput p1, p0, Lcom/google/android/material/button/MaterialButton;->s:I

    invoke-virtual {p0, p1}, Lcom/google/android/material/button/MaterialButton;->setCompoundDrawablePadding(I)V

    :cond_15c
    :goto_15c
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->S:Ljava/lang/CharSequence;

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->T:Landroid/graphics/drawable/Drawable;

    :goto_161
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_173

    iget-boolean p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz p1, :cond_173

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->Q()Lx05;

    move-result-object p0

    invoke-virtual {p0}, Lx05;->start()V

    return-void

    :cond_173
    iget-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    if-eqz p1, :cond_184

    iget-object p1, p1, Lx05;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_184

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    invoke-virtual {p0}, Lx05;->stop()V

    :cond_184
    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Lcom/google/android/material/button/MaterialButton;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_15

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->Q()Lx05;

    move-result-object p0

    invoke-virtual {p0}, Lx05;->start()V

    return-void

    :cond_15
    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    if-eqz v0, :cond_26

    iget-object v0, v0, Lx05;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    invoke-virtual {p0}, Lx05;->stop()V

    :cond_26
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    if-eqz v0, :cond_14

    iget-object v0, v0, Lx05;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R:Lx05;

    invoke-virtual {p0}, Lx05;->stop()V

    :cond_14
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 9

    sub-int v0, p4, p2

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    sub-int v2, p5, p3

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/view/View;->measure(II)V

    invoke-super/range {p0 .. p5}, Lcom/google/android/material/button/MaterialButton;->onLayout(ZIIII)V

    return-void
.end method

.method public final performClick()Z
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-super {p0}, Lcom/google/android/material/button/MaterialButton;->performClick()Z

    move-result p0

    return p0
.end method

.method public final setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    invoke-super {p0, p1}, Lcom/google/android/material/button/MaterialButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->P()V

    return-void
.end method

.method public final setMinHeight(I)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_7

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->a0:I

    return-void

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/TextView;->setMinHeight(I)V

    return-void
.end method

.method public final setMinWidth(I)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_7

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->W:I

    return-void

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/TextView;->setMinWidth(I)V

    return-void
.end method

.method public final setPadding(IIII)V
    .registers 6

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_d

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->b0:I

    iput p3, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->c0:I

    const/4 p1, 0x0

    invoke-super {p0, p1, p2, p1, p4}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :cond_d
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public final setPressed(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_5

    const/4 p1, 0x0

    :cond_5
    invoke-super {p0, p1}, Lcom/google/android/material/button/MaterialButton;->setPressed(Z)V

    return-void
.end method

.method public final setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->e0:Z

    if-eqz v0, :cond_7

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->S:Ljava/lang/CharSequence;

    return-void

    :cond_7
    invoke-super {p0, p1, p2}, Lcom/google/android/material/button/MaterialButton;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    return-void
.end method
