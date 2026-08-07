.class public Lrx/schedulers/TestScheduler;
.super Ll/f2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/schedulers/TestScheduler$b;,
        Lrx/schedulers/TestScheduler$a;,
        Lrx/schedulers/TestScheduler$c;
    }
.end annotation


# static fields
.field public static d:J


# instance fields
.field public final b:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lrx/schedulers/TestScheduler$c;",
            ">;"
        }
    .end annotation
.end field

.field public c:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/PriorityQueue;

    .line 5
    .line 6
    new-instance v1, Lrx/schedulers/TestScheduler$a;

    .line 7
    .line 8
    invoke-direct {v1}, Lrx/schedulers/TestScheduler$a;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 v2, 0xb

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(J)V
    .locals 5

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/schedulers/TestScheduler$c;

    .line 16
    .line 17
    iget-wide v1, v0, Lrx/schedulers/TestScheduler$c;->a:J

    .line 18
    .line 19
    cmp-long v3, v1, p1

    .line 20
    .line 21
    if-lez v3, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    cmp-long v3, v1, v3

    .line 27
    .line 28
    if-nez v3, :cond_2

    .line 29
    .line 30
    iget-wide v1, p0, Lrx/schedulers/TestScheduler;->c:J

    .line 31
    .line 32
    :cond_2
    iput-wide v1, p0, Lrx/schedulers/TestScheduler;->c:J

    .line 33
    .line 34
    iget-object v1, p0, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-object v1, v0, Lrx/schedulers/TestScheduler$c;->c:Ll/f2e0$a;

    .line 40
    .line 41
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    iget-object v0, v0, Lrx/schedulers/TestScheduler$c;->b:Ll/x20;

    .line 48
    .line 49
    invoke-interface {v0}, Ll/x20;->call()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    :goto_1
    iput-wide p1, p0, Lrx/schedulers/TestScheduler;->c:J

    .line 54
    .line 55
    return-void
.end method

.method public advanceTimeBy(JLjava/util/concurrent/TimeUnit;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/schedulers/TestScheduler;->c:J

    .line 2
    .line 3
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    add-long/2addr v0, p1

    .line 8
    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1, p1}, Lrx/schedulers/TestScheduler;->advanceTimeTo(JLjava/util/concurrent/TimeUnit;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public advanceTimeTo(JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lrx/schedulers/TestScheduler;->a(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public createWorker()Ll/f2e0$a;
    .locals 1

    .line 1
    new-instance v0, Lrx/schedulers/TestScheduler$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/schedulers/TestScheduler$b;-><init>(Lrx/schedulers/TestScheduler;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public now()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lrx/schedulers/TestScheduler;->c:J

    .line 2
    .line 3
    const-wide/32 v2, 0xf4240

    .line 4
    .line 5
    .line 6
    div-long/2addr v0, v2

    .line 7
    return-wide v0
.end method

.method public triggerActions()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lrx/schedulers/TestScheduler;->c:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lrx/schedulers/TestScheduler;->a(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
