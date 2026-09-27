.class final Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;
.super Ljava/lang/Object;
.source "TimeSources.kt"

# interfaces
.implements Lkotlin/time/ComparableTimeMark;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/time/AbstractDoubleTimeSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DoubleTimeMark"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0011\n\u0002\u0010\u000b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B!\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0011\u0010\r\u001a\u00020\u0007H\u0096\u0080\u0004\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0019\u0010\u0010\u001a\u00020\u00012\u0006\u0010\u0011\u001a\u00020\u0007H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0019\u0010\u0014\u001a\u00020\u00072\u0006\u0010\u0015\u001a\u00020\u0001H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0014\u0010\u0018\u001a\u00020\u00192\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u001aH\u0096\u0082\u0004J\n\u0010\u001b\u001a\u00020\u001cH\u0096\u0080\u0004J\n\u0010\u001d\u001a\u00020\u001eH\u0096\u0080\u0004R\u000f\u0010\u0002\u001a\u00020\u0003X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0004\u001a\u00020\u0005X\u0082\u0084\u0008\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\n\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0007X\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u000c\u00a8\u0006\u001f"
    }
    d2 = {
        "Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;",
        "Lkotlin/time/ComparableTimeMark;",
        "startedAt",
        "",
        "timeSource",
        "Lkotlin/time/AbstractDoubleTimeSource;",
        "offset",
        "Lkotlin/time/Duration;",
        "<init>",
        "(DLkotlin/time/AbstractDoubleTimeSource;JLkotlin/jvm/internal/DefaultConstructorMarker;)V",
        "getTimeSource$annotations",
        "()V",
        "J",
        "elapsedNow",
        "elapsedNow-UwyO8pc",
        "()J",
        "plus",
        "duration",
        "plus-LRDsOJo",
        "(J)Lkotlin/time/ComparableTimeMark;",
        "minus",
        "other",
        "minus-UwyO8pc",
        "(Lkotlin/time/ComparableTimeMark;)J",
        "equals",
        "",
        "",
        "hashCode",
        "",
        "toString",
        "",
        "kotlin-stdlib"
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
.field private final offset:J

.field private final startedAt:D

.field private final timeSource:Lkotlin/time/AbstractDoubleTimeSource;


# direct methods
.method private constructor <init>(DLkotlin/time/AbstractDoubleTimeSource;J)V
    .registers 7

    const-string v0, "timeSource"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-wide p1, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    .line 111
    iput-object p3, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    .line 113
    iput-wide p4, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    return-void
.end method

.method public synthetic constructor <init>(DLkotlin/time/AbstractDoubleTimeSource;JLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 7

    invoke-direct/range {p0 .. p5}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;-><init>(DLkotlin/time/AbstractDoubleTimeSource;J)V

    return-void
.end method

.method private static synthetic getTimeSource$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 109
    check-cast p1, Lkotlin/time/ComparableTimeMark;

    invoke-virtual {p0, p1}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->compareTo(Lkotlin/time/ComparableTimeMark;)I

    move-result p0

    return p0
.end method

.method public bridge compareTo(Lkotlin/time/ComparableTimeMark;)I
    .registers 2

    .line 109
    invoke-static {p0, p1}, Lkotlin/time/ComparableTimeMark$DefaultImpls;->compareTo(Lkotlin/time/ComparableTimeMark;Lkotlin/time/ComparableTimeMark;)I

    move-result p0

    return p0
.end method

.method public elapsedNow-UwyO8pc()J
    .registers 5

    .line 115
    iget-object v0, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-virtual {v0}, Lkotlin/time/AbstractDoubleTimeSource;->read()D

    move-result-wide v0

    iget-wide v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    sub-double/2addr v0, v2

    iget-object v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-virtual {v2}, Lkotlin/time/AbstractDoubleTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide v0

    iget-wide v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v0, v1, v2, v3}, Lkotlin/time/Duration;->minus-LRDsOJo(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 129
    instance-of v0, p1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    move-object v1, p1

    check-cast v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;

    iget-object v1, v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    check-cast p1, Lkotlin/time/ComparableTimeMark;

    invoke-virtual {p0, p1}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->minus-UwyO8pc(Lkotlin/time/ComparableTimeMark;)J

    move-result-wide p0

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result p0

    if-eqz p0, :cond_25

    const/4 p0, 0x1

    return p0

    :cond_25
    const/4 p0, 0x0

    return p0
.end method

.method public bridge hasNotPassedNow()Z
    .registers 1

    .line 109
    invoke-static {p0}, Lkotlin/time/ComparableTimeMark$DefaultImpls;->hasNotPassedNow(Lkotlin/time/ComparableTimeMark;)Z

    move-result p0

    return p0
.end method

.method public bridge hasPassedNow()Z
    .registers 1

    .line 109
    invoke-static {p0}, Lkotlin/time/ComparableTimeMark$DefaultImpls;->hasPassedNow(Lkotlin/time/ComparableTimeMark;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .registers 5

    .line 133
    iget-wide v0, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    iget-object v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-virtual {v2}, Lkotlin/time/AbstractDoubleTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide v0

    iget-wide v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v0, v1, v2, v3}, Lkotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Lkotlin/time/Duration;->hashCode-impl(J)I

    move-result p0

    return p0
.end method

.method public bridge minus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;
    .registers 3

    .line 109
    invoke-static {p0, p1, p2}, Lkotlin/time/ComparableTimeMark$DefaultImpls;->minus-LRDsOJo(Lkotlin/time/ComparableTimeMark;J)Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic minus-LRDsOJo(J)Lkotlin/time/TimeMark;
    .registers 3

    .line 109
    invoke-virtual {p0, p1, p2}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->minus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method

.method public minus-UwyO8pc(Lkotlin/time/ComparableTimeMark;)J
    .registers 8

    const-string v0, "other"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 119
    instance-of v0, p1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    move-object v1, p1

    check-cast v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;

    iget-object v2, v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 122
    iget-wide v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    iget-wide v4, v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v2, v3, v4, v5}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result p1

    if-eqz p1, :cond_2f

    iget-wide v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v2, v3}, Lkotlin/time/Duration;->isInfinite-impl(J)Z

    move-result p1

    if-eqz p1, :cond_2f

    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide p0

    return-wide p0

    .line 123
    :cond_2f
    iget-wide v2, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    iget-wide v4, v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v2, v3, v4, v5}, Lkotlin/time/Duration;->minus-LRDsOJo(JJ)J

    move-result-wide v2

    .line 124
    iget-wide v4, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    iget-wide v0, v1, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    sub-double/2addr v4, v0

    iget-object p0, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-virtual {p0}, Lkotlin/time/AbstractDoubleTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object p0

    invoke-static {v4, v5, p0}, Lkotlin/time/DurationKt;->toDuration(DLkotlin/time/DurationUnit;)J

    move-result-wide p0

    .line 125
    invoke-static {v2, v3}, Lkotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result v0

    if-eqz v0, :cond_57

    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getZERO-UwyO8pc()J

    move-result-wide p0

    return-wide p0

    :cond_57
    invoke-static {p0, p1, v2, v3}, Lkotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide p0

    return-wide p0

    .line 120
    :cond_5c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Subtracting or comparing time marks from different time sources is not possible: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " and "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public plus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;
    .registers 10

    .line 116
    new-instance v0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;

    iget-wide v1, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    iget-object v3, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    iget-wide v4, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v4, v5, p1, p2}, Lkotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide v4

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;-><init>(DLkotlin/time/AbstractDoubleTimeSource;JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v0, Lkotlin/time/ComparableTimeMark;

    return-object v0
.end method

.method public bridge synthetic plus-LRDsOJo(J)Lkotlin/time/TimeMark;
    .registers 3

    .line 109
    invoke-virtual {p0, p1, p2}, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->plus-LRDsOJo(J)Lkotlin/time/ComparableTimeMark;

    move-result-object p0

    check-cast p0, Lkotlin/time/TimeMark;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DoubleTimeMark("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->startedAt:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-virtual {v1}, Lkotlin/time/AbstractDoubleTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object v1

    invoke-static {v1}, Lkotlin/time/DurationUnitKt;->shortName(Lkotlin/time/DurationUnit;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " + "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->offset:J

    invoke-static {v1, v2}, Lkotlin/time/Duration;->toString-impl(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lkotlin/time/AbstractDoubleTimeSource$DoubleTimeMark;->timeSource:Lkotlin/time/AbstractDoubleTimeSource;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
