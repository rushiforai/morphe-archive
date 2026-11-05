.class public final Le/e/a/UiControls194;
.super Ljava/lang/Object;
.source "UiControls194.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static alpha(II)I
    .registers 4
    .param p0, "color"    # I
    .param p1, "a"    # I

    .line 11
    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public static apply(Landroid/view/View;)V
    .registers 18
    .param p0, "v"    # Landroid/view/View;

    .line 13
    move-object/from16 v1, p0

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .local v2, "c":Landroid/content/Context;
    invoke-static {v2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v3

    .local v3, "dark":Z
    invoke-static {v2}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v4

    .local v4, "accent":I
    invoke-static {v3}, Le/e/a/DialogColors;->ink(Z)I

    move-result v5

    .local v5, "ink":I
    invoke-static {v3}, Le/e/a/DialogColors;->muted(Z)I

    move-result v6

    .local v6, "muted":I
    const/16 v7, 0x61

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v0

    invoke-static {v4, v4, v0}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v8

    .line 14
    .local v8, "active":Landroid/content/res/ColorStateList;
    instance-of v0, v1, Landroid/widget/TextView;

    if-eqz v0, :cond_56

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    .local v0, "t":Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v9}, Le/e/a/ThemeChoice;->purpleStates(Landroid/content/res/ColorStateList;)Z

    move-result v9

    if-eqz v9, :cond_3c

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v9

    invoke-static {v5, v5, v9}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_3c
    invoke-virtual {v0}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v9}, Le/e/a/ThemeChoice;->purpleStates(Landroid/content/res/ColorStateList;)Z

    move-result v9

    if-eqz v9, :cond_49

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setHintTextColor(I)V

    :cond_49
    invoke-virtual {v0}, Landroid/widget/TextView;->getLinkTextColors()Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v9}, Le/e/a/ThemeChoice;->purpleStates(Landroid/content/res/ColorStateList;)Z

    move-result v9

    if-eqz v9, :cond_56

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    .line 15
    .end local v0    # "t":Landroid/widget/TextView;
    :cond_56
    instance-of v0, v1, Landroid/widget/ImageView;

    if-eqz v0, :cond_72

    move-object v0, v1

    check-cast v0, Landroid/widget/ImageView;

    .local v0, "i":Landroid/widget/ImageView;
    invoke-virtual {v0}, Landroid/widget/ImageView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v9}, Le/e/a/ThemeChoice;->purpleStates(Landroid/content/res/ColorStateList;)Z

    move-result v9

    if-eqz v9, :cond_72

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v9

    invoke-static {v4, v5, v9}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 16
    .end local v0    # "i":Landroid/widget/ImageView;
    :cond_72
    instance-of v0, v1, Landroid/widget/EditText;

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v0, :cond_f8

    move-object v0, v1

    check-cast v0, Landroid/widget/EditText;

    .local v0, "e":Landroid/widget/EditText;
    const-string v11, "nicoid-managed-input"

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const/4 v12, 0x2

    const/4 v13, 0x3

    if-nez v11, :cond_b1

    new-instance v11, Landroid/content/res/ColorStateList;

    new-array v14, v10, [I

    new-array v15, v13, [[I

    const v16, -0x101009e

    filled-new-array/range {v16 .. v16}, [I

    move-result-object v16

    aput-object v16, v15, v10

    const v16, 0x101009c

    filled-new-array/range {v16 .. v16}, [I

    move-result-object v16

    aput-object v16, v15, v9

    aput-object v14, v15, v12

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v14

    filled-new-array {v14, v4, v6}, [I

    move-result-object v14

    invoke-direct {v11, v15, v14}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v1, v11}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_b1
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x1d

    if-lt v11, v14, :cond_f5

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextCursorDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    .local v11, "cursor":Landroid/graphics/drawable/Drawable;
    if-eqz v11, :cond_c7

    invoke-virtual {v11}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v11, v8}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v11}, Landroid/widget/EditText;->setTextCursorDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_c7
    new-array v14, v13, [Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextSelectHandle()Landroid/graphics/drawable/Drawable;

    move-result-object v15

    aput-object v15, v14, v10

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextSelectHandleLeft()Landroid/graphics/drawable/Drawable;

    move-result-object v15

    aput-object v15, v14, v9

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextSelectHandleRight()Landroid/graphics/drawable/Drawable;

    move-result-object v15

    aput-object v15, v14, v12

    const/4 v12, 0x0

    :goto_dc
    if-ge v12, v13, :cond_f2

    aget-object v15, v14, v12

    .local v15, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v15, :cond_ec

    const/16 v16, 0x0

    invoke-virtual {v15}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v10, v8}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_ee

    :cond_ec
    const/16 v16, 0x0

    .end local v15    # "d":Landroid/graphics/drawable/Drawable;
    :goto_ee
    add-int/lit8 v12, v12, 0x1

    const/4 v10, 0x0

    goto :goto_dc

    :cond_f2
    const/16 v16, 0x0

    goto :goto_fa

    .end local v11    # "cursor":Landroid/graphics/drawable/Drawable;
    :cond_f5
    const/16 v16, 0x0

    goto :goto_fa

    .end local v0    # "e":Landroid/widget/EditText;
    :cond_f8
    const/16 v16, 0x0

    .line 17
    :goto_fa
    instance-of v0, v1, Landroid/widget/CompoundButton;

    if-eqz v0, :cond_10c

    move-object v0, v1

    check-cast v0, Landroid/widget/CompoundButton;

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v10

    invoke-static {v4, v6, v10}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-virtual {v0, v10}, Landroid/widget/CompoundButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 18
    :cond_10c
    instance-of v0, v1, Landroid/widget/Switch;

    const/16 v10, 0x4d

    if-nez v0, :cond_122

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v11, "SwitchCompat"

    invoke-virtual {v0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16e

    :cond_122
    :try_start_122
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v11, "setThumbTintList"

    new-array v12, v9, [Ljava/lang/Class;

    const-class v13, Landroid/content/res/ColorStateList;

    aput-object v13, v12, v16

    invoke-virtual {v0, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v11

    invoke-static {v4, v6, v11}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v11

    new-array v12, v9, [Ljava/lang/Object;

    aput-object v11, v12, v16

    invoke-virtual {v0, v1, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v11, "setTrackTintList"

    new-array v12, v9, [Ljava/lang/Class;

    const-class v13, Landroid/content/res/ColorStateList;

    aput-object v13, v12, v16

    invoke-virtual {v0, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/16 v11, 0x66

    invoke-static {v4, v11}, Le/e/a/UiControls194;->alpha(II)I

    move-result v11

    invoke-static {v6, v10}, Le/e/a/UiControls194;->alpha(II)I

    move-result v12

    const/16 v13, 0x26

    invoke-static {v6, v13}, Le/e/a/UiControls194;->alpha(II)I

    move-result v13

    invoke-static {v11, v12, v13}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v11

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v11, v9, v16

    invoke-virtual {v0, v1, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_122 .. :try_end_16c} :catch_16d

    goto :goto_16e

    :catch_16d
    move-exception v0

    .line 19
    :cond_16e
    :goto_16e
    instance-of v0, v1, Landroid/widget/CheckedTextView;

    if-eqz v0, :cond_180

    move-object v0, v1

    check-cast v0, Landroid/widget/CheckedTextView;

    invoke-static {v6, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v9

    invoke-static {v4, v6, v9}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/widget/CheckedTextView;->setCheckMarkTintList(Landroid/content/res/ColorStateList;)V

    .line 20
    :cond_180
    instance-of v0, v1, Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1a2

    move-object v0, v1

    check-cast v0, Landroid/widget/ProgressBar;

    .local v0, "p":Landroid/widget/ProgressBar;
    invoke-virtual {v0, v8}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v8}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgressBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v9}, Le/e/a/ThemeChoice;->purpleStates(Landroid/content/res/ColorStateList;)Z

    move-result v9

    if-eqz v9, :cond_1a2

    invoke-static {v6, v10}, Le/e/a/UiControls194;->alpha(II)I

    move-result v9

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/widget/ProgressBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .end local v0    # "p":Landroid/widget/ProgressBar;
    :cond_1a2
    instance-of v0, v1, Landroid/widget/SeekBar;

    if-eqz v0, :cond_1ac

    move-object v0, v1

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, v8}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 21
    :cond_1ac
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    instance-of v9, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v9, :cond_1d1

    move-object v9, v0

    check-cast v9, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v9}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v9

    invoke-static {v9}, Le/e/a/DialogColors;->purple(I)Z

    move-result v9

    if-eqz v9, :cond_1d1

    move-object v9, v0

    check-cast v9, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v9}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v9

    if-eq v9, v4, :cond_1d1

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v1, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 22
    :cond_1d1
    invoke-virtual {v1}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v9}, Le/e/a/ThemeChoice;->purpleStates(Landroid/content/res/ColorStateList;)Z

    move-result v9

    if-eqz v9, :cond_1fa

    instance-of v9, v1, Landroid/widget/Button;

    if-eqz v9, :cond_1f7

    instance-of v9, v1, Landroid/widget/CompoundButton;

    if-nez v9, :cond_1f7

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v9

    invoke-static {v9, v3}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v9

    .local v9, "fill":I
    invoke-static {v9, v7}, Le/e/a/UiControls194;->alpha(II)I

    move-result v7

    invoke-static {v9, v9, v7}, Le/e/a/UiControls194;->states(III)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .end local v9    # "fill":I
    goto :goto_1fa

    :cond_1f7
    invoke-virtual {v1, v8}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 23
    :cond_1fa
    :goto_1fa
    return-void
.end method

.method private static states(III)Landroid/content/res/ColorStateList;
    .registers 8
    .param p0, "active"    # I
    .param p1, "normal"    # I
    .param p2, "disabled"    # I

    .line 12
    new-instance v0, Landroid/content/res/ColorStateList;

    const/4 v1, 0x0

    new-array v2, v1, [I

    const/4 v3, 0x5

    new-array v3, v3, [[I

    const v4, -0x101009e

    filled-new-array {v4}, [I

    move-result-object v4

    aput-object v4, v3, v1

    const v1, 0x10100a0

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v4, 0x1

    aput-object v1, v3, v4

    const v1, 0x10100a1

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v4, 0x2

    aput-object v1, v3, v4

    const v1, 0x10102fe

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v4, 0x3

    aput-object v1, v3, v4

    const/4 v1, 0x4

    aput-object v2, v3, v1

    filled-new-array {p2, p0, p0, p0, p1}, [I

    move-result-object v1

    invoke-direct {v0, v3, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v0
.end method
