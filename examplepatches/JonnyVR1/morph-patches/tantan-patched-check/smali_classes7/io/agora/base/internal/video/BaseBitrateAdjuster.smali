.class Lio/agora/base/internal/video/BaseBitrateAdjuster;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/BitrateAdjuster;


# instance fields
.field protected targetBitrateBps:I

.field protected targetFps:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 6
    .line 7
    iput v0, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetFps:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getAdjustedBitrateBps()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 2
    .line 3
    return p0
.end method

.method public getCodecConfigFramerate()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetFps:I

    .line 2
    .line 3
    return p0
.end method

.method public reportEncodedFrame(I)V
    .locals 0

    return-void
.end method

.method public setTargets(II)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetBitrateBps:I

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;->targetFps:I

    .line 4
    .line 5
    return-void
.end method
