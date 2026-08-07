.class public Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PLiveTranscoding"
.end annotation


# static fields
.field private static final SERVER_TYPE:S = 0x0s

.field private static final URI:S = 0x17s


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method

.method private marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/live/LiveTranscoding;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    const/16 v0, 0x17

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->videoGop:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->videoFramerate:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->videoCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;

    invoke-static {v0}, Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;->getValue(Lio/agora/rtc2/live/LiveTranscoding$VideoCodecProfileType;)I

    move-result v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->videoCodecType:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

    invoke-static {v0}, Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;->getValue(Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;)I

    move-result v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->videoBitrate:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    invoke-virtual {p2}, Lio/agora/rtc2/live/LiveTranscoding;->getWatermarkList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;->marshallWatermarks(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V

    invoke-virtual {p2}, Lio/agora/rtc2/live/LiveTranscoding;->getBackgroundImageList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;->marshallBackgroundImage(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V

    iget-boolean v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->lowLatency:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushBool(Ljava/lang/Boolean;)V

    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->audioSampleRate:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    invoke-static {v0}, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->getValue(Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;)I

    move-result v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->audioBitrate:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->audioChannels:I

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    invoke-static {v0}, Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;->getValue(Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;)I

    move-result v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    const v1, 0xffffff

    and-int/2addr v0, v1

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    iput-object v1, p2, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    :cond_0
    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->metadata:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object v1, p2, Lio/agora/rtc2/live/LiveTranscoding;->metadata:Ljava/lang/String;

    :cond_1
    iget-object v0, p2, Lio/agora/rtc2/live/LiveTranscoding;->metadata:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    invoke-virtual {p2}, Lio/agora/rtc2/live/LiveTranscoding;->getAdvancedFeatures()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    invoke-virtual {p2}, Lio/agora/rtc2/live/LiveTranscoding;->getAdvancedFeatures()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p1, v1}, Lio/agora/rtc2/internal/Marshallable;->pushBool(Ljava/lang/Boolean;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Lio/agora/rtc2/live/LiveTranscoding;->getUserCount()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    invoke-virtual {p2}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;->marshallUserConfig(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)V

    goto :goto_1

    :cond_3
    return-void
.end method

.method private marshallBackgroundImage(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/agora/rtc2/internal/Marshallable;",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/video/AgoraImage;",
            ">;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    return-void

    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/video/AgoraImage;

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;->marshallImage(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/AgoraImage;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private marshallImage(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/AgoraImage;)V
    .locals 2

    iget-object p0, p2, Lio/agora/rtc2/video/AgoraImage;->url:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    iget p0, p2, Lio/agora/rtc2/video/AgoraImage;->x:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/video/AgoraImage;->y:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/video/AgoraImage;->width:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/video/AgoraImage;->height:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/video/AgoraImage;->zOrder:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-wide v0, p2, Lio/agora/rtc2/video/AgoraImage;->alpha:D

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    return-void
.end method

.method private marshallUserConfig(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)V
    .locals 2

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->userId:Ljava/lang/String;

    if-nez p0, :cond_0

    const-string p0, ""

    :cond_0
    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->zOrder:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    float-to-double v0, p0

    invoke-virtual {p1, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushDouble(D)V

    iget p0, p2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->audioChannel:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    return-void
.end method

.method private marshallWatermarks(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/agora/rtc2/internal/Marshallable;",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/video/AgoraImage;",
            ">;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    return-void

    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/video/AgoraImage;

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;->marshallImage(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/video/AgoraImage;)V

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public marshall(Lio/agora/rtc2/live/LiveTranscoding;)[B
    .locals 0

    .line 2
    invoke-direct {p0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineMessage$PLiveTranscoding;->marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/live/LiveTranscoding;)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method
