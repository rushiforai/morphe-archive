.class public Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/d$d;
.implements Lcom/immomo/moment/mediautils/d$b;
.implements Lcom/immomo/moment/mediautils/d$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;,
        Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;,
        Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnSeekCompleteListener;,
        Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;
    }
.end annotation


# static fields
.field public static final AUDIO_NOT_FOUND:I = 0x3

.field public static final DECODER_ERROR:I = 0x0

.field public static final PLAYER_ERROR:I = 0x2

.field public static final PROCESSOR_ERROR:I = 0x1


# instance fields
.field private final TAG:Ljava/lang/String;

.field private decodeFinished:Z

.field private disableCodec:Z

.field private mAudioDecoder:Lcom/immomo/moment/mediautils/b;

.field private mAudioPlayer:Lcom/immomo/moment/mediautils/d;

.field private mDecodeSync:Ljava/lang/Object;

.field private volatile mDecoderPaused:Z

.field private mDuration:I

.field private mEnd:I

.field private mHandler:Landroid/os/Handler;

.field private volatile mIgnoreCount:Z

.field private mIsLooping:Z

.field private mIsReachEnd:Z

.field private mIsUseSoftAudioDecoder:Z

.field private mNeedSeekRange:Z

.field private mOnErrorDotDataListener:Ll/apw;

.field private mOnErrorListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

.field private mOnPlayPositionListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

.field private mOnPreparedListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

.field private mPath:Ljava/lang/String;

.field private mPlayerState:I

.field private mSampleBits:I

.field private mSampleChannels:I

.field private mSampleRate:I

.field private mScaleProcessor:Ll/ed1;

.field private mSeekTime:I

.field private mSpeed:F

.field private mStart:I

.field private mSync:Ljava/lang/Object;

.field private mVolume:F

.field private mVolumeProcessor:Ll/rd1;

.field private serveCode:I

.field private final state_paused:I

.field private final state_playing:I

.field private final state_prepared:I

.field private final state_preparing:I

