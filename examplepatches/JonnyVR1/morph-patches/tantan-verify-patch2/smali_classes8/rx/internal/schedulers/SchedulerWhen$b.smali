.class public Lrx/internal/schedulers/SchedulerWhen$b;
.super Ll/f2e0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/schedulers/SchedulerWhen;->createWorker()Ll/f2e0$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic b:Ll/f2e0$a;

.field public final synthetic c:Ll/bb50;

.field public final synthetic d:Lrx/internal/schedulers/SchedulerWhen;


# direct methods
.method public constructor <init>(Lrx/internal/schedulers/SchedulerWhen;Ll/f2e0$a;Ll/bb50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/schedulers/SchedulerWhen$b;->d:Lrx/internal/schedulers/SchedulerWhen;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/schedulers/SchedulerWhen$b;->b:Ll/f2e0$a;

    .line 4
    .line 5
    iput-object p3, p0, Lrx/internal/schedulers/SchedulerWhen$b;->c:Ll/bb50;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lrx/internal/schedulers/SchedulerWhen$b;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public b(Ll/x20;)Ll/kcg0;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/schedulers/SchedulerWhen$ImmediateAction;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/internal/schedulers/SchedulerWhen$ImmediateAction;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$b;->c:Ll/bb50;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/schedulers/SchedulerWhen$DelayedAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/schedulers/SchedulerWhen$DelayedAction;-><init>(Ll/x20;JLjava/util/concurrent/TimeUnit;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$b;->c:Ll/bb50;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$b;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public unsubscribe()V
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/SchedulerWhen$b;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lrx/internal/schedulers/SchedulerWhen$b;->b:Ll/f2e0$a;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$b;->c:Ll/bb50;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
