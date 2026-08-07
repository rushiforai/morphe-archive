.class public abstract Lcom/immomo/mediacore/sink/SinkBase;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;,
        Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;,
        Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;,
        Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;
    }
.end annotation


# static fields
.field private static final CLASS_LABEL:Ljava/lang/String; = "ConferenceHandle"

.field private static final LOG_TAG:Ljava/lang/String; = "ConferenceHandle"


# instance fields
.field private Headsetpluged:Z

.field private mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

.field private mAudioTrackLock:Ljava/lang/Object;

.field private mAvFlag:I

.field private mBusinessType:I

.field private mChannalName:Ljava/lang/String;

.field private mChannelCount:I

.field private mErrorCode:I

.field private mIsHost:Z

.field private mJsonForPos:Ljava/lang/String;

.field private mMuteStatus:Z

.field private mRoomType:I

.field private mRtmpPath:Ljava/lang/String;

.field private mSampleRate:I

.field private mSecId:Ljava/lang/String;

.field private mSessionId:J

.field private mUserID:J

.field private mVoicebackwardsEnable:Z

.field private serverIP:Ljava/lang/String;

.field private serverPort:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mChannalName:Ljava/lang/String;

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    iput-wide v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mUserID:J

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverIP:Ljava/lang/String;

    .line 15
    .line 16
    const/16 v0, 0x22c3

    .line 17
    .line 18
    iput v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverPort:I

    .line 19
    .line 20
    const-wide/16 v0, 0x22b

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSessionId:J

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mIsHost:Z

    .line 26
    .line 27
    const-string v1, "aaaa"

    .line 28
    .line 29
    iput-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSecId:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    iput-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mJsonForPos:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    iput v2, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAvFlag:I

    .line 36
    .line 37
    const/4 v3, -0x1

    .line 38
    iput v3, p0, Lcom/immomo/mediacore/sink/SinkBase;->mBusinessType:I

    .line 39
    .line 40
    iput v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRoomType:I

    .line 41
    .line 42
    iput-boolean v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mMuteStatus:Z

    .line 43
    .line 44
    iput-boolean v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mVoicebackwardsEnable:Z

    .line 45
    .line 46
    iput-boolean v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->Headsetpluged:Z

    .line 47
    .line 48
    new-instance v3, Ljava/lang/Object;

    .line 49
    .line 50
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v3, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrackLock:Ljava/lang/Object;

    .line 54
    .line 55
    iput-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 56
    .line 57
    const v1, 0xac44

    .line 58
    .line 59
    .line 60
    iput v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSampleRate:I

    .line 61
    .line 62
    iput v2, p0, Lcom/immomo/mediacore/sink/SinkBase;->mChannelCount:I

    .line 63
    .line 64
    iput v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mErrorCode:I

    .line 65
    .line 66
    return-void
.end method

