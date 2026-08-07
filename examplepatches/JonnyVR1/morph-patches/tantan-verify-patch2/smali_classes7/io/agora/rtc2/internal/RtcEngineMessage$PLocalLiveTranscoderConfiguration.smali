.class public Lio/agora/rtc2/internal/RtcEngineMessage$PLocalLiveTranscoderConfiguration;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PLocalLiveTranscoderConfiguration"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method

.method private marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalTranscoderConfiguration;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->transcodingVideoStreams:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-boolean v0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->syncWithPrimaryCamera:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushBool(Ljava/lang/Boolean;)V

    invoke-direct {p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalLiveTranscoderConfiguration;->marshallVideoEncoderConfiguration(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalTranscoderConfiguration;)V

    iget-object p2, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->transcodingVideoStreams:Ljava/util/ArrayList;

    invoke-direct {p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalLiveTranscoderConfiguration;->marshallTranscodingVideoStream(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V

    return-void
.end method

.method private marshallLocalTranscodingVideoStream(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;)V
    .locals 2

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->sourceType:Lio/agora/rtc2/Constants$VideoSourceType;

    invoke-static {p0}, Lio/agora/rtc2/Constants$VideoSourceType;->getValue(Lio/agora/rtc2/Constants$VideoSourceType;)I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->remoteUserUid:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    const-string p0, ""

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->imageUrl:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->mediaPlayerId:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->x:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->y:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->width:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->height:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->zOrder:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-wide v0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->alpha:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget-boolean p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;->mirror:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushBool(Ljava/lang/Boolean;)V

    return-void
.end method

.method private marshallTranscodingVideoStream(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/agora/rtc2/internal/Marshallable;",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalLiveTranscoderConfiguration;->marshallLocalTranscodingVideoStream(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalTranscoderConfiguration$TranscodingVideoStream;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private marshallVideoEncoderConfiguration(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalTranscoderConfiguration;)V
    .locals 0

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->width:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->height:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->orientationMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;

    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$ORIENTATION_MODE;->getValue()I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->mirrorMode:Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;

    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$MIRROR_MODE_TYPE;->getValue()I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->getValue()I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;->compressionPreference:Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;

    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$COMPRESSION_PREFERENCE;->getValue()I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalTranscoderConfiguration;->videoOutputConfiguration:Lio/agora/rtc2/video/VideoEncoderConfiguration;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->advanceOptions:Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;

    iget-object p0, p0, Lio/agora/rtc2/video/VideoEncoderConfiguration$AdvanceOptions;->encodingPreference:Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;

    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoEncoderConfiguration$ENCODING_PREFERENCE;->getValue()I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    return-void
.end method


# virtual methods
.method public marshall(Lio/agora/rtc2/LocalTranscoderConfiguration;)[B
    .locals 0

    .line 2
    invoke-direct {p0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalLiveTranscoderConfiguration;->marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalTranscoderConfiguration;)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method
