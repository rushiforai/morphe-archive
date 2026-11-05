.class final Le/e/a/BackgroundStart192;
.super Ljava/lang/Object;
.source "BackgroundStart192.java"


# static fields
.field private static paused:Z

.field private static until:J

.field private static video:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 7
    :try_start_0
    const-string v0, "e"

    invoke-static {p1, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_23

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v0, "pause"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1a} :catch_1b

    goto :goto_23

    :catch_1b
    move-exception p0

    const-string p1, "nicoid-player"

    const-string v0, "Unable to preserve paused state"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_23
    :goto_23
    return-void
.end method

.method static prepared(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7

    .line 7
    sget-object v0, Le/e/a/BackgroundStart192;->video:Ljava/lang/String;

    if-eqz v0, :cond_33

    sget-object v0, Le/e/a/BackgroundStart192;->video:Ljava/lang/String;

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_33

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sget-wide v2, Le/e/a/BackgroundStart192;->until:J

    cmp-long p1, v0, v2

    if-lez p1, :cond_1b

    goto :goto_33

    :cond_1b
    sget-boolean p1, Le/e/a/BackgroundStart192;->paused:Z

    const/4 v0, 0x0

    sput-object v0, Le/e/a/BackgroundStart192;->video:Ljava/lang/String;

    if-eqz p1, :cond_33

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Le/e/a/BackgroundStart192$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2, p0}, Le/e/a/BackgroundStart192$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_33
    :goto_33
    return-void
.end method

.method static remember(Ljava/lang/String;Z)V
    .registers 4

    .line 6
    invoke-static {p0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Le/e/a/BackgroundStart192;->video:Ljava/lang/String;

    sput-boolean p1, Le/e/a/BackgroundStart192;->paused:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    const-wide/16 v0, 0x7530

    add-long/2addr p0, v0

    sput-wide p0, Le/e/a/BackgroundStart192;->until:J

    return-void
.end method
