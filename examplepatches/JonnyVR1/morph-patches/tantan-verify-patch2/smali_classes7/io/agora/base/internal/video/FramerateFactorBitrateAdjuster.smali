.class Lio/agora/base/internal/video/FramerateFactorBitrateAdjuster;
.super Lio/agora/base/internal/video/FactorBitrateAdjuster;
.source "SourceFile"


# static fields
.field private static final INITIAL_FPS:I = 0x1e


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lio/agora/base/internal/video/FactorBitrateAdjuster;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCodecConfigFramerate()I
    .locals 0

    const/16 p0, 0x1e

    return p0
.end method

.method public setTargets(II)V
    .locals 2

    .line 1
    iget v0, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetFps:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move p2, v1

    .line 8
    :cond_0
    mul-int/2addr p1, v1

    .line 9
    div-int/2addr p1, p2

    .line 10
    invoke-super {p0, p1, p2}, Lio/agora/base/internal/video/FactorBitrateAdjuster;->setTargets(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
