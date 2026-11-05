.class public final Le/e/a/Ranking190;
.super Ljava/lang/Object;
.source "Ranking190.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Ranking190$CategoryRows;,
        Le/e/a/Ranking190$Manager;
    }
.end annotation


# static fields
.field private static final SNAPSHOTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Ranking190;->SNAPSHOTS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cancel(Landroid/view/View;)V
    .registers 2

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Le/e/a/NetworkTask;

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/NetworkTask;

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    :cond_11
    return-void
.end method

.method static category(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 22
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "title"

    invoke-static {p3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p0, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "subtitle"

    const-string v0, ""

    invoke-interface {p0, p3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p3, 0x0

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "islabel"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "type"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p0, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "id"

    invoke-interface {p0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static deletePresets(Landroid/content/Context;Ljava/util/Set;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 55
    const-string v0, "home"

    const-string v1, "startup_screen"

    const-string v2, "id"

    const-string v3, "ranking_genres_v190"

    const-string v4, "ranking_presets_v190"

    :try_start_a
    invoke-static {p0, v4}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-static {v5, p1}, Le/e/a/RankingCatalog190;->without(Lorg/json/JSONArray;Ljava/util/Set;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-static {p0, v3}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    const/4 v8, 0x0

    :goto_1c
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_20} :catch_80

    const/4 v10, 0x7

    const-string v11, "custom-"

    if-lt v8, v9, :cond_5c

    :try_start_25
    invoke-static {p0}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {v7}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-static {p0}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_58

    invoke-virtual {p0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_58

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_58
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_88

    :cond_5c
    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_7d

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7a

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {p1, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7d

    :cond_7a
    invoke-virtual {v7, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_7d} :catch_80

    :cond_7d
    add-int/lit8 v8, v8, 0x1

    goto :goto_1c

    :catch_80
    move-exception p0

    const-string p1, "nicoid-ranking"

    const-string v0, "Unable to delete selected rankings"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_88
    return-void
.end method

.method static editGenres(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 15

    .line 23
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v6

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, Le/e/a/Ranking190;->genres(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v8, 0x0

    const/4 v1, 0x0

    :goto_f
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_cd

    invoke-static {v6}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v9

    invoke-static {v6}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v10

    invoke-static {v9}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    const-string v0, "Hold to reorder; check to show"

    const-string v1, "\u9577\u6309\u6392\u5e8f\uff1b\u52fe\u9078\u986f\u793a"

    const-string v2, "\u9577\u62bc\u3057\u3067\u4e26\u3079\u66ff\u3048\uff0f\u30c1\u30a7\u30c3\u30af\u3067\u8868\u793a\u30fb\u975e\u8868\u793a"

    invoke-static {v6, v2, v0, v1}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xe

    invoke-static {v6, v0, v1}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v6}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v10}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x190

    invoke-static {v6, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    div-int/lit8 v3, v3, 0x2

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x1

    new-array v11, v0, [Ljava/lang/Runnable;

    .line 24
    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda34;

    invoke-direct {v0, v10, v7, v6, v11}, Le/e/a/Ranking190$$ExternalSyntheticLambda34;-><init>(Landroid/widget/LinearLayout;Ljava/util/ArrayList;Landroid/content/Context;[Ljava/lang/Runnable;)V

    aput-object v0, v11, v8

    .line 25
    new-instance v12, Le/e/a/Ranking190$$ExternalSyntheticLambda35;

    move-object v0, v12

    move-object v2, v6

    move-object v3, v10

    move-object v4, v7

    move-object v5, v11

    invoke-direct/range {v0 .. v5}, Le/e/a/Ranking190$$ExternalSyntheticLambda35;-><init>(Landroid/widget/ScrollView;Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/util/ArrayList;[Ljava/lang/Runnable;)V

    invoke-virtual {v10, v12}, Landroid/widget/LinearLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    aget-object v0, v11, v8

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    invoke-static {v6}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Edit genres"

    const-string v2, "\u7de8\u8f2f\u5206\u985e"

    const-string v3, "\u30b8\u30e3\u30f3\u30eb\u306e\u7de8\u96c6"

    invoke-static {v6, v3, v1, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Apply"

    const-string v2, "\u5957\u7528"

    const-string v3, "\u9069\u7528"

    invoke-static {v6, v3, v1, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda36;

    invoke-direct {v2, v7, p0, p1}, Le/e/a/Ranking190$$ExternalSyntheticLambda36;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "Reset"

    const-string v1, "\u91cd\u8a2d"

    const-string v2, "\u521d\u671f\u72b6\u614b\u306b\u623b\u3059"

    invoke-static {v6, v2, v0, v1}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v0, -0x3

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda37;

    invoke-direct {v0, v7, p0, v11}, Le/e/a/Ranking190$$ExternalSyntheticLambda37;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;[Ljava/lang/Runnable;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 23
    :cond_cd
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_f
.end method

.method static editPreset(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/Runnable;)V
    .registers 19

    .line 57
    move-object/from16 v1, p1

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    const/16 v3, 0x14

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x8

    invoke-static {v0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v6, 0xc

    invoke-static {v0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v4, v5, v3, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v5, "Ranking name"

    const-string v6, "\u6392\u884c\u699c\u540d\u7a31"

    const-string v7, "\u30e9\u30f3\u30ad\u30f3\u30b0\u540d"

    invoke-static {v0, v7, v5, v6}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    if-eqz v1, :cond_44

    const-string v5, "name"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_44
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v5, "Genres"

    const-string v6, "\u5206\u985e"

    const-string v7, "\u5bfe\u8c61\u30b8\u30e3\u30f3\u30eb"

    invoke-static {v0, v7, v5, v6}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v0, v5, v6}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    if-nez v1, :cond_6d

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    const-string v8, "e9uj2uks"

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v7

    goto :goto_73

    :cond_6d
    const-string v7, "genres"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    :goto_73
    sget-object v8, Le/e/a/RankingRules190;->GENRES:[[Ljava/lang/String;

    array-length v9, v8

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_78
    if-lt v11, v9, :cond_14c

    const-string v7, "Combines selected official genre rankings and filters them by tags"

    const-string v8, "\u5408\u4f75\u6240\u9078\u5b98\u65b9\u5206\u985e\u6392\u884c\u699c\uff0c\u4e26\u4f9d\u6a19\u7c64\u7be9\u9078"

    const-string v9, "\u9078\u3093\u3060\u30b8\u30e3\u30f3\u30eb\u306e\u516c\u5f0f\u30e9\u30f3\u30ad\u30f3\u30b0\u3092\u7d44\u307f\u5408\u308f\u305b\u3001\u30bf\u30b0\u6761\u4ef6\u3067\u7d5e\u308a\u8fbc\u307f\u307e\u3059"

    invoke-static {v0, v9, v7, v8}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0xe

    invoke-static {v0, v7, v8}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v7, "Tag conditions"

    const-string v8, "\u6a19\u7c64\u689d\u4ef6"

    const-string v9, "\u30bf\u30b0\u6761\u4ef6"

    invoke-static {v0, v9, v7, v8}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7, v6}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    if-eqz v1, :cond_c7

    const-string v7, "rules"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    if-eqz v8, :cond_c7

    const/4 v8, 0x0

    :goto_ae
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v8, v9, :cond_b9

    goto :goto_c7

    :cond_b9
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v9, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_ae

    :cond_c7
    :goto_c7
    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-array v4, v4, [Ljava/lang/Runnable;

    new-instance v8, Le/e/a/Ranking190$$ExternalSyntheticLambda25;

    invoke-direct {v8, v7, v6, v0, v4}, Le/e/a/Ranking190$$ExternalSyntheticLambda25;-><init>(Landroid/widget/LinearLayout;Ljava/util/ArrayList;Landroid/content/Context;[Ljava/lang/Runnable;)V

    aput-object v8, v4, v10

    aget-object v7, v4, v10

    invoke-interface {v7}, Ljava/lang/Runnable;->run()V

    const-string v7, "Add tag condition"

    const-string v8, "\u65b0\u589e\u6a19\u7c64\u689d\u4ef6"

    const-string v9, "\u30bf\u30b0\u6761\u4ef6\u3092\u8ffd\u52a0"

    invoke-static {v0, v9, v7, v8}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v8, Le/e/a/Ranking190$$ExternalSyntheticLambda26;

    invoke-direct {v8, v0, v6, v4}, Le/e/a/Ranking190$$ExternalSyntheticLambda26;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[Ljava/lang/Runnable;)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v7, "Custom ranking"

    const-string v8, "\u81ea\u8a02\u6392\u884c\u699c"

    const-string v9, "\u30ab\u30b9\u30bf\u30e0\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {v0, v9, v7, v8}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v4, "Save"

    const-string v7, "\u5132\u5b58"

    const-string v8, "\u4fdd\u5b58"

    invoke-static {v0, v8, v4, v7}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    invoke-static {v7}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v0, -0x1

    invoke-virtual {v7, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v8

    new-instance v9, Le/e/a/Ranking190$$ExternalSyntheticLambda27;

    move-object v0, v9

    move-object/from16 v1, p1

    move-object v2, v3

    move-object v3, v5

    move-object v4, v6

    move-object/from16 v5, p0

    move-object v6, v7

    move-object/from16 v7, p2

    invoke-direct/range {v0 .. v7}, Le/e/a/Ranking190$$ExternalSyntheticLambda27;-><init>(Lorg/json/JSONObject;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_14c
    aget-object v12, v8, v11

    new-instance v13, Landroid/widget/CheckBox;

    invoke-direct {v13, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    aget-object v14, v12, v4

    invoke-static {v14}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    aget-object v14, v12, v10

    invoke-virtual {v13, v14}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    if-eqz v7, :cond_17f

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_165
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v14, v4, :cond_16c

    goto :goto_180

    :cond_16c
    aget-object v4, v12, v10

    invoke-virtual {v7, v14}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_179

    const/4 v15, 0x1

    :cond_179
    add-int/lit8 v14, v14, 0x1

    const/4 v4, 0x1

    const/16 v6, 0x10

    goto :goto_165

    :cond_17f
    const/4 v15, 0x0

    :goto_180
    invoke-virtual {v13, v15}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-static {v13}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v2, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    const/4 v4, 0x1

    const/16 v6, 0x10

    goto/16 :goto_78
.end method

.method static editRule(Landroid/content/Context;Lorg/json/JSONObject;Ljava/util/ArrayList;Ljava/lang/Runnable;)V
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lorg/json/JSONObject;",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 60
    move-object/from16 v2, p0

    move-object/from16 v7, p1

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x14

    invoke-static {v2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0x8

    invoke-static {v2, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v2, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v5, 0xc

    invoke-static {v2, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v0, v3, v4, v1, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/widget/AutoCompleteTextView;

    invoke-direct {v1, v2}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v3, "Tag"

    const-string v4, "\u6a19\u7c64"

    const-string v5, "\u30bf\u30b0\u540d"

    invoke-static {v2, v5, v3, v4}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    if-eqz v7, :cond_42

    const-string v3, "tag"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_42
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v1}, Le/e/a/SearchSuggestions;->attachTag(Landroid/view/View;)V

    new-instance v4, Landroid/widget/Spinner;

    invoke-direct {v4, v2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/Spinner;

    invoke-direct {v6, v2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    const-string v3, "all"

    const-string v5, "any"

    const-string v8, "exclude"

    filled-new-array {v3, v5, v8}, [Ljava/lang/String;

    move-result-object v9

    const-string v10, "both"

    const-string v11, "locked"

    const-string v12, "user"

    filled-new-array {v10, v11, v12}, [Ljava/lang/String;

    move-result-object v13

    new-instance v14, Landroid/widget/ArrayAdapter;

    invoke-static {v2, v3}, Le/e/a/Ranking190;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v2, v5}, Le/e/a/Ranking190;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v8}, Le/e/a/Ranking190;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v15, v5, v8}, [Ljava/lang/String;

    move-result-object v5

    const v8, 0x1090009

    invoke-direct {v14, v2, v8, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v4, v14}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v5, Landroid/widget/ArrayAdapter;

    invoke-static {v2, v10}, Le/e/a/Ranking190;->source(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v2, v11}, Le/e/a/Ranking190;->source(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v12}, Le/e/a/Ranking190;->source(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    filled-new-array {v14, v11, v12}, [Ljava/lang/String;

    move-result-object v11

    invoke-direct {v5, v2, v8, v11}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v6, v5}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    if-eqz v7, :cond_bd

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    const-string v8, "mode"

    invoke-virtual {v7, v8, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/Spinner;->setSelection(I)V

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const-string v5, "source"

    invoke-virtual {v7, v5, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v6, v3}, Landroid/widget/Spinner;->setSelection(I)V

    :cond_bd
    invoke-static {v4}, Le/e/a/ThemeChoice;->spinner(Landroid/widget/Spinner;)V

    invoke-static {v6}, Le/e/a/ThemeChoice;->spinner(Landroid/widget/Spinner;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v5, "Tag condition"

    const-string v8, "\u6a19\u7c64\u689d\u4ef6"

    const-string v10, "\u30bf\u30b0\u6761\u4ef6"

    invoke-static {v2, v10, v5, v8}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "Apply"

    const-string v5, "\u5957\u7528"

    const-string v8, "\u8ffd\u52a0\u30fb\u9069\u7528"

    invoke-static {v2, v8, v3, v5}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    invoke-static {v10}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 v0, -0x1

    invoke-virtual {v10, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v11

    new-instance v12, Le/e/a/Ranking190$$ExternalSyntheticLambda23;

    move-object v0, v12

    move-object/from16 v2, p0

    move-object v3, v9

    move-object v5, v13

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object v9, v10

    move-object/from16 v10, p3

    invoke-direct/range {v0 .. v10}, Le/e/a/Ranking190$$ExternalSyntheticLambda23;-><init>(Landroid/widget/EditText;Landroid/content/Context;[Ljava/lang/String;Landroid/widget/Spinner;[Ljava/lang/String;Landroid/widget/Spinner;Lorg/json/JSONObject;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/lang/Runnable;)V

    invoke-virtual {v11, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static fill(Landroid/view/View;)V
    .registers 3

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_c

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    :cond_c
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static genres(Landroid/content/Context;)Lorg/json/JSONArray;
    .registers 3

    .line 16
    :try_start_0
    const-string v0, "ranking_genres_v190"

    invoke-static {p0, v0}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const-string v1, "ranking_presets_v190"

    invoke-static {p0, v1}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {v0, p0}, Le/e/a/RankingCatalog190;->restore(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_11

    return-object p0

    :catch_11
    move-exception p0

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 8

    .line 18
    :try_start_0
    const-string v0, "A"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    const-string v1, "com.sauzask.nicoid.NicoidRankingActivity$a"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    instance-of v2, v2, Le/e/a/Ranking190$CategoryRows;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_54

    const-string v3, "C"

    if-nez v2, :cond_3e

    :try_start_30
    new-instance v2, Le/e/a/Ranking190$CategoryRows;

    invoke-static {p0, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ListAdapter;

    invoke-direct {v2, v4}, Le/e/a/Ranking190$CategoryRows;-><init>(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_3e
    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0, p1, p0, v1}, Le/e/a/Ranking190$$ExternalSyntheticLambda1;-><init>(Landroid/widget/ListView;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static {p0, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Landroid/widget/BaseAdapter;

    if-eqz p1, :cond_5c

    check-cast p0, Landroid/widget/BaseAdapter;

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_53} :catch_54

    goto :goto_5c

    :catch_54
    move-exception p0

    const-string p1, "nicoid-ranking"

    const-string v0, "Unable to bind ranking customization"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5c
    :goto_5c
    return-void
.end method

.method static synthetic lambda$1(Landroid/widget/ListView;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/widget/AdapterView$OnItemClickListener;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 11

    .line 18
    invoke-virtual {p0}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result p0

    sub-int p0, p6, p0

    if-ltz p0, :cond_95

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p0, v0, :cond_10

    goto/16 :goto_95

    :cond_10
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid-custom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    const-string p1, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "nicoid_custom_rankings"

    const/4 p3, 0x1

    invoke-virtual {p0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    :goto_3a
    invoke-virtual {p2, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_95

    :cond_3e
    const-string v1, "custom-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_92

    new-instance p3, Landroid/content/Intent;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string p5, "https://www.nicovideo.jp/ranking/genre/"

    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    const-string p5, "?term="

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-static {p2}, Le/e/a/Ranking190;->term(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p4

    const-string p5, "android.intent.action.VIEW"

    invoke-direct {p3, p5, p4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p4, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p3, p2, p4}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    const-string p4, "type"

    const/4 p5, 0x6

    invoke-virtual {p3, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p3

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    const-string p1, "title"

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "name"

    invoke-virtual {p3, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    goto :goto_3a

    :cond_92
    invoke-interface/range {p3 .. p8}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_95
    :goto_95
    return-void
.end method

.method static synthetic lambda$10(Ljava/util/ArrayList;Landroid/app/Activity;Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 25
    new-instance p3, Lorg/json/JSONArray;

    invoke-direct {p3}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-nez p4, :cond_28

    invoke-static {p1}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "ranking_genres_v190"

    invoke-virtual {p3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lorg/json/JSONObject;

    invoke-virtual {p3, p4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_9
.end method

.method static synthetic lambda$11(Ljava/util/ArrayList;Landroid/app/Activity;[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 6

    .line 25
    :try_start_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    new-instance p3, Lorg/json/JSONArray;

    invoke-direct {p3}, Lorg/json/JSONArray;-><init>()V

    const-string v0, "ranking_presets_v190"

    invoke-static {p1, v0}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-static {p3, p1}, Le/e/a/RankingCatalog190;->restore(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_14
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_20

    aget-object p0, p2, p3

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_2b

    :cond_20
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_2a

    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :catch_2a
    move-exception p0

    :goto_2b
    return-void
.end method

.method static synthetic lambda$12(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/MenuItem;)Z
    .registers 4

    .line 30
    const/4 p3, 0x1

    iput-boolean p3, p0, Le/e/a/Ranking190$Manager;->selecting:Z

    iget-object p0, p0, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    invoke-static {p1, p2}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {p1}, Landroid/app/Activity;->invalidateOptionsMenu()V

    return p3
.end method

.method static synthetic lambda$13(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/MenuItem;)Z
    .registers 4

    .line 30
    const/4 p3, 0x0

    iput-boolean p3, p0, Le/e/a/Ranking190$Manager;->selecting:Z

    iget-object p0, p0, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    invoke-static {p1, p2}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {p1}, Landroid/app/Activity;->invalidateOptionsMenu()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$14(Le/e/a/Ranking190$Manager;Landroid/widget/ScrollView;)V
    .registers 2

    .line 35
    invoke-virtual {p1}, Landroid/widget/ScrollView;->getScrollY()I

    move-result p1

    iput p1, p0, Le/e/a/Ranking190$Manager;->scroll:I

    return-void
.end method

.method static synthetic lambda$15(Landroid/widget/ScrollView;I)V
    .registers 3

    .line 35
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method static synthetic lambda$16(Ljava/util/Set;Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 39
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {p2, p3}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void

    :cond_e
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p1, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method static synthetic lambda$17(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 39
    iget-object p0, p0, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    invoke-static {p1, p2}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$18(Landroid/widget/TextView;Le/e/a/Ranking190$Manager;Ljava/util/Set;Landroid/widget/Button;)V
    .registers 5

    .line 40
    iget-object v0, p1, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result p2

    invoke-static {p0, v0, p2}, Le/e/a/SelectionUi191;->selection(Landroid/widget/TextView;II)V

    iget-boolean p0, p1, Le/e/a/Ranking190$Manager;->selecting:Z

    if-eqz p0, :cond_1b

    iget-object p0, p1, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_1b

    const/4 p0, 0x0

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x1

    :goto_1c
    invoke-virtual {p3, p0}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method static synthetic lambda$19(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 10

    .line 41
    iget-boolean p3, p0, Le/e/a/Ranking190$Manager;->selecting:Z

    const/4 v0, 0x0

    if-nez p3, :cond_e

    new-instance p0, Le/e/a/Ranking190$$ExternalSyntheticLambda19;

    invoke-direct {p0, p1, p2}, Le/e/a/Ranking190$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-static {p1, v0, p0}, Le/e/a/Ranking190;->editPreset(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/Runnable;)V

    return-void

    :cond_e
    new-instance p3, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-direct {p3, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-interface {p3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " rankings: delete selected items?"

    const-string v4, " \u500b\u6392\u884c\u699c\uff0c\u78ba\u5b9a\u522a\u9664\uff1f"

    const-string v5, "\u4ef6\u306e\u30e9\u30f3\u30ad\u30f3\u30b0\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p1, v5, v3, v4}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Delete"

    const-string v3, "\u522a\u9664"

    const-string v4, "\u524a\u9664"

    invoke-static {p1, v4, v2, v3}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/Ranking190$$ExternalSyntheticLambda20;

    invoke-direct {v3, p1, p3, p0, p2}, Le/e/a/Ranking190$$ExternalSyntheticLambda20;-><init>(Landroid/app/Activity;Ljava/util/Set;Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 2

    .line 21
    new-instance p1, Le/e/a/Ranking190$$ExternalSyntheticLambda29;

    invoke-direct {p1, p0}, Le/e/a/Ranking190$$ExternalSyntheticLambda29;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, p1}, Le/e/a/Ranking190;->editGenres(Landroid/app/Activity;Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$20(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 2

    .line 41
    invoke-static {p0, p1}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$21(Landroid/app/Activity;Ljava/util/Set;Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 41
    invoke-static {p0, p1}, Le/e/a/Ranking190;->deletePresets(Landroid/content/Context;Ljava/util/Set;)V

    iget-object p1, p2, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p2, Le/e/a/Ranking190$Manager;->selecting:Z

    invoke-static {p0, p3}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {p0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    return-void
.end method

.method static synthetic lambda$22(Le/e/a/Ranking190$Manager;Ljava/lang/String;Ljava/lang/Runnable;Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 43
    iget-object p0, p0, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    if-eqz p4, :cond_8

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_8
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_b
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$23(Le/e/a/Ranking190$Manager;Landroid/widget/CheckBox;Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 6

    .line 44
    iget-boolean p0, p0, Le/e/a/Ranking190$Manager;->selecting:Z

    if-eqz p0, :cond_8

    invoke-virtual {p1}, Landroid/widget/CheckBox;->toggle()V

    goto :goto_10

    :cond_8
    new-instance p0, Le/e/a/Ranking190$$ExternalSyntheticLambda0;

    invoke-direct {p0, p2, p4}, Le/e/a/Ranking190$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-static {p2, p3, p0}, Le/e/a/Ranking190;->editPreset(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/Runnable;)V

    :goto_10
    return-void
.end method

.method static synthetic lambda$24(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 2

    .line 44
    invoke-static {p0, p1}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$25(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 4

    .line 45
    invoke-static {p0, p1, p2}, Le/e/a/Ranking190;->presetActions(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic lambda$26(Ljava/lang/String;Landroid/widget/LinearLayout;Landroid/view/View;)Z
    .registers 7

    .line 45
    const-string p2, "ranking"

    invoke-static {p2, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    new-instance v0, Le/e/a/Ranking190$2;

    invoke-direct {v0, p1}, Le/e/a/Ranking190$2;-><init>(Landroid/view/View;)V

    const v1, 0x3f0ccccd    # 0.55f

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    const/4 v3, 0x0

    if-lt v1, v2, :cond_1d

    invoke-virtual {p1, p2, v0, p0, v3}, Landroid/widget/LinearLayout;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    goto :goto_21

    :cond_1d
    invoke-virtual {p1, p2, v0, p0, v3}, Landroid/widget/LinearLayout;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    :goto_21
    if-nez p0, :cond_28

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    :cond_28
    return p0
.end method

.method static synthetic lambda$27(Landroid/widget/LinearLayout;Landroid/view/View;)Z
    .registers 2

    .line 45
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->performLongClick()Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$28(Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 22

    .line 49
    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    iget-boolean v4, v0, Le/e/a/Ranking190$Manager;->selecting:Z

    const/4 v5, 0x0

    if-nez v4, :cond_126

    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Ljava/lang/String;

    if-nez v4, :cond_16

    goto/16 :goto_126

    :cond_16
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getAction()I

    move-result v6

    const/4 v7, 0x4

    const/4 v8, 0x1

    if-ne v6, v7, :cond_43

    const/4 v0, 0x0

    :goto_25
    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_2c

    return v8

    :cond_2c
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/lang/String;

    if-eqz v3, :cond_40

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_40
    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    :cond_43
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getAction()I

    move-result v6

    const/4 v9, 0x2

    const/4 v10, 0x3

    if-eq v6, v9, :cond_52

    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getAction()I

    move-result v6

    if-eq v6, v10, :cond_52

    return v8

    .line 50
    :cond_52
    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getY()F

    move-result v6

    invoke-virtual/range {p2 .. p2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v9

    int-to-float v9, v9

    sub-float v9, v6, v9

    const/16 v11, 0x24

    invoke-static {v3, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    int-to-float v12, v12

    const/16 v13, 0xc

    cmpg-float v12, v9, v12

    if-gez v12, :cond_73

    invoke-static {v3, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    neg-int v9, v9

    :goto_6f
    invoke-virtual {v2, v5, v9}, Landroid/widget/ScrollView;->scrollBy(II)V

    goto :goto_86

    :cond_73
    invoke-virtual/range {p2 .. p2}, Landroid/widget/ScrollView;->getHeight()I

    move-result v12

    invoke-static {v3, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    sub-int/2addr v12, v11

    int-to-float v11, v12

    cmpl-float v9, v9, v11

    if-lez v9, :cond_86

    invoke-static {v3, v13}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    goto :goto_6f

    .line 51
    :cond_86
    :goto_86
    const/4 v9, 0x0

    :goto_87
    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v11

    if-lt v9, v11, :cond_10f

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_90
    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v13

    if-lt v11, v13, :cond_97

    goto :goto_c2

    :cond_97
    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v14

    instance-of v14, v14, Ljava/lang/String;

    if-nez v14, :cond_a4

    goto :goto_10c

    :cond_a4
    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v9

    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v12

    add-int/2addr v9, v12

    int-to-float v9, v9

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v9, v12

    cmpl-float v9, v6, v9

    if-lez v9, :cond_b7

    const/4 v12, 0x1

    goto :goto_b8

    :cond_b7
    const/4 v12, 0x0

    :goto_b8
    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v9, v6, v9

    if-gez v9, :cond_10b

    move-object v9, v13

    .line 52
    :goto_c2
    if-eqz v9, :cond_10a

    invoke-static/range {p3 .. p3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    const v5, 0xffffff

    and-int/2addr v1, v5

    const/high16 v5, 0x33000000

    or-int/2addr v1, v5

    invoke-static {v3, v1, v7}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual/range {p6 .. p6}, Landroid/view/DragEvent;->getAction()I

    move-result v1

    if-ne v1, v10, :cond_10a

    const-string v1, "ranking_presets_v190"

    invoke-static {v3, v1}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v4, v6, v12}, Le/e/a/RankingCatalog190;->move(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONArray;

    move-result-object v4

    invoke-static/range {p3 .. p3}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-virtual {v4}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v1, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual/range {p2 .. p2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v1

    iput v1, v0, Le/e/a/Ranking190$Manager;->scroll:I

    invoke-static/range {p3 .. p4}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    :cond_10a
    return v8

    .line 51
    :cond_10b
    move-object v9, v13

    :goto_10c
    add-int/lit8 v11, v11, 0x1

    goto :goto_90

    :cond_10f
    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v11

    instance-of v11, v11, Ljava/lang/String;

    if-eqz v11, :cond_122

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11, v5}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_122
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_87

    .line 49
    :cond_126
    :goto_126
    return v5
.end method

.method static synthetic lambda$29(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 54
    if-nez p4, :cond_b

    new-instance p3, Le/e/a/Ranking190$$ExternalSyntheticLambda21;

    invoke-direct {p3, p0, p2}, Le/e/a/Ranking190$$ExternalSyntheticLambda21;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-static {p0, p1, p3}, Le/e/a/Ranking190;->editPreset(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/Runnable;)V

    goto :goto_55

    :cond_b
    const/4 p3, 0x3

    if-ne p4, p3, :cond_4a

    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    const-string p4, "Delete this ranking?"

    const-string v0, "\u522a\u9664\u6b64\u6392\u884c\u699c\uff1f"

    const-string v1, "\u3053\u306e\u30e9\u30f3\u30ad\u30f3\u30b0\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p0, v1, p4, v0}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    const-string p4, "Delete"

    const-string v0, "\u522a\u9664"

    const-string v1, "\u524a\u9664"

    invoke-static {p0, v1, p4, v0}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda22;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/Ranking190$$ExternalSyntheticLambda22;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V

    invoke-virtual {p3, p4, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    goto :goto_55

    :cond_4a
    const/4 p3, 0x1

    if-ne p4, p3, :cond_4e

    const/4 p3, -0x1

    :cond_4e
    const/4 p4, 0x0

    invoke-static {p0, p1, p4, p3}, Le/e/a/Ranking190;->savePreset(Landroid/content/Context;Lorg/json/JSONObject;ZI)V

    invoke-static {p0, p2}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    :goto_55
    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;)V
    .registers 1

    .line 21
    invoke-static {p0}, Le/e/a/Ranking190;->populate(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$30(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 2

    .line 54
    invoke-static {p0, p1}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$31(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 54
    const-string p3, "id"

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/Ranking190;->deletePresets(Landroid/content/Context;Ljava/util/Set;)V

    invoke-static {p0, p2}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$32(Landroid/widget/LinearLayout;Ljava/util/ArrayList;Landroid/content/Context;[Ljava/lang/Runnable;)V
    .registers 9

    .line 57
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_e

    return-void

    :cond_e
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "tag"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " \u00b7 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "mode"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p2, v4}, Le/e/a/Ranking190;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "source"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v3}, Le/e/a/Ranking190;->source(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Le/e/a/Ranking190$$ExternalSyntheticLambda32;

    invoke-direct {v3, p2, p1, v1, p3}, Le/e/a/Ranking190$$ExternalSyntheticLambda32;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_7
.end method

.method static synthetic lambda$33(Landroid/content/Context;Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 9

    .line 57
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p4

    const-string v0, "Edit condition"

    const-string v1, "\u7de8\u8f2f\u689d\u4ef6"

    const-string v2, "\u6761\u4ef6\u3092\u7de8\u96c6"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Delete"

    const-string v2, "\u522a\u9664"

    const-string v3, "\u524a\u9664"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/Ranking190$$ExternalSyntheticLambda28;

    invoke-direct {v1, p1, p2, p3, p0}, Le/e/a/Ranking190$$ExternalSyntheticLambda28;-><init>(Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;Landroid/content/Context;)V

    invoke-virtual {p4, v0, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic lambda$34(Ljava/util/ArrayList;Lorg/json/JSONObject;[Ljava/lang/Runnable;Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 57
    const/4 p4, 0x1

    const/4 v0, 0x0

    if-ne p5, p4, :cond_d

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    aget-object p0, p2, v0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_12

    :cond_d
    aget-object p2, p2, v0

    invoke-static {p3, p1, p0, p2}, Le/e/a/Ranking190;->editRule(Landroid/content/Context;Lorg/json/JSONObject;Ljava/util/ArrayList;Ljava/lang/Runnable;)V

    :goto_12
    return-void
.end method

.method static synthetic lambda$35(Landroid/content/Context;Ljava/util/ArrayList;[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 4

    .line 57
    const/4 p3, 0x0

    aget-object p2, p2, p3

    const/4 p3, 0x0

    invoke-static {p0, p3, p1, p2}, Le/e/a/Ranking190;->editRule(Landroid/content/Context;Lorg/json/JSONObject;Ljava/util/ArrayList;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$36(Lorg/json/JSONObject;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 11

    .line 57
    :try_start_0
    new-instance p7, Lorg/json/JSONObject;

    invoke-direct {p7}, Lorg/json/JSONObject;-><init>()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_81

    const-string v0, "id"

    if-nez p0, :cond_12

    :try_start_9
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_16

    :cond_12
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_16
    invoke-virtual {p7, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p7, "name"

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    new-instance p7, Lorg/json/JSONArray;

    invoke-direct {p7}, Lorg/json/JSONArray;-><init>()V

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_3a
    :goto_3a
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6d

    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_44
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_63

    const-string p2, "genres"

    invoke-virtual {p0, p2, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "rules"

    invoke-virtual {p2, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {p0}, Le/e/a/RankingRules190;->validate(Lorg/json/JSONObject;)V

    const/4 p2, 0x0

    invoke-static {p4, p0, p2, p2}, Le/e/a/Ranking190;->savePreset(Landroid/content/Context;Lorg/json/JSONObject;ZI)V

    invoke-virtual {p5}, Landroid/app/AlertDialog;->dismiss()V

    invoke-interface {p6}, Ljava/lang/Runnable;->run()V

    goto :goto_89

    :cond_63
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {v0, p3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_44

    :cond_6d
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-virtual {v1}, Landroid/widget/CheckBox;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p7, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_80} :catch_81

    goto :goto_3a

    :catch_81
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_89
    return-void
.end method

.method static synthetic lambda$37(Landroid/widget/EditText;Landroid/content/Context;[Ljava/lang/String;Landroid/widget/Spinner;[Ljava/lang/String;Landroid/widget/Spinner;Lorg/json/JSONObject;Ljava/util/ArrayList;Landroid/app/AlertDialog;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 12

    .line 60
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p10

    invoke-virtual {p10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p10

    invoke-virtual {p10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p10

    invoke-virtual {p10}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_20

    const-string p2, "Enter a tag"

    const-string p3, "\u8acb\u8f38\u5165\u6a19\u7c64"

    const-string p4, "\u30bf\u30b0\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p1, p4, p2, p3}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_20
    :try_start_20
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string p1, "tag"

    invoke-virtual {p0, p1, p10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "mode"

    invoke-virtual {p3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p3

    aget-object p2, p2, p3

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "source"

    invoke-virtual {p5}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p2

    aget-object p2, p4, p2

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p6, :cond_49

    invoke-virtual {p7, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_50

    :cond_49
    invoke-virtual {p7, p6}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {p7, p1, p0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_50
    invoke-virtual {p8}, Landroid/app/AlertDialog;->dismiss()V

    invoke-interface {p9}, Ljava/lang/Runnable;->run()V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_56} :catch_57

    goto :goto_58

    :catch_57
    move-exception p0

    :goto_58
    return-void
.end method

.method static synthetic lambda$4(Landroid/widget/LinearLayout;Ljava/util/ArrayList;Landroid/content/Context;[Ljava/lang/Runnable;)V
    .registers 15

    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_c

    return-void

    :cond_c
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v4, "\u2261"

    const/16 v5, 0x16

    invoke-static {p2, v4, v5}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x20

    invoke-static {p2, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Le/e/a/Ranking190$$ExternalSyntheticLambda14;

    invoke-direct {v5, v3}, Le/e/a/Ranking190$$ExternalSyntheticLambda14;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v4, Landroid/widget/CheckBox;

    invoke-direct {v4, p2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v5, "id"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/RankingRules190;->name(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "name"

    invoke-virtual {v2, v6, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const-string v5, "visible"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-static {v4}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    new-instance v5, Le/e/a/Ranking190$$ExternalSyntheticLambda15;

    invoke-direct {v5, v2}, Le/e/a/Ranking190$$ExternalSyntheticLambda15;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, -0x2

    invoke-direct {v5, v0, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    filled-new-array {v7, v6}, [I

    move-result-object v4

    const/4 v5, 0x0

    :goto_81
    const/4 v6, 0x2

    if-lt v5, v6, :cond_93

    new-instance v4, Le/e/a/Ranking190$$ExternalSyntheticLambda17;

    invoke-direct {v4, v2, v3}, Le/e/a/Ranking190$$ExternalSyntheticLambda17;-><init>(Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_5

    :cond_93
    aget v6, v4, v5

    if-gez v6, :cond_9a

    const-string v7, "\u2191"

    goto :goto_9c

    :cond_9a
    const-string v7, "\u2193"

    :goto_9c
    invoke-static {p2, v7}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0x2c

    invoke-static {p2, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v8, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Le/e/a/Ranking190$$ExternalSyntheticLambda16;

    invoke-direct {v8, p1, v2, v6, p3}, Le/e/a/Ranking190$$ExternalSyntheticLambda16;-><init>(Ljava/util/ArrayList;Lorg/json/JSONObject;I[Ljava/lang/Runnable;)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_81
.end method

.method static synthetic lambda$5(Landroid/widget/LinearLayout;Landroid/view/View;)Z
    .registers 2

    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->performLongClick()Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$6(Lorg/json/JSONObject;Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 24
    :try_start_0
    const-string p1, "visible"

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_7

    :catch_6
    move-exception p0

    :goto_7
    return-void
.end method

.method static synthetic lambda$7(Ljava/util/ArrayList;Lorg/json/JSONObject;I[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 5

    .line 24
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    add-int/2addr p2, p1

    if-ltz p2, :cond_16

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p4

    if-ge p2, p4, :cond_16

    invoke-static {p0, p1, p2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    const/4 p0, 0x0

    aget-object p0, p3, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_16
    return-void
.end method

.method static synthetic lambda$8(Lorg/json/JSONObject;Landroid/widget/LinearLayout;Landroid/view/View;)Z
    .registers 7

    .line 24
    const-string p2, "id"

    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "genre"

    invoke-static {v0, p2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    new-instance v0, Le/e/a/Ranking190$1;

    invoke-direct {v0, p1}, Le/e/a/Ranking190$1;-><init>(Landroid/view/View;)V

    const v1, 0x3f0ccccd    # 0.55f

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    const/4 v3, 0x0

    if-lt v1, v2, :cond_23

    invoke-virtual {p1, p2, v0, p0, v3}, Landroid/widget/LinearLayout;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    goto :goto_27

    :cond_23
    invoke-virtual {p1, p2, v0, p0, v3}, Landroid/widget/LinearLayout;->startDrag(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p0

    :goto_27
    if-nez p0, :cond_2e

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    :cond_2e
    return p0
.end method

.method static synthetic lambda$9(Landroid/widget/ScrollView;Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/util/ArrayList;[Ljava/lang/Runnable;Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 11

    .line 25
    invoke-virtual {p6}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p5

    instance-of p5, p5, Lorg/json/JSONObject;

    const/4 v0, 0x0

    if-nez p5, :cond_a

    return v0

    :cond_a
    invoke-virtual {p6}, Landroid/view/DragEvent;->getAction()I

    move-result p5

    const/4 v1, 0x2

    if-ne p5, v1, :cond_7d

    invoke-virtual {p6}, Landroid/view/DragEvent;->getY()F

    move-result p5

    invoke-virtual {p0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr p5, v1

    const/16 v1, 0x24

    invoke-static {p1, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    const/16 v3, 0xc

    cmpg-float v2, p5, v2

    if-gez v2, :cond_31

    invoke-static {p1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p5

    neg-int p5, p5

    :goto_2d
    invoke-virtual {p0, v0, p5}, Landroid/widget/ScrollView;->scrollBy(II)V

    goto :goto_44

    :cond_31
    invoke-virtual {p0}, Landroid/widget/ScrollView;->getHeight()I

    move-result v2

    invoke-static {p1, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    sub-int/2addr v2, v1

    int-to-float v1, v2

    cmpl-float p5, p5, v1

    if-lez p5, :cond_44

    invoke-static {p1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p5

    goto :goto_2d

    :cond_44
    :goto_44
    const/4 p0, 0x0

    :goto_45
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p5

    if-lt p0, p5, :cond_4c

    goto :goto_7d

    :cond_4c
    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    invoke-virtual {p6}, Landroid/view/DragEvent;->getY()F

    move-result v1

    invoke-virtual {p5}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_76

    invoke-virtual {p6}, Landroid/view/DragEvent;->getY()F

    move-result v1

    invoke-virtual {p5}, Landroid/view/View;->getBottom()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_76

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v2, 0x44000000    # 512.0f

    or-int/2addr v1, v2

    goto :goto_77

    :cond_76
    const/4 v1, 0x0

    :goto_77
    invoke-virtual {p5, v1}, Landroid/view/View;->setBackgroundColor(I)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_45

    :cond_7d
    :goto_7d
    invoke-virtual {p6}, Landroid/view/DragEvent;->getAction()I

    move-result p0

    const/4 p1, 0x4

    if-ne p0, p1, :cond_9f

    const/4 p0, 0x0

    :goto_85
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    if-lt p0, p1, :cond_8c

    goto :goto_9f

    :cond_8c
    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const/high16 p5, 0x3f800000    # 1.0f

    invoke-virtual {p1, p5}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_85

    :cond_9f
    :goto_9f
    invoke-virtual {p6}, Landroid/view/DragEvent;->getAction()I

    move-result p0

    const/4 p1, 0x3

    const/4 p5, 0x1

    if-ne p0, p1, :cond_e3

    invoke-virtual {p6}, Landroid/view/DragEvent;->getLocalState()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, p5

    const/4 v1, 0x0

    :goto_b3
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_ba

    goto :goto_cc

    :cond_ba
    invoke-virtual {p6}, Landroid/view/DragEvent;->getY()F

    move-result v2

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_e0

    move p1, v1

    :goto_cc
    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p3, p1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    aget-object p0, p4, v0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_e3

    :cond_e0
    add-int/lit8 v1, v1, 0x1

    goto :goto_b3

    :cond_e3
    :goto_e3
    return p5
.end method

.method static manager(Landroid/widget/LinearLayout;)Le/e/a/Ranking190$Manager;
    .registers 2

    .line 29
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Le/e/a/Ranking190$Manager;

    if-nez v0, :cond_10

    new-instance v0, Le/e/a/Ranking190$Manager;

    invoke-direct {v0}, Le/e/a/Ranking190$Manager;-><init>()V

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    :cond_10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/Ranking190$Manager;

    return-object p0
.end method

.method public static managerMenu(Landroid/app/Activity;Landroid/view/Menu;)Z
    .registers 7

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_custom_rankings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_e

    return v2

    :cond_e
    invoke-interface {p1}, Landroid/view/Menu;->clear()V

    :try_start_11
    const-string v0, "y"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/Ranking190;->manager(Landroid/widget/LinearLayout;)Le/e/a/Ranking190$Manager;

    move-result-object v1

    iget-boolean v2, v1, Le/e/a/Ranking190$Manager;->selecting:Z

    if-nez v2, :cond_35

    const-string v2, "\u8907\u6570\u9078\u629e"

    const-string v3, "Select multiple"

    const-string v4, "\u591a\u9078"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda30;

    invoke-direct {v2, v1, p0, v0}, Le/e/a/Ranking190$$ExternalSyntheticLambda30;-><init>(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    goto :goto_48

    :cond_35
    const-string v2, "\u9078\u629e\u3092\u7d42\u4e86"

    const-string v3, "Done selecting"

    const-string v4, "\u7d50\u675f\u9078\u53d6"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda31;

    invoke-direct {v2, v1, p0, v0}, Le/e/a/Ranking190$$ExternalSyntheticLambda31;-><init>(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    :goto_48
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_4b} :catch_4c

    goto :goto_54

    :catch_4c
    move-exception p0

    const-string p1, "nicoid-ranking"

    const-string v0, "Unable to configure ranking management menu"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_54
    const/4 p0, 0x1

    return p0
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 6

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidRankingActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    return-void

    :cond_11
    const/16 v0, 0x4a9c

    invoke-interface {p1, v0}, Landroid/view/Menu;->removeItem(I)V

    const-string v1, "Edit genres"

    const-string v2, "\u7de8\u8f2f\u5206\u985e"

    const-string v3, "\u30b8\u30e3\u30f3\u30eb\u306e\u7de8\u96c6"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0xa

    invoke-interface {p1, v2, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0}, Le/e/a/Ranking190$$ExternalSyntheticLambda18;-><init>(Landroid/app/Activity;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    return-void
.end method

.method static mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 58
    const-string v0, "any"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string p1, "Any (OR)"

    const-string v0, "\u5305\u542b\u4efb\u4e00"

    const-string v1, "\u3044\u305a\u308c\u304b\u3092\u542b\u3080"

    :goto_e
    invoke-static {p0, v1, p1, v0}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_29

    :cond_13
    const-string v0, "exclude"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    const-string p1, "Exclude"

    const-string v0, "\u6392\u9664"

    const-string v1, "\u9664\u5916\u3059\u308b"

    goto :goto_e

    :cond_22
    const-string p1, "All (AND)"

    const-string v0, "\u5305\u542b\u5168\u90e8"

    const-string v1, "\u3059\u3079\u3066\u542b\u3080"

    goto :goto_e

    :goto_29
    return-object p0
.end method

.method public static open(Landroid/app/Activity;)Z
    .registers 10

    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_custom_rankings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_e

    return v2

    :cond_e
    const/4 v0, 0x1

    :try_start_f
    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {v1}, Le/e/a/Ranking190;->fill(Landroid/view/View;)V

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "y"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "H"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "I"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    const-string v3, "O"

    invoke-static {p0, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    new-array v6, v0, [Ljava/lang/Class;

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    const-string v6, "\u30ab\u30b9\u30bf\u30e0\u30e9\u30f3\u30ad\u30f3\u30b0"

    const-string v7, "Custom rankings"

    const-string v8, "\u81ea\u8a02\u6392\u884c\u699c"

    invoke-static {p0, v6, v7, v8}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "c"

    new-array v6, v0, [Ljava/lang/Class;

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    const-string v6, ""

    aput-object v6, v5, v2

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, v1}, Le/e/a/Ranking190;->showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_86} :catch_87

    return v0

    :catch_87
    move-exception p0

    const-string v1, "nicoid-ranking"

    const-string v2, "Unable to open custom rankings"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method public static populate(Ljava/lang/Object;)V
    .registers 9

    .line 17
    const-string v0, "id"

    :try_start_2
    check-cast p0, Landroid/app/Activity;

    sget-object v1, Le/e/a/Ranking190;->SNAPSHOTS:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/Ranking190;->snapshot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "z"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-static {p0}, Le/e/a/Ranking190;->genres(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    :goto_1d
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_46

    const-string v0, "nicoid-custom"

    const-string v2, "\u30ab\u30b9\u30bf\u30e0\u30e9\u30f3\u30ad\u30f3\u30b0\u306e\u4f5c\u6210\u30fb\u7de8\u96c6"

    const-string v3, "Create / edit custom rankings"

    const-string v4, "\u5efa\u7acb\uff0f\u7de8\u8f2f\u81ea\u8a02\u6392\u884c\u699c"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v0, v2}, Le/e/a/Ranking190;->category(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda33;

    invoke-direct {v2, p0, v1}, Le/e/a/Ranking190$$ExternalSyntheticLambda33;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;)V

    invoke-static {p0}, Le/e/a/Revision201;->rankingChanged(Landroid/app/Activity;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    goto :goto_73

    .line 17
    :cond_46
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "visible"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_68

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "name"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le/e/a/RankingRules190;->name(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v1, v5, v4}, Le/e/a/Ranking190;->category(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_68} :catch_6b

    :cond_68
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 19
    :catch_6b
    move-exception p0

    const-string v0, "nicoid-ranking"

    const-string v1, "Unable to restore genres"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_73
    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 14
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static presetActions(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 10

    .line 54
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Edit"

    const-string v2, "\u7de8\u8f2f"

    const-string v3, "\u7de8\u96c6"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Move up"

    const-string v3, "\u5411\u4e0a\u79fb\u52d5"

    const-string v4, "\u4e0a\u3078\u79fb\u52d5"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Move down"

    const-string v4, "\u5411\u4e0b\u79fb\u52d5"

    const-string v5, "\u4e0b\u3078\u79fb\u52d5"

    invoke-static {p0, v5, v3, v4}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Delete"

    const-string v5, "\u522a\u9664"

    const-string v6, "\u524a\u9664"

    invoke-static {p0, v6, v4, v5}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda24;

    invoke-direct {v2, p0, p2, p1}, Le/e/a/Ranking190$$ExternalSyntheticLambda24;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static resume(Landroid/app/Activity;)V
    .registers 3

    .line 10
    invoke-static {p0}, Le/e/a/Ranking190;->snapshot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le/e/a/Ranking190;->SNAPSHOTS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    invoke-static {p0}, Le/e/a/Ranking190;->populate(Ljava/lang/Object;)V

    :cond_13
    return-void
.end method

.method static savePreset(Landroid/content/Context;Lorg/json/JSONObject;ZI)V
    .registers 13

    .line 56
    const-string v0, "ranking_presets_v190"

    invoke-static {p0, v0}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, -0x1

    const/4 v5, 0x0

    :goto_12
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v5, v6, :cond_57

    if-gez v4, :cond_1f

    if-nez p2, :cond_1f

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1f
    if-eqz p3, :cond_2f

    if-ltz v4, :cond_2f

    add-int/2addr p3, v4

    if-ltz p3, :cond_2f

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p3, p1, :cond_2f

    invoke-static {v3, v4, p3}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    :cond_2f
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_33
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_4d

    invoke-static {p0}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_4d
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_33

    :cond_57
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_5e

    :goto_5d
    goto :goto_79

    :cond_5e
    const-string v7, "id"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_76

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz p2, :cond_75

    goto :goto_5d

    :cond_75
    move-object v6, p1

    :cond_76
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_79
    add-int/lit8 v5, v5, 0x1

    goto :goto_12
.end method

.method static showPresets(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 24

    .line 32
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-static/range {p1 .. p1}, Le/e/a/Ranking190;->manager(Landroid/widget/LinearLayout;)Le/e/a/Ranking190$Manager;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v9, 0x0

    invoke-virtual {v7, v9, v9, v9, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static/range {p1 .. p1}, Le/e/a/Ranking190;->fill(Landroid/view/View;)V

    const/16 v10, 0x10

    invoke-static {v6, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    .line 33
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v6}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    const-string v4, "Saved rankings"

    const-string v5, "\u5df2\u5efa\u7acb\u7684\u6392\u884c\u699c"

    const-string v11, "\u4f5c\u6210\u6e08\u307f\u306e\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {v6, v11, v4, v5}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/16 v11, 0xe

    invoke-static {v6, v4, v11}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v5

    invoke-static {v5}, Le/e/a/DialogColors;->muted(Z)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    new-instance v12, Landroid/widget/ScrollView;

    invoke-direct {v12, v6}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v13

    const/16 v4, 0x50

    invoke-static {v6, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v13, v9, v9, v9, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v12, v13}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v5, v3, v9, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v12, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget v5, v8, Le/e/a/Ranking190$Manager;->scroll:I

    invoke-virtual {v12}, Landroid/widget/ScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v15

    new-instance v14, Le/e/a/Ranking190$$ExternalSyntheticLambda2;

    invoke-direct {v14, v8, v12}, Le/e/a/Ranking190$$ExternalSyntheticLambda2;-><init>(Le/e/a/Ranking190$Manager;Landroid/widget/ScrollView;)V

    invoke-virtual {v15, v14}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    new-instance v14, Le/e/a/Ranking190$$ExternalSyntheticLambda5;

    invoke-direct {v14, v12, v5}, Le/e/a/Ranking190$$ExternalSyntheticLambda5;-><init>(Landroid/widget/ScrollView;I)V

    invoke-virtual {v12, v14}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 36
    const-string v5, "ranking_presets_v190"

    invoke-static {v6, v5}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    const/4 v15, 0x0

    :goto_94
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v10

    const-string v9, "id"

    if-lt v15, v10, :cond_28a

    iget-object v10, v8, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {v10, v5}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 37
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v15, 0x800015

    invoke-virtual {v10, v15}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v15, 0x8

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v10, v0, v15, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v10}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x2

    invoke-direct {v15, v3, v11, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v10, v15}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    const-string v1, ""

    const/16 v3, 0xe

    invoke-static {v6, v1, v3}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-static {v6, v1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v0, v3}, Landroid/widget/Button;->setPadding(IIII)V

    const/16 v15, 0x30

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setMinHeight(I)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    const v3, 0xffffff

    and-int/2addr v0, v3

    const/high16 v3, 0x44000000    # 512.0f

    or-int/2addr v0, v3

    const/16 v3, 0x1c

    invoke-static {v6, v0, v3}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 39
    iget-boolean v0, v8, Le/e/a/Ranking190$Manager;->selecting:Z

    if-eqz v0, :cond_10f

    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda6;

    invoke-direct {v0, v5, v8, v6, v7}, Le/e/a/Ranking190$$ExternalSyntheticLambda6;-><init>(Ljava/util/Set;Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    new-instance v3, Le/e/a/Ranking190$$ExternalSyntheticLambda7;

    invoke-direct {v3, v8, v6, v7}, Le/e/a/Ranking190$$ExternalSyntheticLambda7;-><init>(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-static {v4, v0, v3}, Le/e/a/SelectionUi191;->header(Landroid/widget/TextView;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    const-string v0, "Delete"

    const-string v2, "\u522a\u9664"

    const-string v3, "\u524a\u9664"

    goto :goto_115

    :cond_10f
    const-string v0, "\uff0b Create"

    const-string v2, "\uff0b \u65b0\u589e"

    const-string v3, "\uff0b \u65b0\u898f\u4f5c\u6210"

    :goto_115
    invoke-static {v6, v3, v0, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v0, v11, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    new-instance v10, Le/e/a/Ranking190$$ExternalSyntheticLambda8;

    invoke-direct {v10, v4, v8, v5, v1}, Le/e/a/Ranking190$$ExternalSyntheticLambda8;-><init>(Landroid/widget/TextView;Le/e/a/Ranking190$Manager;Ljava/util/Set;Landroid/widget/Button;)V

    invoke-interface {v10}, Ljava/lang/Runnable;->run()V

    .line 41
    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda9;

    invoke-direct {v0, v8, v6, v7}, Le/e/a/Ranking190$$ExternalSyntheticLambda9;-><init>(Le/e/a/Ranking190$Manager;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    const/4 v5, 0x0

    :goto_139
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v5, v0, :cond_169

    .line 48
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_158

    const-string v0, "Create a ranking with genres and tag conditions"

    const-string v1, "\u9078\u64c7\u5206\u985e\u548c\u6a19\u7c64\u689d\u4ef6\u5efa\u7acb\u6392\u884c\u699c"

    const-string v2, "\u30b8\u30e3\u30f3\u30eb\u3068\u30bf\u30b0\u6761\u4ef6\u3092\u6307\u5b9a\u3057\u3066\u4f5c\u6210\u3067\u304d\u307e\u3059"

    invoke-static {v6, v2, v0, v1}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0xe

    invoke-static {v6, v0, v4}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 49
    :cond_158
    new-instance v9, Le/e/a/Ranking190$$ExternalSyntheticLambda4;

    move-object v0, v9

    move-object v1, v8

    move-object v2, v13

    move-object v3, v12

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/Ranking190$$ExternalSyntheticLambda4;-><init>(Le/e/a/Ranking190$Manager;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v13, v9}, Landroid/widget/LinearLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 53
    return-void

    .line 42
    :cond_169
    const/16 v4, 0xe

    invoke-virtual {v14, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_180

    move/from16 v21, v5

    move-object/from16 v18, v10

    move-object/from16 v19, v12

    const/16 v2, 0x30

    const/4 v12, -0x2

    const/16 v17, 0x0

    const/16 v20, 0xe

    goto/16 :goto_27f

    :cond_180
    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const/16 v0, 0x10

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v0, 0x38

    invoke-static {v6, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 43
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-boolean v4, v8, Le/e/a/Ranking190$Manager;->selecting:Z

    if-eqz v4, :cond_1ca

    invoke-static {v0}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    iget-object v4, v8, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x28

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v4, v15, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Le/e/a/Ranking190$$ExternalSyntheticLambda10;

    invoke-direct {v4, v8, v2, v10}, Le/e/a/Ranking190$$ExternalSyntheticLambda10;-><init>(Le/e/a/Ranking190$Manager;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    move-object/from16 v18, v0

    move-object/from16 v19, v2

    goto :goto_1ef

    :cond_1ca
    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, v6}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v15, Le/e/a/UiGlyph190;

    const-string v11, "filter"

    invoke-direct {v15, v6, v11}, Le/e/a/UiGlyph190;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v4, v15}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    move-object/from16 v18, v0

    const/16 v15, 0x18

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    move-object/from16 v19, v2

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v11, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    :goto_1ef
    const-string v0, "name"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v11, 0x10

    invoke-static {v6, v0, v11}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v15

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v4, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v0, v4, v2, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/Ranking190$$ExternalSyntheticLambda11;

    move-object/from16 v16, v18

    move-object v0, v2

    move-object v11, v1

    move-object v1, v8

    move-object/from16 v18, v10

    move-object/from16 v10, v19

    move-object/from16 v19, v12

    move-object v12, v2

    move-object/from16 v2, v16

    move-object/from16 v16, v3

    move-object/from16 v3, p0

    const/16 v17, 0x0

    const/16 v20, 0xe

    move-object/from16 v4, v16

    move/from16 v21, v5

    move-object/from16 v5, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/Ranking190$$ExternalSyntheticLambda11;-><init>(Le/e/a/Ranking190$Manager;Landroid/widget/CheckBox;Landroid/app/Activity;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V

    invoke-virtual {v15, v12}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    iget-boolean v0, v8, Le/e/a/Ranking190$Manager;->selecting:Z

    if-nez v0, :cond_276

    const-string v0, "\u22ee"

    const/16 v1, 0x18

    invoke-static {v6, v0, v1}, Le/e/a/RankingNote195;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const-string v1, "Edit"

    const-string v2, "\u7de8\u8f2f"

    const-string v3, "\u7de8\u96c6"

    invoke-static {v6, v3, v1, v2}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x30

    invoke-static {v6, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v12, -0x2

    invoke-direct {v1, v3, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/Ranking190$$ExternalSyntheticLambda12;

    move-object/from16 v3, v16

    invoke-direct {v1, v6, v7, v3}, Le/e/a/Ranking190$$ExternalSyntheticLambda12;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda13;

    invoke-direct {v0, v10, v11}, Le/e/a/Ranking190$$ExternalSyntheticLambda13;-><init>(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v0, Le/e/a/Ranking190$$ExternalSyntheticLambda3;

    invoke-direct {v0, v11}, Le/e/a/Ranking190$$ExternalSyntheticLambda3;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_279

    :cond_276
    const/16 v2, 0x30

    const/4 v12, -0x2

    .line 46
    :goto_279
    invoke-virtual {v13, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v13}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    .line 42
    :goto_27f
    add-int/lit8 v5, v21, 0x1

    move-object/from16 v10, v18

    move-object/from16 v12, v19

    const/4 v11, -0x2

    const/16 v15, 0x30

    goto/16 :goto_139

    .line 36
    :cond_28a
    move-object/from16 v19, v12

    const/16 v17, 0x0

    const/16 v20, 0xe

    invoke-virtual {v14, v15}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    if-eqz v10, :cond_29d

    invoke-virtual {v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_29d
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v12, v19

    const/4 v9, 0x0

    const/16 v10, 0x10

    const/16 v11, 0xe

    goto/16 :goto_94
.end method

.method static snapshot(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "ranking_genres_v190"

    const-string v3, "[]"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "ranking_presets_v190"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static source(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 59
    const-string v0, "locked"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string p1, "Locked tags"

    const-string v0, "\u9396\u5b9a\u6a19\u7c64"

    const-string v1, "\u30ed\u30c3\u30af\u30bf\u30b0"

    :goto_e
    invoke-static {p0, v1, p1, v0}, Le/e/a/Ranking190;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_29

    :cond_13
    const-string v0, "user"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    const-string p1, "User tags"

    const-string v0, "\u4f7f\u7528\u8005\u6a19\u7c64"

    const-string v1, "\u30e6\u30fc\u30b6\u30fc\u30bf\u30b0"

    goto :goto_e

    :cond_22
    const-string p1, "Both"

    const-string v0, "\u5169\u8005"

    const-string v1, "\u4e21\u65b9"

    goto :goto_e

    :goto_29
    return-object p0
.end method

.method public static startupIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 10

    .line 12
    const/4 v0, 0x0

    if-eqz p1, :cond_ae

    const-string v1, "custom-"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_d

    goto/16 :goto_ae

    :cond_d
    const-string v2, "ranking_presets_v190"

    invoke-static {p0, v2}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_15
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v4, v5, :cond_1c

    return-object v0

    :cond_1c
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_aa

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "id"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_aa

    :try_start_3b
    const-string v1, "e.e.a.RankingPeriod"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "savedTerm"

    const/4 v4, 0x1

    new-array v6, v4, [Ljava/lang/Class;

    const-class v7, Landroid/content/Context;

    aput-object v7, v6, v3

    invoke-virtual {v1, v2, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p0, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_5a} :catch_5b

    goto :goto_5e

    :catch_5b
    move-exception v0

    const-string v0, "24h"

    :goto_5e
    new-instance v1, Landroid/content/Intent;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "https://www.nicovideo.jp/ranking/genre/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "?term="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {v1, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v1, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "type"

    const/4 v0, 0x6

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "name"

    invoke-virtual {v5, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "subtitle"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_aa
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_15

    :cond_ae
    :goto_ae
    return-object v0
.end method

.method public static startupSettings(Landroid/preference/Preference;)V
    .registers 11

    .line 11
    const-string v0, "id"

    instance-of v1, p0, Landroid/preference/ListPreference;

    if-nez v1, :cond_7

    return-void

    :cond_7
    :try_start_7
    check-cast p0, Landroid/preference/ListPreference;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v4
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_1b} :catch_d3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_1d
    const-string v7, "custom-"

    if-eqz v3, :cond_3e

    :try_start_21
    array-length v8, v3

    if-lt v6, v8, :cond_25

    goto :goto_3e

    :cond_25
    aget-object v8, v3, v6

    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3b

    aget-object v7, v3, v6

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    aget-object v7, v4, v6

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3b
    add-int/lit8 v6, v6, 0x1

    goto :goto_1d

    :cond_3e
    :goto_3e
    invoke-virtual {p0}, Landroid/preference/ListPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "ranking_presets_v190"

    invoke-static {v3, v4}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v4, 0x0

    :goto_49
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v4, v6, :cond_85

    new-array v0, v5, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    new-array v0, v5, [Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_db

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_db

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_db

    const-string v0, "home"

    invoke-virtual {p0, v0}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_db

    :cond_85
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_cf

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_cf

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "name"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " / "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {v8}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_cf
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_cf} :catch_d3

    :cond_cf
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_49

    :catch_d3
    move-exception p0

    const-string v0, "nicoid-ranking"

    const-string v1, "Unable to configure startup choices"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_db
    :goto_db
    return-void
.end method

.method static stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 4

    .line 15
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-static {p0}, Le/e/a/Ranking190;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "[]"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    return-object v0

    :catch_10
    move-exception p0

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0
.end method

.method static term(Landroid/app/Activity;)Ljava/lang/String;
    .registers 2

    .line 20
    :try_start_0
    const-string v0, "E"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    return-object p0

    :catch_b
    move-exception p0

    const-string p0, "24h"

    return-object p0
.end method

.method static titleView(Landroid/view/View;)Landroid/widget/TextView;
    .registers 3

    .line 61
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_7

    check-cast p0, Landroid/widget/TextView;

    return-object p0

    :cond_7
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_23

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_e
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_15

    goto :goto_23

    :cond_15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/Ranking190;->titleView(Landroid/view/View;)Landroid/widget/TextView;

    move-result-object v1

    if-eqz v1, :cond_20

    return-object v1

    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_23
    :goto_23
    const/4 p0, 0x0

    return-object p0
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 13
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
