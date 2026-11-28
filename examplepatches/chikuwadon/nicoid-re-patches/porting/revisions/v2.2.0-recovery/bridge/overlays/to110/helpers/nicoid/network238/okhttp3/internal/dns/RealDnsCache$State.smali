.class final Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0082\u0008\u0018\u00002\u00020\u0001B+\u0012\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J-\u0010\u0013\u001a\u00020\u00002\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u00c6\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0017\u001a\u00020\u0018H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u001aH\u00d6\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;",
        "",
        "lastRequestedAt",
        "Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "inFlightCall",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;",
        "result",
        "Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;",
        "<init>",
        "(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;)V",
        "getLastRequestedAt",
        "()Lnicoid/network238/kotlin/time/ComparableTimeMark;",
        "getInFlightCall",
        "()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;",
        "getResult",
        "()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;",
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
.field private final inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

.field private final lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

.field private final result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;


# direct methods
.method public constructor <init>()V
    .registers 7

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;-><init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;)V
    .registers 4

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    .line 280
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    .line 281
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 7

    and-int/lit8 p5, p4, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p1, v0

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    move-object p2, v0

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    move-object p3, v0

    .line 278
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;-><init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;)V

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->copy(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public final component2()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    return-object v0
.end method

.method public final component3()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    return-object v0
.end method

.method public final copy(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;)Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;
    .registers 5

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;-><init>(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

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

.method public final getInFlightCall()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;
    .registers 2

    .line 280
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    return-object v0
.end method

.method public final getLastRequestedAt()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 2

    .line 279
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public final getResult()Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;
    .registers 2

    .line 281
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lnicoid/network238/kotlin/time/ComparableTimeMark;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    if-nez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_2
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "State(lastRequestedAt="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->lastRequestedAt:Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", inFlightCall="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->inFlightCall:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$InFlightCall;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$State;->result:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache$Result;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
