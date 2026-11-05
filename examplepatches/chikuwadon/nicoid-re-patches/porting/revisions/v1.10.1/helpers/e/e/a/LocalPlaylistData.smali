.class public final Le/e/a/LocalPlaylistData;
.super Ljava/lang/Object;
.source "LocalPlaylistData.java"


# instance fields
.field public final data:Lorg/json/JSONObject;

.field public final folders:Lorg/json/JSONArray;

.field public final groups:Lorg/json/JSONArray;

.field public final videos:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 6
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v1, Lorg/json/JSONObject;

    move-object/from16 v2, p1

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Le/e/a/LocalPlaylistData;->data:Lorg/json/JSONObject;

    iget-object v1, v0, Le/e/a/LocalPlaylistData;->data:Lorg/json/JSONObject;

    const-string v2, "folders"

    invoke-static {v1, v2}, Le/e/a/LocalPlaylistData;->array(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    iget-object v1, v0, Le/e/a/LocalPlaylistData;->data:Lorg/json/JSONObject;

    const-string v3, "videos"

    invoke-static {v1, v3}, Le/e/a/LocalPlaylistData;->array(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    iget-object v1, v0, Le/e/a/LocalPlaylistData;->data:Lorg/json/JSONObject;

    const-string v4, "groups"

    invoke-static {v1, v4}, Le/e/a/LocalPlaylistData;->array(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    .line 8
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_33
    iget-object v7, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    const-string v8, "name"

    const-string v9, "id"

    if-lt v6, v7, :cond_139

    .line 9
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 10
    const/4 v10, 0x0

    :goto_4a
    iget-object v11, v0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    const-string v12, ""

    if-lt v10, v11, :cond_ff

    .line 11
    const/4 v1, 0x0

    :goto_55
    iget-object v8, v0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lt v1, v8, :cond_71

    .line 12
    iget-object v1, v0, Le/e/a/LocalPlaylistData;->data:Lorg/json/JSONObject;

    iget-object v5, v0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, v0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    return-void

    .line 11
    :cond_71
    iget-object v8, v0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-static {v8, v1}, Le/e/a/LocalPlaylistData;->object(Lorg/json/JSONArray;I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v8, v9}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "videoId"

    invoke-static {v8, v11}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "url"

    invoke-static {v8, v13}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v11, v14}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_f7

    invoke-static {v13}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_f7

    invoke-interface {v7, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_ef

    const-string v10, "folder"

    invoke-virtual {v8, v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_ba

    invoke-interface {v6, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b2

    goto :goto_ba

    :cond_b2
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Missing folder identity"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_ba
    :goto_ba
    const-string v18, "videoinfo"

    const-string v19, "posttime"

    const-string v13, "folder"

    const-string v14, "title"

    const-string v15, "owner"

    const-string v16, "thumbnail"

    const-string v17, "length"

    filled-new-array/range {v13 .. v19}, [Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    :goto_cd
    const/4 v13, 0x7

    if-lt v11, v13, :cond_d3

    add-int/lit8 v1, v1, 0x1

    goto :goto_55

    :cond_d3
    aget-object v13, v10, v11

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_ec

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    instance-of v13, v13, Ljava/lang/String;

    if-eqz v13, :cond_e4

    goto :goto_ec

    :cond_e4
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Invalid video field"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_ec
    :goto_ec
    add-int/lit8 v11, v11, 0x1

    goto :goto_cd

    :cond_ef
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Duplicate video identity"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_f7
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Invalid playlist video"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 10
    :cond_ff
    iget-object v11, v0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-static {v11, v10}, Le/e/a/LocalPlaylistData;->object(Lorg/json/JSONArray;I)Lorg/json/JSONObject;

    move-result-object v11

    invoke-static {v11, v9}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v8}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    const-string v14, "group"

    invoke-virtual {v11, v14, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_127

    invoke-interface {v1, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_11f

    goto :goto_127

    :cond_11f
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Missing group"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_127
    :goto_127
    invoke-interface {v6, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_131

    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_4a

    :cond_131
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Duplicate folder identity"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 8
    :cond_139
    iget-object v7, v0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-static {v7, v6}, Le/e/a/LocalPlaylistData;->object(Lorg/json/JSONArray;I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-static {v7, v8}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v7, v9}, Le/e/a/LocalPlaylistData;->required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_150

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_33

    :cond_150
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Duplicate group"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static array(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 14
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    :cond_c
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Lorg/json/JSONArray;

    if-eqz p1, :cond_17

    check-cast p0, Lorg/json/JSONArray;

    return-object p0

    :cond_17
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid playlist array"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static object(Lorg/json/JSONArray;I)Lorg/json/JSONObject;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 15
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Lorg/json/JSONObject;

    if-eqz p1, :cond_b

    check-cast p0, Lorg/json/JSONObject;

    return-object p0

    :cond_b
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid playlist entry"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static required(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 16
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_11

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_11

    return-object p0

    :cond_11
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "Invalid playlist identity"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 21
    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylistData;->hasFolder(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_99

    invoke-static {p2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_91

    const-string v0, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_91

    const/4 v0, 0x0

    :goto_15
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const-string v2, "videoId"

    const-string v3, "folder"

    if-lt v0, v1, :cond_73

    iget-object v0, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "url"

    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "title"

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "owner"

    invoke-virtual {p1, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "thumbnail"

    invoke-virtual {p1, p2, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {p1, p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void

    :cond_73
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8e

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8e

    return-void

    :cond_8e
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_91
    new-instance p1, Lorg/json/JSONException;

    const-string p2, "Invalid video"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_99
    new-instance p1, Lorg/json/JSONException;

    const-string p2, "Missing folder"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public delete(Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-gez v0, :cond_b

    return-void

    :cond_b
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_22
    add-int/lit8 v0, v0, -0x1

    goto :goto_8
.end method

.method public folder(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 18
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "id"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-object v0
.end method

.method public group(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 25
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "id"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-object v0
.end method

.method public hasFolder(Ljava/lang/String;)Z
    .registers 7

    .line 20
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_c

    return v2

    :cond_c
    const/4 v1, 0x0

    :goto_d
    iget-object v3, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v1, v3, :cond_16

    return v0

    :cond_16
    iget-object v3, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    return v2

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method

.method public hasGroup(Ljava/lang/String;)Z
    .registers 7

    .line 24
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_c

    return v2

    :cond_c
    const/4 v1, 0x0

    :goto_d
    iget-object v3, p0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v1, v3, :cond_16

    return v0

    :cond_16
    iget-object v3, p0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29

    return v2

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method

.method public move(Ljava/util/Set;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 23
    invoke-virtual {p0, p2}, Le/e/a/LocalPlaylistData;->hasFolder(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6f

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/4 v1, 0x0

    :goto_c
    iget-object v2, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    const-string v3, "videoId"

    const-string v4, "id"

    const-string v5, "folder"

    if-lt v1, v2, :cond_4b

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_22
    if-gez v1, :cond_25

    return-void

    :cond_25
    iget-object v2, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_48

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_45

    iget-object v2, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    goto :goto_48

    :cond_45
    invoke-virtual {v2, v5, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_48
    :goto_48
    add-int/lit8 v1, v1, -0x1

    goto :goto_22

    :cond_4b
    iget-object v2, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6c

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6c

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_6c
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_6f
    new-instance p1, Lorg/json/JSONException;

    const-string p2, "Missing folder"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public movePlaylist(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 26
    invoke-virtual {p0, p2}, Le/e/a/LocalPlaylistData;->hasGroup(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_30

    const/4 v0, 0x0

    :goto_7
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_10

    return-void

    :cond_10
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "group"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_30
    new-instance p1, Lorg/json/JSONException;

    const-string p2, "Missing group"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeFolder(Ljava/lang/String;)V
    .registers 6

    .line 19
    if-eqz p1, :cond_51

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_51

    :cond_9
    iget-object v0, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_11
    if-gez v0, :cond_37

    const/4 v0, 0x0

    :goto_14
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_1d

    return-void

    :cond_1d
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->videos:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_34

    const-string v2, "folder"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_37
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4e

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_4e
    add-int/lit8 v0, v0, -0x1

    goto :goto_11

    :cond_51
    :goto_51
    return-void
.end method

.method public removeGroup(Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 27
    iget-object v0, p0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-gez v0, :cond_32

    const/4 v0, 0x0

    :goto_b
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_14

    return-void

    :cond_14
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "group"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->folders:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_32
    iget-object v1, p0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_49

    iget-object v1, p0, Le/e/a/LocalPlaylistData;->groups:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_49
    add-int/lit8 v0, v0, -0x1

    goto :goto_8
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 28
    iget-object v0, p0, Le/e/a/LocalPlaylistData;->data:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
