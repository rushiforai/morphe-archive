.class public Le/e/a/a1;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Z

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:I

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Le/e/a/b1;


# virtual methods
.method public run()V
    .registers 14

    const-string v0, "UTF-8"

    new-instance v7, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v7}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v8, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v8}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v1, p0, Le/e/a/a1;->m:Le/e/a/b1;

    .line 1
    iget-object v1, v1, Le/e/a/b1;->d:Lorg/apache/http/client/CookieStore;

    const-string v2, "http.cookie-store"

    .line 2
    invoke-interface {v8, v2, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const/16 v2, 0x2710

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "http.socket.timeout"

    invoke-interface {v1, v3, v2}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const/16 v2, 0x32c8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "http.connection.timeout"

    invoke-interface {v1, v3, v2}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    iget-boolean v1, p0, Le/e/a/a1;->a:Z

    const/4 v9, 0x0

    :try_start_0
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "content"

    iget-object v2, p0, Le/e/a/a1;->b:Ljava/lang/String;

    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "mail"

    iget-object v2, p0, Le/e/a/a1;->c:Ljava/lang/String;

    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v12, "postkey"

    iget-object v1, p0, Le/e/a/a1;->m:Le/e/a/b1;

    iget-object v4, p0, Le/e/a/a1;->d:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/a1;->e:Ljava/lang/String;

    iget-object v6, p0, Le/e/a/a1;->f:Ljava/lang/String;

    move-object v2, v7

    move-object v3, v8

    .line 3
    invoke-virtual/range {v1 .. v6}, Le/e/a/b1;->a(Lorg/apache/http/client/HttpClient;Lorg/apache/http/protocol/HttpContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 4
    invoke-virtual {v11, v12, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "premium"

    iget-boolean v2, p0, Le/e/a/a1;->g:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "thread"

    iget-object v2, p0, Le/e/a/a1;->d:Ljava/lang/String;

    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "ticket"

    iget-object v2, p0, Le/e/a/a1;->i:Ljava/lang/String;

    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "user_id"

    iget-object v2, p0, Le/e/a/a1;->j:Ljava/lang/String;

    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "vpos"

    iget v2, p0, Le/e/a/a1;->k:I

    invoke-virtual {v11, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "chat"

    invoke-virtual {v1, v2, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v10, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v10}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    iget-object v2, p0, Le/e/a/a1;->l:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    new-instance v2, Lorg/apache/http/entity/StringEntity;

    invoke-virtual {v10}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v7, v1, v8}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    new-instance v3, Ljava/lang/String;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v1

    invoke-direct {v3, v1, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "chat_result"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v2, v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-nez v2, :cond_2

    iget-object v0, p0, Le/e/a/a1;->m:Le/e/a/b1;

    .line 5
    iget-object v0, v0, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 6
    new-instance v1, Le/e/a/a1$a;

    invoke-direct {v1, p0}, Le/e/a/a1$a;-><init>(Le/e/a/a1;)V

    :goto_2
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_4

    :cond_2
    iget-object v0, p0, Le/e/a/a1;->m:Le/e/a/b1;

    .line 7
    iget-object v0, v0, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 8
    new-instance v1, Le/e/a/a1$b;

    invoke-direct {v1, p0}, Le/e/a/a1$b;-><init>(Le/e/a/a1;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_3
    iget-object v1, p0, Le/e/a/a1;->m:Le/e/a/b1;

    .line 9
    iget-object v1, v1, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 10
    new-instance v2, Le/e/a/a1$c;

    invoke-direct {v2, p0}, Le/e/a/a1$c;-><init>(Le/e/a/a1;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_3
    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    iget-object v0, p0, Le/e/a/a1;->m:Le/e/a/b1;

    .line 11
    iget-object v0, v0, Le/e/a/b1;->a:Landroid/os/Handler;

    .line 12
    new-instance v1, Le/e/a/a1$d;

    invoke-direct {v1, p0}, Le/e/a/a1$d;-><init>(Le/e/a/a1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le/e/a/a1;->m:Le/e/a/b1;

    iput-boolean v9, v0, Le/e/a/b1;->e:Z

    return-void

    :goto_4
    invoke-interface {v7}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_6

    :goto_5
    throw v0

    :goto_6
    goto :goto_5
.end method
