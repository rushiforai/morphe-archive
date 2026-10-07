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

    if-ge v2, v3, :cond_64

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

    if-eqz v5, :cond_35

    move-object v5, v4

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v5, v1, v1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    :cond_35
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setMinimumHeight(I)V

    instance-of v4, v3, Landroid/widget/TextView;

    if-eqz v4, :cond_61

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

    :cond_61
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_64
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
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

    if-eqz v0, :cond_72

    check-cast p0, Landroid/view/ViewGroup;

    :goto_62
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_72

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1, p2}, Le/e/a/FullscreenControls;->thin(Landroid/view/View;ILe/e/a/FullscreenControls$State;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    :cond_72
    return-void
.end method

.method public static update(Ljava/lang/Object;)V
    .registers 19

    .line 8
    move-object/from16 v0, p0

    const-string v1, "id"

    :try_start_4
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "x1"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-nez v2, :cond_17

    return-void

    :cond_17
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 9
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

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "titlebartext"

    invoke-virtual {v7, v8, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const-string v9, "videoLayout"

    invoke-virtual {v8, v9, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    if-eqz v5, :cond_26a

    if-eqz v6, :cond_26a

    if-nez v7, :cond_62

    goto/16 :goto_26a

    :cond_62
    invoke-static {v2}, Le/e/a/PlayerIcons;->attach(Landroid/view/View;)V

    .line 10
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "r0"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v8

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "B0"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v2, v8}, Le/e/a/PlayerIcons;->tablet(Landroid/view/View;Z)V

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v8, :cond_8b

    if-eqz v0, :cond_97

    :cond_8b
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v12

    iget v12, v12, Landroid/content/res/Configuration;->orientation:I

    if-eq v12, v9, :cond_99

    :cond_97
    if-eqz v0, :cond_9a

    :cond_99
    goto :goto_9c

    :cond_9a
    const/4 v0, 0x0

    goto :goto_9d

    :goto_9c
    const/4 v0, 0x1

    .line 11
    :goto_9d
    if-eqz v0, :cond_a1

    const/4 v12, 0x0

    goto :goto_a3

    :cond_a1
    const/high16 v12, 0x77000000

    :goto_a3
    invoke-virtual {v6, v12}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v12

    instance-of v12, v12, Le/e/a/FullscreenControls$State;

    const/4 v13, 0x0

    if-eqz v12, :cond_b6

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Le/e/a/FullscreenControls$State;

    goto :goto_b7

    :cond_b6
    move-object v12, v13

    .line 13
    :goto_b7
    const/4 v14, 0x4

    const/16 v16, 0x2c

    const/16 v17, 0x3

    if-eqz v0, :cond_1a2

    if-nez v12, :cond_112

    new-instance v12, Le/e/a/FullscreenControls$State;

    invoke-direct {v12, v13}, Le/e/a/FullscreenControls$State;-><init>(Le/e/a/FullscreenControls$1;)V

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    check-cast v13, Landroid/view/ViewGroup;

    iput-object v13, v12, Le/e/a/FullscreenControls$State;->original:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iput-object v13, v12, Le/e/a/FullscreenControls$State;->controlsLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v7}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iput-object v13, v12, Le/e/a/FullscreenControls$State;->textLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v7}, Landroid/widget/TextView;->getTextSize()F

    move-result v13

    iput v13, v12, Le/e/a/FullscreenControls$State;->textSize:F

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v13

    iput v13, v12, Le/e/a/FullscreenControls$State;->orientation:I

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getGravity()I

    move-result v13

    iput v13, v12, Le/e/a/FullscreenControls$State;->gravity:I

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iget v13, v13, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v13, v12, Le/e/a/FullscreenControls$State;->barHeight:I

    new-array v13, v14, [I

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v14

    aput v14, v13, v11

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v14

    aput v14, v13, v10

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v14

    aput v14, v13, v9

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v9

    aput v9, v13, v17

    iput-object v13, v12, Le/e/a/FullscreenControls$State;->padding:[I

    invoke-virtual {v5, v12}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 14
    :cond_112
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    if-eq v9, v5, :cond_12a

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup;

    invoke-virtual {v9, v6}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v9, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    :cond_12a
    invoke-virtual {v5, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v9, 0x10

    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    if-eqz v8, :cond_137

    const/16 v13, 0x2c

    goto :goto_139

    :cond_137
    const/16 v13, 0x24

    :goto_139
    int-to-float v13, v13

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v14

    iget v14, v14, Landroid/util/DisplayMetrics;->density:F

    mul-float v13, v13, v14

    float-to-int v13, v13

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v14

    iget v14, v14, Landroid/util/DisplayMetrics;->density:F

    const/high16 v17, 0x41000000    # 8.0f

    mul-float v14, v14, v17

    float-to-int v14, v14

    invoke-virtual {v5, v14, v11, v11, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v14, 0x0

    invoke-virtual {v5, v14}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    instance-of v14, v14, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v14, :cond_172

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v15, 0xa

    invoke-virtual {v14, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iput v11, v14, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    :cond_172
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    iput v13, v14, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v6, v13, v12}, Le/e/a/FullscreenControls;->thin(Landroid/view/View;ILe/e/a/FullscreenControls$State;)V

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    iget v5, v12, Le/e/a/FullscreenControls$State;->textSize:F

    const v12, 0x3f4ccccd    # 0.8f

    mul-float v5, v5, v12

    invoke-virtual {v7, v11, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v5, v11, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_237

    .line 16
    :cond_1a2
    if-eqz v12, :cond_237

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v15, v12, Le/e/a/FullscreenControls$State;->original:Landroid/view/ViewGroup;

    iget-object v13, v12, Le/e/a/FullscreenControls$State;->controlsLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v15, v6, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v13, v12, Le/e/a/FullscreenControls$State;->textLayout:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v13, v12, Le/e/a/FullscreenControls$State;->textSize:F

    invoke-virtual {v7, v11, v13}, Landroid/widget/TextView;->setTextSize(IF)V

    iget v7, v12, Le/e/a/FullscreenControls$State;->orientation:I

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget v7, v12, Le/e/a/FullscreenControls$State;->gravity:I

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v13, v12, Le/e/a/FullscreenControls$State;->barHeight:I

    iput v13, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v7, v12, Le/e/a/FullscreenControls$State;->padding:[I

    aget v7, v7, v11

    iget-object v13, v12, Le/e/a/FullscreenControls$State;->padding:[I

    aget v13, v13, v10

    iget-object v15, v12, Le/e/a/FullscreenControls$State;->padding:[I

    aget v15, v15, v9

    iget-object v9, v12, Le/e/a/FullscreenControls$State;->padding:[I

    aget v9, v9, v17

    invoke-virtual {v5, v7, v13, v15, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v7, v12, Le/e/a/FullscreenControls$State;->heights:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1e7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_230

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/View;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [I

    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    aget v15, v9, v11

    iput v15, v13, Landroid/view/ViewGroup$LayoutParams;->height:I

    aget v13, v9, v10

    invoke-virtual {v12, v13}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {v12}, Landroid/view/View;->getPaddingLeft()I

    move-result v13

    aget v15, v9, v17

    invoke-virtual {v12}, Landroid/view/View;->getPaddingRight()I

    move-result v10

    aget v11, v9, v14

    invoke-virtual {v12, v13, v15, v10, v11}, Landroid/view/View;->setPadding(IIII)V

    instance-of v10, v12, Landroid/widget/TextView;

    if-eqz v10, :cond_229

    move-object v10, v12

    check-cast v10, Landroid/widget/TextView;

    const/4 v11, 0x2

    aget v9, v9, v11

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setMinHeight(I)V

    goto :goto_22a

    :cond_229
    const/4 v11, 0x2

    :goto_22a
    invoke-virtual {v12}, Landroid/view/View;->requestLayout()V

    const/4 v10, 0x1

    const/4 v11, 0x0

    goto :goto_1e7

    :cond_230
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    :cond_237
    :goto_237
    nop

    .line 17
    if-eqz v8, :cond_23d

    const/16 v15, 0x2c

    goto :goto_244

    :cond_23d
    if-eqz v0, :cond_242

    const/16 v15, 0x24

    goto :goto_244

    :cond_242
    const/16 v15, 0x20

    :goto_244
    int-to-float v0, v15

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, v5

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v6, v0}, Le/e/a/FullscreenControls;->row(Landroid/view/View;I)V

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v5, "bottommenulay"

    invoke-virtual {v3, v5, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Le/e/a/FullscreenControls;->row(Landroid/view/View;I)V
    :try_end_269
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_269} :catch_26b

    .line 18
    goto :goto_273

    .line 9
    :cond_26a
    :goto_26a
    return-void

    .line 18
    :catch_26b
    move-exception v0

    const-string v1, "nicoid-controls"

    const-string v2, "Fullscreen layout failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_273
    return-void
.end method
