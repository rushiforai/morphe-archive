.class public final Lnicoid/network238/kotlin/time/Duration;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/time/Duration$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

.field private static final INFINITE:J

.field private static final NEG_INFINITE:J

.field private static final ZERO:J


# instance fields
.field private final rawValue:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/time/Duration$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/time/Duration$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    .line 56
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/Duration;->constructor-impl(J)J

    move-result-wide v0

    sput-wide v0, Lnicoid/network238/kotlin/time/Duration;->ZERO:J

    .line 59
    const-wide v0, 0x3fffffffffffffffL    # 1.9999999999999998

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillis(J)J

    move-result-wide v0

    sput-wide v0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    .line 60
    const-wide v0, -0x3fffffffffffffffL    # -2.0000000000000004

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillis(J)J

    move-result-wide v0

    sput-wide v0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    return-void
.end method

.method private synthetic constructor <init>(J)V
    .registers 3

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lnicoid/network238/kotlin/time/Duration;->rawValue:J

    return-void
.end method

.method public static final synthetic access$getINFINITE$cp()J
    .registers 2

    .line 32
    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    return-wide v0
.end method

.method public static final synthetic access$getNEG_INFINITE$cp()J
    .registers 2

    .line 32
    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    return-wide v0
.end method

.method public static final synthetic access$getZERO$cp()J
    .registers 2

    .line 32
    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->ZERO:J

    return-wide v0
.end method

