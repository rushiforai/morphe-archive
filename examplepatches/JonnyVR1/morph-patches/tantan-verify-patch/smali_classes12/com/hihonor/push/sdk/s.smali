.class public Lcom/hihonor/push/sdk/s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Lcom/hihonor/push/sdk/a0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hihonor/push/sdk/s;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Lcom/hihonor/push/sdk/a0;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/hihonor/push/sdk/a0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/hihonor/push/sdk/s;->b:Lcom/hihonor/push/sdk/a0;

    .line 12
    .line 13
    return-void
.end method

.method public static a(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;ILjava/lang/String;)V
    .locals 1

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    new-instance v0, Lcom/hihonor/push/sdk/u;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/hihonor/push/sdk/u;-><init>(Lcom/hihonor/push/sdk/s;Lcom/hihonor/push/sdk/HonorPushCallback;ILjava/lang/String;)V

    invoke-static {v0}, Lcom/hihonor/push/sdk/b1;->a(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/concurrent/Callable;Lcom/hihonor/push/sdk/HonorPushCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;",
            "Lcom/hihonor/push/sdk/HonorPushCallback<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/hihonor/push/sdk/s$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/hihonor/push/sdk/s$a;-><init>(Lcom/hihonor/push/sdk/s;Ljava/util/concurrent/Callable;Lcom/hihonor/push/sdk/HonorPushCallback;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/hihonor/push/sdk/b1;->d:Lcom/hihonor/push/sdk/b1;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/hihonor/push/sdk/b1;->b:Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/hihonor/push/sdk/b1;->c:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter p1

    .line 15
    :try_start_0
    iget-object p2, p0, Lcom/hihonor/push/sdk/b1;->b:Ljava/util/concurrent/ExecutorService;

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/b1;->b()Ljava/util/concurrent/ExecutorService;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/hihonor/push/sdk/b1;->b:Ljava/util/concurrent/ExecutorService;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p1

    .line 29
    goto :goto_2

    .line 30
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0

    .line 32
    :cond_1
    :goto_2
    iget-object p0, p0, Lcom/hihonor/push/sdk/b1;->b:Ljava/util/concurrent/ExecutorService;

    .line 33
    .line 34
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
