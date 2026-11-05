.class public final Le/e/a/ContentFilterId193;
.super Ljava/lang/Object;
.source "ContentFilterId193.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ContentFilterId193$Rule;
    }
.end annotation


# static fields
.field static final ROWS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final VIDEOS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static volatile compiled:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/ContentFilterId193$Rule;",
            ">;"
        }
    .end annotation
.end field

.field static volatile snapshot:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/ContentFilterId193;->ROWS:Ljava/util/Map;

    .line 6
    new-instance v0, Le/e/a/ContentFilterId193$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x80

    invoke-direct {v0, v3, v1, v2}, Le/e/a/ContentFilterId193$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/ContentFilterId193;->VIDEOS:Ljava/util/Map;

    .line 7
    const-string v0, ""

    sput-object v0, Le/e/a/ContentFilterId193;->snapshot:Ljava/lang/String;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Le/e/a/ContentFilterId193;->compiled:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blocked(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7

    .line 10
    invoke-static {p0}, Le/e/a/ContentFilterId193;->rules(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_10

    const/4 p0, 0x0

    return p0

    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ContentFilterId193$Rule;

    iget-boolean v1, v0, Le/e/a/ContentFilterId193$Rule;->enabled:Z

    if-nez v1, :cond_1b

    :cond_1a
    goto :goto_8

    :cond_1b
    iget v1, v0, Le/e/a/ContentFilterId193$Rule;->category:I

    const/4 v2, 0x1

    if-nez v1, :cond_29

    iget-object v0, v0, Le/e/a/ContentFilterId193$Rule;->name:Le/e/a/ContentFilterRules$Rule;

    invoke-virtual {v0, p1}, Le/e/a/ContentFilterRules$Rule;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    return v2

    :cond_29
    iget-boolean v1, v0, Le/e/a/ContentFilterId193$Rule;->emptyName:Z

    if-nez v1, :cond_35

    iget-object v1, v0, Le/e/a/ContentFilterId193$Rule;->name:Le/e/a/ContentFilterRules$Rule;

    invoke-virtual {v1, p2}, Le/e/a/ContentFilterRules$Rule;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    :cond_35
    iget-object v1, v0, Le/e/a/ContentFilterId193$Rule;->id:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_45

    iget-object v0, v0, Le/e/a/ContentFilterId193$Rule;->id:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_45
    return v2
.end method

.method public static capture(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 3

    .line 19
    invoke-static {p1}, Le/e/a/ContentFilterId193;->userId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Le/e/a/ContentFilterId193;->remember(Lorg/json/JSONObject;)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_13

    sget-object p1, Le/e/a/ContentFilterId193;->ROWS:Ljava/util/Map;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18

    :cond_13
    sget-object p1, Le/e/a/ContentFilterId193;->ROWS:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_18
    return-void
.end method

.method public static confirmOwner(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 15

    .line 21
    const/4 v0, 0x0

    if-eqz p1, :cond_c2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    goto/16 :goto_c2

    :cond_f
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    instance-of v2, v1, Landroid/app/Activity;

    if-nez v2, :cond_18

    return-void

    :cond_18
    const/4 v2, 0x0

    if-nez p2, :cond_1d

    move-object v3, v2

    goto :goto_25

    :cond_1d
    sget-object v3, Le/e/a/ContentFilterId193;->ROWS:Ljava/util/Map;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_25
    if-nez v3, :cond_3c

    if-eqz p2, :cond_3c

    sget-object v3, Le/e/a/ContentFilterId193;->VIDEOS:Ljava/util/Map;

    const-string v4, "videourl"

    invoke-static {p2, v4}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Ljava/lang/String;

    :cond_3c
    if-nez v3, :cond_40

    const-string v3, ""

    :cond_40
    invoke-static {p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object p2

    :goto_44
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const-string v5, "userId"

    const-string v6, "mode"

    const-string v7, "exact"

    const-string v8, "value"

    const-string v9, "category"

    const/4 v10, 0x1

    if-lt v0, v4, :cond_56

    goto :goto_81

    :cond_56
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_bf

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    if-ne v11, v10, :cond_bf

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_bf

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_bf

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_bf

    move-object v2, v4

    :goto_81
    if-nez v2, :cond_ab

    :try_start_83
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v8, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "enabled"

    invoke-virtual {p1, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_ab
    check-cast v1, Landroid/app/Activity;

    new-instance p1, Le/e/a/ContentFilterId193$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Le/e/a/ContentFilterId193$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    invoke-static {v1, p2, v2, v10, p1}, Le/e/a/FilterUi110;->edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V
    :try_end_b5
    .catch Lorg/json/JSONException; {:try_start_83 .. :try_end_b5} :catch_b6

    goto :goto_be

    :catch_b6
    move-exception p0

    const-string p1, "nicoid-filter"

    const-string p2, "Unable to prepare ID rule editor"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_be
    return-void

    :cond_bf
    add-int/lit8 v0, v0, 0x1

    goto :goto_44

    :cond_c2
    :goto_c2
    const-string p1, "\u6295\u7a3f\u8005\u540d\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static filter(Ljava/lang/Object;)V
    .registers 8

    const/4 v6, 0x0

    .line 22
    :try_start_1
    const-string v0, "d"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "b"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_1f
    if-gez v1, :cond_22

    goto :goto_86

    :cond_22
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "videourl"

    invoke-static {v2, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7b

    const-string v4, "/watch/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3f

    const-string v4, "/shorts/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3f

    goto :goto_7b

    :cond_3f
    sget-object v4, Le/e/a/ContentFilterId193;->ROWS:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-nez v4, :cond_56

    sget-object v4, Le/e/a/ContentFilterId193;->VIDEOS:Ljava/util/Map;

    invoke-static {v3}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    :cond_56
    const-string v3, "y"

    invoke-static {v2, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_60

    const/4 v3, 0x0

    goto :goto_64

    :cond_60
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_64
    const-string v5, "title"

    invoke-static {v2, v5}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v3, v4}, Le/e/a/ContentFilterId193;->blocked(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7b

    if-nez v6, :cond_78

    new-instance v2, Ljava/util/BitSet;

    invoke-direct {v2}, Ljava/util/BitSet;-><init>()V

    move-object v6, v2

    :cond_78
    invoke-virtual {v6, v1}, Ljava/util/BitSet;->set(I)V
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_7b} :catch_7e

    :cond_7b
    :goto_7b
    add-int/lit8 v1, v1, -0x1

    goto :goto_1f

    :catch_7e
    move-exception v2

    const-string v0, "nicoid-filter"

    const-string v1, "ID filter could not inspect rows"

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_86
    invoke-static {p0, v6}, Le/e/a/FilterRows194;->compact(Ljava/lang/Object;Ljava/util/BitSet;)V

    return-void
.end method

.method public static history(Lorg/json/JSONObject;)V
    .registers 4

    .line 20
    :try_start_0
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "latestWatch"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_38

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Le/e/a/ContentFilterId193;->videoId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "videourl"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-static {v0}, Le/e/a/ContentFilterId193;->userId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_38

    const-string v1, "nicoidOwnerUserId"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_36} :catch_37

    goto :goto_38

    :catch_37
    move-exception v0

    :cond_38
    :goto_38
    invoke-static {p0}, Le/e/a/ContentFilterId193;->remember(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static label(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 5

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "value"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "userId"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1e

    const-string p0, ""

    goto :goto_31

    :cond_1e
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "  ID: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/content/Context;)V
    .registers 3

    .line 21
    const-string v0, "NG\u30ea\u30b9\u30c8\u306b\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static remember(Lorg/json/JSONObject;)V
    .registers 3

    .line 18
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-static {p0}, Le/e/a/ContentFilterId193;->userId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ContentFilterId193;->videoId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1c

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1c

    sget-object v1, Le/e/a/ContentFilterId193;->VIDEOS:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    return-void
.end method

.method static declared-synchronized rules(Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/ContentFilterId193$Rule;",
            ">;"
        }
    .end annotation

    const-class v0, Le/e/a/ContentFilterId193;

    monitor-enter v0

    .line 9
    :try_start_3
    sget-object v1, Le/e/a/ContentFilterId193;->snapshot:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_41

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_45

    :try_start_10
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    :goto_16
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v3, v4, :cond_1d

    goto :goto_3d

    :cond_1d
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_21} :catch_3c
    .catchall {:try_start_10 .. :try_end_21} :catchall_45

    if-eqz v4, :cond_39

    :try_start_23
    new-instance v5, Le/e/a/ContentFilterId193$Rule;

    invoke-direct {v5, v4}, Le/e/a/ContentFilterId193$Rule;-><init>(Lorg/json/JSONObject;)V

    iget-boolean v4, v5, Le/e/a/ContentFilterId193$Rule;->emptyName:Z

    if-eqz v4, :cond_34

    iget-object v4, v5, Le/e/a/ContentFilterId193$Rule;->id:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_39

    :cond_34
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_37
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_23 .. :try_end_37} :catch_38
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_37} :catch_3c
    .catchall {:try_start_23 .. :try_end_37} :catchall_45

    goto :goto_39

    :catch_38
    move-exception v4

    :cond_39
    :goto_39
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :catch_3c
    move-exception v2

    :goto_3d
    :try_start_3d
    sput-object v1, Le/e/a/ContentFilterId193;->compiled:Ljava/util/List;

    sput-object p0, Le/e/a/ContentFilterId193;->snapshot:Ljava/lang/String;

    :cond_41
    sget-object p0, Le/e/a/ContentFilterId193;->compiled:Ljava/util/List;
    :try_end_43
    .catchall {:try_start_3d .. :try_end_43} :catchall_45

    monitor-exit v0

    return-object p0

    .line 9
    :catchall_45
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static userId(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 6

    .line 12
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    const-string v1, "nicoidOwnerUserId"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "[0-9]+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14

    return-object v1

    .line 13
    :cond_14
    const-string v1, "user"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "id"

    if-eqz v1, :cond_29

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_29

    return-object v1

    .line 14
    :cond_29
    const-string v1, "owner"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_5b

    const-string v1, "type"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "ownerType"

    invoke-virtual {p0, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "channel"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5b

    invoke-static {p0}, Le/e/a/ContentFilterId193;->userId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_50

    return-object v1

    :cond_50
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5b

    return-object p0

    .line 15
    :cond_5b
    return-object v0
.end method

.method static videoId(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 4

    .line 17
    const-string v0, "videoId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2c

    const-string v0, "video"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_27

    const-string v0, "videourl"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_2b

    :cond_27
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_2b
    move-object v0, p0

    :cond_2c
    return-object v0
.end method
