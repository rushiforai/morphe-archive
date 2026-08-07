.class public Lorg/eclipse/jetty/server/handler/StatisticsHandler;
.super Lorg/eclipse/jetty/server/handler/HandlerWrapper;
.source "SourceFile"


# instance fields
.field private final _dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

.field private final _dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

.field private final _expires:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _onCompletion:Lorg/eclipse/jetty/continuation/ContinuationListener;

.field private final _requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

.field private final _requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

.field private final _responses1xx:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _responses2xx:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _responses3xx:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _responses4xx:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _responses5xx:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _responsesTotalBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private final _resumes:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final _statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

.field private final _suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;-><init>()V

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
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    new-instance v0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 12
    .line 13
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 17
    .line 18
    new-instance v0, Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 19
    .line 20
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 24
    .line 25
    new-instance v0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 26
    .line 27
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 31
    .line 32
    new-instance v0, Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 33
    .line 34
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 38
    .line 39
    new-instance v0, Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 40
    .line 41
    invoke-direct {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 45
    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_resumes:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 52
    .line 53
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_expires:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 59
    .line 60
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses1xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    .line 67
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses2xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 73
    .line 74
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses3xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 80
    .line 81
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses4xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 87
    .line 88
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses5xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 94
    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responsesTotalBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 101
    .line 102
    new-instance v0, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler$1;-><init>(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_onCompletion:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 108
    .line 109
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Lorg/eclipse/jetty/util/statistic/CounterStatistic;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Lorg/eclipse/jetty/util/statistic/SampleStatistic;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lorg/eclipse/jetty/server/handler/StatisticsHandler;Lorg/eclipse/jetty/server/Request;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->updateResponse(Lorg/eclipse/jetty/server/Request;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Lorg/eclipse/jetty/util/statistic/CounterStatistic;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lorg/eclipse/jetty/server/handler/StatisticsHandler;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_expires:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method private updateResponse(Lorg/eclipse/jetty/server/Request;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Request;->getResponse()Lorg/eclipse/jetty/server/Response;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    div-int/lit8 v0, v0, 0x64

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_4

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq v0, v1, :cond_1

    .line 22
    .line 23
    const/4 v1, 0x5

    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses5xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses4xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses3xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses2xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses1xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 54
    .line 55
    .line 56
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responsesTotalBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 57
    .line 58
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Response;->getContentCount()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public doStart()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->doStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->statsReset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getDispatched()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getDispatchedActive()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getCurrent()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getDispatchedActiveMax()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getDispatchedTimeMax()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getDispatchedTimeMean()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMean()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getDispatchedTimeStdDev()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getStdDev()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getDispatchedTimeTotal()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getExpires()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_expires:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRequestTimeMax()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getRequestTimeMean()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getMean()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getRequestTimeStdDev()D
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getStdDev()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getRequestTimeTotal()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getRequests()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getRequestsActive()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getCurrent()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getRequestsActiveMax()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getResponses1xx()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses1xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponses2xx()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses2xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponses3xx()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses3xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponses4xx()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses4xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponses5xx()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses5xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponsesBytesTotal()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responsesTotalBytes:Ljava/util/concurrent/atomic/AtomicLong;

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

.method public getResumes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_resumes:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getStatsOnMs()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v0, v2

    .line 12
    return-wide v0
.end method

.method public getSuspends()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getTotal()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getSuspendsActive()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getCurrent()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public getSuspendsActiveMax()I
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->getMax()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-int p0, v0

    .line 8
    return p0
.end method

.method public handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->increment()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isInitial()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 17
    .line 18
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->increment()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->getTimeStamp()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iget-object v3, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 31
    .line 32
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isResumed()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    iget-object v3, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_resumes:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide p3

    .line 53
    sub-long/2addr p3, v1

    .line 54
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 55
    .line 56
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 60
    .line 61
    invoke-virtual {p1, p3, p4}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isSuspended()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isInitial()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_onCompletion:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/server/AsyncContinuation;->addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 82
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->increment()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_3
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isInitial()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_4

    .line 92
    .line 93
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 94
    .line 95
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 99
    .line 100
    invoke-virtual {p1, p3, p4}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 101
    .line 102
    .line 103
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->updateResponse(Lorg/eclipse/jetty/server/Request;)V

    .line 104
    .line 105
    .line 106
    :cond_4
    return-void

    .line 107
    :catchall_0
    move-exception p1

    .line 108
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 109
    .line 110
    .line 111
    move-result-wide p3

    .line 112
    sub-long/2addr p3, v1

    .line 113
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 114
    .line 115
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 119
    .line 120
    invoke-virtual {v1, p3, p4}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isSuspended()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_6

    .line 128
    .line 129
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isInitial()Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-eqz p2, :cond_5

    .line 134
    .line 135
    iget-object p2, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_onCompletion:Lorg/eclipse/jetty/continuation/ContinuationListener;

    .line 136
    .line 137
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/server/AsyncContinuation;->addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V

    .line 138
    .line 139
    .line 140
    :cond_5
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 141
    .line 142
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->increment()V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_6
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isInitial()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 153
    .line 154
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->decrement()V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 158
    .line 159
    invoke-virtual {v0, p3, p4}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->set(J)V

    .line 160
    .line 161
    .line 162
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->updateResponse(Lorg/eclipse/jetty/server/Request;)V

    .line 163
    .line 164
    .line 165
    :cond_7
    :goto_1
    throw p1
.end method

.method public statsReset()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_statsStartedAt:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 11
    .line 12
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->reset()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_requestTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->reset()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 21
    .line 22
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->reset()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_dispatchedTimeStats:Lorg/eclipse/jetty/util/statistic/SampleStatistic;

    .line 26
    .line 27
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/SampleStatistic;->reset()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_suspendStats:Lorg/eclipse/jetty/util/statistic/CounterStatistic;

    .line 31
    .line 32
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/statistic/CounterStatistic;->reset()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_resumes:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_expires:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses1xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses2xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses3xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses4xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responses5xx:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->_responsesTotalBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 72
    .line 73
    const-wide/16 v0, 0x0

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public toStatsHTML()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<h1>Statistics:</h1>\nStatistics gathering started "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getStatsOnMs()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "ms ago<br />\n<h2>Requests:</h2>\nTotal requests: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequests()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "<br />\nActive requests: "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequestsActive()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, "<br />\nMax active requests: "

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequestsActiveMax()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, "<br />\nTotal requests time: "

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequestTimeTotal()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "<br />\nMean request time: "

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequestTimeMean()D

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v1, "<br />\nMax request time: "

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequestTimeMax()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, "<br />\nRequest time standard deviation: "

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getRequestTimeStdDev()D

    .line 93
    .line 94
    .line 95
    move-result-wide v1

    .line 96
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, "<br />\n<h2>Dispatches:</h2>\nTotal dispatched: "

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatched()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v1, "<br />\nActive dispatched: "

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatchedActive()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "<br />\nMax active dispatched: "

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatchedActiveMax()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, "<br />\nTotal dispatched time: "

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatchedTimeTotal()J

    .line 141
    .line 142
    .line 143
    move-result-wide v1

    .line 144
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, "<br />\nMean dispatched time: "

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatchedTimeMean()D

    .line 153
    .line 154
    .line 155
    move-result-wide v1

    .line 156
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v1, "<br />\nMax dispatched time: "

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatchedTimeMax()J

    .line 165
    .line 166
    .line 167
    move-result-wide v1

    .line 168
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v1, "<br />\nDispatched time standard deviation: "

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getDispatchedTimeStdDev()D

    .line 177
    .line 178
    .line 179
    move-result-wide v1

    .line 180
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "<br />\nTotal requests suspended: "

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getSuspends()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v1, "<br />\nTotal requests expired: "

    .line 196
    .line 197
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getExpires()I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v1, "<br />\nTotal requests resumed: "

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResumes()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v1, "<br />\n<h2>Responses:</h2>\n1xx responses: "

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResponses1xx()I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v1, "<br />\n2xx responses: "

    .line 232
    .line 233
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResponses2xx()I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v1, "<br />\n3xx responses: "

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResponses3xx()I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    const-string v1, "<br />\n4xx responses: "

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResponses4xx()I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v1, "<br />\n5xx responses: "

    .line 268
    .line 269
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResponses5xx()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    const-string v1, "<br />\nBytes sent total: "

    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/StatisticsHandler;->getResponsesBytesTotal()J

    .line 285
    .line 286
    .line 287
    move-result-wide v1

    .line 288
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    const-string p0, "<br />\n"

    .line 292
    .line 293
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    return-object p0
.end method