.field private final state_uninitialized:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 152
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 5

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    const-string v0, "AudioSpeedControlPlayer"

    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->TAG:Ljava/lang/String;

    const/4 v1, 0x0

    .line 124
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_uninitialized:I

    const/4 v2, 0x1

    .line 125
    iput v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_preparing:I

    const/4 v3, 0x2

    .line 126
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_prepared:I

    const/4 v4, 0x3

    .line 127
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_paused:I

    const/4 v4, 0x4

    .line 128
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_playing:I

    .line 129
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 130
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsUseSoftAudioDecoder:Z

    const v4, 0xac44

    .line 131
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleRate:I

    const/16 v4, 0x10

    .line 132
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleBits:I

    .line 133
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleChannels:I

    .line 134
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDuration:I

    const/high16 v3, 0x3f800000    # 1.0f

    .line 135
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSpeed:F

    .line 136
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolume:F

    const/4 v3, -0x1

    .line 137
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSeekTime:I

    .line 138
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsLooping:Z

    .line 139
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 140
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 141
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 142
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 143
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 144
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecodeSync:Ljava/lang/Object;

    .line 145
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->disableCodec:Z

    .line 146
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsReachEnd:Z

    const/4 v1, 0x0

    .line 147
    iput-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorDotDataListener:Ll/apw;

    const v1, 0x493e0

    .line 148
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->serveCode:I

    .line 149
    const-string v1, "create"

    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mHandler:Landroid/os/Handler;

    .line 151
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->disableCodec:Z

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioSpeedControlPlayer"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_uninitialized:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    iput v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_preparing:I

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_prepared:I

    .line 16
    .line 17
    const/4 v4, 0x3

    .line 18
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_paused:I

    .line 19
    .line 20
    const/4 v4, 0x4

    .line 21
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->state_playing:I

    .line 22
    .line 23
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsUseSoftAudioDecoder:Z

    .line 26
    .line 27
    const v4, 0xac44

    .line 28
    .line 29
    .line 30
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleRate:I

    .line 31
    .line 32
    const/16 v4, 0x10

    .line 33
    .line 34
    iput v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleBits:I

    .line 35
    .line 36
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleChannels:I

    .line 37
    .line 38
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 39
    .line 40
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 41
    .line 42
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDuration:I

    .line 43
    .line 44
    const/high16 v3, 0x3f800000    # 1.0f

    .line 45
    .line 46
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSpeed:F

    .line 47
    .line 48
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolume:F

    .line 49
    .line 50
    const/4 v3, -0x1

    .line 51
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSeekTime:I

    .line 52
    .line 53
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsLooping:Z

    .line 54
    .line 55
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 56
    .line 57
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 58
    .line 59
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 60
    .line 61
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 62
    .line 63
    new-instance v2, Ljava/lang/Object;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 69
    .line 70
    new-instance v2, Ljava/lang/Object;

    .line 71
    .line 72
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecodeSync:Ljava/lang/Object;

    .line 76
    .line 77
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->disableCodec:Z

    .line 78
    .line 79
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsReachEnd:Z

    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    iput-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorDotDataListener:Ll/apw;

    .line 83
    .line 84
    const v1, 0x493e0

    .line 85
    .line 86
    .line 87
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->serveCode:I

    .line 88
    .line 89
    const-string v1, "create"

    .line 90
    .line 91
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Landroid/os/Handler;

    .line 95
    .line 96
    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mHandler:Landroid/os/Handler;

    .line 100
    .line 101
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->disableCodec:Z

    .line 102
    .line 103
    iput-boolean p2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsUseSoftAudioDecoder:Z

    .line 104
    .line 105
    if-eqz p2, :cond_0

    .line 106
    .line 107
    const-string p0, "Soft"

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_0
    const-string p0, "Hard"

    .line 111
    .line 112
    :goto_0
    const-string p1, "AudioDecoderType:"

    .line 113
    .line 114
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->initAudioDecoder()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1000(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->initAudioPlayer()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1100(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnPreparedListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1400(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsReachEnd:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1402(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsReachEnd:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1500(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1700(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecodeSync:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1800(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1902(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ll/apw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorDotDataListener:Ll/apw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->serveCode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$602(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$702(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleBits:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$802(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleChannels:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$902(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleRate:I

    .line 2
    .line 3
    return p1
.end method

.method private initAudioDecoder()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsUseSoftAudioDecoder:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/immomo/moment/mediautils/c;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/c;-><init>()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v0, Lcom/immomo/moment/mediautils/a;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/a;-><init>()V

    .line 18
    .line 19
    .line 20
    :goto_0
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 23
    .line 24
    new-instance v1, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;-><init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/b;->i(Lcom/immomo/moment/mediautils/b$a;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/b;->h(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPath:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/b;->e(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    return v1

    .line 51
    :cond_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/b;->a()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    long-to-int v0, v0

    .line 58
    div-int/lit16 v0, v0, 0x3e8

    .line 59
    .line 60
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDuration:I

    .line 61
    .line 62
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 63
    .line 64
    const-wide/16 v2, 0x0

    .line 65
    .line 66
    int-to-long v4, v0

    .line 67
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/immomo/moment/mediautils/b;->g(JJ)V

    .line 68
    .line 69
    .line 70
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 71
    .line 72
    new-instance v1, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;-><init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/b;->j(Lcom/immomo/moment/mediautils/b$b;)V

    .line 78
    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0
.end method

.method private initAudioPlayer()Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ed1;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ed1;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ll/rd1;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/rd1;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 24
    .line 25
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleRate:I

    .line 26
    .line 27
    iget v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleBits:I

    .line 28
    .line 29
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleChannels:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3}, Ll/ed1;->d(III)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 35
    .line 36
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleRate:I

    .line 37
    .line 38
    iget v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleBits:I

    .line 39
    .line 40
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleChannels:I

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, v3}, Ll/bc1;->d(III)V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v1, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;

    .line 51
    .line 52
    iget v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDuration:I

    .line 53
    .line 54
    int-to-long v4, v2

    .line 55
    iget v6, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSpeed:F

    .line 56
    .line 57
    const-wide/16 v2, 0x0

    .line 58
    .line 59
    invoke-direct/range {v1 .. v6}, Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;-><init>(JJF)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ll/ed1;->g(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/ed1;->a()Z

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 76
    .line 77
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolume:F

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/rd1;->g(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/bc1;->a()Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 88
    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    new-instance v0, Lcom/immomo/moment/mediautils/d;

    .line 92
    .line 93
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/d;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 97
    .line 98
    :cond_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Lcom/immomo/moment/mediautils/d;->s(Lcom/immomo/moment/mediautils/d$d;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 104
    .line 105
    new-instance v1, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;-><init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/d;->u(Ll/spw;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 114
    .line 115
    invoke-virtual {v0, p0}, Lcom/immomo/moment/mediautils/d;->s(Lcom/immomo/moment/mediautils/d$d;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Lcom/immomo/moment/mediautils/d;->r(Lcom/immomo/moment/mediautils/d$b;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 124
    .line 125
    invoke-virtual {v0, p0}, Lcom/immomo/moment/mediautils/d;->t(Lcom/immomo/moment/mediautils/d$a;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 129
    .line 130
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleRate:I

    .line 131
    .line 132
    iget v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleBits:I

    .line 133
    .line 134
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSampleChannels:I

    .line 135
    .line 136
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/moment/mediautils/d;->n(III)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_3

    .line 141
    .line 142
    const/4 p0, 0x0

    .line 143
    return p0

    .line 144
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/d;->j(Ll/bc1;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 152
    .line 153
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/d;->j(Ll/bc1;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/d;->m()V

    .line 161
    .line 162
    .line 163
    const/4 p0, 0x1

    .line 164
    return p0
.end method

.method private resetState()V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSpeed:F

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 7
    .line 8
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDuration:I

    .line 11
    .line 12
    const-string v1, ""

    .line 13
    .line 14
    iput-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPath:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsLooping:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSeekTime:I

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 27
    .line 28
    return-void
.end method

.method private resume()V
    .locals 3

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "resume"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/d;->q()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 27
    .line 28
    :cond_1
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method private seek(I)V
    .locals 3

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "seek   =  "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seekWithOutReset(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/d;->p()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/ed1;->c()Z

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 44
    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/bc1;->c()Z

    .line 48
    .line 49
    .line 50
    :cond_2
    const/4 p1, 0x0

    .line 51
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsReachEnd:Z

    .line 52
    .line 53
    monitor-exit v0

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method private seekWithOutReset(I)V
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-string v2, "AudioSpeedControlPlayer"

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "seekWithoutReset   =  "

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v2, v3}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v2

    .line 27
    :try_start_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 36
    .line 37
    iget-object v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 38
    .line 39
    mul-int/lit16 p1, p1, 0x3e8

    .line 40
    .line 41
    int-to-long v5, p1

    .line 42
    invoke-virtual {v4, v5, v6}, Lcom/immomo/moment/mediautils/b;->d(J)V

    .line 43
    .line 44
    .line 45
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    const-string p0, "AudioSpeedControlPlayer"

    .line 52
    .line 53
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v2, "seekWithoutReset  time cost =   "

    .line 56
    .line 57
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    sub-long/2addr v2, v0

    .line 65
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p0, p1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :goto_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    throw p0
.end method


# virtual methods
.method public getDuration()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDuration:I

    .line 2
    .line 3
    return p0
.end method

.method public isLooping(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsLooping:Z

    .line 2
    .line 3
    return-void
.end method

.method public isPlaying()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public onAudioAvailableBufferCount(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v0, 0x5dc

    .line 7
    .line 8
    if-le p1, v0, :cond_1

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    const/16 v0, 0x1f4

    .line 15
    .line 16
    if-ge p1, v0, :cond_2

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    const/16 p0, 0x7d0

    .line 23
    .line 24
    if-gt p1, p0, :cond_4

    .line 25
    .line 26
    const/16 p0, 0x32

    .line 27
    .line 28
    if-ge p1, p0, :cond_3

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_3
    :goto_0
    return-void

    .line 32
    :cond_4
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v0, "!!!!!!!!! count  = "

    .line 35
    .line 36
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "AudioSpeedControlPlayer"

    .line 47
    .line 48
    invoke-static {p1, p0}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onAudioOriginPosition(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnPlayPositionListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    long-to-int v1, p1

    .line 6
    div-int/lit16 v1, v1, 0x3e8

    .line 7
    .line 8
    invoke-interface {v0, p0, v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;->onPlayPositionListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsLooping:Z

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 16
    .line 17
    mul-int/lit16 v1, v0, 0x3e8

    .line 18
    .line 19
    int-to-long v1, v1

    .line 20
    cmp-long v1, p1, v1

    .line 21
    .line 22
    if-ltz v1, :cond_1

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    :cond_1
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v1, "seek start "

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " mEnd = "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, "  decodeFinished = "

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v1, " pts = "

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string p2, "AudioSpeedControlPlayer"

    .line 75
    .line 76
    invoke-static {p2, p1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 81
    .line 82
    iget p2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 83
    .line 84
    invoke-direct {p0, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seekWithOutReset(I)V

    .line 85
    .line 86
    .line 87
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsReachEnd:Z

    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public onAudioPlayingPosition(J)V
    .locals 0

    return-void
.end method

.method public pause()V
    .locals 5

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "pause"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v2

    .line 15
    :try_start_0
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 16
    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    monitor-exit v2

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v3, 0x0

    .line 24
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 25
    .line 26
    iget-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 32
    .line 33
    :cond_1
    iget-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 34
    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/immomo/moment/mediautils/d;->m()V

    .line 38
    .line 39
    .line 40
    :cond_2
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 41
    .line 42
    const/4 v3, 0x3

    .line 43
    iput v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 44
    .line 45
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    const-string p0, "AudioSpeedControlPlayer"

    .line 47
    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v3, "pause time = "

    .line 51
    .line 52
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    sub-long/2addr v3, v0

    .line 60
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p0, v0}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :goto_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    throw p0
.end method

.method public prepare()V
    .locals 2

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "prepare"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->disableCodec:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPath:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-interface {v0, p0, v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;->onError(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorDotDataListener:Ll/apw;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->serveCode:I

    .line 34
    .line 35
    add-int/lit16 p0, p0, 0x1772

    .line 36
    .line 37
    const-string v1, "Audio file not found!!!"

    .line 38
    .line 39
    invoke-interface {v0, p0, v1}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void

    .line 43
    :cond_3
    const/4 v0, 0x1

    .line 44
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 45
    .line 46
    new-instance v0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;-><init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x2

    .line 52
    invoke-static {p0, v0}, Ll/lyi0;->d(ILjava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public release()V
    .locals 6

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "release start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z

    .line 13
    .line 14
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mHandler:Landroid/os/Handler;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIgnoreCount:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mDecoderPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    :try_start_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 30
    .line 31
    const-wide/16 v4, 0xa

    .line 32
    .line 33
    invoke-virtual {v2, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/b;->c()V

    .line 42
    .line 43
    .line 44
    iput-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 45
    .line 46
    :cond_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/d;->o()V

    .line 51
    .line 52
    .line 53
    iput-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioPlayer:Lcom/immomo/moment/mediautils/d;

    .line 54
    .line 55
    :cond_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/ed1;->f()V

    .line 60
    .line 61
    .line 62
    iput-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 63
    .line 64
    :cond_2
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 65
    .line 66
    if-eqz v2, :cond_3

    .line 67
    .line 68
    invoke-virtual {v2}, Ll/rd1;->f()V

    .line 69
    .line 70
    .line 71
    iput-object v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 72
    .line 73
    :cond_3
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->resetState()V

    .line 74
    .line 75
    .line 76
    iput v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 77
    .line 78
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->decodeFinished:Z

    .line 79
    .line 80
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    const-string p0, "AudioSpeedControlPlayer"

    .line 82
    .line 83
    const-string v0, "release end"

    .line 84
    .line 85
    invoke-static {p0, v0}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 90
    throw p0
.end method

.method public reset()V
    .locals 2

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "reset"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->release()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public seekPlayTime(I)Z
    .locals 3

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "seekPlayTime = "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return v2

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 33
    .line 34
    if-lt p1, v1, :cond_2

    .line 35
    .line 36
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 37
    .line 38
    if-le p1, v1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seek(I)V

    .line 42
    .line 43
    .line 44
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSeekTime:I

    .line 45
    .line 46
    monitor-exit v0

    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    :goto_0
    monitor-exit v0

    .line 50
    return v2

    .line 51
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public setDataSource(Ljava/lang/String;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setDataSource "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioSpeedControlPlayer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPath:Ljava/lang/String;

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public setOnErrorDotDataListener(Ll/apw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorDotDataListener:Ll/apw;

    .line 2
    .line 3
    return-void
.end method

.method public setOnErrorListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnErrorListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPlayPositionListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnPlayPositionListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPreparedListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mOnPreparedListener:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setPlaySpeed(F)V
    .locals 3

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setPlaySpeed = "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSpeed:F

    .line 24
    .line 25
    cmpl-float v1, p1, v1

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSpeed:F

    .line 30
    .line 31
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mScaleProcessor:Ll/ed1;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/ed1;->h(F)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit v0

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0
.end method

.method public setPlayTimeRange(II)Z
    .locals 5

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setPlayTimeRange  start = "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "  end = "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 29
    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 37
    .line 38
    iput p2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 39
    .line 40
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_2

    .line 45
    :cond_0
    const/4 v3, 0x3

    .line 46
    const/4 v4, 0x0

    .line 47
    if-eq v1, v3, :cond_2

    .line 48
    .line 49
    const/4 v3, 0x2

    .line 50
    if-ne v1, v3, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 p0, 0x4

    .line 54
    if-ne v1, p0, :cond_5

    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return v4

    .line 58
    :cond_2
    :goto_0
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 59
    .line 60
    iput p2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 61
    .line 62
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 67
    .line 68
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSeekTime:I

    .line 69
    .line 70
    if-le v1, p1, :cond_3

    .line 71
    .line 72
    if-ge v1, p2, :cond_3

    .line 73
    .line 74
    invoke-direct {p0, v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seek(I)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    if-eqz p1, :cond_5

    .line 79
    .line 80
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seek(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seek(I)V

    .line 85
    .line 86
    .line 87
    :cond_5
    :goto_1
    monitor-exit v0

    .line 88
    return v2

    .line 89
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    throw p0
.end method

.method public setSoftAudioDecoder(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "Soft"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "Hard"

    .line 7
    .line 8
    :goto_0
    const-string v1, "AudioDecoderType:"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "AudioSpeedControlPlayer"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mIsUseSoftAudioDecoder:Z

    .line 20
    .line 21
    return-void
.end method

.method public setVolume(F)V
    .locals 2

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "setVolume"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolume:F

    .line 12
    .line 13
    cmpl-float v1, p1, v1

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iput p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolume:F

    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mVolumeProcessor:Ll/rd1;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/rd1;->g(F)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public start()V
    .locals 4

    .line 1
    const-string v0, "mPlayerState:"

    .line 2
    .line 3
    const-string v1, "AudioSpeedControlPlayer"

    .line 4
    .line 5
    const-string v2, "start  play"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mSync:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v1

    .line 13
    :try_start_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mAudioDecoder:Lcom/immomo/moment/mediautils/b;

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mStart:I

    .line 22
    .line 23
    iget v3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mEnd:I

    .line 24
    .line 25
    invoke-virtual {p0, v2, v3}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setPlayTimeRange(II)Z

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mNeedSeekRange:Z

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    const-string v2, "AudioSpeedControlPlayer"

    .line 35
    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 42
    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 54
    .line 55
    const/4 v2, 0x2

    .line 56
    if-eq v0, v2, :cond_1

    .line 57
    .line 58
    const/4 v2, 0x3

    .line 59
    if-ne v0, v2, :cond_2

    .line 60
    .line 61
    :cond_1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->resume()V

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x4

    .line 65
    iput v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->mPlayerState:I

    .line 66
    .line 67
    :cond_2
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0
.end method
