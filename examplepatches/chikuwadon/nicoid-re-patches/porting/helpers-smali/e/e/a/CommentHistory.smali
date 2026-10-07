.class public final Le/e/a/CommentHistory;
.super Ljava/lang/Object;
.source "CommentHistory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentHistory$Job;
    }
.end annotation


# static fields
.field private static final dateFormats:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final pending:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentHistory$Job;",
            ">;"
        }
    .end annotation
.end field

.field private static final replay:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 12
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;

    .line 13
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CommentHistory;->dateFormats:Ljava/lang/ThreadLocal;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CommentHistory;->pending:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    invoke-static {p0, p1}, Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 1

    .line 46
    invoke-static {p0}, Le/e/a/CommentHistory;->threadId(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Lorg/json/JSONObject;)J
    .registers 3

    .line 39
    invoke-static {p0}, Le/e/a/CommentHistory;->posted(Lorg/json/JSONObject;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-static {p0, p1, p2, p3}, Le/e/a/CommentHistory;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Ljava/lang/String;)V
    .registers 1

    .line 36
    invoke-static {p0}, Le/e/a/CommentHistory;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$5()Ljava/lang/ThreadLocal;
    .registers 1

    .line 12
    sget-object v0, Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method public static extend(Ljava/lang/Object;)V
    .registers 3

    .line 33
    sget-object v0, Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_9

    return-void

    .line 34
    :cond_9
    sget-object v0, Le/e/a/CommentHistory;->pending:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CommentHistory$Job;

    if-eqz p0, :cond_1d

    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-comment-history"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 35
    :cond_1d
    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static initial(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    sget-object v0, Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_b

    return-object v0

    .line 25
    :cond_b
    invoke-static {p0, p1, p2, p3}, Le/e/a/CommentHistory;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 26
    const-string v0, "K"

    invoke-static {p0, v0}, Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 27
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "comment_fetch_limit"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 28
    sget-object v1, Le/e/a/CommentHistory;->pending:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    if-lez v0, :cond_3e

    sget-object v7, Le/e/a/CommentHistory;->pending:Ljava/util/Map;

    new-instance v8, Le/e/a/CommentHistory$Job;

    const/16 v1, 0x2710

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Le/e/a/CommentHistory$Job;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v7, p0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    :cond_3e
    return-object p3
.end method

.method private static log(Ljava/lang/String;)V
    .registers 7

    .line 37
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

    .line 38
    :goto_1e
    return-void
.end method

.method private static posted(Lorg/json/JSONObject;)J
    .registers 5

    .line 40
    const-string v0, "postedAt"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 41
    :try_start_6
    sget-object v0, Le/e/a/CommentHistory;->dateFormats:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    if-nez v0, :cond_27

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    sget-object v1, Le/e/a/CommentHistory;->dateFormats:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_27
    const/4 v1, 0x0

    const/16 v2, 0x13

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    .line 42
    const-string v2, "+09:00"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_3f} :catch_45

    if-eqz p0, :cond_44

    const-wide/16 v2, 0x7e90

    sub-long/2addr v0, v2

    .line 43
    :cond_44
    return-wide v0

    .line 44
    :catch_45
    move-exception p0

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private static request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 20
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

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 21
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    aput-object p3, v1, v7

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static threadId(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 3

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "fork"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
