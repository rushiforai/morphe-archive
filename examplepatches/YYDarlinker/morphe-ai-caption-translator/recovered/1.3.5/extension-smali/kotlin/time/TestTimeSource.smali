.class public final Lkotlin/time/TestTimeSource;
.super Lkotlin/time/AbstractLongTimeSource;
.source "TimeSources.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTimeSources.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TimeSources.kt\nkotlin/time/TestTimeSource\n+ 2 longSaturatedMath.kt\nkotlin/time/LongSaturatedMathKt\n*L\n1#1,210:1\n80#2:211\n80#2:212\n*S KotlinDebug\n*F\n+ 1 TimeSources.kt\nkotlin/time/TestTimeSource\n*L\n184#1:211\n191#1:212\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\t\u0008F\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\n\u0010\u0006\u001a\u00020\u0005H\u0094\u0080\u0004J\u0019\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0086\u0082\u0004\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0019\u0010\r\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0082\u0080\u0004\u00a2\u0006\u0004\u0008\u000e\u0010\u000cR\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00ca\u0001\u000c\u0008\u0010\u0012\u0008\u0008\u0011\u0012\u0004\u0008\u0008(\u0012\u00ca\u0001\u0010\u0008\u0013\u0012\u000c\u0008\u0014\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\u0015\u00a8\u0006\u000f"
    }
    d2 = {
        "Lkotlin/time/TestTimeSource;",
        "Lkotlin/time/AbstractLongTimeSource;",
        "<init>",
        "()V",
        "reading",
        "",
        "read",
        "plusAssign",
        "",
        "duration",
        "Lkotlin/time/Duration;",
        "plusAssign-LRDsOJo",
        "(J)V",
        "overflow",
        "overflow-LRDsOJo",
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
.field private reading:J


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 164
    sget-object v0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    .line 162
    invoke-direct {p0, v0}, Lkotlin/time/AbstractLongTimeSource;-><init>(Lkotlin/time/DurationUnit;)V

    .line 168
    invoke-virtual {p0}, Lkotlin/time/TestTimeSource;->markNow()Lkotlin/time/ComparableTimeMark;

    return-void
.end method

.method private final overflow-LRDsOJo(J)V
    .registers 7

    .line 207
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "TestTimeSource will overflow if its reading "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lkotlin/time/TestTimeSource;->reading:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lkotlin/time/TestTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object p0

    invoke-static {p0}, Lkotlin/time/DurationUnitKt;->shortName(Lkotlin/time/DurationUnit;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " is advanced by "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Lkotlin/time/Duration;->toString-impl(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2e

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final plusAssign-LRDsOJo(J)V
    .registers 11

    .line 183
    invoke-virtual {p0}, Lkotlin/time/TestTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lkotlin/time/Duration;->toLong-impl(JLkotlin/time/DurationUnit;)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    sub-long v4, v0, v2

    or-long/2addr v4, v2

    const-wide v6, 0x7fffffffffffffffL

    cmp-long v4, v4, v6

    if-nez v4, :cond_3e

    const/4 v0, 0x2

    .line 190
    invoke-static {p1, p2, v0}, Lkotlin/time/Duration;->div-UwyO8pc(JI)J

    move-result-wide v0

    .line 191
    invoke-virtual {p0}, Lkotlin/time/TestTimeSource;->getUnit()Lkotlin/time/DurationUnit;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lkotlin/time/Duration;->toLong-impl(JLkotlin/time/DurationUnit;)J

    move-result-wide v4

    sub-long/2addr v4, v2

    or-long/2addr v2, v4

    cmp-long v2, v2, v6

    if-nez v2, :cond_2d

    .line 201
    invoke-direct {p0, p1, p2}, Lkotlin/time/TestTimeSource;->overflow-LRDsOJo(J)V

    return-void

    .line 192
    :cond_2d
    iget-wide v2, p0, Lkotlin/time/TestTimeSource;->reading:J

    .line 194
    :try_start_2f
    invoke-virtual {p0, v0, v1}, Lkotlin/time/TestTimeSource;->plusAssign-LRDsOJo(J)V

    .line 195
    invoke-static {p1, p2, v0, v1}, Lkotlin/time/Duration;->minus-LRDsOJo(JJ)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lkotlin/time/TestTimeSource;->plusAssign-LRDsOJo(J)V
    :try_end_39
    .catch Ljava/lang/IllegalStateException; {:try_start_2f .. :try_end_39} :catch_3a

    return-void

    :catch_3a
    move-exception p1

    .line 197
    iput-wide v2, p0, Lkotlin/time/TestTimeSource;->reading:J

    .line 198
    throw p1

    .line 186
    :cond_3e
    iget-wide v2, p0, Lkotlin/time/TestTimeSource;->reading:J

    add-long v4, v2, v0

    xor-long/2addr v0, v2

    const-wide/16 v6, 0x0

    cmp-long v0, v0, v6

    if-ltz v0, :cond_52

    xor-long v0, v2, v4

    cmp-long v0, v0, v6

    if-gez v0, :cond_52

    .line 187
    invoke-direct {p0, p1, p2}, Lkotlin/time/TestTimeSource;->overflow-LRDsOJo(J)V

    .line 188
    :cond_52
    iput-wide v4, p0, Lkotlin/time/TestTimeSource;->reading:J

    return-void
.end method

.method protected read()J
    .registers 3

    .line 171
    iget-wide v0, p0, Lkotlin/time/TestTimeSource;->reading:J

    return-wide v0
.end method
