.class public abstract Lnicoid/network238/kotlin/time/LongSaturatedMathKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static final checkInfiniteSumDefined-PjuGub4(JJJ)J
    .registers 6

    .line 29
    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result p2

    if-eqz p2, :cond_0

    xor-long/2addr p4, p0

    const-wide/16 p2, 0x0

    cmp-long p2, p4, p2

    if-gez p2, :cond_0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Summing infinities of different signs"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_0
    return-wide p0
.end method

.method private static final infinityOfSign(J)J
    .registers 4

    const-wide/16 v0, 0x0

    cmp-long p0, p0, v0

    if-gez p0, :cond_0

    .line 43
    sget-object p0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/time/Duration$Companion;->getNEG_INFINITE-UwyO8pc$kotlin_stdlib()J

    move-result-wide p0

    return-wide p0

    :cond_0
    sget-object p0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/time/Duration$Companion;->getINFINITE-UwyO8pc()J

    move-result-wide p0

    return-wide p0
.end method

.method public static final saturatingAdd-NuflL3o(JLnicoid/network238/kotlin/time/DurationUnit;J)J
    .registers 13

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    invoke-static {p3, p4, p2}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v4

    const-wide/16 v0, 0x1

    sub-long v2, p0, v0

    or-long/2addr v2, v0

    const-wide v6, 0x7fffffffffffffffL

    cmp-long v2, v2, v6

    if-nez v2, :cond_0

    .line 15
    move-wide v0, p0

    move-wide v2, p3

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->checkInfiniteSumDefined-PjuGub4(JJJ)J

    move-result-wide p0

    return-wide p0

    :cond_0
    move-wide v2, p3

    sub-long p3, v4, v0

    or-long/2addr p3, v0

    cmp-long p3, p3, v6

    if-nez p3, :cond_1

    .line 18
    invoke-static {p0, p1, p2, v2, v3}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->saturatingAddInHalves-NuflL3o(JLnicoid/network238/kotlin/time/DurationUnit;J)J

    move-result-wide p0

    return-wide p0

    :cond_1
    add-long p2, p0, v4

    xor-long v0, p0, p2

    xor-long/2addr v4, p2

    and-long/2addr v0, v4

    const-wide/16 v2, 0x0

    cmp-long p4, v0, v2

    if-gez p4, :cond_3

    cmp-long p0, p0, v2

    if-gez p0, :cond_2

    const-wide/high16 p0, -0x8000000000000000L

    return-wide p0

    :cond_2
    return-wide v6

    :cond_3
    return-wide p2
.end method

.method private static final saturatingAddInHalves-NuflL3o(JLnicoid/network238/kotlin/time/DurationUnit;J)J
    .registers 13

    .line 34
    const/4 v0, 0x2

    invoke-static {p3, p4, v0}, Lnicoid/network238/kotlin/time/Duration;->div-UwyO8pc(JI)J

    move-result-wide v0

    .line 35
    invoke-static {v0, v1, p2}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v2

    const-wide/16 v4, 0x1

    sub-long v6, v2, v4

    or-long/2addr v6, v4

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v4, v6, v4

    if-nez v4, :cond_0

    return-wide v2

    .line 39
    :cond_0
    invoke-static {p0, p1, p2, v0, v1}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->saturatingAdd-NuflL3o(JLnicoid/network238/kotlin/time/DurationUnit;J)J

    move-result-wide p0

    invoke-static {p3, p4, v0, v1}, Lnicoid/network238/kotlin/time/Duration;->minus-LRDsOJo(JJ)J

    move-result-wide p3

    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->saturatingAdd-NuflL3o(JLnicoid/network238/kotlin/time/DurationUnit;J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final saturatingFiniteDiff(JJLnicoid/network238/kotlin/time/DurationUnit;)J
    .registers 12

    sub-long v0, p0, p2

    xor-long v2, v0, p0

    xor-long v4, v0, p2

    not-long v4, v4

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 66
    sget-object v2, Lnicoid/network238/kotlin/time/DurationUnit;->MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-virtual {p4, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gez v3, :cond_0

    .line 67
    const-wide/16 v0, 0x1

    invoke-static {v0, v1, v2, p4}, Lnicoid/network238/kotlin/time/DurationUnitKt__DurationUnitJvmKt;->convertDurationUnit(JLnicoid/network238/kotlin/time/DurationUnit;Lnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v0

    .line 68
    div-long v3, p0, v0

    div-long v5, p2, v0

    sub-long/2addr v3, v5

    .line 69
    rem-long/2addr p0, v0

    rem-long/2addr p2, v0

    sub-long/2addr p0, p2

    .line 70
    sget-object p2, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    invoke-static {v3, v4, v2}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p2

    invoke-static {p0, p1, p4}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    invoke-static {p2, p3, p0, p1}, Lnicoid/network238/kotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide p0

    return-wide p0

    .line 72
    :cond_0
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->infinityOfSign(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p0

    return-wide p0

    .line 75
    :cond_1
    invoke-static {v0, v1, p4}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final saturatingOriginsDiff(JJLnicoid/network238/kotlin/time/DurationUnit;)J
    .registers 11

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x1

    sub-long v2, p2, v0

    or-long/2addr v2, v0

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    cmp-long p0, p0, p2

    if-nez p0, :cond_0

    .line 54
    sget-object p0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide p0

    return-wide p0

    .line 55
    :cond_0
    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->infinityOfSign(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p0

    return-wide p0

    :cond_1
    sub-long v2, p0, v0

    or-long/2addr v2, v0

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    .line 58
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->infinityOfSign(J)J

    move-result-wide p0

    return-wide p0

    .line 60
    :cond_2
    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->saturatingFiniteDiff(JJLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method
