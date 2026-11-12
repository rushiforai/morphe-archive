.class public Lorg/chromium/components/browser_ui/widget/chips/ChipView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public final a:Lrma;

.field public final b:Lyq1;

.field public final c:Landroidx/appcompat/widget/AppCompatImageView;

.field public final d:Landroid/widget/LinearLayout;

.field public final e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 36

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    new-instance v2, Landroid/view/ContextThemeWrapper;

    const v3, 0x7f15039d

    move-object/from16 v4, p1

    invoke-direct {v2, v4, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    const v3, 0x7f0401cb

    const/4 v9, 0x0

    invoke-direct {v1, v2, v0, v3, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v2, 0x7fffffff

    iput v2, v1, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->e:I

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v4, Lphh;->b:[I

    invoke-virtual {v2, v0, v4, v3, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v10

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f07010c

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const/4 v2, 0x5

    invoke-virtual {v10, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    const/16 v3, 0x9

    invoke-virtual {v10, v3, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07010a

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    const/4 v5, 0x4

    invoke-virtual {v10, v5, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070109

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    const/4 v6, 0x2

    invoke-virtual {v10, v6, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0700f2

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    const/16 v11, 0xd

    invoke-virtual {v10, v11, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0700f1

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    const/16 v11, 0xc

    invoke-virtual {v10, v11, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    const/16 v8, 0x1a

    invoke-virtual {v10, v8, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v8

    if-eqz v8, :cond_85

    const v8, 0x7f0700fb

    goto :goto_88

    :cond_85
    const v8, 0x7f0700ec

    :goto_88
    const v11, 0x7f0600f9

    const/4 v12, 0x3

    invoke-virtual {v10, v12, v11}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v11

    const v13, 0x7f060107

    const/4 v14, 0x6

    invoke-virtual {v10, v14, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v13

    const/16 v15, 0x18

    move/from16 p1, v5

    const v5, 0x7f060106

    invoke-virtual {v10, v15, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    const v15, 0x7f06010e

    move/from16 p2, v12

    const/4 v12, 0x7

    invoke-virtual {v10, v12, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v15

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v16

    move/from16 v17, v12

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    move/from16 v16, v14

    const v14, 0x7f0700ed

    invoke-virtual {v12, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    const/16 v14, 0xa

    invoke-virtual {v10, v14, v12}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v2, 0x7f0700f3

    invoke-virtual {v14, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    move/from16 v19, v6

    const/16 v6, 0x13

    invoke-virtual {v10, v6, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    const/16 v2, 0x11

    invoke-virtual {v10, v2, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    const/16 v14, 0x1d

    invoke-virtual {v10, v14, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v14

    move/from16 v21, v0

    const/16 v0, 0x1c

    invoke-virtual {v10, v0, v9}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    const/4 v9, 0x1

    if-ne v0, v9, :cond_fa

    move v0, v9

    goto :goto_fb

    :cond_fa
    const/4 v0, 0x0

    :goto_fb
    const/16 v9, 0x16

    move/from16 v24, v0

    const v0, 0x7f1503ea

    invoke-virtual {v10, v9, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    move/from16 v26, v5

    const v5, 0x7f0700f3

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const/16 v5, 0xe

    invoke-virtual {v10, v5, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f0700f3

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const/16 v5, 0xb

    invoke-virtual {v10, v5, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    const/16 v0, 0x19

    const v5, 0x7f1503ea

    invoke-virtual {v10, v0, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f0700eb

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const/16 v5, 0x1e

    invoke-virtual {v10, v5, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    move/from16 v20, v0

    const/4 v0, 0x1

    const/4 v5, 0x0

    invoke-virtual {v10, v0, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v25

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f070108

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const/16 v5, 0x15

    invoke-virtual {v10, v5, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    const/16 v5, 0x1b

    move/from16 v27, v8

    const/4 v8, 0x0

    invoke-virtual {v10, v5, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    move/from16 v28, v5

    const v5, 0x7f0700fa

    invoke-virtual {v8, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const/16 v8, 0x17

    invoke-virtual {v10, v8, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    move/from16 v29, v11

    const v11, 0x7f0700f6

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    const/16 v11, 0x14

    invoke-virtual {v10, v11, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v8

    new-instance v11, Landroidx/appcompat/widget/AppCompatImageView;

    move/from16 v30, v8

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v11, v8}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    iput-object v11, v1, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->c:Landroidx/appcompat/widget/AppCompatImageView;

    const v8, 0x7f0a0213

    invoke-virtual {v11, v8}, Landroid/view/View;->setId(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz v14, :cond_1b8

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v14, 0x7f0700ee

    invoke-virtual {v8, v14}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    sub-int/2addr v8, v2

    div-int/lit8 v8, v8, 0x2

    goto :goto_1ba

    :cond_1b8
    move/from16 v8, v21

    :goto_1ba
    sub-int v14, v2, v30

    div-int/lit8 v14, v14, 0x2

    sub-int v21, v6, v30

    move/from16 v30, v15

    div-int/lit8 v15, v21, 0x2

    move-object/from16 v21, v11

    new-instance v11, Lorg/chromium/ui/widget/LoadingView;

    move/from16 v31, v13

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v11, v13}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    new-instance v13, Ljava/util/ArrayList;

    const v13, 0x7f0a0210

    invoke-virtual {v11, v13}, Landroid/view/View;->setId(I)V

    const/16 v13, 0x8

    invoke-virtual {v11, v13}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    move/from16 v32, v12

    const v12, 0x7f060178

    invoke-virtual {v13, v12}, Landroid/content/Context;->getColor(I)I

    move-result v12

    invoke-static {v12}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v11, v15, v14, v15, v14}, Landroid/view/View;->setPaddingRelative(IIII)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v8, v3, v4, v7}, Landroid/view/View;->setPaddingRelative(IIII)V

    new-instance v11, Lyq1;

    new-instance v2, Landroid/view/ContextThemeWrapper;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1501ac

    invoke-direct {v2, v3, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    const/4 v3, 0x0

    invoke-direct {v11, v2, v3}, Lyq1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v11, v1, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->b:Lyq1;

    const v2, 0x7f0a0211

    invoke-virtual {v11, v2}, Landroid/view/View;->setId(I)V

    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setTextAppearance(I)V

    const/4 v8, 0x0

    invoke-virtual {v10, v8}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_22b

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_22b
    xor-int/lit8 v2, v24, 0x1

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz v25, :cond_24b

    move/from16 v2, v19

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v11}, Landroid/view/View;->getPaddingStart()I

    move-result v2

    invoke-virtual {v11}, Landroid/view/View;->getPaddingEnd()I

    move-result v4

    invoke-virtual {v11, v2, v0, v4, v0}, Landroid/view/View;->setPaddingRelative(IIII)V

    :cond_24b
    if-eqz v28, :cond_251

    const/4 v0, 0x5

    invoke-virtual {v11, v0}, Landroid/view/View;->setTextAlignment(I)V

    :cond_251
    invoke-virtual {v11}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {v11}, Landroid/view/View;->getPaddingEnd()I

    move-result v2

    invoke-virtual {v11}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v11, v5, v0, v2, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    if-eqz v24, :cond_286

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0a0214

    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v0, v1, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_289

    :cond_286
    invoke-virtual {v1, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :goto_289
    const/16 v0, 0xf

    const/4 v8, 0x0

    invoke-virtual {v10, v0, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    move/from16 v22, v8

    move v8, v0

    new-instance v0, Lrma;

    move/from16 v2, v32

    int-to-float v2, v2

    const/16 v3, 0x8

    new-array v4, v3, [F

    aput v2, v4, v22

    const/16 v23, 0x1

    aput v2, v4, v23

    const/16 v19, 0x2

    aput v2, v4, v19

    aput v2, v4, p2

    aput v2, v4, p1

    const/16 v18, 0x5

    aput v2, v4, v18

    aput v2, v4, v16

    aput v2, v4, v17

    move/from16 v7, v20

    move/from16 v3, v26

    move/from16 v6, v27

    move/from16 v2, v29

    move/from16 v5, v30

    invoke-direct/range {v0 .. v8}, Lrma;-><init>(Landroid/view/View;II[FIIII)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    move/from16 v3, v31

    invoke-virtual {v2, v3}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iget-object v3, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v3, Landroid/content/res/ColorStateList;

    if-eq v2, v3, :cond_2d8

    iput-object v2, v0, Lrma;->f:Ljava/lang/Object;

    iget-object v3, v0, Lrma;->h:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    :cond_2d8
    iput-object v0, v1, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->a:Lrma;

    const/16 v0, 0x10

    const/4 v8, 0x0

    invoke-virtual {v10, v0, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    const/16 v2, 0x12

    invoke-virtual {v10, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v0, :cond_319

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_2f8

    if-eqz v2, :cond_2f8

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_2f8
    if-nez v2, :cond_2fd

    move/from16 v9, v23

    goto :goto_2fe

    :cond_2fd
    const/4 v9, 0x0

    :goto_2fe
    move-object/from16 v1, v21

    if-nez v0, :cond_308

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_320

    :cond_308
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    if-eqz v9, :cond_315

    invoke-virtual {v11}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_315
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_320

    :cond_319
    move-object/from16 v1, v21

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_320
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final onMeasure(II)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iget v0, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->e:I

    if-le p1, v0, :cond_33

    iget-object p1, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->b:Lyq1;

    iget-object v1, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->d:Landroid/widget/LinearLayout;

    if-nez v1, :cond_16

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    goto :goto_1a

    :cond_16
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    :goto_1a
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    sub-int/2addr v2, v0

    sub-int/2addr v1, v2

    if-lez v1, :cond_33

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/high16 p1, 0x40000000    # 2.0f

    invoke-static {v0, p1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    :cond_33
    return-void
.end method

.method public final setBackgroundColor(I)V
    .registers 2

    iget-object p0, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->a:Lrma;

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    return-void
.end method

.method public final setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    iget-object p0, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->a:Lrma;

    iget-object v0, p0, Lrma;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/ColorStateList;

    if-ne p1, v0, :cond_9

    return-void

    :cond_9
    iput-object p1, p0, Lrma;->d:Ljava/lang/Object;

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final setEnabled(Z)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->b:Lyq1;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object p0, p0, Lorg/chromium/components/browser_ui/widget/chips/ChipView;->c:Landroidx/appcompat/widget/AppCompatImageView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final setSelected(Z)V
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    return-void
.end method
