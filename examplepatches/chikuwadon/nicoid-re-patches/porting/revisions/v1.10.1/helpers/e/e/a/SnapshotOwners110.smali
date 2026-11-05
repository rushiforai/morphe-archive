.class final Le/e/a/SnapshotOwners110;
.super Ljava/lang/Object;
.source "SnapshotOwners110.java"


# static fields
.field static final CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/SnapshotOwners110;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Le/e/a/SnapshotOwners110$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Le/e/a/SnapshotOwners110$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/SnapshotOwners110;->CACHE:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Le/e/a/NetworkTask;Ljava/lang/String;)V
    .registers 9

    .line 6
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "https://nvapi.nicovideo.jp/v1/users/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1b} :catch_e3
    .catchall {:try_start_1 .. :try_end_1b} :catchall_d9

    :try_start_1b
    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1f} :catch_d6
    .catchall {:try_start_1b .. :try_end_1f} :catchall_d3

    if-nez v2, :cond_2a

    if-eqz v1, :cond_29

    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_29
    return-void

    :cond_2a
    const/16 v2, 0x5dc

    :try_start_2c
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v2, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "User-Agent"

    const-string v3, "nicoidRe/1.10.1"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_4b} :catch_d6
    .catchall {:try_start_2c .. :try_end_4b} :catchall_d3

    const/16 v3, 0xc8

    if-eq v2, v3, :cond_58

    if-eqz v1, :cond_57

    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_57
    return-void

    :cond_58
    :try_start_58
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5d} :catch_d6
    .catchall {:try_start_58 .. :try_end_5d} :catchall_d3

    :try_start_5d
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_68
    .catchall {:try_start_5d .. :try_end_68} :catchall_c9

    const/16 v4, 0x800

    :try_start_6a
    new-array v4, v4, [C

    :cond_6c
    invoke-virtual {v3, v4}, Ljava/io/Reader;->read([C)I

    move-result v5
    :try_end_70
    .catchall {:try_start_6a .. :try_end_70} :catchall_c3

    const/4 v6, -0x1

    if-ne v5, v6, :cond_a5

    :try_start_73
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_76
    .catchall {:try_start_73 .. :try_end_76} :catchall_c9

    :try_start_76
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "data"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "user"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "nickname"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9c

    sget-object v2, Le/e/a/SnapshotOwners110;->CACHE:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9c
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_9c} :catch_d6
    .catchall {:try_start_76 .. :try_end_9c} :catchall_d3

    :cond_9c
    if-eqz v1, :cond_ec

    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_ec

    :cond_a5
    const/4 v6, 0x0

    :try_start_a6
    invoke-virtual {v2, v4, v6, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    const/high16 v6, 0x20000

    if-gt v5, v6, :cond_b7

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v5
    :try_end_b5
    .catchall {:try_start_a6 .. :try_end_b5} :catchall_c3

    if-eqz v5, :cond_6c

    :cond_b7
    :try_start_b7
    invoke-virtual {v3}, Ljava/io/Reader;->close()V
    :try_end_ba
    .catchall {:try_start_b7 .. :try_end_ba} :catchall_c9

    if-eqz v1, :cond_c2

    invoke-virtual {p0, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_c2
    return-void

    :catchall_c3
    move-exception p1

    move-object v0, p1

    :try_start_c5
    invoke-virtual {v3}, Ljava/io/Reader;->close()V

    throw v0
    :try_end_c9
    .catchall {:try_start_c5 .. :try_end_c9} :catchall_c9

    :catchall_c9
    move-exception p1

    if-eqz v0, :cond_d2

    if-eq v0, p1, :cond_d1

    :try_start_ce
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_d1
    move-object p1, v0

    :cond_d2
    throw p1
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_ce .. :try_end_d3} :catch_d6
    .catchall {:try_start_ce .. :try_end_d3} :catchall_d3

    :catchall_d3
    move-exception p1

    move-object v0, v1

    goto :goto_da

    :catch_d6
    move-exception p1

    move-object v0, v1

    goto :goto_e4

    :catchall_d9
    move-exception p1

    :goto_da
    if-eqz v0, :cond_e2

    invoke-virtual {p0, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_e2
    throw p1

    :catch_e3
    move-exception p1

    :goto_e4
    if-eqz v0, :cond_ec

    invoke-virtual {p0, v0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_ec
    :goto_ec
    return-void
.end method

.method static names(Lorg/json/JSONArray;)Ljava/util/Map;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 6
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_d4

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1b
    :goto_1b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_ae

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v7, 0x3

    invoke-virtual {p0, v7, v8}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v7

    add-long v6, v5, v7

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_33
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3a

    :goto_39
    goto :goto_4d

    :cond_3a
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Future;

    :try_start_40
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_44} :catch_ac

    sub-long v8, v6, v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-gtz v5, :cond_a6

    goto :goto_39

    :goto_4d
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lt v1, p0, :cond_84

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_63

    return-object p0

    :cond_63
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Le/e/a/SnapshotOwners110;->CACHE:Ljava/util/Map;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ID: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5c

    :cond_84
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Future;

    invoke-interface {p0}, Ljava/util/concurrent/Future;->isDone()Z

    move-result p0

    if-nez p0, :cond_a3

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/NetworkTask;

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {p0, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_a3
    add-int/lit8 v1, v1, 0x1

    goto :goto_4d

    :cond_a6
    :try_start_a6
    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v8, v9, v5}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_ab
    .catch Ljava/lang/Exception; {:try_start_a6 .. :try_end_ab} :catch_ac

    goto :goto_33

    :catch_ac
    move-exception v2

    goto :goto_33

    :cond_ae
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    sget-object v2, Le/e/a/SnapshotOwners110;->CACHE:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    new-instance v2, Le/e/a/NetworkTask;

    invoke-direct {v2}, Le/e/a/NetworkTask;-><init>()V

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v6, Le/e/a/SnapshotOwners110;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Le/e/a/SnapshotOwners110$$ExternalSyntheticLambda0;

    invoke-direct {v7, v2, p0}, Le/e/a/SnapshotOwners110$$ExternalSyntheticLambda0;-><init>(Le/e/a/NetworkTask;Ljava/lang/String;)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1b

    :cond_d4
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, ""

    if-nez v3, :cond_dd

    goto :goto_e3

    :cond_dd
    const-string v5, "userId"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_e3
    const-string v3, "[0-9]+"

    invoke-virtual {v4, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_ee

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_ee
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7
.end method
