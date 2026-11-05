.class public final Le/e/a/ModernComments;
.super Ljava/lang/Object;
.source "ModernComments.java"


# direct methods
.method private static cacheRoot(Le/e/a/d0;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static load(Le/e/a/d0;)V
    .registers 15

    :try_start_0
    const-string v0, "Comment loading started"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-comments"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Le/e/a/d0;->modernWatch:Lorg/json/JSONObject;

    if-eqz v0, :cond_74

    const-string v1, "comment"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_142

    const-string v1, "nvComment"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_142

    const-string v1, "server"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_142

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/v1/threads"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "params"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "threadKey"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "additionals"

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p0, v1, v2, v3}, Le/e/a/CommentHistory;->initial(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Le/e/a/ModernComments;->cacheRoot(Le/e/a/d0;)Ljava/lang/String;

    move-result-object v13

    iget-object v12, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-static {v13, v12, v0}, Le/e/a/CacheFolders;->comments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_80

    invoke-static {v13, v12, v0}, Le/e/a/CacheHls;->saveComments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_80

    :cond_74
    invoke-static {p0}, Le/e/a/ModernComments;->cacheRoot(Le/e/a/d0;)Ljava/lang/String;

    move-result-object v13

    iget-object v12, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-static {v13, v12}, Le/e/a/CacheHls;->readComments(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_142

    :cond_80
    :goto_80
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p0}, Le/e/a/CachedCommentMetadata;->begin(Lorg/json/JSONObject;Ljava/lang/Object;)V

    const-string v0, "data"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v0, "threads"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    :goto_9a
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_13e

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "comments"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_13a

    const/4 v5, 0x0

    :goto_ad
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_13a

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "body"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "vposMs"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    div-int/lit8 v8, v8, 0xa

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v9, 0x8

    new-array v9, v9, [Ljava/lang/Integer;

    const/4 v10, 0x0

    aput-object v8, v9, v10

    const-string v8, "no"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v10, 0x1

    aput-object v8, v9, v10

    const-string v8, "commands"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v8, :cond_102

    const/4 v11, 0x0

    :goto_eb
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v11, v12, :cond_102

    if-lez v11, :cond_f8

    const-string v12, " "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_f8
    invoke-virtual {v8, v11}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v11, v11, 0x1

    goto :goto_eb

    :cond_102
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v12, 0x3

    new-array v8, v12, [Ljava/lang/Integer;

    new-array v11, v12, [Ljava/lang/String;

    invoke-virtual {p0, v10, v8, v11}, Le/e/a/d0;->a(Ljava/lang/String;[Ljava/lang/Integer;[Ljava/lang/String;)V

    const/4 v12, 0x0

    aget-object v13, v8, v12

    const/4 v12, 0x3

    aput-object v13, v9, v12

    const/4 v12, 0x1

    aget-object v13, v8, v12

    const/4 v12, 0x4

    aput-object v13, v9, v12

    const/4 v12, 0x2

    aget-object v13, v8, v12

    aput-object v13, v9, v12

    new-instance v8, Le/e/a/q;

    invoke-direct {v8, v7, v10, v9}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Integer;)V

    aget-object v13, v11, v12

    iput-object v13, v8, Le/e/a/q;->h:Ljava/lang/String;

    const-string v7, "userId"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v8, Le/e/a/q;->c:Ljava/lang/String;

    invoke-static {v8, v6}, Le/e/a/CommentListExtras;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_ad

    :cond_13a
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_9a

    :cond_13e
    invoke-static {p0, v2}, Le/e/a/CommentUi;->apply(Ljava/lang/Object;Ljava/util/ArrayList;)V

    goto :goto_14c

    :cond_142
    const-string v0, "Comment configuration missing"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-comments"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_14c
    invoke-static {}, Le/e/a/CommentListExtras;->end()V

    invoke-static {p0}, Le/e/a/CommentHistory;->extend(Ljava/lang/Object;)V

    return-void
    :try_end_153
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_153} :catch_153

    :catch_153
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-modern"

    const-string v2, "Comment request failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-static {}, Le/e/a/CommentListExtras;->end()V

    return-void
.end method
