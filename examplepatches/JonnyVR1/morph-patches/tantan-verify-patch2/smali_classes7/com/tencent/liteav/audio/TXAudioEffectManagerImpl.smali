.class public Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/audio/TXAudioEffectManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$AudioEffectManagerAutoCacheHolder;,
        Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$AudioEffectManagerCacheHolder;,
        Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$AudioEffectManagerHolder;
    }
.end annotation


# static fields
.field private static final EFFECT_PLAYER_ID_TYPE:I = 0x2

.field private static final NEW_BGM_PLAYER_ID_TYPE:I = 0x1

.field private static final OLD_BGM_PLAYER_ID_TYPE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "AudioCenter:TXAudioEffectManager"

.field private static final mMainHandler:Landroid/os/Handler;

.field private static final mMusicObserverMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mIdType:I

.field private final mPlayingMusicIDList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMusicObserverMap:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMainHandler:Landroid/os/Handler;

    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->f()Z

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeClassInit()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 10
    .line 11
    iput p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(ILcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;-><init>(I)V

    return-void
.end method

.method public static synthetic access$400(Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(II)J
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$600()Ljava/util/HashMap;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMusicObserverMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object v0
.end method

.method private static convertIdToInt64(II)J
    .locals 2

    int-to-long v0, p0

    const/16 p0, 0x20

    shl-long/2addr v0, p0

    int-to-long p0, p1

    or-long/2addr p0, v0

    return-wide p0
.end method

.method public static getAutoCacheHolder()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$AudioEffectManagerAutoCacheHolder;->access$300()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static getCacheInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$AudioEffectManagerCacheHolder;->access$200()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static getInstance()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$AudioEffectManagerHolder;->access$100()Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static native nativeClassInit()V
.end method

.method private native nativeGetCurrentPositionInMs(J)J
.end method

.method private static native nativeGetDurationMSByPath(Ljava/lang/String;)J
.end method

.method private native nativePause(J)V
.end method

.method private native nativeResume(J)V
.end method

.method private native nativeSeekToPosition(JJ)V
.end method

.method private native nativeSeekToTime(JI)V
.end method

.method private native nativeSetAllVolume(I)V
.end method

.method private native nativeSetChangerType(JI)V
.end method

.method private native nativeSetMuteDataDurationToPublish(JI)V
.end method

.method private native nativeSetPitch(JF)V
.end method

.method private native nativeSetPlayoutSpeedRate(JF)V
.end method

.method private native nativeSetPlayoutVolume(JI)V
.end method

.method private native nativeSetPublishVolume(JI)V
.end method

.method private native nativeSetReverbType(JI)V
.end method

.method private native nativeSetSpeedRate(JF)V
.end method

.method private native nativeSetVolume(JI)V
.end method

.method private native nativeStartPlay(JLjava/lang/String;IZZ)Z
.end method

.method private native nativeStartPlayRange(JJJ)V
.end method

.method private native nativeStopPlay(J)V
.end method

.method public static onEffectFinish(JI)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$3;-><init>(JI)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static onEffectProgress(JJJ)V
    .locals 8

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;

    .line 4
    .line 5
    move-wide v2, p0

    .line 6
    move-wide v4, p2

    .line 7
    move-wide v6, p4

    .line 8
    invoke-direct/range {v1 .. v7}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$5;-><init>(JJJ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static onEffectStart(JI)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMainHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$4;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$4;-><init>(JI)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public enableVoiceEarMonitor(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->enableAudioEarMonitoring(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getMusicCurrentPosInMS(I)J
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeGetCurrentPositionInMs(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public getMusicDurationInMS(Ljava/lang/String;)J
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeGetDurationMSByPath(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public interruptAllMusics()V
    .locals 3

    .line 1
    const-string v0, "AudioCenter:TXAudioEffectManager"

    .line 2
    .line 3
    const-string v1, "interruptAllMusics"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-direct {p0, v1, v2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativePause(J)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method public pausePlayMusic(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativePause(J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public recoverAllMusics()V
    .locals 3

    .line 1
    const-string v0, "AudioCenter:TXAudioEffectManager"

    .line 2
    .line 3
    const-string v1, "recoverAllMusics"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-direct {p0, v1, v2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeResume(J)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method public resumePlayMusic(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeResume(J)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public seekMusicToPosInBytes(IJ)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2, p3}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSeekToPosition(JJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public seekMusicToPosInMS(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSeekToTime(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setAllMusicVolume(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetAllVolume(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setAudioPlayoutVolume(I)V
    .locals 0

    .line 1
    int-to-float p0, p1

    .line 2
    const/high16 p1, 0x42c80000    # 100.0f

    .line 3
    .line 4
    div-float/2addr p0, p1

    .line 5
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setMixingPlayoutVolume(F)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setMusicChangerType(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetChangerType(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicObserver(ILcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$1;-><init>(Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;I)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object p1, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMainHandler:Landroid/os/Handler;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    if-ne p0, p2, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setMusicPitch(IF)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetPitch(JF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicPlayoutSpeedRate(IF)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetPlayoutSpeedRate(JF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicPlayoutVolume(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetPlayoutVolume(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicPublishVolume(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetPublishVolume(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicReverbType(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetReverbType(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicSpeedRate(IF)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetSpeedRate(JF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMusicVolume(II)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMusicVolume "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioCenter:TXAudioEffectManager"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 21
    .line 22
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetVolume(JI)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public setMuteDataDurationToPublish(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-direct {p0, v0, v1, p2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeSetMuteDataDurationToPublish(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setVoiceCaptureVolume(I)V
    .locals 0

    .line 1
    int-to-float p0, p1

    .line 2
    const/high16 p1, 0x42c80000    # 100.0f

    .line 3
    .line 4
    div-float/2addr p0, p1

    .line 5
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setSoftwareCaptureVolume(F)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setVoiceChangerType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setVoiceChangerType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceChangerType;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setVoiceEarMonitorVolume(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioEarMonitoringVolume(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setVoiceReverbType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setReverbType(Lcom/tencent/liteav/audio/TXAudioEffectManager$TXVoiceReverbType;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public startPlayMusic(Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;)Z
    .locals 14

    .line 1
    const-string v0, "AudioCenter:TXAudioEffectManager"

    .line 2
    .line 3
    const-string v1, "startPlay"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v0, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->startTimeMS:J

    .line 9
    .line 10
    iget-wide v2, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->endTimeMS:J

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    cmp-long v6, v0, v4

    .line 15
    .line 16
    if-gez v6, :cond_0

    .line 17
    .line 18
    move-wide v10, v4

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-wide v10, v0

    .line 21
    :goto_0
    cmp-long v0, v2, v4

    .line 22
    .line 23
    if-gez v0, :cond_1

    .line 24
    .line 25
    move-wide v12, v4

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move-wide v12, v2

    .line 28
    :goto_1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 29
    .line 30
    iget v1, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->id:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_2
    move-object v7, p0

    .line 58
    move-wide v8, v3

    .line 59
    invoke-direct/range {v7 .. v13}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeStartPlayRange(JJJ)V

    .line 60
    .line 61
    .line 62
    move-object v2, v7

    .line 63
    move-wide v3, v8

    .line 64
    iget-object v5, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->path:Ljava/lang/String;

    .line 65
    .line 66
    iget v6, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->loopCount:I

    .line 67
    .line 68
    iget-boolean v7, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->publish:Z

    .line 69
    .line 70
    iget-boolean v8, p1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->isShortFile:Z

    .line 71
    .line 72
    invoke-direct/range {v2 .. v8}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeStartPlay(JLjava/lang/String;IZZ)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method

.method public stopAllMusics()V
    .locals 5

    .line 1
    const-string v0, "AudioCenter:TXAudioEffectManager"

    .line 2
    .line 3
    const-string v1, "stopAllMusics"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-direct {p0, v1, v2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeStopPlay(J)V

    .line 31
    .line 32
    .line 33
    sget-object v3, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mMainHandler:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v4, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$2;

    .line 36
    .line 37
    invoke-direct {v4, p0, v1, v2}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl$2;-><init>(Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;J)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public stopPlayMusic(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mIdType:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->convertIdToInt64(II)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p1, p0, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->mPlayingMusicIDList:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/audio/TXAudioEffectManagerImpl;->nativeStopPlay(J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
