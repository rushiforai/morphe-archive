.class public final Lnicoid/network238/kotlin/time/MonotonicTimeSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/time/MonotonicTimeSource;

.field private static final zero:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;

    invoke-direct {v0}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->INSTANCE:Lnicoid/network238/kotlin/time/MonotonicTimeSource;

    .line 12
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sput-wide v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->zero:J

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final read()J
    .registers 5

    .line 13
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sget-wide v2, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->zero:J

    sub-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public final adjustReading-6QKq23U(JJ)J
    .registers 6

    .line 24
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p1, p2, v0, p3, p4}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->saturatingAdd-NuflL3o(JLnicoid/network238/kotlin/time/DurationUnit;J)J

    move-result-wide p1

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->constructor-impl(J)J

    move-result-wide p1

    return-wide p1
.end method

.method public final differenceBetween-fRLX17w(JJ)J
    .registers 6

    .line 21
    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->NANOSECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    invoke-static {p1, p2, p3, p4, v0}, Lnicoid/network238/kotlin/time/LongSaturatedMathKt;->saturatingOriginsDiff(JJLnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide p1

    return-wide p1
.end method

.method public bridge synthetic markNow()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 3

    .line 10
    invoke-virtual {p0}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->markNow-z9LOYto()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object v0

    return-object v0
.end method

.method public markNow-z9LOYto()J
    .registers 3

    .line 16
    invoke-direct {p0}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->read()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->constructor-impl(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 14
    const-string v0, "TimeSource(System.nanoTime())"

    return-object v0
.end method
