.class public final Le/e/a/Media3Diagnostics276;
.super Ljava/lang/Object;
.source "Media3Diagnostics276.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Media3Diagnostics276$NetworkRetry;,
        Le/e/a/Media3Diagnostics276$Attempt;,
        Le/e/a/Media3Diagnostics276$Probe;
    }
.end annotation


# static fields
.field private static final ATTEMPTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/Media3Diagnostics276$Attempt;",
            ">;"
        }
    .end annotation
.end field

.field private static final EVENT_POSITION_DISCONTINUITY:I = 0xb

.field private static final LOGGED_EVENTS:[I

.field private static final MAIN:Landroid/os/Handler;

.field private static final NETWORK_RETRIES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/Media3Diagnostics276$NetworkRetry;",
            ">;"
        }
    .end annotation
.end field

.field private static final PLAYER_API:Ljava/lang/String; = "androidx.media3.common.Player"

.field private static final PROBES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/Media3Diagnostics276$Probe;",
            ">;"
        }
    .end annotation
.end field

.field private static final SAMPLE_MS:J = 0x3e8L

.field private static final STALLED_SEEK_MS:J = 0x1f40L

.field private static final TAG:Ljava/lang/String; = "nicoid-media-intent"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 21
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/Media3Diagnostics276;->LOGGED_EVENTS:[I

    .line 24
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Media3Diagnostics276;->PROBES:Ljava/util/WeakHashMap;

    .line 28
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Media3Diagnostics276;->ATTEMPTS:Ljava/util/WeakHashMap;

    .line 29
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Media3Diagnostics276;->NETWORK_RETRIES:Ljava/util/WeakHashMap;

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/os/Handler;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/WeakHashMap;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/Media3Diagnostics276;->NETWORK_RETRIES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$1000()Ljava/util/WeakHashMap;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/Media3Diagnostics276;->ATTEMPTS:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 2

    .line 18
    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->canRecover(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2

    .line 18
    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Ljava/lang/Object;)V
    .registers 1

    .line 18
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$500(Ljava/lang/Object;)I
    .registers 1

    .line 18
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method static synthetic access$600(Ljava/lang/Object;)J
    .registers 3

    .line 18
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->number(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$700()Ljava/util/WeakHashMap;
    .registers 1

    .line 18
    sget-object v0, Le/e/a/Media3Diagnostics276;->PROBES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$800(Ljava/lang/Object;)V
    .registers 1

    .line 18
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$900(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .registers 3

    .line 18
    invoke-static {p0, p1, p2}, Le/e/a/Media3Diagnostics276;->eligible(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result p0

    return p0
.end method

.method public static canPreviewLocalMedia(Ljava/lang/Object;)Z
    .registers 4

    .line 35
    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "getCurrentMediaItem"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 36
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 38
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "localConfiguration"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 39
    if-nez p0, :cond_1

    return v0

    .line 40
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "uri"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 41
    instance-of v1, p0, Landroid/net/Uri;

    if-nez v1, :cond_2

    return v0

    .line 42
    :cond_2
    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    .line 43
    const-string v1, "file"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "content"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "android.resource"

    .line 44
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_4

    :cond_3
    const/4 v0, 0x1

    .line 43
    :cond_4
    return v0

    .line 45
    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 46
    :goto_0
    return v0
.end method

.method private static canRecover(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4

    .line 264
    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 265
    const-string v1, "scrubbing"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 266
    const-string v1, "released"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 267
    const-string v1, "bindingRetainedView"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 268
    const-string v0, "getPlayWhenReady"

    invoke-static {p1, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 269
    const-string p0, "getPlaybackSuppressionReason"

    invoke-static {p1, p0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 264
    :goto_0
    return p0
.end method

.method private static cancel(Ljava/lang/Object;)V
    .registers 2

    .line 281
    sget-object v0, Le/e/a/Media3Diagnostics276;->PROBES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/Media3Diagnostics276$Probe;

    .line 282
    if-eqz p0, :cond_0

    sget-object v0, Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 283
    :cond_0
    return-void
.end method

.method private static cancelNetwork(Ljava/lang/Object;)V
    .registers 2

    .line 156
    sget-object v0, Le/e/a/Media3Diagnostics276;->NETWORK_RETRIES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/Media3Diagnostics276$NetworkRetry;

    .line 157
    if-eqz p0, :cond_0

    sget-object v0, Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 158
    :cond_0
    return-void
.end method

.method private static command(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 8

    .line 69
    nop

    .line 70
    const-string v0, "nicoid-media-intent"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    new-instance v3, Ljava/lang/Throwable;

    invoke-direct {v3}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 73
    nop

    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_2

    const/16 v4, 0xa

    if-ge v1, v4, :cond_2

    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_0

    const-string v4, " <- "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    :cond_0
    aget-object v4, v3, v1

    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2e

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v1

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_1
    const/4 v2, 0x0

    .line 78
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "player"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->snapshot(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " caller="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_4
    :goto_1
    const-string p1, ""

    :goto_2
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void
.end method

.method private static eligible(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .registers 4

    .line 258
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 259
    const-string v0, "pendingSeek"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 260
    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->canRecover(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 258
    :goto_0
    return p0
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .line 400
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 401
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 402
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 403
    :catch_0
    move-exception p0

    .line 404
    const/4 p0, 0x0

    return-object p0
.end method

.method private static integer(Ljava/lang/Object;)I
    .registers 2

    .line 273
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method private static isTemporaryNetworkFailure(Ljava/lang/Throwable;)Z
    .registers 4

    .line 128
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    if-eqz p0, :cond_2

    .line 129
    instance-of v2, p0, Ljava/net/UnknownHostException;

    if-nez v2, :cond_1

    instance-of v2, p0, Ljava/net/SocketTimeoutException;

    if-nez v2, :cond_1

    instance-of v2, p0, Ljava/net/ConnectException;

    if-nez v2, :cond_1

    instance-of v2, p0, Ljava/net/NoRouteToHostException;

    if-eqz v2, :cond_0

    goto :goto_1

    .line 128
    :cond_0
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    .line 133
    :cond_1
    :goto_1
    const/4 p0, 0x1

    return p0

    .line 135
    :cond_2
    return v0
.end method

.method private static number(Ljava/lang/Object;)J
    .registers 3

    .line 277
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method private static observe(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11

    .line 219
    if-eqz p0, :cond_9

    if-eqz p1, :cond_9

    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_0

    goto/16 :goto_1

    .line 220
    :cond_0
    const-string v0, "getPlaybackState"

    invoke-static {p1, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I

    move-result v0

    .line 221
    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 222
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 223
    sget-object p0, Le/e/a/Media3Diagnostics276;->ATTEMPTS:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    return-void

    .line 226
    :cond_1
    invoke-static {p0, p1, v0}, Le/e/a/Media3Diagnostics276;->eligible(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 227
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 228
    return-void

    .line 230
    :cond_2
    const-string v0, "getCurrentMediaItem"

    invoke-static {p1, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 231
    const-string v0, "getCurrentPosition"

    invoke-static {p1, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Media3Diagnostics276;->number(Ljava/lang/Object;)J

    move-result-wide v5

    .line 232
    const-string v0, "getBufferedPosition"

    invoke-static {p1, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Media3Diagnostics276;->number(Ljava/lang/Object;)J

    move-result-wide v7

    .line 233
    if-eqz v4, :cond_8

    const-wide/16 v0, 0x0

    cmp-long v2, v5, v0

    if-ltz v2, :cond_8

    cmp-long v0, v7, v0

    if-gez v0, :cond_3

    move-object v2, p0

    goto :goto_0

    .line 237
    :cond_3
    sget-object v0, Le/e/a/Media3Diagnostics276;->ATTEMPTS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/Media3Diagnostics276$Attempt;

    .line 238
    if-eqz v0, :cond_4

    iget-object v1, v0, Le/e/a/Media3Diagnostics276$Attempt;->item:Ljava/lang/Object;

    if-eq v1, v4, :cond_5

    .line 239
    :cond_4
    new-instance v0, Le/e/a/Media3Diagnostics276$Attempt;

    invoke-direct {v0, v4}, Le/e/a/Media3Diagnostics276$Attempt;-><init>(Ljava/lang/Object;)V

    .line 240
    sget-object v1, Le/e/a/Media3Diagnostics276;->ATTEMPTS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    :cond_5
    iget-boolean v0, v0, Le/e/a/Media3Diagnostics276$Attempt;->used:Z

    if-eqz v0, :cond_6

    .line 243
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 244
    return-void

    .line 246
    :cond_6
    sget-object v0, Le/e/a/Media3Diagnostics276;->PROBES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/Media3Diagnostics276$Probe;

    .line 247
    if-eqz v0, :cond_7

    iget-object v1, v0, Le/e/a/Media3Diagnostics276$Probe;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_7

    iget-object v1, v0, Le/e/a/Media3Diagnostics276$Probe;->item:Ljava/lang/Object;

    if-ne v1, v4, :cond_7

    .line 248
    invoke-virtual {v0, v5, v6, v7, v8}, Le/e/a/Media3Diagnostics276$Probe;->recordProgress(JJ)V

    .line 249
    return-void

    .line 251
    :cond_7
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 252
    new-instance v1, Le/e/a/Media3Diagnostics276$Probe;

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Le/e/a/Media3Diagnostics276$Probe;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JJ)V

    .line 253
    sget-object p0, Le/e/a/Media3Diagnostics276;->PROBES:Ljava/util/WeakHashMap;

    invoke-virtual {p0, v2, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object p0, Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 255
    return-void

    .line 233
    :cond_8
    move-object v2, p0

    .line 234
    :goto_0
    invoke-static {v2}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 235
    return-void

    .line 219
    :cond_9
    :goto_1
    return-void
.end method

.method public static onError(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 6

    .line 111
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 112
    nop

    .line 114
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "errorCode"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    goto :goto_1

    .line 115
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_0
    const/4 v0, 0x0

    .line 117
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 118
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error code="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " cause="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 119
    if-nez v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_2

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_2
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 120
    const-string v1, "player"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->snapshot(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 118
    const-string v1, "nicoid-media-intent"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-static {p1}, Le/e/a/Media3Diagnostics276;->isTemporaryNetworkFailure(Ljava/lang/Throwable;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->retryNetwork(Ljava/lang/Object;)V

    goto :goto_3

    .line 122
    :cond_1
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 123
    :goto_3
    return-void
.end method

.method public static onEvents(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    .line 82
    if-eqz p0, :cond_5

    if-eqz p1, :cond_5

    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_0

    goto/16 :goto_5

    .line 83
    :cond_0
    nop

    .line 85
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "contains"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v0

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 86
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 87
    const/16 v3, 0xb

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, p2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 86
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 89
    :try_start_1
    sget-object v3, Le/e/a/Media3Diagnostics276;->LOGGED_EVENTS:[I

    array-length v4, v3

    :goto_0
    if-ge v0, v4, :cond_2

    aget v5, v3, v0

    .line 90
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, p2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 91
    const-string p2, "nicoid-media-intent"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Media3 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->snapshot(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 92
    goto :goto_1

    .line 89
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_2
    :goto_1
    goto :goto_4

    .line 95
    :catch_0
    move-exception p2

    goto :goto_2

    :catch_1
    move-exception p2

    :goto_2
    move v0, v2

    goto :goto_3

    :catch_2
    move-exception p2

    goto :goto_3

    :catch_3
    move-exception p2

    :goto_3
    move v2, v0

    .line 98
    :goto_4
    if-eqz v2, :cond_3

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 99
    :cond_3
    const-string p2, "getPlaybackState"

    invoke-static {p1, p2}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I

    move-result p2

    const/4 v0, 0x3

    if-ne p2, v0, :cond_4

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 100
    :cond_4
    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->observe(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    return-void

    .line 82
    :cond_5
    :goto_5
    return-void
.end method

.method public static onHandoffPause(Ljava/lang/Object;)V
    .registers 2

    .line 63
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 64
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 65
    const-string v0, "Handoff pause"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->command(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public static onPause(Ljava/lang/Object;)V
    .registers 2

    .line 57
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    .line 58
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 59
    const-string v0, "Pause"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->command(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public static onPlayIntentChange(Ljava/lang/Object;ZI)V
    .registers 5

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Play intent ready="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 105
    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->snapshot(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 104
    const-string v1, "nicoid-media-intent"

    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    if-eqz p1, :cond_0

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->observe(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 107
    :cond_0
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 108
    :goto_0
    return-void
.end method

.method public static onStart(Ljava/lang/Object;)V
    .registers 2

    .line 51
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 52
    const-string v0, "Start"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->command(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->observe(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method private static playerValues(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 379
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "getPlaybackState"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ready="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 380
    const-string v1, "getPlayWhenReady"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " suppression="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 381
    const-string v1, "getPlaybackSuppressionReason"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 382
    const-string v1, "getCurrentPosition"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " buffered="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 383
    const-string v1, "getBufferedPosition"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " loading="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 384
    const-string v1, "isLoading"

    invoke-static {p0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " tracksEmpty="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 385
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->tracksEmpty(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 379
    return-object p0
.end method

.method private static read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6

    .line 409
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 413
    :cond_0
    :try_start_0
    const-string v1, "androidx.media3.common.Player"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 414
    new-array v2, v3, [Ljava/lang/Class;

    invoke-virtual {v1, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 415
    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 416
    :goto_0
    return-object v0
.end method

.method private static retryNetwork(Ljava/lang/Object;)V
    .registers 5

    .line 139
    const-string v0, "player"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 140
    if-eqz p0, :cond_3

    if-eqz v0, :cond_3

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->canRecover(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 141
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->canPreviewLocalMedia(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 142
    :cond_0
    const-string v1, "getCurrentMediaItem"

    invoke-static {v0, v1}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 143
    if-nez v1, :cond_1

    return-void

    .line 144
    :cond_1
    sget-object v2, Le/e/a/Media3Diagnostics276;->NETWORK_RETRIES:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/Media3Diagnostics276$NetworkRetry;

    .line 145
    if-eqz v2, :cond_2

    iget-object v3, v2, Le/e/a/Media3Diagnostics276$NetworkRetry;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_2

    iget-object v3, v2, Le/e/a/Media3Diagnostics276$NetworkRetry;->item:Ljava/lang/Object;

    if-ne v3, v1, :cond_2

    .line 146
    invoke-virtual {v2}, Le/e/a/Media3Diagnostics276$NetworkRetry;->queue()V

    .line 147
    return-void

    .line 149
    :cond_2
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V

    .line 150
    new-instance v2, Le/e/a/Media3Diagnostics276$NetworkRetry;

    invoke-direct {v2, p0, v0, v1}, Le/e/a/Media3Diagnostics276$NetworkRetry;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    sget-object v0, Le/e/a/Media3Diagnostics276;->NETWORK_RETRIES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    invoke-virtual {v2}, Le/e/a/Media3Diagnostics276$NetworkRetry;->queue()V

    .line 153
    return-void

    .line 141
    :cond_3
    :goto_0
    return-void
.end method

.method private static snapshot(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    .line 370
    invoke-static {p1}, Le/e/a/Media3Diagnostics276;->playerValues(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 371
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "player="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " engine="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 372
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " scrubbing="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 373
    const-string v0, "scrubbing"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " seeking="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 374
    const-string v0, "pendingSeek"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " retained="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 375
    const-string v0, "bindingRetainedView"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 371
    return-object p0
.end method

.method private static tracksEmpty(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    .line 389
    const-string v0, "getCurrentTracks"

    invoke-static {p0, v0}, Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 390
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 392
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "isEmpty"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 393
    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 394
    :goto_0
    return-object v0
.end method