.method private static final addValuesMixedRanges-UwyO8pc(JJJ)J
    .registers 12

    .line 312
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->nanosToMillis(J)J
    invoke-static {p4, p5}, Lnicoid/network238/kotlin/time/DurationKt;->access$nanosToMillis(J)J

    move-result-wide p0

    add-long v0, p2, p0

    const-wide p2, -0x431bde82d7aL

    cmp-long p2, p2, v0

    if-gtz p2, :cond_0

    const-wide p2, 0x431bde82d7bL

    cmp-long p2, v0, p2

    if-gez p2, :cond_0

    .line 315
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide p0

    sub-long/2addr p4, p0

    .line 316
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide p0

    add-long/2addr p0, p4

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    :cond_0
    nop

    .line 318
    const-wide v2, -0x3fffffffffffffffL    # -2.0000000000000004

    const-wide v4, 0x3fffffffffffffffL    # 1.9999999999999998

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(JJJ)J

    move-result-wide p0

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final appendFractional-impl(JLjava/lang/StringBuilder;IIILjava/lang/String;Z)V
    .registers 9

    .line 766
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_3

    .line 768
    const/16 p0, 0x2e

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 769
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x30

    invoke-static {p0, p5, p1}, Lnicoid/network238/kotlin/text/StringsKt;->padStart(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    .line 1075
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p3

    const/4 p4, -0x1

    add-int/2addr p3, p4

    if-ltz p3, :cond_1

    :goto_0
    add-int/lit8 p5, p3, -0x1

    .line 1076
    invoke-interface {p0, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    if-eq v0, p1, :cond_0

    move p4, p3

    goto :goto_1

    :cond_0
    if-ltz p5, :cond_1

    move p3, p5

    goto :goto_0

    :cond_1
    nop

    :goto_1
    add-int/lit8 p1, p4, 0x1

    const/4 p3, 0x0

    const/4 p5, 0x3

    if-nez p7, :cond_2

    if-ge p1, p5, :cond_2

    .line 772
    invoke-virtual {p2, p0, p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_2
    add-int/2addr p4, p5

    .line 773
    div-int/2addr p4, p5

    mul-int/2addr p4, p5

    invoke-virtual {p2, p0, p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 776
    :cond_3
    :goto_2
    invoke-virtual {p2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static final synthetic box-impl(J)Lnicoid/network238/kotlin/time/Duration;
    .registers 3

    new-instance v0, Lnicoid/network238/kotlin/time/Duration;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/time/Duration;-><init>(J)V

    return-object v0
.end method

.method public static compareTo-LRDsOJo(JJ)I
    .registers 8

    xor-long v0, p0, p2

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    long-to-int v0, v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    long-to-int v0, p0

    and-int/lit8 v0, v0, 0x1

    long-to-int p2, p2

    and-int/lit8 p2, p2, 0x1

    sub-int/2addr v0, p2

    .line 480
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isNegative-impl(J)Z

    move-result p0

    if-eqz p0, :cond_0

    neg-int p0, v0

    return p0

    :cond_0
    return v0

    .line 477
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(JJ)I

    move-result p0

    return p0
.end method

.method public static constructor-impl(J)J
    .registers 6

    .line 44
    invoke-static {}, Lnicoid/network238/kotlin/time/DurationJvmKt;->getDurationAssertionsEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 45
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInNanos-impl(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 46
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    const-wide v2, -0x3ffffffffffa14bfL    # -2.0000000001722644

    cmp-long v2, v2, v0

    if-gtz v2, :cond_0

    const-wide v2, 0x3ffffffffffa14c0L    # 1.999999999913868

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " ns is out of nanoseconds range"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 48
    :cond_1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    const-wide v2, -0x3fffffffffffffffL    # -2.0000000000000004

    cmp-long v2, v2, v0

    if-gtz v2, :cond_2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 49
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    const-wide v2, -0x431bde82d7aL

    cmp-long v2, v2, v0

    if-gtz v2, :cond_3

    const-wide v2, 0x431bde82d7bL

    cmp-long v0, v0, v2

    if-gez v0, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " ms is denormalized"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 48
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " ms is out of milliseconds range"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_3
    :goto_0
    return-wide p0
.end method

.method public static final div-UwyO8pc(JI)J
    .registers 9

    if-nez p2, :cond_2

    .line 404
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isPositive-impl(J)Z

    move-result p2

    if-eqz p2, :cond_0

    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    return-wide p0

    .line 405
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isNegative-impl(J)Z

    move-result p0

    if-eqz p0, :cond_1

    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    return-wide p0

    .line 406
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Dividing zero duration by zero yields an undefined result."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 409
    :cond_2
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInNanos-impl(J)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 410
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    int-to-long v0, p2

    div-long/2addr p0, v0

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 412
    :cond_3
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 413
    invoke-static {p2}, Lnicoid/network238/kotlin/math/MathKt;->getSign(I)I

    move-result p2

    invoke-static {p0, p1, p2}, Lnicoid/network238/kotlin/time/Duration;->times-UwyO8pc(JI)J

    move-result-wide p0

    return-wide p0

    .line 415
    :cond_4
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    int-to-long v2, p2

    div-long/2addr v0, v2

    const-wide v4, -0x431bde82d7aL

    cmp-long p2, v4, v0

    if-gtz p2, :cond_5

    const-wide v4, 0x431bde82d7bL

    cmp-long p2, v0, v4

    if-gez p2, :cond_5

    .line 418
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    mul-long v4, v0, v2

    sub-long/2addr p0, v4

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide p0

    div-long/2addr p0, v2

    .line 419
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide v0

    add-long/2addr v0, p0

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 421
    :cond_5
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static equals-impl(JLjava/lang/Object;)Z
    .registers 5

    instance-of v0, p2, Lnicoid/network238/kotlin/time/Duration;

    if-eqz v0, :cond_0

    check-cast p2, Lnicoid/network238/kotlin/time/Duration;

    invoke-virtual {p2}, Lnicoid/network238/kotlin/time/Duration;->unbox-impl()J

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

.method public static final getAbsoluteValue-UwyO8pc(J)J
    .registers 3

    .line 472
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isNegative-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p0

    :cond_0
    return-wide p0
.end method

.method public static final getHoursComponent-impl(J)I
    .registers 4

    .line 554
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getInWholeHours-impl(J)J

    move-result-wide p0

    const-wide/16 v0, 0x18

    rem-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method public static final getInWholeDays-impl(J)J
    .registers 3

    .line 629
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->DAYS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p0, p1, v0}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getInWholeHours-impl(J)J
    .registers 3

    .line 637
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->HOURS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p0, p1, v0}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getInWholeMilliseconds-impl(J)J
    .registers 3

    .line 662
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInMillis-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isFinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    return-wide p0

    :cond_0
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p0, p1, v0}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getInWholeMinutes-impl(J)J
    .registers 3

    .line 645
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->MINUTES:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p0, p1, v0}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getInWholeNanoseconds-impl(J)J
    .registers 4

    .line 688
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    .line 690
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInNanos-impl(J)Z

    move-result p0

    if-eqz p0, :cond_0

    return-wide v0

    :cond_0
    const-wide p0, 0x8637bd05af6L

    cmp-long p0, v0, p0

    if-lez p0, :cond_1

    const-wide p0, 0x7fffffffffffffffL

    return-wide p0

    :cond_1
    const-wide p0, -0x8637bd05af6L

    cmp-long p0, v0, p0

    if-gez p0, :cond_2

    const-wide/high16 p0, -0x8000000000000000L

    return-wide p0

    .line 693
    :cond_2
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getInWholeSeconds-impl(J)J
    .registers 3

    .line 653
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p0, p1, v0}, Lnicoid/network238/kotlin/time/Duration;->toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getMinutesComponent-impl(J)I
    .registers 4

    .line 558
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getInWholeMinutes-impl(J)J

    move-result-wide p0

    const-wide/16 v0, 0x3c

    rem-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method public static final getNanosecondsComponent-impl(J)I
    .registers 4

    .line 567
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 568
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInMillis-impl(J)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    const-wide/16 v0, 0x3e8

    rem-long/2addr p0, v0

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide p0

    long-to-int p0, p0

    return p0

    .line 569
    :cond_1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p0

    const-wide/32 v0, 0x3b9aca00

    rem-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method public static final getSecondsComponent-impl(J)I
    .registers 4

    .line 562
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getInWholeSeconds-impl(J)J

    move-result-wide p0

    const-wide/16 v0, 0x3c

    rem-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method private static final getStorageUnit-impl(J)Lnicoid/network238/kotlin/time/DurationUnit;
    .registers 2

    .line 41
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInNanos-impl(J)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    return-object p0

    :cond_0
    sget-object p0, Lnicoid/network238/kotlin/time/DurationUnit;->MILLISECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    return-object p0
.end method

.method private static final getValue-impl(J)J
    .registers 3

    const/4 v0, 0x1

    shr-long/2addr p0, v0

    return-wide p0
.end method

.method public static hashCode-impl(J)I
    .registers 2

    invoke-static {p0, p1}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    return p0
.end method

.method public static final isFinite-impl(J)Z
    .registers 2

    .line 469
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private static final isInMillis-impl(J)Z
    .registers 2

    long-to-int p0, p0

    const/4 p1, 0x1

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_0

    return p1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static final isInNanos-impl(J)Z
    .registers 2

    long-to-int p0, p0

    const/4 p1, 0x1

    and-int/2addr p0, p1

    if-nez p0, :cond_0

    return p1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final isInfinite-impl(J)Z
    .registers 4

    .line 466
    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    cmp-long v0, p0, v0

    if-eqz v0, :cond_0

    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    cmp-long p0, p0, v0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public static final isNegative-impl(J)Z
    .registers 4

    const-wide/16 v0, 0x0

    cmp-long p0, p0, v0

    if-gez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final isPositive-impl(J)Z
    .registers 4

    const-wide/16 v0, 0x0

    cmp-long p0, p0, v0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final minus-LRDsOJo(JJ)J
    .registers 4

    .line 328
    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p2

    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/kotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final plus-LRDsOJo(JJ)J
    .registers 11

    .line 285
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 286
    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->isFinite-impl(J)Z

    move-result v0

    if-nez v0, :cond_0

    xor-long/2addr p2, p0

    const-wide/16 v0, 0x0

    cmp-long p2, p2, v0

    if-gez p2, :cond_0

    .line 289
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Summing infinite durations of different signs yields an undefined result."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_0
    return-wide p0

    .line 291
    :cond_1
    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_2

    return-wide p2

    :cond_2
    long-to-int v0, p0

    and-int/lit8 v0, v0, 0x1

    long-to-int v1, p2

    and-int/lit8 v1, v1, 0x1

    if-ne v0, v1, :cond_4

    .line 296
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide p2

    add-long/2addr v0, p2

    .line 298
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInNanos-impl(J)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 299
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanosNormalized(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfNanosNormalized(J)J

    move-result-wide p0

    return-wide p0

    .line 301
    :cond_3
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillisNormalized(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillisNormalized(J)J

    move-result-wide p0

    return-wide p0

    .line 304
    :cond_4
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInMillis-impl(J)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 305
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v3

    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v5

    move-wide v1, p0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/kotlin/time/Duration;->addValuesMixedRanges-UwyO8pc(JJJ)J

    move-result-wide p0

    return-wide p0

    .line 307
    :cond_5
    move-wide v0, p0

    invoke-static {p2, p3}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v2

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v4

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/time/Duration;->addValuesMixedRanges-UwyO8pc(JJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final times-UwyO8pc(JI)J
    .registers 15

    .line 337
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInfinite-impl(J)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_1

    if-lez p2, :cond_0

    return-wide p0

    .line 341
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p0

    return-wide p0

    .line 339
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Multiplying infinite duration by zero yields an undefined result."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    if-nez p2, :cond_3

    .line 344
    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->ZERO:J

    return-wide p0

    .line 346
    :cond_3
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    int-to-long v2, p2

    mul-long v4, v0, v2

    .line 348
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isInNanos-impl(J)Z

    move-result p0

    const-wide v6, 0x3fffffffffffffffL    # 1.9999999999999998

    const-wide v8, -0x3fffffffffffffffL    # -2.0000000000000004

    if-eqz p0, :cond_8

    const-wide/32 p0, -0x7fffffff

    cmp-long p0, p0, v0

    if-gtz p0, :cond_4

    const-wide p0, 0x80000000L

    cmp-long p0, v0, p0

    if-gez p0, :cond_4

    .line 351
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanos(J)J
    invoke-static {v4, v5}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 353
    :cond_4
    div-long p0, v4, v2

    cmp-long p0, p0, v0

    if-nez p0, :cond_5

    .line 354
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfNanosNormalized(J)J
    invoke-static {v4, v5}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfNanosNormalized(J)J

    move-result-wide p0

    return-wide p0

    .line 356
    :cond_5
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->nanosToMillis(J)J
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/DurationKt;->access$nanosToMillis(J)J

    move-result-wide p0

    .line 357
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->millisToNanos(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$millisToNanos(J)J

    move-result-wide v4

    sub-long v4, v0, v4

    mul-long v10, p0, v2

    mul-long/2addr v4, v2

    .line 359
    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->nanosToMillis(J)J
    invoke-static {v4, v5}, Lnicoid/network238/kotlin/time/DurationKt;->access$nanosToMillis(J)J

    move-result-wide v4

    add-long/2addr v4, v10

    .line 360
    div-long v2, v10, v2

    cmp-long p0, v2, p0

    if-nez p0, :cond_6

    xor-long/2addr v10, v4

    const-wide/16 p0, 0x0

    cmp-long p0, v10, p0

    if-ltz p0, :cond_6

    .line 361
    new-instance p0, Lnicoid/network238/kotlin/ranges/LongRange;

    invoke-direct {p0, v8, v9, v6, v7}, Lnicoid/network238/kotlin/ranges/LongRange;-><init>(JJ)V

    invoke-static {v4, v5, p0}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(JLnicoid/network238/kotlin/ranges/ClosedRange;)J

    move-result-wide p0

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillis(J)J

    move-result-wide p0

    return-wide p0

    .line 363
    :cond_6
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/math/MathKt;->getSign(J)I

    move-result p0

    invoke-static {p2}, Lnicoid/network238/kotlin/math/MathKt;->getSign(I)I

    move-result p1

    mul-int/2addr p0, p1

    if-lez p0, :cond_7

    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    return-wide p0

    :cond_7
    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    return-wide p0

    .line 368
    :cond_8
    div-long p0, v4, v2

    cmp-long p0, p0, v0

    if-nez p0, :cond_9

    .line 369
    new-instance p0, Lnicoid/network238/kotlin/ranges/LongRange;

    invoke-direct {p0, v8, v9, v6, v7}, Lnicoid/network238/kotlin/ranges/LongRange;-><init>(JJ)V

    invoke-static {v4, v5, p0}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(JLnicoid/network238/kotlin/ranges/ClosedRange;)J

    move-result-wide p0

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOfMillis(J)J
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOfMillis(J)J

    move-result-wide p0

    return-wide p0

    .line 371
    :cond_9
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/math/MathKt;->getSign(J)I

    move-result p0

    invoke-static {p2}, Lnicoid/network238/kotlin/math/MathKt;->getSign(I)I

    move-result p1

    mul-int/2addr p0, p1

    if-lez p0, :cond_a

    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    return-wide p0

    :cond_a
    sget-wide p0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    return-wide p0
.end method

.method public static final toLong-impl(JLnicoid/network238/kotlin/time/DurationUnit;)J
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 604
    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    cmp-long v0, p0, v0

    if-nez v0, :cond_0

    const-wide p0, 0x7fffffffffffffffL

    return-wide p0

    .line 605
    :cond_0
    sget-wide v0, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    cmp-long v0, p0, v0

    if-nez v0, :cond_1

    const-wide/high16 p0, -0x8000000000000000L

    return-wide p0

    .line 606
    :cond_1
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getStorageUnit-impl(J)Lnicoid/network238/kotlin/time/DurationUnit;

    move-result-object p0

    invoke-static {v0, v1, p0, p2}, Lnicoid/network238/kotlin/time/DurationUnitKt__DurationUnitJvmKt;->convertDurationUnit(JLnicoid/network238/kotlin/time/DurationUnit;Lnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static toString-impl(J)Ljava/lang/String;
    .registers 16

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    .line 763
    const-string p0, "0s"

    return-object p0

    .line 722
    :cond_0
    sget-wide v2, Lnicoid/network238/kotlin/time/Duration;->INFINITE:J

    cmp-long v2, p0, v2

    if-nez v2, :cond_1

    .line 763
    const-string p0, "Infinity"

    return-object p0

    .line 723
    :cond_1
    sget-wide v2, Lnicoid/network238/kotlin/time/Duration;->NEG_INFINITE:J

    cmp-long v2, p0, v2

    if-nez v2, :cond_2

    .line 763
    const-string p0, "-Infinity"

    return-object p0

    .line 725
    :cond_2
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->isNegative-impl(J)Z

    move-result v2

    .line 726
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v2, :cond_3

    .line 727
    const/16 v3, 0x2d

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 728
    :cond_3
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getAbsoluteValue-UwyO8pc(J)J

    move-result-wide v3

    .line 1074
    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->getInWholeDays-impl(J)J

    move-result-wide v6

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->getHoursComponent-impl(J)I

    move-result v8

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->getMinutesComponent-impl(J)I

    move-result v9

    move-wide v10, v6

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->getSecondsComponent-impl(J)I

    move-result v6

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/time/Duration;->getNanosecondsComponent-impl(J)I

    move-result v7

    cmp-long v0, v10, v0

    const/4 v1, 0x0

    const/4 v12, 0x1

    if-eqz v0, :cond_4

    move v0, v12

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    if-eqz v8, :cond_5

    move v3, v12

    goto :goto_1

    :cond_5
    move v3, v1

    :goto_1
    if-eqz v9, :cond_6

    move v4, v12

    goto :goto_2

    :cond_6
    move v4, v1

    :goto_2
    if-nez v6, :cond_7

    if-nez v7, :cond_7

    move v13, v1

    goto :goto_3

    :cond_7
    move v13, v12

    :goto_3
    if-eqz v0, :cond_8

    .line 735
    invoke-virtual {v5, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v10, 0x64

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v1, v12

    :cond_8
    const/16 v10, 0x20

    if-nez v3, :cond_a

    if-eqz v0, :cond_9

    if-nez v4, :cond_a

    if-nez v13, :cond_a

    :cond_9
    goto :goto_4

    :cond_a
    add-int/lit8 v11, v1, 0x1

    if-lez v1, :cond_b

    .line 739
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 740
    :cond_b
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v8, 0x68

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v1, v11

    :goto_4
    if-nez v4, :cond_d

    if-eqz v13, :cond_c

    if-nez v3, :cond_d

    if-nez v0, :cond_d

    :cond_c
    goto :goto_5

    :cond_d
    add-int/lit8 v8, v1, 0x1

    if-lez v1, :cond_e

    .line 743
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 744
    :cond_e
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v9, 0x6d

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v1, v8

    :goto_5
    if-eqz v13, :cond_14

    add-int/lit8 v11, v1, 0x1

    if-lez v1, :cond_f

    .line 747
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_f
    if-nez v6, :cond_13

    if-nez v0, :cond_13

    if-nez v3, :cond_13

    if-eqz v4, :cond_10

    move-wide v3, p0

    goto :goto_6

    :cond_10
    const v0, 0xf4240

    if-lt v7, v0, :cond_11

    .line 752
    div-int v6, v7, v0

    rem-int/2addr v7, v0

    const-string v9, "ms"

    const/4 v10, 0x0

    const/4 v8, 0x6

    move-wide v3, p0

    invoke-static/range {v3 .. v10}, Lnicoid/network238/kotlin/time/Duration;->appendFractional-impl(JLjava/lang/StringBuilder;IIILjava/lang/String;Z)V

    goto :goto_7

    :cond_11
    move-wide v3, p0

    const/16 p0, 0x3e8

    if-lt v7, p0, :cond_12

    .line 754
    div-int/lit16 v6, v7, 0x3e8

    rem-int/2addr v7, p0

    const-string v9, "us"

    const/4 v10, 0x0

    const/4 v8, 0x3

    invoke-static/range {v3 .. v10}, Lnicoid/network238/kotlin/time/Duration;->appendFractional-impl(JLjava/lang/StringBuilder;IIILjava/lang/String;Z)V

    goto :goto_7

    .line 756
    :cond_12
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "ns"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 747
    :cond_13
    move-wide v3, p0

    .line 756
    :goto_6
    nop

    .line 750
    const-string v9, "s"

    const/4 v10, 0x0

    const/16 v8, 0x9

    invoke-static/range {v3 .. v10}, Lnicoid/network238/kotlin/time/Duration;->appendFractional-impl(JLjava/lang/StringBuilder;IIILjava/lang/String;Z)V

    :goto_7
    move v1, v11

    :cond_14
    if-eqz v2, :cond_15

    if-le v1, v12, :cond_15

    .line 759
    const/16 p0, 0x28

    invoke-virtual {v5, v12, p0}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 p1, 0x29

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 726
    :cond_15
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final unaryMinus-UwyO8pc(J)J
    .registers 4

    .line 275
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/time/Duration;->getValue-impl(J)J

    move-result-wide v0

    neg-long v0, v0

    long-to-int p0, p0

    and-int/lit8 p0, p0, 0x1

    # invokes: Lnicoid/network238/kotlin/time/DurationKt;->durationOf(JI)J
    invoke-static {v0, v1, p0}, Lnicoid/network238/kotlin/time/DurationKt;->access$durationOf(JI)J

    move-result-wide p0

    return-wide p0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 4

    .line 32
    check-cast p1, Lnicoid/network238/kotlin/time/Duration;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/time/Duration;->unbox-impl()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(J)I

    move-result p1

    return p1
.end method

.method public compareTo-LRDsOJo(J)I
    .registers 5

    .line 474
    iget-wide v0, p0, Lnicoid/network238/kotlin/time/Duration;->rawValue:J

    invoke-static {v0, v1, p1, p2}, Lnicoid/network238/kotlin/time/Duration;->compareTo-LRDsOJo(JJ)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/Duration;->rawValue:J

    invoke-static {v0, v1, p1}, Lnicoid/network238/kotlin/time/Duration;->equals-impl(JLjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .registers 3

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/Duration;->rawValue:J

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/Duration;->hashCode-impl(J)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 720
    iget-wide v0, p0, Lnicoid/network238/kotlin/time/Duration;->rawValue:J

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/Duration;->toString-impl(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final synthetic unbox-impl()J
    .registers 3

    iget-wide v0, p0, Lnicoid/network238/kotlin/time/Duration;->rawValue:J

    return-wide v0
.end method
