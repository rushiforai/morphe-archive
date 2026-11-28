.class public final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;,
        Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;,
        Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;,
        Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;,
        Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000C\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007*\u0001\u0016\u0008\u0007\u0018\u00002\u00020\u0001:\u0005,-./0B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\u0007\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0006\u0010\'\u001a\u00020(J\u000e\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020*R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\u00020\u0007X\u0080\u0004\u00a2\u0006\n\n\u0002\u0010\u0011\u001a\u0004\u0008\u000f\u0010\u0010R\u0016\u0010\u0008\u001a\u00020\u0007X\u0080\u0004\u00a2\u0006\n\n\u0002\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0010R\u0016\u0010\t\u001a\u00020\u0007X\u0080\u0004\u00a2\u0006\n\n\u0002\u0010\u0011\u001a\u0004\u0008\u0013\u0010\u0010R\u0016\u0010\n\u001a\u00020\u0007X\u0080\u0004\u00a2\u0006\n\n\u0002\u0010\u0011\u001a\u0004\u0008\u0014\u0010\u0010R\u0010\u0010\u0015\u001a\u00020\u0016X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0017R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u001c\u001a\u00020\u000c8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001d\u0010\u001eR\u0014\u0010\u001f\u001a\u00020\u000c8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008 \u0010\u001eR\u0014\u0010!\u001a\u00020\u000c8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\"\u0010\u001eR\u0014\u0010#\u001a\u00020\u000c8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008$\u0010\u001eR\u0014\u0010%\u001a\u00020\u000c8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008&\u0010\u001e\u00a8\u00061"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;",
        "",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "timeSource",
        "Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;",
        "minimumTimeToLive",
        "Lnicoid/network238/kotlin/time/Duration;",
        "maximumTimeToLive",
        "failureTimeToLive",
        "revalidateBeforeExpire",
        "maxEntryCount",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;JJJJILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V",
        "getMinimumTimeToLive-UwyO8pc$okhttp",
        "()J",
        "J",
        "getMaximumTimeToLive-UwyO8pc$okhttp",
        "getFailureTimeToLive-UwyO8pc$okhttp",
        "getRevalidateBeforeExpire-UwyO8pc$okhttp",
        "cache",
        "nicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;",
        "atomicNetworkCount",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "atomicHitCount",
        "atomicRequestCount",
        "size",
        "getSize$okhttp",
        "()I",
        "maxSize",
        "getMaxSize$okhttp",
        "networkCount",
        "getNetworkCount$okhttp",
        "hitCount",
        "getHitCount$okhttp",
        "requestCount",
        "getRequestCount$okhttp",
        "evictAll",
        "",
        "wrap",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;",
        "delegate",
        "CacheQuery",
        "Entry",
        "State",
        "InFlightCall",
        "Result",
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
.field private final atomicHitCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final atomicNetworkCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final atomicRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

.field private final failureTimeToLive:J

.field private final maximumTimeToLive:J

.field private final minimumTimeToLive:J

.field private final revalidateBeforeExpire:J

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method public static synthetic $r8$lambda$2BxAmk99W9mBemt9AEdBwzyw8SI()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;
    .registers 1

    invoke-static {}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->wrap$lambda$0$0()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    move-result-object v0

    return-object v0
.end method

.method private constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;JJJJI)V
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 36
    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->minimumTimeToLive:J

    .line 37
    iput-wide p5, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->maximumTimeToLive:J

    .line 38
    iput-wide p7, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->failureTimeToLive:J

    .line 39
    iput-wide p9, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->revalidateBeforeExpire:J

    .line 43
    new-instance p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    invoke-direct {p1, p2, p11}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;-><init>(Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;I)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    .line 63
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicNetworkCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 64
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicHitCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 65
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 79
    sget-object p1, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    sget-object p1, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const/4 p2, 0x0

    invoke-static {p2, p1}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v0

    invoke-static {p7, p8, v0, v1}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p7

    const-string p8, "Failed requirement."

    if-ltz p7, :cond_3

    .line 80
    invoke-static {p2, p1}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v0

    invoke-static {p3, p4, v0, v1}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p7

    if-ltz p7, :cond_2

    .line 81
    invoke-static {p5, p6, p3, p4}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p3

    if-ltz p3, :cond_1

    .line 82
    invoke-static {p2, p1}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p1

    invoke-static {p9, p10, p1, p2}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p1

    if-ltz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 81
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 80
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 79
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;JJJJILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 13

    invoke-direct/range {p0 .. p11}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;JJJJI)V

    return-void
.end method

.method public static final synthetic access$getAtomicHitCount$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 1

    .line 31
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicHitCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method public static final synthetic access$getAtomicNetworkCount$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 1

    .line 31
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicNetworkCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method public static final synthetic access$getAtomicRequestCount$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 1

    .line 31
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method public static final synthetic access$getCache$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;
    .registers 1

    .line 31
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    return-object p0
.end method

.method public static final synthetic access$getTaskRunner$p(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 1

    .line 31
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object p0
.end method

.method static final wrap$lambda$0(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$0;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$0;-><init>()V

    invoke-virtual {v0, p2, v1}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->computeIfAbsent(Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    .line 92
    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;

    invoke-direct {v1, p0, p2, p1, v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;-><init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;)V

    return-object v1
.end method

.method private static final wrap$lambda$0$0()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;
    .registers 1

    .line 91
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;-><init>()V

    return-object v0
.end method


# virtual methods
.method public final evictAll()V
    .registers 2

    .line 86
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->evictAll()V

    return-void
.end method

.method public final getFailureTimeToLive-UwyO8pc$okhttp()J
    .registers 3

    .line 38
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->failureTimeToLive:J

    return-wide v0
.end method

.method public final getHitCount$okhttp()I
    .registers 2

    .line 74
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicHitCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public final getMaxSize$okhttp()I
    .registers 2

    .line 70
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->getMaxSize()I

    move-result v0

    return v0
.end method

.method public final getMaximumTimeToLive-UwyO8pc$okhttp()J
    .registers 3

    .line 37
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->maximumTimeToLive:J

    return-wide v0
.end method

.method public final getMinimumTimeToLive-UwyO8pc$okhttp()J
    .registers 3

    .line 36
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->minimumTimeToLive:J

    return-wide v0
.end method

.method public final getNetworkCount$okhttp()I
    .registers 2

    .line 72
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicNetworkCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public final getRequestCount$okhttp()I
    .registers 2

    .line 76
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->atomicRequestCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public final getRevalidateBeforeExpire-UwyO8pc$okhttp()J
    .registers 3

    .line 39
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->revalidateBeforeExpire:J

    return-wide v0
.end method

.method public final getSize$okhttp()I
    .registers 2

    .line 68
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->cache:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->getSize()I

    move-result v0

    return v0
.end method

.method public final wrap(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$1;-><init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;)V

    return-object v0
.end method
