.class public final Le/e/a/Dev120;
.super Ljava/lang/Object;
.source "Dev120.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Dev120$Metadata;
    }
.end annotation


# static fields
.field private static final ATTEMPTED:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final PENDING:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 30
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Dev120;->MAIN:Landroid/os/Handler;

    .line 31
    new-instance v0, Le/e/a/Dev120$5;

    invoke-direct {v0}, Le/e/a/Dev120$5;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/Dev120;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 36
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Dev120;->PENDING:Ljava/util/Map;

    .line 37
    new-instance v0, Le/e/a/Dev120$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Le/e/a/Dev120$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/Dev120;->ATTEMPTED:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Z
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 29
    invoke-static {p0}, Le/e/a/Dev120;->hasPost(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static backfill(Ljava/lang/Object;)V
    .registers 6
    .param p0, "page"    # Ljava/lang/Object;

    .line 178
    if-nez p0, :cond_0

    return-void

    .line 179
    :cond_0
    sget-object v0, Le/e/a/Dev120;->PENDING:Ljava/util/Map;

    monitor-enter v0

    .line 180
    :try_start_0
    sget-object v1, Le/e/a/Dev120;->PENDING:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    monitor-exit v0

    return-void

    .line 181
    :cond_1
    sget-object v1, Le/e/a/Dev120;->PENDING:Ljava/util/Map;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 184
    .local v0, "weak":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Ljava/lang/Object;>;"
    sget-object v1, Le/e/a/Dev120;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/Dev120$2;

    invoke-direct {v2, v0}, Le/e/a/Dev120$2;-><init>(Ljava/lang/ref/WeakReference;)V

    const-wide/16 v3, 0xf0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 221
    return-void

    .line 182
    .end local v0    # "weak":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static fetch(Ljava/lang/String;)Le/e/a/Dev120$Metadata;
    .registers 33
    .param p0, "id"    # Ljava/lang/String;

    .line 86
    move-object/from16 v1, p0

    const-string v2, "title"

    const-class v0, Ljava/lang/String;

    const-string v3, "nicoid-playlist"

    new-instance v4, Le/e/a/Dev120$Metadata;

    invoke-direct {v4, v1}, Le/e/a/Dev120$Metadata;-><init>(Ljava/lang/String;)V

    .line 87
    .local v4, "m":Le/e/a/Dev120$Metadata;
    if-eqz v1, :cond_1c

    const-string v5, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v1, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    goto/16 :goto_10

    .line 90
    :cond_0
    const/4 v5, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    :try_start_0
    const-string v11, "e.e.a.VideoDetails"

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 91
    .local v11, "details":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v12, "e.e.a.NetworkTask"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    .line 92
    .local v12, "taskType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v13, v9, [Ljava/lang/Class;

    invoke-virtual {v12, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v13

    .line 93
    .local v13, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v13, v10}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 94
    new-array v14, v9, [Ljava/lang/Object;

    invoke-virtual {v13, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 95
    .local v14, "task":Ljava/lang/Object;
    const-string v15, "request"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const/16 v16, 0x3

    const/4 v6, 0x4

    const/16 v17, 0x0

    :try_start_1
    new-array v9, v6, [Ljava/lang/Class;

    aput-object v0, v9, v17

    aput-object v0, v9, v10

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v0, v9, v5

    aput-object v12, v9, v16

    invoke-virtual {v11, v15, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 96
    .local v0, "get":Ljava/lang/reflect/Method;
    invoke-virtual {v0, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 97
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v15, "?responseType=json"

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 98
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v9, v6, v17

    const-string v9, "GET"

    aput-object v9, v6, v10

    aput-object v15, v6, v5

    aput-object v14, v6, v16

    .line 97
    const/4 v9, 0x0

    invoke-virtual {v0, v9, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    .line 99
    .local v6, "response":Lorg/json/JSONObject;
    const-string v15, "watchData"

    new-array v5, v10, [Ljava/lang/Class;

    const-class v19, Lorg/json/JSONObject;

    aput-object v19, v5, v17

    invoke-virtual {v11, v15, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 100
    .local v5, "normalize":Ljava/lang/reflect/Method;
    invoke-virtual {v5, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 101
    new-array v15, v10, [Ljava/lang/Object;

    aput-object v6, v15, v17

    invoke-virtual {v5, v9, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 102
    .local v9, "watch":Lorg/json/JSONObject;
    const-string v15, "video"

    invoke-virtual {v9, v15}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 103
    .local v15, "video":Lorg/json/JSONObject;
    if-eqz v15, :cond_9

    const/16 v19, 0x1

    :try_start_2
    const-string v10, "id"

    invoke-virtual {v15, v10, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 104
    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10, v1}, [Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le/e/a/Dev120;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v4, Le/e/a/Dev120$Metadata;->title:Ljava/lang/String;

    .line 105
    const-string v10, "registeredAt"

    invoke-virtual {v15, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v7, "postedAt"

    invoke-virtual {v15, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    filled-new-array {v10, v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le/e/a/Dev120;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Le/e/a/Dev120;->millis(Ljava/lang/String;)J

    move-result-wide v7

    iput-wide v7, v4, Le/e/a/Dev120$Metadata;->postedAt:J

    .line 106
    const-string v7, "count"

    invoke-virtual {v15, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 107
    .local v7, "count":Lorg/json/JSONObject;
    if-eqz v7, :cond_3

    .line 108
    const-string v8, "view"

    const-string v10, "comment"

    move-object/from16 v22, v0

    .end local v0    # "get":Ljava/lang/reflect/Method;
    .local v22, "get":Ljava/lang/reflect/Method;
    const-string v0, "like"

    move-object/from16 v23, v5

    .end local v5    # "normalize":Ljava/lang/reflect/Method;
    .local v23, "normalize":Ljava/lang/reflect/Method;
    const-string v5, "mylist"

    filled-new-array {v8, v10, v0, v5}, [Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "keys":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v8, v0

    if-ge v5, v8, :cond_2

    .line 110
    aget-object v8, v0, v5

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, v4, Le/e/a/Dev120$Metadata;->counts:[J

    aget-object v10, v0, v5

    move/from16 v25, v5

    move-object/from16 v24, v6

    .end local v5    # "i":I
    .end local v6    # "response":Lorg/json/JSONObject;
    .local v24, "response":Lorg/json/JSONObject;
    .local v25, "i":I
    const-wide/16 v5, -0x1

    invoke-virtual {v7, v10, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    aput-wide v5, v8, v25

    goto :goto_1

    .end local v24    # "response":Lorg/json/JSONObject;
    .end local v25    # "i":I
    .restart local v5    # "i":I
    .restart local v6    # "response":Lorg/json/JSONObject;
    :cond_1
    move/from16 v25, v5

    move-object/from16 v24, v6

    .line 109
    .end local v5    # "i":I
    .end local v6    # "response":Lorg/json/JSONObject;
    .restart local v24    # "response":Lorg/json/JSONObject;
    .restart local v25    # "i":I
    :goto_1
    add-int/lit8 v5, v25, 0x1

    move-object/from16 v6, v24

    .end local v25    # "i":I
    .restart local v5    # "i":I
    goto :goto_0

    .end local v24    # "response":Lorg/json/JSONObject;
    .restart local v6    # "response":Lorg/json/JSONObject;
    :cond_2
    move/from16 v25, v5

    move-object/from16 v24, v6

    .end local v5    # "i":I
    .end local v6    # "response":Lorg/json/JSONObject;
    .restart local v24    # "response":Lorg/json/JSONObject;
    .restart local v25    # "i":I
    goto :goto_2

    .line 107
    .end local v22    # "get":Ljava/lang/reflect/Method;
    .end local v23    # "normalize":Ljava/lang/reflect/Method;
    .end local v24    # "response":Lorg/json/JSONObject;
    .end local v25    # "i":I
    .local v0, "get":Ljava/lang/reflect/Method;
    .local v5, "normalize":Ljava/lang/reflect/Method;
    .restart local v6    # "response":Lorg/json/JSONObject;
    :cond_3
    move-object/from16 v22, v0

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    .line 112
    .end local v0    # "get":Ljava/lang/reflect/Method;
    .end local v5    # "normalize":Ljava/lang/reflect/Method;
    .end local v6    # "response":Lorg/json/JSONObject;
    .restart local v22    # "get":Ljava/lang/reflect/Method;
    .restart local v23    # "normalize":Ljava/lang/reflect/Method;
    .restart local v24    # "response":Lorg/json/JSONObject;
    :goto_2
    const-string v0, "thumbnail"

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 113
    .local v0, "thumbnail":Lorg/json/JSONObject;
    if-eqz v0, :cond_4

    const-string v5, "url"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "listingUrl"

    .line 114
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "middleUrl"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v5, v6, v8}, [Ljava/lang/String;

    move-result-object v5

    .line 113
    invoke-static {v5}, Le/e/a/Dev120;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Le/e/a/Dev120$Metadata;->image:Ljava/lang/String;

    .line 115
    :cond_4
    const-string v5, "owner"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .local v5, "owner":Lorg/json/JSONObject;
    const-string v6, "channel"

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 116
    .local v6, "channel":Lorg/json/JSONObject;
    const-string v8, "name"

    if-eqz v5, :cond_5

    :try_start_3
    const-string v10, "nickname"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v25, v0

    .end local v0    # "thumbnail":Lorg/json/JSONObject;
    .local v25, "thumbnail":Lorg/json/JSONObject;
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v10, v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Dev120;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Le/e/a/Dev120$Metadata;->owner:Ljava/lang/String;

    goto :goto_3

    .end local v25    # "thumbnail":Lorg/json/JSONObject;
    .restart local v0    # "thumbnail":Lorg/json/JSONObject;
    :cond_5
    move-object/from16 v25, v0

    .line 117
    .end local v0    # "thumbnail":Lorg/json/JSONObject;
    .restart local v25    # "thumbnail":Lorg/json/JSONObject;
    :goto_3
    iget-object v0, v4, Le/e/a/Dev120$Metadata;->owner:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    if-eqz v6, :cond_6

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Dev120;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Le/e/a/Dev120$Metadata;->owner:Ljava/lang/String;

    .line 118
    :cond_6
    const-string v0, "duration"

    move-object v8, v5

    move-object v10, v6

    const-wide/16 v5, 0x0

    .end local v5    # "owner":Lorg/json/JSONObject;
    .end local v6    # "channel":Lorg/json/JSONObject;
    .local v8, "owner":Lorg/json/JSONObject;
    .local v10, "channel":Lorg/json/JSONObject;
    invoke-virtual {v15, v0, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v20

    move-wide/from16 v26, v20

    .line 119
    .local v26, "duration":J
    cmp-long v0, v26, v5

    if-lez v0, :cond_7

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v5, "%d:%02d"

    const-wide/16 v28, 0x3c

    div-long v30, v26, v28

    .line 120
    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    rem-long v28, v26, v28

    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v28

    move-object/from16 v29, v6

    move-object/from16 v30, v7

    const/4 v6, 0x2

    .end local v7    # "count":Lorg/json/JSONObject;
    .local v30, "count":Lorg/json/JSONObject;
    new-array v7, v6, [Ljava/lang/Object;

    aput-object v29, v7, v17

    aput-object v28, v7, v19

    .line 119
    invoke-static {v0, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Le/e/a/Dev120$Metadata;->length:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_4

    .end local v30    # "count":Lorg/json/JSONObject;
    .restart local v7    # "count":Lorg/json/JSONObject;
    :cond_7
    move-object/from16 v30, v7

    .end local v7    # "count":Lorg/json/JSONObject;
    .restart local v30    # "count":Lorg/json/JSONObject;
    goto :goto_4

    .line 103
    .end local v8    # "owner":Lorg/json/JSONObject;
    .end local v10    # "channel":Lorg/json/JSONObject;
    .end local v22    # "get":Ljava/lang/reflect/Method;
    .end local v23    # "normalize":Ljava/lang/reflect/Method;
    .end local v24    # "response":Lorg/json/JSONObject;
    .end local v25    # "thumbnail":Lorg/json/JSONObject;
    .end local v26    # "duration":J
    .end local v30    # "count":Lorg/json/JSONObject;
    .local v0, "get":Ljava/lang/reflect/Method;
    .local v5, "normalize":Ljava/lang/reflect/Method;
    .local v6, "response":Lorg/json/JSONObject;
    :cond_8
    move-object/from16 v22, v0

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    goto :goto_4

    .line 122
    .end local v0    # "get":Ljava/lang/reflect/Method;
    .end local v5    # "normalize":Ljava/lang/reflect/Method;
    .end local v6    # "response":Lorg/json/JSONObject;
    .end local v9    # "watch":Lorg/json/JSONObject;
    .end local v11    # "details":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "taskType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v13    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v14    # "task":Ljava/lang/Object;
    .end local v15    # "video":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    goto :goto_6

    .line 103
    .restart local v0    # "get":Ljava/lang/reflect/Method;
    .restart local v5    # "normalize":Ljava/lang/reflect/Method;
    .restart local v6    # "response":Lorg/json/JSONObject;
    .restart local v9    # "watch":Lorg/json/JSONObject;
    .restart local v11    # "details":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v12    # "taskType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v13    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v14    # "task":Ljava/lang/Object;
    .restart local v15    # "video":Lorg/json/JSONObject;
    :cond_9
    move-object/from16 v22, v0

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    const/16 v19, 0x1

    .line 124
    .end local v0    # "get":Ljava/lang/reflect/Method;
    .end local v5    # "normalize":Ljava/lang/reflect/Method;
    .end local v6    # "response":Lorg/json/JSONObject;
    .end local v9    # "watch":Lorg/json/JSONObject;
    .end local v11    # "details":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "taskType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v13    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v14    # "task":Ljava/lang/Object;
    .end local v15    # "video":Lorg/json/JSONObject;
    :goto_4
    goto :goto_7

    .line 122
    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    const/16 v16, 0x3

    const/16 v17, 0x0

    :goto_5
    const/16 v19, 0x1

    .line 123
    .local v0, "error":Ljava/lang/Exception;
    :goto_6
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Watch metadata fallback: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_7
    iget-object v0, v4, Le/e/a/Dev120$Metadata;->counts:[J

    aget-wide v5, v0, v17

    const-wide/16 v20, 0x0

    cmp-long v0, v5, v20

    if-ltz v0, :cond_a

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->counts:[J

    aget-wide v5, v0, v19

    cmp-long v0, v5, v20

    if-ltz v0, :cond_a

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->counts:[J

    aget-wide v5, v0, v16

    cmp-long v0, v5, v20

    if-ltz v0, :cond_a

    iget-wide v5, v4, Le/e/a/Dev120$Metadata;->postedAt:J

    cmp-long v0, v5, v20

    if-gtz v0, :cond_1a

    .line 127
    :cond_a
    const/4 v5, 0x0

    .line 129
    .local v5, "c":Ljava/net/HttpURLConnection;
    :try_start_4
    new-instance v0, Ljava/net/URL;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "https://ext.nicovideo.jp/api/getthumbinfo/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lnicoid/network238/ReadOnlyConnection239;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v5, v0

    .line 130
    const/16 v0, 0xdac

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 131
    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 132
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 133
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v7, 0xc8

    if-ne v0, v7, :cond_19

    .line 134
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    move-object v7, v0

    .line 135
    .local v7, "xml":Lorg/xmlpull/v1/XmlPullParser;
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object v8, v0

    .line 136
    .local v8, "stream":Ljava/io/InputStream;
    :try_start_5
    const-string v0, "UTF-8"

    invoke-interface {v7, v8, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 138
    :goto_8
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    move v9, v0

    const/4 v10, 0x1

    .local v9, "event":I
    if-eq v0, v10, :cond_17

    .line 139
    const/4 v11, 0x2

    if-eq v9, v11, :cond_b

    const/16 v19, 0x1

    goto :goto_8

    .line 140
    :cond_b
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    move-object v12, v0

    .line 141
    .local v12, "key":Ljava/lang/String;
    const-string v22, "title"

    const-string v23, "thumbnail_url"

    const-string v24, "user_nickname"

    const-string v25, "view_counter"

    const-string v26, "comment_num"

    const-string v27, "mylist_counter"

    const-string v28, "first_retrieve"

    const-string v29, "length"

    filled-new-array/range {v22 .. v29}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 142
    invoke-interface {v0, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 143
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    move-object v13, v0

    .line 144
    .local v13, "v":Ljava/lang/String;
    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    iput-object v13, v4, Le/e/a/Dev120$Metadata;->title:Ljava/lang/String;

    const-wide/16 v20, 0x0

    goto/16 :goto_b

    .line 145
    :cond_c
    const-string v0, "thumbnail_url"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->image:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    iput-object v13, v4, Le/e/a/Dev120$Metadata;->image:Ljava/lang/String;

    const-wide/16 v20, 0x0

    goto/16 :goto_b

    .line 146
    :cond_d
    const-string v0, "user_nickname"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->owner:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    iput-object v13, v4, Le/e/a/Dev120$Metadata;->owner:Ljava/lang/String;

    const-wide/16 v20, 0x0

    goto/16 :goto_b

    .line 147
    :cond_e
    const-string v0, "first_retrieve"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-wide v14, v4, Le/e/a/Dev120$Metadata;->postedAt:J

    const-wide/16 v20, 0x0

    cmp-long v0, v14, v20

    if-gtz v0, :cond_f

    invoke-static {v13}, Le/e/a/Dev120;->millis(Ljava/lang/String;)J

    move-result-wide v14

    iput-wide v14, v4, Le/e/a/Dev120$Metadata;->postedAt:J

    const-wide/16 v20, 0x0

    goto :goto_b

    .line 148
    :cond_f
    const-string v0, "length"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->length:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    iput-object v13, v4, Le/e/a/Dev120$Metadata;->length:Ljava/lang/String;

    const-wide/16 v20, 0x0

    goto :goto_b

    .line 150
    :cond_10
    const-string v0, "view_counter"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    goto :goto_9

    .line 151
    :cond_11
    const-string v0, "comment_num"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    goto :goto_9

    :cond_12
    const-string v0, "mylist_counter"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x3

    goto :goto_9

    :cond_13
    const/4 v0, -0x1

    :goto_9
    move v14, v0

    .line 152
    .local v14, "at":I
    if-ltz v14, :cond_14

    iget-object v0, v4, Le/e/a/Dev120$Metadata;->counts:[J

    aget-wide v17, v0, v14
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    const-wide/16 v20, 0x0

    cmp-long v0, v17, v20

    if-gez v0, :cond_16

    .line 153
    :try_start_6
    iget-object v0, v4, Le/e/a/Dev120$Metadata;->counts:[J

    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v17

    aput-wide v17, v0, v14
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_a

    .line 154
    :catch_3
    move-exception v0

    :goto_a
    goto :goto_b

    .line 152
    :cond_14
    const-wide/16 v20, 0x0

    goto :goto_b

    .line 142
    .end local v13    # "v":Ljava/lang/String;
    .end local v14    # "at":I
    :cond_15
    const-wide/16 v20, 0x0

    .line 157
    .end local v12    # "key":Ljava/lang/String;
    :cond_16
    :goto_b
    const/16 v19, 0x1

    goto/16 :goto_8

    .line 158
    .end local v9    # "event":I
    :cond_17
    if-eqz v8, :cond_19

    :try_start_7
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_d

    .line 135
    :catchall_0
    move-exception v0

    move-object v2, v0

    if-eqz v8, :cond_18

    :try_start_8
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_c

    :catchall_1
    move-exception v0

    :try_start_9
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v4    # "m":Le/e/a/Dev120$Metadata;
    .end local v5    # "c":Ljava/net/HttpURLConnection;
    .end local p0    # "id":Ljava/lang/String;
    :cond_18
    :goto_c
    throw v2
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 162
    .end local v7    # "xml":Lorg/xmlpull/v1/XmlPullParser;
    .end local v8    # "stream":Ljava/io/InputStream;
    .restart local v4    # "m":Le/e/a/Dev120$Metadata;
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    .restart local p0    # "id":Ljava/lang/String;
    :cond_19
    :goto_d
    if-eqz v5, :cond_1a

    goto :goto_e

    :catchall_2
    move-exception v0

    goto :goto_f

    .line 160
    :catch_4
    move-exception v0

    .line 161
    .restart local v0    # "error":Ljava/lang/Exception;
    :try_start_a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Public metadata unavailable: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 162
    nop

    .end local v0    # "error":Ljava/lang/Exception;
    if-eqz v5, :cond_1a

    :goto_e
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 164
    .end local v5    # "c":Ljava/net/HttpURLConnection;
    :cond_1a
    return-object v4

    .line 162
    .restart local v5    # "c":Ljava/net/HttpURLConnection;
    :goto_f
    if-eqz v5, :cond_1b

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1b
    throw v0

    .line 87
    .end local v5    # "c":Ljava/net/HttpURLConnection;
    :cond_1c
    :goto_10
    return-object v4
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "host"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 168
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 169
    .local v0, "f":Ljava/lang/reflect/Field;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 170
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static varargs first([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "values"    # [Ljava/lang/String;

    .line 82
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    .local v2, "v":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "null"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    return-object v2

    .end local v2    # "v":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 83
    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method private static hasPost(Ljava/lang/String;)Z
    .registers 8
    .param p0, "value"    # Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "0"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/NumberFormatException;
    return v1

    .line 71
    .end local v0    # "ignored":Ljava/lang/NumberFormatException;
    :cond_2
    :goto_0
    return v0
.end method

.method static synthetic lambda$backfill$1(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "activity"    # Ljava/lang/ref/WeakReference;
    .param p1, "weak"    # Ljava/lang/ref/WeakReference;
    .param p2, "folder"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;

    .line 215
    invoke-static {p0, p1, p2, p3}, Le/e/a/Dev120;->repair(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$backfill$2(Ljava/lang/ref/WeakReference;)V
    .registers 22
    .param p0, "weak"    # Ljava/lang/ref/WeakReference;

    .line 185
    invoke-virtual/range {p0 .. p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 186
    .local v1, "target":Ljava/lang/Object;
    if-nez v1, :cond_0

    return-void

    .line 187
    :cond_0
    sget-object v2, Le/e/a/Dev120;->PENDING:Ljava/util/Map;

    monitor-enter v2

    :try_start_0
    sget-object v0, Le/e/a/Dev120;->PENDING:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 189
    :try_start_1
    const-string v0, "a"

    invoke-static {v1, v0}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    move-object v2, v0

    .line 190
    .local v2, "a":Landroid/app/Activity;
    if-eqz v2, :cond_c

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    goto/16 :goto_7

    .line 191
    :cond_1
    const-string v0, "folder"

    invoke-static {v1, v0}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    .line 192
    .local v3, "folder":Ljava/lang/String;
    if-nez v3, :cond_2

    return-void

    .line 194
    :cond_2
    const-string v0, "visible"

    invoke-static {v1, v0}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    move-object v4, v0

    .line 195
    .local v4, "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    const-string v0, "videoList"

    invoke-static {v1, v0}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    move-object v5, v0

    .line 196
    .local v5, "list":Landroid/widget/ListView;
    if-eqz v4, :cond_b

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    if-eqz v5, :cond_b

    .line 197
    invoke-virtual {v5}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {v5}, Landroid/widget/ListView;->isShown()Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    if-nez v0, :cond_3

    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    goto/16 :goto_6

    .line 198
    :cond_3
    const/4 v0, 0x0

    if-eqz v5, :cond_4

    :try_start_2
    invoke-virtual {v5}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v6

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_0

    .line 217
    .end local v2    # "a":Landroid/app/Activity;
    .end local v3    # "folder":Ljava/lang/String;
    .end local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v5    # "list":Landroid/widget/ListView;
    :catch_0
    move-exception v0

    move-object/from16 v2, p0

    move-object/from16 v17, v1

    goto/16 :goto_8

    .line 198
    .restart local v2    # "a":Landroid/app/Activity;
    .restart local v3    # "folder":Ljava/lang/String;
    .restart local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .restart local v5    # "list":Landroid/widget/ListView;
    :cond_4
    :goto_0
    move v6, v0

    .line 199
    .local v6, "first":I
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v0

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :cond_5
    const/4 v0, 0x3

    :goto_1
    move v7, v0

    .line 200
    .local v7, "last":I
    const/4 v0, 0x0

    .line 201
    .local v0, "queued":I
    move v8, v6

    move v9, v8

    move v8, v0

    .end local v0    # "queued":I
    .local v8, "queued":I
    .local v9, "n":I
    :goto_2
    add-int/lit8 v0, v7, 0x1

    :try_start_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-static {v0, v10}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-gt v9, v0, :cond_9

    const/4 v0, 0x5

    if-ge v8, v0, :cond_9

    .line 202
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    move-object v10, v0

    .line 203
    .local v10, "row":Lorg/json/JSONObject;
    invoke-static {v10}, Le/e/a/Dev120;->missing(Lorg/json/JSONObject;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_3

    .line 204
    :cond_6
    const-string v0, "videoId"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    .line 205
    .local v11, "id":Ljava/lang/String;
    const-string v0, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v11, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_3

    .line 206
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, ":"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v12, v0

    .line 207
    .local v12, "key":Ljava/lang/String;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v13

    .line 208
    .local v13, "now":J
    sget-object v15, Le/e/a/Dev120;->ATTEMPTED:Ljava/util/Map;

    monitor-enter v15
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 209
    :try_start_4
    sget-object v0, Le/e/a/Dev120;->ATTEMPTED:Ljava/util/Map;

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 210
    .local v0, "time":Ljava/lang/Long;
    if-eqz v0, :cond_8

    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    cmp-long v18, v13, v16

    if-ltz v18, :cond_8

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    sub-long v16, v13, v16

    const-wide/32 v18, 0x124f80

    cmp-long v20, v16, v18

    if-gez v20, :cond_8

    monitor-exit v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 201
    .end local v0    # "time":Ljava/lang/Long;
    .end local v10    # "row":Lorg/json/JSONObject;
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "key":Ljava/lang/String;
    .end local v13    # "now":J
    :goto_3
    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    goto :goto_4

    .line 212
    .restart local v10    # "row":Lorg/json/JSONObject;
    .restart local v11    # "id":Ljava/lang/String;
    .restart local v12    # "key":Ljava/lang/String;
    .restart local v13    # "now":J
    :catchall_0
    move-exception v0

    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    goto :goto_5

    .line 211
    .restart local v0    # "time":Ljava/lang/Long;
    :cond_8
    move-object/from16 v16, v0

    .end local v0    # "time":Ljava/lang/Long;
    .local v16, "time":Ljava/lang/Long;
    :try_start_6
    sget-object v0, Le/e/a/Dev120;->ATTEMPTED:Ljava/util/Map;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    move-object/from16 v17, v1

    .end local v1    # "target":Ljava/lang/Object;
    .local v17, "target":Ljava/lang/Object;
    :try_start_7
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    nop

    .end local v16    # "time":Ljava/lang/Long;
    monitor-exit v15
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 213
    add-int/lit8 v8, v8, 0x1

    .line 214
    :try_start_8
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 215
    .local v0, "activity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    sget-object v1, Le/e/a/Dev120;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v15, Le/e/a/Dev120$6;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .end local v2    # "a":Landroid/app/Activity;
    .local v16, "a":Landroid/app/Activity;
    :try_start_9
    invoke-direct {v15, v0, v2, v3, v11}, Le/e/a/Dev120$6;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v15}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 201
    .end local v0    # "activity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    .end local v10    # "row":Lorg/json/JSONObject;
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "key":Ljava/lang/String;
    .end local v13    # "now":J
    :goto_4
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v2, v16

    move-object/from16 v1, v17

    goto/16 :goto_2

    .line 217
    .end local v3    # "folder":Ljava/lang/String;
    .end local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v5    # "list":Landroid/widget/ListView;
    .end local v6    # "first":I
    .end local v7    # "last":I
    .end local v8    # "queued":I
    .end local v9    # "n":I
    .end local v16    # "a":Landroid/app/Activity;
    :catch_1
    move-exception v0

    move-object/from16 v2, p0

    goto :goto_8

    .line 212
    .restart local v2    # "a":Landroid/app/Activity;
    .restart local v3    # "folder":Ljava/lang/String;
    .restart local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .restart local v5    # "list":Landroid/widget/ListView;
    .restart local v6    # "first":I
    .restart local v7    # "last":I
    .restart local v8    # "queued":I
    .restart local v9    # "n":I
    .restart local v10    # "row":Lorg/json/JSONObject;
    .restart local v11    # "id":Ljava/lang/String;
    .restart local v12    # "key":Ljava/lang/String;
    .restart local v13    # "now":J
    :catchall_1
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .end local v2    # "a":Landroid/app/Activity;
    .restart local v16    # "a":Landroid/app/Activity;
    goto :goto_5

    .end local v16    # "a":Landroid/app/Activity;
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    .restart local v2    # "a":Landroid/app/Activity;
    :catchall_2
    move-exception v0

    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .end local v1    # "target":Ljava/lang/Object;
    .end local v2    # "a":Landroid/app/Activity;
    .restart local v16    # "a":Landroid/app/Activity;
    .restart local v17    # "target":Ljava/lang/Object;
    :goto_5
    :try_start_a
    monitor-exit v15
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .end local v17    # "target":Ljava/lang/Object;
    .end local p0    # "weak":Ljava/lang/ref/WeakReference;
    :try_start_b
    throw v0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    .line 217
    .end local v3    # "folder":Ljava/lang/String;
    .end local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v5    # "list":Landroid/widget/ListView;
    .end local v6    # "first":I
    .end local v7    # "last":I
    .end local v8    # "queued":I
    .end local v9    # "n":I
    .end local v10    # "row":Lorg/json/JSONObject;
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "key":Ljava/lang/String;
    .end local v13    # "now":J
    .end local v16    # "a":Landroid/app/Activity;
    .restart local v17    # "target":Ljava/lang/Object;
    .restart local p0    # "weak":Ljava/lang/ref/WeakReference;
    :catch_2
    move-exception v0

    goto :goto_8

    .line 212
    .restart local v3    # "folder":Ljava/lang/String;
    .restart local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .restart local v5    # "list":Landroid/widget/ListView;
    .restart local v6    # "first":I
    .restart local v7    # "last":I
    .restart local v8    # "queued":I
    .restart local v9    # "n":I
    .restart local v10    # "row":Lorg/json/JSONObject;
    .restart local v11    # "id":Ljava/lang/String;
    .restart local v12    # "key":Ljava/lang/String;
    .restart local v13    # "now":J
    .restart local v16    # "a":Landroid/app/Activity;
    :catchall_3
    move-exception v0

    goto :goto_5

    .line 201
    .end local v10    # "row":Lorg/json/JSONObject;
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "key":Ljava/lang/String;
    .end local v13    # "now":J
    .end local v16    # "a":Landroid/app/Activity;
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    .restart local v2    # "a":Landroid/app/Activity;
    :cond_9
    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .line 219
    .end local v1    # "target":Ljava/lang/Object;
    .end local v2    # "a":Landroid/app/Activity;
    .end local v3    # "folder":Ljava/lang/String;
    .end local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v5    # "list":Landroid/widget/ListView;
    .end local v6    # "first":I
    .end local v7    # "last":I
    .end local v8    # "queued":I
    .end local v9    # "n":I
    .restart local v17    # "target":Ljava/lang/Object;
    goto :goto_9

    .line 197
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    .restart local v2    # "a":Landroid/app/Activity;
    .restart local v3    # "folder":Ljava/lang/String;
    .restart local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .restart local v5    # "list":Landroid/widget/ListView;
    :cond_a
    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .end local v1    # "target":Ljava/lang/Object;
    .end local v2    # "a":Landroid/app/Activity;
    .restart local v16    # "a":Landroid/app/Activity;
    .restart local v17    # "target":Ljava/lang/Object;
    goto :goto_6

    .line 196
    .end local v16    # "a":Landroid/app/Activity;
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    .restart local v2    # "a":Landroid/app/Activity;
    :cond_b
    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .line 197
    .end local v1    # "target":Ljava/lang/Object;
    .end local v2    # "a":Landroid/app/Activity;
    .restart local v16    # "a":Landroid/app/Activity;
    .restart local v17    # "target":Ljava/lang/Object;
    :goto_6
    return-void

    .line 190
    .end local v3    # "folder":Ljava/lang/String;
    .end local v4    # "rows":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    .end local v5    # "list":Landroid/widget/ListView;
    .end local v16    # "a":Landroid/app/Activity;
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    .restart local v2    # "a":Landroid/app/Activity;
    :cond_c
    move-object/from16 v17, v1

    move-object/from16 v16, v2

    move-object/from16 v2, p0

    .end local v1    # "target":Ljava/lang/Object;
    .end local v2    # "a":Landroid/app/Activity;
    .restart local v16    # "a":Landroid/app/Activity;
    .restart local v17    # "target":Ljava/lang/Object;
    :goto_7
    return-void

    .line 217
    .end local v16    # "a":Landroid/app/Activity;
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    :catch_3
    move-exception v0

    move-object/from16 v2, p0

    move-object/from16 v17, v1

    .line 218
    .end local v1    # "target":Ljava/lang/Object;
    .local v0, "error":Ljava/lang/Exception;
    .restart local v17    # "target":Ljava/lang/Object;
    :goto_8
    const-string v1, "nicoid-playlist"

    const-string v3, "Playlist metadata scan skipped"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 220
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_9
    return-void

    .line 187
    .end local v17    # "target":Ljava/lang/Object;
    .restart local v1    # "target":Ljava/lang/Object;
    :catchall_4
    move-exception v0

    move-object/from16 v17, v1

    move-object v1, v2

    move-object/from16 v2, p0

    .end local v1    # "target":Ljava/lang/Object;
    .restart local v17    # "target":Ljava/lang/Object;
    :goto_a
    :try_start_c
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    throw v0

    :catchall_5
    move-exception v0

    goto :goto_a
.end method

.method static synthetic lambda$repair$3(Ljava/lang/String;Ljava/lang/String;Le/e/a/Dev120$Metadata;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "meta"    # Le/e/a/Dev120$Metadata;
    .param p3, "updated"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p4, "proxy"    # Ljava/lang/Object;
    .param p5, "method"    # Ljava/lang/reflect/Method;
    .param p6, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 234
    const-string v0, "apply"

    invoke-virtual {p5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 235
    :cond_0
    const/4 v0, 0x0

    aget-object v2, p6, v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "videos"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    aget-object v0, p6, v0

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    .line 236
    .local v0, "videos":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 237
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 238
    .local v3, "video":Lorg/json/JSONObject;
    if-eqz v3, :cond_1

    const-string v4, "folder"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 239
    const-string v4, "videoId"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {v3}, Le/e/a/Dev120;->missing(Lorg/json/JSONObject;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 240
    invoke-virtual {p2, v3}, Le/e/a/Dev120$Metadata;->merge(Lorg/json/JSONObject;)V

    .line 241
    const/4 v4, 0x1

    invoke-virtual {p3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 242
    goto :goto_1

    .line 236
    .end local v3    # "video":Lorg/json/JSONObject;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 245
    .end local v2    # "n":I
    :cond_2
    :goto_1
    return-object v1
.end method

.method static synthetic lambda$repair$4(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 10
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "current"    # Ljava/lang/Object;

    .line 254
    const-string v0, "videoList"

    :try_start_0
    const-string v1, "folder"

    invoke-static {p1, v1}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 255
    :cond_0
    invoke-static {p1, v0}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 256
    .local v1, "old":Landroid/widget/ListView;
    const/4 v2, 0x0

    if-nez v1, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v3

    .line 257
    .local v3, "index":I
    :goto_0
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/widget/ListView;->getChildCount()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v4, 0x0

    .line 258
    .local v4, "top":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "render"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 259
    .local v5, "render":Ljava/lang/reflect/Method;
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 260
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    invoke-static {p1, v0}, Le/e/a/Dev120;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 262
    .local v0, "next":Landroid/widget/ListView;
    if-eqz v0, :cond_4

    invoke-static {v0, v3, v4}, Le/e/a/Dev112;->restoreList(Landroid/widget/ListView;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    .end local v0    # "next":Landroid/widget/ListView;
    .end local v1    # "old":Landroid/widget/ListView;
    .end local v3    # "index":I
    .end local v4    # "top":I
    .end local v5    # "render":Ljava/lang/reflect/Method;
    :cond_4
    goto :goto_3

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, "error":Ljava/lang/Exception;
    const-string v1, "nicoid-playlist"

    const-string v2, "Playlist metadata refresh skipped"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_3
    return-void
.end method

.method static synthetic lambda$repair$5(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 8
    .param p0, "page"    # Ljava/lang/ref/WeakReference;
    .param p1, "activity"    # Ljava/lang/ref/WeakReference;
    .param p2, "updated"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p3, "folder"    # Ljava/lang/String;
    .param p4, "ok"    # Ljava/lang/Boolean;

    .line 248
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 249
    .local v0, "current":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 250
    .local v1, "host":Landroid/app/Activity;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, p4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 251
    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 252
    :cond_0
    new-instance v2, Le/e/a/Dev120$0;

    invoke-direct {v2, p3, v0}, Le/e/a/Dev120$0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 267
    return-void

    .line 251
    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 32
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-playlist-metadata"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 33
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 34
    return-object v0
.end method

.method private static millis(Ljava/lang/String;)J
    .registers 9
    .param p0, "text"    # Ljava/lang/String;

    .line 75
    const-wide/16 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    :try_start_0
    const-string v2, "e.e.a.RowDates194"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "millis"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    .line 78
    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    aput-object p0, v3, v7

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return-wide v0

    .line 79
    :catch_0
    move-exception v2

    .local v2, "ignored":Ljava/lang/Exception;
    return-wide v0

    .line 75
    .end local v2    # "ignored":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return-wide v0
.end method

.method private static missing(Lorg/json/JSONObject;)Z
    .registers 3
    .param p0, "v"    # Lorg/json/JSONObject;

    .line 173
    if-eqz p0, :cond_1

    const-string v0, "videoinfo"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 174
    const-string v0, "postedAt"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Dev120;->hasPost(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 173
    :goto_0
    return v0
.end method

.method private static repair(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V
    .registers 22
    .param p2, "folder"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;",
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 224
    .local p0, "activity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    .local p1, "page":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Ljava/lang/Object;>;"
    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/app/Activity;

    .line 225
    .local v2, "a":Landroid/app/Activity;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object/from16 v10, p0

    move-object/from16 v12, p1

    move-object/from16 v11, p3

    goto/16 :goto_2

    .line 226
    :cond_0
    invoke-static/range {p3 .. p3}, Le/e/a/Dev120;->fetch(Ljava/lang/String;)Le/e/a/Dev120$Metadata;

    move-result-object v3

    .line 227
    .local v3, "meta":Le/e/a/Dev120$Metadata;
    invoke-virtual {v3}, Le/e/a/Dev120$Metadata;->useful()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 229
    :cond_1
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 230
    .local v0, "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "e.e.a.LocalPlaylists$Edit"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 231
    .local v4, "editType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 232
    .local v5, "updated":Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Class;

    aput-object v4, v9, v6

    new-instance v10, Le/e/a/Dev120$3;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-object/from16 v11, p3

    :try_start_1
    invoke-direct {v10, v1, v11, v3, v5}, Le/e/a/Dev120$3;-><init>(Ljava/lang/String;Ljava/lang/String;Le/e/a/Dev120$Metadata;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-static {v7, v9, v10}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v7

    .line 247
    .local v7, "edit":Ljava/lang/Object;
    new-instance v9, Le/e/a/Dev120$4;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v10, p0

    move-object/from16 v12, p1

    :try_start_2
    invoke-direct {v9, v12, v10, v5, v1}, Le/e/a/Dev120$4;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;)V

    .line 268
    .local v9, "callback":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    const-string v13, "change"

    const/4 v14, 0x3

    new-array v15, v14, [Ljava/lang/Class;

    const-class v16, Landroid/content/Context;

    aput-object v16, v15, v6

    aput-object v4, v15, v8

    const-class v16, Ljava/util/function/Consumer;

    const/16 v17, 0x2

    aput-object v16, v15, v17

    invoke-virtual {v0, v13, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v13

    .line 269
    .local v13, "change":Ljava/lang/reflect/Method;
    invoke-virtual {v13, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 270
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v15

    new-array v14, v14, [Ljava/lang/Object;

    aput-object v15, v14, v6

    aput-object v7, v14, v8

    aput-object v9, v14, v17

    const/4 v6, 0x0

    invoke-virtual {v13, v6, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 273
    nop

    .end local v0    # "dataClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "editType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "updated":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local v7    # "edit":Ljava/lang/Object;
    .end local v9    # "callback":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    .end local v13    # "change":Ljava/lang/reflect/Method;
    goto :goto_1

    .line 271
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object/from16 v10, p0

    move-object/from16 v12, p1

    goto :goto_0

    :catch_2
    move-exception v0

    move-object/from16 v10, p0

    move-object/from16 v12, p1

    move-object/from16 v11, p3

    .line 272
    .local v0, "error":Ljava/lang/Exception;
    :goto_0
    const-string v4, "nicoid-playlist"

    const-string v5, "Could not persist playlist metadata"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 274
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 225
    .end local v3    # "meta":Le/e/a/Dev120$Metadata;
    :cond_2
    move-object/from16 v10, p0

    move-object/from16 v12, p1

    move-object/from16 v11, p3

    :goto_2
    return-void
.end method
