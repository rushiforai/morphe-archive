.class Lcom/momo/rtcbase/VideoEncoderWrapper;
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

.method public static synthetic a(JLcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;)V
    .locals 11

    .line 1
    iget-object v2, p2, Lcom/momo/rtcbase/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    iget v3, p2, Lcom/momo/rtcbase/EncodedImage;->encodedWidth:I

    .line 4
    .line 5
    iget v4, p2, Lcom/momo/rtcbase/EncodedImage;->encodedHeight:I

    .line 6
    .line 7
    iget-wide v5, p2, Lcom/momo/rtcbase/EncodedImage;->captureTimeNs:J

    .line 8
    .line 9
    iget-object p3, p2, Lcom/momo/rtcbase/EncodedImage;->frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 10
    .line 11
    invoke-virtual {p3}, Lcom/momo/rtcbase/EncodedImage$FrameType;->getNative()I

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    iget v8, p2, Lcom/momo/rtcbase/EncodedImage;->rotation:I

    .line 16
    .line 17
    iget-boolean v9, p2, Lcom/momo/rtcbase/EncodedImage;->completeFrame:Z

    .line 18
    .line 19
    iget-object v10, p2, Lcom/momo/rtcbase/EncodedImage;->qp:Ljava/lang/Integer;

    .line 20
    .line 21
    move-wide v0, p0

    .line 22
    invoke-static/range {v0 .. v10}, Lcom/momo/rtcbase/VideoEncoderWrapper;->nativeOnEncodedFrame(JLjava/nio/ByteBuffer;IIJIIZLjava/lang/Integer;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static createEncoderCallback(J)Lcom/momo/rtcbase/VideoEncoder$Callback;
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/momo/rtcbase/f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/f;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static getScalingSettingsHigh(Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;)Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;->high:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getScalingSettingsLow(Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;)Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;->low:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getScalingSettingsOn(Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;)Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/VideoEncoder$ScalingSettings;->on:Z

    .line 2
    .line 3
    return p0
.end method

.method private static native nativeOnEncodedFrame(JLjava/nio/ByteBuffer;IIJIIZLjava/lang/Integer;)V
.end method
