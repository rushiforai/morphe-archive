.class public Lrx/internal/schedulers/SchedulerWhen;
.super Ll/f2e0;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/schedulers/SchedulerWhen$DelayedAction;,
        Lrx/internal/schedulers/SchedulerWhen$ImmediateAction;,
        Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;
    }
.end annotation


# static fields
.field public static final e:Ll/kcg0;

.field public static final f:Ll/kcg0;


# instance fields
.field public final b:Ll/f2e0;

.field public final c:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "Lrx/c<",
            "Lrx/b;",
            ">;>;"
        }
    .end annotation
.end field

.field public final d:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/schedulers/SchedulerWhen$c;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/internal/schedulers/SchedulerWhen$c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lrx/internal/schedulers/SchedulerWhen;->e:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lrx/internal/schedulers/SchedulerWhen;->f:Ll/kcg0;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ll/qcj;Ll/f2e0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lrx/c<",
            "Lrx/c<",
            "Lrx/b;",
            ">;>;",
            "Lrx/b;",
            ">;",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lrx/internal/schedulers/SchedulerWhen;->b:Ll/f2e0;

    .line 5
    .line 6
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    new-instance v0, Ll/yqe0;

    .line 11
    .line 12
    invoke-direct {v0, p2}, Ll/yqe0;-><init>(Ll/bb50;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lrx/internal/schedulers/SchedulerWhen;->c:Ll/bb50;

    .line 16
    .line 17
    invoke-virtual {p2}, Lrx/c;->onBackpressureBuffer()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p1, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lrx/b;

    .line 26
    .line 27
    invoke-virtual {p1}, Lrx/b;->i()Ll/kcg0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lrx/internal/schedulers/SchedulerWhen;->d:Ll/kcg0;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a()Ll/kcg0;
    .locals 1

    .line 1
    sget-object v0, Lrx/internal/schedulers/SchedulerWhen;->e:Ll/kcg0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b()Ll/kcg0;
    .locals 1

    .line 1
    sget-object v0, Lrx/internal/schedulers/SchedulerWhen;->f:Ll/kcg0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public createWorker()Ll/f2e0$a;
    .locals 4

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/SchedulerWhen;->b:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->b()Lrx/internal/operators/BufferUntilSubscriber;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/yqe0;

    .line 12
    .line 13
    invoke-direct {v2, v1}, Ll/yqe0;-><init>(Ll/bb50;)V

    .line 14
    .line 15
    .line 16
    new-instance v3, Lrx/internal/schedulers/SchedulerWhen$a;

    .line 17
    .line 18
    invoke-direct {v3, p0, v0}, Lrx/internal/schedulers/SchedulerWhen$a;-><init>(Lrx/internal/schedulers/SchedulerWhen;Ll/f2e0$a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v3, Lrx/internal/schedulers/SchedulerWhen$b;

    .line 26
    .line 27
    invoke-direct {v3, p0, v0, v2}, Lrx/internal/schedulers/SchedulerWhen$b;-><init>(Lrx/internal/schedulers/SchedulerWhen;Ll/f2e0$a;Ll/bb50;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen;->c:Ll/bb50;

    .line 31
    .line 32
    invoke-interface {p0, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-object v3
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
