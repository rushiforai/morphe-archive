.class public Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$TXCMultAudioTrackPlayerHolder;,
        Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAudioMode:I

.field private mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

.field private volatile mAudioTrackStarted:Z

.field private mBits:I

.field private mChannel:I

.field private mContext:Landroid/content/Context;

.field private volatile mIsStarted:Z

.field private mMute:Z

.field private mSampleRate:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "AudioCenter:"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->TAG:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mMute:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mIsStarted:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioTrackStarted:Z

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    iput v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioMode:I

    .line 17
    .line 18
    const v0, 0xbb80

    .line 19
    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mSampleRate:I

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    iput v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mChannel:I

    .line 25
    .line 26
    const/16 v0, 0x10

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mBits:I

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->nativeClassInit()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;-><init>()V

    return-void
.end method

.method public static synthetic access$100(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mChannel:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mBits:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$502(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioTrackStarted:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$600(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioMode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)[B
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->nativeGetMixedTracksDataToAudioTrack()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$900(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mMute:Z

    .line 2
    .line 3
    return p0
.end method

.method public static getInstance()Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$TXCMultAudioTrackPlayerHolder;->getInstance()Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private native nativeClassInit()V
.end method

.method private native nativeGetMixedTracksDataToAudioTrack()[B
.end method


# virtual methods
.method public isPlaying()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mIsStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized setAudioMode(Landroid/content/Context;I)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mContext:Landroid/content/Context;

    .line 3
    .line 4
    iput p2, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioMode:I

    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioTrackStarted:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget-object p1, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->TAG:Ljava/lang/String;

    .line 11
    .line 12
    const-string p2, "mult-track-player setAudioRoute~"

    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    sget-object p1, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->TAG:Ljava/lang/String;

    .line 21
    .line 22
    const-string p2, "mult-track-player do\'not setAudioRoute~"

    .line 23
    .line 24
    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    :goto_0
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p1
.end method

.method public setMute(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mMute:Z

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "mult-track-player start!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mIsStarted:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string p0, "mult-track-player can not start because of has started!"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mSampleRate:I

    .line 19
    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    iget v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mChannel:I

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mIsStarted:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

    .line 31
    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    new-instance v1, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;

    .line 35
    .line 36
    const-string v2, "AUDIO_TRACK"

    .line 37
    .line 38
    invoke-direct {v1, p0, v2}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$1;-><init>(Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;->startLoop()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 49
    .line 50
    .line 51
    :cond_2
    const-string p0, "mult-track-player thread start finish!"

    .line 52
    .line 53
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, "strat mult-track-player failed with invalid audio info , samplerate:"

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget v2, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mSampleRate:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v2, ", channels:"

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget p0, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mChannel:I

    .line 75
    .line 76
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public stop()V
    .locals 3

    .line 1
    sget-object v0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "mult-track-player stop!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mIsStarted:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string p0, "mult-track-player can not stop because of not started yet!"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;->stopLoop()V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioThread:Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer$AudioTrackThread;

    .line 27
    .line 28
    :cond_1
    const/4 v1, 0x0

    .line 29
    iput v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioMode:I

    .line 30
    .line 31
    iput-object v2, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mAudioTrackStarted:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/tencent/liteav/audio/impl/Play/TXCMultAudioTrackPlayer;->mIsStarted:Z

    .line 36
    .line 37
    const-string p0, "mult-track-player stop finish!"

    .line 38
    .line 39
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
