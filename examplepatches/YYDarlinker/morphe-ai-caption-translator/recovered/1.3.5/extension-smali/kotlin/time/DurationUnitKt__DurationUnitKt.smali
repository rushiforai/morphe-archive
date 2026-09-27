.class Lkotlin/time/DurationUnitKt__DurationUnitKt;
.super Lkotlin/time/DurationUnitKt__DurationUnitJvmKt;
.source "DurationUnit.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/DurationUnitKt__DurationUnitKt$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a\u001a\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004H\u0080\u0080\u0004\u001a\u001b\u0010\u0005\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0001H\u0082\u0080\u0004\u00a2\u0006\u0002\u0008\u0007\u001a\u001c\u0010\u000b\u001a\u00020\u000c*\u00020\u0004H\u0081\u0080\u0004b\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000f\"\u0019\u0010\u0008\u001a\u00020\u0001*\u00020\u00048BX\u0082\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u0010"
    }
    d2 = {
        "convertDurationUnitToMilliseconds",
        "",
        "value",
        "unit",
        "Lkotlin/time/DurationUnit;",
        "multiplyNonNegativeWithoutOverflow",
        "other",
        "multiplyNonNegativeWithoutOverflow$DurationUnitKt__DurationUnitKt",
        "millisMultiplier",
        "getMillisMultiplier$DurationUnitKt__DurationUnitKt",
        "(Lkotlin/time/DurationUnit;)J",
        "shortName",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x31
    xs = "kotlin/time/DurationUnitKt"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lkotlin/time/DurationUnitKt__DurationUnitJvmKt;-><init>()V

    return-void
.end method

.method public static final convertDurationUnitToMilliseconds(JLkotlin/time/DurationUnit;)J
    .registers 5

    const-string v0, "unit"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-static {p2}, Lkotlin/time/DurationUnitKt__DurationUnitKt;->getMillisMultiplier$DurationUnitKt__DurationUnitKt(Lkotlin/time/DurationUnit;)J

    move-result-wide v0

    invoke-static {p0, p1, v0, v1}, Lkotlin/time/DurationUnitKt__DurationUnitKt;->multiplyNonNegativeWithoutOverflow$DurationUnitKt__DurationUnitKt(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final getMillisMultiplier$DurationUnitKt__DurationUnitKt(Lkotlin/time/DurationUnit;)J
    .registers 4

    .line 105
    sget-object v0, Lkotlin/time/DurationUnitKt__DurationUnitKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lkotlin/time/DurationUnit;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3d

    const/4 v1, 0x2

    if-eq v0, v1, :cond_39

    const/4 v1, 0x3

    if-eq v0, v1, :cond_35

    const/4 v1, 0x4

    if-eq v0, v1, :cond_32

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1a

    const-wide/16 v0, 0x1

    return-wide v0

    .line 110
    :cond_1a
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Wrong unit for millisMultiplier: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_32
    const-wide/16 v0, 0x3e8

    return-wide v0

    :cond_35
    const-wide/32 v0, 0xea60

    return-wide v0

    :cond_39
    const-wide/32 v0, 0x36ee80

    return-wide v0

    :cond_3d
    const-wide/32 v0, 0x5265c00

    return-wide v0
.end method

.method private static final multiplyNonNegativeWithoutOverflow$DurationUnitKt__DurationUnitKt(JJ)J
    .registers 9

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_7

    return-wide v0

    :cond_7
    const-wide/16 v0, 0x1

    cmp-long v2, p0, v0

    const-wide v3, 0x3fffffffffffffffL    # 1.9999999999999998

    if-nez v2, :cond_17

    .line 88
    invoke-static {p2, p3, v3, v4}, Lkotlin/ranges/RangesKt;->coerceAtMost(JJ)J

    move-result-wide p0

    return-wide p0

    :cond_17
    cmp-long v0, p2, v0

    if-nez v0, :cond_20

    .line 89
    invoke-static {p0, p1, v3, v4}, Lkotlin/ranges/RangesKt;->coerceAtMost(JJ)J

    move-result-wide p0

    return-wide p0

    .line 91
    :cond_20
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v0

    rsub-int v0, v0, 0x80

    invoke-static {p2, p3}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v1

    sub-int/2addr v0, v1

    const/16 v1, 0x3f

    if-ge v0, v1, :cond_31

    mul-long/2addr p0, p2

    return-wide p0

    :cond_31
    if-le v0, v1, :cond_34

    return-wide v3

    :cond_34
    mul-long/2addr p0, p2

    .line 95
    invoke-static {p0, p1, v3, v4}, Lkotlin/ranges/RangesKt;->coerceAtMost(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final shortName(Lkotlin/time/DurationUnit;)Ljava/lang/String;
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    sget-object v0, Lkotlin/time/DurationUnitKt__DurationUnitKt$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lkotlin/time/DurationUnit;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_3e

    .line 123
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 124
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

    .line 118
    :pswitch_28
    const-string p0, "us"

    return-object p0

    .line 117
    :pswitch_2b
    const-string p0, "ns"

    return-object p0

    .line 119
    :pswitch_2e
    const-string p0, "ms"

    return-object p0

    .line 120
    :pswitch_31
    const-string p0, "s"

    return-object p0

    .line 121
    :pswitch_34
    const-string p0, "m"

    return-object p0

    .line 122
    :pswitch_37
    const-string p0, "h"

    return-object p0

    .line 123
    :pswitch_3a
    const-string p0, "d"

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_28
    .end packed-switch
.end method
