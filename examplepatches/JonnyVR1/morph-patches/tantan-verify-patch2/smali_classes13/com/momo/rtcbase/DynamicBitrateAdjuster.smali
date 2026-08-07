.class Lcom/momo/rtcbase/DynamicBitrateAdjuster;
.super Lcom/momo/rtcbase/BaseBitrateAdjuster;
.source "SourceFile"


# static fields
.field private static final BITRATE_ADJUSTMENT_MAX_SCALE:D = 4.0

.field private static final BITRATE_ADJUSTMENT_SEC:D = 3.0

.field private static final BITRATE_ADJUSTMENT_STEPS:I = 0x14

.field private static final BITS_PER_BYTE:D = 8.0


# instance fields
.field private bitrateAdjustmentScaleExp:I

.field private deviationBytes:D

.field private timeSinceLastAdjustmentMs:D


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/BaseBitrateAdjuster;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getBitrateAdjustmentScale()D
    .locals 4

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 2
    .line 3
    int-to-double v0, p0

    .line 4
    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    .line 5
    .line 6
    div-double/2addr v0, v2

    .line 7
    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    .line 8
    .line 9
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method


# virtual methods
.method public getAdjustedBitrateBps()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->getBitrateAdjustmentScale()D

    .line 5
    .line 6
    .line 7
    move-result-wide v2

    .line 8
    mul-double/2addr v0, v2

    .line 9
    double-to-int p0, v0

    .line 10
    return p0
.end method

.method public reportEncodedFrame(I)V
    .locals 12

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/BaseBitrateAdjuster;->targetFps:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget v1, p0, Lcom/momo/rtcbase/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 7
    .line 8
    int-to-double v2, v1

    .line 9
    const-wide/high16 v4, 0x4020000000000000L    # 8.0

    .line 10
    .line 11
    div-double/2addr v2, v4

    .line 12
    int-to-double v6, v0

    .line 13
    div-double/2addr v2, v6

    .line 14
    iget-wide v6, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 15
    .line 16
    int-to-double v8, p1

    .line 17
    sub-double/2addr v8, v2

    .line 18
    add-double/2addr v6, v8

    .line 19
    iput-wide v6, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 20
    .line 21
    iget-wide v2, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->timeSinceLastAdjustmentMs:D

    .line 22
    .line 23
    const-wide v8, 0x408f400000000000L    # 1000.0

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    int-to-double v10, v0

    .line 29
    div-double/2addr v8, v10

    .line 30
    add-double/2addr v2, v8

    .line 31
    iput-wide v2, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->timeSinceLastAdjustmentMs:D

    .line 32
    .line 33
    int-to-double v0, v1

    .line 34
    div-double/2addr v0, v4

    .line 35
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    .line 36
    .line 37
    mul-double/2addr v2, v0

    .line 38
    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->min(DD)D

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    iput-wide v4, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 43
    .line 44
    neg-double v2, v2

    .line 45
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    iput-wide v2, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 50
    .line 51
    iget-wide v4, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->timeSinceLastAdjustmentMs:D

    .line 52
    .line 53
    const-wide v6, 0x40a7700000000000L    # 3000.0

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    cmpg-double p1, v4, v6

    .line 59
    .line 60
    if-gtz p1, :cond_1

    .line 61
    .line 62
    :goto_0
    return-void

    .line 63
    :cond_1
    cmpl-double p1, v2, v0

    .line 64
    .line 65
    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    .line 66
    .line 67
    if-lez p1, :cond_2

    .line 68
    .line 69
    div-double/2addr v2, v0

    .line 70
    add-double/2addr v2, v4

    .line 71
    double-to-int p1, v2

    .line 72
    iget v2, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 73
    .line 74
    sub-int/2addr v2, p1

    .line 75
    iput v2, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 76
    .line 77
    const/16 p1, -0x14

    .line 78
    .line 79
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 84
    .line 85
    iput-wide v0, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    neg-double v6, v0

    .line 89
    cmpg-double p1, v2, v6

    .line 90
    .line 91
    if-gez p1, :cond_3

    .line 92
    .line 93
    neg-double v2, v2

    .line 94
    div-double/2addr v2, v0

    .line 95
    add-double/2addr v2, v4

    .line 96
    double-to-int p1, v2

    .line 97
    iget v0, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 98
    .line 99
    add-int/2addr v0, p1

    .line 100
    iput v0, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 101
    .line 102
    const/16 p1, 0x14

    .line 103
    .line 104
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iput p1, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->bitrateAdjustmentScaleExp:I

    .line 109
    .line 110
    iput-wide v6, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 111
    .line 112
    :cond_3
    :goto_1
    const-wide/16 v0, 0x0

    .line 113
    .line 114
    iput-wide v0, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->timeSinceLastAdjustmentMs:D

    .line 115
    .line 116
    return-void
.end method

.method public setTargets(II)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 8
    .line 9
    int-to-double v3, p1

    .line 10
    mul-double/2addr v1, v3

    .line 11
    int-to-double v3, v0

    .line 12
    div-double/2addr v1, v3

    .line 13
    iput-wide v1, p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;->deviationBytes:D

    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/momo/rtcbase/BaseBitrateAdjuster;->setTargets(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
