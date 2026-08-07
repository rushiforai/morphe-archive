.class public final Lrx/internal/schedulers/ScheduledAction;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/schedulers/ScheduledAction$Remover2;,
        Lrx/internal/schedulers/ScheduledAction$Remover;,
        Lrx/internal/schedulers/ScheduledAction$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Ljava/lang/Thread;",
        ">;",
        "Ljava/lang/Runnable;",
        "Ll/kcg0;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x36fd4556f787c9b1L


# instance fields
.field final action:Ll/x20;

.field final cancel:Ll/ocg0;


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 20
    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->action:Ll/x20;

    .line 21
    new-instance p1, Ll/ocg0;

    invoke-direct {p1}, Ll/ocg0;-><init>()V

    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    return-void
.end method

.method public constructor <init>(Ll/x20;Ll/ft5;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->action:Ll/x20;

    .line 5
    .line 6
    new-instance p1, Ll/ocg0;

    .line 7
    .line 8
    new-instance v0, Lrx/internal/schedulers/ScheduledAction$Remover;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2}, Lrx/internal/schedulers/ScheduledAction$Remover;-><init>(Lrx/internal/schedulers/ScheduledAction;Ll/ft5;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p1, v0}, Ll/ocg0;-><init>(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ll/x20;Ll/ocg0;)V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 23
    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->action:Ll/x20;

    .line 24
    new-instance p1, Ll/ocg0;

    new-instance v0, Lrx/internal/schedulers/ScheduledAction$Remover2;

    invoke-direct {v0, p0, p2}, Lrx/internal/schedulers/ScheduledAction$Remover2;-><init>(Lrx/internal/schedulers/ScheduledAction;Ll/ocg0;)V

    invoke-direct {p1, v0}, Ll/ocg0;-><init>(Ll/kcg0;)V

    iput-object p1, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    return-void
.end method


# virtual methods
.method public add(Ljava/util/concurrent/Future;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    .line 2
    .line 3
    new-instance v1, Lrx/internal/schedulers/ScheduledAction$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/ScheduledAction$a;-><init>(Lrx/internal/schedulers/ScheduledAction;Ljava/util/concurrent/Future;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/ocg0;->a(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public add(Ll/kcg0;)V
    .locals 0

    .line 12
    iget-object p0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    invoke-virtual {p0, p1}, Ll/ocg0;->a(Ll/kcg0;)V

    return-void
.end method

.method public addParent(Ll/ft5;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    .line 2
    .line 3
    new-instance v1, Lrx/internal/schedulers/ScheduledAction$Remover;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/ScheduledAction$Remover;-><init>(Lrx/internal/schedulers/ScheduledAction;Ll/ft5;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/ocg0;->a(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public addParent(Ll/ocg0;)V
    .locals 2

    .line 12
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    new-instance v1, Lrx/internal/schedulers/ScheduledAction$Remover2;

    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/ScheduledAction$Remover2;-><init>(Lrx/internal/schedulers/ScheduledAction;Ll/ocg0;)V

    invoke-virtual {v0, v1}, Ll/ocg0;->a(Ll/kcg0;)V

    return-void
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ocg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public run()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->action:Ll/x20;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/x20;->call()V
    :try_end_0
    .catch Lrx/exceptions/OnErrorNotImplementedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/internal/schedulers/ScheduledAction;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    goto :goto_2

    .line 21
    :goto_0
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string v2, "Fatal Exception thrown on Scheduler.Worker thread."

    .line 24
    .line 25
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lrx/internal/schedulers/ScheduledAction;->signalError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 29
    .line 30
    .line 31
    :goto_1
    invoke-virtual {p0}, Lrx/internal/schedulers/ScheduledAction;->unsubscribe()V

    .line 32
    .line 33
    .line 34
    goto :goto_3

    .line 35
    :catchall_1
    move-exception v0

    .line 36
    goto :goto_4

    .line 37
    :goto_2
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    const-string v2, "Exception thrown on Scheduler.Worker thread. Add `onError` handling."

    .line 40
    .line 41
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v1}, Lrx/internal/schedulers/ScheduledAction;->signalError(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :goto_3
    return-void

    .line 49
    :goto_4
    invoke-virtual {p0}, Lrx/internal/schedulers/ScheduledAction;->unsubscribe()V

    .line 50
    .line 51
    .line 52
    throw v0
.end method

.method public signalError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p0, p1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public unsubscribe()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ocg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lrx/internal/schedulers/ScheduledAction;->cancel:Ll/ocg0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ocg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
