.class public final Lkotlin/time/DurationKt;
.super Ljava/lang/Object;
.source "Duration.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/DurationKt$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDuration.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Duration.kt\nkotlin/time/DurationKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 Duration.kt\nkotlin/time/LongParser\n+ 4 Strings.kt\nkotlin/text/StringsKt__StringsKt\n+ 5 Duration.kt\nkotlin/time/FractionalParser\n*L\n1#1,1629:1\n1#2:1630\n1300#3,12:1631\n1312#3,15:1646\n1300#3,12:1690\n1312#3,15:1705\n1665#4,3:1643\n1665#4,3:1684\n1665#4,3:1687\n1665#4,3:1702\n1665#4,3:1743\n1358#5,23:1661\n1358#5,23:1720\n*S KotlinDebug\n*F\n+ 1 Duration.kt\nkotlin/time/DurationKt\n*L\n1116#1:1631,12\n1116#1:1646,15\n1195#1:1690,12\n1195#1:1705,15\n1116#1:1643,3\n1125#1:1684,3\n1190#1:1687,3\n1195#1:1702,3\n1207#1:1743,3\n1125#1:1661,23\n1207#1:1720,23\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0017\n\u0002\u0018\u0002\n\u0002\u0008-\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0087\u0080\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u00a2\u0006\u0002\u0010\u0005\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\t2\u0006\u0010\u0003\u001a\u00020\u0004H\u0087\u0080\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u00a2\u0006\u0002\u0010\n\u001a)\u0010\u0000\u001a\u00020\u0001*\u00020\u000b2\u0006\u0010\u0003\u001a\u00020\u0004H\u0087\u0080\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u00a2\u0006\u0002\u0010\u000c\u001a/\u0010\r\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u000e\u001a\u00020\u0001H\u0087\u008a\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008b\u0002\u0008\u0011\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u001a/\u0010\r\u001a\u00020\u0001*\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u0001H\u0087\u008a\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008b\u0002\u0008\u0011\u00a2\u0006\u0004\u0008\u0012\u0010\u0013\u001a)\u0010\u0014\u001a\u00020\u00012\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u0018H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010\u001a\u001a\'\u0010\u001b\u001a\u00020\u00012\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u001c\u001a\u00020\u00022\u0006\u0010\u0019\u001a\u00020\u0018H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010\u001d\u001a/\u0010\u001e\u001a\u00020\u00012\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u001c\u001a\u00020\u00022\u0006\u0010\u001f\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0018H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010 \u001a\u0016\u0010!\u001a\u00020\t*\u00020\t2\u0006\u0010\"\u001a\u00020\tH\u0082\u0080\u0004\u001a\u0012\u0010#\u001a\u00020\u0018*\u00020\tH\u0083\u0088\u0004b\u0002\u0008\u0011\u001a\u0012\u0010$\u001a\u00020\u0018*\u00020\tH\u0083\u0088\u0004b\u0002\u0008\u0011\u001a\u001e\u0010%\u001a\u00020\u00182\u0006\u0010&\u001a\u00020\t2\u0006\u0010\'\u001a\u00020\tH\u0083\u0088\u0004b\u0002\u0008\u0011\u001a&\u0010(\u001a\u00020\t*\u00020\u00162\u0006\u0010\u001c\u001a\u00020\u00022\u0006\u0010)\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0082\u0080\u0004\u001a\u0016\u0010*\u001a\u00020\t*\u00020\t2\u0006\u0010\u0003\u001a\u00020\u0004H\u0082\u0080\u0004\u001a%\u0010+\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u00182\u0008\u0008\u0002\u0010,\u001a\u00020\u0016H\u0083\u0088\u0004b\u0002\u0008\u0011\u00a2\u0006\u0002\u0010-\u001a\'\u0010.\u001a\u0004\u0018\u00010\u0001*\u00020\u00012\u000e\u0010/\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000100H\u0082\u0088\u0004\u00a2\u0006\u0004\u00081\u00102\u001a\u0018\u00103\u001a\u0004\u0018\u00010\u0004*\u00020\u00162\u0006\u00104\u001a\u00020\u0002H\u0082\u0080\u0004\u001a\u0018\u00105\u001a\u0004\u0018\u00010\u0004*\u00020\u00162\u0006\u00104\u001a\u00020\u0002H\u0082\u0080\u0004\u001a\u0012\u0010A\u001a\u00020\t*\u00020\tH\u0083\u0088\u0004b\u0002\u0008\u0011\u001a\u0012\u0010A\u001a\u00020\u0002*\u00020\u0002H\u0083\u0088\u0004b\u0002\u0008\u0011\u001a\u0012\u0010N\u001a\u00020\t2\u0006\u0010O\u001a\u00020\tH\u0082\u0080\u0004\u001a\u0012\u0010P\u001a\u00020\t2\u0006\u0010Q\u001a\u00020\tH\u0082\u0080\u0004\u001a\u0017\u0010R\u001a\u00020\u00012\u0006\u0010S\u001a\u00020\tH\u0082\u0080\u0004\u00a2\u0006\u0002\u0010T\u001a\u0017\u0010U\u001a\u00020\u00012\u0006\u0010V\u001a\u00020\tH\u0082\u0080\u0004\u00a2\u0006\u0002\u0010T\u001a\u001f\u0010W\u001a\u00020\u00012\u0006\u0010X\u001a\u00020\t2\u0006\u0010Y\u001a\u00020\u0002H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010Z\u001a\u0017\u0010[\u001a\u00020\u00012\u0006\u0010O\u001a\u00020\tH\u0082\u0080\u0004\u00a2\u0006\u0002\u0010T\u001a\u0017\u0010\\\u001a\u00020\u00012\u0006\u0010Q\u001a\u00020\tH\u0082\u0080\u0004\u00a2\u0006\u0002\u0010T\"\u001f\u00106\u001a\u00020\u000b*\u00020\u00048BX\u0082\u0084\u0008\u00a2\u0006\u000c\u0012\u0004\u00087\u00108\u001a\u0004\u00089\u0010:\"\u0019\u0010;\u001a\u00020\t*\u00020\u00048BX\u0082\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008<\u0010=\"\u0019\u0010>\u001a\u00020\u0002*\u00020\u00048BX\u0082\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008?\u0010@\"\u000f\u0010B\u001a\u00020\u0002X\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010C\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010D\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010E\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010F\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010G\u001a\u00020\tX\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010H\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010I\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010J\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010K\u001a\u00020\tX\u0080\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010L\u001a\u00020\u0016X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000\"\u000f\u0010M\u001a\u00020\u0002X\u0082\u00d4\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006]"
    }
    d2 = {
        "toDuration",
        "Lkotlin/time/Duration;",
        "",
        "unit",
        "Lkotlin/time/DurationUnit;",
        "(ILkotlin/time/DurationUnit;)J",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.6",
        "",
        "(JLkotlin/time/DurationUnit;)J",
        "",
        "(DLkotlin/time/DurationUnit;)J",
        "times",
        "duration",
        "times-mvk6XK0",
        "(IJ)J",
        "Lkotlin/internal/InlineOnly;",
        "times-kIfJnKk",
        "(DJ)J",
        "parseDuration",
        "value",
        "",
        "strictIso",
        "",
        "throwException",
        "(Ljava/lang/String;ZZ)J",
        "parseIsoStringFormat",
        "startIndex",
        "(Ljava/lang/String;IZ)J",
        "parseDefaultStringFormat",
        "hasSign",
        "(Ljava/lang/String;IZZ)J",
        "addMillisWithoutOverflow",
        "other",
        "isInfiniteMillis",
        "isFiniteMillis",
        "sameSign",
        "a",
        "b",
        "parseFractionFallback",
        "endIndex",
        "fractionDigitsToNanos",
        "handleError",
        "message",
        "(ZLjava/lang/String;)J",
        "onInvalid",
        "block",
        "Lkotlin/Function0;",
        "onInvalid-ge6A_vg",
        "(JLkotlin/jvm/functions/Function0;)Lkotlin/time/Duration;",
        "defaultDurationUnitByShortNameOrNull",
        "start",
        "isoDurationUnitByShortNameOrNull",
        "fractionMultiplier",
        "getFractionMultiplier$annotations",
        "(Lkotlin/time/DurationUnit;)V",
        "getFractionMultiplier",
        "(Lkotlin/time/DurationUnit;)D",
        "fallbackFractionMultiplier",
        "getFallbackFractionMultiplier",
        "(Lkotlin/time/DurationUnit;)J",
        "shortNameLength",
        "getShortNameLength",
        "(Lkotlin/time/DurationUnit;)I",
        "multiplyBy10",
        "NANOS_IN_MILLIS",
        "MICROS_IN_MILLIS",
        "NANOS_IN_MICROS",
        "MAX_NANOS",
        "MAX_MILLIS",
        "MAX_NANOS_IN_MILLIS",
        "MILLIS_IN_SECOND",
        "MILLIS_IN_MINUTE",
        "MILLIS_IN_HOUR",
        "MILLIS_IN_DAY",
        "INFINITY_STRING",
        "FRACTION_LIMIT",
        "nanosToMillis",
        "nanos",
        "millisToNanos",
        "millis",
        "durationOfNanos",
        "normalNanos",
        "(J)J",
        "durationOfMillis",
        "normalMillis",
        "durationOf",
        "normalValue",
        "unitDiscriminator",
        "(JI)J",
        "durationOfNanosNormalized",
        "durationOfMillisNormalized",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final FRACTION_LIMIT:I = 0xf

.field private static final INFINITY_STRING:Ljava/lang/String; = "Infinity"

.field public static final MAX_MILLIS:J = 0x3fffffffffffffffL

.field public static final MAX_NANOS:J = 0x3ffffffffffa14bfL

.field private static final MAX_NANOS_IN_MILLIS:J = 0x431bde82d7aL

.field public static final MICROS_IN_MILLIS:J = 0x3e8L

.field public static final MILLIS_IN_DAY:J = 0x5265c00L

.field public static final MILLIS_IN_HOUR:J = 0x36ee80L

.field public static final MILLIS_IN_MINUTE:J = 0xea60L

.field public static final MILLIS_IN_SECOND:J = 0x3e8L

.field public static final NANOS_IN_MICROS:J = 0x3e8L

.field public static final NANOS_IN_MILLIS:I = 0xf4240


# direct methods
.method public static final synthetic access$addMillisWithoutOverflow(JJ)J
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lkotlin/time/DurationKt;->addMillisWithoutOverflow(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOf(JI)J
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lkotlin/time/DurationKt;->durationOf(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfMillis(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfMillisNormalized(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfMillisNormalized(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfNanos(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$durationOfNanosNormalized(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfNanosNormalized(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$millisToNanos(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->millisToNanos(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$nanosToMillis(J)J
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->nanosToMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$parseDuration(Ljava/lang/String;ZZ)J
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lkotlin/time/DurationKt;->parseDuration(Ljava/lang/String;ZZ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final addMillisWithoutOverflow(JJ)J
    .registers 11

    const-wide v0, 0x3fffffffffffffffL    # 1.9999999999999998

    cmp-long v2, p0, v0

    const-wide v3, -0x3fffffffffffffffL    # -2.0000000000000004

    if-eqz v2, :cond_2e

    cmp-long v2, p0, v3

    if-nez v2, :cond_13

    goto :goto_2e

    :cond_13
    cmp-long v0, p2, v0

    if-eqz v0, :cond_2d

    cmp-long v0, p2, v3

    if-nez v0, :cond_1c

    goto :goto_2d

    :cond_1c
    add-long v1, p0, p2

    const-wide v3, -0x3fffffffffffffffL    # -2.0000000000000004

    const-wide v5, 0x3fffffffffffffffL    # 1.9999999999999998

    .line 1395
    invoke-static/range {v1 .. v6}, Lkotlin/ranges/RangesKt;->coerceIn(JJJ)J

    move-result-wide p0

    return-wide p0

    :cond_2d
    :goto_2d
    return-wide p2

    :cond_2e
    :goto_2e
    cmp-long v2, v3, p2

    if-gez v2, :cond_37

    cmp-long v0, p2, v0

    if-gez v0, :cond_37

    return-wide p0

    :cond_37
    xor-long/2addr p2, p0

    const-wide/16 v0, 0x0

    cmp-long p2, p2, v0

    if-ltz p2, :cond_3f

    return-wide p0

    :cond_3f
    const-wide p0, 0x7fffffffffffc0deL

    return-wide p0
.end method

.method private static final defaultDurationUnitByShortNameOrNull(Ljava/lang/String;I)Lkotlin/time/DurationUnit;
    .registers 5

    .line 1478
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1479
    move-object v1, p0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result v1

    if-ge p1, v1, :cond_14

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    goto :goto_15

    :cond_14
    const/4 p0, 0x0

    :goto_15
    const/16 p1, 0x64

    if-eq v0, p1, :cond_49

    const/16 p1, 0x68

    if-eq v0, p1, :cond_46

    const/16 p1, 0x73

    if-eq v0, p1, :cond_43

    const/16 v1, 0x75

    const/4 v2, 0x0

    if-eq v0, v1, :cond_3d

    const/16 v1, 0x6d

    if-eq v0, v1, :cond_35

    const/16 v1, 0x6e

    if-eq v0, v1, :cond_2f

    return-object v2

    :cond_2f
    if-ne p0, p1, :cond_34

    .line 1487
    sget-object p0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    return-object p0

    :cond_34
    return-object v2

    :cond_35
    if-ne p0, p1, :cond_3a

    .line 1485
    sget-object p0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    return-object p0

    :cond_3a
    sget-object p0, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    return-object p0

    :cond_3d
    if-ne p0, p1, :cond_42

    .line 1486
    sget-object p0, Lkotlin/time/DurationUnit;->MICROSECONDS:Lkotlin/time/DurationUnit;

    return-object p0

    :cond_42
    return-object v2

    .line 1484
    :cond_43
    sget-object p0, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    return-object p0

    .line 1483
    :cond_46
    sget-object p0, Lkotlin/time/DurationUnit;->HOURS:Lkotlin/time/DurationUnit;

    return-object p0

    .line 1482
    :cond_49
    sget-object p0, Lkotlin/time/DurationUnit;->DAYS:Lkotlin/time/DurationUnit;

    return-object p0
.end method

.method private static final durationOf(JI)J
    .registers 6

    .line 1611
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    const/4 v1, 0x1

    shl-long/2addr p0, v1

    int-to-long v1, p2

    add-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Lkotlin/time/Duration$Companion;->fromRawValue-UwyO8pc$kotlin_stdlib(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfMillis(J)J
    .registers 5

    .line 1610
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    const/4 v1, 0x1

    shl-long/2addr p0, v1

    const-wide/16 v1, 0x1

    add-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Lkotlin/time/Duration$Companion;->fromRawValue-UwyO8pc$kotlin_stdlib(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfMillisNormalized(J)J
    .registers 8

    const-wide v0, -0x431bde82d7aL

    cmp-long v0, v0, p0

    if-gtz v0, :cond_1b

    const-wide v0, 0x431bde82d7bL

    cmp-long v0, p0, v0

    if-gez v0, :cond_1b

    .line 1621
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->millisToNanos(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    :cond_1b
    const-wide v2, -0x3fffffffffffffffL    # -2.0000000000000004

    const-wide v4, 0x3fffffffffffffffL    # 1.9999999999999998

    move-wide v0, p0

    .line 1623
    invoke-static/range {v0 .. v5}, Lkotlin/ranges/RangesKt;->coerceIn(JJJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfNanos(J)J
    .registers 4

    .line 1609
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    const/4 v1, 0x1

    shl-long/2addr p0, v1

    invoke-virtual {v0, p0, p1}, Lkotlin/time/Duration$Companion;->fromRawValue-UwyO8pc$kotlin_stdlib(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final durationOfNanosNormalized(J)J
    .registers 4

    const-wide v0, -0x3ffffffffffa14bfL    # -2.0000000001722644

    cmp-long v0, v0, p0

    if-gtz v0, :cond_17

    const-wide v0, 0x3ffffffffffa14c0L    # 1.999999999913868

    cmp-long v0, p0, v0

    if-gez v0, :cond_17

    .line 1614
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 1616
    :cond_17
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->nanosToMillis(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final fractionDigitsToNanos(JLkotlin/time/DurationUnit;)J
    .registers 5

    long-to-double p0, p0

    .line 1443
    invoke-static {p2}, Lkotlin/time/DurationKt;->getFractionMultiplier(Lkotlin/time/DurationUnit;)D

    move-result-wide v0

    mul-double/2addr p0, v0

    invoke-static {p0, p1}, Lkotlin/math/MathKt;->roundToLong(D)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final getFallbackFractionMultiplier(Lkotlin/time/DurationUnit;)J
    .registers 4

    .line 1543
    sget-object v0, Lkotlin/time/DurationKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lkotlin/time/DurationUnit;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_3a

    const/4 v1, 0x6

    if-eq v0, v1, :cond_34

    const/4 v1, 0x7

    if-ne v0, v1, :cond_17

    const-wide v0, 0x4e94914f0000L

    return-wide v0

    .line 1546
    :cond_17
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 1547
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid unit: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " for fallback fraction multiplier"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_34
    const-wide v0, 0x34630b8a000L

    return-wide v0

    :cond_3a
    const-wide v0, 0xdf8475800L

    return-wide v0
.end method

.method private static final getFractionMultiplier(Lkotlin/time/DurationUnit;)D
    .registers 4

    .line 1521
    sget-object v0, Lkotlin/time/DurationKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lkotlin/time/DurationUnit;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4e

    .line 1528
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 1529
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown unit: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_23
    const-wide v0, 0x3fb61e4f765fd8aeL    # 0.0864

    return-wide v0

    :pswitch_29
    const-wide v0, 0x3f6d7dbf487fcb92L    # 0.0036

    return-wide v0

    :pswitch_2f
    const-wide v0, 0x3f0f75104d551d69L    # 6.0E-5

    return-wide v0

    :pswitch_35
    const-wide v0, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    return-wide v0

    :pswitch_3b
    const-wide v0, 0x3e112e0be826d695L    # 1.0E-9

    return-wide v0

    :pswitch_41
    const-wide v0, 0x3cd203af9ee75616L    # 1.0E-15

    return-wide v0

    :pswitch_47
    const-wide v0, 0x3d719799812dea11L    # 1.0E-12

    return-wide v0

    nop

    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_47
        :pswitch_41
        :pswitch_3b
        :pswitch_35
        :pswitch_2f
        :pswitch_29
        :pswitch_23
    .end packed-switch
.end method

.method private static synthetic getFractionMultiplier$annotations(Lkotlin/time/DurationUnit;)V
    .registers 1

    return-void
.end method

.method private static final getShortNameLength(Lkotlin/time/DurationUnit;)I
    .registers 4

    .line 1555
    sget-object v0, Lkotlin/time/DurationKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lkotlin/time/DurationUnit;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p0, v1, :cond_12

    if-eq p0, v0, :cond_12

    const/4 v2, 0x3

    if-eq p0, v2, :cond_12

    return v1

    :cond_12
    return v0
.end method

.method private static final handleError(ZLjava/lang/String;)J
    .registers 2

    if-nez p0, :cond_9

    .line 1456
    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide p0

    return-wide p0

    .line 1455
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic handleError$default(ZLjava/lang/String;ILjava/lang/Object;)J
    .registers 4

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_6

    .line 1454
    const-string p1, ""

    :cond_6
    if-nez p0, :cond_f

    .line 1456
    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide p0

    return-wide p0

    .line 1455
    :cond_f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final isFiniteMillis(J)Z
    .registers 4

    const-wide v0, -0x3fffffffffffffffL    # -2.0000000000000004

    cmp-long v0, v0, p0

    if-gez v0, :cond_14

    const-wide v0, 0x3fffffffffffffffL    # 1.9999999999999998

    cmp-long p0, p0, v0

    if-gez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method private static final isInfiniteMillis(J)Z
    .registers 4

    const-wide v0, 0x3fffffffffffffffL    # 1.9999999999999998

    cmp-long v0, p0, v0

    if-eqz v0, :cond_15

    const-wide v0, -0x3fffffffffffffffL    # -2.0000000000000004

    cmp-long p0, p0, v0

    if-nez p0, :cond_13

    goto :goto_15

    :cond_13
    const/4 p0, 0x0

    return p0

    :cond_15
    :goto_15
    const/4 p0, 0x1

    return p0
.end method

.method private static final isoDurationUnitByShortNameOrNull(Ljava/lang/String;I)Lkotlin/time/DurationUnit;
    .registers 2

    .line 1501
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 p1, 0x44

    if-eq p0, p1, :cond_1f

    const/16 p1, 0x48

    if-eq p0, p1, :cond_1c

    const/16 p1, 0x4d

    if-eq p0, p1, :cond_19

    const/16 p1, 0x53

    if-eq p0, p1, :cond_16

    const/4 p0, 0x0

    return-object p0

    .line 1505
    :cond_16
    sget-object p0, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    return-object p0

    .line 1504
    :cond_19
    sget-object p0, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    return-object p0

    .line 1503
    :cond_1c
    sget-object p0, Lkotlin/time/DurationUnit;->HOURS:Lkotlin/time/DurationUnit;

    return-object p0

    .line 1502
    :cond_1f
    sget-object p0, Lkotlin/time/DurationUnit;->DAYS:Lkotlin/time/DurationUnit;

    return-object p0
.end method

.method private static final millisToNanos(J)J
    .registers 4

    const-wide/32 v0, 0xf4240

    mul-long/2addr p0, v0

    return-wide p0
.end method

.method private static final multiplyBy10(I)I
    .registers 2

    shl-int/lit8 v0, p0, 0x3

    shl-int/lit8 p0, p0, 0x1

    add-int/2addr v0, p0

    return v0
.end method

.method private static final multiplyBy10(J)J
    .registers 5

    const/4 v0, 0x3

    shl-long v0, p0, v0

    const/4 v2, 0x1

    shl-long/2addr p0, v2

    add-long/2addr v0, p0

    return-wide v0
.end method

.method private static final nanosToMillis(J)J
    .registers 4

    const-wide/32 v0, 0xf4240

    .line 1606
    div-long/2addr p0, v0

    return-wide p0
.end method

.method private static final onInvalid-ge6A_vg(JLkotlin/jvm/functions/Function0;)Lkotlin/time/Duration;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/time/Duration;",
            ">;)",
            "Lkotlin/time/Duration;"
        }
    .end annotation

    .line 1465
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlin/time/Duration;

    return-object p0

    :cond_13
    invoke-static {p0, p1}, Lkotlin/time/Duration;->box-impl(J)Lkotlin/time/Duration;

    move-result-object p0

    return-object p0
.end method

.method private static final parseDefaultStringFormat(Ljava/lang/String;IZZ)J
    .registers 29

    move-object/from16 v0, p0

    .line 1173
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    xor-int/lit8 v2, p2, 0x1

    if-eqz p2, :cond_35

    .line 1176
    invoke-virtual/range {p0 .. p1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x28

    if-ne v4, v5, :cond_35

    add-int/lit8 v4, v1, -0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_35

    add-int/lit8 v2, p1, 0x1

    add-int/lit8 v1, v1, -0x1

    if-ne v2, v1, :cond_33

    if-nez p3, :cond_2b

    .line 1180
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_2b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No components"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_33
    const/4 v4, 0x1

    goto :goto_38

    :cond_35
    move v4, v2

    move/from16 v2, p1

    :goto_38
    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x1

    :goto_3e
    if-ge v2, v1, :cond_28b

    if-nez v12, :cond_55

    if-eqz v4, :cond_55

    .line 1688
    :goto_44
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v2, v12, :cond_55

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v13, 0x20

    if-ne v12, v13, :cond_55

    add-int/lit8 v2, v2, 0x1

    goto :goto_44

    .line 1195
    :cond_55
    sget-object v12, Lkotlin/time/LongParser;->Companion:Lkotlin/time/LongParser$Companion;

    invoke-virtual {v12}, Lkotlin/time/LongParser$Companion;->getDefault()Lkotlin/time/LongParser;

    move-result-object v12

    .line 1692
    # getter for: Lkotlin/time/LongParser;->allowSign:Z
    invoke-static {v12}, Lkotlin/time/LongParser;->access$getAllowSign$p(Lkotlin/time/LongParser;)Z

    move-result v13

    if-eqz v13, :cond_71

    .line 1693
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x2b

    if-eq v13, v14, :cond_6e

    const/16 v14, 0x2d

    if-eq v13, v14, :cond_6e

    goto :goto_71

    :cond_6e
    add-int/lit8 v13, v2, 0x1

    goto :goto_72

    :cond_71
    :goto_71
    move v13, v2

    .line 1703
    :goto_72
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v15, 0x30

    if-ge v13, v14, :cond_83

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-ne v14, v15, :cond_83

    add-int/lit8 v13, v13, 0x1

    goto :goto_72

    :cond_83
    const-wide/16 v5, 0x0

    .line 1706
    :goto_85
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v16, 0x1

    const-string v3, ""

    const/16 v15, 0x3a

    if-ge v13, v14, :cond_ee

    .line 1707
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v14

    move/from16 v18, v4

    const/16 v4, 0x30

    if-gt v4, v14, :cond_f0

    if-ge v14, v15, :cond_f0

    add-int/lit8 v14, v14, -0x30

    .line 1710
    # getter for: Lkotlin/time/LongParser;->overflowThreshold:J
    invoke-static {v12}, Lkotlin/time/LongParser;->access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J

    move-result-wide v19

    cmp-long v4, v5, v19

    if-gtz v4, :cond_cc

    # getter for: Lkotlin/time/LongParser;->overflowThreshold:J
    invoke-static {v12}, Lkotlin/time/LongParser;->access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J

    move-result-wide v19

    cmp-long v4, v5, v19

    move-wide/from16 v19, v10

    if-nez v4, :cond_bb

    int-to-long v10, v14

    # getter for: Lkotlin/time/LongParser;->lastDigitMax:J
    invoke-static {v12}, Lkotlin/time/LongParser;->access$getLastDigitMax$p(Lkotlin/time/LongParser;)J

    move-result-wide v21

    cmp-long v4, v10, v21

    if-lez v4, :cond_bb

    goto :goto_cc

    :cond_bb
    const/4 v3, 0x3

    shl-long v3, v5, v3

    shl-long v5, v5, v16

    add-long/2addr v3, v5

    int-to-long v5, v14

    add-long/2addr v5, v3

    add-int/lit8 v13, v13, 0x1

    move/from16 v4, v18

    move-wide/from16 v10, v19

    const/16 v15, 0x30

    goto :goto_85

    .line 1703
    :cond_cc
    :goto_cc
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v13, v1, :cond_df

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v4, 0x30

    if-gt v4, v1, :cond_df

    if-ge v1, v15, :cond_df

    add-int/lit8 v13, v13, 0x1

    goto :goto_cc

    :cond_df
    if-nez p3, :cond_e8

    .line 1197
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_e8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_ee
    move/from16 v18, v4

    :cond_f0
    move-wide/from16 v19, v10

    if-eq v13, v2, :cond_27c

    if-eq v13, v1, :cond_27c

    .line 1201
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x2e

    if-ne v2, v4, :cond_101

    move/from16 v2, v16

    goto :goto_102

    :cond_101
    const/4 v2, 0x0

    :goto_102
    if-eqz v2, :cond_1af

    add-int/lit8 v4, v13, 0x1

    .line 1207
    sget-object v10, Lkotlin/time/FractionalParser;->INSTANCE:Lkotlin/time/FractionalParser;

    add-int/lit8 v10, v13, 0x7

    .line 1730
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    move v11, v4

    const/4 v14, 0x0

    :goto_114
    if-ge v11, v10, :cond_130

    .line 1733
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v12

    move/from16 v22, v2

    const/16 v2, 0x30

    if-gt v2, v12, :cond_132

    if-ge v12, v15, :cond_132

    shl-int/lit8 v2, v14, 0x3

    shl-int/lit8 v14, v14, 0x1

    add-int/2addr v2, v14

    add-int/lit8 v12, v12, -0x30

    add-int v14, v2, v12

    add-int/lit8 v11, v11, 0x1

    move/from16 v2, v22

    goto :goto_114

    :cond_130
    move/from16 v22, v2

    :cond_132
    sub-int v2, v11, v4

    rsub-int/lit8 v2, v2, 0x6

    const/4 v10, 0x0

    :goto_137
    if-ge v10, v2, :cond_141

    shl-int/lit8 v12, v14, 0x3

    shl-int/lit8 v14, v14, 0x1

    add-int/2addr v14, v12

    add-int/lit8 v10, v10, 0x1

    goto :goto_137

    :cond_141
    add-int/lit8 v2, v11, 0x9

    .line 1730
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    invoke-static {v2, v10}, Ljava/lang/Math;->min(II)I

    move-result v2

    move v10, v11

    const/4 v12, 0x0

    :goto_14d
    if-ge v10, v2, :cond_16b

    move/from16 v23, v2

    .line 1733
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    move/from16 v24, v10

    const/16 v10, 0x30

    if-gt v10, v2, :cond_16d

    if-ge v2, v15, :cond_16d

    shl-int/lit8 v10, v12, 0x3

    shl-int/lit8 v12, v12, 0x1

    add-int/2addr v10, v12

    add-int/lit8 v2, v2, -0x30

    add-int v12, v10, v2

    add-int/lit8 v10, v24, 0x1

    move/from16 v2, v23

    goto :goto_14d

    :cond_16b
    move/from16 v24, v10

    :cond_16d
    sub-int v10, v24, v11

    rsub-int/lit8 v2, v10, 0x9

    const/4 v10, 0x0

    :goto_172
    if-ge v10, v2, :cond_17c

    shl-int/lit8 v11, v12, 0x3

    shl-int/lit8 v12, v12, 0x1

    add-int/2addr v12, v11

    add-int/lit8 v10, v10, 0x1

    goto :goto_172

    :cond_17c
    move/from16 v10, v24

    .line 1744
    :goto_17e
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v10, v2, :cond_191

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v11, 0x30

    if-gt v11, v2, :cond_191

    if-ge v2, v15, :cond_191

    add-int/lit8 v10, v10, 0x1

    goto :goto_17e

    :cond_191
    if-eq v10, v4, :cond_1a0

    if-ne v10, v1, :cond_196

    goto :goto_1a0

    :cond_196
    int-to-long v2, v14

    const-wide/32 v14, 0x3b9aca00

    mul-long/2addr v2, v14

    int-to-long v11, v12

    add-long/2addr v2, v11

    move v4, v13

    move v13, v10

    goto :goto_1b5

    :cond_1a0
    :goto_1a0
    if-nez p3, :cond_1a9

    .line 1209
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_1a9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1af
    move/from16 v22, v2

    const/4 v2, -0x1

    move v4, v2

    const-wide/16 v2, 0x0

    .line 1217
    :goto_1b5
    invoke-static {v0, v13}, Lkotlin/time/DurationKt;->defaultDurationUnitByShortNameOrNull(Ljava/lang/String;I)Lkotlin/time/DurationUnit;

    move-result-object v10

    if-nez v10, :cond_1dc

    .line 1218
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown duration unit short name: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez p3, :cond_1d6

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_1d6
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1dc
    if-eqz v7, :cond_1f8

    .line 1219
    move-object v11, v10

    check-cast v11, Ljava/lang/Enum;

    invoke-virtual {v7, v11}, Lkotlin/time/DurationUnit;->compareTo(Ljava/lang/Enum;)I

    move-result v7

    if-gtz v7, :cond_1f8

    if-nez p3, :cond_1f0

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_1f0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unexpected order of duration components"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1222
    :cond_1f8
    sget-object v7, Lkotlin/time/DurationKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v10}, Lkotlin/time/DurationUnit;->ordinal()I

    move-result v11

    aget v7, v7, v11

    move/from16 v11, v16

    if-eq v7, v11, :cond_21e

    const/4 v12, 0x2

    if-eq v7, v12, :cond_211

    .line 1245
    invoke-static {v5, v6, v10}, Lkotlin/time/DurationUnitKt;->convertDurationUnitToMilliseconds(JLkotlin/time/DurationUnit;)J

    move-result-wide v5

    invoke-static {v8, v9, v5, v6}, Lkotlin/time/DurationKt;->addMillisWithoutOverflow(JJ)J

    move-result-wide v5

    move-wide v8, v5

    goto :goto_230

    :cond_211
    const-wide/32 v14, 0xf4240

    .line 1238
    div-long v16, v5, v14

    add-long v8, v8, v16

    .line 1240
    rem-long/2addr v5, v14

    add-long v5, v19, v5

    :goto_21b
    move-wide/from16 v19, v5

    goto :goto_230

    :cond_21e
    const-wide/16 v14, 0x3e8

    .line 1227
    div-long v16, v5, v14

    add-long v8, v8, v16

    const-wide v16, 0x431bde82d7aL

    cmp-long v7, v8, v16

    if-gtz v7, :cond_230

    .line 1231
    rem-long/2addr v5, v14

    mul-long/2addr v5, v14

    goto :goto_21b

    .line 1249
    :cond_230
    :goto_230
    invoke-static {v10}, Lkotlin/time/DurationKt;->getShortNameLength(Lkotlin/time/DurationUnit;)I

    move-result v5

    add-int/2addr v5, v13

    if-eqz v22, :cond_273

    if-ge v5, v1, :cond_24a

    if-nez p3, :cond_242

    .line 1253
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_242
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Fractional component must be last"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1259
    :cond_24a
    sget-object v6, Lkotlin/time/DurationUnit;->MINUTES:Lkotlin/time/DurationUnit;

    check-cast v6, Ljava/lang/Enum;

    invoke-virtual {v10, v6}, Lkotlin/time/DurationUnit;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-ltz v6, :cond_265

    sub-int v6, v5, v4

    const/16 v7, 0xf

    if-le v6, v7, :cond_265

    .line 1260
    invoke-static {v10}, Lkotlin/time/DurationKt;->getShortNameLength(Lkotlin/time/DurationUnit;)I

    move-result v2

    sub-int v2, v5, v2

    invoke-static {v0, v4, v2, v10}, Lkotlin/time/DurationKt;->parseFractionFallback(Ljava/lang/String;IILkotlin/time/DurationUnit;)J

    move-result-wide v2

    goto :goto_269

    .line 1262
    :cond_265
    invoke-static {v2, v3, v10}, Lkotlin/time/DurationKt;->fractionDigitsToNanos(JLkotlin/time/DurationUnit;)J

    move-result-wide v2

    :goto_269
    add-long v2, v19, v2

    move-object v7, v10

    move/from16 v4, v18

    const/4 v12, 0x0

    move-wide v10, v2

    move v2, v5

    goto/16 :goto_3e

    :cond_273
    move v2, v5

    move-object v7, v10

    move/from16 v4, v18

    move-wide/from16 v10, v19

    const/4 v12, 0x0

    goto/16 :goto_3e

    :cond_27c
    if-nez p3, :cond_285

    .line 1197
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_285
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28b
    move-wide/from16 v19, v10

    .line 1266
    sget-object v0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v8, v9, v0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide v0

    sget-object v2, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    move-wide/from16 v5, v19

    invoke-static {v5, v6, v2}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lkotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private static final parseDuration(Ljava/lang/String;ZZ)J
    .registers 13

    .line 1053
    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_1a

    if-nez p2, :cond_12

    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide p0

    return-wide p0

    :cond_12
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "The string is empty"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1a
    const/4 v0, 0x0

    .line 1055
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2b

    const/4 v3, 0x1

    if-eq v1, v2, :cond_2d

    const/16 v2, 0x2d

    if-eq v1, v2, :cond_2b

    move v1, v0

    :goto_29
    move v5, v1

    goto :goto_2f

    :cond_2b
    move v1, v3

    goto :goto_29

    :cond_2d
    move v1, v0

    move v5, v3

    :goto_2f
    if-lez v5, :cond_32

    move v0, v3

    .line 1065
    :cond_32
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v2, v5, :cond_49

    if-nez p2, :cond_41

    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide p0

    return-wide p0

    :cond_41
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "No components"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1066
    :cond_49
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x50

    if-ne v2, v4, :cond_57

    add-int/2addr v5, v3

    invoke-static {p0, v5, p2}, Lkotlin/time/DurationKt;->parseIsoStringFormat(Ljava/lang/String;IZ)J

    move-result-wide p0

    goto :goto_8b

    :cond_57
    if-eqz p1, :cond_6a

    if-nez p2, :cond_62

    .line 1067
    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide p0

    return-wide p0

    :cond_62
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, ""

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1068
    :cond_6a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v5

    const/16 v2, 0x8

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v8

    const/4 v9, 0x1

    const-string v6, "Infinity"

    const/4 v7, 0x0

    move-object v4, p0

    invoke-static/range {v4 .. v9}, Lkotlin/text/StringsKt;->regionMatches(Ljava/lang/String;ILjava/lang/String;IIZ)Z

    move-result p0

    if-eqz p0, :cond_87

    .line 1069
    sget-object p0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p0}, Lkotlin/time/Duration$Companion;->getINFINITE-UwyO8pc()J

    move-result-wide p0

    goto :goto_8b

    .line 1071
    :cond_87
    invoke-static {v4, v5, v0, p2}, Lkotlin/time/DurationKt;->parseDefaultStringFormat(Ljava/lang/String;IZZ)J

    move-result-wide p0

    :goto_8b
    if-eqz v1, :cond_9d

    .line 1073
    sget-object p2, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {p2}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/Duration;->equals-impl0(JJ)Z

    move-result p2

    if-nez p2, :cond_9d

    invoke-static {p0, p1}, Lkotlin/time/Duration;->unaryMinus-UwyO8pc(J)J

    move-result-wide p0

    :cond_9d
    return-wide p0
.end method

.method static synthetic parseDuration$default(Ljava/lang/String;ZZILjava/lang/Object;)J
    .registers 5

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_5

    const/4 p2, 0x1

    .line 1052
    :cond_5
    invoke-static {p0, p1, p2}, Lkotlin/time/DurationKt;->parseDuration(Ljava/lang/String;ZZ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final parseFractionFallback(Ljava/lang/String;IILkotlin/time/DurationUnit;)J
    .registers 5

    .line 1435
    const-string v0, "null cannot be cast to non-null type java.lang.String"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string p1, "substring(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    invoke-static {p3}, Lkotlin/time/DurationKt;->getFallbackFractionMultiplier(Lkotlin/time/DurationUnit;)J

    move-result-wide p2

    long-to-double p2, p2

    mul-double/2addr p0, p2

    invoke-static {p0, p1}, Lkotlin/math/MathKt;->roundToLong(D)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final parseIsoStringFormat(Ljava/lang/String;IZ)J
    .registers 26

    move-object/from16 v0, p0

    .line 1090
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, ""

    move/from16 v3, p1

    if-ne v3, v1, :cond_1b

    if-nez p2, :cond_15

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b
    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    .line 1104
    :goto_21
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v3, v12, :cond_29b

    .line 1105
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v13, 0x54

    if-ne v12, v13, :cond_4b

    if-nez v11, :cond_3c

    add-int/lit8 v3, v3, 0x1

    .line 1107
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    if-ne v3, v11, :cond_3a

    goto :goto_3c

    :cond_3a
    const/4 v11, 0x1

    goto :goto_21

    :cond_3c
    :goto_3c
    if-nez p2, :cond_45

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1116
    :cond_4b
    sget-object v13, Lkotlin/time/LongParser;->Companion:Lkotlin/time/LongParser$Companion;

    invoke-virtual {v13}, Lkotlin/time/LongParser$Companion;->getIso()Lkotlin/time/LongParser;

    move-result-object v13

    .line 1633
    # getter for: Lkotlin/time/LongParser;->allowSign:Z
    invoke-static {v13}, Lkotlin/time/LongParser;->access$getAllowSign$p(Lkotlin/time/LongParser;)Z

    move-result v15

    const/16 v1, 0x2d

    const/16 v4, 0x2b

    if-eqz v15, :cond_6b

    .line 1634
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v4, :cond_68

    if-eq v5, v1, :cond_64

    goto :goto_6b

    :cond_64
    add-int/lit8 v5, v3, 0x1

    const/4 v15, -0x1

    goto :goto_6d

    :cond_68
    add-int/lit8 v5, v3, 0x1

    goto :goto_6c

    :cond_6b
    :goto_6b
    move v5, v3

    :goto_6c
    const/4 v15, 0x1

    :goto_6d
    const/16 p1, 0x1

    .line 1644
    :goto_6f
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v1, 0x30

    if-ge v5, v14, :cond_82

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-ne v14, v1, :cond_82

    add-int/lit8 v5, v5, 0x1

    const/16 v1, 0x2d

    goto :goto_6f

    :cond_82
    const-wide/16 v17, 0x0

    .line 1647
    :goto_84
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v4, 0x3a

    if-ge v5, v14, :cond_112

    .line 1648
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-gt v1, v14, :cond_112

    if-ge v14, v4, :cond_112

    add-int/lit8 v14, v14, -0x30

    .line 1651
    # getter for: Lkotlin/time/LongParser;->overflowThreshold:J
    invoke-static {v13}, Lkotlin/time/LongParser;->access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J

    move-result-wide v19

    cmp-long v19, v17, v19

    if-gtz v19, :cond_c9

    # getter for: Lkotlin/time/LongParser;->overflowThreshold:J
    invoke-static {v13}, Lkotlin/time/LongParser;->access$getOverflowThreshold$p(Lkotlin/time/LongParser;)J

    move-result-wide v19

    cmp-long v19, v17, v19

    if-nez v19, :cond_b2

    move/from16 v19, v5

    int-to-long v4, v14

    # getter for: Lkotlin/time/LongParser;->lastDigitMax:J
    invoke-static {v13}, Lkotlin/time/LongParser;->access$getLastDigitMax$p(Lkotlin/time/LongParser;)J

    move-result-wide v21

    cmp-long v4, v4, v21

    if-lez v4, :cond_b4

    goto :goto_cb

    :cond_b2
    move/from16 v19, v5

    :cond_b4
    const/4 v4, 0x3

    shl-long v4, v17, v4

    shl-long v17, v17, p1

    add-long v4, v4, v17

    move-object/from16 v21, v2

    int-to-long v1, v14

    add-long v17, v4, v1

    add-int/lit8 v5, v19, 0x1

    move-object/from16 v2, v21

    const/16 v1, 0x30

    const/16 v4, 0x2b

    goto :goto_84

    :cond_c9
    move/from16 v19, v5

    :goto_cb
    move-object/from16 v21, v2

    move/from16 v5, v19

    .line 1644
    :goto_cf
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v5, v1, :cond_e4

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x30

    if-gt v2, v1, :cond_e4

    const/16 v2, 0x3a

    if-ge v1, v2, :cond_e4

    add-int/lit8 v5, v5, 0x1

    goto :goto_cf

    .line 1119
    :cond_e4
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v5, v1, :cond_101

    const/16 v1, 0x2b

    if-eq v12, v1, :cond_f4

    const/16 v1, 0x2d

    if-eq v12, v1, :cond_f4

    const/4 v14, 0x0

    goto :goto_f6

    :cond_f4
    move/from16 v14, p1

    :goto_f6
    add-int/2addr v3, v14

    if-ne v5, v3, :cond_fa

    goto :goto_101

    .line 1654
    :cond_fa
    # getter for: Lkotlin/time/LongParser;->overflowLimit:J
    invoke-static {v13}, Lkotlin/time/LongParser;->access$getOverflowLimit$p(Lkotlin/time/LongParser;)J

    move-result-wide v17

    move-object/from16 v1, v21

    goto :goto_12e

    :cond_101
    :goto_101
    if-nez p2, :cond_10a

    .line 1119
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_10a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_112
    move-object v1, v2

    move/from16 v19, v5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    move/from16 v5, v19

    if-eq v5, v2, :cond_28c

    const/16 v2, 0x2b

    if-eq v12, v2, :cond_127

    const/16 v2, 0x2d

    if-eq v12, v2, :cond_127

    const/4 v14, 0x0

    goto :goto_129

    :cond_127
    move/from16 v14, p1

    :goto_129
    add-int/2addr v3, v14

    if-ne v5, v3, :cond_12e

    goto/16 :goto_28c

    :cond_12e
    :goto_12e
    move-wide/from16 v2, v17

    .line 1123
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v12, 0x2e

    if-ne v4, v12, :cond_1f2

    add-int/lit8 v4, v5, 0x1

    .line 1125
    sget-object v9, Lkotlin/time/FractionalParser;->INSTANCE:Lkotlin/time/FractionalParser;

    add-int/lit8 v5, v5, 0x7

    .line 1671
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    invoke-static {v5, v9}, Ljava/lang/Math;->min(II)I

    move-result v5

    move v9, v4

    const/4 v10, 0x0

    :goto_148
    if-ge v9, v5, :cond_162

    .line 1674
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v13, 0x30

    if-gt v13, v12, :cond_162

    const/16 v13, 0x3a

    if-ge v12, v13, :cond_162

    shl-int/lit8 v13, v10, 0x3

    shl-int/lit8 v10, v10, 0x1

    add-int/2addr v13, v10

    add-int/lit8 v12, v12, -0x30

    add-int v10, v13, v12

    add-int/lit8 v9, v9, 0x1

    goto :goto_148

    :cond_162
    sub-int v5, v9, v4

    rsub-int/lit8 v5, v5, 0x6

    const/4 v12, 0x0

    :goto_167
    if-ge v12, v5, :cond_171

    shl-int/lit8 v13, v10, 0x3

    shl-int/lit8 v10, v10, 0x1

    add-int/2addr v10, v13

    add-int/lit8 v12, v12, 0x1

    goto :goto_167

    :cond_171
    add-int/lit8 v5, v9, 0x9

    .line 1671
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v12

    invoke-static {v5, v12}, Ljava/lang/Math;->min(II)I

    move-result v5

    move v12, v9

    const/4 v13, 0x0

    :goto_17d
    if-ge v12, v5, :cond_19b

    .line 1674
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v14

    move/from16 p1, v5

    const/16 v5, 0x30

    if-gt v5, v14, :cond_19b

    const/16 v5, 0x3a

    if-ge v14, v5, :cond_19b

    shl-int/lit8 v5, v13, 0x3

    shl-int/lit8 v13, v13, 0x1

    add-int/2addr v5, v13

    add-int/lit8 v14, v14, -0x30

    add-int v13, v5, v14

    add-int/lit8 v12, v12, 0x1

    move/from16 v5, p1

    goto :goto_17d

    :cond_19b
    sub-int v5, v12, v9

    rsub-int/lit8 v5, v5, 0x9

    const/4 v9, 0x0

    :goto_1a0
    if-ge v9, v5, :cond_1aa

    shl-int/lit8 v14, v13, 0x3

    shl-int/lit8 v13, v13, 0x1

    add-int/2addr v13, v14

    add-int/lit8 v9, v9, 0x1

    goto :goto_1a0

    :cond_1aa
    move v5, v12

    .line 1685
    :goto_1ab
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v5, v9, :cond_1c0

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v12, 0x30

    if-gt v12, v9, :cond_1c0

    const/16 v14, 0x3a

    if-ge v9, v14, :cond_1c0

    add-int/lit8 v5, v5, 0x1

    goto :goto_1ab

    :cond_1c0
    if-eq v5, v4, :cond_1e3

    .line 1128
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v5, v4, :cond_1e3

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v9, 0x53

    if-eq v4, v9, :cond_1d1

    goto :goto_1e3

    :cond_1d1
    int-to-long v9, v10

    const-wide/32 v16, 0x3b9aca00

    mul-long v9, v9, v16

    int-to-long v12, v13

    add-long/2addr v9, v12

    int-to-long v12, v15

    .line 1133
    sget-object v4, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v9, v10, v4}, Lkotlin/time/DurationKt;->fractionDigitsToNanos(JLkotlin/time/DurationUnit;)J

    move-result-wide v9

    mul-long/2addr v12, v9

    move-wide v9, v12

    goto :goto_1f2

    :cond_1e3
    :goto_1e3
    if-nez p2, :cond_1ec

    .line 1129
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_1ec
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1136
    :cond_1f2
    :goto_1f2
    invoke-static {v0, v5}, Lkotlin/time/DurationKt;->isoDurationUnitByShortNameOrNull(Ljava/lang/String;I)Lkotlin/time/DurationUnit;

    move-result-object v4

    if-nez v4, :cond_219

    .line 1137
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown duration unit short name: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-nez p2, :cond_213

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_213
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_219
    if-eqz v6, :cond_235

    .line 1138
    move-object v12, v4

    check-cast v12, Ljava/lang/Enum;

    invoke-virtual {v6, v12}, Lkotlin/time/DurationUnit;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_235

    if-nez p2, :cond_22d

    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_22d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unexpected order of duration components"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1141
    :cond_235
    sget-object v6, Lkotlin/time/DurationUnit;->DAYS:Lkotlin/time/DurationUnit;

    if-ne v4, v6, :cond_252

    if-eqz v11, :cond_24a

    if-nez p2, :cond_244

    .line 1142
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_244
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_24a
    int-to-long v6, v15

    .line 1143
    invoke-static {v2, v3, v4}, Lkotlin/time/DurationUnitKt;->convertDurationUnitToMilliseconds(JLkotlin/time/DurationUnit;)J

    move-result-wide v2

    mul-long/2addr v6, v2

    move-wide v7, v6

    goto :goto_286

    :cond_252
    if-nez v11, :cond_263

    if-nez p2, :cond_25d

    .line 1145
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_25d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_263
    int-to-long v12, v15

    .line 1146
    invoke-static {v2, v3, v4}, Lkotlin/time/DurationUnitKt;->convertDurationUnitToMilliseconds(JLkotlin/time/DurationUnit;)J

    move-result-wide v2

    mul-long/2addr v12, v2

    invoke-static {v7, v8, v12, v13}, Lkotlin/time/DurationKt;->addMillisWithoutOverflow(JJ)J

    move-result-wide v2

    const-wide v6, 0x7fffffffffffc0deL

    cmp-long v6, v2, v6

    if-nez v6, :cond_285

    if-nez p2, :cond_27f

    .line 1147
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_27f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_285
    move-wide v7, v2

    :goto_286
    add-int/lit8 v3, v5, 0x1

    move-object v2, v1

    move-object v6, v4

    goto/16 :goto_21

    :cond_28c
    :goto_28c
    if-nez p2, :cond_295

    .line 1119
    sget-object v0, Lkotlin/time/Duration;->Companion:Lkotlin/time/Duration$Companion;

    invoke-virtual {v0}, Lkotlin/time/Duration$Companion;->getINVALID-UwyO8pc$kotlin_stdlib()J

    move-result-wide v0

    return-wide v0

    :cond_295
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1153
    :cond_29b
    sget-object v0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v7, v8, v0}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide v0

    sget-object v2, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v9, v10, v2}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lkotlin/time/Duration;->plus-LRDsOJo(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private static final sameSign(JJ)Z
    .registers 4

    xor-long/2addr p0, p2

    const-wide/16 p2, 0x0

    cmp-long p0, p0, p2

    if-ltz p0, :cond_9

    const/4 p0, 0x1

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method private static final times-kIfJnKk(DJ)J
    .registers 4

    .line 1041
    invoke-static {p2, p3, p0, p1}, Lkotlin/time/Duration;->times-UwyO8pc(JD)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final times-mvk6XK0(IJ)J
    .registers 3

    .line 1028
    invoke-static {p1, p2, p0}, Lkotlin/time/Duration;->times-UwyO8pc(JI)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final toDuration(DLkotlin/time/DurationUnit;)J
    .registers 7

    const-string v0, "unit"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1009
    sget-object v0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p0, p1, p2, v0}, Lkotlin/time/DurationUnitKt;->convertDurationUnit(DLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)D

    move-result-wide v0

    .line 1010
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_3b

    .line 1011
    invoke-static {v0, v1}, Lkotlin/math/MathKt;->roundToLong(D)J

    move-result-wide v0

    const-wide v2, -0x3ffffffffffa14bfL    # -2.0000000001722644

    cmp-long v2, v2, v0

    if-gtz v2, :cond_2c

    const-wide v2, 0x3ffffffffffa14c0L    # 1.999999999913868

    cmp-long v2, v0, v2

    if-gez v2, :cond_2c

    .line 1013
    invoke-static {v0, v1}, Lkotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 1015
    :cond_2c
    sget-object v0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p0, p1, p2, v0}, Lkotlin/time/DurationUnitKt;->convertDurationUnit(DLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)D

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/math/MathKt;->roundToLong(D)J

    move-result-wide p0

    .line 1016
    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfMillisNormalized(J)J

    move-result-wide p0

    return-wide p0

    .line 1010
    :cond_3b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Duration value cannot be NaN."

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final toDuration(ILkotlin/time/DurationUnit;)J
    .registers 4

    const-string v0, "unit"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 972
    sget-object v0, Lkotlin/time/DurationUnit;->SECONDS:Lkotlin/time/DurationUnit;

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {p1, v0}, Lkotlin/time/DurationUnit;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gtz v0, :cond_1b

    int-to-long v0, p0

    .line 973
    sget-object p0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v0, v1, p1, p0}, Lkotlin/time/DurationUnitKt;->convertDurationUnitOverflow(JLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    :cond_1b
    int-to-long v0, p0

    .line 975
    invoke-static {v0, v1, p1}, Lkotlin/time/DurationKt;->toDuration(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final toDuration(JLkotlin/time/DurationUnit;)J
    .registers 10

    const-string v0, "unit"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-wide v0, 0x3ffffffffffa14bfL    # 1.9999999999138678

    .line 985
    sget-object v2, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {v0, v1, v2, p2}, Lkotlin/time/DurationUnitKt;->convertDurationUnitOverflow(JLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)J

    move-result-wide v0

    neg-long v2, v0

    cmp-long v2, v2, p0

    if-gtz v2, :cond_24

    cmp-long v0, p0, v0

    if-gtz v0, :cond_24

    .line 987
    sget-object v0, Lkotlin/time/DurationUnit;->NANOSECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p0, p1, p2, v0}, Lkotlin/time/DurationUnitKt;->convertDurationUnitOverflow(JLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfNanos(J)J

    move-result-wide p0

    return-wide p0

    .line 988
    :cond_24
    sget-object v0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {p2, v0}, Lkotlin/time/DurationUnit;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-ltz v0, :cond_4a

    .line 989
    invoke-static {p0, p1}, Lkotlin/math/MathKt;->getSign(J)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 990
    invoke-static {p0, p1, v2, v3}, Lkotlin/ranges/RangesKt;->coerceAtLeast(JJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(J)J

    move-result-wide p0

    .line 989
    invoke-static {p0, p1, p2}, Lkotlin/time/DurationUnitKt;->convertDurationUnitToMilliseconds(JLkotlin/time/DurationUnit;)J

    move-result-wide p0

    mul-long/2addr v0, p0

    .line 988
    invoke-static {v0, v1}, Lkotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0

    .line 994
    :cond_4a
    sget-object v0, Lkotlin/time/DurationUnit;->MILLISECONDS:Lkotlin/time/DurationUnit;

    invoke-static {p0, p1, p2, v0}, Lkotlin/time/DurationUnitKt;->convertDurationUnit(JLkotlin/time/DurationUnit;Lkotlin/time/DurationUnit;)J

    move-result-wide v1

    const-wide v3, -0x3fffffffffffffffL    # -2.0000000000000004

    const-wide v5, 0x3fffffffffffffffL    # 1.9999999999999998

    invoke-static/range {v1 .. v6}, Lkotlin/ranges/RangesKt;->coerceIn(JJJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Lkotlin/time/DurationKt;->durationOfMillis(J)J

    move-result-wide p0

    return-wide p0
.end method
