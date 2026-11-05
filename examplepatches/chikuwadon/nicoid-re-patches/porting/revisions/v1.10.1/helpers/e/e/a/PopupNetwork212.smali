.class public final Le/e/a/PopupNetwork212;
.super Ljava/lang/Object;
.source "PopupNetwork212.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final ACTIVE:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/PopupNetwork212;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private previous:J

.field private stalled:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PopupNetwork212;->ACTIVE:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .registers 4

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Le/e/a/PopupNetwork212;->handler:Landroid/os/Handler;

    const-wide/16 v0, -0x1

    .line 13
    iput-wide v0, p0, Le/e/a/PopupNetwork212;->previous:J

    .line 14
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PopupNetwork212;->owner:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private static call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
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

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static prepared(Ljava/lang/Object;Z)V
    .registers 3

    if-eqz p1, :cond_18

    .line 15
    instance-of p1, p0, Landroid/app/Service;

    if-nez p1, :cond_7

    goto :goto_18

    :cond_7
    const/4 p1, 0x1

    invoke-static {p0, p1}, Le/e/a/PopupNetwork212;->stop(Ljava/lang/Object;Z)V

    new-instance p1, Le/e/a/PopupNetwork212;

    invoke-direct {p1, p0}, Le/e/a/PopupNetwork212;-><init>(Ljava/lang/Object;)V

    sget-object v0, Le/e/a/PopupNetwork212;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Le/e/a/PopupNetwork212;->run()V

    :cond_18
    :goto_18
    return-void
.end method

.method public static stop(Ljava/lang/Object;Z)V
    .registers 2

    if-nez p1, :cond_3

    return-void

    .line 16
    :cond_3
    sget-object p1, Le/e/a/PopupNetwork212;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PopupNetwork212;

    if-eqz p0, :cond_12

    iget-object p1, p0, Le/e/a/PopupNetwork212;->handler:Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_12
    return-void
.end method


# virtual methods
.method public run()V
    .registers 14

    .line 20
    iget-object v0, p0, Le/e/a/PopupNetwork212;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_118

    sget-object v1, Le/e/a/PopupNetwork212;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p0, :cond_12

    goto/16 :goto_118

    .line 22
    :cond_12
    :try_start_12
    move-object v1, v0

    check-cast v1, Landroid/app/Service;

    const-string v2, "e"

    invoke-static {v0, v2}, Le/e/a/PopupNetwork212;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v2, "getCurrentPosition"

    invoke-static {v0, v2}, Le/e/a/PopupNetwork212;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 23
    const-string v4, "getBufferPercentage"

    invoke-static {v0, v4}, Le/e/a/PopupNetwork212;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    const-string v5, "isPlaying"

    invoke-static {v0, v5}, Le/e/a/PopupNetwork212;->call(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 24
    iget-wide v5, p0, Le/e/a/PopupNetwork212;->previous:J

    const/4 v7, 0x1

    const/4 v8, 0x0

    cmp-long v9, v2, v5

    if-nez v9, :cond_4b

    iget v5, p0, Le/e/a/PopupNetwork212;->stalled:I

    add-int/2addr v5, v7

    goto :goto_4c

    :cond_4b
    const/4 v5, 0x0

    :goto_4c
    iput v5, p0, Le/e/a/PopupNetwork212;->stalled:I

    iput-wide v2, p0, Le/e/a/PopupNetwork212;->previous:J

    .line 25
    new-instance v5, Landroid/app/ActivityManager$RunningAppProcessInfo;

    invoke-direct {v5}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    invoke-static {v5}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    .line 26
    const-string v6, "connectivity"

    invoke-virtual {v1, v6}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/ConnectivityManager;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v9

    .line 27
    const-string v10, "power"

    invoke-virtual {v1, v10}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/os/PowerManager;

    .line 28
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "PopupNetwork importance="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " playing="

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " positionMs="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " bufferPercent="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " unchangedSamples="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Le/e/a/PopupNetwork212;->stalled:I

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " connected="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v9, :cond_a8

    invoke-virtual {v9}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_a8

    goto :goto_a9

    :cond_a8
    const/4 v7, 0x0

    :goto_a9
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " metered="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " saver="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v0, v2, :cond_c8

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getRestrictBackgroundStatus()I

    move-result v0

    goto :goto_c9

    :cond_c8
    const/4 v0, -0x1

    :goto_c9
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " powerSave="

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result v0

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 29
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_103

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " backgroundRestricted="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "activity"

    invoke-virtual {v1, v0}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->isBackgroundRestricted()Z

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 30
    :cond_103
    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_106
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_106} :catch_109
    .catch Ljava/lang/LinkageError; {:try_start_12 .. :try_end_106} :catch_107

    goto :goto_111

    :catch_107
    move-exception v0

    goto :goto_10a

    :catch_109
    move-exception v0

    .line 31
    :goto_10a
    const-string v1, "nicoid-popup"

    const-string v2, "Popup network state unavailable"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 32
    :goto_111
    iget-object v0, p0, Le/e/a/PopupNetwork212;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x2710

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_118
    :goto_118
    return-void
.end method
