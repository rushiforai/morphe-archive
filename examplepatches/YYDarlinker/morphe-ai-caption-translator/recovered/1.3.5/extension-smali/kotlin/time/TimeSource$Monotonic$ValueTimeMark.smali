.class public final Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;
.super Ljava/lang/Object;
.source "TimeSource.kt"

# interfaces
.implements Lkotlin/time/ComparableTimeMark;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/time/TimeSource$Monotonic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ValueTimeMark"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0008\u0087@\u0018\u00002\u00020\u0001B\u0015\u0008@\u0012\n\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0011\u0010\u0008\u001a\u00020\tH\u0096\u0080\u0004\u00a2\u0006\u0004\u0008\n\u0010\u0006J\u0019\u0010\u000b\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\tH\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0019\u0010\u000f\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\tH\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u0011\u0010\u0011\u001a\u00020\u0012H\u0096\u0080\u0004\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0011\u0010\u0015\u001a\u00020\u0012H\u0096\u0080\u0004\u00a2\u0006\u0004\u0008\u0016\u0010\u0014J\u0019\u0010\u000f\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\u0001H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0019\u0010\u000f\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\u0000H\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u001a\u0010\u000eJ\u0019\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0017\u001a\u00020\u0000H\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0014\u0010\u001f\u001a\u00020\u00122\u0008\u0010\u0017\u001a\u0004\u0018\u00010 H\u00d6\u0083\u0004J\n\u0010!\u001a\u00020\u001cH\u00d6\u0081\u0004J\n\u0010\"\u001a\u00020#H\u00d6\u0081\u0004R\u0015\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004X\u0080\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0007\u0088\u0001\u0002\u0092\u0001\u00060\u0003j\u0002`\u0004\u00ca\u0001\u000c\u0008%\u0012\u0008\u0008&\u0012\u0004\u0008\u0008(\'\u00ca\u0001\u0010\u0008(\u0012\u000c\u0008)\u0012\u0008\u0008\u000cJ\u0004\u0008\t0*\u00ca\u0001\u0002\u0008+\u00a8\u0006$"
    }
    d2 = {
        "Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;",
        "Lkotlin/time/ComparableTimeMark;",
        "reading",
        "",
        "Lkotlin/time/ValueTimeMarkReading;",
        "constructor-impl",
        "(J)J",
        "J",
        "elapsedNow",
        "Lkotlin/time/Duration;",
        "elapsedNow-UwyO8pc",
        "plus",
        "duration",
        "plus-LRDsOJo",
        "(JJ)J",
        "minus",
        "minus-LRDsOJo",
        "hasPassedNow",
        "",
        "hasPassedNow-impl",
        "(J)Z",
        "hasNotPassedNow",
        "hasNotPassedNow-impl",
        "other",
        "minus-UwyO8pc",
        "(JLkotlin/time/ComparableTimeMark;)J",
        "minus-6eNON_k",
        "compareTo",
        "",
        "compareTo-6eNON_k",
        "(JJ)I",
        "equals",
        "",
        "hashCode",
        "toString",
        "",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.9",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/time/ExperimentalTime;",
        "Lkotlin/jvm/JvmInline;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/jvm/JvmInline;
.end annotation


# instance fields
.field private final reading:J


# direct methods
.method private synthetic constructor <init>(J)V
    .registers 3

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    return-void
.end method

.method public static final synthetic box-impl(J)Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;
    .registers 3

    new-instance v0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    invoke-direct {v0, p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;-><init>(J)V

    return-object v0
.end method

.method public static final compareTo-6eNON_k(JJ)I
    .registers 4

    .line 115
    invoke-static {p0, p1, p2, p3}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-6eNON_k(JJ)J

    move-result-wide p0

    sget-object p2, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p2}, Lkotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide p2

    invoke-static {p0, p1, p2, p3}, Lkotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p0

    return p0
.end method

.method public static compareTo-impl(JLkotlin/time/ComparableTimeMark;)I
    .registers 4

    const-string v0, "other"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object p0

    invoke-virtual {p0, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->compareTo(Lkotlin/time/ComparableTimeMark;)I

    move-result p0

    return p0
.end method

.method public static constructor-impl(J)J
    .registers 2

    return-wide p0
.end method

.method public static elapsedNow-UwyO8pc(J)J
    .registers 3

    .line 82
    sget-object v0, Lkotlin/time/MonotonicTimeSource;->INSTANCE:Lkotlin/time/MonotonicTimeSource;

    invoke-virtual {v0, p0, p1}, Lkotlin/time/MonotonicTimeSource;->elapsedFrom-6eNON_k(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static equals-impl(JLjava/lang/Object;)Z
    .registers 7

    instance-of v0, p2, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    check-cast p2, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    invoke-virtual {p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->unbox-impl()J

    move-result-wide v2

    cmp-long p0, p0, v2

    if-eqz p0, :cond_11

    return v1

    :cond_11
    const/4 p0, 0x1

    return p0
.end method

.method public static final equals-impl0(JJ)Z
    .registers 4

    cmp-long p0, p0, p2

    if-nez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public static hasNotPassedNow-impl(J)Z
    .registers 2

    .line 86
    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->elapsedNow-UwyO8pc(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/Duration;->isNegative-impl(J)Z

    move-result p0

    return p0
.end method

.method public static hasPassedNow-impl(J)Z
    .registers 2

    .line 85
    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->elapsedNow-UwyO8pc(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/Duration;->isNegative-impl(J)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static hashCode-impl(J)I
    .registers 2

    invoke-static {p0, p1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(J)I

    move-result p0

    return p0
.end method

.method public static final minus-6eNON_k(JJ)J
    .registers 5

    .line 105
    sget-object v0, Lkotlin/time/MonotonicTimeSource;->INSTANCE:Lkotlin/time/MonotonicTimeSource;

    invoke-virtual {v0, p0, p1, p2, p3}, Lkotlin/time/MonotonicTimeSource;->differenceBetween-fRLX17w(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static minus-LRDsOJo(JJ)J
    .registers 5

    .line 84
    sget-object v0, Lkotlin/time/MonotonicTimeSource;->INSTANCE:Lkotlin/time/MonotonicTimeSource;

    invoke-static {p2, p3}, Lkotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p2

    invoke-virtual {v0, p0, p1, p2, p3}, Lkotlin/time/MonotonicTimeSource;->adjustReading-6QKq23U(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static minus-UwyO8pc(JLkotlin/time/ComparableTimeMark;)J
    .registers 6

    const-string v0, "other"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    instance-of v0, p2, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    if-eqz v0, :cond_14

    .line 91
    check-cast p2, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    invoke-virtual {p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->unbox-impl()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-6eNON_k(JJ)J

    move-result-wide p0

    return-wide p0

    .line 90
    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Subtracting or comparing time marks from different time sources is not possible: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->toString-impl(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " and "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static plus-LRDsOJo(JJ)J
    .registers 5

    .line 83
    sget-object v0, Lkotlin/time/MonotonicTimeSource;->INSTANCE:Lkotlin/time/MonotonicTimeSource;

    invoke-virtual {v0, p0, p1, p2, p3}, Lkotlin/time/MonotonicTimeSource;->adjustReading-6QKq23U(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static toString-impl(J)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ValueTimeMark(reading="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 67
    check-cast p1, Lkotlin/time/ComparableTimeMark;

    invoke-virtual {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->compareTo(Lkotlin/time/ComparableTimeMark;)I

    move-result p0

    return p0
.end method

.method public bridge compareTo(Lkotlin/time/ComparableTimeMark;)I
    .registers 2

    .line 67
    check-cast p0, Lkotlin/time/ComparableTimeMark;

    invoke-static {p0, p1}, Lkotlin/time/ComparableTimeMark$DefaultImpls;->compareTo(Lkotlin/time/ComparableTimeMark;Lkotlin/time/ComparableTimeMark;)I

    move-result p0

    return p0
.end method

.method public elapsedNow-UwyO8pc()J
    .registers 3

    .line 82
    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->elapsedNow-UwyO8pc(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->equals-impl(JLjava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hasNotPassedNow()Z
    .registers 3

    .line 86
    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->hasNotPassedNow-impl(J)Z

    move-result p0

    return p0
.end method

.method public hasPassedNow()Z
    .registers 3

    .line 85
    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->hasPassedNow-impl(J)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .registers 3

    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->hashCode-impl(J)I

    move-result p0

    return p0
.end method

.method public minus-LRDsOJo(J)J
    .registers 5

    .line 84
    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-LRDsOJo(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public bridge synthetic minus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;
    .registers 3

    .line 67
    invoke-virtual {p0, p1, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-LRDsOJo(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic minus-LRDsOJo(J)Lkotlin/time/TimeMark;
    .registers 3

    .line 67
    invoke-virtual {p0, p1, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-LRDsOJo(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object p0

    return-object p0
.end method

.method public minus-UwyO8pc(Lkotlin/time/ComparableTimeMark;)J
    .registers 4

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->minus-UwyO8pc(JLkotlin/time/ComparableTimeMark;)J

    move-result-wide p0

    return-wide p0
.end method

.method public plus-LRDsOJo(J)J
    .registers 5

    .line 83
    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1, p1, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->plus-LRDsOJo(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public bridge synthetic plus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;
    .registers 3

    .line 67
    invoke-virtual {p0, p1, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->plus-LRDsOJo(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic plus-LRDsOJo(J)Lkotlin/time/TimeMark;
    .registers 3

    .line 67
    invoke-virtual {p0, p1, p2}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->plus-LRDsOJo(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    invoke-static {v0, v1}, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->toString-impl(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final synthetic unbox-impl()J
    .registers 3

    iget-wide v0, p0, Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;->reading:J

    return-wide v0
.end method
