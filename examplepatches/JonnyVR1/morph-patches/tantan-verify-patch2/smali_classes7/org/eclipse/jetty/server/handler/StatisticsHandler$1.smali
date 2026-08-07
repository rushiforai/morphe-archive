.class Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/continuation/ContinuationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/handler/StatisticsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onComplete(Lorg/eclipse/jetty/continuation/Continuation;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 3
    .line 4
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->getBaseRequest()Lorg/eclipse/jetty/server/Request;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getTimeStamp()J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    sub-long/2addr v1, v3

    .line 17
    iget-object v3, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;

    .line 18
    .line 19
    invoke-static {v3}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->access$000(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;

    .line 27
    .line 28
    invoke-static {v3}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->access$100(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v3, v1, v2}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;

    .line 36
    .line 37
    invoke-static {v1, v0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->access$200(Lorg/eclipse/jetty/server/handler/StatisticsHandler;Lorg/eclipse/jetty/server/Request;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p1}, Lorg/eclipse/jetty/continuation/Continuation;->isResumed()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;

    .line 47
    .line 48
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->access$300(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public onTimeout(Lorg/eclipse/jetty/continuation/Continuation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;->this$0:Lorg/eclipse/jetty/server/handler/StatisticsHandler;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->access$400(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 8
    .line 9
    .line 10
    return-void
.end method
