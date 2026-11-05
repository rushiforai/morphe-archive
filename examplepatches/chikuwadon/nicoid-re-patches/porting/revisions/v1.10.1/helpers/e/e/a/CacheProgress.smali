.class public final Le/e/a/CacheProgress;
.super Ljava/lang/Object;
.source "CacheProgress.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CacheProgress$RowProgress;
    }
.end annotation


# static fields
.field private static final ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

.field private static final BYTES:Ljava/util/concurrent/atomic/AtomicLong;

.field private static final CHANNEL:Ljava/lang/String; = "nicoid_cache_download"

.field private static ID:I

.field private static final MAIN:Landroid/os/Handler;

.field private static final ROWS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Le/e/a/CacheProgress$RowProgress;",
            ">;"
        }
    .end annotation
.end field

.field private static final SIZE_WORK:Ljava/util/concurrent/ExecutorService;

.field private static volatile app:Landroid/content/Context;

.field private static volatile assetLength:I

.field private static cancel:Landroid/app/PendingIntent;

.field private static volatile completed:Z

.field private static final finishedAssets:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static volatile generation:I

.field private static volatile lastUpdate:J

.field private static volatile plannedAssets:I

.field private static sizeTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field private static tintContext:Landroid/content/Context;

.field private static volatile totalBytes:J

.field private static volatile videoTitle:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 13
    const/16 v0, 0x47f5

    sput v0, Le/e/a/CacheProgress;->ID:I

    .line 15
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    .line 16
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Le/e/a/CacheProgress;->finishedAssets:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    const/4 v0, -0x1

    sput v0, Le/e/a/CacheProgress;->assetLength:I

    .line 22
    const-wide/16 v0, -0x1

    sput-wide v0, Le/e/a/CacheProgress;->totalBytes:J

    .line 23
    const-string v0, ""

    sput-object v0, Le/e/a/CacheProgress;->videoTitle:Ljava/lang/String;

    .line 27
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/CacheProgress;->SIZE_WORK:Ljava/util/concurrent/ExecutorService;

    .line 99
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CacheProgress;->MAIN:Landroid/os/Handler;

    .line 100
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CacheProgress;->ROWS:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .registers 1

    .line 99
    sget-object v0, Le/e/a/CacheProgress;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1()Ljava/util/WeakHashMap;
    .registers 1

    .line 100
    sget-object v0, Le/e/a/CacheProgress;->ROWS:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$2()Ljava/util/concurrent/atomic/AtomicLong;
    .registers 1

    .line 15
    sget-object v0, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$3()J
    .registers 2

    .line 22
    sget-wide v0, Le/e/a/CacheProgress;->totalBytes:J

    return-wide v0
.end method

