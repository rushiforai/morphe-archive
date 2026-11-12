.class public final Lj1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Ljava/lang/Object;

.field public e:Landroid/os/Parcelable;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# virtual methods
.method public final a()V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lj1f;->f:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/RectF;

    iget v2, v0, Lj1f;->a:I

    iget-object v3, v0, Lj1f;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/AutoResizeTextView;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    iput v5, v0, Lj1f;->c:I

    if-gtz v5, :cond_2d

    return-void

    :cond_2d
    new-instance v5, Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v5, v0, Lj1f;->g:Ljava/lang/Object;

    iget v5, v0, Lj1f;->c:I

    int-to-float v5, v5

    iput v5, v1, Landroid/graphics/RectF;->right:F

    int-to-float v4, v4

    iput v4, v1, Landroid/graphics/RectF;->bottom:F

    iget v4, v0, Lj1f;->b:I

    move v5, v4

    move v4, v2

    :goto_44
    if-gt v2, v5, :cond_105

    add-int v4, v2, v5

    const/4 v6, 0x1

    ushr-int/2addr v4, v6

    iget-object v7, v0, Lj1f;->e:Landroid/os/Parcelable;

    check-cast v7, Landroid/graphics/RectF;

    iget-object v8, v0, Lj1f;->g:Ljava/lang/Object;

    check-cast v8, Landroid/text/TextPaint;

    int-to-float v9, v4

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v3}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v8

    if-nez v8, :cond_66

    invoke-virtual {v3}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_64
    move-object v10, v8

    goto :goto_73

    :cond_66
    invoke-virtual {v3}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v8, v9, v3}, Landroid/text/method/TransformationMethod;->getTransformation(Ljava/lang/CharSequence;Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_64

    :goto_73
    invoke-virtual {v3}, Landroid/widget/TextView;->getMaxLines()I

    move-result v8

    const/16 v17, -0x1

    if-ne v8, v6, :cond_90

    iget-object v8, v0, Lj1f;->g:Ljava/lang/Object;

    check-cast v8, Landroid/text/TextPaint;

    invoke-virtual {v8}, Landroid/graphics/Paint;->getFontSpacing()F

    move-result v8

    iput v8, v7, Landroid/graphics/RectF;->bottom:F

    iget-object v8, v0, Lj1f;->g:Ljava/lang/Object;

    check-cast v8, Landroid/text/TextPaint;

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v8

    iput v8, v7, Landroid/graphics/RectF;->right:F

    goto :goto_e7

    :cond_90
    invoke-virtual {v3}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    move-result v14

    invoke-virtual {v3}, Landroid/widget/TextView;->getLineSpacingExtra()F

    move-result v15

    new-instance v9, Landroid/text/StaticLayout;

    iget-object v8, v0, Lj1f;->g:Ljava/lang/Object;

    move-object v11, v8

    check-cast v11, Landroid/text/TextPaint;

    iget v12, v0, Lj1f;->c:I

    sget-object v13, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/16 v16, 0x1

    invoke-direct/range {v9 .. v16}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    invoke-virtual {v3}, Landroid/widget/TextView;->getMaxLines()I

    move-result v8

    if-ltz v8, :cond_b8

    invoke-virtual {v9}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v8

    invoke-virtual {v3}, Landroid/widget/TextView;->getMaxLines()I

    move-result v10

    if-gt v8, v10, :cond_f3

    :cond_b8
    invoke-virtual {v9}, Landroid/text/Layout;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iput v8, v7, Landroid/graphics/RectF;->bottom:F

    const/4 v8, 0x0

    move/from16 v10, v17

    :goto_c2
    invoke-virtual {v9}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v11

    if-ge v8, v11, :cond_e4

    int-to-float v11, v10

    invoke-virtual {v9, v8}, Landroid/text/Layout;->getLineRight(I)F

    move-result v12

    invoke-virtual {v9, v8}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v13

    sub-float/2addr v12, v13

    cmpg-float v11, v11, v12

    if-gez v11, :cond_e1

    invoke-virtual {v9, v8}, Landroid/text/Layout;->getLineRight(I)F

    move-result v10

    float-to-int v10, v10

    invoke-virtual {v9, v8}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v11

    float-to-int v11, v11

    sub-int/2addr v10, v11

    :cond_e1
    add-int/lit8 v8, v8, 0x1

    goto :goto_c2

    :cond_e4
    int-to-float v8, v10

    iput v8, v7, Landroid/graphics/RectF;->right:F

    :goto_e7
    const/4 v8, 0x0

    invoke-virtual {v7, v8, v8}, Landroid/graphics/RectF;->offsetTo(FF)V

    invoke-virtual {v1, v7}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v7

    if-eqz v7, :cond_f3

    move/from16 v6, v17

    :cond_f3
    if-gez v6, :cond_fe

    add-int/lit8 v4, v4, 0x1

    move/from16 v18, v4

    move v4, v2

    move/from16 v2, v18

    goto/16 :goto_44

    :cond_fe
    if-lez v6, :cond_105

    add-int/lit8 v4, v4, -0x1

    move v5, v4

    goto/16 :goto_44

    :cond_105
    int-to-float v0, v4

    invoke-virtual {v3, v0}, Lcom/opera/android/custom_views/AutoResizeTextView;->u(F)V

    return-void
.end method

.method public final b(IZ)V
    .registers 4

    iget v0, p0, Lj1f;->c:I

    if-eqz p2, :cond_8

    or-int/2addr v0, p1

    iput v0, p0, Lj1f;->c:I

    return-void

    :cond_8
    not-int p1, p1

    and-int/2addr v0, p1

    iput v0, p0, Lj1f;->c:I

    return-void
.end method
