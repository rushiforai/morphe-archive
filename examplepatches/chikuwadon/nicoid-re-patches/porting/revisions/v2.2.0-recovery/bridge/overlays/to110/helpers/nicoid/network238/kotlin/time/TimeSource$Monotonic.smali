.class public final Lnicoid/network238/kotlin/time/TimeSource$Monotonic;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/time/TimeSource$WithComparableMarks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/time/TimeSource$Monotonic;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic;

    invoke-direct {v0}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/time/TimeSource$Monotonic;->INSTANCE:Lnicoid/network238/kotlin/time/TimeSource$Monotonic;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic markNow()Lnicoid/network238/kotlin/time/ComparableTimeMark;
    .registers 3

    .line 47
    invoke-virtual {p0}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic;->markNow-z9LOYto()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;->box-impl(J)Lnicoid/network238/kotlin/time/TimeSource$Monotonic$ValueTimeMark;

    move-result-object v0

    return-object v0
.end method

.method public markNow-z9LOYto()J
    .registers 3

    .line 48
    sget-object v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->INSTANCE:Lnicoid/network238/kotlin/time/MonotonicTimeSource;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->markNow-z9LOYto()J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 49
    sget-object v0, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->INSTANCE:Lnicoid/network238/kotlin/time/MonotonicTimeSource;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/time/MonotonicTimeSource;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
