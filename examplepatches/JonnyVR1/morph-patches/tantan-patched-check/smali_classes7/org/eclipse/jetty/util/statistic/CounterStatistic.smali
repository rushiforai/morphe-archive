.class public Lorg/eclipse/jetty/util/statistic/CounterStatistic;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final _curr:Ljava/util/concurrent/atomic/AtomicLong;

.field protected final _max:Ljava/util/concurrent/atomic/AtomicLong;

.field protected final _total:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_max:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_curr:Ljava/util/concurrent/atomic/AtomicLong;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_total:Ljava/util/concurrent/atomic/AtomicLong;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public add(J)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_curr:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, p1, v2

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_total:Ljava/util/concurrent/atomic/AtomicLong;

    .line 14
    .line 15
    invoke-virtual {v2, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_max:Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    invoke-static {p0, v0, v1}, Lorg/eclipse/jetty/util/Atomics;->updateMax(Ljava/util/concurrent/atomic/AtomicLong;J)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public decrement()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->add(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCurrent()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_curr:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getMax()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_max:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getTotal()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_total:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public increment()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->add(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public reset()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->reset(J)V

    return-void
.end method

.method public reset(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_max:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_curr:Ljava/util/concurrent/atomic/AtomicLong;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->_total:Ljava/util/concurrent/atomic/AtomicLong;

    .line 12
    .line 13
    const-wide/16 p1, 0x0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public subtract(J)V
    .locals 0

    .line 1
    neg-long p1, p1

    .line 2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->add(J)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
