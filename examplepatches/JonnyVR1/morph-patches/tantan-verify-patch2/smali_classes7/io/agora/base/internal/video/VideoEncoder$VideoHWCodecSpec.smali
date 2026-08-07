.class public Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/VideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoHWCodecSpec"
.end annotation


# instance fields
.field public final bitrateMode:I

.field public final codecName:Ljava/lang/String;

.field public final inputType:I

.field public final maxResolution:Ljava/lang/String;

.field public final minSupportedBitrate:I

.field public final platformid:I

.field public final profile:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->codecName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->maxResolution:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->bitrateMode:I

    .line 9
    .line 10
    iput p4, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->inputType:I

    .line 11
    .line 12
    iput p5, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->profile:I

    .line 13
    .line 14
    iput p6, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->minSupportedBitrate:I

    .line 15
    .line 16
    const/4 p1, 0x4

    .line 17
    iput p1, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->platformid:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getBitrateMode()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->bitrateMode:I

    .line 2
    .line 3
    return p0
.end method

.method public getCodecName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->codecName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInputType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->inputType:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxResolution()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->maxResolution:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinSupportedBitrate()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->minSupportedBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlatformid()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->platformid:I

    .line 2
    .line 3
    return p0
.end method

.method public getProfile()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "VideoHWCodecSpec"
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoEncoder$VideoHWCodecSpec;->profile:I

    .line 2
    .line 3
    return p0
.end method
