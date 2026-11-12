.class public abstract Loz7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/CountDownLatch;

.field public static b:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    sput-object v0, Loz7;->a:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method

.method public static final a(Landroid/content/Context;Lvh9;)Z
    .registers 7

    sget-object v0, Loz7;->a:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    const/4 v2, 0x1

    if-nez v1, :cond_e

    return v2

    :cond_e
    new-instance v1, Lgb3;

    const/16 v3, 0x1b

    invoke-direct {v1, p0, p1, v3}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {v1}, Lgb3;->invoke()Ljava/lang/Object;

    return v2

    :cond_27
    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p1, Lbn7;

    const/16 v2, 0xa

    invoke-direct {p1, v1, v2}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :try_start_3a
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0
    :try_end_42
    .catch Ljava/lang/InterruptedException; {:try_start_3a .. :try_end_42} :catch_43

    return p0

    :catch_43
    const/4 p0, 0x0

    return p0
.end method
