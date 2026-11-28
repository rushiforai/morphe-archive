.class public final Le/e/a/ModernPosting;
.super Ljava/lang/Object;
.source "ModernPosting.java"


# static fields
.field private static final BUSY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/ModernPosting;->MAIN:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/ModernPosting;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static UriEncode(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 11
    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static commandsContain(Lorg/json/JSONArray;Ljava/lang/String;)Z
    .registers 5

    .line 10
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static comment(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14

    .line 9
    :try_start_0
    const-string v0, "A1"

    invoke-static {p0, v0}, Le/e/a/ModernPosting;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/app/Activity;

    invoke-static {v9}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v0

    const-string v1, "user_session="

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p1, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    const-string p2, "Sign in required"

    const-string/jumbo v0, "\u8acb\u5148\u767b\u5165"

    invoke-static {v9, p1, p2, v0}, Le/e/a/ModernPosting;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v9, p1}, Le/e/a/ModernPosting;->message(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    :cond_1
    sget-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-object v1, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    monitor-exit v0

    return-void

    :cond_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    const-string v0, "b0"

    invoke-static {p0, v0}, Le/e/a/ModernPosting;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/ModernPosting;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getCurrentPosition"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    new-instance v4, Le/e/a/NetworkTask;

    invoke-direct {v4}, Le/e/a/NetworkTask;-><init>()V

    sget-object v0, Le/e/a/ModernPosting;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v10, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;

    move-object v1, v10

    move-object v2, p0

    move-object v5, p2

    move-object v6, p1

    invoke-direct/range {v1 .. v9}, Le/e/a/ModernPosting$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V

    invoke-interface {v0, v10}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :cond_3
    :goto_0
    return-void

    :catch_0
    move-exception p1

    const-string p2, "nicoid-comment"

    const-string v0, "Unable to prepare comment"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object p1, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter p1

    :try_start_5
    sget-object p2, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    :goto_1
    return-void

    :catchall_1
    move-exception p0

    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    const-string v0, "UTF-8"

    const-string v1, "https://www.nicovideo.jp"

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lnicoid/network238/ApiConnection254;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2

    if-eqz v2, :cond_d

    :try_start_0
    const-string v2, "POST"

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v2, 0x2710

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "X-Frontend-Id"

    const-string v4, "6"

    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "X-Frontend-Version"

    const-string v4, "0"

    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "X-Client-Os-Type"

    const-string v4, "others"

    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "Referer"

    const-string v4, "https://www.nicovideo.jp/"

    invoke-virtual {p0, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "X-Request-With"

    invoke-virtual {p0, v3, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "X-Requested-With"

    invoke-virtual {p0, v3, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "Origin"

    invoke-virtual {p0, v3, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Cookie"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    array-length v1, p1

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    invoke-virtual {v3, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v3, :cond_0

    :try_start_3
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    :cond_0
    :try_start_4
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v3, 0xc8

    if-lt p1, v3, :cond_a

    const/16 v4, 0x12c

    if-ge p1, v4, :cond_a

    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    :try_start_5
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    const/16 v6, 0x1000

    :try_start_6
    new-array v6, v6, [B

    :goto_0
    invoke-virtual {v5, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    const/4 v8, -0x1

    if-ne v7, v8, :cond_6

    if-eqz v5, :cond_1

    :try_start_7
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :cond_1
    :try_start_8
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    if-nez v1, :cond_2

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_1

    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object p1, v1

    :goto_1
    const-string v0, "meta"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v1, "status"

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    if-ge v0, v4, :cond_3

    goto :goto_3

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Request rejected"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_4
    :goto_2
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :cond_5
    :goto_3
    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p1

    :cond_6
    :try_start_9
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v8

    add-int/2addr v8, v7

    const/high16 v9, 0x200000

    if-gt v8, v9, :cond_7

    invoke-virtual {p1, v6, v2, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_7
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Response too large"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    :catchall_0
    move-exception p1

    move-object v1, p1

    if-eqz v5, :cond_8

    :try_start_a
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    :cond_8
    throw v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :catchall_1
    move-exception p1

    if-eqz v1, :cond_4

    if-eq v1, p1, :cond_9

    :try_start_b
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9
    move-object p1, v1

    goto :goto_2

    :cond_a
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HTTP "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    :catchall_2
    move-exception v1

    if-eqz v3, :cond_b

    :try_start_c
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    :cond_b
    throw v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    :catchall_3
    move-exception p1

    if-eqz v1, :cond_4

    if-eq v1, p1, :cond_c

    :try_start_d
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :cond_c
    move-object p1, v1

    goto :goto_2

    :catchall_4
    move-exception p1

    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1

    :cond_d
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/String;Le/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/String;JLandroid/app/Activity;)V
    .registers 25

    .line 9
    move-object/from16 v1, p0

    move-object/from16 v0, p2

    invoke-static {v1}, Le/e/a/PostEcho123;->ticket(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    :try_start_0
    invoke-static/range {p1 .. p2}, Le/e/a/ModernPosting;->watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "comment"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_0

    move-object v6, v5

    goto :goto_0

    :cond_0
    const-string v6, "nvComment"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    :goto_0
    if-eqz v6, :cond_9

    const-string v7, "params"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "targets"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    invoke-static {v4, v7}, Le/e/a/PostingRules;->thread(Lorg/json/JSONObject;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v7, "id"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_8

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "https://nvapi.nicovideo.jp/v1/comment/keys/post?threadId="

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Le/e/a/ModernPosting;->UriEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "GET"

    const/4 v10, 0x1

    invoke-static {v8, v9, v10, v0}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "data"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "postKey"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    if-nez p3, :cond_1

    const-string v11, ""

    goto :goto_1

    :cond_1
    move-object/from16 v11, p3

    :goto_1
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    const-string v12, "\\s+"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    array-length v12, v11

    const/4 v13, 0x0

    :goto_2
    if-lt v13, v12, :cond_6

    const-string v11, "is184Forced"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v4, "184"

    invoke-static {v9, v4}, Le/e/a/ModernPosting;->commandsContain(Lorg/json/JSONArray;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "184"

    invoke-virtual {v9, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_2
    const-string v4, "video"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v11, "client"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "videoId"

    if-nez v3, :cond_3

    move-object v3, v5

    goto :goto_3

    :cond_3
    const-string v13, "watchId"

    invoke-virtual {v3, v13, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_3
    if-nez v4, :cond_4

    :goto_4
    goto :goto_5

    :cond_4
    const-string v13, "id"

    invoke-virtual {v4, v13, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_4

    :goto_5
    move-object/from16 v14, p1

    invoke-static {v3, v14, v5}, Le/e/a/PostingRules;->videoId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v12, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "commands"

    invoke-virtual {v3, v4, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "body"

    move-object/from16 v15, p4

    invoke-virtual {v3, v4, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "vposMs"

    const-wide/16 v11, 0x0

    move-wide/from16 v13, p5

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    invoke-virtual {v3, v4, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "postKey"

    invoke-virtual {v3, v4, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "server"

    const-string v5, "https://nvcomment.nicovideo.jp"

    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/PostingPolicy122;->postServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "https://(?:public\\.)?nv-?comment\\.nicovideo\\.jp/?"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "/$"

    const-string v8, ""

    invoke-virtual {v4, v6, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/v1/threads/"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v7}, Le/e/a/ModernPosting;->UriEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/comments"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3, v0}, Le/e/a/ModernPosting;->jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v2, p0

    invoke-static {v4, v1, v3, v2}, Le/e/a/PostEcho123;->accepted(Lorg/json/JSONObject;Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    sget-object v2, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter v2

    :try_start_1
    sget-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v2

    const/4 v2, 0x1

    goto :goto_7

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_5
    :try_start_2
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Unsupported comment server"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_6
    throw v0

    :cond_6
    move-object/from16 v14, p1

    move-object/from16 v15, p4

    aget-object v2, v11, v13

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_7

    invoke-virtual {v9, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_7
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_2

    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v2, "No main thread"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :cond_9
    new-instance v0, Ljava/io/IOException;

    const-string v2, "No comment metadata"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_6

    :catchall_1
    move-exception v0

    goto :goto_8

    :catch_0
    move-exception v0

    :try_start_3
    const-string v2, "nicoid-comment"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Comment submission failed: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Le/e/a/PostingPolicy122;->describe(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    sget-object v2, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter v2

    :try_start_4
    sget-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    const/4 v2, 0x0

    :goto_7
    sget-object v0, Le/e/a/ModernPosting;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/ModernPosting$$ExternalSyntheticLambda2;

    move-object/from16 v3, p7

    invoke-direct {v1, v3, v2}, Le/e/a/ModernPosting$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_2
    move-exception v0

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0

    :goto_8
    sget-object v2, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter v2

    :try_start_6
    sget-object v3, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v0

    :catchall_3
    move-exception v0

    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v0
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Z)V
    .registers 4

    .line 9
    if-eqz p1, :cond_0

    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u3092\u6295\u7a3f\u3057\u307e\u3057\u305f"

    goto :goto_0

    :cond_0
    const-string v0, "\u30b3\u30e1\u30f3\u30c8\u3092\u6295\u7a3f\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    :goto_0
    if-eqz p1, :cond_1

    const-string v1, "Comment posted"

    goto :goto_1

    :cond_1
    const-string v1, "Unable to post comment"

    :goto_1
    if-eqz p1, :cond_2

    const-string p1, "\u5df2\u767c\u9001\u7559\u8a00"

    goto :goto_2

    :cond_2
    const-string/jumbo p1, "\u7121\u6cd5\u767c\u9001\u7559\u8a00"

    :goto_2
    invoke-static {p0, v0, v1, p1}, Le/e/a/ModernPosting;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/ModernPosting;->message(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 13
    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object p3

    const-string p4, "user_session="

    invoke-virtual {p3, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_0

    const-string p1, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    const-string p2, "Sign in required"

    const-string/jumbo p3, "\u8acb\u5148\u767b\u5165"

    invoke-static {p0, p1, p2, p3}, Le/e/a/ModernPosting;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/ModernPosting;->message(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    :cond_0
    sget-object p3, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter p3

    :try_start_0
    sget-object p4, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {p4, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_1

    monitor-exit p3

    return-void

    :cond_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object p3, Le/e/a/ModernPosting;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance p4, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;

    invoke-direct {p4, p1, p2, p0}, Le/e/a/ModernPosting$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/lang/String;Landroid/app/Activity;)V

    invoke-interface {p3, p4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static synthetic lambda$3(Ljava/lang/Object;Ljava/lang/String;Landroid/app/Activity;)V
    .registers 6

    .line 13
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/watch-later?watchId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/ModernPosting;->UriEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "POST"

    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    const/4 v2, 0x1

    invoke-static {p1, v0, v2, v1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    sget-object p1, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter p1

    :try_start_1
    sget-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_2
    const-string v0, "nicoid-list"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Watch-later submission failed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    sget-object p1, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter p1

    :try_start_3
    sget-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/4 v2, 0x0

    :goto_0
    sget-object p0, Le/e/a/ModernPosting;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/ModernPosting$$ExternalSyntheticLambda0;

    invoke-direct {p1, p2, v2}, Le/e/a/ModernPosting$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Z)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_2
    move-exception p0

    :try_start_4
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw p0

    :goto_1
    sget-object p2, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    monitor-enter p2

    :try_start_5
    sget-object v0, Le/e/a/ModernPosting;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw p1

    :catchall_3
    move-exception p0

    :try_start_6
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw p0
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Z)V
    .registers 4

    .line 13
    if-eqz p1, :cond_0

    const-string/jumbo v0, "\u767b\u9332\u3057\u307e\u3057\u305f"

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "\u767b\u9332\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    :goto_0
    if-eqz p1, :cond_1

    const-string v1, "Added"

    goto :goto_1

    :cond_1
    const-string v1, "Unable to add"

    :goto_1
    if-eqz p1, :cond_2

    const-string p1, "\u5df2\u65b0\u589e"

    goto :goto_2

    :cond_2
    const-string/jumbo p1, "\u7121\u6cd5\u65b0\u589e"

    :goto_2
    invoke-static {p0, v0, v1, p1}, Le/e/a/ModernPosting;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/ModernPosting;->message(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public static later(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 7

    .line 13
    :try_start_0
    const-string v0, "b"

    invoke-static {p0, v0}, Le/e/a/ModernPosting;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8\u767b\u9332"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "\u767b\u9332"

    const-string v3, "Add"

    const-string/jumbo v4, "\u65b0\u589e"

    invoke-static {v0, v2, v3, v4}, Le/e/a/ModernPosting;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/ModernPosting$$ExternalSyntheticLambda4;

    invoke-direct {v3, v0, p0, p1}, Le/e/a/ModernPosting$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v1, "Cancel"

    const-string v2, "\u53d6\u6d88"

    invoke-static {v0, p1, v1, v2}, Le/e/a/ModernPosting;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "nicoid-list"

    const-string v0, "Unable to prepare watch-later dialog"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method static message(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 6
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 8
    invoke-static {p0}, Le/e/a/Dev122;->cachedWatch(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "?responseType=json"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GET"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Le/e/a/DetailData;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method
