.class public final Le/e/a/RankingPager196;
.super Ljava/lang/Object;
.source "RankingPager196.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/RankingPager196$Genre;,
        Le/e/a/RankingPager196$Scope;,
        Le/e/a/RankingPager196$Session;,
        Le/e/a/RankingPager196$Source;
    }
.end annotation


# static fields
.field static final NETWORK:Le/e/a/RankingPager196$Source;

.field static final SESSIONS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/RankingPager196$Session;",
            ">;"
        }
    .end annotation
.end field

.field static final TAGS:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/RankingPager196;->SESSIONS:Ljava/util/Map;

    .line 15
    new-instance v0, Le/e/a/RankingPager196$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Le/e/a/RankingPager196$$ExternalSyntheticLambda0;-><init>()V

    const/4 v1, 0x4

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/RankingPager196;->TAGS:Ljava/util/concurrent/ExecutorService;

    .line 21
    new-instance v0, Le/e/a/RankingPager196$1;

    invoke-direct {v0}, Le/e/a/RankingPager196$1;-><init>()V

    sput-object v0, Le/e/a/RankingPager196;->NETWORK:Le/e/a/RankingPager196$Source;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static check(Le/e/a/NetworkTask;)V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 102
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_7

    return-void

    :cond_7
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method public static custom(Ljava/lang/Object;)Z
    .registers 26

    .line 106
    move-object/from16 v1, p0

    const-string v0, "p"

    const-string v2, "custom-"

    const-string v3, "l"

    const-string v4, "a"

    :try_start_a
    invoke-static {v1, v4}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_27f

    invoke-virtual {v8, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_24

    goto/16 :goto_27f

    .line 107
    :cond_24
    invoke-static {v1, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/Context;

    invoke-static {v9}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    .line 108
    const-string v10, "ranking_presets_v190"

    invoke-static {v9, v10}, Le/e/a/Ranking190;->stored(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 109
    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_35
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v14
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_39} :catch_281

    const-string v15, "id"

    if-lt v12, v14, :cond_250

    .line 110
    if-eqz v13, :cond_248

    .line 111
    :try_start_3f
    invoke-static/range {p0 .. p0}, Le/e/a/RankingPages190;->offset(Ljava/lang/Object;)I

    move-result v2

    const-string v8, "term"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_4d

    const-string v7, "24h"

    .line 112
    :cond_4d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v10, Le/e/a/RankingPager196;->SESSIONS:Ljava/util/Map;

    invoke-interface {v10, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Le/e/a/RankingPager196$Session;

    .line 114
    if-eqz v2, :cond_7e

    if-eqz v10, :cond_7e

    iget-object v12, v10, Le/e/a/RankingPager196$Session;->signature:Ljava/lang/String;

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7e

    const/4 v8, 0x0

    goto :goto_7f

    :cond_7e
    const/4 v8, 0x1

    :goto_7f
    if-eqz v8, :cond_88

    new-instance v10, Le/e/a/RankingPager196$Session;

    sget-object v12, Le/e/a/RankingPager196;->NETWORK:Le/e/a/RankingPager196$Source;

    invoke-direct {v10, v13, v7, v12}, Le/e/a/RankingPager196$Session;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Le/e/a/RankingPager196$Source;)V

    .line 115
    :cond_88
    new-instance v7, Le/e/a/NetworkTask;

    invoke-direct {v7}, Le/e/a/NetworkTask;-><init>()V

    .line 116
    iget v12, v10, Le/e/a/RankingPager196$Session;->warnings:I
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_8f} :catch_281

    .line 117
    :try_start_8f
    new-instance v13, Le/e/a/RankingPager196$$ExternalSyntheticLambda1;

    invoke-direct {v13, v9}, Le/e/a/RankingPager196$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v2, v7, v13}, Le/e/a/RankingPager196$Session;->page(ILe/e/a/NetworkTask;Le/e/a/RankingPager196$Scope;)Ljava/util/ArrayList;

    move-result-object v13
    :try_end_98
    .catchall {:try_start_8f .. :try_end_98} :catchall_243

    :try_start_98
    invoke-virtual {v7}, Le/e/a/NetworkTask;->cancel()V

    .line 118
    if-eqz v8, :cond_a2

    sget-object v7, Le/e/a/RankingPager196;->SESSIONS:Ljava/util/Map;

    invoke-interface {v7, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    :cond_a2
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const-string v8, "e.e.a.x1"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-string v14, "e.e.a.ModernRanking"

    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    .line 120
    const/4 v11, 0x0

    :goto_b4
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x2

    if-lt v11, v5, :cond_128

    .line 126
    invoke-static {v1, v7}, Le/e/a/RankingPages190;->loaded(Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v4, "i"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v10}, Le/e/a/RankingPager196$Session;->more()Z

    move-result v4

    if-eqz v4, :cond_dc

    const/16 v4, 0x384

    if-ge v2, v4, :cond_dc

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x1

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_dd

    :cond_dc
    const/4 v2, 0x0

    :goto_dd
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 127
    invoke-static {v1, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    .line 128
    iget v2, v10, Le/e/a/RankingPager196$Session;->warnings:I

    if-le v2, v12, :cond_f2

    new-instance v2, Le/e/a/RankingPager196$$ExternalSyntheticLambda2;

    invoke-direct {v2, v9}, Le/e/a/RankingPager196$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 129
    :cond_f2
    const-string v2, "e.e.a.e0$i"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v5, v9

    const-class v8, Ljava/util/ArrayList;

    const/4 v9, 0x1

    aput-object v8, v5, v9

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v5, v6

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v8, 0x1

    aput-object v7, v4, v8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 v1, 0x1

    return v1

    .line 121
    :cond_128
    invoke-virtual {v13, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    const-string v6, "count"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_13b

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    :cond_13b
    move-object/from16 v19, v9

    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v9

    .line 122
    move-object/from16 v20, v8

    new-instance v8, Ljava/lang/StringBuilder;

    move-object/from16 v21, v10

    const-string v10, "https://www.nicovideo.jp/watch/"

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v4, v8}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "b"

    invoke-virtual {v5, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "h"

    const-string v10, "title"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "y"

    invoke-static {v5}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "c"

    invoke-static {v5}, Le/e/a/DetailData;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "g"

    add-int v10, v2, v11

    const/16 v17, 0x1

    add-int/lit8 v10, v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 123
    const-string v8, "view"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v9, v0, v8}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "q"

    const-string v10, "comment"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "m"

    const-string v10, "mylist"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9, v8, v10}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "duration"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    const-string v10, "d"

    move-object/from16 v22, v0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    move/from16 v23, v2

    const-string v2, "%d:%02d"

    move-object/from16 v24, v4

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    div-int/lit8 v18, v8, 0x3c

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    const/16 v16, 0x0

    aput-object v18, v4, v16

    rem-int/lit8 v8, v8, 0x3c

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v17, 0x1

    aput-object v8, v4, v17

    invoke-static {v0, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-static {v9, v10, v0}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    const-string v0, "f"

    const-string v2, "formatJst"

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v4, v8, v10

    invoke-virtual {v14, v2, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v4, 0x1

    new-array v8, v4, [Ljava/lang/Object;

    const-string v4, "registeredAt"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v8, v5

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v9, v0, v2}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "e"

    const-string v2, "countInfo"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v4, Lorg/json/JSONObject;

    const/4 v8, 0x0

    aput-object v4, v5, v8

    invoke-virtual {v14, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    aput-object v6, v5, v8

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v9, v0, v2}, Le/e/a/RankingPager196;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v9, v19

    move-object/from16 v8, v20

    move-object/from16 v10, v21

    move-object/from16 v0, v22

    move/from16 v2, v23

    move-object/from16 v4, v24

    goto/16 :goto_b4

    .line 117
    :catchall_243
    move-exception v0

    invoke-virtual {v7}, Le/e/a/NetworkTask;->cancel()V

    throw v0

    .line 110
    :cond_248
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Missing ranking preset"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_250
    move-object/from16 v22, v0

    move-object/from16 v24, v4

    move-object/from16 v19, v9

    const/4 v4, 0x0

    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_275

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_272
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_272} :catch_281

    if-eqz v5, :cond_275

    move-object v13, v0

    :cond_275
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v9, v19

    move-object/from16 v0, v22

    move-object/from16 v4, v24

    goto/16 :goto_35

    .line 106
    :cond_27f
    :goto_27f
    const/4 v1, 0x0

    return v1

    .line 130
    :catch_281
    move-exception v0

    move-object v2, v0

    .line 131
    :try_start_283
    invoke-static {v1, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    const-string v3, "e.e.a.e0$c"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v6, 0x0

    aput-object v4, v5, v6

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    aput-object v1, v5, v6

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2ab
    .catch Ljava/lang/Exception; {:try_start_283 .. :try_end_2ab} :catch_2ac

    goto :goto_2ad

    :catch_2ac
    move-exception v0

    .line 132
    :goto_2ad
    const-string v0, "nicoid-ranking"

    const-string v1, "Unable to load ranking page"

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v1, 0x1

    return v1
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 15
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-ranking-tags"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$1(Landroid/content/Context;)Z
    .registers 2

    .line 117
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_14

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-eqz p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    goto :goto_15

    :cond_14
    const/4 p0, 0x1

    :goto_15
    return p0
.end method

.method static synthetic lambda$2(Landroid/content/Context;)V
    .registers 3

    .line 128
    const-string v0, "\u4e00\u90e8\u306e\u52d5\u753b\u306e\u30bf\u30b0\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 103
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