.method static synthetic access$4(J)Ljava/lang/String;
    .registers 2

    .line 121
    invoke-static {p0, p1}, Le/e/a/CacheProgress;->format(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5()I
    .registers 1

    .line 20
    invoke-static {}, Le/e/a/CacheProgress;->percent()I

    move-result v0

    return v0
.end method

.method static synthetic access$6()Z
    .registers 1

    .line 17
    sget-boolean v0, Le/e/a/CacheProgress;->completed:Z

    return v0
.end method

.method static synthetic access$7()I
    .registers 1

    .line 26
    sget v0, Le/e/a/CacheProgress;->generation:I

    return v0
.end method

.method static synthetic access$8(I)V
    .registers 1

    .line 18
    sput p0, Le/e/a/CacheProgress;->plannedAssets:I

    return-void
.end method

.method public static asset(I)V
    .registers 3

    .line 74
    if-lez p0, :cond_3

    goto :goto_4

    :cond_3
    const/4 p0, -0x1

    :goto_4
    sput p0, Le/e/a/CacheProgress;->assetLength:I

    sget-object p0, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    return-void
.end method

.method public static assetDone()V
    .registers 3

    .line 19
    sget-object v0, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    const/4 v0, -0x1

    sput v0, Le/e/a/CacheProgress;->assetLength:I

    sget-object v0, Le/e/a/CacheProgress;->finishedAssets:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 102
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "d"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1f

    return-void

    .line 103
    :cond_1f
    sget-object p1, Le/e/a/CacheProgress;->ROWS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/CacheProgress$RowProgress;

    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Le/e/a/CacheProgress$RowProgress;->cancel()V

    invoke-virtual {p0, p1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 104
    :cond_2f
    invoke-static {p0}, Le/e/a/VideoRows191;->transfer(Landroid/view/View;)Landroid/widget/TextView;

    move-result-object p1

    instance-of v0, p1, Landroid/widget/TextView;

    if-nez v0, :cond_38

    return-void

    .line 105
    :cond_38
    const-string v0, "videourl"

    invoke-static {p2, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Le/e/a/CacheProgress$RowProgress;

    move-object v1, p1

    check-cast v1, Landroid/widget/TextView;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/CacheProgress$RowProgress;-><init>(Landroid/view/View;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 106
    sget-object p1, Le/e/a/CacheProgress;->ROWS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_55} :catch_56

    goto :goto_57

    .line 107
    :catch_56
    move-exception p0

    :goto_57
    nop

    .line 108
    return-void
.end method

.method public static bytes(I)V
    .registers 7

    .line 76
    if-lez p0, :cond_25

    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-eqz v0, :cond_25

    sget-object v0, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    int-to-long v1, p0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    sget-object p0, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v2, Le/e/a/CacheProgress;->lastUpdate:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x2ee

    cmp-long p0, v2, v4

    if-ltz p0, :cond_25

    sput-wide v0, Le/e/a/CacheProgress;->lastUpdate:J

    const/4 p0, 0x0

    invoke-static {p0}, Le/e/a/CacheProgress;->publish(Z)V

    :cond_25
    return-void
.end method

.method private static cancelSize()V
    .registers 2

    .line 29
    sget v0, Le/e/a/CacheProgress;->generation:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sput v0, Le/e/a/CacheProgress;->generation:I

    sget-object v0, Le/e/a/CacheProgress;->sizeTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_12

    sget-object v0, Le/e/a/CacheProgress;->sizeTask:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    const/4 v0, 0x0

    sput-object v0, Le/e/a/CacheProgress;->sizeTask:Ljava/util/concurrent/Future;

    :cond_12
    return-void
.end method

.method public static done()V
    .registers 2

    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/VideoMarks119;->changed(Landroid/content/Context;)V

    .line 79
    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/CacheProgress;->completed:Z

    invoke-static {}, Le/e/a/CacheProgress;->cancelSize()V

    sget-object v1, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-eqz v1, :cond_15

    invoke-static {v0}, Le/e/a/CacheProgress;->publish(Z)V

    const/4 v0, 0x0

    sput-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    :cond_15
    return-void
.end method

.method public static finishResource(I)I
    .registers 2

    .line 78
    const v0, 0x7f0f0027

    if-eq p0, v0, :cond_6

    return p0

    :cond_6
    sget-boolean v0, Le/e/a/CacheProgress;->completed:Z

    if-eqz v0, :cond_e

    const p0, 0x7f0f0024

    return p0

    :cond_e
    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-eqz v0, :cond_13

    const/4 p0, 0x0

    :cond_13
    return p0
.end method

.method private static format(J)Ljava/lang/String;
    .registers 5

    .line 121
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    long-to-double p0, p0

    const-wide/high16 v1, 0x4090000000000000L    # 1024.0

    div-double/2addr p0, v1

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%.0f KB"

    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 3

    .line 50
    invoke-static {p0, p1, p2}, Le/e/a/CacheProgress;->measure(Ljava/lang/String;Ljava/lang/Object;I)V

    return-void
.end method

.method private static measure(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 5

    .line 53
    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-eqz v0, :cond_4c

    sget v0, Le/e/a/CacheProgress;->generation:I

    if-eq p2, v0, :cond_9

    goto :goto_4c

    .line 54
    :cond_9
    :try_start_9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "cookie"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 55
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance p0, Le/e/a/CacheProgress$1;

    invoke-direct {p0, p2, p1}, Le/e/a/CacheProgress$1;-><init>(ILjava/lang/String;)V

    invoke-static {v0, p0}, Le/e/a/CacheTransferPlan;->bytes(Ljava/net/URL;Le/e/a/CacheTransferPlan$Fetch;)J

    move-result-wide p0

    .line 71
    sget v0, Le/e/a/CacheProgress;->generation:I

    if-ne p2, v0, :cond_4b

    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-eqz v0, :cond_4b

    sput-wide p0, Le/e/a/CacheProgress;->totalBytes:J

    const/4 p0, 0x0

    invoke-static {p0}, Le/e/a/CacheProgress;->publish(Z)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_39} :catch_3a

    .line 72
    goto :goto_4b

    :catch_3a
    move-exception p0

    sget p0, Le/e/a/CacheProgress;->generation:I

    if-eq p2, p0, :cond_40

    return-void

    :cond_40
    const-wide/16 p0, -0x1

    sput-wide p0, Le/e/a/CacheProgress;->totalBytes:J

    const-string p0, "nicoid-cache"

    const-string p1, "Full transfer size unavailable; showing received bytes"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    :cond_4b
    :goto_4b
    return-void

    .line 53
    :cond_4c
    :goto_4c
    return-void
.end method

.method private static percent()I
    .registers 4

    .line 20
    sget-boolean v0, Le/e/a/CacheProgress;->completed:Z

    if-eqz v0, :cond_7

    const/16 v0, 0x64

    return v0

    :cond_7
    sget-wide v0, Le/e/a/CacheProgress;->totalBytes:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_23

    sget-object v0, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x64

    mul-long/2addr v0, v2

    sget-wide v2, Le/e/a/CacheProgress;->totalBytes:J

    div-long/2addr v0, v2

    const-wide/16 v2, 0x63

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0

    :cond_23
    sget v0, Le/e/a/CacheProgress;->plannedAssets:I

    if-lez v0, :cond_59

    sget v0, Le/e/a/CacheProgress;->assetLength:I

    if-lez v0, :cond_3d

    sget-object v0, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    long-to-double v0, v0

    sget v2, Le/e/a/CacheProgress;->assetLength:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    goto :goto_3f

    :cond_3d
    const-wide/16 v0, 0x0

    :goto_3f
    sget-object v2, Le/e/a/CacheProgress;->finishedAssets:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    int-to-double v2, v2

    add-double/2addr v2, v0

    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    mul-double/2addr v2, v0

    sget v0, Le/e/a/CacheProgress;->plannedAssets:I

    int-to-double v0, v0

    div-double/2addr v2, v0

    const-wide v0, 0x4058c00000000000L    # 99.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    double-to-int v0, v0

    return v0

    :cond_59
    const/4 v0, 0x0

    return v0
.end method

.method public static prepare(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5

    .line 50
    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-nez v0, :cond_5

    return-void

    :cond_5
    sget v0, Le/e/a/CacheProgress;->generation:I

    sget-object v1, Le/e/a/CacheProgress;->SIZE_WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1, v0}, Le/e/a/CacheProgress$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/Object;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p0

    sput-object p0, Le/e/a/CacheProgress;->sizeTask:Ljava/util/concurrent/Future;

    .line 51
    return-void
.end method

.method private static declared-synchronized publish(Z)V
    .registers 19

    const-class v1, Le/e/a/CacheProgress;

    monitor-enter v1

    .line 82
    :try_start_3
    sget-object v2, Le/e/a/CacheProgress;->app:Landroid/content/Context;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_1b3

    if-nez v2, :cond_9

    monitor-exit v1

    return-void

    .line 83
    :cond_9
    :try_start_9
    const-string v0, "notification"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/app/NotificationManager;
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_1b3

    if-nez v3, :cond_16

    monitor-exit v1

    return-void

    .line 84
    :cond_16
    :try_start_16
    sget-object v0, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    const-string v6, "%.1f MB"

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Object;

    long-to-float v9, v4

    const/high16 v10, 0x49800000    # 1048576.0f

    div-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v8, v10

    invoke-static {v0, v6, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6
    :try_end_34
    .catchall {:try_start_16 .. :try_end_34} :catchall_1b3

    .line 85
    const-wide/16 v8, 0x0

    :try_start_36
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v11, "s"

    invoke-virtual {v0, v11}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12, v4, v5}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    const-string v11, "r"

    invoke-virtual {v0, v11}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sget-wide v13, Le/e/a/CacheProgress;->totalBytes:J

    cmp-long v11, v13, v8

    if-lez v11, :cond_55

    sget-wide v13, Le/e/a/CacheProgress;->totalBytes:J

    goto :goto_56

    :cond_55
    move-wide v13, v8

    :goto_56
    invoke-virtual {v0, v12, v13, v14}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_59} :catch_5a
    .catchall {:try_start_36 .. :try_end_59} :catchall_1b3

    goto :goto_5b

    :catch_5a
    move-exception v0

    .line 86
    :goto_5b
    if-eqz p0, :cond_60

    :try_start_5d
    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u5b8c\u4e86"

    goto :goto_62

    :cond_60
    const-string v0, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97\u4e2d"

    :goto_62
    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 87
    sget-wide v11, Le/e/a/CacheProgress;->totalBytes:J

    cmp-long v11, v11, v8

    if-lez v11, :cond_6f

    sget-wide v11, Le/e/a/CacheProgress;->totalBytes:J

    goto :goto_72

    :cond_6f
    sget v11, Le/e/a/CacheProgress;->assetLength:I

    int-to-long v11, v11

    :goto_72
    sget-wide v13, Le/e/a/CacheProgress;->totalBytes:J

    cmp-long v13, v13, v8

    if-lez v13, :cond_79

    :goto_78
    goto :goto_80

    :cond_79
    sget-object v4, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    goto :goto_78

    :goto_80
    const/16 v13, 0x64

    if-eqz p0, :cond_88

    move-wide/from16 v16, v11

    move v10, v13

    goto :goto_9d

    :cond_88
    cmp-long v14, v11, v8

    if-lez v14, :cond_9a

    const-wide/16 v14, 0x64

    mul-long/2addr v14, v4

    div-long/2addr v14, v11

    move-wide/from16 v16, v11

    const-wide/16 v10, 0x63

    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    long-to-int v10, v10

    goto :goto_9d

    :cond_9a
    move-wide/from16 v16, v11

    const/4 v10, -0x1

    .line 88
    :goto_9d
    if-eqz p0, :cond_a1

    const/4 v15, 0x0

    goto :goto_105

    :cond_a1
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "\u53d6\u5f97\u6e08\u307f: "

    invoke-static {v12}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 89
    if-ltz v10, :cond_fa

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, " \u00b7 "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v14, Le/e/a/CacheProgress;->totalBytes:J

    cmp-long v8, v14, v8

    if-lez v8, :cond_c6

    const-string v8, ""

    goto :goto_cc

    :cond_c6
    const-string v8, "\u73fe\u5728\u306e\u30d5\u30a1\u30a4\u30eb: "

    invoke-static {v8}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :goto_cc
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v9

    const-string v11, "%d%% (%s / %s)"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/4 v15, 0x0

    aput-object v14, v12, v15

    invoke-static {v4, v5}, Le/e/a/CacheProgress;->format(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v12, v7

    invoke-static/range {v16 .. v17}, Le/e/a/CacheProgress;->format(J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v12, v5

    invoke-static {v9, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_fd

    :cond_fa
    const/4 v15, 0x0

    const-string v4, ""

    :goto_fd
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 88
    :goto_105
    nop

    .line 90
    new-instance v4, Landroid/app/Notification$Builder;

    const-string v5, "nicoid_cache_download"

    invoke-direct {v4, v2, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 91
    const v5, 0x1080081

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    sget-object v8, Le/e/a/CacheProgress;->videoTitle:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_11d

    :goto_11c
    goto :goto_137

    :cond_11d
    new-instance v8, Ljava/lang/StringBuilder;

    sget-object v9, Le/e/a/CacheProgress;->videoTitle:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " \u00b7 "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_11c

    :goto_137
    invoke-virtual {v5, v0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    if-eqz p0, :cond_147

    move v5, v15

    goto :goto_148

    :cond_147
    move v5, v7

    :goto_148
    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    if-gez v10, :cond_14f

    move v13, v15

    :cond_14f
    if-gez v10, :cond_153

    move v5, v15

    goto :goto_154

    :cond_153
    move v5, v10

    :goto_154
    if-gez v10, :cond_15a

    if-nez p0, :cond_15a

    move v10, v7

    goto :goto_15b

    :cond_15a
    move v10, v15

    :goto_15b
    invoke-virtual {v0, v13, v5, v10}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 92
    if-nez p0, :cond_172

    sget-object v0, Le/e/a/CacheProgress;->cancel:Landroid/app/PendingIntent;

    if-eqz v0, :cond_172

    const-string v0, "\u4e2d\u6b62"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v5, Le/e/a/CacheProgress;->cancel:Landroid/app/PendingIntent;

    const v6, 0x1080038

    invoke-virtual {v4, v6, v0, v5}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 93
    :cond_172
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 94
    sget-object v5, Le/e/a/CacheProgress;->tintContext:Landroid/content/Context;

    if-nez v5, :cond_17c

    goto :goto_17e

    :cond_17c
    sget-object v2, Le/e/a/CacheProgress;->tintContext:Landroid/content/Context;

    .line 95
    :goto_17e
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    const v6, 0x7f03005e

    invoke-virtual {v5, v6, v0, v7}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v5

    if-eqz v5, :cond_19f

    iget v5, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez v5, :cond_192

    iget v0, v0, Landroid/util/TypedValue;->data:I

    goto :goto_19c

    :cond_192
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    :goto_19c
    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;
    :try_end_19f
    .catchall {:try_start_5d .. :try_end_19f} :catchall_1b3

    .line 96
    :cond_19f
    :try_start_19f
    sget v0, Le/e/a/CacheProgress;->ID:I

    invoke-virtual {v4}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v3, v0, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_1a8
    .catch Ljava/lang/SecurityException; {:try_start_19f .. :try_end_1a8} :catch_1a9
    .catchall {:try_start_19f .. :try_end_1a8} :catchall_1b3

    goto :goto_1b1

    :catch_1a9
    move-exception v0

    :try_start_1aa
    const-string v0, "nicoid-cache"

    const-string v2, "Cache notification permission unavailable"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b1
    .catchall {:try_start_1aa .. :try_end_1b1} :catchall_1b3

    .line 97
    :goto_1b1
    monitor-exit v1

    return-void

    .line 81
    :catchall_1b3
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static start(Landroid/content/Context;)V
    .registers 8

    .line 36
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    sput v1, Le/e/a/CacheProgress;->ID:I

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "e"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/PendingIntent;

    sput-object v1, Le/e/a/CacheProgress;->cancel:Landroid/app/PendingIntent;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_23} :catch_24

    goto :goto_2b

    :catch_24
    move-exception v1

    const/16 v1, 0x47f5

    sput v1, Le/e/a/CacheProgress;->ID:I

    sput-object v0, Le/e/a/CacheProgress;->cancel:Landroid/app/PendingIntent;

    .line 37
    :goto_2b
    invoke-static {}, Le/e/a/CacheProgress;->cancelSize()V

    const/4 v1, 0x0

    sput-boolean v1, Le/e/a/CacheProgress;->completed:Z

    sput v1, Le/e/a/CacheProgress;->plannedAssets:I

    sget-object v2, Le/e/a/CacheProgress;->finishedAssets:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sput-object v2, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    sget-object v2, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    sget-object v2, Le/e/a/CacheProgress;->ASSET_BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    const/4 v2, -0x1

    sput v2, Le/e/a/CacheProgress;->assetLength:I

    const-wide/16 v5, -0x1

    sput-wide v5, Le/e/a/CacheProgress;->totalBytes:J

    const-string v2, ""

    sput-object v2, Le/e/a/CacheProgress;->videoTitle:Ljava/lang/String;

    sput-wide v3, Le/e/a/CacheProgress;->lastUpdate:J

    .line 38
    sget-object v2, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 39
    const-string v3, "app_theme"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "material_you_mode"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v0, v2}, Le/e/a/ThemeRules;->mode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 40
    sget-object v2, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    const/16 v3, 0x20

    if-ne v2, v3, :cond_81

    const/4 v2, 0x1

    goto :goto_82

    :cond_81
    move v2, v1

    .line 41
    :goto_82
    sget-object v3, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0, v2, v4}, Le/e/a/ThemeRules;->style(Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "style"

    invoke-virtual {v3, v0, v4, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 42
    if-nez v0, :cond_9d

    goto :goto_a4

    :cond_9d
    new-instance p0, Landroid/view/ContextThemeWrapper;

    sget-object v2, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    invoke-direct {p0, v2, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    :goto_a4
    sput-object p0, Le/e/a/CacheProgress;->tintContext:Landroid/content/Context;

    .line 43
    sget-object p0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    .line 44
    if-nez p0, :cond_b3

    return-void

    .line 45
    :cond_b3
    new-instance v0, Landroid/app/NotificationChannel;

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    const-string v4, "nicoid_cache_download"

    invoke-direct {v0, v4, v2, v3}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 46
    invoke-static {v1}, Le/e/a/CacheProgress;->publish(Z)V

    .line 47
    return-void
.end method

.method public static stop()V
    .registers 2

    .line 77
    invoke-static {}, Le/e/a/CacheProgress;->cancelSize()V

    sget-object v0, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    const/4 v1, 0x0

    sput-object v1, Le/e/a/CacheProgress;->app:Landroid/content/Context;

    if-eqz v0, :cond_1b

    :try_start_a
    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_1b

    sget v1, Le/e/a/CacheProgress;->ID:I

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_19
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_19} :catch_1a

    goto :goto_1b

    :catch_1a
    move-exception v0

    :cond_1b
    :goto_1b
    return-void
.end method

.method public static title(Ljava/lang/String;)V
    .registers 1

    .line 48
    if-nez p0, :cond_4

    const-string p0, ""

    :cond_4
    sput-object p0, Le/e/a/CacheProgress;->videoTitle:Ljava/lang/String;

    const/4 p0, 0x0

    invoke-static {p0}, Le/e/a/CacheProgress;->publish(Z)V

    return-void
.end method

.method public static transfer(JJ)V
    .registers 6

    .line 75
    sput-wide p0, Le/e/a/CacheProgress;->totalBytes:J

    sget-object p0, Le/e/a/CacheProgress;->BYTES:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    const/4 p0, 0x0

    invoke-static {p0}, Le/e/a/CacheProgress;->publish(Z)V

    return-void
.end method
