.class public Le/e/a/o2$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/o2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/o2;


# virtual methods
.method public run()V
    .registers 18

    move-object/from16 v1, p0

    iget-object v2, v1, Le/e/a/o2$b;->a:Le/e/a/o2;

    const-string v3, "\u65b0\u30b5\u30fc\u30d0\u30b3\u30cd\u30af\u30b7\u30e7\u30f3\u7dad\u6301videoQuality : "

    const-string v4, "data"

    const-string v5, "UTF-8"

    .line 1
    iget-object v0, v2, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v0, :cond_4

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v6, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v6}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v7, v2, Le/e/a/o2;->a:Ljava/lang/String;

    invoke-static {v7}, Le/e/a/v0;->b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;

    move-result-object v7

    const-string v8, "http.cookie-store"

    invoke-interface {v6, v8, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v7, Lorg/apache/http/client/methods/HttpOptions;

    iget-object v9, v2, Le/e/a/o2;->t:Ljava/lang/String;

    invoke-direct {v7, v9}, Lorg/apache/http/client/methods/HttpOptions;-><init>(Ljava/lang/String;)V

    :try_start_0
    invoke-static {v0, v7, v6}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    const/4 v7, 0x0

    :goto_1
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_4

    iget-object v0, v2, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_4

    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v9, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v9}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v10, v2, Le/e/a/o2;->a:Ljava/lang/String;

    invoke-static {v10}, Le/e/a/v0;->b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;

    move-result-object v10

    invoke-interface {v9, v8, v10}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v10, Lorg/apache/http/client/methods/HttpPost;

    iget-object v11, v2, Le/e/a/o2;->t:Ljava/lang/String;

    invoke-direct {v10, v11}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    :try_start_1
    new-instance v11, Lorg/apache/http/entity/StringEntity;

    iget-object v12, v2, Le/e/a/o2;->u:Ljava/lang/String;

    invoke-direct {v11, v12, v5}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v0, v10, v9}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    new-instance v10, Ljava/lang/String;

    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v9

    invoke-direct {v10, v9, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    :try_start_2
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_2

    :catch_2
    move-exception v0

    const-string v10, ""

    :goto_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_3
    :try_start_3
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v10, 0x0

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    const-string v12, "session"

    if-eqz v11, :cond_2

    :try_start_4
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    :try_start_5
    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v11, "content_src_id_sets"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v11, 0x0

    :goto_4
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v11, v13, :cond_2

    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v14, "content_src_ids"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    const/4 v14, 0x0

    :goto_5
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v14, v15, :cond_1

    invoke-virtual {v13, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    const-string v6, "src_id_to_mux"

    invoke-virtual {v15, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v15, "video_src_ids"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    const/4 v15, 0x0

    :goto_6
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v15, v9, :cond_0

    invoke-virtual {v6, v15}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v2, Le/e/a/o2;->q:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v16, v0

    iget-object v0, v2, Le/e/a/o2;->q:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, v16

    goto :goto_6

    :cond_0
    move-object/from16 v16, v0

    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    :cond_1
    move-object/from16 v16, v0

    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    :catch_3
    move-exception v0

    :try_start_6
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u65b0\u30b5\u30fc\u30d0\u30b3\u30cd\u30af\u30b7\u30e7\u30f3\u7dad\u6301 sessionRequest: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v10, :cond_3

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v6, "keep_method"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v6, "heartbeat"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v6, "lifetime"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    add-int/lit16 v9, v0, -0x4e20

    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iget-wide v12, v2, Le/e/a/o2;->c:J

    add-long/2addr v10, v12

    iput-wide v10, v2, Le/e/a/o2;->c:J
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_8

    :catch_4
    move-exception v0

    goto :goto_7

    :cond_3
    const v9, 0xea60

    goto :goto_8

    :catch_5
    move-exception v0

    const v9, 0xea60

    :goto_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_8
    int-to-long v9, v9

    :try_start_8
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    goto/16 :goto_1

    :catch_6
    move-exception v0

    move-object v6, v0

    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    :cond_4
    return-void
.end method
