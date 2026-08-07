.class Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/MediaCodecVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DecodedTextureBuffer"
.end annotation


# instance fields
.field private final decodeTimeMs:J

.field private final frameDelayMs:J

.field private final ntpTimeStampMs:J

.field private final presentationTimeStampMs:J

.field private final timeStampMs:J

.field private final videoFrameBuffer:Lcom/momo/rtcbase/VideoFrame$Buffer;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/VideoFrame$Buffer;JJJJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->videoFrameBuffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->presentationTimeStampMs:J

    .line 7
    .line 8
    iput-wide p4, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->timeStampMs:J

    .line 9
    .line 10
    iput-wide p6, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->ntpTimeStampMs:J

    .line 11
    .line 12
    iput-wide p8, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->decodeTimeMs:J

    .line 13
    .line 14
    iput-wide p10, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->frameDelayMs:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getDecodeTimeMs()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "DecodedTextureBuffer"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->decodeTimeMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFrameDelayMs()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "DecodedTextureBuffer"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->frameDelayMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getNtpTimestampMs()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "DecodedTextureBuffer"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->ntpTimeStampMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPresentationTimestampMs()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "DecodedTextureBuffer"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->presentationTimeStampMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTimeStampMs()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "DecodedTextureBuffer"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->timeStampMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVideoFrameBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "DecodedTextureBuffer"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$DecodedTextureBuffer;->videoFrameBuffer:Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 2
    .line 3
    return-object p0
.end method
