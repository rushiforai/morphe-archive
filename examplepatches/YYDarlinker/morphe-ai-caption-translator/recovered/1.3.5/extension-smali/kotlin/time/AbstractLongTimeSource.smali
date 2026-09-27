.class public abstract Lkotlin/time/AbstractLongTimeSource;
.super Ljava/lang/Object;
.source "TimeSources.kt"

# interfaces
.implements Lkotlin/time/TimeSource$WithComparableMarks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/AbstractLongTimeSource$LongTimeMark;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\'\u0018\u00002\u00020\u0001:\u0001\u0012B\u0011\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\n\u0010\u0008\u001a\u00020\tH\u00a4\u0080\u0004J\n\u0010\u000f\u001a\u00020\tH\u0082\u0080\u0004J\n\u0010\u0010\u001a\u00020\u0011H\u0096\u0080\u0004R\u0015\u0010\u0002\u001a\u00020\u0003X\u0084\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u001b\u0010\n\u001a\u00020\t8BX\u0082\u0084\n\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000b\u0010\u000c\u00ca\u0001\u000c\u0008\u0014\u0012\u0008\u0008\u0015\u0012\u0004\u0008\u0008(\u0016\u00ca\u0001\u0010\u0008\u0017\u0012\u000c\u0008\u0018\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0019\u00a8\u0006\u0013"
    }
    d2 = {
        "Lkotlin/time/AbstractLongTimeSource;",
        "Lkotlin/time/TimeSource$WithComparableMarks;",
        "unit",
        "Lkotlin/time/DurationUnit;",
        "<init>",
        "(Lkotlin/time/DurationUnit;)V",
        "getUnit",
        "()Lkotlin/time/DurationUnit;",
        "read",
        "",
        "zero",
        "getZero",
        "()J",
        "zero$delegate",
        "Lkotlin/Lazy;",
        "adjustedRead",
        "markNow",
        "Lkotlin/time/ComparableTimeMark;",
        "LongTimeMark",
        "kotlin-stdlib",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.9",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/time/ExperimentalTime;"
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

.field private final zero$delegate:Lkotlin/Lazy;


# direct methods
.method public constructor <init>(Lkotlin/time/DurationUnit;)V
    .registers 3

    const-string v0, "unit"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lkotlin/time/AbstractLongTimeSource;->unit:Lkotlin/time/DurationUnit;

    .line 40
    new-instance p1, Lkotlin/time/AbstractLongTimeSource$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lkotlin/time/AbstractLongTimeSource$$ExternalSyntheticLambda0;-><init>(Lkotlin/time/AbstractLongTimeSource;)V

    invoke-static {p1}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lkotlin/time/AbstractLongTimeSource;->zero$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public static final synthetic access$adjustedRead(Lkotlin/time/AbstractLongTimeSource;)J
    .registers 3

    .line 26
    invoke-direct {p0}, Lkotlin/time/AbstractLongTimeSource;->adjustedRead()J

    move-result-wide v0

    return-wide v0
.end method

.method private final adjustedRead()J
    .registers 5

    .line 41
    invoke-virtual {p0}, Lkotlin/time/AbstractLongTimeSource;->read()J

    move-result-wide v0

    invoke-direct {p0}, Lkotlin/time/AbstractLongTimeSource;->getZero()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method private final getZero()J
    .registers 3

    .line 40
    iget-object p0, p0, Lkotlin/time/AbstractLongTimeSource;->zero$delegate:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method static final zero_delegate$lambda$0(Lkotlin/time/AbstractLongTimeSource;)J
    .registers 3

    .line 40
    invoke-virtual {p0}, Lkotlin/time/AbstractLongTimeSource;->read()J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method protected final getUnit()Lkotlin/time/DurationUnit;
    .registers 1

    .line 28
    iget-object p0, p0, Lkotlin/time/AbstractLongTimeSource;->unit:Lkotlin/time/DurationUnit;

    return-object p0
.end method

.method public markNow()Lkotlin/time/ComparableTimeMark;
    .registers 8

    .line 87
    new-instance v0, Lkotlin/time/AbstractLongTimeSource$LongTimeMark;

    invoke-direct {p0}, Lkotlin/time/AbstractLongTimeSource;->adjustedRead()J

    move-result-wide v1

    sget-object v3, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v3}, Lkotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lkotlin/time/AbstractLongTimeSource$LongTimeMark;-><init>(JLkotlin/time/AbstractLongTimeSource;JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v0, Lkotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public bridge synthetic markNow()Lkotlin/time/TimeMark;
    .registers 1

    .line 26
    invoke-virtual {p0}, Lkotlin/time/AbstractLongTimeSource;->markNow()Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method

.method protected abstract read()J
.end method
