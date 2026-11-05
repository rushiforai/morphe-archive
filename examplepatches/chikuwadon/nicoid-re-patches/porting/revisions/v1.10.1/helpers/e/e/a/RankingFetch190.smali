.class final Le/e/a/RankingFetch190;
.super Ljava/lang/Object;
.source "RankingFetch190.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/RankingFetch190$Scope;,
        Le/e/a/RankingFetch190$TagSource;
    }
.end annotation


# static fields
.field static final PAGE:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field static final WARNINGS:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/RankingFetch190;->PAGE:Ljava/lang/ThreadLocal;

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/RankingFetch190;->WARNINGS:Ljava/lang/ThreadLocal;

    .line 5
    new-instance v0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Le/e/a/RankingFetch190$$ExternalSyntheticLambda1;-><init>()V

    const/4 v1, 0x4

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/RankingFetch190;->WORK:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static embedded(Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .registers 4

    .line 23
    const-string v0, "tag"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_15

    const-string v1, "items"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    if-eqz v2, :cond_15

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0

    :cond_15
    const-string v0, "tags"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method static filter(Ljava/util/ArrayList;Lorg/json/JSONArray;Le/e/a/NetworkTask;Le/e/a/RankingFetch190$TagSource;Le/e/a/RankingFetch190$Scope;)Ljava/util/ArrayList;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lorg/json/JSONArray;",
            "Le/e/a/NetworkTask;",
            "Le/e/a/RankingFetch190$TagSource;",
            "Le/e/a/RankingFetch190$Scope;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    sget-object v0, Le/e/a/RankingFetch190;->WARNINGS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 18
    const/4 v3, 0x1

    const/4 v4, 0x0

    :try_start_16
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_af

    .line 19
    const/4 p3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_23
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt p3, v7, :cond_5e

    .line 20
    if-lez v5, :cond_34

    sget-object p0, Le/e/a/RankingFetch190;->WARNINGS:Ljava/lang/ThreadLocal;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_34
    if-nez v6, :cond_41

    if-gtz v5, :cond_39

    goto :goto_41

    :cond_39
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Unable to load ranking tags"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_41
    .catchall {:try_start_16 .. :try_end_41} :catchall_cd

    .line 21
    :cond_41
    :goto_41
    nop

    :goto_42
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lt v4, p0, :cond_49

    return-object v0

    :cond_49
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/NetworkTask;

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Future;

    invoke-interface {p0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_42

    .line 19
    :cond_5e
    :try_start_5e
    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v7

    if-nez v7, :cond_a9

    invoke-interface {p4}, Le/e/a/RankingFetch190$Scope;->active()Z

    move-result v7
    :try_end_68
    .catchall {:try_start_5e .. :try_end_68} :catchall_cd

    if-eqz v7, :cond_a9

    :goto_6a
    :try_start_6a
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/concurrent/Future;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v9, 0x64

    invoke-interface {v7, v9, v10, v8}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONArray;
    :try_end_7a
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_6a .. :try_end_7a} :catch_95
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_6a .. :try_end_7a} :catch_7d
    .catchall {:try_start_6a .. :try_end_7a} :catchall_cd

    add-int/lit8 v6, v6, 0x1

    goto :goto_81

    :catch_7d
    move-exception v7

    add-int/lit8 v5, v5, 0x1

    const/4 v7, 0x0

    :goto_81
    if-eqz v7, :cond_92

    :try_start_83
    invoke-static {v7, p1}, Le/e/a/RankingRules190;->matches(Lorg/json/JSONArray;Lorg/json/JSONArray;)Z

    move-result v7

    if-eqz v7, :cond_92

    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_92
    add-int/lit8 p3, p3, 0x1

    goto :goto_23

    :catch_95
    move-exception v7

    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v7

    if-nez v7, :cond_a3

    invoke-interface {p4}, Le/e/a/RankingFetch190$Scope;->active()Z

    move-result v7

    if-eqz v7, :cond_a3

    goto :goto_6a

    :cond_a3
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    :goto_a8
    throw p0

    :cond_a9
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    goto :goto_a8

    .line 18
    :cond_af
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    new-instance v7, Le/e/a/NetworkTask;

    invoke-direct {v7}, Le/e/a/NetworkTask;-><init>()V

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v8, Le/e/a/RankingFetch190;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;

    invoke-direct {v9, v6, p3, v7}, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;-><init>(Lorg/json/JSONObject;Le/e/a/RankingFetch190$TagSource;Le/e/a/NetworkTask;)V

    invoke-interface {v8, v9}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_cb
    .catchall {:try_start_83 .. :try_end_cb} :catchall_cd

    goto/16 :goto_1a

    .line 21
    :catchall_cd
    move-exception p0

    :goto_ce
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v4, p1, :cond_e9

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Future;

    invoke-interface {p1, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_ce

    :cond_e9
    throw p0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 5
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-ranking-tags"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$1()Z
    .registers 1

    .line 7
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$2(Ljava/util/HashMap;Lorg/json/JSONObject;Lorg/json/JSONObject;)I
    .registers 4

    .line 13
    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$4(Lorg/json/JSONObject;Le/e/a/RankingFetch190$TagSource;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-static {p0}, Le/e/a/RankingFetch190;->embedded(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_10

    const-string v0, "id"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0, p2}, Le/e/a/RankingFetch190$TagSource;->fetch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object v0

    :cond_10
    return-object v0
.end method

.method static load(Lorg/json/JSONObject;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Le/e/a/NetworkTask;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 7
    new-instance v0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Le/e/a/RankingFetch190$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {p0, p1, p2, v0}, Le/e/a/RankingFetch190;->load(Lorg/json/JSONObject;Ljava/lang/String;Le/e/a/NetworkTask;Le/e/a/RankingFetch190$Scope;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method static load(Lorg/json/JSONObject;Ljava/lang/String;Le/e/a/NetworkTask;Le/e/a/RankingFetch190$Scope;)Ljava/util/ArrayList;
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Le/e/a/NetworkTask;",
            "Le/e/a/RankingFetch190$Scope;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static/range {p0 .. p0}, Le/e/a/RankingRules190;->validate(Lorg/json/JSONObject;)V

    const-string v2, "genres"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const-string v3, "rules"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 9
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_20
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/16 v9, 0x3e8

    if-lt v6, v8, :cond_5c

    .line 13
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v3, Le/e/a/RankingFetch190$$ExternalSyntheticLambda2;

    invoke-direct {v3, v4}, Le/e/a/RankingFetch190$$ExternalSyntheticLambda2;-><init>(Ljava/util/HashMap;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v9, :cond_49

    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2, v5, v9}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v2, v3

    :cond_49
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_50

    goto :goto_5b

    :cond_50
    new-instance v3, Le/e/a/RankingFetch190$$ExternalSyntheticLambda3;

    invoke-direct {v3}, Le/e/a/RankingFetch190$$ExternalSyntheticLambda3;-><init>()V

    move-object/from16 v8, p3

    invoke-static {v2, v0, v1, v3, v8}, Le/e/a/RankingFetch190;->filter(Ljava/util/ArrayList;Lorg/json/JSONArray;Le/e/a/NetworkTask;Le/e/a/RankingFetch190$TagSource;Le/e/a/RankingFetch190$Scope;)Ljava/util/ArrayList;

    move-result-object v2

    :goto_5b
    return-object v2

    .line 9
    :cond_5c
    move-object/from16 v8, p3

    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    const/4 v12, 0x0

    :goto_68
    invoke-virtual/range {p2 .. p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v13

    if-nez v13, :cond_14e

    invoke-interface/range {p3 .. p3}, Le/e/a/RankingFetch190$Scope;->active()Z

    move-result v13

    if-eqz v13, :cond_14e

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "https://nvapi.nicovideo.jp/v1/ranking/teiban/"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "?term="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v14, p1

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v15, "&pageSize=100&page="

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    div-int/lit8 v15, v12, 0x64

    add-int/lit8 v15, v15, 0x1

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v15, "GET"

    invoke-static {v13, v15, v5, v1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v15, "data"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v15, "items"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v15

    const/16 v16, 0x0

    :goto_b1
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v5, v9, :cond_e1

    .line 10
    add-int/lit8 v12, v12, 0x64

    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-eqz v5, :cond_d9

    const/16 v9, 0x3e8

    if-ge v12, v9, :cond_d9

    const-string v5, "hasNext"

    const/4 v15, 0x0

    invoke-virtual {v13, v5, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_cd

    goto :goto_da

    :cond_cd
    if-eqz v16, :cond_d1

    const/4 v5, 0x0

    goto :goto_68

    :cond_d1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Repeated ranking page"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d9
    const/4 v15, 0x0

    .line 11
    :goto_da
    add-int/lit8 v7, v7, 0x1

    .line 9
    add-int/lit8 v6, v6, 0x1

    const/4 v5, 0x0

    goto/16 :goto_20

    :cond_e1
    const/16 v9, 0x3e8

    const/16 v17, 0x0

    invoke-virtual {v15, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    move-object/from16 v18, v0

    if-nez v9, :cond_f0

    move/from16 v19, v6

    goto :goto_142

    :cond_f0
    const-string v0, "content"

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_f9

    move-object v0, v9

    :cond_f9
    const-string v1, "watchId"

    move/from16 v19, v6

    const-string v6, ""

    invoke-virtual {v9, v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v6, "id"

    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v9, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {v1, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_112

    :cond_111
    goto :goto_142

    :cond_112
    invoke-virtual {v0, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-interface {v11, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11d

    add-int/lit8 v16, v16, 0x1

    :cond_11d
    add-int v6, v12, v5

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v9

    mul-int v6, v6, v9

    add-int/2addr v6, v7

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_138

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ge v6, v9, :cond_111

    :cond_138
    invoke-virtual {v3, v1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_142
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, p2

    move-object/from16 v0, v18

    move/from16 v6, v19

    const/16 v9, 0x3e8

    goto/16 :goto_b1

    :cond_14e
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
.end method

.method public static parseOfficial(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 24
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "data"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    sget-object v0, Le/e/a/RankingFetch190;->PAGE:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    const-string v0, "items"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v1, 0x0

    :goto_1c
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_23

    return-object v0

    :cond_23
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_39

    const-string v3, "content"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_32

    goto :goto_36

    :cond_32
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    :goto_36
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c
.end method

.method static tags(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-static {p0, p1}, Le/e/a/RankingTags194;->tags(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method
