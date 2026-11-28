.class public abstract Lnicoid/network238/kotlin/time/DurationKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final synthetic access$durationOf(JI)J
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lnicoid/network238/kotlin/time/DurationKt;->durationOf(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfMillis(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfMillisNormalized(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillisNormalized(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfNanos(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfNanosNormalized(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanosNormalized(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$millisToNanos(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$nanosToMillis(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->nanosToMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOf(JI)J
    .registers 5

    const/4 v0, 0x1

    shl-long/2addr p0, v0

    int-to-long v0, p2

    add-long/2addr p0, v0

    .line 1050
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfMillis(J)J
    .registers 4

    const/4 v0, 0x1

    shl-long/2addr p0, v0

    const-wide/16 v0, 0x1

    add-long/2addr p0, v0

    .line 1049
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfMillisNormalized(J)J
    .registers 8

    const-wide v0, -0x431bde82d7aL

    cmp-long v0, v0, p0

    if-gtz v0, :cond_0

    const-wide v0, 0x431bde82d7bL

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    .line 1060
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    :cond_0
    nop

    .line 1062
    const-wide v2, -0x3fffffffffffffffL    # -2.0000000000000004

    const-wide v4, 0x3fffffffffffffffL    # 1.9999999999999998

    move-wide v0, p0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(JJJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfNanos(J)J
    .registers 3

    const/4 v0, 0x1

    shl-long/2addr p0, v0

    .line 1048
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->constructor-impl(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfNanosNormalized(J)J
    .registers 4

    const-wide v0, -0x3ffffffffffa14bfL    # -2.0000000001722644

    cmp-long v0, v0, p0

    if-gtz v0, :cond_0

    const-wide v0, 0x3ffffffffffa14c0L    # 1.999999999913868

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    .line 1053
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 1055
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->nanosToMillis(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final millisToNanos(J)J
    .registers 4

    const-wide/32 v0, 0xf4240

    mul-long/2addr p0, v0

    return-wide p0
.end method

.method private static final nanosToMillis(J)J
    .registers 4

    .line 1045
    const-wide/32 v0, 0xf4240

    div-long/2addr p0, v0

    return-wide p0
.end method

.method public static final toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 850
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-virtual {p1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gtz v0, :cond_0

    int-to-long v0, p0

    .line 851
    sget-object p0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {v0, v1, p1, p0}, Lnicoid/network238/kotlin/time/DurationUnitKt__DurationUnitJvmKt;->convertDurationUnitOverflow(JLnicoid/network238/kotlin/time/DurationUnit;Lnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    :cond_0
    int-to-long v0, p0

    .line 853
    invoke-static {v0, v1, p1}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final toDuration(JLnicoid/network238/kotlin/time/DurationUnit;)J
    .registers 10

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 860
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const-wide v1, 0x3ffffffffffa14bfL    # 1.9999999999138678

    invoke-static {v1, v2, v0, p2}, Lnicoid/network238/kotlin/time/DurationUnitKt__DurationUnitJvmKt;->convertDurationUnitOverflow(JLnicoid/network238/kotlin/time/DurationUnit;Lnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v1

    neg-long v3, v1

    cmp-long v3, v3, p0

    if-gtz v3, :cond_0

    cmp-long v1, p0, v1

    if-gtz v1, :cond_0

    .line 862
    invoke-static {p0, p1, p2, v0}, Lnicoid/network238/kotlin/time/DurationUnitKt__DurationUnitJvmKt;->convertDurationUnitOverflow(JLnicoid/network238/kotlin/time/DurationUnit;Lnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 864
    :cond_0
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p0, p1, p2, v0}, Lnicoid/network238/kotlin/time/DurationUnitKt__DurationUnitJvmKt;->convertDurationUnit(JLnicoid/network238/kotlin/time/DurationUnit;Lnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v1

    .line 865
    const-wide v3, -0x3fffffffffffffffL    # -2.0000000000000004

    const-wide v5, 0x3fffffffffffffffL    # 1.9999999999999998

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(JJJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method
