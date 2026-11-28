.class final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InFlightCall"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0082\u0008\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0010\u0010\u0006\u001a\u000c\u0012\u0008\u0012\u00060\u0008R\u00020\t0\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\t\u0010\u0012\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0013\u001a\u00020\u0005H\u00c6\u0003J\u0013\u0010\u0014\u001a\u000c\u0012\u0008\u0012\u00060\u0008R\u00020\t0\u0007H\u00c6\u0003J1\u0010\u0015\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0012\u0008\u0002\u0010\u0006\u001a\u000c\u0012\u0008\u0012\u00060\u0008R\u00020\t0\u0007H\u00c6\u0001J\u0013\u0010\u0016\u001a\u00020\u00172\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0019\u001a\u00020\u001aH\u00d6\u0001J\t\u0010\u001b\u001a\u00020\u001cH\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u001b\u0010\u0006\u001a\u000c\u0012\u0008\u0012\u00060\u0008R\u00020\t0\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;",
        "",
        "query",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "sentAt",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "queries",
        "",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;)V",
        "getQuery",
        "()Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "getSentAt",
        "()Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "getQueries",
        "()Ljava/util/List;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
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
.field private final queries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
            ">;"
        }
    .end annotation
.end field

.field private final query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

.field private final sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
            "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 286
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    .line 287
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    .line 289
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->copy(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    return-object v0
.end method

.method public final component2()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public final component3()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    return-object v0
.end method

.method public final copy(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
            "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
            ">;)",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;-><init>(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/util/List;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getQueries()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$CacheQuery;",
            ">;"
        }
    .end annotation

    .line 289
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    return-object v0
.end method

.method public final getQuery()Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
    .registers 2

    .line 286
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    return-object v0
.end method

.method public final getSentAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    .line 287
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-interface {v1}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "InFlightCall(query="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->query:Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sentAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->sentAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", queries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->queries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
