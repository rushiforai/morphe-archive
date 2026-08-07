.class public Lio/agora/rtc2/video/EncodedVideoFrameInfo;
.super Ljava/lang/Object;


# instance fields
.field public captureTimeMs:J

.field public codecType:I

.field public decodeTimeMs:J

.field public frameType:I

.field public framesPerSecond:I

.field public height:I

.field public rotation:I

.field public streamType:I

.field public trackId:I

.field public uid:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->uid:I

    const/4 v1, 0x2

    iput v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->codecType:I

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->width:I

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->height:I

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->framesPerSecond:I

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->frameType:I

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->rotation:I

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->trackId:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->captureTimeMs:J

    iput-wide v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->decodeTimeMs:J

    iput v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->streamType:I

    return-void
.end method

.method public constructor <init>(IIIIIIIJJII)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->codecType:I

    iput p2, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->width:I

    iput p3, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->height:I

    iput p4, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->framesPerSecond:I

    iput p5, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->frameType:I

    iput p6, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->rotation:I

    iput p7, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->trackId:I

    iput-wide p8, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->captureTimeMs:J

    iput-wide p10, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->decodeTimeMs:J

    iput p12, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->uid:I

    iput p13, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->streamType:I

    return-void
.end method


# virtual methods
.method public getCaptureTimeMs()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->captureTimeMs:J

    return-wide v0
.end method

.method public getCodecType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->codecType:I

    return p0
.end method

.method public getDecodeTimeMs()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->decodeTimeMs:J

    return-wide v0
.end method

.method public getFrameType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->frameType:I

    return p0
.end method

.method public getFramesPerSecond()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->framesPerSecond:I

    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->height:I

    return p0
.end method

.method public getRotation()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->rotation:I

    return p0
.end method

.method public getStreamType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->streamType:I

    return p0
.end method

.method public getTrackId()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->trackId:I

    return p0
.end method

.method public getUid()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->uid:I

    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->width:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "codecType="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->codecType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " framesPerSecond="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->framesPerSecond:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " frameType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->frameType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " rotation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->rotation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " trackId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->trackId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " captureTimeMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->captureTimeMs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " decodeTimeMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->decodeTimeMs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->uid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " streamType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lio/agora/rtc2/video/EncodedVideoFrameInfo;->streamType:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
