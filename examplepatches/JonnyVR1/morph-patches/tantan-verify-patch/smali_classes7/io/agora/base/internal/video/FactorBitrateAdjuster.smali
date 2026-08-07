.class Lio/agora/base/internal/video/FactorBitrateAdjuster;
.super Lio/agora/base/internal/video/BaseBitrateAdjuster;
.source "SourceFile"


# static fields
.field public static final FACTOR_BASE:I = 0x3e8

.field public static final FACTOR_LEVEL1:I = 0x3b6


# instance fields
.field private factorLevel:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/BaseBitrateAdjuster;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e8

    .line 5
    .line 6
    iput v0, p0, Lio/agora/base/internal/video/FactorBitrateAdjuster;->factorLevel:I

    .line 7
    .line 8
    const/16 v0, 0x3b6

    .line 9
    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iput v0, p0, Lio/agora/base/internal/video/FactorBitrateAdjuster;->factorLevel:I

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private getBitrateAdjustmentScale()D
    .locals 4

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/FactorBitrateAdjuster;->factorLevel:I

    .line 2
    .line 3
    int-to-double v0, p0

    .line 4
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    div-double/2addr v0, v2

    .line 10
    return-wide v0
.end method


# virtual methods
.method public setTargets(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lio/agora/base/internal/video/BaseBitrateAdjuster;->setTargets(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 5
    .line 6
    int-to-double p1, p1

    .line 7
    invoke-direct {p0}, Lio/agora/base/internal/video/FactorBitrateAdjuster;->getBitrateAdjustmentScale()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    mul-double/2addr p1, v0

    .line 12
    double-to-int p1, p1

    .line 13
    iput p1, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 14
    .line 15
    return-void
.end method
