.class public final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;
.super Lnicoid/network238/okhttp3/internal/dns/MemoryCache;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;JJJJI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lnicoid/network238/okhttp3/internal/dns/MemoryCache<",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001J\u001a\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u0003H\u0014\u00a8\u0006\u0008"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1",
        "Lnicoid/network238/okhttp3/internal/dns/MemoryCache;",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;",
        "lastRequestedAt",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "now",
        "value",
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


# direct methods
.method constructor <init>(Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;I)V
    .registers 3

    .line 43
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;-><init>(Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic lastRequestedAt(Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/lang/Object;)Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 3

    .line 43
    check-cast p2, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$cache$1;->lastRequestedAt(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;)Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object p1

    return-object p1
.end method

.method protected lastRequestedAt(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;)Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Entry;->getState()Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    .line 54
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    move-result-object v0

    if-nez v0, :cond_1

    .line 55
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getResult()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;->getExpireAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 56
    invoke-interface {v0, p1}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;)I

    move-result p1

    if-gtz p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return-object p1

    .line 59
    :cond_1
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->getLastRequestedAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object p1

    return-object p1
.end method
