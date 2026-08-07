.class public interface abstract Lcom/tencent/iliveroom/IOneSecAdapter;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
.end method

.method public abstract clearDelegate()V
.end method

.method public abstract clearLocalMixConfig()V
.end method

.method public abstract clearMixTranscodingConfig()V
.end method

.method public abstract connectOtherRoom(Ljava/lang/String;J)V
.end method

.method public abstract destroy()V
.end method

.method public abstract disconnectOtherRoom()V
.end method

.method public abstract enableAudioMessage(Z)V
.end method

.method public abstract enableEncSmallVideoStream(ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)I
.end method

.method public abstract getAVStatistic()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;
.end method

.method public abstract getMusicCurrentPosition()J
.end method

.method public abstract getMusicDuration()I
.end method

.method public abstract joinRoom(Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V
.end method

.method public abstract muteAllRemoteAudio(Z)V
.end method

.method public abstract muteAllRemoteVideo(Z)V
.end method

.method public abstract muteLocalAudio(Z)V
.end method

.method public abstract muteLocalVideo(Z)V
.end method

.method public abstract muteRemoteAudio(JZ)V
.end method

.method public abstract muteRemoteVideo(JZ)V
.end method

.method public abstract pause()V
.end method

.method public abstract pauseMusic()V
.end method

.method public abstract playEffectWithId(ILjava/lang/String;ZZ)V
.end method

.method public abstract playMusicWithUrl(Ljava/lang/String;ZI)V
.end method

.method public abstract quitRoom()V
.end method

.method public abstract removeDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
.end method

.method public abstract resume()V
.end method

.method public abstract resumeMusic()Z
.end method

.method public abstract sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I
.end method

.method public abstract sendMessageEx([B)Z
.end method

.method public abstract sendStreamMessage(I[BZZ)Z
.end method

.method public abstract setAudioDelegate(Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V
.end method

.method public abstract setAudioExpandBlockThreshold(I)V
.end method

.method public abstract setAudioExpandCountPerBlock(I)V
.end method

.method public abstract setAudioMode(I)V
.end method

.method public abstract setAudioVolumeIndication(I)V
.end method

.method public abstract setCustomVideoParam(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;I)V
.end method

.method public abstract setEffectsVolume(D)I
.end method

.method public abstract setLocalMixConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V
.end method

.method public abstract setLogPath(Ljava/lang/String;)V
.end method

.method public abstract setMicVolume(F)V
.end method

.method public abstract setMixTranscodingConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V
.end method

.method public abstract setMusicPitch(I)I
.end method

.method public abstract setMusicPosition(I)I
.end method

.method public abstract setMusicVolume(F)V
.end method

.method public abstract setPlaybackVolume(F)V
.end method

.method public abstract setPriorRemoteVideoStreamType(I)I
.end method

.method public abstract setRemoteVideoStreamType(Ljava/lang/String;I)I
.end method

.method public abstract setSurfaceSize(JII)V
.end method

.method public abstract setVideoRenderDelegate(JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V
.end method

.method public abstract setVolumeOfEffect(ID)I
.end method

.method public abstract setVolumeType(I)V
.end method

.method public abstract startPublishCDNStream(Ljava/lang/String;)V
.end method

.method public abstract startRemoteRender(JLandroid/view/SurfaceView;)V
.end method

.method public abstract startRemoteRender(JLandroid/view/TextureView;)V
.end method

.method public abstract stopAllEffect()V
.end method

.method public abstract stopAllRemoteRender()V
.end method

.method public abstract stopEffectWithId(I)V
.end method

.method public abstract stopMusic()V
.end method

.method public abstract stopPublishCDNStream()V
.end method

.method public abstract stopRemoteRender(J)V
.end method

.method public abstract switchRole(I)V
.end method
