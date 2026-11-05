.class public final Le/e/a/FullscreenControls;
.super Ljava/lang/Object;
.source "FullscreenControls.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FullscreenControls$State;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static row(Landroid/view/View;I)V
    .registers 9

    .line 6
    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-nez v0, :cond_5

    return-void

    :cond_5
    move-object v0, p0

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v2, 0x15

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v2, 0x0

    :goto_12
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-lt v2, v3, :cond_22

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :cond_22
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-static {p1}, Le/e/a/OverlayRules;->slot(I)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    instance-of v5, v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, 0x0

    if-eqz v5, :cond_3f

    move-object v5, v4

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v5, v1, v1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    :cond_3f
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setMinimumHeight(I)V

    instance-of v4, v3, Landroid/widget/TextView;

    if-eqz v4, :cond_6b

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    invoke-virtual {v3, v6, v6, v6, v1}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    int-to-float v4, p1

    const v5, 0x3eae147b    # 0.34f

    mul-float v4, v4, v5

    invoke-virtual {v3, v1, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_6b
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method private static thin(Landroid/view/View;ILe/e/a/FullscreenControls$State;)V
    .registers 8

    .line 5
    iget-object v0, p2, Le/e/a/FullscreenControls$State;->heights:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3e

    iget-object v0, p2, Le/e/a/FullscreenControls$State;->heights:Ljava/util/Map;

    const/4 v2, 0x5

    new-array v2, v2, [I

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    aput v3, v2, v1

    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result v3

    const/4 v4, 0x1

    aput v3, v2, v4

    instance-of v3, p0, Landroid/widget/TextView;

    if-eqz v3, :cond_29

    move-object v3, p0

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMinHeight()I

    move-result v3

    goto :goto_2a

    :cond_29
    const/4 v3, 0x0

    :goto_2a
    const/4 v4, 0x2

    aput v3, v2, v4

    const/4 v3, 0x3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    aput v4, v2, v3

    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_56

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    :cond_56
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_73

    check-cast p0, Landroid/view/ViewGroup;

    :goto_62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v1, v0, :cond_69

    goto :goto_73

    :cond_69
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1, p2}, Le/e/a/FullscreenControls;->thin(Landroid/view/View;ILe/e/a/FullscreenControls$State;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    :cond_73
    :goto_73
    return-void
.end method

.method public static update(Ljava/lang/Object;)V
    .registers 19

    invoke-static/range {p0 .. p0}, Le/e/a/CastControls218;->update(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->before(Ljava/lang/Object;)V

    move-object/from16 v0, p0

    const-string v1, "id"

    :try_start_a
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "x1"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-nez v2, :cond_1d

    return-void

    :cond_1d
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2}, Le/e/a/PlayerTheme;->apply(Landroid/view/View;)V

    invoke-static {v3}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v5

    instance-of v6, v5, Landroid/app/Activity;

    if-eqz v6, :cond_35

    check-cast v5, Landroid/app/Activity;

    invoke-static {v5}, Le/e/a/ModernShorts;->restoreLayout(Landroid/app/Activity;)V

    .line 9
    :cond_35
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const-string v6, "titlebar"

    invoke-virtual {v5, v6, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "topmenulay"

    invoke-virtual {v6, v7, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const/4 v7, 0x0

    if-nez v6, :cond_58

    move-object v6, v7

    goto :goto_5c

    :cond_58
    invoke-static {v6}, Le/e/a/PlayerButtons192;->host(Landroid/view/View;)Landroid/view/View;

    move-result-object v6

    :goto_5c
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const-string v9, "titlebartext"

    invoke-virtual {v8, v9, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const-string v10, "videoLayout"

    invoke-virtual {v9, v10, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    if-eqz v5, :cond_281

    if-eqz v6, :cond_281

    if-nez v8, :cond_81

    goto/16 :goto_281

    :cond_81
    invoke-static {v2}, Le/e/a/PlayerIcons;->attach(Landroid/view/View;)V

    .line 10
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "r0"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v9

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "B0"

    invoke-virtual {v10, v11}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v10

    invoke-static {v2, v9}, Le/e/a/PlayerIcons;->tablet(Landroid/view/View;Z)V

    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-eqz v9, :cond_aa

    if-eqz v10, :cond_b6

    :cond_aa
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v14

    iget v14, v14, Landroid/content/res/Configuration;->orientation:I

    if-eq v14, v11, :cond_ba

    :cond_b6
    if-nez v10, :cond_ba

    const/4 v10, 0x0

    goto :goto_bb

    :cond_ba
    const/4 v10, 0x1

    .line 11
    :goto_bb
    if-eqz v10, :cond_bf

    const/4 v14, 0x0

    goto :goto_c1

    :cond_bf
    const/high16 v14, 0x77000000

    :goto_c1
    invoke-virtual {v6, v14}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v14

    instance-of v14, v14, Le/e/a/FullscreenControls$State;

    if-eqz v14, :cond_d3

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Le/e/a/FullscreenControls$State;

    goto :goto_d4

    :cond_d3
    move-object v14, v7

    .line 13
    :goto_d4
    const/4 v15, 0x4

    const/16 v16, 0x3

    if-eqz v10, :cond_1af

    if-nez v14, :cond_12d

    new-instance v14, Le/e/a/FullscreenControls$State;

    invoke-direct {v14, v7}, Le/e/a/FullscreenControls$State;-><init>(Le/e/a/FullscreenControls$State;)V

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    iput-object v7, v14, Le/e/a/FullscreenControls$State;->original:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iput-object v7, v14, Le/e/a/FullscreenControls$State;->controlsLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v8}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iput-object v7, v14, Le/e/a/FullscreenControls$State;->textLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v8}, Landroid/widget/TextView;->getTextSize()F

    move-result v7

    iput v7, v14, Le/e/a/FullscreenControls$State;->textSize:F

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v7

    iput v7, v14, Le/e/a/FullscreenControls$State;->orientation:I

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getGravity()I

    move-result v7

    iput v7, v14, Le/e/a/FullscreenControls$State;->gravity:I

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v7, v14, Le/e/a/FullscreenControls$State;->barHeight:I

    new-array v7, v15, [I

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v15

    aput v15, v7, v13

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v15

    aput v15, v7, v12

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v15

    aput v15, v7, v11

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v11

    aput v11, v7, v16

    iput-object v7, v14, Le/e/a/FullscreenControls$State;->padding:[I

    invoke-virtual {v5, v14}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 14
    :cond_12d
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    if-eq v7, v5, :cond_145

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x2

    invoke-direct {v7, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    :cond_145
    invoke-virtual {v5, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v7, 0x10

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v11, 0x30

    invoke-static {v3, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    iget v15, v15, Landroid/util/DisplayMetrics;->density:F

    const/high16 v16, 0x41000000    # 8.0f

    mul-float v15, v15, v16

    float-to-int v15, v15

    invoke-virtual {v5, v15, v13, v13, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v15, 0x0

    invoke-virtual {v5, v15}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    instance-of v15, v15, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v15, :cond_17e

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v12, 0xa

    invoke-virtual {v15, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iput v13, v15, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    :cond_17e
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    iput v11, v12, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v6, v11, v14}, Le/e/a/FullscreenControls;->thin(Landroid/view/View;ILe/e/a/FullscreenControls$State;)V

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    iget v5, v14, Le/e/a/FullscreenControls$State;->textSize:F

    const v6, 0x3f4ccccd    # 0.8f

    mul-float v5, v5, v6

    invoke-virtual {v8, v13, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v8, v13}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/4 v5, 0x1

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v13, v11, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_245

    .line 16
    :cond_1af
    if-eqz v14, :cond_245

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v12, v14, Le/e/a/FullscreenControls$State;->original:Landroid/view/ViewGroup;

    iget-object v15, v14, Le/e/a/FullscreenControls$State;->controlsLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v12, v6, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, v14, Le/e/a/FullscreenControls$State;->textLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v6, v14, Le/e/a/FullscreenControls$State;->textSize:F

    invoke-virtual {v8, v13, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    iget v6, v14, Le/e/a/FullscreenControls$State;->orientation:I

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget v6, v14, Le/e/a/FullscreenControls$State;->gravity:I

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iget v8, v14, Le/e/a/FullscreenControls$State;->barHeight:I

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v6, v14, Le/e/a/FullscreenControls$State;->padding:[I

    aget v6, v6, v13

    iget-object v8, v14, Le/e/a/FullscreenControls$State;->padding:[I

    const/4 v12, 0x1

    aget v8, v8, v12

    iget-object v12, v14, Le/e/a/FullscreenControls$State;->padding:[I

    aget v12, v12, v11

    iget-object v15, v14, Le/e/a/FullscreenControls$State;->padding:[I

    aget v15, v15, v16

    invoke-virtual {v5, v6, v8, v12, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v6, v14, Le/e/a/FullscreenControls$State;->heights:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1f5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_202

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    goto :goto_245

    :cond_202
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/View;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [I

    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    aget v15, v8, v13

    iput v15, v14, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v14, 0x1

    aget v15, v8, v14

    invoke-virtual {v12, v15}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {v12}, Landroid/view/View;->getPaddingLeft()I

    move-result v15

    aget v7, v8, v16

    invoke-virtual {v12}, Landroid/view/View;->getPaddingRight()I

    move-result v13

    const/16 v17, 0x4

    aget v14, v8, v17

    invoke-virtual {v12, v15, v7, v13, v14}, Landroid/view/View;->setPadding(IIII)V

    instance-of v7, v12, Landroid/widget/TextView;

    if-eqz v7, :cond_23f

    move-object v7, v12

    check-cast v7, Landroid/widget/TextView;

    aget v8, v8, v11

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setMinHeight(I)V

    :cond_23f
    invoke-virtual {v12}, Landroid/view/View;->requestLayout()V

    const/4 v7, 0x0

    const/4 v13, 0x0

    goto :goto_1f5

    :cond_245
    :goto_245
    nop

    .line 17
    if-eqz v9, :cond_24b

    const/16 v5, 0x2c

    goto :goto_252

    :cond_24b
    if-eqz v10, :cond_250

    const/16 v5, 0x24

    goto :goto_252

    :cond_250
    const/16 v5, 0x20

    :goto_252
    int-to-float v5, v5

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    mul-float v5, v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-static {v0, v2}, Le/e/a/PlayerButtons192;->apply(Ljava/lang/Object;Landroid/view/View;)V

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v3, "bottommenulay"

    invoke-virtual {v0, v3, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v5}, Le/e/a/FullscreenControls;->row(Landroid/view/View;I)V

    invoke-static {v2}, Le/e/a/PlayerControlsDock;->attach(Landroid/view/View;)V

    invoke-static/range {p0 .. p0}, Le/e/a/Revision201;->normal(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->update(Ljava/lang/Object;)V
    :try_end_280
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_280} :catch_282

    .line 18
    goto :goto_28a

    .line 9
    :cond_281
    :goto_281
    return-void

    .line 18
    :catch_282
    move-exception v0

    const-string v1, "nicoid-controls"

    const-string v2, "Fullscreen layout failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_28a
    return-void
.end method
