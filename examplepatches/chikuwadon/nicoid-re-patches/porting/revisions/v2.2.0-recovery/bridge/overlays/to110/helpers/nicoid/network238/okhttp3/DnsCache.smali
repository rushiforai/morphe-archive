.class public final Lnicoid/network238/okhttp3/DnsCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B;\u0008\u0016\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0004\u0010\rJ\u0006\u0010\u0017\u001a\u00020\u0018R\u0016\u0010\u0002\u001a\u00020\u00038\u0000X\u0081\u0004\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u00078G\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0010R\u0011\u0010\u0008\u001a\u00020\u00078G\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\u0010R\u0011\u0010\t\u001a\u00020\u00078G\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\u0010R\u0011\u0010\n\u001a\u00020\u00078G\u00a2\u0006\u0006\u001a\u0004\u0008\n\u0010\u0010R\u0011\u0010\u0011\u001a\u00020\u000c8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0012R\u0011\u0010\u0013\u001a\u00020\u000c8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0013\u0010\u0012R\u0011\u0010\u0014\u001a\u00020\u000c8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0012R\u0011\u0010\u0015\u001a\u00020\u000c8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0012R\u0011\u0010\u0016\u001a\u00020\u000c8G\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0012\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/DnsCache;",
        "",
        "-delegate",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)V",
        "minimumTimeToLive",
        "Lnicoid/network238/kotlin/time/Duration;",
        "maximumTimeToLive",
        "failureTimeToLive",
        "revalidateBeforeExpire",
        "maxEntryCount",
        "",
        "(JJJJILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V",
        "get-delegate$okhttp$annotations",
        "()V",
        "()J",
        "maxSize",
        "()I",
        "size",
        "networkCount",
        "hitCount",
        "requestCount",
        "evictAll",
        "",
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
.field public final -delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;


# direct methods
.method private constructor <init>(JJJJI)V
    .registers 23

    .line 131
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    .line 132
    sget-object v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 133
    sget-object v2, Lnicoid/network238/kotlin/time/TimeSource$Monotonic;->INSTANCE:Lnicoid/network238/kotlin/time/TimeSource$Monotonic;

    .line 131
    const/4 v12, 0x0

    move-wide v3, p1

    move-wide/from16 v5, p3

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    move/from16 v11, p9

    invoke-direct/range {v0 .. v12}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;JJJJILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 129
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/DnsCache;-><init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)V

    return-void
.end method

.method public synthetic constructor <init>(JJJJIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 22

    and-int/lit8 v0, p10, 0x1

    const/16 v1, 0xa

    if-eqz v0, :cond_0

    .line 124
    sget-object v0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v2

    goto :goto_0

    .line 0
    :cond_0
    move-wide v2, p1

    .line 124
    :goto_0
    and-int/lit8 v0, p10, 0x2

    if-eqz v0, :cond_1

    .line 125
    sget-object v0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const/16 v4, 0x12c

    invoke-static {v4, v0}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v4

    goto :goto_1

    .line 124
    :cond_1
    move-wide v4, p3

    .line 125
    :goto_1
    and-int/lit8 v0, p10, 0x4

    if-eqz v0, :cond_2

    .line 126
    sget-object v0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v0

    goto :goto_2

    .line 125
    :cond_2
    move-wide v0, p5

    .line 126
    :goto_2
    and-int/lit8 v6, p10, 0x8

    if-eqz v6, :cond_3

    .line 127
    sget-object v6, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    sget-object v6, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const/4 v7, 0x2

    invoke-static {v7, v6}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v6

    goto :goto_3

    .line 126
    :cond_3
    move-wide/from16 v6, p7

    .line 127
    :goto_3
    and-int/lit8 v8, p10, 0x10

    if-eqz v8, :cond_4

    const/16 v8, 0x3e8

    goto :goto_4

    :cond_4
    move/from16 v8, p9

    .line 123
    :goto_4
    const/4 v9, 0x0

    move-object p1, p0

    move-wide/from16 p6, v0

    move-wide p2, v2

    move-wide p4, v4

    move-wide/from16 p8, v6

    move/from16 p10, v8

    move-object/from16 p11, v9

    invoke-direct/range {p1 .. p11}, Lnicoid/network238/okhttp3/DnsCache;-><init>(JJJJILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public synthetic constructor <init>(JJJJILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 11

    invoke-direct/range {p0 .. p9}, Lnicoid/network238/okhttp3/DnsCache;-><init>(JJJJI)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    return-void
.end method

.method public static synthetic get-delegate$okhttp$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public final evictAll()V
    .registers 2

    .line 147
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->evictAll()V

    return-void
.end method

.method public final failureTimeToLive()J
    .registers 3

    .line 91
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getFailureTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final hitCount()I
    .registers 2

    .line 113
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getHitCount$okhttp()I

    move-result v0

    return v0
.end method

.method public final maxSize()I
    .registers 2

    .line 99
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getMaxSize$okhttp()I

    move-result v0

    return v0
.end method

.method public final maximumTimeToLive()J
    .registers 3

    .line 87
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getMaximumTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final minimumTimeToLive()J
    .registers 3

    .line 83
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getMinimumTimeToLive-UwyO8pc$okhttp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final networkCount()I
    .registers 2

    .line 108
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getNetworkCount$okhttp()I

    move-result v0

    return v0
.end method

.method public final requestCount()I
    .registers 2

    .line 121
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getRequestCount$okhttp()I

    move-result v0

    return v0
.end method

.method public final revalidateBeforeExpire()J
    .registers 3

    .line 95
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getRevalidateBeforeExpire-UwyO8pc$okhttp()J

    move-result-wide v0

    return-wide v0
.end method

.method public final size()I
    .registers 2

    .line 103
    iget-object v0, p0, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->getSize$okhttp()I

    move-result v0

    return v0
.end method
