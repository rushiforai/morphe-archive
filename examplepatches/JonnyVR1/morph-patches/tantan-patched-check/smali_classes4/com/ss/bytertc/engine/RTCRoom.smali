.class public abstract Lcom/ss/bytertc/engine/RTCRoom;
.super Lcom/ss/bytertc/engine/RTSRoom;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/RTSRoom;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract destroy()V
.end method

.method public abstract enableSubscribeLocalStream(Z)I
.end method

.method public abstract getCallId()Ljava/lang/String;
.end method

.method public abstract getPanoramicVideo()Lcom/ss/bytertc/engine/video/IPanoramicVideo;
.end method

.method public abstract getRangeAudio()Lcom/ss/bytertc/engine/audio/IRangeAudio;
.end method

.method public abstract getRoomId()Ljava/lang/String;
.end method

.method public abstract getSpatialAudio()Lcom/ss/bytertc/engine/audio/ISpatialAudio;
.end method

.method public abstract joinRoom(Ljava/lang/String;Lcom/ss/bytertc/engine/UserInfo;ZLcom/ss/bytertc/engine/RTCRoomConfig;)I
.end method

.method public abstract pauseAllSubscribedStreamAudio()I
.end method

.method public abstract pauseAllSubscribedStreamVideo()I
.end method

.method public abstract pauseForwardStreamToAllRooms()I
.end method

.method public abstract publishScreenAudio(Z)I
.end method

.method public abstract publishScreenVideo(Z)I
.end method

.method public abstract publishStreamAudio(Z)I
.end method

.method public abstract publishStreamVideo(Z)I
.end method

.method public abstract resumeAllSubscribedStreamAudio()I
.end method

.method public abstract resumeAllSubscribedStreamVideo()I
.end method

.method public abstract resumeForwardStreamToAllRooms()I
.end method

.method public abstract setAudioSelectionConfig(Lcom/ss/bytertc/engine/type/AudioSelectionPriority;)I
.end method

.method public abstract setMultiDeviceAVSync(Ljava/lang/String;)I
.end method

.method public abstract setRTCRoomEventHandler(Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;)I
.end method

.method public abstract setRemoteRoomAudioPlaybackVolume(I)I
.end method

.method public abstract setRemoteSimulcastStreamType(Ljava/lang/String;Lcom/ss/bytertc/engine/data/SimulcastStreamType;)I
.end method

.method public abstract setRoomExtraInfo(Ljava/lang/String;Ljava/lang/String;)J
.end method

.method public abstract setUserVisibility(Z)I
.end method

.method public abstract startForwardStreamToRooms(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/ForwardStreamInfo;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract startSubtitle(Lcom/ss/bytertc/engine/type/SubtitleConfig;)I
.end method

.method public abstract stopForwardStreamToRooms()I
.end method

.method public abstract stopSubtitle()I
.end method

.method public abstract subscribeAllStreamsAudio(Z)I
.end method

.method public abstract subscribeAllStreamsVideo(Z)I
.end method

.method public abstract subscribeScreenAudio(Ljava/lang/String;Z)I
.end method

.method public abstract subscribeScreenVideo(Ljava/lang/String;Z)I
.end method

.method public abstract subscribeStreamAudio(Ljava/lang/String;Z)I
.end method

.method public abstract subscribeStreamVideo(Ljava/lang/String;Z)I
.end method

.method public abstract updateForwardStreamToRooms(Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/ForwardStreamInfo;",
            ">;)I"
        }
    .end annotation
.end method
