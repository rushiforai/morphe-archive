.class public Lorg/chromium/ui/widget/ButtonCompat;
.super Ljp1;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x7f150212

    .line 456
    invoke-direct {p0, p1, p2, v0}, Lorg/chromium/ui/widget/ButtonCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    new-instance v2, Landroid/view/ContextThemeWrapper;

    move-object/from16 v3, p1

    move/from16 v4, p3

    invoke-direct {v2, v3, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    const v3, 0x1010048

    invoke-direct {v0, v2, v1, v3}, Ljp1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v4, Lqhh;->a:[I

    const/4 v5, 0x0

    invoke-virtual {v2, v1, v4, v3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    const v2, 0x7f0600c2

    const/4 v3, 0x3

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    const/4 v4, 0x6

    const/4 v6, -0x1

    invoke-virtual {v1, v4, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    if-ne v7, v6, :cond_3f

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/content/Context;->getColor(I)I

    move-result v7

    if-nez v7, :cond_3c

    const v7, 0x7f06104b

    goto :goto_3f

    :cond_3c
    const v7, 0x7f060228

    :cond_3f
    :goto_3f
    const v8, 0x106000d

    invoke-virtual {v1, v5, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v8

    const v9, 0x7f07016c

    const/4 v10, 0x2

    invoke-virtual {v1, v10, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0700b1

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    const/16 v12, 0xc

    invoke-virtual {v1, v12, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v16

    const/4 v11, 0x5

    invoke-virtual {v1, v11, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    const/4 v12, 0x1

    invoke-virtual {v1, v12, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v13

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    move/from16 p1, v3

    const v3, 0x7f0700b2

    invoke-virtual {v14, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    const/4 v14, 0x7

    invoke-virtual {v1, v14, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    move/from16 p2, v4

    const/16 v4, 0xb

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    move/from16 p3, v11

    const/16 v11, 0xa

    invoke-virtual {v1, v11, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    move/from16 v17, v14

    const/16 v14, 0x9

    invoke-virtual {v1, v14, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v14

    move/from16 v18, v10

    const/16 v10, 0x8

    invoke-virtual {v1, v10, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    move/from16 v19, v5

    const/4 v5, 0x4

    invoke-virtual {v1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    move/from16 v20, v5

    if-eq v10, v6, :cond_b1

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v10}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_b1
    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    if-ne v5, v12, :cond_d0

    const/16 v5, 0x8

    new-array v5, v5, [F

    int-to-float v10, v11

    aput v10, v5, v19

    aput v10, v5, v12

    int-to-float v4, v4

    aput v4, v5, v18

    aput v4, v5, p1

    int-to-float v4, v14

    aput v4, v5, v20

    aput v4, v5, p3

    int-to-float v3, v3

    aput v3, v5, p2

    aput v3, v5, v17

    goto :goto_e8

    :cond_d0
    const/16 v5, 0x8

    new-array v5, v5, [F

    int-to-float v4, v4

    aput v4, v5, v19

    aput v4, v5, v12

    int-to-float v4, v11

    aput v4, v5, v18

    aput v4, v5, p1

    int-to-float v3, v3

    aput v3, v5, v20

    aput v3, v5, p3

    int-to-float v3, v14

    aput v3, v5, p2

    aput v3, v5, v17

    :goto_e8
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v8}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v7, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    if-lez v3, :cond_110

    invoke-virtual {v7, v3, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(ILandroid/content/res/ColorStateList;)V

    :cond_110
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v8, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    move/from16 v9, v19

    invoke-virtual {v8, v3, v9}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    new-instance v14, Landroid/graphics/drawable/LayerDrawable;

    move/from16 v10, v18

    new-array v10, v10, [Landroid/graphics/drawable/Drawable;

    aput-object v7, v10, v9

    aput-object v8, v10, v12

    invoke-direct {v14, v10}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v8, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v8, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    new-instance v5, Landroid/graphics/drawable/RippleDrawable;

    new-instance v6, Landroid/content/res/ColorStateList;

    sget-object v10, Lrma;->m:[I

    sget-object v11, Landroid/util/StateSet;->NOTHING:[I

    filled-new-array {v10, v11}, [[I

    move-result-object v10

    sget-object v11, Lrma;->n:[I

    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v9

    invoke-virtual {v4, v11, v9}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v9

    invoke-static {v9}, Landroid/graphics/Color;->alpha(I)I

    move-result v11

    shl-int/2addr v11, v12

    move/from16 p1, v12

    const/16 v12, 0xff

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-static {v9, v11}, Lab5;->l(II)I

    move-result v9

    sget-object v11, Lrma;->l:[I

    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v12

    invoke-virtual {v4, v11, v12}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v11

    shl-int/lit8 v11, v11, 0x1

    const/16 v12, 0xff

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-static {v4, v11}, Lab5;->l(II)I

    move-result v4

    filled-new-array {v9, v4}, [I

    move-result-object v4

    invoke-direct {v6, v10, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    move v4, v13

    if-eqz v16, :cond_18a

    new-instance v13, Landroid/graphics/drawable/InsetDrawable;

    move/from16 v17, v15

    move/from16 v18, v16

    invoke-direct/range {v13 .. v18}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    move-object v14, v13

    :cond_18a
    invoke-direct {v5, v6, v14, v8}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-nez v2, :cond_19d

    :goto_19a
    move/from16 v2, p1

    goto :goto_1a1

    :cond_19d
    invoke-virtual {v7, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    goto :goto_19a

    :goto_1a1
    if-ne v4, v2, :cond_1ba

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f070153

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070154

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_1bc

    :cond_1ba
    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_1bc
    if-lez v5, :cond_1c4

    int-to-float v2, v5

    int-to-float v0, v0

    invoke-virtual {v7, v3, v1, v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(ILandroid/content/res/ColorStateList;FF)V

    return-void

    :cond_1c4
    invoke-virtual {v7, v3, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(ILandroid/content/res/ColorStateList;)V

    return-void
.end method
