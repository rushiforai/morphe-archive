.class Lcom/bytedance/realx/video/VideoEncoderWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(JLcom/bytedance/realx/video/EncodedImage;Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;)V
    .locals 13

    .line 1
    iget-object v2, p2, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    iget v3, p2, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 4
    .line 5
    iget v4, p2, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 6
    .line 7
    iget-wide v5, p2, Lcom/bytedance/realx/video/EncodedImage;->captureTimeNs:J

    .line 8
    .line 9
    iget-object v0, p2, Lcom/bytedance/realx/video/EncodedImage;->frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/bytedance/realx/video/EncodedImage$FrameType;->getNative()I

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    move-object/from16 v0, p3

    .line 16
    .line 17
    iget-object v0, v0, Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;->codec_standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->toInt()I

    .line 20
    .line 21
    .line 22
    move-result v8

    .line 23
    iget v9, p2, Lcom/bytedance/realx/video/EncodedImage;->svcLayerNum:I

    .line 24
    .line 25
    iget-wide v10, p2, Lcom/bytedance/realx/video/EncodedImage;->compositionTimeUs:J

    .line 26
    .line 27
    iget-object p2, p2, Lcom/bytedance/realx/video/EncodedImage;->qp:Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v12

    .line 33
    move-wide v0, p0

    .line 34
    invoke-static/range {v0 .. v12}, Lcom/bytedance/realx/video/VideoEncoderWrapper;->nativeOnEncodedFrame(JLjava/nio/ByteBuffer;IIJIIIJI)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static createEncoderCallback(J)Lcom/bytedance/realx/video/VideoEncoder$Callback;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/bytedance/realx/video/e;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static getScalingSettingsHigh(Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;)Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;->high:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getScalingSettingsLow(Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;)Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;->low:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getScalingSettingsOn(Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;)Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/VideoEncoder$ScalingSettings;->on:Z

    .line 2
    .line 3
    return p0
.end method

.method private static native nativeOnEncodedFrame(JLjava/nio/ByteBuffer;IIJIIIJI)V
.end method
