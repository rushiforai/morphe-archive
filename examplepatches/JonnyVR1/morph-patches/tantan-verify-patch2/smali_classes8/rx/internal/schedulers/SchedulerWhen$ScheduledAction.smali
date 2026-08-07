.class abstract Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/schedulers/SchedulerWhen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ScheduledAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Ll/kcg0;",
        ">;",
        "Ll/kcg0;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->a()Ll/kcg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic access$000(Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;Ll/f2e0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;->call(Ll/f2e0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final call(Ll/f2e0$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/kcg0;

    .line 6
    .line 7
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->b()Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->a()Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p0, p1}, Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;->callActual(Ll/f2e0$a;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->a()Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public abstract callActual(Ll/f2e0$a;)Ll/kcg0;
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/kcg0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public unsubscribe()V
    .locals 3

    .line 1
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->b()Ll/kcg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/kcg0;

    .line 10
    .line 11
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->b()Ll/kcg0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-ne v1, v2, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {p0, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lrx/internal/schedulers/SchedulerWhen;->a()Ll/kcg0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eq v1, p0, :cond_2

    .line 29
    .line 30
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 31
    .line 32
    .line 33
    :cond_2
    :goto_0
    return-void
.end method
