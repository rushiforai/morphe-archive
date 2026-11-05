.class public final Le/e/a/SeriesPlayback;
.super Ljava/lang/Object;
.source "SeriesPlayback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SeriesPlayback$QueueState;
    }
.end annotation


# static fields
.field private static final BUSY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static final CHANGES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final QUEUES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/SeriesPlayback$QueueState;",
            ">;"
        }
    .end annotation
.end field

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 16
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/SeriesPlayback;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 17
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SeriesPlayback;->MAIN:Landroid/os/Handler;

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    .line 19
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    .line 21
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    .line 24
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0xc

    if-ge v0, v1, :cond_1e

    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_1e

    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_e

    goto :goto_1e

    :cond_e
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_1e

    if-ne v1, p0, :cond_1a

    goto :goto_1e

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1

    :cond_1e
    :goto_1e
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_25

    check-cast p0, Landroid/app/Activity;

    goto :goto_26

    :cond_25
    const/4 p0, 0x0

    :goto_26
    return-object p0
.end method

.method public static applyRepeat(Ljava/lang/Object;)V
    .registers 6

    .line 52
    :try_start_0
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "F0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setRepeatMode"

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v4}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    if-eqz v1, :cond_2a

    const/4 v3, 0x1

    goto :goto_2b

    :cond_2a
    const/4 v3, 0x0

    :goto_2b
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_36} :catch_6a

    :cond_36
    :try_start_36
    const-string v0, "p1"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const-string v0, "e.e.a.PlayerIcons"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "background"

    const-class v3, Landroid/view/View;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v1, :cond_58

    const v1, 0x7f07019d

    goto :goto_5b

    :cond_58
    const v1, 0x7f07019c

    :goto_5b
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_67} :catch_68

    goto :goto_72

    :catch_68
    move-exception p0

    goto :goto_72

    :catch_6a
    move-exception p0

    const-string v0, "nicoid-series"

    const-string v1, "Unable to apply repeat"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_72
    return-void
.end method

.method private static bind(Ljava/lang/Object;Ljava/util/ArrayList;I)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;I)V"
        }
    .end annotation

    .line 40
    const-string v0, "U0"

    const-string v1, "F0"

    const/4 v2, 0x0

    if-eqz p1, :cond_1a

    :try_start_7
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a

    if-ltz p2, :cond_1a

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge p2, v3, :cond_1a

    const/4 v3, 0x1

    goto :goto_1b

    .line 49
    :catch_17
    move-exception p0

    goto/16 :goto_9e

    .line 40
    :cond_1a
    move v3, v2

    .line 41
    :goto_1b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v4

    .line 42
    sget-object v5, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/SeriesPlayback$QueueState;

    .line 43
    if-eqz v3, :cond_48

    if-nez v5, :cond_48

    sget-object v6, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    new-instance v7, Le/e/a/SeriesPlayback$QueueState;

    invoke-direct {v7, v4}, Le/e/a/SeriesPlayback$QueueState;-><init>(Z)V

    invoke-interface {v6, p0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 44
    :cond_48
    if-nez v3, :cond_62

    if-eqz v5, :cond_62

    sget-object v4, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v4, v5, Le/e/a/SeriesPlayback$QueueState;->touched:Z

    if-nez v4, :cond_62

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iget-boolean v4, v5, Le/e/a/SeriesPlayback$QueueState;->repeat:Z

    invoke-virtual {v1, p0, v4}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 45
    :cond_62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v4, "C1"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    if-eqz v3, :cond_7a

    goto :goto_7b

    :cond_7a
    const/4 p1, 0x0

    :goto_7b
    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v1, "D1"

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    if-eqz v3, :cond_8b

    goto :goto_8c

    :cond_8b
    move p2, v2

    :goto_8c
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/SeriesPlayback;->applyRepeat(Ljava/lang/Object;)V
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_9d} :catch_17

    .line 49
    goto :goto_a5

    :goto_9e
    const-string p1, "nicoid-series"

    const-string p2, "Unable to update playback queue"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_a5
    return-void
.end method

