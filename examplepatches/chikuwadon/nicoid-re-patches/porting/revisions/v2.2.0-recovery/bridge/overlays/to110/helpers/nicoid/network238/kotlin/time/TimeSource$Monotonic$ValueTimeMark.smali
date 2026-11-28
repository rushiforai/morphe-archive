.class public final Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/time/ComparableTimeMark;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/time/TimeSource$Monotonic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ValueTimeMark"
.end annotation


# instance fields
.field private final reading:J


# direct methods
.method private synthetic constructor <init>(J)V
    .registers 3

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    return-void
.end method

.method public static final synthetic box-impl(J)Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;
    .registers 3

    new-instance v0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;-><init>(J)V

    return-object v0
.end method

.method public static constructor-impl(J)J
    .registers 2

    return-wide p0
.end method

.method public static equals-impl(JLjava/lang/Object;)Z
    .registers 5

    instance-of v0, p2, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    if-eqz v0, :cond_0

    check-cast p2, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    invoke-virtual {p2}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->unbox-impl()J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static hashCode-impl(J)I
    .registers 2

    invoke-static {p0, p1}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    return p0
.end method

.method public static final minus-6eNON_k(JJ)J
    .registers 5

    .line 90
    sget-object v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->INSTANCE:Lnicoid/network238/kotlin/time/MonotonicTimeSource;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->differenceBetween-fRLX17w(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static minus-UwyO8pc(JLnicoid/network238/kotlin/time/ComparableTimeMark;)J
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    instance-of v0, p2, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    if-eqz v0, :cond_0

    .line 76
    check-cast p2, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    invoke-virtual {p2}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->unbox-impl()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-6eNON_k(JJ)J

    move-result-wide p0

    return-wide p0

    .line 75
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Subtracting or comparing time marks from different time sources is not possible: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->toString-impl(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " and "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static plus-LRDsOJo(JJ)J
    .registers 5

    .line 68
    sget-object v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->INSTANCE:Lnicoid/network238/kotlin/time/MonotonicTimeSource;

    invoke-virtual {v0, p0, p1, p2, p3}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->adjustReading-6QKq23U(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static toString-impl(J)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ValueTimeMark(reading="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 p1, 0x29

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 63
    check-cast p1, Lnicoid/network238/kotlin/time/ComparableTimeMark;

    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;)I
    .registers 2

    .line 63
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/ComparableTimeMark$DefaultImpls;->compareTo(Lnicoid/network238/kotlin/time/ComparableTimeMark;Lnicoid/network238/kotlin/time/ComparableTimeMark;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->equals-impl(JLjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .registers 3

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->hashCode-impl(J)I

    move-result v0

    return v0
.end method

.method public minus-UwyO8pc(Lnicoid/network238/kotlin/time/ComparableTimeMark;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    iget-wide v0, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-UwyO8pc(JLnicoid/network238/kotlin/time/ComparableTimeMark;)J

    move-result-wide v0

    return-wide v0
.end method

.method public plus-LRDsOJo(J)J
    .registers 5

    .line 68
    iget-wide v0, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1, p2}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->plus-LRDsOJo(JJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public bridge synthetic plus-LRDsOJo(J)Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 3

    .line 63
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->plus-LRDsOJo(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->toString-impl(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic unbox-impl()J
    .registers 3

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    return-wide v0
.end method