.method public static byteToShort([B)S
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-byte v0, p0, v0

    .line 3
    .line 4
    and-int/lit16 v0, v0, 0xff

    .line 5
    .line 6
    int-to-short v0, v0

    .line 7
    const/4 v1, 0x1

    .line 8
    aget-byte p0, p0, v1

    .line 9
    .line 10
    and-int/lit16 p0, p0, 0xff

    .line 11
    .line 12
    int-to-short p0, p0

    .line 13
    shl-int/lit8 p0, p0, 0x8

    .line 14
    .line 15
    int-to-short p0, p0

    .line 16
    or-int/2addr p0, v0

    .line 17
    int-to-short p0, p0

    .line 18
    return p0
.end method

.method public static shortToByte(S)[B
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [B

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v0, :cond_0

    .line 6
    .line 7
    and-int/lit16 v3, p0, 0xff

    .line 8
    .line 9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Ljava/lang/Integer;->byteValue()B

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    aput-byte v3, v1, v2

    .line 18
    .line 19
    shr-int/lit8 p0, p0, 0x8

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-object v1
.end method


# virtual methods
.method public DeinitAudioTracks()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrackLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->stop()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->release()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public SabineEffectReset()V
    .locals 0

    return-void
.end method

.method public SabineEffectSet(IIF)V
    .locals 0

    return-void
.end method

.method public SetSubVideoPos(JIIII)V
    .locals 0

    return-void
.end method

.method public addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    return-void
.end method

.method public addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    return-void
.end method

.method public addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    return-void
.end method

.method public addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    return-void
.end method

.method public adjustEQ(IZ)V
    .locals 0

    return-void
.end method

.method public adjustEf(II)V
    .locals 0

    return-void
.end method

.method public adjustTune(IZ)V
    .locals 0

    return-void
.end method

.method public changeRole(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public enableAudio(Z)V
    .locals 0

    return-void
.end method

.method public enableAudioVolumeIndication(II)V
    .locals 0

    return-void
.end method

.method public enableCommMode(Z)V
    .locals 0

    return-void
.end method

.method public enableVideo(Z)V
    .locals 0

    return-void
.end method

.method public getAVDiff()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAcodecSendSize()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAgoraEngine()Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getAudioBitRate()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getAudioCacheSize()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAudioRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAudioTxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAudioVideoStatics()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "[(0)]"

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvFlag()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAvFlag:I

    .line 2
    .line 3
    return p0
.end method

.method public getAverageSendBitRateB()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getBusinessType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mBusinessType:I

    .line 2
    .line 3
    return p0
.end method

.method public getChannalName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mChannalName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDefaultAecParam()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getErrorCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mErrorCode:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeadsetStatus()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->Headsetpluged:Z

    .line 2
    .line 3
    return p0
.end method

.method public getJsonForPostion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mJsonForPos:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMasterAudioLevel()F
    .locals 0

    const/high16 p0, 0x3f000000    # 0.5f

    return p0
.end method

.method public getMuteStatus()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mMuteStatus:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPropertyFloat(IF)F
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getPropertyLong(IJ)J
    .locals 0

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public getPublisherVideoHigh()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getPublisherVideoWidth()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getRoomType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRoomType:I

    .line 2
    .line 3
    return p0
.end method

.method public getRtmpPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtmpPathJson(Z)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/mediacore/model/PathModel;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Lcom/immomo/mediacore/model/PathModel;-><init>(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "getRtmpPath:"

    .line 11
    .line 12
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "ConferenceHandle"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/immomo/mediacore/model/PathModel;->toJson()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public getRtmpSendSize()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSecId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSecId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getServerIP()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverIP:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "0.0.0.0"

    .line 2
    .line 3
    return-object p0
.end method

.method public getServerPort()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverPort:I

    .line 2
    .line 3
    return p0
.end method

.method public getSessionID()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSessionId:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSlaveAudioLevel()F
    .locals 0

    const/high16 p0, 0x3f000000    # 0.5f

    return p0
.end method

.method public getStreamerType()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getSurroundMusicDuration()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSurroundMusicPos()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getTxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getUserID()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mUserID:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVcodecSendSize()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoBitRate()I
    .locals 0

    const p0, 0x7a120

    return p0
.end method

.method public getVideoCacheSize()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoFrameRate()I
    .locals 0

    const/16 p0, 0x14

    return p0
.end method

.method public getVideoFreezeCount()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getVideoPacketCache()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoPts()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVideoTxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getVoicebackwardsEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mVoicebackwardsEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getWriteByte()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public ignoreWriterSEI(Z)V
    .locals 0

    return-void
.end method

.method public initAudioTracks(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSampleRate:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/mediacore/sink/SinkBase;->mChannelCount:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrackLock:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->Headsetpluged:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mVoicebackwardsEnable:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 21
    .line 22
    invoke-direct {v1, p1, p2}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->play()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method public initConfApi(Ljava/lang/String;IJJZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverIP:Ljava/lang/String;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverPort:I

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/immomo/mediacore/sink/SinkBase;->mUserID:J

    .line 6
    .line 7
    iput-wide p5, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSessionId:J

    .line 8
    .line 9
    iput-boolean p7, p0, Lcom/immomo/mediacore/sink/SinkBase;->mIsHost:Z

    .line 10
    .line 11
    iput-object p8, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p9, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSecId:Ljava/lang/String;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    iput p2, p0, Lcom/immomo/mediacore/sink/SinkBase;->mErrorCode:I

    .line 17
    .line 18
    const-string p2, ""

    .line 19
    .line 20
    if-nez p8, :cond_0

    .line 21
    .line 22
    iput-object p2, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    if-nez p9, :cond_1

    .line 25
    .line 26
    const-string p3, "aaaa"

    .line 27
    .line 28
    iput-object p3, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSecId:Ljava/lang/String;

    .line 29
    .line 30
    :cond_1
    if-nez p1, :cond_2

    .line 31
    .line 32
    iput-object p2, p0, Lcom/immomo/mediacore/sink/SinkBase;->serverIP:Ljava/lang/String;

    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public isHost()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mIsHost:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public mixAndSetSubVideoPos(JLjava/lang/String;Z)V
    .locals 0

    return-void
.end method

.method public monoToStereo([BI)[B
    .locals 5

    .line 1
    mul-int/lit8 p0, p2, 0x2

    .line 2
    .line 3
    new-array p0, p0, [B

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    if-ge v0, p2, :cond_0

    .line 8
    .line 9
    mul-int/lit8 v2, v1, 0x4

    .line 10
    .line 11
    add-int/lit8 v3, v2, 0x2

    .line 12
    .line 13
    aget-byte v4, p1, v0

    .line 14
    .line 15
    aput-byte v4, p0, v3

    .line 16
    .line 17
    aput-byte v4, p0, v2

    .line 18
    .line 19
    add-int/lit8 v3, v2, 0x1

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x3

    .line 22
    .line 23
    add-int/lit8 v4, v0, 0x1

    .line 24
    .line 25
    aget-byte v4, p1, v4

    .line 26
    .line 27
    aput-byte v4, p0, v2

    .line 28
    .line 29
    aput-byte v4, p0, v3

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-object p0
.end method

.method public monoToStereo_backup([BI)[B
    .locals 7

    .line 1
    div-int/lit8 p0, p2, 0x2

    .line 2
    .line 3
    new-array v0, p0, [S

    .line 4
    .line 5
    new-array v1, p2, [S

    .line 6
    .line 7
    mul-int/lit8 v2, p2, 0x2

    .line 8
    .line 9
    new-array v2, v2, [B

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    :goto_0
    if-ge v4, p0, :cond_0

    .line 14
    .line 15
    aput-short v3, v0, v4

    .line 16
    .line 17
    mul-int/lit8 v5, v4, 0x2

    .line 18
    .line 19
    aget-byte v6, p1, v5

    .line 20
    .line 21
    and-int/lit16 v6, v6, 0xff

    .line 22
    .line 23
    int-to-short v6, v6

    .line 24
    add-int/lit8 v5, v5, 0x1

    .line 25
    .line 26
    aget-byte v5, p1, v5

    .line 27
    .line 28
    and-int/lit16 v5, v5, 0xff

    .line 29
    .line 30
    int-to-short v5, v5

    .line 31
    shl-int/lit8 v5, v5, 0x8

    .line 32
    .line 33
    int-to-short v5, v5

    .line 34
    or-int/2addr v5, v6

    .line 35
    int-to-short v5, v5

    .line 36
    aput-short v5, v0, v4

    .line 37
    .line 38
    add-int/lit8 v4, v4, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move p1, v3

    .line 42
    :goto_1
    if-ge p1, p0, :cond_1

    .line 43
    .line 44
    mul-int/lit8 v4, p1, 0x2

    .line 45
    .line 46
    aget-short v5, v0, p1

    .line 47
    .line 48
    aput-short v5, v1, v4

    .line 49
    .line 50
    add-int/lit8 v4, v4, 0x1

    .line 51
    .line 52
    aget-short v5, v0, p1

    .line 53
    .line 54
    aput-short v5, v1, v4

    .line 55
    .line 56
    add-int/lit8 p1, p1, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move p0, v3

    .line 60
    :goto_2
    if-ge p0, p2, :cond_3

    .line 61
    .line 62
    aget-short p1, v1, p0

    .line 63
    .line 64
    move v0, v3

    .line 65
    :goto_3
    const/4 v4, 0x2

    .line 66
    if-ge v0, v4, :cond_2

    .line 67
    .line 68
    mul-int/lit8 v4, p0, 0x2

    .line 69
    .line 70
    add-int/2addr v4, v0

    .line 71
    new-instance v5, Ljava/lang/Integer;

    .line 72
    .line 73
    and-int/lit16 v6, p1, 0xff

    .line 74
    .line 75
    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5}, Ljava/lang/Integer;->byteValue()B

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    aput-byte v5, v2, v4

    .line 83
    .line 84
    shr-int/lit8 p1, p1, 0x8

    .line 85
    .line 86
    add-int/lit8 v0, v0, 0x1

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    return-object v2
.end method

.method public muteAllRemoteAudioStream(Z)V
    .locals 0

    return-void
.end method

.method public muteAllRemoteVideoStream(Z)V
    .locals 0

    return-void
.end method

.method public muteLocalAudioStream(Z)V
    .locals 0

    return-void
.end method

.method public muteLocalAudioStreamForGame(Z)V
    .locals 0

    return-void
.end method

.method public muteLocalVideoStream(Z)V
    .locals 0

    return-void
.end method

.method public muteRemoteAudioStream(JZ)V
    .locals 0

    return-void
.end method

.method public muteRemoteVideoStream(JZ)V
    .locals 0

    return-void
.end method

.method public notifyUpdateResolution()V
    .locals 0

    return-void
.end method

.method public abstract pause()V
.end method

.method public pausePlaying()V
    .locals 0

    return-void
.end method

.method public pauseRecording()V
    .locals 0

    return-void
.end method

.method public pauseSurroundMusic()V
    .locals 0

    return-void
.end method

.method public postDrawImage(I)V
    .locals 0

    return-void
.end method

.method public prepare()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public abstract release()V
.end method

.method public abstract resume()V
.end method

.method public resumePlaying()V
    .locals 0

    return-void
.end method

.method public resumeRecording()V
    .locals 0

    return-void
.end method

.method public resumeSurroundMusic()V
    .locals 0

    return-void
.end method

.method public seekToSurroundMusic(J)V
    .locals 0

    return-void
.end method

.method public sendAecParam(I)V
    .locals 0

    return-void
.end method

.method public setAudioChannelNum(I)V
    .locals 0

    return-void
.end method

.method public setAudioEncoder(I)V
    .locals 0

    return-void
.end method

.method public setAudioEncodingBitRate(I)V
    .locals 0

    return-void
.end method

.method public setAudioHighQualityParameters(Z)V
    .locals 0

    return-void
.end method

.method public setAudioSamplingRate(I)V
    .locals 0

    return-void
.end method

.method public setAudioSource(I)V
    .locals 0

    return-void
.end method

.method public setAvFlag(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAvFlag:I

    .line 2
    .line 3
    return-void
.end method

.method public setBusinessType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mBusinessType:I

    .line 2
    .line 3
    return-void
.end method

.method public setChannalName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mChannalName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setChannelkey(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setDefaultAudioRoutetoSpeakerphone(Z)V
    .locals 0

    return-void
.end method

.method public setDelayoffset(I)V
    .locals 0

    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setEncryptionMode(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setEncryptionSecret(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setErrorCode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mErrorCode:I

    .line 2
    .line 3
    return-void
.end method

.method public setHeadsetStatus(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->Headsetpluged:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->DeinitAudioTracks()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setHost(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mIsHost:Z

    .line 2
    .line 3
    return-void
.end method

.method public setJsonForPostion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mJsonForPos:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMasterAudioLevel(F)V
    .locals 0

    return-void
.end method

.method public setMuteStatus(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mMuteStatus:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnSurroundMusicStatusListener(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public setParameters(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 0

    return-void
.end method

.method public setPlayBackAudioLevel(F)V
    .locals 0

    return-void
.end method

.method public setPlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V
    .locals 0

    return-void
.end method

.method public setPropertyFloat(IF)V
    .locals 0

    return-void
.end method

.method public setPropertyLong(IJ)V
    .locals 0

    return-void
.end method

.method public setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 0

    return-void
.end method

.method public setRole(I)V
    .locals 0

    return-void
.end method

.method public setRoomMode(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setRoomMode(IZ)V
    .locals 0

    .line 2
    return-void
.end method

.method public setRoomType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRoomType:I

    .line 2
    .line 3
    return-void
.end method

.method public setRtmpPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, ""

    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mErrorCode:I

    .line 11
    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v0, "setRtmpPath:"

    .line 15
    .line 16
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mRtmpPath:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "ConferenceHandle"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setSei(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setSessionID(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mSessionId:J

    .line 2
    .line 3
    return-void
.end method

.method public setSlaveAudioLevel(F)V
    .locals 0

    return-void
.end method

.method public setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setUserID(I)V
    .locals 2

    .line 1
    int-to-long v0, p1

    .line 2
    iput-wide v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mUserID:J

    .line 3
    .line 4
    return-void
.end method

.method public setVideoChannellistener(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public setVideoEncoder(I)V
    .locals 0

    return-void
.end method

.method public setVideoEncodingBitRate(I)V
    .locals 0

    return-void
.end method

.method public setVideoFrameRate(I)V
    .locals 0

    return-void
.end method

.method public setVideoSize(II)V
    .locals 0

    return-void
.end method

.method public setVideoSource(I)V
    .locals 0

    return-void
.end method

.method public setVoicebackwardsEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mVoicebackwardsEnable:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->DeinitAudioTracks()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startAttachStreamer()V
    .locals 0

    return-void
.end method

.method public startPlaying()V
    .locals 0

    return-void
.end method

.method public startRecording()V
    .locals 0

    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 0

    return-void
.end method

.method public startSurroundMusicEx(Ljava/lang/String;ZZI)V
    .locals 0

    return-void
.end method

.method public stereotomono([BI)[B
    .locals 3

    .line 1
    div-int/lit8 p0, p2, 0x2

    .line 2
    .line 3
    new-array p0, p0, [B

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    div-int/lit8 v1, p2, 0x4

    .line 7
    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    mul-int/lit8 v1, v0, 0x2

    .line 11
    .line 12
    aget-byte v2, p1, v0

    .line 13
    .line 14
    aput-byte v2, p0, v1

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    add-int/lit8 v2, v0, 0x3

    .line 19
    .line 20
    aget-byte v2, p1, v2

    .line 21
    .line 22
    aput-byte v2, p0, v1

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x4

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object p0
.end method

.method public stop()V
    .locals 0

    return-void
.end method

.method public stopPlaying()V
    .locals 0

    return-void
.end method

.method public stopRecording()V
    .locals 0

    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    return-void
.end method

.method public updateChannelkey(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public uploadLocalVideo(Z)V
    .locals 0

    return-void
.end method

.method public writeAudio(JLjava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeAudioExtradata(Ljava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeAudioPacket(JLjava/nio/ByteBuffer;II)V
    .locals 0

    return-void
.end method

.method public writeLoopBack([BI)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->Headsetpluged:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mVoicebackwardsEnable:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    new-array v0, p2, [B

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p1, v1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrackLock:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter p1

    .line 18
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/sink/SinkBase;->mAudioTrack:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v0, p2}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->write([BI)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p1

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0

    .line 32
    :cond_1
    return-void
.end method

.method public writeVideo(JLjava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeVideoExtradata(Ljava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeVideoPacket(JLjava/nio/ByteBuffer;II)V
    .locals 0

    return-void
.end method

.method public writeVideoTexture(ILjavax/microedition/khronos/egl/EGLContext;IIJ)V
    .locals 0

    return-void
.end method