.method static enabled(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 4

    .line 23
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "series_continuous_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static ensure(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 50
    invoke-static {p0, p1}, Le/e/a/SeriesPlayback;->enabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {p0}, Le/e/a/SeriesPlayback;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_e

    return-void

    :cond_e
    :try_start_e
    const-string v1, "v"

    invoke-static {v0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SeriesPlayback$QueueState;

    if-eqz v1, :cond_38

    iget-object v1, v1, Le/e/a/SeriesPlayback$QueueState;->series:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "U0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_34} :catch_37

    if-eqz v0, :cond_38

    return-void

    :catch_37
    move-exception v0

    :cond_38
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/SeriesPlayback;->toggle(Landroid/content/Context;Ljava/lang/String;Z)V

    return-void
.end method

.method private static fetch(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/ArrayList;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
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

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 57
    const/4 v2, 0x1

    .line 58
    :goto_b
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_ae

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_ae

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "https://nvapi.nicovideo.jp/v1/playlist/series/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?pageSize=100&page="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "GET"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5, p2}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "data"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 60
    const-string v4, "items"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_a6

    .line 61
    move v6, v5

    :goto_46
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v5, v7, :cond_80

    .line 62
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const-string v5, "hasNext"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    const-string v5, "totalCount"

    const-wide v9, 0x7fffffffffffffffL

    invoke-virtual {v3, v5, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v9

    move v3, v2

    move v5, v6

    move v6, v7

    move v7, v8

    move-wide v8, v9

    invoke-static/range {v3 .. v9}, Le/e/a/SeriesPages110;->finished(IIIZZJ)Z

    move-result v3

    if-eqz v3, :cond_71

    .line 64
    return-object v0

    .line 63
    :cond_71
    const/16 v3, 0x3e8

    if-ge v2, v3, :cond_78

    .line 57
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 63
    :cond_78
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Series paging limit exceeded"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 61
    :cond_80
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-static {v7}, Le/e/a/CreatorData;->video(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_8b

    goto :goto_a3

    :cond_8b
    invoke-static {v7}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "/watch/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_a3

    invoke-interface {v1, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9e

    goto :goto_a3

    :cond_9e
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    :cond_a3
    :goto_a3
    add-int/lit8 v5, v5, 0x1

    goto :goto_46

    .line 60
    :cond_a6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Missing series items"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 58
    :cond_ae
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 15

    .line 33
    :try_start_0
    invoke-static {p0, p1, p2}, Le/e/a/SeriesPlayback;->fetch(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {p3, p1}, Le/e/a/SeriesPlayback;->shuffled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_d

    invoke-static {p2}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    :cond_d
    invoke-static {p2}, Le/e/a/SeriesPlayback;->rows(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    .line 34
    const/4 p3, 0x0

    :goto_12
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p3, v0, :cond_1b

    const/4 p2, -0x1

    move v6, p2

    goto :goto_30

    :cond_1b
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4b

    move v6, p3

    .line 35
    :goto_30
    if-ltz v6, :cond_43

    .line 36
    sget-object p2, Le/e/a/SeriesPlayback;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda8;

    move-object v0, p3

    move-object v1, p0

    move-object v2, p5

    move-object v3, p4

    move-object v4, p6

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda8;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;ILjava/lang/String;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 37
    goto :goto_59

    .line 35
    :cond_43
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Current video is not in series"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4b} :catch_4e

    .line 34
    :cond_4b
    add-int/lit8 p3, p3, 0x1

    goto :goto_12

    .line 37
    :catch_4e
    move-exception p1

    sget-object p1, Le/e/a/SeriesPlayback;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda9;

    invoke-direct {p2, p0, p5}, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda9;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_59
    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;ILjava/lang/String;)V
    .registers 9

    .line 36
    sget-object v0, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_d

    monitor-exit v0

    return-void

    :cond_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_40

    :try_start_e
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_3f

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_3f

    const-string p0, "b0"

    invoke-static {p3, p0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    invoke-static {p3, p4, p5}, Le/e/a/SeriesPlayback;->bind(Ljava/lang/Object;Ljava/util/ArrayList;I)V

    sget-object p0, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/SeriesPlayback$QueueState;

    if-eqz p0, :cond_3f

    iput-object p6, p0, Le/e/a/SeriesPlayback$QueueState;->series:Ljava/lang/String;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_3d} :catch_3e

    goto :goto_3f

    :catch_3e
    move-exception p0

    :cond_3f
    :goto_3f
    return-void

    :catchall_40
    move-exception p0

    :try_start_41
    monitor-exit v0
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_40

    throw p0
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 4

    .line 37
    sget-object v0, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    sget-object v1, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_d

    monitor-exit v0

    return-void

    :cond_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_2d

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_2c

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_2c

    const-string p1, "\u30b7\u30ea\u30fc\u30ba\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const-string v0, "Unable to load series"

    const-string v1, "\u7121\u6cd5\u8f09\u5165\u7cfb\u5217"

    invoke-static {p0, p1, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_2c
    return-void

    :catchall_2d
    move-exception p0

    :try_start_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2d

    throw p0
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;Landroid/content/Context;Lorg/json/JSONObject;)V
    .registers 8

    .line 77
    :try_start_0
    invoke-static {p0, p1, p2}, Le/e/a/SeriesPlayback;->fetch(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static {p3, p1}, Le/e/a/SeriesPlayback;->shuffled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_d

    invoke-static {p2}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    :cond_d
    invoke-static {p2}, Le/e/a/SeriesPlayback;->rows(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    .line 78
    const/4 p3, -0x1

    const/4 v0, 0x0

    :goto_13
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_3b

    .line 79
    if-ltz p3, :cond_33

    .line 80
    sget-object p2, Le/e/a/SeriesPlayback;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0, p4, p1, p3}, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;-><init>(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/util/ArrayList;I)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_55
    .catchall {:try_start_0 .. :try_end_25} :catchall_53

    .line 81
    nop

    .line 82
    sget-object p1, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    monitor-enter p1

    :try_start_29
    sget-object p2, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    goto :goto_69

    :catchall_30
    move-exception p0

    monitor-exit p1
    :try_end_32
    .catchall {:try_start_29 .. :try_end_32} :catchall_30

    throw p0

    .line 79
    :cond_33
    :try_start_33
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Selected series video is unavailable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 78
    :cond_3b
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    invoke-static {v1}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p4}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_4d} :catch_55
    .catchall {:try_start_33 .. :try_end_4d} :catchall_53

    if-eqz v1, :cond_50

    move p3, v0

    :cond_50
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 82
    :catchall_53
    move-exception p1

    goto :goto_6d

    .line 81
    :catch_55
    move-exception p1

    :try_start_56
    sget-object p1, Le/e/a/SeriesPlayback;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda11;

    invoke-direct {p2, p0}, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda11;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_60
    .catchall {:try_start_56 .. :try_end_60} :catchall_53

    .line 82
    sget-object p1, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    monitor-enter p1

    :try_start_63
    sget-object p2, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p1

    .line 83
    :goto_69
    return-void

    .line 82
    :catchall_6a
    move-exception p0

    monitor-exit p1
    :try_end_6c
    .catchall {:try_start_63 .. :try_end_6c} :catchall_6a

    throw p0

    :goto_6d
    sget-object p2, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    monitor-enter p2

    :try_start_70
    sget-object p3, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    invoke-interface {p3, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p2
    :try_end_76
    .catchall {:try_start_70 .. :try_end_76} :catchall_77

    throw p1

    :catchall_77
    move-exception p0

    :try_start_78
    monitor-exit p2
    :try_end_79
    .catchall {:try_start_78 .. :try_end_79} :catchall_77

    throw p0
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/util/ArrayList;I)V
    .registers 12

    .line 80
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-static {p1}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v1, p0

    move-object v4, p2

    move v5, p3

    invoke-static/range {v1 .. v7}, Le/e/a/PlaylistPlayback;->launchTap(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;IZZ)V

    :cond_18
    return-void
.end method

.method static synthetic lambda$5(Landroid/app/Activity;)V
    .registers 4

    .line 81
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "Unable to load series"

    const-string v1, "\u7121\u6cd5\u8f09\u5165\u7cfb\u5217"

    const-string v2, "\u30b7\u30ea\u30fc\u30ba\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_18
    return-void
.end method

.method static open(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Z)V
    .registers 13

    .line 71
    move-object v0, p0

    :goto_1
    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_16

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_a

    goto :goto_16

    :cond_a
    move-object v1, v0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, v0, :cond_14

    goto :goto_16

    :cond_14
    move-object v0, v1

    goto :goto_1

    .line 72
    :cond_16
    :goto_16
    instance-of v1, v0, Landroid/app/Activity;

    if-nez v1, :cond_1b

    return-void

    :cond_1b
    move-object v3, v0

    check-cast v3, Landroid/app/Activity;

    .line 73
    if-nez p3, :cond_38

    invoke-static {p2}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "title"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v2, v3

    move-object v3, p0

    invoke-static/range {v2 .. v8}, Le/e/a/PlaylistPlayback;->launchTap(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;IZZ)V

    return-void

    .line 74
    :cond_38
    sget-object p3, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    monitor-enter p3

    :try_start_3b
    sget-object v0, Le/e/a/SeriesPlayback;->BUSY:Ljava/util/Set;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_45

    monitor-exit p3

    return-void

    :cond_45
    monitor-exit p3
    :try_end_46
    .catchall {:try_start_3b .. :try_end_46} :catchall_5b

    .line 75
    new-instance p3, Le/e/a/NetworkTask;

    invoke-direct {p3}, Le/e/a/NetworkTask;-><init>()V

    sget-object v0, Le/e/a/SeriesPlayback;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda7;

    move-object v2, v1

    move-object v4, p1

    move-object v5, p3

    move-object v6, p0

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {p3, v0, v1}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 84
    return-void

    .line 74
    :catchall_5b
    move-exception p0

    :try_start_5c
    monitor-exit p3
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_5b

    throw p0
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 5

    .line 51
    const-string v0, "F0"

    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "U0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    sget-object v1, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3e

    sget-object v1, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    new-instance v2, Le/e/a/SeriesPlayback$QueueState;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v3

    invoke-direct {v2, v3}, Le/e/a/SeriesPlayback$QueueState;-><init>(Z)V

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3c} :catch_3d

    goto :goto_3e

    :catch_3d
    move-exception v0

    :cond_3e
    :goto_3e
    invoke-static {p0}, Le/e/a/SeriesPlayback;->applyRepeat(Ljava/lang/Object;)V

    return-void
.end method

.method public static repeatCompletion(Ljava/lang/Object;)Z
    .registers 6

    .line 54
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "U0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5a

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "F0"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_23

    goto :goto_5a

    :cond_23
    const-string v1, "a0"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_59

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "seekTo"

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    filled-new-array {v4}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "start"

    new-array v4, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_59} :catch_5b

    :cond_59
    return v0

    :cond_5a
    :goto_5a
    return v2

    :catch_5b
    move-exception p0

    return v0
.end method

.method private static rows(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 67
    const-string v0, "e.e.a.x1"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/String;

    const-class v2, Ljava/lang/Object;

    filled-new-array {v1, v2}, [Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 68
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_24

    return-object v2

    :cond_24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    new-array v7, v5, [Ljava/lang/Object;

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string v7, "videourl"

    filled-new-array {v7, v4}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "title"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "thumbnail"

    invoke-static {v3}, Le/e/a/DetailData;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v7, v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v6, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "videoinfo"

    const-string v7, "posttime"

    const-string v8, "length"

    filled-new-array {v8, v3, v7}, [Ljava/lang/String;

    move-result-object v3

    :goto_68
    const/4 v7, 0x3

    if-lt v5, v7, :cond_7c

    const-string v3, "b"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-static {v4}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v6, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_7c
    aget-object v7, v3, v5

    new-instance v8, Landroid/text/SpannableString;

    const-string v9, ""

    invoke-direct {v8, v9}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_68
.end method

.method static shuffled(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 4

    .line 22
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "series_shuffle_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static toggle(Landroid/content/Context;Ljava/lang/String;Z)V
    .registers 13

    .line 26
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "series_continuous_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 27
    invoke-static {p0}, Le/e/a/SeriesPlayback;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    if-nez v2, :cond_25

    return-void

    .line 29
    :cond_25
    :try_start_25
    const-string v0, "v"

    invoke-static {v2, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    const-string v0, "b0"

    invoke-static {v8, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "C1"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_42} :catch_6f

    .line 30
    new-instance v7, Ljava/lang/Object;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    sget-object v0, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    monitor-enter v0

    :try_start_4a
    sget-object v1, Le/e/a/SeriesPlayback;->CHANGES:Ljava/util/Map;

    invoke-interface {v1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_50
    .catchall {:try_start_4a .. :try_end_50} :catchall_6c

    .line 31
    if-nez p2, :cond_58

    const/4 p0, 0x0

    const/4 p1, 0x0

    invoke-static {v8, p0, p1}, Le/e/a/SeriesPlayback;->bind(Ljava/lang/Object;Ljava/util/ArrayList;I)V

    return-void

    .line 32
    :cond_58
    new-instance p2, Le/e/a/NetworkTask;

    invoke-direct {p2}, Le/e/a/NetworkTask;-><init>()V

    sget-object v0, Le/e/a/SeriesPlayback;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda6;

    move-object v1, v9

    move-object v3, p1

    move-object v4, p2

    move-object v5, p0

    invoke-direct/range {v1 .. v8}, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v0, v9}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 38
    return-void

    .line 30
    :catchall_6c
    move-exception p0

    :try_start_6d
    monitor-exit v0
    :try_end_6e
    .catchall {:try_start_6d .. :try_end_6e} :catchall_6c

    throw p0

    .line 29
    :catch_6f
    move-exception p0

    return-void
.end method

.method public static toggleRepeat(Ljava/lang/Object;)V
    .registers 5

    .line 53
    const-string v0, "F0"

    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_13

    const/4 v1, 0x0

    goto :goto_14

    :cond_13
    move v1, v2

    :goto_14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    sget-object v0, Le/e/a/SeriesPlayback;->QUEUES:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/SeriesPlayback$QueueState;

    if-eqz v0, :cond_2b

    iput-boolean v2, v0, Le/e/a/SeriesPlayback$QueueState;->touched:Z

    :cond_2b
    invoke-static {p0}, Le/e/a/SeriesPlayback;->applyRepeat(Ljava/lang/Object;)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2e} :catch_42

    :try_start_2e
    const-string v0, "I1"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences$Editor;

    const-string v0, "player_isloop"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_3f} :catch_40

    goto :goto_4a

    :catch_40
    move-exception p0

    goto :goto_4a

    :catch_42
    move-exception p0

    const-string v0, "nicoid-series"

    const-string v1, "Unable to change repeat"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4a
    return-void
.end method
