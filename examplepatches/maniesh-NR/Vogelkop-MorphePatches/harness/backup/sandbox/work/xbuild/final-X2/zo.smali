.class public final Lzo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Ljava/util/List;

.field public final c:J

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLjava/util/ArrayList;JLjava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lzo;->a:Z

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lzo;->b:Ljava/util/List;

    iput-wide p4, p0, Lzo;->c:J

    iput-object p6, p0, Lzo;->d:Ljava/lang/String;

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Lgm;Z)Lzo;
    .registers 20

    move-object/from16 v1, p2

    const-string v0, "concurrent"

    const/4 v2, 0x0

    :try_start_5
    new-instance v3, Lorg/json/JSONObject;

    move-object/from16 v4, p0

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "ok"

    const-string v5, "ret"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_95

    const-string v4, "dat"

    new-instance v5, Lorb;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v5, v3}, Lorb;-><init>(Lorg/json/JSONObject;)V

    const-string v3, "accessID"

    invoke-virtual {v5, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v3, "deliveries"

    invoke-virtual {v5, v3}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v3

    const-string v4, "ipAddress"

    invoke-virtual {v5, v4, v2}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    new-instance v4, Ljava/util/ArrayList;

    iget-object v6, v3, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v13, Ljava/util/HashSet;

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Ljava/util/HashSet;-><init>(I)V

    move v15, v14

    :goto_4d
    iget-object v6, v3, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    move-object v9, v7

    if-ge v15, v6, :cond_80

    invoke-virtual {v3, v15}, Lvpb;->c(I)Lorb;

    move-result-object v7
    :try_end_5a
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5a} :catch_e3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5a} :catch_e3

    :try_start_5a
    new-instance v6, Lr9i;

    const-string v8, "type"

    invoke-virtual {v7, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0x1b

    move-object/from16 v8, p1

    invoke-direct/range {v6 .. v11}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v6}, Lvo;->a(Lr9i;)Lvo;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_70
    .catch Lorg/json/JSONException; {:try_start_5a .. :try_end_70} :catch_71
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5a .. :try_end_70} :catch_71

    goto :goto_7c

    :catch_71
    :try_start_71
    const-string v6, "id"

    const-string v8, "N/A"

    invoke-virtual {v7, v6, v8}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :goto_7c
    add-int/lit8 v15, v15, 0x1

    move-object v7, v9

    goto :goto_4d

    :cond_80
    invoke-virtual {v13}, Ljava/util/HashSet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_89

    invoke-interface {v1, v13}, Lgm;->h(Ljava/util/HashSet;)V

    :cond_89
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_9e

    invoke-virtual {v13}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_96

    :cond_95
    return-object v2

    :cond_96
    new-instance v0, Lorg/json/JSONException;

    const-string v3, "not any valid ad provider"

    invoke-direct {v0, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9e
    new-instance v3, Lc9;

    const/4 v6, 0x1

    invoke-direct {v3, v6}, Lc9;-><init>(B)V

    invoke-static {v4, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const-wide/16 v6, 0x0

    if-eqz p3, :cond_ad

    :goto_ab
    move-wide v10, v6

    goto :goto_c8

    :cond_ad
    const-string v3, "fetchIntervalSeconds"

    invoke-virtual {v5, v3}, Lorb;->g(Ljava/lang/String;)I

    move-result v3

    int-to-long v10, v3

    cmp-long v3, v10, v6

    if-lez v3, :cond_bf

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v10, v11}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    goto :goto_c2

    :cond_bf
    const-wide/32 v6, 0x36ee80

    :goto_c2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    add-long/2addr v6, v10

    goto :goto_ab

    :goto_c8
    iget-object v3, v5, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v3, v0, v14}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_d5

    const-string v3, "true"

    invoke-interface {v1, v0, v3}, Lgm;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d5
    new-instance v6, Lzo;

    const-string v0, "disableFallback"

    invoke-virtual {v5, v0}, Lorb;->f(Ljava/lang/String;)Z

    move-result v8

    move-object v7, v9

    move-object v9, v4

    invoke-direct/range {v6 .. v12}, Lzo;-><init>(Ljava/lang/String;ZLjava/util/ArrayList;JLjava/lang/String;)V
    :try_end_e2
    .catch Lorg/json/JSONException; {:try_start_71 .. :try_end_e2} :catch_e3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_71 .. :try_end_e2} :catch_e3

    return-object v6

    :catch_e3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lgm;->n(Ljava/lang/String;)V

    return-object v2
.end method
