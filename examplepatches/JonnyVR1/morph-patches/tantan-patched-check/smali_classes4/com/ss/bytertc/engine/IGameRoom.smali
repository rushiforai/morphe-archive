.class public abstract Lcom/ss/bytertc/engine/IGameRoom;
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


# virtual methods
.method public abstract destroy()V
.end method

.method public abstract enableAudioReceive(Ljava/lang/String;Z)I
.end method

.method public abstract enableAudioSend(Z)I
.end method

.method public abstract enableMicrophone(Z)I
.end method

.method public abstract enableSpeakerphone(Z)I
.end method

.method public abstract getRangeAudio()Lcom/ss/bytertc/engine/audio/IRangeAudio;
.end method

.method public abstract joinRoom(Ljava/lang/String;Lcom/ss/bytertc/engine/UserInfo;)I
.end method

.method public abstract leaveRoom()I
.end method

.method public abstract setRTCRoomEventHandler(Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;)I
.end method

.method public abstract setRemoteRoomAudioPlaybackVolume(I)I
.end method

.method public abstract updateToken(Ljava/lang/String;)I
.end method
