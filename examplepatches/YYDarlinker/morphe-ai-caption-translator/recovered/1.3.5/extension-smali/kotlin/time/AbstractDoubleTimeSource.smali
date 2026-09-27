.class public abstract Lkotlin/time/AbstractDoubleTimeSource;
.super Ljava/lang/Object;
.source "TimeSources.kt"

# interfaces
.implements Lkotlin/time/TimeSource$WithComparableMarks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;
    }
.end annotation

.annotation runtime Lkotlin/Deprecated;
    level = .enum Lkotlin/DeprecationLevel;->ERROR:Lkotlin/DeprecationLevel;
    message = "Using AbstractDoubleTimeSource is no longer recommended, use AbstractLongTimeSource instead."
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\'\u0018\u00002\u00020\u0001:\u0001\u000cB\u0011\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\n\u0010\u0008\u001a\u00020\tH\u00a4\u0080\u0004J\n\u0010\n\u001a\u00020\u000bH\u0096\u0080\u0004R\u0015\u0010\u0002\u001a\u00020\u0003X\u0084\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00ca\u0001\u000c\u0008\u000e\u0012\u0008\u0008\u000f\u0012\u0004\u0008\u0008(\u0010\u00ca\u0001\u0002\u0008\u0011\u00ca\u0001\u0018\u0008\u0012\u0012\u0008\u0008\u0013\u0012\u0004\u0008\u0008(\u0014\u0012\n\u0008\u0015\u0012\u0006\u0008\n0\u00168\u0017\u00a8\u0006\r"
    }
    d2 = {
        "Lkotlin/time/AbstractDoubleTimeSource;",
        "Lkotlin/time/TimeSource$WithComparableMarks;",
        "unit",
        "Lkotlin/time/DurationUnit;",
        "<init>",
        "(Lkotlin/time/DurationUnit;)V",
        "getUnit",
        "()Lkotlin/time/DurationUnit;",
        "read",
        "",
        "markNow",
        "Lkotlin/time/ComparableTimeMark;",
        "DoubleTimeMark",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "Lkotlin/time/ExperimentalTime;",
        "Lkotlin/Deprecated;",
        "message",
        "Using AbstractDoubleTimeSource is no longer recommended, use AbstractLongTimeSource instead.",
        "level",
        "Lkotlin/DeprecationLevel;",
        "ERROR"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final unit:Lkotlin/time/DurationUnit;


# direct methods
.method public constructor <init>(Lkotlin/time/DurationUnit;)V
    .registers 3

    const-string v0, "unit"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lkotlin/time/AbstractDoubleTimeSource;->unit:Lkotlin/time/DurationUnit;

    return-void
.end method


# virtual methods
.method protected final getUnit()Lkotlin/time/DurationUnit;
    .registers 1

    .line 101
    iget-object p0, p0, Lkotlin/time/AbstractDoubleTimeSource;->unit:Lkotlin/time/DurationUnit;

    return-object p0
.end method

.method public markNow()Lkotlin/time/ComparableTimeMark;
    .registers 8

    .line 139
    new-instance v0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;

    invoke-virtual {p0}, Lkotlin/time/AbstractDoubleTimeSource;->read()D

    move-result-wide v1

    sget-object v3, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v3}, Lkotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;-><init>(DLkotlin/time/AbstractDoubleTimeSource;JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v0, Lkotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public bridge synthetic markNow()Lkotlin/time/TimeMark;
    .registers 1

    .line 95
    invoke-virtual {p0}, Lkotlin/time/AbstractDoubleTimeSource;->markNow()Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method

.method protected abstract read()D
.end method
