.class final Le/e/a/MenuEditor120;
.super Ljava/lang/Object;
.source "MenuEditor120.java"


# static fields
.field static final ORDER:Ljava/lang/String; = "video_menu_order_v1"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Ljava/util/List;Le/e/a/ListActions$Action;Le/e/a/ListActions$Action;)I
    .registers 3

    .line 6
    iget p1, p1, Le/e/a/ListActions$Action;->id:I

    invoke-static {p0, p1}, Le/e/a/MenuEditor120;->rank(Ljava/util/List;I)I

    move-result p1

    iget p2, p2, Le/e/a/ListActions$Action;->id:I

    invoke-static {p0, p2}, Le/e/a/MenuEditor120;->rank(Ljava/util/List;I)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$1(Ljava/util/List;[ZLandroid/widget/ScrollView;[Ljava/lang/Runnable;IIZ)V
    .registers 7

    .line 8
    invoke-static {p0, p4, p5, p6}, Le/e/a/ListOrder120;->move(Ljava/util/List;IIZ)Z

    move-result p0

    if-eqz p0, :cond_f

    const/4 p0, 0x1

    const/4 p4, 0x0

    aput-boolean p0, p1, p4

    aget-object p0, p3, p4

    invoke-virtual {p2, p0}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    :cond_f
    return-void
.end method

.method static synthetic lambda$2(Landroid/widget/ScrollView;Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Map;Le/e/a/DragRows120;)V
    .registers 16

    .line 8
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_9
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-lt v2, v3, :cond_18

    new-instance p1, Le/e/a/MenuEditor120$$ExternalSyntheticLambda6;

    invoke-direct {p1, p0, v0}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda6;-><init>(Landroid/widget/ScrollView;I)V

    invoke-virtual {p0, p1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_18
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    sget-object v5, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xe

    invoke-static {p3, v5, v6}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x30

    invoke-static {p3, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v1, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/CheckBox;

    invoke-direct {v6, p3}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {v6}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v6, v5}, Landroid/widget/CheckBox;->setContentDescription(Ljava/lang/CharSequence;)V

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {p4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v6, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v5, Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;

    invoke-direct {v5, p4, v3}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;-><init>(Ljava/util/Map;I)V

    invoke-virtual {v6, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p3, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p3, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v3, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p5, p3}, Le/e/a/DragRows120;->handle(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p3, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p3, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p5, v4, v3, v2}, Le/e/a/DragRows120;->bind(Landroid/view/View;Landroid/view/View;I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_9
.end method

.method static synthetic lambda$3(Ljava/util/Map;ILandroid/widget/CompoundButton;Z)V
    .registers 4

    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic lambda$4(Landroid/widget/ScrollView;I)V
    .registers 3

    .line 8
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/app/Activity;Ljava/util/List;Ljava/util/Map;[ZLandroid/content/DialogInterface;I)V
    .registers 8

    .line 8
    invoke-static {p0}, Le/e/a/MenuOptions119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_c
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result p5

    if-nez p5, :cond_2d

    const/4 p2, 0x0

    aget-boolean p2, p3, p2

    const-string p3, "video_menu_order_v1"

    if-eqz p2, :cond_26

    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2, p1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_29

    :cond_26
    invoke-interface {p0, p3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_29
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_2d
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Le/e/a/MenuOptions119;->key(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p2, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    invoke-virtual {v1, p5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p5

    invoke-interface {p0, v0, p5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_c
.end method

.method static synthetic lambda$6(Ljava/util/List;Ljava/util/Map;[Z[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 6

    .line 8
    invoke-interface {p0}, Ljava/util/List;->clear()V

    sget-object p4, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    invoke-virtual {p4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p4

    invoke-interface {p0, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-nez p4, :cond_1f

    const/4 p0, 0x0

    aput-boolean p0, p2, p0

    aget-object p0, p3, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_1f
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Integer;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10
.end method

.method static order(Landroid/content/Context;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_5
    new-instance v1, Lorg/json/JSONArray;

    invoke-static {p0}, Le/e/a/MenuOptions119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "video_menu_order_v1"

    const-string v3, "[]"

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_17
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt p0, v2, :cond_1e

    goto :goto_2e

    :cond_1e
    const/4 v2, -0x1

    invoke-virtual {v1, p0, v2}, Lorg/json/JSONArray;->optInt(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_2a} :catch_2d

    add-int/lit8 p0, p0, 0x1

    goto :goto_17

    :catch_2d
    move-exception p0

    :goto_2e
    sget-object p0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-static {v0, p0}, Le/e/a/ListOrder120;->normalize(Ljava/util/List;Ljava/util/Collection;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static rank(Ljava/util/List;I)I
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;I)I"
        }
    .end annotation

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-gez p0, :cond_d

    const p0, 0x7fffffff

    :cond_d
    return p0
.end method

.method static show(Landroid/app/Activity;)V
    .registers 16

    .line 8
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v7

    invoke-static {p0}, Le/e/a/MenuEditor120;->order(Landroid/content/Context;)Ljava/util/List;

    move-result-object v8

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_c2

    invoke-static {p0}, Le/e/a/MenuOptions119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "video_menu_order_v1"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    new-array v10, v2, [Z

    const/4 v11, 0x0

    aput-boolean v0, v10, v11

    invoke-static {v7}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    const/16 v0, 0xc

    invoke-static {v7, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v3, v0, v11, v0, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v7}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-static {v7}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v12

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x230

    invoke-static {v7, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    mul-int/lit8 v5, v5, 0x3

    div-int/lit8 v5, v5, 0x5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v0, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-array v13, v2, [Ljava/lang/Runnable;

    new-instance v6, Le/e/a/DragRows120;

    new-instance v0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;

    invoke-direct {v0, v8, v10, v1, v13}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;-><init>(Ljava/util/List;[ZLandroid/widget/ScrollView;[Ljava/lang/Runnable;)V

    invoke-direct {v6, v1, v0}, Le/e/a/DragRows120;-><init>(Landroid/widget/ScrollView;Le/e/a/DragRows120$Drop;)V

    new-instance v14, Le/e/a/MenuEditor120$$ExternalSyntheticLambda2;

    move-object v0, v14

    move-object v2, v3

    move-object v3, v8

    move-object v4, v7

    move-object v5, v9

    invoke-direct/range {v0 .. v6}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda2;-><init>(Landroid/widget/ScrollView;Landroid/widget/LinearLayout;Ljava/util/List;Landroid/content/Context;Ljava/util/Map;Le/e/a/DragRows120;)V

    aput-object v14, v13, v11

    aget-object v0, v13, v11

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    invoke-static {v7}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v12}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v8, v9, v10}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Ljava/util/List;Ljava/util/Map;[Z)V

    const p0, 0x104000a

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v0, "\u6a19\u6e96\u306b\u623b\u3059"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v0, -0x3

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p0

    new-instance v0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda4;

    invoke-direct {v0, v8, v9, v10, v13}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda4;-><init>(Ljava/util/List;Ljava/util/Map;[Z[Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_c2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-static {p0}, Le/e/a/MenuOptions119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Le/e/a/MenuOptions119;->key(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v9, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_11
.end method

.method static sort(Ljava/util/List;Landroid/content/Context;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 6
    invoke-static {p1}, Le/e/a/MenuOptions119;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "video_menu_order_v1"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    invoke-static {p1}, Le/e/a/MenuEditor120;->order(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Le/e/a/MenuEditor120$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;)V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method
