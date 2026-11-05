.class public final Le/e/a/Quality195;
.super Ljava/lang/Object;
.source "Quality195.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Quality195$State;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/Quality195$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 13
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Quality195;->MAIN:Landroid/os/Handler;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .registers 1

    .line 13
    sget-object v0, Le/e/a/Quality195;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1()Ljava/util/WeakHashMap;
    .registers 1

    .line 14
    sget-object v0, Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$2(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    invoke-static {p0, p1}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    invoke-static {p0, p1, p2}, Le/e/a/Quality195;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$4(Ljava/lang/Object;Z)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 113
    invoke-static {p0, p1}, Le/e/a/Quality195;->update(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic access$5(Ljava/lang/String;)V
    .registers 1

    .line 19
    invoke-static {p0}, Le/e/a/Quality195;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$6(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-static {p0, p1, p2, p3}, Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static change(Ljava/lang/Object;ZI)V
    .registers 13

    .line 73
    if-eqz p1, :cond_5

    :try_start_2
    const-string v0, "z"

    goto :goto_7

    :cond_5
    const-string v0, "h1"

    :goto_7
    invoke-static {p0, v0}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_b} :catch_8e

    const-string v0, "e"

    if-eqz p1, :cond_11

    move-object v1, v0

    goto :goto_13

    :cond_11
    :try_start_11
    const-string v1, "a0"

    :goto_13
    invoke-static {p0, v1}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    if-eqz p1, :cond_1c

    const-string v1, "f"

    goto :goto_1e

    :cond_1c
    const-string v1, "b0"

    :goto_1e
    invoke-static {p0, v1}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    .line 74
    if-eqz v2, :cond_8d

    if-eqz v9, :cond_8d

    if-eqz v3, :cond_8d

    if-nez p1, :cond_36

    const-string v1, "x1"

    invoke-static {p0, v1}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_36

    goto :goto_8d

    .line 75
    :cond_36
    const/4 v1, 0x0

    const/4 v4, 0x1

    if-nez p2, :cond_3c

    const/4 p2, 0x0

    goto :goto_41

    :cond_3c
    if-ne p2, v4, :cond_40

    const/4 p2, 0x3

    goto :goto_41

    :cond_40
    const/4 p2, 0x4

    :goto_41
    invoke-static {v2, v0}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v7

    if-ne p2, v7, :cond_4e

    return-void

    .line 76
    :cond_4e
    sget-object v5, Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v5, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/Quality195$State;

    if-nez v6, :cond_61

    new-instance v6, Le/e/a/Quality195$State;

    const/4 v8, 0x0

    invoke-direct {v6, v8}, Le/e/a/Quality195$State;-><init>(Le/e/a/Quality195$State;)V

    invoke-virtual {v5, p0, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_61
    move-object v5, v6

    iget v6, v5, Le/e/a/Quality195$State;->generation:I

    add-int/2addr v6, v4

    iput v6, v5, Le/e/a/Quality195$State;->generation:I

    .line 77
    iput-boolean v1, v5, Le/e/a/Quality195$State;->pending:Z

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v2, v0, p2}, Le/e/a/Quality195;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    invoke-static {v9, v2}, Le/e/a/Quality195;->select(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7a

    invoke-static {p0, p1}, Le/e/a/Quality195;->update(Ljava/lang/Object;Z)V

    return-void

    .line 80
    :cond_7a
    new-instance p2, Ljava/lang/Thread;

    new-instance v0, Le/e/a/Quality195$1;

    move-object v1, v0

    move-object v4, p0

    move v8, p1

    invoke-direct/range {v1 .. v9}, Le/e/a/Quality195$1;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Le/e/a/Quality195$State;IIZLjava/lang/Object;)V

    .line 96
    const-string p0, "nicoid-quality"

    .line 80
    invoke-direct {p2, v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 96
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V
    :try_end_8c
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_8c} :catch_8e

    .line 97
    goto :goto_af

    .line 74
    :cond_8d
    :goto_8d
    return-void

    .line 97
    :catch_8e
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Quality: selection failed ("

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Quality195;->log(Ljava/lang/String;)V

    .line 98
    :goto_af
    return-void
.end method

.method public static destroy(Ljava/lang/Object;)V
    .registers 2

    .line 117
    sget-object v0, Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static height(Ljava/lang/String;)I
    .registers 3

    .line 26
    const/4 v0, -0x1

    if-nez p0, :cond_4

    return v0

    :cond_4
    const-string v1, "([0-9]{3,4})p"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1d

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    :cond_1d
    return v0
.end method

.method private static log(Ljava/lang/String;)V
    .registers 7

    .line 19
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    :catch_1d
    move-exception p0

    :goto_1e
    return-void
.end method

.method public static outputs(Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    invoke-static {p0, p1, p2, p3}, Le/e/a/CastControls218;->outputs(Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {v0, p3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 56
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "r"

    invoke-static {p0, v1}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_52

    .line 57
    const-string p0, "videos"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 58
    const/4 p1, 0x0

    :goto_24
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-ge p1, p3, :cond_52

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result p3

    const/4 v1, 0x4

    if-lt p3, v1, :cond_32

    goto :goto_52

    :cond_32
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p3

    if-eqz p3, :cond_4f

    const-string v1, "isAvailable"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4f

    const-string v1, "id"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4f

    invoke-virtual {v0, p3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_4f
    add-int/lit8 p1, p1, 0x1

    goto :goto_24

    .line 60
    :cond_52
    :goto_52
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_62

    return-object p0

    :cond_62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, p3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p3

    invoke-virtual {p3, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p3

    invoke-virtual {p0, p3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5b
.end method

.method public static prepared(Ljava/lang/Object;Z)V
    .registers 10

    .line 101
    if-eqz p1, :cond_5

    :try_start_2
    const-string v0, "e"

    goto :goto_7

    :cond_5
    const-string v0, "a0"

    :goto_7
    invoke-static {p0, v0}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz p1, :cond_10

    const-string v1, "z"

    goto :goto_12

    :cond_10
    const-string v1, "h1"

    :goto_12
    invoke-static {p0, v1}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v0, :cond_99

    if-nez v1, :cond_1c

    goto/16 :goto_99

    .line 102
    :cond_1c
    invoke-static {v0, v1}, Le/e/a/Quality195;->select(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 103
    sget-object v1, Le/e/a/Quality195;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/Quality195$State;

    .line 104
    if-eqz v1, :cond_bb

    iget-boolean v2, v1, Le/e/a/Quality195$State;->pending:Z

    if-eqz v2, :cond_bb

    iget-object v2, v1, Le/e/a/Quality195$State;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_bb

    iget-object v2, v1, Le/e/a/Quality195$State;->video:Ljava/lang/String;

    if-eqz p1, :cond_3c

    const-string v3, "f"

    goto :goto_3e

    :cond_3c
    const-string v3, "b0"

    :goto_3e
    invoke-static {p0, v3}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_bb

    .line 105
    const/4 v2, 0x0

    iput-boolean v2, v1, Le/e/a/Quality195$State;->pending:Z

    const-string v3, "seekTo"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v2

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v6, v1, Le/e/a/Quality195$State;->position:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v2

    invoke-static {v0, v3, v5, v4}, Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    invoke-static {p0}, Le/e/a/PlaybackSession;->allowRetry(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_69

    iput-boolean v2, v1, Le/e/a/Quality195$State;->resume:Z

    .line 107
    :cond_69
    iget-boolean v1, v1, Le/e/a/Quality195$State;->resume:Z

    if-eqz v1, :cond_70

    const-string v1, "start"

    goto :goto_72

    :cond_70
    const-string v1, "pause"

    :goto_72
    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    if-eqz p1, :cond_8a

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string p1, "t0"

    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    goto :goto_93

    :cond_8a
    const-string p1, "k0"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, p1, v0}, Le/e/a/Quality195;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 109
    :goto_93
    const-string p0, "Quality: restored current playback position"

    invoke-static {p0}, Le/e/a/Quality195;->log(Ljava/lang/String;)V
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_98} :catch_9a

    .line 111
    goto :goto_bb

    .line 101
    :cond_99
    :goto_99
    return-void

    .line 111
    :catch_9a
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Quality: prepare update failed ("

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Quality195;->log(Ljava/lang/String;)V

    .line 112
    :cond_bb
    :goto_bb
    return-void
.end method

.method private static put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const-class v1, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v1, v3, v5

    const/4 v6, 0x2

    aput-object v1, v3, v6

    const/4 v7, 0x3

    aput-object v1, v3, v7

    const-string v1, "request"

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 65
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "outputs"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 66
    const/4 v8, 0x0

    :try_start_2d
    new-array v9, v2, [Ljava/lang/Object;

    aput-object p0, v9, v4

    aput-object p1, v9, v5

    aput-object p2, v9, v6

    aput-object p3, v9, v7

    invoke-virtual {v0, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Le/e/a/Quality195;->valid(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_4b

    if-eqz v1, :cond_4b

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v10
    :try_end_49
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2d .. :try_end_49} :catch_4c

    if-ge v10, v6, :cond_55

    :cond_4b
    return-object v9

    :catch_4c
    move-exception v9

    if-eqz v1, :cond_85

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v10, v6, :cond_85

    .line 67
    :cond_55
    const-string v9, "Quality: retrying single-variant session"

    invoke-static {v9}, Le/e/a/Quality195;->log(Ljava/lang/String;)V

    .line 68
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p2, Lorg/json/JSONArray;

    invoke-direct {p2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {v9, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    aput-object p3, v1, v7

    invoke-virtual {v0, v8, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 66
    :cond_85
    throw v9
.end method

.method public static select(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 15

    invoke-static {p0}, Le/e/a/Playback214;->manual(Ljava/lang/Object;)V

    .line 30
    const-string v0, "b"

    const/4 v1, 0x0

    :try_start_6
    invoke-static {p1}, Le/e/a/Quality195;->target(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_d

    return v1

    :cond_d
    invoke-static {p1}, Le/e/a/Quality195;->height(Ljava/lang/String;)I

    move-result v2

    .line 31
    const-string v3, "getAvailableTracks"

    new-array v4, v1, [Ljava/lang/Class;

    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {p0, v3, v4, v5}, Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/util/Map;

    if-nez v4, :cond_20

    return v1

    .line 32
    :cond_20
    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_32

    .line 50
    goto/16 :goto_fc

    .line 32
    :cond_32
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 33
    const-string v5, "VIDEO"

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_49

    goto :goto_2a

    .line 34
    :cond_49
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v0}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    .line 35
    nop

    .line 36
    const/4 v5, -0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    :goto_57
    array-length v8, v3

    if-lt v7, v8, :cond_5b

    goto :goto_90

    .line 37
    :cond_5b
    aget-object v8, v3, v7

    invoke-static {v8, v0}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/Object;

    .line 38
    const/4 v9, 0x0

    :goto_64
    array-length v10, v8

    if-lt v9, v10, :cond_68

    goto :goto_8e

    .line 39
    :cond_68
    aget-object v10, v8, v9

    const-string v11, "a"

    invoke-static {v10, v11}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const-string v12, "n"

    invoke-static {v10, v12}, Le/e/a/Quality195;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v10

    .line 40
    invoke-virtual {p1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_8c

    if-lez v2, :cond_89

    if-ne v10, v2, :cond_89

    goto :goto_8c

    .line 38
    :cond_89
    add-int/lit8 v9, v9, 0x1

    goto :goto_64

    .line 40
    :cond_8c
    :goto_8c
    move v5, v7

    move v6, v9

    .line 42
    :goto_8e
    if-ltz v5, :cond_d7

    .line 44
    :goto_90
    if-gez v5, :cond_93

    return v1

    .line 45
    :cond_93
    const-string v0, "com.devbrackets.android.exomedia.ExoMedia$RendererType"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 46
    const-string v2, "setTrack"

    const/4 v3, 0x3

    new-array v7, v3, [Ljava/lang/Class;

    aput-object v0, v7, v1

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x1

    aput-object v0, v7, v8

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x2

    aput-object v0, v7, v9

    new-array v0, v3, [Ljava/lang/Object;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v9

    invoke-static {p0, v2, v7, v0}, Le/e/a/Quality195;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string p0, "e.e.a.ModernControls"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v0, "selectedVideo"

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    const-string p0, "Quality: selected existing HLS variant"

    invoke-static {p0}, Le/e/a/Quality195;->log(Ljava/lang/String;)V
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_d6} :catch_db

    return v8

    .line 36
    :cond_d7
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_57

    .line 50
    :catch_db
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Quality: variant selection unavailable ("

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Quality195;->log(Ljava/lang/String;)V

    .line 51
    :goto_fc
    return v1
.end method

.method private static target(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Le/e/a/Playback214;->targetVideo(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static update(Ljava/lang/Object;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 114
    if-eqz p1, :cond_5

    const-string v0, "e.e.a.ModernEnhancements"

    goto :goto_7

    :cond_5
    const-string v0, "e.e.a.ModernControls"

    :goto_7
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 115
    const-string v1, "update"

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p1, :cond_1c

    new-array p1, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/Object;

    aput-object v4, p1, v2

    invoke-virtual {v0, v1, p1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    goto :goto_28

    :cond_1c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    new-array v4, v3, [Ljava/lang/Class;

    aput-object p1, v4, v2

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    :goto_28
    invoke-virtual {p1, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v0, v3, [Ljava/lang/Object;

    aput-object p0, v0, v2

    const/4 p0, 0x0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    return-void
.end method

.method private static valid(Ljava/lang/String;)Z
    .registers 3

    .line 70
    const/4 v0, 0x0

    if-eqz p0, :cond_1d

    :try_start_3
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "data"

    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "contentUrl"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_18} :catch_1c

    if-nez p0, :cond_1d

    const/4 p0, 0x1

    return p0

    :catch_1c
    move-exception p0

    :cond_1d
    return v0
.end method
