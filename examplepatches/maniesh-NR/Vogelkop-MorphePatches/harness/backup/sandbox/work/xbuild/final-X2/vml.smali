.class public abstract Lvml;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/ScheduledExecutorService;

.field public static final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public static final c:Ljava/util/concurrent/ScheduledExecutorService;

.field public static final d:Lumi;

.field public static final e:Lwjh;

.field public static final f:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    new-instance v0, Llhe;

    const-string v1, "Opera I/O"

    invoke-direct {v0, v1}, Llhe;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x3

    invoke-static {v1, v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Llhe;

    const-string v3, "Opera Critical I/O"

    invoke-direct {v2, v3}, Llhe;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    sput-object v1, Lvml;->b:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Llhe;

    const-string v3, "Opera Network"

    invoke-direct {v2, v3}, Llhe;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x6

    invoke-static {v3, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    sput-object v2, Lvml;->c:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v3, Lumi;

    new-instance v4, Luml;

    invoke-direct {v4}, Luml;-><init>()V

    new-instance v5, Ldhi;

    invoke-direct {v5, v0}, Ldhi;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    new-instance v6, Ldhi;

    invoke-direct {v6, v1}, Ldhi;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    new-instance v7, Ldhi;

    invoke-direct {v7, v2}, Ldhi;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    invoke-direct {v3, v4, v5, v6, v7}, Lumi;-><init>(Luml;Ldhi;Ldhi;Ldhi;)V

    sput-object v3, Lvml;->d:Lumi;

    new-instance v8, Lwjh;

    sget-object v3, Lbb7;->a:Lcv6;

    sget-object v9, Ls6d;->a:Ld7a;

    sget-object v10, Lbb7;->a:Lcv6;

    new-instance v11, Ljg8;

    invoke-direct {v11, v0}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance v12, Ljg8;

    invoke-direct {v12, v1}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance v13, Ljg8;

    invoke-direct {v13, v2}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    const/16 v14, 0x16

    invoke-direct/range {v8 .. v14}, Lwjh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sput-object v8, Lvml;->e:Lwjh;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lvml;->f:Landroid/os/Handler;

    return-void
.end method

.method public static a(Ljava/lang/Runnable;)V
    .registers 2

    sget-object v0, Lvml;->f:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static b()Z
    .registers 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    return v0

    :cond_c
    const/4 v0, 0x0

    return v0
.end method

.method public static c(Ljava/lang/Runnable;)V
    .registers 2

    sget-object v0, Lvml;->f:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static d(Ljava/lang/Runnable;J)V
    .registers 4

    sget-object v0, Lvml;->f:Landroid/os/Handler;

    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static e(Ljava/lang/Runnable;)V
    .registers 2

    invoke-static {}, Lvml;->b()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_a
    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
