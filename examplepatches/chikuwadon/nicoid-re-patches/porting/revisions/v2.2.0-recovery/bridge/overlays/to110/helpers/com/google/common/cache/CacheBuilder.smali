.class public final Lcom/google/common/cache/CacheBuilder;
.super Ljava/lang/Object;
.source "CacheBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/cache/CacheBuilder$OneWeigher;,
        Lcom/google/common/cache/CacheBuilder$NullListener;,
        Lcom/google/common/cache/CacheBuilder$LoggerHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final CACHE_STATS_COUNTER:Lcom/google/common/base/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Supplier<",
            "Lcom/google/common/cache/AbstractCache$StatsCounter;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEFAULT_CONCURRENCY_LEVEL:I = 0x4

.field private static final DEFAULT_EXPIRATION_NANOS:I = 0x0

.field private static final DEFAULT_INITIAL_CAPACITY:I = 0x10

.field private static final DEFAULT_REFRESH_NANOS:I = 0x0

.field static final EMPTY_STATS:Lcom/google/common/cache/CacheStats;

.field static final NULL_STATS_COUNTER:Lcom/google/common/base/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Supplier<",
            "+",
            "Lcom/google/common/cache/AbstractCache$StatsCounter;",
            ">;"
        }
    .end annotation
.end field

.field static final NULL_TICKER:Lcom/google/common/base/Ticker;

.field static final UNSET_INT:I = -0x1


# instance fields
.field concurrencyLevel:I

.field expireAfterAccessNanos:J

.field expireAfterWriteNanos:J

.field initialCapacity:I

.field keyEquivalence:Lcom/google/common/base/Equivalence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field keyStrength:Lcom/google/common/cache/LocalCache$Strength;

.field maximumSize:J

.field maximumWeight:J

.field refreshNanos:J

.field removalListener:Lcom/google/common/cache/RemovalListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/RemovalListener<",
            "-TK;-TV;>;"
        }
    .end annotation
.end field

.field statsCounterSupplier:Lcom/google/common/base/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Supplier<",
            "+",
            "Lcom/google/common/cache/AbstractCache$StatsCounter;",
            ">;"
        }
    .end annotation
.end field

.field strictParsing:Z

.field ticker:Lcom/google/common/base/Ticker;

.field valueEquivalence:Lcom/google/common/base/Equivalence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field valueStrength:Lcom/google/common/cache/LocalCache$Strength;

.field weigher:Lcom/google/common/cache/Weigher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Weigher<",
            "-TK;-TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 14

    .line 207
    new-instance v0, Lcom/google/common/cache/CacheBuilder$1;

    invoke-direct {v0}, Lcom/google/common/cache/CacheBuilder$1;-><init>()V

    .line 208
    invoke-static {v0}, Lcom/google/common/base/Suppliers;->ofInstance(Ljava/lang/Object;)Lcom/google/common/base/Supplier;

    move-result-object v0

    sput-object v0, Lcom/google/common/cache/CacheBuilder;->NULL_STATS_COUNTER:Lcom/google/common/base/Supplier;

    .line 232
    new-instance v1, Lcom/google/common/cache/CacheStats;

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/google/common/cache/CacheStats;-><init>(JJJJJJ)V

    sput-object v1, Lcom/google/common/cache/CacheBuilder;->EMPTY_STATS:Lcom/google/common/cache/CacheStats;

    .line 246
    new-instance v0, Lcom/google/common/cache/CacheBuilder$2;

    invoke-direct {v0}, Lcom/google/common/cache/CacheBuilder$2;-><init>()V

    sput-object v0, Lcom/google/common/cache/CacheBuilder;->CACHE_STATS_COUNTER:Lcom/google/common/base/Supplier;

    .line 270
    new-instance v0, Lcom/google/common/cache/CacheBuilder$3;

    invoke-direct {v0}, Lcom/google/common/cache/CacheBuilder$3;-><init>()V

    sput-object v0, Lcom/google/common/cache/CacheBuilder;->NULL_TICKER:Lcom/google/common/base/Ticker;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 285
    iput-boolean v0, p0, Lcom/google/common/cache/CacheBuilder;->strictParsing:Z

    const/4 v0, -0x1

    .line 287
    iput v0, p0, Lcom/google/common/cache/CacheBuilder;->initialCapacity:I

    .line 288
    iput v0, p0, Lcom/google/common/cache/CacheBuilder;->concurrencyLevel:I

    const-wide/16 v0, -0x1

    .line 289
    iput-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    .line 290
    iput-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    .line 296
    iput-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    .line 299
    iput-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    .line 302
    iput-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->refreshNanos:J

    .line 311
    sget-object v0, Lcom/google/common/cache/CacheBuilder;->NULL_STATS_COUNTER:Lcom/google/common/base/Supplier;

    iput-object v0, p0, Lcom/google/common/cache/CacheBuilder;->statsCounterSupplier:Lcom/google/common/base/Supplier;

    return-void
