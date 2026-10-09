.class public final Le/e/a/DialogInputs;
.super Ljava/lang/Object;
.source "DialogInputs.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static pad(Landroid/view/View;)V
    .registers 19
    .param p0, "view"    # Landroid/view/View;

    .line 6
    move-object/from16 v1, p0

    instance-of v0, v1, Landroid/widget/EditText;

    if-eqz v0, :cond_121

    .line 7
    move-object v2, v1

    check-cast v2, Landroid/widget/EditText;

    .local v2, "field":Landroid/widget/EditText;
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    move-object v3, v0

    .local v3, "themed":Landroid/widget/EditText;
    invoke-virtual {v3}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v4

    .local v4, "accent":I
    invoke-static {v1}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v5

    .local v5, "ink":I
    const v0, 0xffffff

    and-int/2addr v0, v5

    const/high16 v6, -0x67000000

    or-int/2addr v6, v0

    .line 9
    .local v6, "muted":I
    const/4 v7, 0x1

    const/4 v8, 0x0

    :try_start_2f
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v9, "setBackgroundTintList"

    new-array v10, v7, [Ljava/lang/Class;

    const-class v11, Landroid/content/res/ColorStateList;

    aput-object v11, v10, v8

    invoke-virtual {v0, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-instance v9, Landroid/content/res/ColorStateList;

    const v10, 0x101009c

    filled-new-array {v10}, [I

    move-result-object v10

    new-array v11, v8, [I

    const/4 v12, 0x2

    new-array v12, v12, [[I

    aput-object v10, v12, v8

    aput-object v11, v12, v7

    filled-new-array {v4, v6}, [I

    move-result-object v10

    invoke-direct {v9, v12, v10}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    new-array v10, v7, [Ljava/lang/Object;

    aput-object v9, v10, v8

    invoke-virtual {v0, v1, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_5f} :catch_60

    goto :goto_61

    :catch_60
    move-exception v0

    .line 10
    :goto_61
    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-virtual {v2, v6}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v9, 0x41c00000    # 24.0f

    mul-float v0, v0, v9

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v9

    .local v9, "inset":I
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    const/4 v10, 0x0

    if-eqz v0, :cond_89

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_8a

    :cond_89
    move-object v0, v10

    :goto_8a
    move-object v11, v0

    .line 12
    .local v11, "parent":Landroid/view/View;
    const/4 v0, 0x0

    .line 13
    .local v0, "padded":Z
    move-object v12, v11

    .local v12, "ancestor":Landroid/view/View;
    :goto_8d
    if-eqz v12, :cond_af

    invoke-virtual {v12}, Landroid/view/View;->getPaddingLeft()I

    move-result v13

    if-gtz v13, :cond_ae

    invoke-virtual {v12}, Landroid/view/View;->getPaddingRight()I

    move-result v13

    if-lez v13, :cond_9c

    goto :goto_ae

    :cond_9c
    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    instance-of v13, v13, Landroid/view/View;

    if-eqz v13, :cond_ab

    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    goto :goto_ac

    :cond_ab
    move-object v13, v10

    :goto_ac
    move-object v12, v13

    goto :goto_8d

    :cond_ae
    :goto_ae
    const/4 v0, 0x1

    :cond_af
    move v10, v0

    .line 14
    .end local v0    # "padded":Z
    .end local v12    # "ancestor":Landroid/view/View;
    .local v10, "padded":Z
    if-eqz v10, :cond_b4

    const/4 v0, 0x0

    goto :goto_b5

    :cond_b4
    move v0, v9

    :goto_b5
    move v12, v0

    .line 15
    .local v12, "margin":I
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    .line 16
    .local v13, "lp":Landroid/view/ViewGroup$LayoutParams;
    instance-of v0, v13, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_102

    move-object v14, v13

    check-cast v14, Landroid/view/ViewGroup$MarginLayoutParams;

    .local v14, "margins":Landroid/view/ViewGroup$MarginLayoutParams;
    iput v12, v14, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v12, v14, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :try_start_c5
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v15, "setMarginStart"

    const/16 v16, 0x0

    new-array v8, v7, [Ljava/lang/Class;

    sget-object v17, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v17, v8, v16

    invoke-virtual {v0, v15, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-array v15, v7, [Ljava/lang/Object;

    aput-object v8, v15, v16

    invoke-virtual {v0, v14, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v8, "setMarginEnd"

    new-array v15, v7, [Ljava/lang/Class;

    sget-object v17, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v17, v15, v16

    invoke-virtual {v0, v8, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v8, v7, v16

    invoke-virtual {v0, v14, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_fd
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_fd} :catch_fe

    goto :goto_ff

    :catch_fe
    move-exception v0

    :goto_ff
    invoke-virtual {v1, v14}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .end local v14    # "margins":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_102
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .local v0, "backgroundPadding":Landroid/graphics/Rect;
    invoke-virtual {v2}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 20
    .local v7, "background":Landroid/graphics/drawable/Drawable;
    if-eqz v7, :cond_110

    invoke-virtual {v7, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 21
    :cond_110
    iget v8, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2}, Landroid/widget/EditText;->getPaddingTop()I

    move-result v14

    iget v15, v0, Landroid/graphics/Rect;->right:I

    move-object/from16 v16, v0

    .end local v0    # "backgroundPadding":Landroid/graphics/Rect;
    .local v16, "backgroundPadding":Landroid/graphics/Rect;
    invoke-virtual {v2}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v0

    invoke-virtual {v2, v8, v14, v15, v0}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 23
    .end local v2    # "field":Landroid/widget/EditText;
    .end local v3    # "themed":Landroid/widget/EditText;
    .end local v4    # "accent":I
    .end local v5    # "ink":I
    .end local v6    # "muted":I
    .end local v7    # "background":Landroid/graphics/drawable/Drawable;
    .end local v9    # "inset":I
    .end local v10    # "padded":Z
    .end local v11    # "parent":Landroid/view/View;
    .end local v12    # "margin":I
    .end local v13    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .end local v16    # "backgroundPadding":Landroid/graphics/Rect;
    :cond_121
    instance-of v0, v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_139

    move-object v0, v1

    check-cast v0, Landroid/view/ViewGroup;

    .local v0, "group":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_129
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_139

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Le/e/a/DialogInputs;->pad(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_129

    .line 24
    .end local v0    # "group":Landroid/view/ViewGroup;
    .end local v2    # "i":I
    :cond_139
    return-void
.end method
