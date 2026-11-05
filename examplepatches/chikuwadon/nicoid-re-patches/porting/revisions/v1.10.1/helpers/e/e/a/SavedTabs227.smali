.class final Le/e/a/SavedTabs227;
.super Ljava/lang/Object;
.source "SavedTabs227.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SavedTabs227$Tab;
    }
.end annotation


# static fields
.field static final MAX:I = 0x40


# instance fields
.field selected:Ljava/lang/String;

.field final tabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/SavedTabs227$Tab;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 16

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    .line 7
    :try_start_e
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "tabs"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v2, 0x0

    if-eqz p1, :cond_82

    move v3, v2

    :goto_1d
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/16 v5, 0x40

    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-lt v3, v4, :cond_2a

    goto :goto_82

    :cond_2a
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_31

    :cond_30
    :goto_30
    goto :goto_7f

    :cond_31
    new-instance v5, Le/e/a/SavedTabs227$Tab;

    invoke-direct {v5, v4}, Le/e/a/SavedTabs227$Tab;-><init>(Lorg/json/JSONObject;)V

    iget-object v4, v5, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_30

    iget v4, v5, Le/e/a/SavedTabs227$Tab;->kind:I

    if-ltz v4, :cond_30

    iget v4, v5, Le/e/a/SavedTabs227$Tab;->kind:I

    const/4 v6, 0x3

    if-gt v4, v6, :cond_30

    const-string v7, "list"

    const-string v8, "playlist"

    const-string v9, "mypage"

    const-string v10, "nicorepo"

    const-string v11, "mylist"

    const-string v12, "following"

    const-string v13, "cache"

    filled-new-array/range {v7 .. v13}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    iget-object v6, v5, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-interface {v4, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    iget-object v4, v5, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, v4}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v4

    if-eqz v4, :cond_6e

    goto :goto_30

    :cond_6e
    iget v4, v5, Le/e/a/SavedTabs227$Tab;->type:I

    iget-object v6, v5, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v4, v6}, Le/e/a/TabUiRules244;->related(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_79

    goto :goto_30

    :cond_79
    iget-object v4, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :goto_7f
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    :cond_82
    :goto_82
    const-string p1, "selected"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p1

    if-nez p1, :cond_aa

    iget-object p1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_9b

    :goto_9a
    goto :goto_a6

    :cond_9b
    iget-object p1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/SavedTabs227$Tab;

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    goto :goto_9a

    :goto_a6
    iput-object v0, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;
    :try_end_a8
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_a8} :catch_a9

    goto :goto_aa

    :catch_a9
    move-exception p1

    :cond_aa
    :goto_aa
    return-void
.end method


# virtual methods
.method add(Le/e/a/SavedTabs227$Tab;)V
    .registers 5

    .line 9
    iget-object v0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x40

    if-ge v0, v1, :cond_2a

    iget-object v0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {p0, v2}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget-object v2, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v1, v2}, Le/e/a/TabOrder113;->insertAfter(II)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iput-object p1, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    return-void

    :cond_2a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Tab limit"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;
    .registers 5

    .line 8
    iget-object v0, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_e

    const/4 p1, 0x0

    return-object p1

    :cond_e
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SavedTabs227$Tab;

    iget-object v2, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    return-object v1
.end method

.method remove(Ljava/lang/String;)V
    .registers 4

    .line 10
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_b

    const/4 v0, -0x1

    goto :goto_1b

    :cond_b
    iget-object v1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SavedTabs227$Tab;

    iget-object v1, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d

    :goto_1b
    if-gez v0, :cond_1e

    return-void

    :cond_1e
    iget-object v1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4c

    iget-object p1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_36

    const-string p1, ""

    goto :goto_4a

    :cond_36
    iget-object p1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/TabOrder113;->afterRemoval(II)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/SavedTabs227$Tab;

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    :goto_4a
    iput-object p1, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    :cond_4c
    return-void

    :cond_4d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method save()Ljava/lang/String;
    .registers 4

    .line 11
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iget-object v1, p0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_29

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "tabs"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "selected"

    iget-object v2, p0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/SavedTabs227$Tab;

    invoke-virtual {v2}, Le/e/a/SavedTabs227$Tab;->json()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_36
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_36} :catch_37

    goto :goto_b

    :catch_37
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
