.class public final Ll/v360$a;
.super Ll/gcg0;
.source "SourceFile"

# interfaces
.implements Lrx/internal/util/BackpressureDrainManager$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v360;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;",
        "Lrx/internal/util/BackpressureDrainManager$a;"
    }
.end annotation


# instance fields
.field public final e:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/concurrent/atomic/AtomicLong;

.field public final g:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final i:Lrx/internal/util/BackpressureDrainManager;

.field public final j:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final k:Ll/x20;

.field public final l:Lrx/a$d;


# direct methods
.method public constructor <init>(Ll/gcg0;Ljava/lang/Long;Ll/x20;Lrx/a$d;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;",
            "Ljava/lang/Long;",
            "Ll/x20;",
            "Lrx/a$d;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/v360$a;->e:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/v360$a;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/v360$a;->j:Lrx/internal/operators/NotificationLite;

    .line 24
    .line 25
    iput-object p1, p0, Ll/v360$a;->g:Ll/gcg0;

    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 30
    .line 31
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-direct {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p1, 0x0

    .line 40
    :goto_0
    iput-object p1, p0, Ll/v360$a;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 41
    .line 42
    iput-object p3, p0, Ll/v360$a;->k:Ll/x20;

    .line 43
    .line 44
    new-instance p1, Lrx/internal/util/BackpressureDrainManager;

    .line 45
    .line 46
    invoke-direct {p1, p0}, Lrx/internal/util/BackpressureDrainManager;-><init>(Lrx/internal/util/BackpressureDrainManager$a;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/v360$a;->i:Lrx/internal/util/BackpressureDrainManager;

    .line 50
    .line 51
    iput-object p4, p0, Ll/v360$a;->l:Lrx/a$d;

    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v360$a;->g:Ll/gcg0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public accept(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v360$a;->j:Lrx/internal/operators/NotificationLite;

    .line 2
    .line 3
    iget-object p0, p0, Ll/v360$a;->g:Ll/gcg0;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lrx/internal/operators/NotificationLite;->a(Ll/bb50;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()V
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final g()Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/v360$a;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Ll/v360$a;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    cmp-long v0, v2, v4

    .line 16
    .line 17
    if-gtz v0, :cond_3

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    :try_start_0
    iget-object v4, p0, Ll/v360$a;->l:Lrx/a$d;

    .line 21
    .line 22
    invoke-interface {v4}, Lrx/a$d;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/v360$a;->poll()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v4
    :try_end_0
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    if-eqz v4, :cond_1

    .line 33
    .line 34
    move v4, v1

    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception v4

    .line 37
    iget-object v5, p0, Ll/v360$a;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 38
    .line 39
    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-eqz v5, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 46
    .line 47
    .line 48
    iget-object v5, p0, Ll/v360$a;->g:Ll/gcg0;

    .line 49
    .line 50
    invoke-interface {v5, v4}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    move v4, v0

    .line 54
    :goto_0
    iget-object v5, p0, Ll/v360$a;->k:Ll/x20;

    .line 55
    .line 56
    if-eqz v5, :cond_2

    .line 57
    .line 58
    :try_start_1
    invoke-interface {v5}, Ll/x20;->call()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :catchall_0
    move-exception v1

    .line 63
    invoke-static {v1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/v360$a;->i:Lrx/internal/util/BackpressureDrainManager;

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Lrx/internal/util/BackpressureDrainManager;->terminateAndDrain(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    :goto_1
    if-nez v4, :cond_3

    .line 73
    .line 74
    return v0

    .line 75
    :cond_3
    iget-object v0, p0, Ll/v360$a;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 76
    .line 77
    const-wide/16 v4, 0x1

    .line 78
    .line 79
    sub-long v4, v2, v4

    .line 80
    .line 81
    invoke-virtual {v0, v2, v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_0

    .line 86
    .line 87
    return v1
.end method

.method public h()Ll/vk90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v360$a;->i:Lrx/internal/util/BackpressureDrainManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v360$a;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/v360$a;->i:Lrx/internal/util/BackpressureDrainManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/internal/util/BackpressureDrainManager;->terminateAndDrain()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v360$a;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/v360$a;->i:Lrx/internal/util/BackpressureDrainManager;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lrx/internal/util/BackpressureDrainManager;->terminateAndDrain(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/v360$a;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/v360$a;->e:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 9
    .line 10
    iget-object v1, p0, Ll/v360$a;->j:Lrx/internal/operators/NotificationLite;

    .line 11
    .line 12
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/v360$a;->i:Lrx/internal/util/BackpressureDrainManager;

    .line 20
    .line 21
    invoke-virtual {p0}, Lrx/internal/util/BackpressureDrainManager;->drain()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public peek()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v360$a;->e:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->peek()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public poll()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v360$a;->e:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/v360$a;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object v0
.end method
