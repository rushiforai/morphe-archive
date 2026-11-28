.class final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
.implements Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CacheQuery"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00020\u00012\u00020\u0002B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0011\u001a\u00020\u0002H\u0016J\u0008\u0010\u0018\u001a\u00020\u0017H\u0016J\u0010\u0010\u0019\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J\u0010\u0010\u001c\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u001eH\u0016R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u001c\u0010\u0011\u001a\u0004\u0018\u00010\u0002X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u001f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;",
        "question",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "delegate",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;",
        "entry",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;)V",
        "getQuestion",
        "()Lnicoid/network238/okhttp3/internal/dns/Question;",
        "getDelegate",
        "()Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;",
        "getEntry",
        "()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;",
        "callback",
        "getCallback",
        "()Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;",
        "setCallback",
        "(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V",
        "enqueue",
        "",
        "cancel",
        "onResponse",
        "dnsResponse",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "onFailure",
        "e",
        "Ljava/io/IOException;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

.field private final delegate:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

.field private final entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

.field private final question:Lnicoid/network238/okhttp3/internal/dns/Question;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    .line 101
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->delegate:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    .line 102
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    return-void
.end method

.method static final cancel$lambda$0(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 196
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/io/IOException;

    const-string v1, "canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    .line 197
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final enqueue$lambda$1(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 162
    instance-of v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;

    if-eqz v0, :cond_0

    check-cast p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;->getMessage()Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move-result-object p0

    invoke-interface {p1, p0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onResponse(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V

    goto :goto_0

    .line 163
    :cond_0
    instance-of v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;

    if-eqz v0, :cond_1

    check-cast p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;->getException()Ljava/io/IOException;

    move-result-object p0

    invoke-interface {p1, p0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    .line 165
    :goto_0
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0

    .line 161
    :cond_1
    new-instance p0, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;

    invoke-direct {p0}, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;-><init>()V

    throw p0
.end method


# virtual methods
.method public cancel()V
    .registers 10

    .line 178
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    .line 179
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 182
    :cond_1
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getQueries()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->minus(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 183
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getQueries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v0, v3, :cond_2

    :goto_0
    return-void

    .line 188
    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x3

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v3

    .line 186
    const/4 v2, 0x0

    const/4 v5, 0x5

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    move-result-object v0

    .line 193
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v2

    invoke-static {v2, v1, v0}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    # getter for: Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->access$getTaskRunner$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " dns"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery$1;

    invoke-direct {v6, p0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery$1;-><init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;)V

    const/4 v7, 0x6

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public enqueue(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    if-nez v0, :cond_8

    .line 109
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    .line 111
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    # getter for: Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->access$getCache$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->getTimeSource()Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;->markNow()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v2

    .line 113
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    .line 114
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getResult()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    move-result-object v0

    .line 115
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v3

    if-eqz v0, :cond_1

    .line 118
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;->getExpireAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v4

    invoke-interface {v2, v4}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;)I

    move-result v4

    if-gez v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    move v9, v4

    if-eqz v3, :cond_3

    if-eqz v9, :cond_2

    move-object v7, v3

    goto :goto_2

    .line 132
    :cond_2
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getQueries()Ljava/util/List;

    move-result-object v4

    invoke-static {v4, p0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v4

    move-object v7, v3

    move-object v3, v4

    goto :goto_2

    :cond_3
    move-object v7, v3

    if-eqz v0, :cond_4

    .line 135
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;->getRevalidateAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v3

    invoke-interface {v2, v3}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;)I

    move-result v3

    if-gez v3, :cond_4

    const/4 v3, 0x0

    goto :goto_2

    .line 136
    :cond_4
    new-instance v3, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    .line 137
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->delegate:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-interface {v4, v5}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;->newQuery(Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    move-result-object v4

    if-eqz v9, :cond_5

    .line 139
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v5

    goto :goto_1

    :cond_5
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 136
    :goto_1
    invoke-direct {v3, v4, v2, v5}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;-><init>(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;)V

    :goto_2
    nop

    .line 123
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    move-result-object v3

    .line 149
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v4

    invoke-static {v4, v1, v3}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 151
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    # getter for: Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->access$getAtomicRequestCount$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    if-nez v7, :cond_6

    .line 153
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 154
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    # getter for: Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicNetworkCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->access$getAtomicNetworkCount$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 155
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getQuery()Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    move-result-object v1

    invoke-interface {v1, p0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery;->enqueue(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    :cond_6
    if-eqz v9, :cond_7

    .line 159
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    # getter for: Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicHitCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->access$getAtomicHitCount$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 160
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    # getter for: Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->access$getTaskRunner$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " dns"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery$0;

    invoke-direct {v7, v0, p1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery$0;-><init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    const/4 v8, 0x6

    const/4 v9, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    :cond_7
    return-void

    .line 108
    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "already enqueued"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final getCallback()Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;
    .registers 2

    .line 105
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    return-object v0
.end method

.method public final getDelegate()Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;
    .registers 2

    .line 101
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->delegate:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    return-object v0
.end method

.method public final getEntry()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;
    .registers 2

    .line 102
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    return-object v0
.end method

.method public final getQuestion()Lnicoid/network238/okhttp3/internal/dns/Question;
    .registers 2

    .line 100
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    return-object v0
.end method

.method public onFailure(Ljava/io/IOException;)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 246
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    .line 247
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getSentAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v0

    .line 248
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getFailureTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v2

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getRevalidateBeforeExpire-UwyO8pc$okhttp()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lnicoid/network238/kotlin/time/Duration;->minus-LRDsOJo(JJ)J

    move-result-wide v2

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v2

    sget-object v3, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const/4 v4, 0x0

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v3

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtLeast(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Lnicoid/network238/kotlin/time/Duration;

    invoke-virtual {v2}, Lnicoid/network238/kotlin/time/Duration;->unbox-impl()J

    move-result-wide v2

    .line 256
    invoke-interface {v0, v2, v3}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->plus-LRDsOJo(J)Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v2

    .line 257
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getFailureTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v3

    invoke-interface {v0, v3, v4}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->plus-LRDsOJo(J)Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v0

    .line 254
    new-instance v4, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;

    invoke-direct {v4, v2, v0, p1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Failure;-><init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/io/IOException;)V

    .line 251
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    move-result-object v0

    .line 261
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v2

    invoke-static {v2, v1, v0}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 263
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getQueries()Ljava/util/List;

    move-result-object v0

    .line 264
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;

    .line 265
    iget-object v1, v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onResponse(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 205
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    .line 206
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getSentAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v0

    .line 209
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAnswers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 210
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getFailureTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v2

    goto :goto_1

    .line 214
    :cond_1
    sget-object v2, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAnswers()Ljava/util/List;

    move-result-object v2

    .line 215
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    invoke-interface {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;->getTimeToLive()I

    move-result v3

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;

    invoke-interface {v4}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;->getTimeToLive()I

    move-result v4

    if-le v3, v4, :cond_2

    move v3, v4

    goto :goto_0

    .line 216
    :cond_3
    sget-object v2, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {v3, v2}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v2

    .line 217
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getMinimumTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v3

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v3

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getMaximumTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v4

    invoke-static {v4, v5}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(Ljava/lang/Comparable;Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Lnicoid/network238/kotlin/time/Duration;

    invoke-virtual {v2}, Lnicoid/network238/kotlin/time/Duration;->unbox-impl()J

    move-result-wide v2

    .line 220
    :goto_1
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->this$0:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getRevalidateBeforeExpire-UwyO8pc$okhttp()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lnicoid/network238/kotlin/time/Duration;->minus-LRDsOJo(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v4

    sget-object v5, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const/4 v6, 0x0

    invoke-static {v6, v5}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v5

    invoke-static {v5, v6}, Lnicoid/network238/kotlin/time/Duration;->box-impl(J)Lnicoid/network238/kotlin/time/Duration;

    move-result-object v5

    invoke-static {v4, v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtLeast(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Lnicoid/network238/kotlin/time/Duration;

    invoke-virtual {v4}, Lnicoid/network238/kotlin/time/Duration;->unbox-impl()J

    move-result-wide v4

    .line 228
    invoke-interface {v0, v4, v5}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->plus-LRDsOJo(J)Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v4

    .line 229
    invoke-interface {v0, v2, v3}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->plus-LRDsOJo(J)Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v0

    .line 226
    move-object v2, v4

    new-instance v4, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;

    invoke-direct {v4, v2, v0, p1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result$Success;-><init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V

    .line 223
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    move-result-object v0

    .line 233
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->entry:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v2

    invoke-static {v2, v1, v0}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->getQueries()Ljava/util/List;

    move-result-object v0

    .line 236
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;

    .line 237
    iget-object v1, v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onResponse(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V

    goto :goto_2

    :cond_4
    return-void

    .line 215
    :cond_5
    new-instance p1, Ljava/util/NoSuchElementException;

    invoke-direct {p1}, Ljava/util/NoSuchElementException;-><init>()V

    throw p1
.end method

.method public final setCallback(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
    .registers 2

    .line 105
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;->callback:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;

    return-void
.end method
