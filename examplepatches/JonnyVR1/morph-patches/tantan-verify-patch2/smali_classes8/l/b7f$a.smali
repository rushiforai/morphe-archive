.class public final Ll/b7f$a;
.super Ll/f2e0$a;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b7f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ll/ft5;

.field public final c:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lrx/internal/schedulers/ScheduledAction;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final e:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b7f$a;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/b7f$a;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 12
    .line 13
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/b7f$a;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    new-instance p1, Ll/ft5;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 26
    .line 27
    invoke-static {}, Lrx/internal/schedulers/a;->a()Ljava/util/concurrent/ScheduledExecutorService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/b7f$a;->e:Ljava/util/concurrent/ScheduledExecutorService;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public b(Ll/x20;)Ll/kcg0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/b7f$a;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Lrx/internal/schedulers/ScheduledAction;

    .line 13
    .line 14
    iget-object v1, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 15
    .line 16
    invoke-direct {v0, p1, v1}, Lrx/internal/schedulers/ScheduledAction;-><init>(Ll/x20;Ll/ft5;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/b7f$a;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/b7f$a;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    :try_start_0
    iget-object p1, p0, Ll/b7f$a;->a:Ljava/util/concurrent/Executor;

    .line 38
    .line 39
    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :catch_0
    move-exception p1

    .line 44
    iget-object v1, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/b7f$a;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 52
    .line 53
    .line 54
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    throw p1

    .line 58
    :cond_1
    return-object v0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p2, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/b7f$a;->b(Ll/x20;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/b7f$a;->isUnsubscribed()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    new-instance v0, Ll/mu10;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/mu10;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/mu10;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/mu10;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/mu10;->a(Ll/kcg0;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/b7f$a$a;

    .line 42
    .line 43
    invoke-direct {v2, p0, v1}, Ll/b7f$a$a;-><init>(Ll/b7f$a;Ll/mu10;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    new-instance v3, Lrx/internal/schedulers/ScheduledAction;

    .line 51
    .line 52
    new-instance v4, Ll/b7f$a$b;

    .line 53
    .line 54
    invoke-direct {v4, p0, v1, p1, v2}, Ll/b7f$a$b;-><init>(Ll/b7f$a;Ll/mu10;Ll/x20;Ll/kcg0;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {v3, v4}, Lrx/internal/schedulers/ScheduledAction;-><init>(Ll/x20;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ll/mu10;->a(Ll/kcg0;)V

    .line 61
    .line 62
    .line 63
    :try_start_0
    iget-object p0, p0, Ll/b7f$a;->e:Ljava/util/concurrent/ScheduledExecutorService;

    .line 64
    .line 65
    invoke-interface {p0, v3, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v3, p0}, Lrx/internal/schedulers/ScheduledAction;->add(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    return-object v2

    .line 73
    :catch_0
    move-exception p0

    .line 74
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    throw p0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public run()V
    .locals 2

    .line 1
    :cond_0
    iget-object v0, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/b7f$a;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lrx/internal/schedulers/ScheduledAction;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    invoke-virtual {v0}, Lrx/internal/schedulers/ScheduledAction;->isUnsubscribed()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_4

    .line 29
    .line 30
    iget-object v1, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/ft5;->isUnsubscribed()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_3

    .line 37
    .line 38
    invoke-virtual {v0}, Lrx/internal/schedulers/ScheduledAction;->run()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    iget-object p0, p0, Ll/b7f$a;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/b7f$a;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    :goto_1
    return-void
.end method

.method public unsubscribe()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b7f$a;->b:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/b7f$a;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
