.class public abstract Lnicoid/network238/okhttp3/internal/dns/MemoryCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;
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

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008&\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0008\u0008\u0001\u0010\u0003*\u00020\u00022\u00020\u0002:\u0001 B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00028\u0001H$\u00a2\u0006\u0002\u0010\u0016J!\u0010\u0017\u001a\u00028\u00012\u0006\u0010\u0018\u001a\u00028\u00002\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u001a\u00a2\u0006\u0002\u0010\u001bJ\u0006\u0010\u001c\u001a\u00020\u001dJ\u000e\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u0007R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u00078F\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\rR\u001a\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/MemoryCache;",
        "K",
        "",
        "V",
        "timeSource",
        "Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;",
        "maxSize",
        "",
        "<init>",
        "(Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;I)V",
        "getTimeSource",
        "()Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;",
        "getMaxSize",
        "()I",
        "size",
        "getSize",
        "entries",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "lastRequestedAt",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "now",
        "value",
        "(Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/lang/Object;)Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "computeIfAbsent",
        "key",
        "computeValue",
        "Lnicoid/network238/kotlin/Function0;",
        "(Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "evictAll",
        "",
        "evict",
        "count",
        "NewestFirst",
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
.field private final entries:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private final maxSize:I

.field private final timeSource:Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;I)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->timeSource:Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;

    .line 33
    iput p2, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->maxSize:I

    .line 38
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    if-ltz p2, :cond_0

    return-void

    .line 41
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Failed requirement."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final computeIfAbsent(Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TV;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->maxSize:I

    if-nez v0, :cond_0

    invoke-interface {p2}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 63
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    .line 66
    :cond_1
    invoke-interface {p2}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p2

    .line 67
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    return-object p1

    .line 71
    :cond_2
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result p1

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->maxSize:I

    sub-int/2addr p1, v0

    if-lt p1, v0, :cond_3

    .line 73
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->evict(I)V

    :cond_3
    return-object p2
.end method

.method public final evict(I)V
    .registers 7

    .line 96
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->timeSource:Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;

    invoke-interface {v0}, Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;->markNow()Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v0

    .line 97
    new-instance v1, Ljava/util/PriorityQueue;

    add-int/lit8 v2, p1, 0x1

    sget-object v3, Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/MemoryCache$NewestFirst;

    invoke-direct {v1, v2, v3}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 98
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 99
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 100
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v3, Ljava/util/Map$Entry;

    .line 102
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v4}, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->lastRequestedAt(Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/lang/Object;)Lnicoid/network238/kotlin/time/ComparableTimeMark;

    move-result-object v4

    if-nez v4, :cond_1

    .line 105
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    .line 111
    :cond_1
    invoke-static {v4, v3}, Lnicoid/network238/kotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lnicoid/network238/kotlin/Pair;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 116
    :goto_1
    invoke-virtual {v1}, Ljava/util/PriorityQueue;->size()I

    move-result v3

    if-le v3, p1, :cond_0

    .line 117
    invoke-virtual {v1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    goto :goto_0

    .line 121
    :cond_2
    invoke-virtual {v1}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 122
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    return-void
.end method

.method public final evictAll()V
    .registers 2

    .line 80
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    return-void
.end method

.method public final getMaxSize()I
    .registers 2

    .line 33
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->maxSize:I

    return v0
.end method

.method public final getSize()I
    .registers 2

    .line 36
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->entries:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method

.method public final getTimeSource()Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;
    .registers 2

    .line 32
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/MemoryCache;->timeSource:Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;

    return-object v0
.end method

.method protected abstract lastRequestedAt(Lnicoid/network238/kotlin/time/ComparableTimeMark;Ljava/lang/Object;)Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
            "TV;)",
            "Lnicoid/network238/kotlin/time/ComparableTimeMark;"
        }
    .end annotation
.end method
