.class public final Le/e/a/UiDialogs;
.super Ljava/lang/Object;
.source "UiDialogs.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accent(Landroid/content/Context;)I
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .line 22
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method static synthetic access$000(Landroid/view/View;IZ)V
    .registers 3
    .param p0, "x0"    # Landroid/view/View;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .line 12
    invoke-static {p0, p1, p2}, Le/e/a/UiDialogs;->inputs(Landroid/view/View;IZ)V

    return-void
.end method

.method public static actionButton(Landroid/widget/Button;Z)V
    .registers 19
    .param p0, "b"    # Landroid/widget/Button;
    .param p1, "primary"    # Z

    .line 61
    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    .local v1, "c":Landroid/content/Context;
    const/16 v2, 0x10

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    .local v3, "pad":I
    const-string v4, "nicoid-dialog-action"

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v5, 0x41600000    # 14.0f

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setSingleLine(Z)V

    const/16 v6, 0x11

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    const/16 v6, 0x50

    invoke-static {v1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-static {v1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/16 v7, 0x30

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v0, v3, v4, v3, v4}, Landroid/widget/Button;->setPadding(IIII)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setElevation(F)V

    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 62
    const/4 v10, 0x2

    if-eqz p1, :cond_6e

    new-instance v11, Landroid/graphics/drawable/InsetDrawable;

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v12

    const/16 v13, 0x16

    invoke-static {v1, v12, v13}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v12

    invoke-static {v1, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    const/4 v15, 0x0

    invoke-static {v1, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v16

    const/4 v13, 0x0

    invoke-direct/range {v11 .. v16}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    goto :goto_73

    :cond_6e
    new-instance v11, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v11, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 63
    .local v11, "bg":Landroid/graphics/drawable/Drawable;
    :goto_73
    new-instance v12, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v13

    const v14, 0xffffff

    and-int/2addr v13, v14

    const/high16 v14, 0x33000000

    or-int/2addr v13, v14

    invoke-static {v13}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    invoke-direct {v12, v13, v11, v9}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v12}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    new-instance v9, Landroid/content/res/ColorStateList;

    new-array v12, v4, [I

    new-array v10, v10, [[I

    const v13, -0x101009e

    filled-new-array {v13}, [I

    move-result-object v13

    aput-object v13, v10, v4

    aput-object v12, v10, v5

    invoke-static {v1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    if-eqz p1, :cond_a5

    invoke-static {v4}, Le/e/a/DialogColors;->onAccent(I)I

    move-result v4

    :cond_a5
    const v5, -0x8a8781

    filled-new-array {v5, v4}, [I

    move-result-object v4

    invoke-direct {v9, v10, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 65
    invoke-virtual {v0}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .local v4, "lp":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v4, :cond_f5

    invoke-static {v1, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eqz p1, :cond_dd

    invoke-static {v1, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v0}, Landroid/widget/Button;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v6

    float-to-int v6, v6

    mul-int/lit8 v7, v3, 0x2

    add-int/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_de

    :cond_dd
    const/4 v5, -0x2

    :goto_de
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    instance-of v5, v4, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v5, :cond_f2

    move-object v5, v4

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .local v5, "l":Landroid/widget/LinearLayout$LayoutParams;
    iput v8, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/4 v2, 0x4

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .end local v5    # "l":Landroid/widget/LinearLayout$LayoutParams;
    :cond_f2
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    :cond_f5
    invoke-virtual {v0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_109

    invoke-virtual {v0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    const v5, 0x800015

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 67
    :cond_109
    return-void
.end method

.method private static blackPanels(Landroid/view/View;)V
    .registers 4
    .param p0, "view"    # Landroid/view/View;

    .line 68
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1d

    const/high16 v0, -0x1000000

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .local v0, "group":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_d
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1d

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->blackPanels(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .end local v0    # "group":Landroid/view/ViewGroup;
    .end local v1    # "n":I
    :cond_1d
    return-void
.end method

.method public static builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;
    .registers 3
    .param p0, "c"    # Landroid/content/Context;

    .line 13
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {p0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private static inputs(Landroid/view/View;IZ)V
    .registers 10
    .param p0, "v"    # Landroid/view/View;
    .param p1, "accent"    # I
    .param p2, "dark"    # Z

    .line 70
    instance-of v0, p0, Landroid/widget/AbsListView;

    if-eqz v0, :cond_26

    .line 71
    move-object v0, p0

    check-cast v0, Landroid/widget/AbsListView;

    .local v0, "list":Landroid/widget/AbsListView;
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setBackgroundColor(I)V

    .line 72
    new-instance v1, Le/e/a/UiDialogs$1;

    invoke-direct {v1, p1, p2}, Le/e/a/UiDialogs$1;-><init>(IZ)V

    .line 73
    .local v1, "listener":Landroid/widget/AbsListView$OnScrollListener;
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    new-instance v2, Le/e/a/UiDialogs$0;

    invoke-direct {v2, v1, v0}, Le/e/a/UiDialogs$0;-><init>(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/AbsListView;)V

    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->post(Ljava/lang/Runnable;)Z

    .line 75
    .end local v0    # "list":Landroid/widget/AbsListView;
    .end local v1    # "listener":Landroid/widget/AbsListView$OnScrollListener;
    :cond_26
    instance-of v0, p0, Landroid/widget/TextView;

    const v1, -0x111112

    const v2, -0xdfdedc

    if-eqz v0, :cond_61

    const-string v0, "nicoid_duration"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_61

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    instance-of v3, p0, Landroid/widget/Button;

    if-eqz v3, :cond_55

    instance-of v3, p0, Landroid/widget/CompoundButton;

    if-nez v3, :cond_55

    const-string v3, "nicoid-range-control"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_55

    move v3, p1

    goto :goto_5e

    :cond_55
    if-eqz p2, :cond_5b

    const v3, -0x111112

    goto :goto_5e

    :cond_5b
    const v3, -0xdfdedc

    :goto_5e
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    :cond_61
    const-string v0, ""

    .local v0, "name":Ljava/lang/String;
    :try_start_63
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_79

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v3, v4}, Le/e/a/ResourceNames110;->entry(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v3
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_76} :catch_78

    move-object v0, v3

    .end local v0    # "name":Ljava/lang/String;
    .local v3, "name":Ljava/lang/String;
    goto :goto_79

    .end local v3    # "name":Ljava/lang/String;
    .restart local v0    # "name":Ljava/lang/String;
    :catch_78
    move-exception v3

    .line 78
    :cond_79
    :goto_79
    const-string v3, "mainlay"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_a7

    instance-of v3, p0, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_a7

    .line 79
    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    .line 80
    .local v3, "form":Landroid/widget/LinearLayout;
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_a7

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/Spinner;

    if-eqz v5, :cond_a7

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/EditText;

    if-eqz v5, :cond_a7

    .line 81
    invoke-static {v3}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    invoke-static {v3}, Le/e/a/DialogInputs;->pad(Landroid/view/View;)V

    .line 84
    .end local v3    # "form":Landroid/widget/LinearLayout;
    :cond_a7
    const-string v3, "parentPanel"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_cf

    const-string v3, "topPanel"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_cf

    const-string v3, "contentPanel"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_cf

    const-string v3, "buttonPanel"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_cf

    const-string v3, "customPanel"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d2

    :cond_cf
    invoke-virtual {p0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 85
    :cond_d2
    instance-of v3, p0, Landroid/widget/Spinner;

    if-eqz v3, :cond_dc

    move-object v3, p0

    check-cast v3, Landroid/widget/Spinner;

    invoke-static {v3}, Le/e/a/ThemeChoice;->spinner(Landroid/widget/Spinner;)V

    .line 86
    :cond_dc
    invoke-static {p0}, Le/e/a/ThemeChoice;->controlsOne(Landroid/view/View;)V

    .line 87
    instance-of v3, p0, Landroid/widget/EditText;

    if-eqz v3, :cond_120

    .line 88
    move-object v3, p0

    check-cast v3, Landroid/widget/EditText;

    .local v3, "e":Landroid/widget/EditText;
    if-eqz p2, :cond_e9

    goto :goto_ec

    :cond_e9
    const v1, -0xdfdedc

    :goto_ec
    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setTextColor(I)V

    if-eqz p2, :cond_f5

    const v1, -0x48453d

    goto :goto_f8

    :cond_f5
    const v1, -0x99958d

    :goto_f8
    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setHintTextColor(I)V

    const-string v1, "nicoid-managed-input"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10a

    invoke-static {v3}, Le/e/a/UiControls194;->apply(Landroid/view/View;)V

    .line 89
    :cond_10a
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_120

    .line 90
    invoke-virtual {v3}, Landroid/widget/EditText;->getTextCursorDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .local v1, "cursor":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_120

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setTextCursorDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 93
    .end local v1    # "cursor":Landroid/graphics/drawable/Drawable;
    .end local v3    # "e":Landroid/widget/EditText;
    :cond_120
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_138

    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    .local v1, "g":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_128
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_138

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1, p2}, Le/e/a/UiDialogs;->inputs(Landroid/view/View;IZ)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_128

    .line 94
    .end local v1    # "g":Landroid/view/ViewGroup;
    .end local v2    # "n":I
    :cond_138
    return-void
.end method

.method public static insetContent(Landroid/view/View;)V
    .registers 7
    .param p0, "content"    # Landroid/view/View;

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x14

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    .local v0, "horizontal":I
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0xc

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 34
    .local v1, "vertical":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {p0, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 35
    return-void
.end method

.method static synthetic lambda$inputs$0(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/AbsListView;)V
    .registers 5
    .param p0, "listener"    # Landroid/widget/AbsListView$OnScrollListener;
    .param p1, "list"    # Landroid/widget/AbsListView;

    .line 73
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/AbsListView;->getCount()I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {p0, p1, v2, v0, v1}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    return-void
.end method

.method static owner(Landroid/content/Context;)Landroid/content/Context;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .line 15
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_1
    const/16 v1, 0xc

    if-ge v0, v1, :cond_1d

    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_1d

    instance-of v1, p0, Landroid/app/Activity;

    if-nez v1, :cond_1d

    .line 16
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    .line 17
    .local v1, "base":Landroid/content/Context;
    if-eqz v1, :cond_1d

    if-ne v1, p0, :cond_19

    goto :goto_1d

    .line 18
    :cond_19
    move-object p0, v1

    .line 15
    .end local v1    # "base":Landroid/content/Context;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 20
    .end local v0    # "n":I
    :cond_1d
    :goto_1d
    return-object p0
.end method

.method public static secondaryButton(Landroid/widget/Button;)V
    .registers 15
    .param p0, "button"    # Landroid/widget/Button;

    .line 37
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "c":Landroid/content/Context;
    invoke-static {v0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    .line 38
    .local v1, "dark":Z
    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2, v1}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v2

    .line 39
    .local v2, "color":I
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    move-object v5, v3

    .local v5, "background":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v5, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v3, v3, v4

    invoke-virtual {v5, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 40
    const-string v3, "nicoid-range-control"

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 41
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    new-instance v10, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    const v6, 0xffffff

    and-int/2addr v4, v6

    const/high16 v6, 0x33000000

    or-int/2addr v4, v6

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v11

    new-instance v4, Landroid/graphics/drawable/InsetDrawable;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x40400000    # 3.0f

    mul-float v6, v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    const/high16 v9, 0x40800000    # 4.0f

    mul-float v8, v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v12, v12, Landroid/util/DisplayMetrics;->density:F

    mul-float v12, v12, v7

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v12, v12, Landroid/util/DisplayMetrics;->density:F

    mul-float v12, v12, v9

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    move v13, v8

    move v8, v7

    move v7, v13

    invoke-direct/range {v4 .. v9}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-direct {v10, v11, v4, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v10}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setElevation(F)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setAllCaps(Z)V

    if-eqz v1, :cond_a8

    const v4, -0x111112

    goto :goto_ab

    :cond_a8
    const v4, -0xdfdedc

    :goto_ab
    invoke-virtual {p0, v4}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {p0, v4}, Landroid/widget/Button;->setTextSize(F)V

    .line 43
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const/high16 v6, 0x41400000    # 12.0f

    mul-float v4, v4, v6

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .local v4, "pad":I
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41000000    # 8.0f

    mul-float v6, v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 44
    .local v6, "vertical":I
    invoke-virtual {p0, v4, v6, v4, v6}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    const/high16 v8, 0x42400000    # 48.0f

    mul-float v7, v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    mul-float v7, v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/Button;->setMinimumHeight(I)V

    const/16 v7, 0x11

    invoke-virtual {p0, v7}, Landroid/widget/Button;->setGravity(I)V

    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    invoke-virtual {p0, v3}, Landroid/widget/Button;->setSingleLine(Z)V

    .line 45
    return-void
.end method

.method public static show(Landroid/app/AlertDialog;)V
    .registers 1
    .param p0, "dialog"    # Landroid/app/AlertDialog;

    .line 95
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->style(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static showBuilder(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;
    .registers 2
    .param p0, "builder"    # Landroid/app/AlertDialog$Builder;

    .line 96
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .local v0, "d":Landroid/app/AlertDialog;
    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-object v0
.end method

.method public static style(Landroid/app/AlertDialog;)V
    .registers 13
    .param p0, "dialog"    # Landroid/app/AlertDialog;

    .line 47
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_a

    invoke-static {p0}, Le/e/a/CustomTheme119;->dialog(Landroid/app/AlertDialog;)V

    return-void

    .line 48
    :cond_a
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    .local v0, "c":Landroid/content/Context;
    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    .line 49
    .local v1, "accent":I
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .local v2, "background":Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float v3, v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 50
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    const/4 v3, -0x1

    const/4 v4, -0x2

    const/4 v5, -0x3

    filled-new-array {v3, v4, v5}, [I

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_43
    const/4 v9, 0x3

    if-ge v8, v9, :cond_58

    aget v9, v6, v8

    .local v9, "which":I
    invoke-virtual {p0, v9}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v10

    if-eqz v10, :cond_55

    invoke-virtual {p0, v9}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v10

    invoke-virtual {v10, v1}, Landroid/widget/Button;->setTextColor(I)V

    .end local v9    # "which":I
    :cond_55
    add-int/lit8 v8, v8, 0x1

    goto :goto_43

    .line 52
    :cond_58
    invoke-static {v0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v6

    .line 53
    .local v6, "dark":Z
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    invoke-static {v8}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    .line 54
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    invoke-static {v8, v1, v6}, Le/e/a/UiDialogs;->inputs(Landroid/view/View;IZ)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    invoke-static {v8}, Le/e/a/ListDividers191;->tree(Landroid/view/View;)V

    .line 55
    filled-new-array {v3, v4, v5}, [I

    move-result-object v4

    const/4 v5, 0x0

    :goto_86
    if-ge v5, v9, :cond_9f

    aget v8, v4, v5

    .local v8, "which":I
    invoke-virtual {p0, v8}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v10

    if-eqz v10, :cond_9c

    invoke-virtual {p0, v8}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v10

    if-ne v8, v3, :cond_98

    const/4 v11, 0x1

    goto :goto_99

    :cond_98
    const/4 v11, 0x0

    :goto_99
    invoke-static {v10, v11}, Le/e/a/UiDialogs;->actionButton(Landroid/widget/Button;Z)V

    .end local v8    # "which":I
    :cond_9c
    add-int/lit8 v5, v5, 0x1

    goto :goto_86

    :cond_9f
    invoke-static {p0}, Le/e/a/DialogActions194;->watch(Landroid/app/AlertDialog;)V

    invoke-static {p0}, Le/e/a/FlatUi191;->window(Landroid/app/Dialog;)V

    .line 58
    invoke-static {p0}, Le/e/a/CustomTheme119;->dialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static surface(Landroid/content/Context;)I
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    invoke-static {p0}, Le/e/a/CustomSurface119;->color(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_7

    return v0

    .line 24
    :cond_7
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    .local v0, "c":Landroid/content/Context;
    invoke-static {v0}, Le/e/a/ThemeChoice;->isAmoled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_14

    const/high16 v1, -0x1000000

    return v1

    :cond_14
    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    .local v1, "dark":Z
    const v2, -0xe6e4e0

    if-eqz v1, :cond_1e

    return v2

    .line 25
    :cond_1e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v3, v4, :cond_53

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "material_you_mode"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_53

    .line 26
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v1, :cond_3a

    const-string v4, "system_neutral1_900"

    goto :goto_3c

    :cond_3a
    const-string v4, "system_neutral1_50"

    :goto_3c
    const-string v5, "color"

    const-string v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 27
    .local v3, "id":I
    if-eqz v3, :cond_53

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v2

    return v2

    .line 29
    .end local v3    # "id":I
    :cond_53
    if-eqz v1, :cond_56

    goto :goto_59

    :cond_56
    const v2, -0x50506

    :goto_59
    return v2
.end method
