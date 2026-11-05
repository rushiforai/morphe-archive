.class public final Le/e/a/CustomTheme119;
.super Ljava/lang/Object;
.source "CustomTheme119.java"


# static fields
.field static final ENABLE:Ljava/lang/String; = "custom_palette_enabled"

.field static final KEYS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    const-string v0, "custom_background"

    const-string v1, "custom_text"

    const-string v2, "custom_accent"

    const-string v3, "custom_bar"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activity(Landroid/app/Activity;)V
    .registers 6

    .line 14
    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {p0}, Le/e/a/CustomTheme119;->background(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Le/e/a/CustomTheme119;->color(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v2

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-lt v3, v4, :cond_47

    invoke-static {v1}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result v3

    if-eqz v3, :cond_45

    and-int/lit16 v2, v2, -0x2001

    goto :goto_47

    :cond_45
    or-int/lit16 v2, v2, 0x2000

    :cond_47
    :goto_47
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_58

    invoke-static {v0}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result v3

    if-eqz v3, :cond_56

    and-int/lit8 v2, v2, -0x11

    goto :goto_58

    :cond_56
    or-int/lit8 v2, v2, 0x10

    :cond_58
    :goto_58
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0, v1, v0}, Le/e/a/CustomTheme119;->tree(Landroid/view/View;II)V

    return-void
.end method

.method static background(Landroid/content/Context;)I
    .registers 3

    .line 12
    invoke-static {p0}, Le/e/a/ThemeChoice;->isAmoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    const/high16 v0, -0x1000000

    goto :goto_16

    :cond_9
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_13

    const v0, -0xe6e4e0

    goto :goto_16

    :cond_13
    const v0, -0x50506

    :goto_16
    const/4 v1, 0x2

    invoke-static {p0, v1, v0}, Le/e/a/CustomTheme119;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static color(Landroid/content/Context;II)I
    .registers 4

    .line 8
    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-static {p0}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    sget-object v0, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    aget-object p1, v0, p1

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    :cond_12
    return p2
.end method

.method static dark(I)Z
    .registers 1

    .line 11
    invoke-static {p0}, Le/e/a/DisplayRules119;->dark(I)Z

    move-result p0

    return p0
.end method

.method public static dialog(Landroid/app/AlertDialog;)V
    .registers 5

    .line 10
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_34

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/CustomTheme119;->background(Landroid/content/Context;)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v1, v3, v2}, Le/e/a/CustomTheme119;->color(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CustomTheme119;->background(Landroid/content/Context;)I

    move-result p0

    invoke-static {v0, v1, p0}, Le/e/a/CustomTheme119;->tree(Landroid/view/View;II)V

    :cond_34
    return-void
.end method

.method static edit(Landroid/app/Activity;)V
    .registers 21

    .line 18
    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v3, 0x14

    invoke-static {v1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v2, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v5, Landroid/widget/CheckBox;

    invoke-direct {v5, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v6, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc\u3092\u4f7f\u7528"

    invoke-static {v6}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static/range {p0 .. p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v6, "\u80cc\u666f\u8272"

    const-string v7, "\u6587\u5b57\u306e\u57fa\u672c\u8272"

    const-string v8, "\u30a2\u30af\u30bb\u30f3\u30c8\u8272"

    const-string v9, "\u4e0a\u90e8\u30d0\u30fc\u306e\u8272"

    filled-new-array {v8, v9, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    new-array v8, v7, [Landroid/widget/EditText;

    new-array v9, v7, [Landroid/view/View;

    invoke-static/range {p0 .. p0}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v10

    const-string v11, "app_theme"

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {p0 .. p0}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    const-string v13, "material_you_mode"

    const/4 v14, 0x0

    invoke-interface {v11, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-static {v10, v11}, Le/e/a/ThemeRules;->mode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    iget v11, v11, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v11, v11, 0x30

    const/16 v13, 0x20

    if-ne v11, v13, :cond_68

    const/4 v11, 0x1

    goto :goto_69

    :cond_68
    const/4 v11, 0x0

    :goto_69
    invoke-static {v10, v11}, Le/e/a/ThemeRules;->night(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_73

    const v11, -0xad335d

    goto :goto_76

    :cond_73
    const v11, -0xff94a5

    :goto_76
    if-eqz v10, :cond_7f

    const v16, -0xdfd4d0

    const v13, -0xdfd4d0

    goto :goto_82

    :cond_7f
    const v13, -0x111112

    :goto_82
    if-eqz v10, :cond_8b

    const v17, -0xe6e4e0

    const v15, -0xe6e4e0

    goto :goto_91

    :cond_8b
    const v17, -0x50506

    const v15, -0x50506

    :goto_91
    if-eqz v10, :cond_97

    const v10, -0x111112

    goto :goto_9a

    :cond_97
    const v10, -0xdfdedc

    :goto_9a
    filled-new-array {v11, v13, v15, v10}, [I

    move-result-object v10

    const-string v11, "\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-static {v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const/16 v13, 0x10

    invoke-static {v1, v11, v13}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v11

    const-string v15, "nicoid-custom-preview"

    invoke-virtual {v11, v15}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v11, v4, v4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 19
    const/4 v15, 0x0

    :goto_b3
    if-lt v15, v7, :cond_130

    .line 20
    const-string v3, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc\u306f\u6a19\u6e96\u30c6\u30fc\u30de\u3088\u308a\u512a\u5148\u3055\u308c\u307e\u3059\u3002\u80cc\u666f\u3068\u6587\u5b57\u306e\u7d44\u307f\u5408\u308f\u305b\u306b\u3088\u3063\u3066\u306f\u898b\u3048\u306b\u304f\u304f\u306a\u308b\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u4e00\u90e8\u306e\u52d5\u753b\u4e0a\u306e\u8868\u793a\u3084\u5916\u90e8\u30da\u30fc\u30b8\u306b\u306f\u53cd\u6620\u3055\u308c\u307e\u305b\u3093\u3002\u898b\u3048\u306b\u304f\u3044\u5834\u5408\u306f\u6a19\u6e96\u306b\u623b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xc

    invoke-static {v1, v3, v6}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v3, v14, v4, v14, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Le/e/a/CustomTheme119$1;

    invoke-direct {v3, v8, v1, v9, v11}, Le/e/a/CustomTheme119$1;-><init>([Landroid/widget/EditText;Landroid/content/Context;[Landroid/view/View;Landroid/widget/TextView;)V

    const/4 v4, 0x0

    :goto_d2
    if-lt v4, v7, :cond_128

    const-string v4, ""

    invoke-interface {v3, v4, v14, v14, v14}, Landroid/text/TextWatcher;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 21
    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v4, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-static {v1, v2}, Le/e/a/CustomTheme119;->scroll(Landroid/content/Context;Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    invoke-virtual {v1, v2, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u6a19\u6e96\u306b\u623b\u3059"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Le/e/a/CustomTheme119$$ExternalSyntheticLambda11;

    invoke-direct {v3, v8, v0, v5, v1}, Le/e/a/CustomTheme119$$ExternalSyntheticLambda11;-><init>([Landroid/widget/EditText;Landroid/app/Activity;Landroid/widget/CheckBox;Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, -0x3

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Le/e/a/CustomTheme119$$ExternalSyntheticLambda12;

    invoke-direct {v1, v5, v8, v10}, Le/e/a/CustomTheme119$$ExternalSyntheticLambda12;-><init>(Landroid/widget/CheckBox;[Landroid/widget/EditText;[I)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    return-void

    .line 20
    :cond_128
    aget-object v6, v8, v4

    invoke-virtual {v6, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_d2

    .line 19
    :cond_130
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v13}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v12, Ljava/lang/StringBuilder;

    aget-object v18, v6, v15

    invoke-static/range {v18 .. v18}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, " (#RRGGBB)"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0xe

    invoke-static {v1, v12, v13}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v12

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    move/from16 v19, v4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v13, v14, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    aput-object v3, v9, v15

    aget-object v3, v9, v15

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x14

    invoke-static {v1, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-static {v1, v12}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v4, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v4, "nicoid-managed-input"

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static/range {p0 .. p0}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v13

    sget-object v14, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    aget-object v14, v14, v15

    aget v12, v10, v15

    invoke-interface {v13, v14, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    const v13, 0xffffff

    and-int/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    new-array v13, v4, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v12, v13, v14

    const-string v12, "#%06X"

    invoke-static {v7, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    aput-object v3, v8, v15

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v7, "\u8272\u3092\u9078\u629e"

    invoke-static {v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    new-instance v12, Le/e/a/CustomTheme119$$ExternalSyntheticLambda10;

    invoke-direct {v12, v0, v3}, Le/e/a/CustomTheme119$$ExternalSyntheticLambda10;-><init>(Landroid/app/Activity;Landroid/widget/EditText;)V

    invoke-virtual {v7, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v15, v15, 0x1

    move/from16 v4, v19

    const/16 v3, 0x14

    const/4 v7, 0x4

    const/4 v12, 0x0

    const/16 v13, 0x10

    goto/16 :goto_b3
.end method

.method static enabled(Landroid/content/Context;)Z
    .registers 3

    .line 7
    invoke-static {p0}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "custom_palette_enabled"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static ink(Landroid/content/Context;)I
    .registers 3

    .line 9
    invoke-static {p0}, Le/e/a/CustomTheme119;->background(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result v0

    if-eqz v0, :cond_e

    const v0, -0x111112

    goto :goto_11

    :cond_e
    const v0, -0xdfdedc

    :goto_11
    const/4 v1, 0x3

    invoke-static {p0, v1, v0}, Le/e/a/CustomTheme119;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 17
    invoke-static {p0}, Le/e/a/CustomTheme119;->edit(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Landroid/widget/EditText;Landroid/view/View;)V
    .registers 3

    .line 19
    invoke-static {p0, p1}, Le/e/a/CustomTheme119;->picker(Landroid/app/Activity;Landroid/widget/EditText;)V

    return-void
.end method

.method static synthetic lambda$2([Landroid/widget/EditText;Landroid/app/Activity;Landroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 10

    .line 21
    const/4 p4, 0x4

    new-array v0, p4, [I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    if-lt v3, p4, :cond_35

    if-nez v1, :cond_b

    return-void

    :cond_b
    invoke-static {p1}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "custom_palette_enabled"

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    invoke-interface {p0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    :goto_1d
    if-lt v2, p4, :cond_29

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p1}, Landroid/app/Activity;->recreate()V

    return-void

    :cond_29
    sget-object p0, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    aget-object p0, p0, v2

    aget p2, v0, v2

    invoke-interface {v4, p0, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    :cond_35
    :try_start_35
    aget-object v4, p0, v3

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result v4

    aput v4, v0, v3
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_45} :catch_46

    goto :goto_53

    :catch_46
    move-exception v1

    aget-object v1, p0, v3

    const-string v4, "#RRGGBB\u5f62\u5f0f\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    :goto_53
    add-int/lit8 v3, v3, 0x1

    goto :goto_6
.end method

.method static synthetic lambda$3(Landroid/widget/CheckBox;[Landroid/widget/EditText;[ILandroid/view/View;)V
    .registers 8

    .line 21
    const/4 p3, 0x0

    invoke-virtual {p0, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    const/4 p0, 0x0

    :goto_5
    const/4 v0, 0x4

    if-lt p0, v0, :cond_9

    return-void

    :cond_9
    aget-object v0, p1, p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    aget v2, p2, p0

    const v3, 0xffffff

    and-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, p3

    const-string v2, "#%06X"

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_5
.end method

.method static synthetic lambda$4([Landroid/widget/SeekBar;[Landroid/widget/TextView;Landroid/widget/EditText;)V
    .registers 12

    .line 24
    const/4 v0, 0x0

    aget-object v1, p0, v0

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    const/4 v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    const/4 v4, 0x2

    aget-object v4, p0, v4

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    invoke-static {v1, v3, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    const/4 v3, 0x0

    :goto_1a
    const/4 v4, 0x3

    if-lt v3, v4, :cond_45

    invoke-virtual {p2, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    invoke-static {v1}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result p0

    if-eqz p0, :cond_28

    const/4 p0, -0x1

    goto :goto_2a

    :cond_28
    const/high16 p0, -0x1000000

    :goto_2a
    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setTextColor(I)V

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const p1, 0xffffff

    and-int/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v0

    const-string p1, "#%06X"

    invoke-static {p0, p1, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_45
    aget-object v4, p1, v3

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "G"

    const-string v7, "B"

    const-string v8, "R"

    filled-new-array {v8, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p0, v3

    invoke-virtual {v6}, Landroid/widget/SeekBar;->getProgress()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a
.end method

.method static synthetic lambda$5(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 8

    .line 24
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result p3

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "#%06X"

    const v2, 0xffffff

    and-int/2addr p3, v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_28
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_28} :catch_29

    goto :goto_33

    :catch_29
    move-exception p1

    const-string p1, "#RRGGBB\u5f62\u5f0f\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_33
    return-void
.end method

.method static parse(Ljava/lang/String;)I
    .registers 1

    .line 25
    invoke-static {p0}, Le/e/a/DisplayRules119;->parseColor(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static picker(Landroid/app/Activity;Landroid/widget/EditText;)V
    .registers 14

    .line 24
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    :try_start_4
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_11

    goto :goto_16

    :catch_11
    move-exception v0

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    :goto_16
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x14

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v4, "nicoid-custom-preview"

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v2, 0x3

    new-array v4, v2, [Landroid/widget/SeekBar;

    new-array v5, v2, [Landroid/widget/TextView;

    new-instance v6, Le/e/a/CustomTheme119$$ExternalSyntheticLambda13;

    invoke-direct {v6, v4, v5, v3}, Le/e/a/CustomTheme119$$ExternalSyntheticLambda13;-><init>([Landroid/widget/SeekBar;[Landroid/widget/TextView;Landroid/widget/EditText;)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_43
    if-lt v8, v2, :cond_98

    new-instance v0, Le/e/a/CustomTheme119$2;

    invoke-direct {v0, v3, v4, v5}, Le/e/a/CustomTheme119$2;-><init>(Landroid/widget/EditText;[Landroid/widget/SeekBar;[Landroid/widget/TextView;)V

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :goto_4d
    if-lt v7, v2, :cond_8b

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u8272\u3092\u9078\u629e"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {p0, v1}, Le/e/a/CustomTheme119;->scroll(Landroid/content/Context;Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const v0, 0x104000a

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 v0, 0x1040000

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Le/e/a/CustomTheme119$$ExternalSyntheticLambda14;

    invoke-direct {v1, v3, p1, p0}, Le/e/a/CustomTheme119$$ExternalSyntheticLambda14;-><init>(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_8b
    aget-object v0, v4, v7

    new-instance v5, Le/e/a/CustomTheme119$3;

    invoke-direct {v5, v6}, Le/e/a/CustomTheme119$3;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v5}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_4d

    :cond_98
    const-string v9, ""

    const/16 v10, 0xe

    invoke-static {p0, v9, v10}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    aput-object v9, v5, v8

    aget-object v9, v5, v8

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/SeekBar;

    invoke-direct {v9, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    aput-object v9, v4, v8

    aget-object v9, v4, v8

    const/16 v10, 0xff

    invoke-virtual {v9, v10}, Landroid/widget/SeekBar;->setMax(I)V

    aget-object v9, v4, v8

    mul-int/lit8 v11, v8, 0x8

    rsub-int/lit8 v11, v11, 0x10

    shr-int v11, v0, v11

    and-int/2addr v10, v11

    invoke-virtual {v9, v10}, Landroid/widget/SeekBar;->setProgress(I)V

    aget-object v9, v4, v8

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_43
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 6
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static scroll(Landroid/content/Context;Landroid/view/View;)Landroid/widget/ScrollView;
    .registers 3

    .line 23
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method static settings(Landroid/preference/PreferenceActivity;)V
    .registers 5

    .line 17
    const-string v0, "custom_palette"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    const-string v1, "app_theme"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    if-nez v1, :cond_16

    goto :goto_1a

    :cond_16
    invoke-static {v2, v1}, Le/e/a/SettingsTools;->parent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    :goto_1a
    if-nez v2, :cond_1d

    return-void

    :cond_1d
    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    if-nez v1, :cond_2a

    const/16 v0, -0x3e7

    goto :goto_30

    :cond_2a
    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_30
    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setOrder(I)V

    const-string v0, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_45

    const-string v0, "\u6709\u52b9"

    goto :goto_47

    :cond_45
    const-string v0, "OFF"

    :goto_47
    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    new-instance v0, Le/e/a/CustomTheme119$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Le/e/a/CustomTheme119$$ExternalSyntheticLambda9;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    return-void
.end method

.method static stamp(Landroid/content/Context;)Ljava/lang/String;
    .registers 6

    .line 13
    invoke-static {p0}, Le/e/a/CustomTheme119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "custom_palette_enabled"

    const/4 v3, 0x0

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    aget-object v2, v2, v3

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v2, v2, v4

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    const/4 v4, 0x2

    aget-object v2, v2, v4

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Le/e/a/CustomTheme119;->KEYS:[Ljava/lang/String;

    const/4 v2, 0x3

    aget-object v1, v1, v2

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static text(Landroid/view/View;I)V
    .registers 4

    .line 16
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_a

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_a
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_18

    move-object v0, p0

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_18
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_30

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_1f
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_26

    goto :goto_30

    :cond_26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Le/e/a/CustomTheme119;->text(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    :cond_30
    :goto_30
    return-void
.end method

.method static tree(Landroid/view/View;II)V
    .registers 9

    .line 15
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_15

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_14

    goto :goto_17

    :catch_14
    move-exception v0

    :cond_15
    const-string v0, ""

    :goto_17
    const-string v1, "action_bar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_126

    const-string v1, "toolbar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    goto/16 :goto_126

    :cond_29
    instance-of v0, p0, Landroid/view/SurfaceView;

    if-nez v0, :cond_125

    instance-of v0, p0, Landroid/view/TextureView;

    if-nez v0, :cond_125

    instance-of v0, p0, Landroid/webkit/WebView;

    if-nez v0, :cond_125

    instance-of v0, p0, Landroid/widget/ImageView;

    if-nez v0, :cond_125

    const-string v0, "nicoid-media-overlay"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_125

    const-string v0, "nicoid_short_metadata"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_125

    const-string v0, "nicoid_duration"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_125

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0800df

    if-eq v0, v1, :cond_125

    const-string v0, "nicoid-custom-preview"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_74

    goto/16 :goto_125

    :cond_74
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_c3

    instance-of v0, p0, Landroid/widget/Button;

    if-nez v0, :cond_c3

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v2, v3

    const/16 v3, 0x18

    if-ge v2, v3, :cond_c3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/CustomTheme119;->ink(Landroid/content/Context;)I

    move-result v2

    const v3, 0xffffff

    and-int/2addr v2, v3

    const/high16 v3, -0x1000000

    and-int/2addr v1, v3

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_c3
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v0, :cond_10d

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    const/16 v2, 0xf5

    if-le v1, v2, :cond_10d

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    sub-int/2addr v1, v0

    const/16 v0, 0x12

    if-ge v1, v0, :cond_10d

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_10d
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_125

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_114
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_11b

    goto :goto_125

    :cond_11b
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1, p2}, Le/e/a/CustomTheme119;->tree(Landroid/view/View;II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_114

    :cond_125
    :goto_125
    return-void

    :cond_126
    :goto_126
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {p1}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result p1

    if-eqz p1, :cond_133

    const p1, -0x111112

    goto :goto_136

    :cond_133
    const p1, -0xdfdedc

    :goto_136
    invoke-static {p0, p1}, Le/e/a/CustomTheme119;->text(Landroid/view/View;I)V

    return-void
.end method
