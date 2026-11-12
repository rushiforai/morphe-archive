.class public Lcom/opera/android/custom_views/FadingTextView;
.super Lcom/opera/android/custom_views/StylingTextView;
.source "SourceFile"


# instance fields
.field public m:Landroid/graphics/LinearGradient;

.field public n:I

.field public o:F

.field public p:F

.field public q:Z

.field public final r:Landroid/graphics/Rect;

.field public final s:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/opera/android/custom_views/FadingTextView;->r:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070205

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/FadingTextView;->s:F

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070206

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iget-object p2, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    iget-boolean p2, p2, Lvr3;->b:Z

    if-eqz p2, :cond_30

    move p2, p1

    move p1, v0

    goto :goto_31

    :cond_30
    move p2, v0

    :goto_31
    invoke-virtual {p0, p1, v0, p2, v0}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    iget-object v0, v0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Lyq1;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    iget-object v0, v0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 16

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v2, v0

    sub-int/2addr v2, v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    iget-boolean v1, p0, Lcom/opera/android/custom_views/FadingTextView;->q:Z

    const/4 v4, 0x0

    if-eqz v1, :cond_29

    if-eqz v0, :cond_26

    invoke-virtual {v0, v4}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v1

    iput v1, p0, Lcom/opera/android/custom_views/FadingTextView;->o:F

    iput-boolean v4, p0, Lcom/opera/android/custom_views/FadingTextView;->q:Z

    goto :goto_29

    :cond_26
    const/4 v1, 0x0

    iput v1, p0, Lcom/opera/android/custom_views/FadingTextView;->o:F

    :cond_29
    :goto_29
    iget-object v1, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    iget-boolean v1, v1, Lvr3;->b:Z

    iget v5, p0, Lcom/opera/android/custom_views/FadingTextView;->s:F

    if-eqz v0, :cond_40

    if-eqz v1, :cond_40

    iget-object v6, p0, Lcom/opera/android/custom_views/FadingTextView;->r:Landroid/graphics/Rect;

    invoke-virtual {v0, v4, v6}, Landroid/text/Layout;->getLineBounds(ILandroid/graphics/Rect;)I

    iget v0, v6, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    int-to-float v4, v2

    sub-float/2addr v4, v5

    sub-float/2addr v0, v4

    :goto_3e
    move v7, v0

    goto :goto_43

    :cond_40
    int-to-float v0, v2

    sub-float/2addr v0, v5

    goto :goto_3e

    :goto_43
    if-lez v2, :cond_94

    if-lez v3, :cond_94

    iget v0, p0, Lcom/opera/android/custom_views/FadingTextView;->o:F

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-lez v0, :cond_94

    invoke-virtual {p0}, Landroid/widget/TextView;->getLineCount()I

    move-result v0

    const/4 v2, 0x1

    if-gt v0, v2, :cond_94

    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v0

    iget-object v2, p0, Lcom/opera/android/custom_views/FadingTextView;->m:Landroid/graphics/LinearGradient;

    if-eqz v2, :cond_67

    iget v2, p0, Lcom/opera/android/custom_views/FadingTextView;->n:I

    if-ne v0, v2, :cond_67

    iget v2, p0, Lcom/opera/android/custom_views/FadingTextView;->p:F

    cmpl-float v2, v7, v2

    if-eqz v2, :cond_8a

    :cond_67
    const/high16 v2, -0x1000000

    const v3, 0xffffff

    if-eqz v1, :cond_73

    and-int/2addr v3, v0

    or-int/2addr v2, v0

    move v11, v3

    :goto_71
    move v12, v2

    goto :goto_79

    :cond_73
    or-int v1, v0, v2

    and-int v2, v0, v3

    move v11, v1

    goto :goto_71

    :goto_79
    new-instance v6, Landroid/graphics/LinearGradient;

    add-float v9, v5, v7

    const/4 v10, 0x0

    sget-object v13, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v13}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iput-object v6, p0, Lcom/opera/android/custom_views/FadingTextView;->m:Landroid/graphics/LinearGradient;

    iput v0, p0, Lcom/opera/android/custom_views/FadingTextView;->n:I

    iput v7, p0, Lcom/opera/android/custom_views/FadingTextView;->p:F

    :cond_8a
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/custom_views/FadingTextView;->m:Landroid/graphics/LinearGradient;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto :goto_9c

    :cond_94
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :goto_9c
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/FadingTextView;->q:Z

    invoke-super {p0, p1, p2, p3, p4}, Lcom/opera/android/custom_views/StylingTextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    return-void
.end method
