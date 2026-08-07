.class public Lcom/tantanapp/common/utils/ThreadUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;,
        Lcom/tantanapp/common/utils/ThreadUtil$c;,
        Lcom/tantanapp/common/utils/ThreadUtil$b;
    }
.end annotation


# static fields
.field public static final a:Landroid/os/Handler;

.field public static final b:I

.field public static final c:I

.field public static final d:Lcom/tantanapp/common/utils/ThreadUtil$b;

.field public static e:I

.field public static final f:I

.field public static final g:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->a:Landroid/os/Handler;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    mul-int/lit8 v0, v0, 0x3

    .line 21
    .line 22
    sput v0, Lcom/tantanapp/common/utils/ThreadUtil;->b:I

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    sub-int/2addr v0, v1

    .line 26
    const/4 v2, 0x5

    .line 27
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Lcom/tantanapp/common/utils/ThreadUtil;->c:I

    .line 32
    .line 33
    new-instance v0, Lcom/tantanapp/common/utils/ThreadUtil$b;

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-direct {v0, v3}, Lcom/tantanapp/common/utils/ThreadUtil$b;-><init>(Lcom/tantanapp/common/utils/ThreadUtil$a;)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->d:Lcom/tantanapp/common/utils/ThreadUtil$b;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    sput v0, Lcom/tantanapp/common/utils/ThreadUtil;->e:I

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    sput v4, Lcom/tantanapp/common/utils/ThreadUtil;->f:I

    .line 57
    .line 58
    new-instance v3, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 59
    .line 60
    new-instance v9, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 61
    .line 62
    invoke-direct {v9}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance v10, Lrx/internal/util/RxThreadFactory;

    .line 66
    .line 67
    const-string v0, "TTIoPool-"

    .line 68
    .line 69
    invoke-direct {v10, v0}, Lrx/internal/util/RxThreadFactory;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-wide/16 v6, 0x8

    .line 73
    .line 74
    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 75
    .line 76
    move v5, v4

    .line 77
    invoke-direct/range {v3 .. v10}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 78
    .line 79
    .line 80
    sput-object v3, Lcom/tantanapp/common/utils/ThreadUtil;->g:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 81
    .line 82
    invoke-virtual {v3, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()Ll/uxj0;
    .locals 4

    .line 1
    :goto_0
    sget-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->d:Lcom/tantanapp/common/utils/ThreadUtil$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/utils/ThreadUtil$b;->c()Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-boolean v1, Ll/kmk0;->c:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    :cond_0
    :try_start_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    new-instance v1, Ljava/lang/Throwable;

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "ThreadUtil io executeRunnableTask:"

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {v1, v2, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    instance-of v1, v0, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 52
    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    throw v0

    .line 57
    :cond_2
    new-instance v0, Ll/iyi0;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/iyi0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/ThreadUtil;->g(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 66
    .line 67
    return-object v0
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    :cond_0
    sget v0, Lcom/tantanapp/common/utils/ThreadUtil;->e:I

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    sput v0, Lcom/tantanapp/common/utils/ThreadUtil;->e:I

    .line 17
    .line 18
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->c()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static c()V
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->d:Lcom/tantanapp/common/utils/ThreadUtil$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/utils/ThreadUtil$b;->d()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    sget v0, Lcom/tantanapp/common/utils/ThreadUtil;->e:I

    .line 10
    .line 11
    sget v1, Lcom/tantanapp/common/utils/ThreadUtil;->c:I

    .line 12
    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    sput v0, Lcom/tantanapp/common/utils/ThreadUtil;->e:I

    .line 18
    .line 19
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->d()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    new-instance v0, Ll/hyi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hyi0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/tantanapp/common/utils/ThreadUtil;->g:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 11
    .line 12
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ll/trd0;->e(Ll/f2e0;)Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static e(Ljava/lang/Runnable;Z)V
    .locals 2

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    new-instance p1, Ljava/lang/Throwable;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "ThreadUtil io throwable:"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-direct {p1, v0, p0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    instance-of p1, p0, Lcom/tantanapp/common/utils/DBCorruptException;

    .line 44
    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    throw p0

    .line 49
    :cond_2
    :goto_0
    sget-object p1, Lcom/tantanapp/common/utils/ThreadUtil;->d:Lcom/tantanapp/common/utils/ThreadUtil$b;

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lcom/tantanapp/common/utils/ThreadUtil$b;->b(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->c()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    const-string p0, "Runnable could not be null !!!"

    .line 59
    .line 60
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static f()Z
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public static g(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->a:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static h(Ljava/lang/Runnable;J)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->a:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static i(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Lcom/tantanapp/common/utils/ThreadUtil;->a:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
