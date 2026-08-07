.class public Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SlientPlayer"


# instance fields
.field private mAudioFormat:I

.field private mChannelConfig:I

.field private mIsPlaying:Z

.field private mPlaybackThread:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;

.field private mRequireDeepBuffer:Z

.field private mSampleRate:I

.field private mTrack:Landroid/media/AudioTrack;

.field private mTrackBufSize:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mTrack:Landroid/media/AudioTrack;

    .line 6
    .line 7
    const v0, 0xac44

    .line 8
    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mSampleRate:I

    .line 11
    .line 12
    const/16 v1, 0xc

    .line 13
    .line 14
    iput v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mChannelConfig:I

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    iput v2, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mAudioFormat:I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    iput-boolean v3, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mRequireDeepBuffer:Z

    .line 21
    .line 22
    iput-boolean v3, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mIsPlaying:Z

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mTrackBufSize:I

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mChannelConfig:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mAudioFormat:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mTrackBufSize:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mRequireDeepBuffer:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public isPlaying()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mIsPlaying:Z

    .line 2
    .line 3
    return p0
.end method

.method public play()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mIsPlaying:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mPlaybackThread:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mIsPlaying:Z

    .line 12
    .line 13
    new-instance v0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;-><init>(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mPlaybackThread:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public setRequireDeepBuffer(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mRequireDeepBuffer:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSampleRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mSampleRate:I

    .line 2
    .line 3
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mPlaybackThread:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mIsPlaying:Z

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->closeThread()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->mPlaybackThread:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
