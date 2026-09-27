.class final Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;
.super Ljava/lang/Object;
.source "CaptionSettingsStyle.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;
    .registers 19

    move-object/from16 v1, p4

    const/4 v2, 0x1

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 33
    :try_start_6
    const-string v6, "app.morphe.extension.shared.ui.CustomDialog"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "createButton"

    const/4 v8, 0x6

    new-array v9, v8, [Ljava/lang/Class;

    const-class v10, Landroid/content/Context;

    aput-object v10, v9, v4

    const-class v10, Landroid/app/Dialog;

    aput-object v10, v9, v2

    const-class v10, Ljava/lang/CharSequence;

    const/4 v11, 0x2

    aput-object v10, v9, v11

    const-class v10, Ljava/lang/Runnable;

    aput-object v10, v9, v3

    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v12, 0x4

    aput-object v10, v9, v12

    const/4 v13, 0x5

    aput-object v10, v9, v13

    .line 34
    invoke-virtual {v6, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 35
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    new-array v8, v8, [Ljava/lang/Object;

    aput-object p0, v8, v4

    aput-object v5, v8, v2

    aput-object p1, v8, v11

    aput-object v1, v8, v3

    aput-object v7, v8, v12

    aput-object v9, v8, v13

    invoke-virtual {v6, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;
    :try_end_4a
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_6 .. :try_end_4a} :catch_4b
    .catch Ljava/lang/ClassCastException; {:try_start_6 .. :try_end_4a} :catch_4b
    .catch Ljava/lang/LinkageError; {:try_start_6 .. :try_end_4a} :catch_4b

    goto :goto_4c

    :catch_4b
    move-object v6, v5

    :goto_4c
    if-nez v6, :cond_c0

    .line 38
    new-instance v6, Landroid/widget/Button;

    const v7, 0x101032b

    invoke-direct {v6, p0, v5, v7}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {v6, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 39
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v7

    invoke-static {v7}, Landroid/graphics/Color;->green(I)I

    move-result v7

    add-int/2addr v0, v7

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v7

    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    add-int/2addr v0, v7

    const/16 v7, 0x1a4

    if-le v0, v7, :cond_78

    goto :goto_79

    :cond_78
    move v2, v4

    .line 40
    :goto_79
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v0

    if-eqz p2, :cond_81

    move v4, v0

    goto :goto_87

    :cond_81
    const/16 v4, 0xe

    invoke-static {v0, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v4

    :goto_87
    if-eqz p2, :cond_90

    if-eqz v2, :cond_8e

    const/high16 v2, -0x1000000

    goto :goto_91

    :cond_8e
    const/4 v2, -0x1

    goto :goto_91

    :cond_90
    move v2, v0

    .line 41
    :goto_91
    invoke-virtual {v6, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 42
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v7, 0x41a00000    # 20.0f

    invoke-static {p0, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v2, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 43
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    const/16 v7, 0x1c

    invoke-static {v0, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-direct {v4, v0, v2, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v6, v4}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    :cond_c0
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->button(Landroid/widget/Button;)V

    invoke-virtual {v6, v3}, Landroid/widget/Button;->setMaxLines(I)V

    if-eqz p3, :cond_cf

    .line 47
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->danger(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v6, p0}, Landroid/widget/Button;->setTextColor(I)V

    :cond_cf
    return-object v6
.end method

.method static button(Landroid/widget/Button;)V
    .registers 5

    .line 30
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {p0, v2}, Landroid/widget/Button;->setTextSize(F)V

    const/high16 v2, 0x42400000    # 48.0f

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/high16 v2, 0x42800000    # 64.0f

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/widget/Button;->setMinWidth(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v3, v1, v0, v1}, Landroid/widget/Button;->setPadding(IIII)V

    return-void
.end method

.method static caption(Landroid/widget/TextView;)V
    .registers 4

    const/high16 v0, 0x41500000    # 13.0f

    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->secondary(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0, v1, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    return-void
.end method

.method static color(Landroid/content/Context;II)I
    .registers 3

    .line 18
    filled-new-array {p1}, [I

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x0

    .line 19
    :try_start_9
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1
    :try_end_d
    .catchall {:try_start_9 .. :try_end_d} :catchall_11

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return p1

    :catchall_11
    move-exception p1

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    throw p1
.end method

.method static dp(Landroid/content/Context;F)I
    .registers 2

    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static editor(Landroid/widget/EditText;)V
    .registers 6

    .line 60
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setTextSize(F)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->secondary(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setHintTextColor(I)V

    const/high16 v1, 0x42400000    # 48.0f

    .line 61
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/widget/EditText;->setMinHeight(I)V

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setMinimumHeight(I)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {p0, v2, v4, v1, v3}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 62
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const v2, 0x101009c

    .line 63
    filled-new-array {v2}, [I

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->surface(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v2, 0x0

    .line 64
    new-array v3, v2, [I

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->surface(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic lambda$action$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 44
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static menuSurface(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 57
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->surfaceColor(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method static primary(Landroid/content/Context;)I
    .registers 4

    .line 22
    :try_start_0
    const-string v0, "app.morphe.extension.shared.theme.ThemeUtils"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getAppForegroundColor"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_17
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_17} :catch_18
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_17} :catch_18

    return p0

    :catch_18
    const v0, 0x1010036

    const v1, -0xbbbbbc

    .line 23
    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static row(Landroid/view/View;)V
    .registers 6

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v2, v4, v1, v0}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method static secondary(Landroid/content/Context;)I
    .registers 3

    const v0, 0x1010038

    .line 25
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v1

    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static surface(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;
    .registers 5

    .line 67
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v1

    if-eqz p1, :cond_e

    const/16 v2, 0xc

    goto :goto_f

    :cond_e
    const/4 v2, 0x7

    .line 68
    :goto_f
    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v2, 0x3f800000    # 1.0f

    .line 69
    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    if-eqz p1, :cond_30

    const p1, 0x1010435

    invoke-static {p0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->color(Landroid/content/Context;II)I

    move-result p0

    goto :goto_36

    :cond_30
    const/16 p0, 0x1c

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result p0

    :goto_36
    invoke-virtual {v0, v2, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    return-object v0
.end method

.method static surfaceColor(Landroid/content/Context;)I
    .registers 4

    .line 51
    :try_start_0
    const-string v0, "app.morphe.extension.shared.theme.ThemeUtils"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getDialogBackgroundColor"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_17
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_17} :catch_18
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_17} :catch_18

    return p0

    :catch_18
    const v0, 0x1010031

    const/4 v1, -0x1

    .line 53
    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static tint(II)I
    .registers 3

    const v0, 0xffffff

    and-int/2addr p0, v0

    shl-int/lit8 p1, p1, 0x18

    or-int/2addr p0, p1

    return p0
.end method

.method static title(Landroid/widget/TextView;)V
    .registers 3

    const/high16 v0, 0x41800000    # 16.0f

    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setAlpha(F)V

    return-void
.end method
