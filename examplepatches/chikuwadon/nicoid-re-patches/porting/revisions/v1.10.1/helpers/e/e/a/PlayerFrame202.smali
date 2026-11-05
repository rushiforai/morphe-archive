.class public final Le/e/a/PlayerFrame202;
.super Ljava/lang/Object;
.source "PlayerFrame202.java"


# static fields
.field static final FIELDS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;>;"
        }
    .end annotation
.end field

.field static final FLAGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final METHODS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerFrame202;->FLAGS:Ljava/util/Map;

    .line 14
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerFrame202;->FIELDS:Ljava/util/Map;

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerFrame202;->METHODS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static attach(Landroid/view/View;Landroid/view/ViewGroup;)V
    .registers 5

    .line 27
    if-eqz p0, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p1, :cond_9

    goto :goto_16

    :cond_9
    invoke-static {p0}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_16
    :goto_16
    return-void
.end method

.method static compactRow(Landroid/view/View;I)I
    .registers 7

    invoke-static {p0, p1}, Le/e/a/ToolbarGeometry213;->width(Landroid/view/View;I)I

    move-result p1

    .line 21
    invoke-static {p0}, Le/e/a/PlayerFrame202;->count(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_d

    const/4 p1, 0x0

    goto :goto_25

    :cond_d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0x20

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int/2addr p1, v0

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_25
    const/4 v0, -0x1

    invoke-static {p0, v0, p1}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    invoke-static {p0}, Le/e/a/PlayerFrame202;->padding(Landroid/view/View;)V

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_6d

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_3a

    goto :goto_6d

    :cond_3a
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_47

    goto :goto_6a

    :cond_47
    invoke-static {v2, p1, p1}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    invoke-static {v2}, Le/e/a/PlayerFrame202;->padding(Landroid/view/View;)V

    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_6a

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    int-to-float v3, p1

    const v4, 0x3e99999a    # 0.3f

    mul-float v3, v3, v4

    invoke-virtual {v2, v1, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_6a
    :goto_6a
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    :cond_6d
    :goto_6d
    return p1
.end method

.method static count(Landroid/view/View;)I
    .registers 5

    .line 20
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_10

    return v0

    :cond_10
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1e

    add-int/lit8 v0, v0, 0x1

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method public static dock(Ljava/lang/Object;)Z
    .registers 18

    .line 33
    move-object/from16 v0, p0

    const-string v1, "comments"

    const/4 v2, 0x1

    :try_start_5
    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->heldDock(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    return v2

    .line 34
    :cond_c
    const-string v3, "rootView"

    invoke-static {v0, v3}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    const-string v4, "frame"

    invoke-static {v0, v4}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    const-string v5, "bar"

    invoke-static {v0, v5}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    const-string v6, "top"

    invoke-static {v0, v6}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    const-string v7, "controller"

    invoke-static {v0, v7}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    instance-of v8, v5, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_197

    instance-of v8, v6, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_197

    if-nez v7, :cond_40

    goto/16 :goto_197

    .line 35
    :cond_40
    invoke-static {v5, v4}, Le/e/a/PlayerFrame202;->attach(Landroid/view/View;Landroid/view/ViewGroup;)V

    invoke-static {v7, v4}, Le/e/a/PlayerFrame202;->attach(Landroid/view/View;Landroid/view/ViewGroup;)V

    const/4 v8, 0x3

    new-array v9, v8, [Ljava/lang/String;

    const-string v10, "play"

    const/4 v11, 0x0

    aput-object v10, v9, v11

    const-string v10, "post"

    aput-object v10, v9, v2

    const-string v10, "info"

    const/4 v12, 0x2

    aput-object v10, v9, v12

    const/4 v10, 0x0

    :goto_58
    if-lt v10, v8, :cond_17d

    const-string v9, "arrange"

    new-array v10, v11, [Ljava/lang/Class;

    new-array v13, v11, [Ljava/lang/Object;

    invoke-static {v0, v9, v10, v13}, Le/e/a/PlayerFrame202;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V

    .line 36
    check-cast v6, Landroid/widget/LinearLayout;

    check-cast v5, Landroid/widget/LinearLayout;

    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    const/4 v10, -0x2

    const/4 v13, -0x1

    if-eq v9, v5, :cond_7a

    invoke-static {v6}, Le/e/a/Revision201;->detach(Landroid/view/View;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v13, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7a
    invoke-virtual {v5, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v9, 0x10

    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v5, v11, v11, v11, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const-string v9, "titlebartext"

    invoke-static {v3, v9}, Le/e/a/PlayerFrame202;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    const/16 v14, 0x8

    if-eqz v9, :cond_92

    invoke-virtual {v9, v14}, Landroid/view/View;->setVisibility(I)V

    .line 37
    :cond_92
    invoke-static {v3}, Le/e/a/PlayerFrame202;->enforceHidden(Landroid/view/View;)V

    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v3

    invoke-static {v6, v3}, Le/e/a/PlayerFrame202;->compactRow(Landroid/view/View;I)I

    move-result v3

    invoke-static {v5, v13, v3, v11, v11}, Le/e/a/PlayerFrame202;->rectangle(Landroid/view/View;IIIZ)V

    const/high16 v9, -0x1000000

    if-nez v3, :cond_a6

    const/4 v15, 0x0

    goto :goto_a8

    :cond_a6
    const/high16 v15, -0x1000000

    :goto_a8
    invoke-virtual {v5, v15}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-static {v5}, Le/e/a/PlayerFrame202;->show(Landroid/view/View;)V

    invoke-static {v6}, Le/e/a/PlayerFrame202;->show(Landroid/view/View;)V

    invoke-static {v7}, Le/e/a/PlayerFrame202;->show(Landroid/view/View;)V

    invoke-virtual {v7, v9}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {v7, v13, v10, v11, v2}, Le/e/a/PlayerFrame202;->rectangle(Landroid/view/View;IIIZ)V

    .line 38
    const-string v5, "central"

    invoke-static {v0, v5}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    const-string v6, "bottom"

    invoke-static {v0, v6}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    if-eqz v5, :cond_cf

    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    :cond_cf
    if-eqz v6, :cond_d4

    invoke-virtual {v6, v14}, Landroid/view/View;->setVisibility(I)V

    .line 39
    :cond_d4
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    if-gtz v5, :cond_de

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v5

    :cond_de
    new-array v6, v12, [Ljava/lang/String;

    const-string v7, "video"

    aput-object v7, v6, v11

    aput-object v1, v6, v2

    const/4 v7, 0x0

    :goto_e7
    if-lt v7, v12, :cond_150

    const-string v6, "fit"

    new-array v7, v2, [Ljava/lang/Class;

    const-class v9, Landroid/view/View;

    aput-object v9, v7, v11

    new-array v9, v2, [Ljava/lang/Object;

    const-string v10, "videoView"

    invoke-static {v0, v10}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v0, v6, v7, v9}, Le/e/a/PlayerFrame202;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V

    .line 40
    const-string v6, "origin"

    invoke-static {v0, v6}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [I

    invoke-virtual {v4, v6}, Landroid/widget/RelativeLayout;->getLocationInWindow([I)V

    const-string v6, "clip"

    new-array v7, v8, [Ljava/lang/Class;

    const-class v9, Landroid/view/View;

    aput-object v9, v7, v11

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v7, v2

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v7, v12

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v0, v1}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, v8, v11

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v12

    invoke-static {v0, v6, v7, v8}, Le/e/a/PlayerFrame202;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V

    .line 41
    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const-string v6, "pictureHeight"

    invoke-static {v0, v6}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    add-int/2addr v0, v3

    add-int/2addr v0, v5

    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v3, :cond_14f

    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v3, v0, :cond_14f

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    :cond_14f
    return v2

    .line 39
    :cond_150
    aget-object v9, v6, v7

    const-string v10, "inset"

    new-array v13, v8, [Ljava/lang/Class;

    const-class v14, Landroid/view/View;

    aput-object v14, v13, v11

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v14, v13, v2

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v14, v13, v12

    new-array v14, v8, [Ljava/lang/Object;

    invoke-static {v0, v9}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v14, v11

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v14, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v14, v12

    invoke-static {v0, v10, v13, v14}, Le/e/a/PlayerFrame202;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V

    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_e7

    .line 35
    :cond_17d
    aget-object v13, v9, v10

    const-string v14, "upper"

    new-array v15, v2, [Ljava/lang/Class;

    const-class v16, Landroid/view/View;

    aput-object v16, v15, v11

    new-array v8, v2, [Ljava/lang/Object;

    invoke-static {v0, v13}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    aput-object v13, v8, v11

    invoke-static {v0, v14, v15, v8}, Le/e/a/PlayerFrame202;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_192
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_192} :catch_198

    add-int/lit8 v10, v10, 0x1

    const/4 v8, 0x3

    goto/16 :goto_58

    .line 34
    :cond_197
    :goto_197
    return v2

    .line 43
    :catch_198
    move-exception v0

    const-string v1, "nicoid-controls"

    const-string v3, "Cannot arrange player controls"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2
.end method

.method static edge(Landroid/view/View;Z)V
    .registers 3

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    instance-of v0, p0, Landroid/app/Activity;

    if-nez v0, :cond_d

    return-void

    :cond_d
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    if-eqz p1, :cond_41

    sget-object p1, Le/e/a/PlayerFrame202;->FLAGS:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2e

    sget-object p1, Le/e/a/PlayerFrame202;->FLAGS:Ljava/util/Map;

    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2e
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result p1

    or-int/lit16 p1, p1, 0x100

    or-int/lit16 p1, p1, 0x200

    or-int/lit8 p1, p1, 0x2

    or-int/lit16 p1, p1, 0x1000

    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    if-eq p1, v0, :cond_52

    goto :goto_4f

    :cond_41
    sget-object p1, Le/e/a/PlayerFrame202;->FLAGS:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_52

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_4f
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_52
    return-void
.end method

.method static enforceHidden(Landroid/view/View;)V
    .registers 10

    .line 30
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "player_buttons_hidden_v1"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1d

    goto :goto_4b

    :cond_1d
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "PlayerControls194"

    const-string v3, "button"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Landroid/view/View;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-class v6, Ljava/lang/String;

    const/4 v8, 0x1

    aput-object v6, v5, v8

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v7

    aput-object v1, v4, v8

    invoke-static {v2, v3, v5, v4}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_16

    check-cast v1, Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_49} :catch_4a

    goto :goto_16

    :catch_4a
    move-exception p0

    :goto_4b
    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 17
    invoke-static {p0, p1}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Le/e/a/PlayerFrame202;->FIELDS:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_18

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sget-object v2, Le/e/a/PlayerFrame202;->FIELDS:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Field;

    if-nez v2, :cond_3e

    :goto_20
    if-nez v0, :cond_23

    goto :goto_28

    :cond_23
    :try_start_23
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0
    :try_end_27
    .catch Ljava/lang/NoSuchFieldException; {:try_start_23 .. :try_end_27} :catch_38

    move-object v2, v0

    :goto_28
    if-eqz v2, :cond_32

    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3e

    :cond_32
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0

    :catch_38
    move-exception v3

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_20

    :cond_3e
    :goto_3e
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static varargs invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Le/e/a/PlayerFrame202;->METHODS:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_18

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sget-object v2, Le/e/a/PlayerFrame202;->METHODS:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    if-nez v2, :cond_2b

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 p2, 0x1

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2b
    invoke-virtual {v2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static isWithin(Landroid/view/View;Landroid/view/View;)Z
    .registers 5

    .line 55
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/16 v2, 0x8

    if-lt v1, v2, :cond_7

    :goto_6
    goto :goto_14

    :cond_7
    if-ne p0, p1, :cond_b

    const/4 p0, 0x1

    return p0

    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-nez v2, :cond_15

    goto :goto_6

    :goto_14
    return v0

    :cond_15
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public static normal(Landroid/view/View;Z)V
    .registers 14

    .line 46
    const-string v0, "videoLayout"

    invoke-static {p0, v0}, Le/e/a/PlayerFrame202;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "titlebar"

    invoke-static {p0, v1}, Le/e/a/PlayerFrame202;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string v2, "topmenulay"

    invoke-static {p0, v2}, Le/e/a/PlayerFrame202;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v0, :cond_120

    if-nez v2, :cond_18

    goto/16 :goto_120

    :cond_18
    invoke-static {p0}, Le/e/a/PlayerFrame202;->enforceHidden(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    if-lez v3, :cond_26

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    goto :goto_2a

    :cond_26
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    :goto_2a
    invoke-static {v2, v3}, Le/e/a/PlayerFrame202;->compactRow(Landroid/view/View;I)I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    :try_start_30
    const-string v6, "PlayerButtons192"

    const-string v7, "host"

    new-array v8, v4, [Ljava/lang/Class;

    const-class v9, Landroid/view/View;

    aput-object v9, v8, v5

    new-array v9, v4, [Ljava/lang/Object;

    aput-object v2, v9, v5

    invoke-static {v6, v7, v8, v9}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Landroid/view/View;

    if-eqz v7, :cond_4a

    check-cast v6, Landroid/view/View;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_48} :catch_49

    goto :goto_4b

    :catch_49
    move-exception v6

    :cond_4a
    move-object v6, v2

    :goto_4b
    if-eq v6, v2, :cond_59

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v6, v7, v3}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    invoke-static {v6}, Le/e/a/PlayerFrame202;->padding(Landroid/view/View;)V

    .line 47
    :cond_59
    instance-of v7, v1, Landroid/view/ViewGroup;

    if-eqz v7, :cond_65

    invoke-static {v6, v1}, Le/e/a/PlayerFrame202;->isWithin(Landroid/view/View;Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_65

    const/4 v7, 0x1

    goto :goto_66

    :cond_65
    const/4 v7, 0x0

    :goto_66
    const/4 v8, -0x1

    if-eqz v7, :cond_76

    if-eqz p1, :cond_6f

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v8

    :cond_6f
    invoke-static {v1, v8, v3}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    invoke-static {v1}, Le/e/a/PlayerFrame202;->padding(Landroid/view/View;)V

    goto :goto_b3

    :cond_76
    if-eqz v1, :cond_b3

    const-string v9, "titlebartext"

    invoke-static {p0, v9}, Le/e/a/PlayerFrame202;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    if-eqz v3, :cond_9c

    if-eqz v9, :cond_9c

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-eq v10, v11, :cond_9c

    instance-of v10, v9, Landroid/widget/TextView;

    if-eqz v10, :cond_9c

    check-cast v9, Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-eqz v9, :cond_9c

    const/4 v9, 0x0

    goto :goto_9d

    :cond_9c
    const/4 v9, 0x1

    :goto_9d
    if-eqz v9, :cond_a3

    invoke-static {v1, v8, v5}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    goto :goto_b3

    :cond_a3
    invoke-static {v1}, Le/e/a/PlayerFrame202;->padding(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    const/16 v10, 0x20

    invoke-static {v9, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-static {v1, v8, v9}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    .line 48
    :cond_b3
    :goto_b3
    if-nez v3, :cond_c7

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v6, v7, v5}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundColor(I)V

    if-eqz v1, :cond_d2

    invoke-virtual {v1, v5}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_d2

    :cond_c7
    const/high16 v6, 0x77000000

    if-eqz v7, :cond_cf

    invoke-virtual {v1, v6}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_d2

    :cond_cf
    invoke-virtual {v2, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 49
    :cond_d2
    :goto_d2
    if-eqz p1, :cond_11c

    invoke-static {p0, v4}, Le/e/a/PlayerFrame202;->edge(Landroid/view/View;Z)V

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    if-nez p1, :cond_e9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result p1

    if-nez p1, :cond_e9

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    if-eqz p1, :cond_f0

    :cond_e9
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    invoke-virtual {v0, v5, v5, v5, p1}, Landroid/view/View;->setPadding(IIII)V

    :cond_f0
    if-eqz v1, :cond_f5

    invoke-static {p0, v1, v3, v4}, Le/e/a/PlayerFrame202;->wide(Landroid/view/View;Landroid/view/View;IZ)V

    :cond_f5
    const-string p1, "controller"

    invoke-static {p0, p1}, Le/e/a/PlayerFrame202;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_11f

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {p0, p1, v0, v5}, Le/e/a/PlayerFrame202;->wide(Landroid/view/View;Landroid/view/View;IZ)V

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p0

    if-eqz p0, :cond_11f

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p1, p0, v0, v5, v1}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_11f

    :cond_11c
    invoke-static {p0, v5}, Le/e/a/PlayerFrame202;->edge(Landroid/view/View;Z)V

    .line 50
    :cond_11f
    :goto_11f
    return-void

    .line 46
    :cond_120
    :goto_120
    return-void
.end method

.method static padding(Landroid/view/View;)V
    .registers 4

    .line 19
    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    if-eqz v0, :cond_1a

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    :cond_1a
    return-void
.end method

.method public static popupBounds(Ljava/lang/Object;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7

    .line 57
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    const/4 v1, 0x0

    :try_start_6
    const-string v2, "U"

    invoke-static {p0, v2}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_48

    const/4 v3, 0x2

    new-array v3, v3, [I

    invoke-virtual {p1, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    if-lez v4, :cond_48

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-lez v4, :cond_48

    iget p0, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    aget v4, v3, v1

    sub-int/2addr p0, v4

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    const/4 v4, 0x1

    aget v3, v3, v4

    sub-int/2addr v2, v3

    invoke-virtual {v0, p0, v2}, Landroid/graphics/Rect;->offset(II)V

    iget p0, v0, Landroid/graphics/Rect;->left:I

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    iput p0, v0, Landroid/graphics/Rect;->left:I

    iget p0, v0, Landroid/graphics/Rect;->top:I

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    iput p0, v0, Landroid/graphics/Rect;->top:I

    return-object v0

    :cond_48
    new-instance v0, Landroid/graphics/Rect;

    const-string v2, "o"

    invoke-static {p0, v2}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    const-string v3, "p"

    invoke-static {p0, v3}, Le/e/a/PlayerFrame202;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-direct {v0, v1, v1, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_65} :catch_66

    return-object v0

    :catch_66
    move-exception p0

    new-instance p0, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-direct {p0, v1, v1, v0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p0
.end method

.method static rectangle(Landroid/view/View;IIIZ)V
    .registers 14

    .line 22
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v1, :cond_f

    invoke-static {p0, p1, p2}, Le/e/a/PlayerFrame202;->size(Landroid/view/View;II)V

    return-void

    :cond_f
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, p1, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    if-ne v1, p2, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    if-nez v1, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    if-nez v1, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    if-ne v1, p3, :cond_2d

    iget v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    if-nez v1, :cond_2d

    const/4 v1, 0x0

    goto :goto_2e

    :cond_2d
    const/4 v1, 0x1

    .line 23
    :goto_2e
    const/4 v4, 0x7

    new-array v5, v4, [I

    fill-array-data v5, :array_94

    const/4 v6, 0x0

    :goto_35
    if-lt v6, v4, :cond_84

    .line 24
    const/16 v4, 0xc

    const/16 v5, 0xa

    if-eqz p4, :cond_40

    const/16 v6, 0xc

    goto :goto_42

    :cond_40
    const/16 v6, 0xa

    :goto_42
    if-eqz p4, :cond_46

    const/16 v4, 0xa

    :cond_46
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result p4

    if-eqz p4, :cond_50

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    const/4 v1, 0x1

    :cond_50
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result p4

    if-nez p4, :cond_5a

    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_5b

    :cond_5a
    move v3, v1

    .line 25
    :goto_5b
    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iput p2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iput p3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    if-eqz v3, :cond_6c

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6c
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result p1

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_78

    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationY(F)V

    :cond_78
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result p1

    cmpl-float p1, p1, p2

    if-eqz p1, :cond_83

    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 26
    :cond_83
    return-void

    .line 23
    :cond_84
    aget v7, v5, v6

    invoke-virtual {v0, v7}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result v8

    if-eqz v8, :cond_90

    invoke-virtual {v0, v7}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    const/4 v1, 0x1

    :cond_90
    add-int/lit8 v6, v6, 0x1

    goto :goto_35

    nop

    :array_94
    .array-data 4
        0x2
        0x3
        0xd
        0xe
        0xf
        0xb
        0x15
    .end array-data
.end method

.method static show(Landroid/view/View;)V
    .registers 3

    .line 44
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_17
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_24

    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    :cond_24
    return-void
.end method

.method static size(Landroid/view/View;II)V
    .registers 5

    .line 18
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_18

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, p1, :cond_11

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, p2, :cond_18

    :cond_11
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_18
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    return-void
.end method

.method static wide(Landroid/view/View;Landroid/view/View;IZ)V
    .registers 7

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    xor-int/lit8 v1, p3, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v0, p2, v2, v1}, Le/e/a/PlayerFrame202;->rectangle(Landroid/view/View;IIIZ)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/view/View;

    if-eqz p2, :cond_52

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    instance-of p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    if-nez p2, :cond_1b

    goto :goto_52

    .line 53
    :cond_1b
    const/4 p2, 0x2

    new-array v0, p2, [I

    new-array p2, p2, [I

    invoke-virtual {p0, p2}, Landroid/view/View;->getLocationInWindow([I)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    aget v1, p2, v2

    aget v2, v0, v2

    sub-int/2addr v1, v2

    if-eqz p3, :cond_40

    const/4 p3, 0x1

    aget p2, p2, p3

    aget p3, v0, p3

    sub-int/2addr p2, p3

    goto :goto_42

    :cond_40
    iget p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :goto_42
    iget p3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne p3, v1, :cond_4a

    iget p3, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq p3, p2, :cond_51

    :cond_4a
    iput v1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput p2, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    :cond_51
    return-void

    .line 52
    :cond_52
    :goto_52
    return-void
.end method
