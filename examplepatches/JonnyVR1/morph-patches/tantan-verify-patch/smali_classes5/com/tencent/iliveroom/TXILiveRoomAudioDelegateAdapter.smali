.class public Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;
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
.method public onEffectPlayError(II)V
    .locals 0

    return-void
.end method

.method public onEffectPlayFinish(I)V
    .locals 0

    return-void
.end method

.method public onMusicPlayBegin()V
    .locals 0

    return-void
.end method

.method public onMusicPlayError(I)V
    .locals 0

    return-void
.end method

.method public onMusicPlayFinish()V
    .locals 0

    return-void
.end method

.method public onPlayPcmData(JLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onPlaybackAudioFrame(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onRecordAudioFrame(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onReportAudioVolumeIndicationOfSpeakers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/iliveroom/TXIAudioVolumeInfo;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
