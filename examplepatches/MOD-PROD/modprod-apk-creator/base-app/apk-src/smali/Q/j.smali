.class public final LQ/j;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/PriorityBlockingQueue;

.field public final b:LG/a;

.field public final c:LR/e;

.field public final d:LC/j;

.field public volatile e:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/PriorityBlockingQueue;LG/a;LR/e;LC/j;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, LQ/j;->e:Z

    iput-object p1, p0, LQ/j;->a:Ljava/util/concurrent/PriorityBlockingQueue;

    iput-object p2, p0, LQ/j;->b:LG/a;

    iput-object p3, p0, LQ/j;->c:LR/e;

    iput-object p4, p0, LQ/j;->d:LC/j;

    return-void
.end method

.method private a()V
    .locals 7

    iget-object v0, p0, LQ/j;->a:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LR/h;

    iget-object v1, p0, LQ/j;->d:LC/j;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    invoke-virtual {v0}, LR/h;->j()V

    const/4 v2, 0x0

    :try_start_0
    const-string v3, "network-queue-take"

    invoke-virtual {v0, v3}, LR/h;->a(Ljava/lang/String;)V

    iget-object v3, v0, LR/h;->e:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catch LQ/p; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    iget v3, v0, LR/h;->d:I

    invoke-static {v3}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    iget-object v3, p0, LQ/j;->b:LG/a;

    invoke-virtual {v3, v0}, LG/a;->f(LR/h;)LQ/k;

    move-result-object v3

    const-string v4, "network-http-complete"

    invoke-virtual {v0, v4}, LR/h;->a(Ljava/lang/String;)V

    iget-boolean v4, v3, LQ/k;->a:Z

    if-eqz v4, :cond_0

    invoke-virtual {v0}, LR/h;->f()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v3, "not-modified"

    invoke-virtual {v0, v3}, LR/h;->b(Ljava/lang/String;)V

    invoke-virtual {v0}, LR/h;->g()V
    :try_end_2
    .catch LQ/p; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {v0}, LR/h;->j()V

    return-void

    :catchall_0
    move-exception v1

    goto/16 :goto_4

    :catch_0
    move-exception v3

    goto :goto_0

    :catch_1
    move-exception v3

    goto :goto_2

    :cond_0
    :try_start_3
    invoke-static {v3}, LR/h;->i(LQ/k;)LQ/k;

    move-result-object v3

    const-string v4, "network-parse-complete"

    invoke-virtual {v0, v4}, LR/h;->a(Ljava/lang/String;)V

    iget-boolean v4, v0, LR/h;->i:Z
    :try_end_3
    .catch LQ/p; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_1

    iget-object v4, v3, LQ/k;->c:Ljava/lang/Object;

    check-cast v4, LQ/b;

    if-eqz v4, :cond_1

    :try_start_4
    iget-object v5, p0, LQ/j;->c:LR/e;

    invoke-virtual {v0}, LR/h;->d()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v4}, LR/e;->f(Ljava/lang/String;LQ/b;)V

    const-string v4, "network-cache-written"

    invoke-virtual {v0, v4}, LR/h;->a(Ljava/lang/String;)V

    :cond_1
    iget-object v4, v0, LR/h;->e:Ljava/lang/Object;

    monitor-enter v4
    :try_end_4
    .catch LQ/p; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v5, 0x1

    :try_start_5
    iput-boolean v5, v0, LR/h;->j:Z

    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {v1, v0, v3, v2}, LC/j;->y(LR/h;LQ/k;LQ/c;)V

    invoke-virtual {v0, v3}, LR/h;->h(LQ/k;)V
    :try_end_6
    .catch LQ/p; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    invoke-virtual {v0}, LR/h;->j()V

    return-void

    :catchall_1
    move-exception v3

    :try_start_7
    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v3
    :try_end_8
    .catch LQ/p; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :catchall_2
    move-exception v4

    :try_start_9
    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v4
    :try_end_a
    .catch LQ/p; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :goto_0
    :try_start_b
    const-string v4, "Unhandled exception %s"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, LQ/s;->a(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Volley"

    invoke-static {v5, v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v4, LQ/p;

    invoke-direct {v4, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "post-error"

    invoke-virtual {v0, v3}, LR/h;->a(Ljava/lang/String;)V

    new-instance v3, LQ/k;

    invoke-direct {v3, v4}, LQ/k;-><init>(LQ/p;)V

    iget-object v1, v1, LC/j;->b:Ljava/lang/Object;

    check-cast v1, LQ/g;

    new-instance v4, LQ/h;

    invoke-direct {v4, v0, v3, v2}, LQ/h;-><init>(LR/h;LQ/k;LQ/c;)V

    invoke-virtual {v1, v4}, LQ/g;->execute(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, LR/h;->g()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    :goto_1
    invoke-virtual {v0}, LR/h;->j()V

    goto :goto_3

    :goto_2
    :try_start_c
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v4, "post-error"

    invoke-virtual {v0, v4}, LR/h;->a(Ljava/lang/String;)V

    new-instance v4, LQ/k;

    invoke-direct {v4, v3}, LQ/k;-><init>(LQ/p;)V

    iget-object v1, v1, LC/j;->b:Ljava/lang/Object;

    check-cast v1, LQ/g;

    new-instance v3, LQ/h;

    invoke-direct {v3, v0, v4, v2}, LQ/h;-><init>(LR/h;LQ/k;LQ/c;)V

    invoke-virtual {v1, v3}, LQ/g;->execute(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, LR/h;->g()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_1

    :goto_3
    return-void

    :goto_4
    invoke-virtual {v0}, LR/h;->j()V

    throw v1
.end method


# virtual methods
.method public final run()V
    .locals 2

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    :goto_0
    :try_start_0
    invoke-direct {p0}, LQ/j;->a()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    iget-boolean v0, p0, LQ/j;->e:Z

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Ignoring spurious interrupt of NetworkDispatcher thread; use quit() to terminate it"

    invoke-static {v1, v0}, LQ/s;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