.end method

.method private checkNonLoadingCache()V
    .registers 5

    .line 1070
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->refreshNanos:J

    const-wide/16 v2, -0x1

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const-string v0, "refreshAfterWrite requires a LoadingCache"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    return-void
.end method

.method private checkWeightWithWeigher()V
    .registers 8

    .line 1074
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->weigher:Lcom/google/common/cache/Weigher;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-wide/16 v3, -0x1

    if-nez v0, :cond_1

    .line 1075
    iget-wide v5, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    cmp-long p0, v5, v3

    if-eqz p0, :cond_0

    move v1, v2

    :cond_0
    const-string p0, "maximumWeight requires weigher"

    invoke-static {v1, p0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    return-void

    .line 1077
    :cond_1
    iget-boolean v0, p0, Lcom/google/common/cache/CacheBuilder;->strictParsing:Z

    .line 1080
    iget-wide v5, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    cmp-long p0, v5, v3

    if-eqz v0, :cond_3

    if-nez p0, :cond_2

    move v1, v2

    .line 1078
    :cond_2
    const-string p0, "weigher requires maximumWeight"

    invoke-static {v1, p0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    return-void

    :cond_3
    if-nez p0, :cond_4

    .line 1081
    sget-object p0, Lcom/google/common/cache/CacheBuilder$LoggerHolder;->logger:Ljava/util/logging/Logger;

    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v1, "ignoring weigher specified without maximumWeight"

    invoke-virtual {p0, v0, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :cond_4
    return-void
.end method

.method public static from(Lcom/google/common/cache/CacheBuilderSpec;)Lcom/google/common/cache/CacheBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "spec"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/CacheBuilderSpec;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 334
    invoke-virtual {p0}, Lcom/google/common/cache/CacheBuilderSpec;->toCacheBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/cache/CacheBuilder;->lenientParsing()Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static from(Ljava/lang/String;)Lcom/google/common/cache/CacheBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "spec"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 347
    invoke-static {p0}, Lcom/google/common/cache/CacheBuilderSpec;->parse(Ljava/lang/String;)Lcom/google/common/cache/CacheBuilderSpec;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/cache/CacheBuilder;->from(Lcom/google/common/cache/CacheBuilderSpec;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static newBuilder()Lcom/google/common/cache/CacheBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/CacheBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 323
    new-instance v0, Lcom/google/common/cache/CacheBuilder;

    invoke-direct {v0}, Lcom/google/common/cache/CacheBuilder;-><init>()V

    return-object v0
.end method

.method private static toNanosSaturated(Ljava/time/Duration;)J
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "duration"
        }
    .end annotation

    .line 1146
    :try_start_0
    invoke-virtual {p0}, Ljava/time/Duration;->toNanos()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 1148
    :catch_0
    invoke-virtual {p0}, Ljava/time/Duration;->isNegative()Z

    move-result p0

    if-eqz p0, :cond_0

    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_0

    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    :goto_0
    return-wide v0
.end method


# virtual methods
.method public build()Lcom/google/common/cache/Cache;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K1:TK;V1:TV;>()",
            "Lcom/google/common/cache/Cache<",
            "TK1;TV1;>;"
        }
    .end annotation

    .line 1064
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilder;->checkWeightWithWeigher()V

    .line 1065
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilder;->checkNonLoadingCache()V

    .line 1066
    new-instance v0, Lcom/google/common/cache/LocalCache$LocalManualCache;

    invoke-direct {v0, p0}, Lcom/google/common/cache/LocalCache$LocalManualCache;-><init>(Lcom/google/common/cache/CacheBuilder;)V

    return-object v0
.end method

.method public build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K1:TK;V1:TV;>(",
            "Lcom/google/common/cache/CacheLoader<",
            "-TK1;TV1;>;)",
            "Lcom/google/common/cache/LoadingCache<",
            "TK1;TV1;>;"
        }
    .end annotation

    .line 1047
    invoke-direct {p0}, Lcom/google/common/cache/CacheBuilder;->checkWeightWithWeigher()V

    .line 1048
    new-instance v0, Lcom/google/common/cache/LocalCache$LocalLoadingCache;

    invoke-direct {v0, p0, p1}, Lcom/google/common/cache/LocalCache$LocalLoadingCache;-><init>(Lcom/google/common/cache/CacheBuilder;Lcom/google/common/cache/CacheLoader;)V

    return-object v0
.end method

.method public concurrencyLevel(I)Lcom/google/common/cache/CacheBuilder;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "concurrencyLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 464
    iget v0, p0, Lcom/google/common/cache/CacheBuilder;->concurrencyLevel:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const-string v4, "concurrency level was already set to %s"

    invoke-static {v1, v4, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;I)V

    if-gtz p1, :cond_1

    move v2, v3

    .line 468
    :cond_1
    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 469
    iput p1, p0, Lcom/google/common/cache/CacheBuilder;->concurrencyLevel:I

    return-object p0
.end method

.method public expireAfterAccess(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "duration",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 847
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    const-string v5, "expireAfterAccess was already set to %s ns"

    invoke-static {v2, v5, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1

    move v3, v4

    .line 851
    :cond_1
    const-string v0, "duration cannot be negative: %s %s"

    invoke-static {v3, v0, p1, p2, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;JLjava/lang/Object;)V

    .line 852
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    return-object p0
.end method

.method public expireAfterAccess(Ljava/time/Duration;)Lcom/google/common/cache/CacheBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "duration"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/time/Duration;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 813
    invoke-static {p1}, Lcom/google/common/cache/CacheBuilder;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lcom/google/common/cache/CacheBuilder;->expireAfterAccess(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public expireAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "duration",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 766
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    const-string v5, "expireAfterWrite was already set to %s ns"

    invoke-static {v2, v5, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1

    move v3, v4

    .line 770
    :cond_1
    const-string v0, "duration cannot be negative: %s %s"

    invoke-static {v3, v0, p1, p2, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;JLjava/lang/Object;)V

    .line 771
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    return-object p0
.end method

.method public expireAfterWrite(Ljava/time/Duration;)Lcom/google/common/cache/CacheBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "duration"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/time/Duration;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 737
    invoke-static {p1}, Lcom/google/common/cache/CacheBuilder;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lcom/google/common/cache/CacheBuilder;->expireAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method getConcurrencyLevel()I
    .registers 2

    .line 474
    iget p0, p0, Lcom/google/common/cache/CacheBuilder;->concurrencyLevel:I

    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const/4 p0, 0x4

    :cond_0
    return p0
.end method

.method getExpireAfterAccessNanos()J
    .registers 5

    .line 858
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    const-wide/16 v2, -0x1

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    :cond_0
    return-wide v0
.end method

.method getExpireAfterWriteNanos()J
    .registers 5

    .line 777
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    const-wide/16 v2, -0x1

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    :cond_0
    return-wide v0
.end method

.method getInitialCapacity()I
    .registers 2

    .line 428
    iget p0, p0, Lcom/google/common/cache/CacheBuilder;->initialCapacity:I

    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const/16 p0, 0x10

    :cond_0
    return p0
.end method

.method getKeyEquivalence()Lcom/google/common/base/Equivalence;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 380
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {p0}, Lcom/google/common/cache/CacheBuilder;->getKeyStrength()Lcom/google/common/cache/LocalCache$Strength;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Strength;->defaultEquivalence()Lcom/google/common/base/Equivalence;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/base/Equivalence;

    return-object p0
.end method

.method getKeyStrength()Lcom/google/common/cache/LocalCache$Strength;
    .registers 2

    .line 646
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->keyStrength:Lcom/google/common/cache/LocalCache$Strength;

    sget-object v0, Lcom/google/common/cache/LocalCache$Strength;->STRONG:Lcom/google/common/cache/LocalCache$Strength;

    invoke-static {p0, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/cache/LocalCache$Strength;

    return-object p0
.end method

.method getMaximumWeight()J
    .registers 5

    .line 604
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 607
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->weigher:Lcom/google/common/cache/Weigher;

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    return-wide v0

    :cond_1
    return-wide v2
.end method

.method getRefreshNanos()J
    .registers 5

    .line 945
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->refreshNanos:J

    const-wide/16 v2, -0x1

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    :cond_0
    return-wide v0
.end method

.method getRemovalListener()Lcom/google/common/cache/RemovalListener;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K1:TK;V1:TV;>()",
            "Lcom/google/common/cache/RemovalListener<",
            "TK1;TV1;>;"
        }
    .end annotation

    .line 1006
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->removalListener:Lcom/google/common/cache/RemovalListener;

    sget-object v0, Lcom/google/common/cache/CacheBuilder$NullListener;->INSTANCE:Lcom/google/common/cache/CacheBuilder$NullListener;

    .line 1007
    invoke-static {p0, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/cache/RemovalListener;

    return-object p0
.end method

.method getStatsCounterSupplier()Lcom/google/common/base/Supplier;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Supplier<",
            "+",
            "Lcom/google/common/cache/AbstractCache$StatsCounter;",
            ">;"
        }
    .end annotation

    .line 1030
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->statsCounterSupplier:Lcom/google/common/base/Supplier;

    return-object p0
.end method

.method getTicker(Z)Lcom/google/common/base/Ticker;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "recordsTime"
        }
    .end annotation

    .line 966
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->ticker:Lcom/google/common/base/Ticker;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    if-eqz p1, :cond_1

    .line 969
    invoke-static {}, Lcom/google/common/base/Ticker;->systemTicker()Lcom/google/common/base/Ticker;

    move-result-object p0

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/common/cache/CacheBuilder;->NULL_TICKER:Lcom/google/common/base/Ticker;

    return-object p0
.end method

.method getValueEquivalence()Lcom/google/common/base/Equivalence;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 402
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->valueEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {p0}, Lcom/google/common/cache/CacheBuilder;->getValueStrength()Lcom/google/common/cache/LocalCache$Strength;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Strength;->defaultEquivalence()Lcom/google/common/base/Equivalence;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/base/Equivalence;

    return-object p0
.end method

.method getValueStrength()Lcom/google/common/cache/LocalCache$Strength;
    .registers 2

    .line 706
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->valueStrength:Lcom/google/common/cache/LocalCache$Strength;

    sget-object v0, Lcom/google/common/cache/LocalCache$Strength;->STRONG:Lcom/google/common/cache/LocalCache$Strength;

    invoke-static {p0, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/cache/LocalCache$Strength;

    return-object p0
.end method

.method getWeigher()Lcom/google/common/cache/Weigher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K1:TK;V1:TV;>()",
            "Lcom/google/common/cache/Weigher<",
            "TK1;TV1;>;"
        }
    .end annotation

    .line 613
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->weigher:Lcom/google/common/cache/Weigher;

    sget-object v0, Lcom/google/common/cache/CacheBuilder$OneWeigher;->INSTANCE:Lcom/google/common/cache/CacheBuilder$OneWeigher;

    invoke-static {p0, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/cache/Weigher;

    return-object p0
.end method

.method public initialCapacity(I)Lcom/google/common/cache/CacheBuilder;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "initialCapacity"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 418
    iget v0, p0, Lcom/google/common/cache/CacheBuilder;->initialCapacity:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const-string v4, "initial capacity was already set to %s"

    invoke-static {v1, v4, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;I)V

    if-gez p1, :cond_1

    move v2, v3

    .line 422
    :cond_1
    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 423
    iput p1, p0, Lcom/google/common/cache/CacheBuilder;->initialCapacity:I

    return-object p0
.end method

.method isRecordingStats()Z
    .registers 2

    .line 1026
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->statsCounterSupplier:Lcom/google/common/base/Supplier;

    sget-object v0, Lcom/google/common/cache/CacheBuilder;->CACHE_STATS_COUNTER:Lcom/google/common/base/Supplier;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method keyEquivalence(Lcom/google/common/base/Equivalence;)Lcom/google/common/cache/CacheBuilder;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "equivalence"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 374
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->keyEquivalence:Lcom/google/common/base/Equivalence;

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "key equivalence was already set to %s"

    invoke-static {v1, v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 375
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/base/Equivalence;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->keyEquivalence:Lcom/google/common/base/Equivalence;

    return-object p0
.end method

.method lenientParsing()Lcom/google/common/cache/CacheBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 359
    iput-boolean v0, p0, Lcom/google/common/cache/CacheBuilder;->strictParsing:Z

    return-object p0
.end method

.method public maximumSize(J)Lcom/google/common/cache/CacheBuilder;
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maximumSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 500
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v4, :cond_0

    move v4, v5

    goto :goto_0

    :cond_0
    move v4, v6

    :goto_0
    const-string v7, "maximum size was already set to %s"

    invoke-static {v4, v7, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    .line 502
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    move v2, v5

    goto :goto_1

    :cond_1
    move v2, v6

    :goto_1
    const-string v3, "maximum weight was already set to %s"

    invoke-static {v2, v3, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    .line 506
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->weigher:Lcom/google/common/cache/Weigher;

    if-nez v0, :cond_2

    move v0, v5

    goto :goto_2

    :cond_2
    move v0, v6

    :goto_2
    const-string v1, "maximum size can not be combined with weigher"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_3

    move v5, v6

    .line 507
    :cond_3
    const-string v0, "maximum size must not be negative"

    invoke-static {v5, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 508
    iput-wide p1, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    return-object p0
.end method

.method public maximumWeight(J)Lcom/google/common/cache/CacheBuilder;
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maximumWeight"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 543
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v4, :cond_0

    move v4, v5

    goto :goto_0

    :cond_0
    move v4, v6

    :goto_0
    const-string v7, "maximum weight was already set to %s"

    invoke-static {v4, v7, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    .line 547
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    move v2, v5

    goto :goto_1

    :cond_1
    move v2, v6

    :goto_1
    const-string v3, "maximum size was already set to %s"

    invoke-static {v2, v3, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_2

    move v5, v6

    .line 549
    :cond_2
    const-string v0, "maximum weight must not be negative"

    invoke-static {v5, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 550
    iput-wide p1, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    return-object p0
.end method

.method public recordStats()Lcom/google/common/cache/CacheBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1021
    sget-object v0, Lcom/google/common/cache/CacheBuilder;->CACHE_STATS_COUNTER:Lcom/google/common/base/Supplier;

    iput-object v0, p0, Lcom/google/common/cache/CacheBuilder;->statsCounterSupplier:Lcom/google/common/base/Supplier;

    return-object p0
.end method

.method public refreshAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "duration",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 936
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 937
    iget-wide v0, p0, Lcom/google/common/cache/CacheBuilder;->refreshNanos:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    const-string v5, "refresh was already set to %s ns"

    invoke-static {v2, v5, v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    move v3, v4

    .line 938
    :cond_1
    const-string v0, "duration must be positive: %s %s"

    invoke-static {v3, v0, p1, p2, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;JLjava/lang/Object;)V

    .line 939
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/common/cache/CacheBuilder;->refreshNanos:J

    return-object p0
.end method

.method public refreshAfterWrite(Ljava/time/Duration;)Lcom/google/common/cache/CacheBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "duration"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/time/Duration;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 898
    invoke-static {p1}, Lcom/google/common/cache/CacheBuilder;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, p1}, Lcom/google/common/cache/CacheBuilder;->refreshAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public removalListener(Lcom/google/common/cache/RemovalListener;)Lcom/google/common/cache/CacheBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K1:TK;V1:TV;>(",
            "Lcom/google/common/cache/RemovalListener<",
            "-TK1;-TV1;>;)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK1;TV1;>;"
        }
    .end annotation

    .line 994
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->removalListener:Lcom/google/common/cache/RemovalListener;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 999
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/cache/RemovalListener;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->removalListener:Lcom/google/common/cache/RemovalListener;

    return-object p0
.end method

.method setKeyStrength(Lcom/google/common/cache/LocalCache$Strength;)Lcom/google/common/cache/CacheBuilder;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "strength"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$Strength;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 640
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->keyStrength:Lcom/google/common/cache/LocalCache$Strength;

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "Key strength was already set to %s"

    invoke-static {v1, v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 641
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/cache/LocalCache$Strength;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->keyStrength:Lcom/google/common/cache/LocalCache$Strength;

    return-object p0
.end method

.method setValueStrength(Lcom/google/common/cache/LocalCache$Strength;)Lcom/google/common/cache/CacheBuilder;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "strength"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$Strength;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 700
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->valueStrength:Lcom/google/common/cache/LocalCache$Strength;

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "Value strength was already set to %s"

    invoke-static {v1, v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 701
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/cache/LocalCache$Strength;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->valueStrength:Lcom/google/common/cache/LocalCache$Strength;

    return-object p0
.end method

.method public softValues()Lcom/google/common/cache/CacheBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 695
    sget-object v0, Lcom/google/common/cache/LocalCache$Strength;->SOFT:Lcom/google/common/cache/LocalCache$Strength;

    invoke-virtual {p0, v0}, Lcom/google/common/cache/CacheBuilder;->setValueStrength(Lcom/google/common/cache/LocalCache$Strength;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public ticker(Lcom/google/common/base/Ticker;)Lcom/google/common/cache/CacheBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ticker"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Ticker;",
            ")",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 960
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->ticker:Lcom/google/common/base/Ticker;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 961
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/base/Ticker;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->ticker:Lcom/google/common/base/Ticker;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .line 1094
    invoke-static {p0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    .line 1095
    iget v1, p0, Lcom/google/common/cache/CacheBuilder;->initialCapacity:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 1096
    const-string v3, "initialCapacity"

    invoke-virtual {v0, v3, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1098
    :cond_0
    iget v1, p0, Lcom/google/common/cache/CacheBuilder;->concurrencyLevel:I

    if-eq v1, v2, :cond_1

    .line 1099
    const-string v2, "concurrencyLevel"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1101
    :cond_1
    iget-wide v1, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_2

    .line 1102
    const-string v5, "maximumSize"

    invoke-virtual {v0, v5, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1104
    :cond_2
    iget-wide v1, p0, Lcom/google/common/cache/CacheBuilder;->maximumWeight:J

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    .line 1105
    const-string v5, "maximumWeight"

    invoke-virtual {v0, v5, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;J)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1107
    :cond_3
    iget-wide v1, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    cmp-long v1, v1, v3

    const-string v2, "ns"

    if-eqz v1, :cond_4

    .line 1108
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterWriteNanos:J

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v5, "expireAfterWrite"

    invoke-virtual {v0, v5, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1110
    :cond_4
    iget-wide v5, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    cmp-long v1, v5, v3

    if-eqz v1, :cond_5

    .line 1111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v3, p0, Lcom/google/common/cache/CacheBuilder;->expireAfterAccessNanos:J

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "expireAfterAccess"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1113
    :cond_5
    iget-object v1, p0, Lcom/google/common/cache/CacheBuilder;->keyStrength:Lcom/google/common/cache/LocalCache$Strength;

    if-eqz v1, :cond_6

    .line 1114
    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache$Strength;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "keyStrength"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1116
    :cond_6
    iget-object v1, p0, Lcom/google/common/cache/CacheBuilder;->valueStrength:Lcom/google/common/cache/LocalCache$Strength;

    if-eqz v1, :cond_7

    .line 1117
    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache$Strength;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "valueStrength"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1119
    :cond_7
    iget-object v1, p0, Lcom/google/common/cache/CacheBuilder;->keyEquivalence:Lcom/google/common/base/Equivalence;

    if-eqz v1, :cond_8

    .line 1120
    const-string v1, "keyEquivalence"

    invoke-virtual {v0, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->addValue(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1122
    :cond_8
    iget-object v1, p0, Lcom/google/common/cache/CacheBuilder;->valueEquivalence:Lcom/google/common/base/Equivalence;

    if-eqz v1, :cond_9

    .line 1123
    const-string v1, "valueEquivalence"

    invoke-virtual {v0, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->addValue(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1125
    :cond_9
    iget-object p0, p0, Lcom/google/common/cache/CacheBuilder;->removalListener:Lcom/google/common/cache/RemovalListener;

    if-eqz p0, :cond_a

    .line 1126
    const-string p0, "removalListener"

    invoke-virtual {v0, p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->addValue(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 1128
    :cond_a
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method valueEquivalence(Lcom/google/common/base/Equivalence;)Lcom/google/common/cache/CacheBuilder;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "equivalence"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 395
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->valueEquivalence:Lcom/google/common/base/Equivalence;

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "value equivalence was already set to %s"

    invoke-static {v1, v2, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 397
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/base/Equivalence;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->valueEquivalence:Lcom/google/common/base/Equivalence;

    return-object p0
.end method

.method public weakKeys()Lcom/google/common/cache/CacheBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 635
    sget-object v0, Lcom/google/common/cache/LocalCache$Strength;->WEAK:Lcom/google/common/cache/LocalCache$Strength;

    invoke-virtual {p0, v0}, Lcom/google/common/cache/CacheBuilder;->setKeyStrength(Lcom/google/common/cache/LocalCache$Strength;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public weakValues()Lcom/google/common/cache/CacheBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 669
    sget-object v0, Lcom/google/common/cache/LocalCache$Strength;->WEAK:Lcom/google/common/cache/LocalCache$Strength;

    invoke-virtual {p0, v0}, Lcom/google/common/cache/CacheBuilder;->setValueStrength(Lcom/google/common/cache/LocalCache$Strength;)Lcom/google/common/cache/CacheBuilder;

    move-result-object p0

    return-object p0
.end method

.method public weigher(Lcom/google/common/cache/Weigher;)Lcom/google/common/cache/CacheBuilder;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "weigher"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K1:TK;V1:TV;>(",
            "Lcom/google/common/cache/Weigher<",
            "-TK1;-TV1;>;)",
            "Lcom/google/common/cache/CacheBuilder<",
            "TK1;TV1;>;"
        }
    .end annotation

    .line 588
    iget-object v0, p0, Lcom/google/common/cache/CacheBuilder;->weigher:Lcom/google/common/cache/Weigher;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 589
    iget-boolean v0, p0, Lcom/google/common/cache/CacheBuilder;->strictParsing:Z

    if-eqz v0, :cond_2

    .line 590
    iget-wide v3, p0, Lcom/google/common/cache/CacheBuilder;->maximumSize:J

    const-wide/16 v5, -0x1

    cmp-long v0, v3, v5

    if-eqz v0, :cond_1

    move v1, v2

    :cond_1
    const-string v0, "weigher can not be combined with maximum size (%s provided)"

    invoke-static {v1, v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;J)V

    .line 599
    :cond_2
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/cache/Weigher;

    iput-object p1, p0, Lcom/google/common/cache/CacheBuilder;->weigher:Lcom/google/common/cache/Weigher;

    return-object p0
.end method
