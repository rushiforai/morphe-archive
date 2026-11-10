.class public final LQ/d;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field public static final g:Z


# instance fields
.field public final a:Ljava/util/concurrent/PriorityBlockingQueue;

.field public final b:Ljava/util/concurrent/PriorityBlockingQueue;

.field public final c:LR/e;

.field public final d:LC/j;

.field public volatile e:Z

.field public final f:LQ/t;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-boolean v0, LQ/s;->a:Z

    sput-boolean v0, LQ/d;->g:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/PriorityBlockingQueue;Ljava/util/concurrent/PriorityBlockingQueue;LR/e;LC/j;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, LQ/d;->e:Z

    iput-object p1, p0, LQ/d;->a:Ljava/util/concurrent/PriorityBlockingQueue;

    iput-object p2, p0, LQ/d;->b:Ljava/util/concurrent/PriorityBlockingQueue;

    iput-object p3, p0, LQ/d;->c:LR/e;

    iput-object p4, p0, LQ/d;->d:LC/j;

    new-instance p1, LQ/t;

    invoke-direct {p1, p0, p2, p4}, LQ/t;-><init>(LQ/d;Ljava/util/concurrent/PriorityBlockingQueue;LC/j;)V

    iput-object p1, p0, LQ/d;->f:LQ/t;

    return-void
.end method

.method private a()V
    .locals 10

    iget-object v0, p0, LQ/d;->a:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LR/h;

    const-string v1, "cache-queue-take"

    invoke-virtual {v0, v1}, LR/h;->a(Ljava/lang/String;)V

    invoke-virtual {v0}, LR/h;->j()V

    :try_start_0
    iget-object v1, v0, LR/h;->e:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    iget-object v1, p0, LQ/d;->c:LR/e;

    invoke-virtual {v0}, LR/h;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, LR/e;->a(Ljava/lang/String;)LQ/b;

    move-result-object v1

    if-nez v1, :cond_1

    const-string v1, "cache-miss"

    invoke-virtual {v0, v1}, LR/h;->a(Ljava/lang/String;)V

    iget-object v1, p0, LQ/d;->f:LQ/t;

    invoke-virtual {v1, v0}, LQ/t;->e(LR/h;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, LQ/d;->b:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-interface {v1, v0}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto/16 :goto_5

    :cond_0
    :goto_0
    invoke-virtual {v0}, LR/h;->j()V

    return-void

    :cond_1
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, v1, LQ/b;->e:J

    cmp-long v4, v4, v2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-gez v4, :cond_2

    move v4, v6

    goto :goto_1

    :cond_2
    move v4, v5

    :goto_1
    if-eqz v4, :cond_4

    const-string v2, "cache-hit-expired"

    invoke-virtual {v0, v2}, LR/h;->a(Ljava/lang/String;)V

    iput-object v1, v0, LR/h;->l:LQ/b;

    iget-object v1, p0, LQ/d;->f:LQ/t;

    invoke-virtual {v1, v0}, LQ/t;->e(LR/h;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, LQ/d;->b:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-interface {v1, v0}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_3
    invoke-virtual {v0}, LR/h;->j()V

    return-void

    :cond_4
    :try_start_4
    const-string v4, "cache-hit"

    invoke-virtual {v0, v4}, LR/h;->a(Ljava/lang/String;)V

    new-instance v4, LQ/k;

    iget-object v7, v1, LQ/b;->a:[B

    iget-object v8, v1, LQ/b;->g:Ljava/util/Map;

    invoke-direct {v4, v7, v8}, LQ/k;-><init>([BLjava/util/Map;)V

    invoke-static {v4}, LR/h;->i(LQ/k;)LQ/k;

    move-result-object v4

    const-string v7, "cache-hit-parsed"

    invoke-virtual {v0, v7}, LR/h;->a(Ljava/lang/String;)V

    iget-object v7, v4, LQ/k;->d:Ljava/lang/Object;

    check-cast v7, LQ/p;

    if-nez v7, :cond_5

    move v5, v6

    :cond_5
    const/4 v7, 0x0

    if-nez v5, :cond_8

    const-string v1, "cache-parsing-failed"

    invoke-virtual {v0, v1}, LR/h;->a(Ljava/lang/String;)V

    iget-object v1, p0, LQ/d;->c:LR/e;

    invoke-virtual {v0}, LR/h;->d()Ljava/lang/String;

    move-result-object v2

    monitor-enter v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual {v1, v2}, LR/e;->a(Ljava/lang/String;)LQ/b;

    move-result-object v3

    if-eqz v3, :cond_6

    const-wide/16 v4, 0x0

    iput-wide v4, v3, LQ/b;->f:J

    iput-wide v4, v3, LQ/b;->e:J

    invoke-virtual {v1, v2, v3}, LR/e;->f(Ljava/lang/String;LQ/b;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v2

    goto :goto_3

    :cond_6
    :goto_2
    :try_start_6
    monitor-exit v1

    iput-object v7, v0, LR/h;->l:LQ/b;

    iget-object v1, p0, LQ/d;->f:LQ/t;

    invoke-virtual {v1, v0}, LQ/t;->e(LR/h;)Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, LQ/d;->b:Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-interface {v1, v0}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :cond_7
    invoke-virtual {v0}, LR/h;->j()V

    return-void

    :goto_3
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v2

    :cond_8
    iget-wide v8, v1, LQ/b;->f:J

    cmp-long v2, v8, v2

    if-gez v2, :cond_a

    const-string v2, "cache-hit-refresh-needed"

    invoke-virtual {v0, v2}, LR/h;->a(Ljava/lang/String;)V

    iput-object v1, v0, LR/h;->l:LQ/b;

    iput-boolean v6, v4, LQ/k;->a:Z

    iget-object v1, p0, LQ/d;->f:LQ/t;

    invoke-virtual {v1, v0}, LQ/t;->e(LR/h;)Z

    move-result v1

    if-nez v1, :cond_9

    iget-object v1, p0, LQ/d;->d:LC/j;

    new-instance v2, LQ/c;

    invoke-direct {v2, p0, v0}, LQ/c;-><init>(LQ/d;LR/h;)V

    invoke-virtual {v1, v0, v4, v2}, LC/j;->y(LR/h;LQ/k;LQ/c;)V

    goto :goto_4

    :cond_9
    iget-object v1, p0, LQ/d;->d:LC/j;

    invoke-virtual {v1, v0, v4, v7}, LC/j;->y(LR/h;LQ/k;LQ/c;)V

    goto :goto_4

    :cond_a
    iget-object v1, p0, LQ/d;->d:LC/j;

    invoke-virtual {v1, v0, v4, v7}, LC/j;->y(LR/h;LQ/k;LQ/c;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :goto_4
    invoke-virtual {v0}, LR/h;->j()V

    return-void

    :catchall_2
    move-exception v2

    :try_start_9
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :goto_5
    invoke-virtual {v0}, LR/h;->j()V

    throw v1
.end method


# virtual methods
.method public final run()V
    .locals 3

    sget-boolean v0, LQ/d;->g:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "start new dispatcher"

    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v0, v2}, LQ/s;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    iget-object v0, p0, LQ/d;->c:LR/e;

    invoke-virtual {v0}, LR/e;->d()V

    :goto_0
    :try_start_0
    invoke-direct {p0}, LQ/d;->a()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    iget-boolean v0, p0, LQ/d;->e:Z

    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    return-void

    :cond_1
    const-string v0, "Ignoring spurious interrupt of CacheDispatcher thread; use quit() to terminate it"

    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v0, v2}, LQ/s;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
