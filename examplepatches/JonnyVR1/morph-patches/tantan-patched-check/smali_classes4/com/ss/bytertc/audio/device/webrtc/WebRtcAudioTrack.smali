.class public Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackErrorCode;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;
    }
.end annotation


# static fields
.field private static final AUDIO_TRACK_THREAD_JOIN_TIMEOUT_MS:J = 0x7d0L

.field private static final BITS_PER_SAMPLE:I = 0x10

.field private static final BUFFERS_PER_SECOND:I = 0x64

.field private static final CALLBACK_BUFFER_SIZE_MS:I = 0xa

.field private static final DEBUG:Z = false

.field private static final DEFAULT_USAGE:I

.field private static final INVALID_AUDIO_SESSION_ID:I = -0x1

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioTrack"

.field private static errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static errorCallbackOld:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static sForbidVoip:Z

.field private static volatile speakerMute:Z

.field private static usageAttribute:I


# instance fields
.field private apiResult:Ljava/lang/String;

.field private final audioManager:Landroid/media/AudioManager;

.field private audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private audioTrack:Landroid/media/AudioTrack;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private emptyBytes:[B

.field private final nativeAudioTrack:J

.field private final threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->getDefaultUsageAttribute()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->DEFAULT_USAGE:I

    .line 6
    .line 7
    sput v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "ctor"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "WebRtcAudioTrack"

    .line 37
    .line 38
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iput-wide p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->nativeAudioTrack:J

    .line 42
    .line 43
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "audio"

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Landroid/media/AudioManager;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 56
    .line 57
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Landroid/media/AudioTrack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->nativeAudioTrack:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->nativeGetPlayoutData(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->speakerMute:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->emptyBytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static assertTrue(Z)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "Expected condition to be true"

    .line 5
    .line 6
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private channelCountToConfiguration(I)I
    .locals 0

    const/4 p0, 0x1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x4

    return p0

    :cond_0
    const/16 p0, 0xc

    return p0
.end method

.method private static createAudioTrackOnLollipopOrHigher(III)Landroid/media/AudioTrack;
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    const-string v0, "createAudioTrackOnLollipopOrHigher"

    .line 2
    .line 3
    const-string v1, "WebRtcAudioTrack"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-boolean v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->sForbidVoip:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {v0}, Landroid/media/AudioTrack;->getNativeOutputSampleRate(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "nativeOutputSampleRate: "

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    if-eq p0, v0, :cond_1

    .line 37
    .line 38
    const-string v0, "Unable to use fast mode since requested sample rate is not native"

    .line 39
    .line 40
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    sget-boolean v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->sForbidVoip:Z

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    sput v2, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    sget v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->DEFAULT_USAGE:I

    .line 52
    .line 53
    sput v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I

    .line 54
    .line 55
    :goto_1
    sget v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I

    .line 56
    .line 57
    sget v3, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->DEFAULT_USAGE:I

    .line 58
    .line 59
    if-eq v0, v3, :cond_3

    .line 60
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v3, "A non default usage attribute is used: "

    .line 64
    .line 65
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget v3, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    new-instance v3, Landroid/media/AudioTrack;

    .line 81
    .line 82
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 83
    .line 84
    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 85
    .line 86
    .line 87
    sget v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    new-instance v0, Landroid/media/AudioFormat$Builder;

    .line 102
    .line 103
    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 104
    .line 105
    .line 106
    const/4 v1, 0x2

    .line 107
    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0, p0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0, p1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    const/4 v7, 0x1

    .line 124
    const/4 v8, 0x0

    .line 125
    move v6, p2

    .line 126
    invoke-direct/range {v3 .. v8}, Landroid/media/AudioTrack;-><init>(Landroid/media/AudioAttributes;Landroid/media/AudioFormat;III)V

    .line 127
    .line 128
    .line 129
    return-object v3
.end method

.method private static createAudioTrackOnLowerThanLollipop(III)Landroid/media/AudioTrack;
    .locals 9

    .line 1
    sget-boolean v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->sForbidVoip:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Landroid/media/AudioTrack;

    .line 6
    .line 7
    const/4 v5, 0x2

    .line 8
    const/4 v7, 0x1

    .line 9
    const/4 v2, 0x3

    .line 10
    move v3, p0

    .line 11
    move v4, p1

    .line 12
    move v6, p2

    .line 13
    invoke-direct/range {v1 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 14
    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    move v3, p0

    .line 18
    move v4, p1

    .line 19
    move v6, p2

    .line 20
    new-instance v2, Landroid/media/AudioTrack;

    .line 21
    .line 22
    move v7, v6

    .line 23
    const/4 v6, 0x2

    .line 24
    const/4 v8, 0x1

    .line 25
    move v5, v4

    .line 26
    move v4, v3

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-direct/range {v2 .. v8}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 29
    .line 30
    .line 31
    return-object v2
.end method

.method private getApiResult()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 7
    .line 8
    return-object p0
.end method

.method private getAudioSessionId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static getDefaultUsageAttribute()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method private getStreamMaxVolume()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "WebRtcAudioTrack"

    .line 7
    .line 8
    const-string v1, "getStreamMaxVolume"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, -0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method private getStreamType()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getStreamType()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private getStreamVolume()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "WebRtcAudioTrack"

    .line 7
    .line 8
    const-string v1, "getStreamVolume"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, -0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method private initPlayout(IIZ)I
    .locals 10

    .line 1
    const-string v0, "Initialization of audio track failed."

    .line 2
    .line 3
    const-string v1, "Conflict with existing AudioTrack."

    .line 4
    .line 5
    const-string v2, "AudioTrack.getMinBufferSize returns an invalid value."

    .line 6
    .line 7
    const-string v3, "WebRtcAudioTrack"

    .line 8
    .line 9
    const-string v4, "AudioTrack.getMinBufferSize: "

    .line 10
    .line 11
    const-string v5, "byteBuffer.capacity: "

    .line 12
    .line 13
    const-string v6, "initPlayout(sampleRate="

    .line 14
    .line 15
    new-instance v7, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v8, "InitPlayout(sampleRate="

    .line 18
    .line 19
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v8, ", channels="

    .line 26
    .line 27
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v9, ", forbidVoip="

    .line 34
    .line 35
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v9, "):"

    .line 42
    .line 43
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    iput-object v7, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 51
    .line 52
    sput-boolean p3, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->sForbidVoip:Z

    .line 53
    .line 54
    :try_start_0
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 55
    .line 56
    invoke-virtual {p3}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 57
    .line 58
    .line 59
    new-instance p3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v6, ")"

    .line 74
    .line 75
    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-static {v3, p3}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    mul-int/lit8 p3, p2, 0x2

    .line 86
    .line 87
    div-int/lit8 v6, p1, 0x64

    .line 88
    .line 89
    mul-int/2addr p3, v6

    .line 90
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    iput-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    new-instance p3, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-static {v3, p3}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    new-array p3, p3, [B

    .line 124
    .line 125
    iput-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->emptyBytes:[B

    .line 126
    .line 127
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    iget-wide v5, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->nativeAudioTrack:J

    .line 130
    .line 131
    invoke-direct {p0, p3, v5, v6}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p0, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->channelCountToConfiguration(I)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    const/4 p3, 0x2

    .line 139
    invoke-static {p1, p2, p3}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    new-instance v5, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-static {v3, v4}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    if-ge p3, v4, :cond_0

    .line 165
    .line 166
    invoke-direct {p0, v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .line 173
    .line 174
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 187
    .line 188
    const/16 p0, -0xc8

    .line 189
    .line 190
    return p0

    .line 191
    :catch_0
    move-exception p1

    .line 192
    goto/16 :goto_1

    .line 193
    .line 194
    :cond_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 195
    .line 196
    if-eqz v2, :cond_1

    .line 197
    .line 198
    invoke-direct {p0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    new-instance p1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .line 205
    .line 206
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    .line 220
    const/16 p0, -0xc9

    .line 221
    .line 222
    return p0

    .line 223
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    .line 227
    .line 228
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v2, "minBufferSizeInBytes: "

    .line 234
    .line 235
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 246
    .line 247
    invoke-static {p1, p2, p3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->createAudioTrackOnLollipopOrHigher(III)Landroid/media/AudioTrack;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 252
    .line 253
    if-eqz p1, :cond_3

    .line 254
    .line 255
    :try_start_2
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getState()I

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    const/4 p2, 0x1

    .line 260
    if-eq p1, p2, :cond_2

    .line 261
    .line 262
    goto :goto_0

    .line 263
    :cond_2
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->logMainParameters()V

    .line 264
    .line 265
    .line 266
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->logMainParametersExtended()V

    .line 267
    .line 268
    .line 269
    const/4 p0, 0x0

    .line 270
    return p0

    .line 271
    :cond_3
    :goto_0
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->releaseAudioResources()V

    .line 275
    .line 276
    .line 277
    new-instance p1, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .line 281
    .line 282
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 295
    .line 296
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 297
    .line 298
    if-nez p0, :cond_4

    .line 299
    .line 300
    const/16 p0, -0xcb

    .line 301
    .line 302
    return p0

    .line 303
    :cond_4
    const/16 p0, -0xcc

    .line 304
    .line 305
    return p0

    .line 306
    :catch_1
    move-exception p1

    .line 307
    new-instance p2, Ljava/lang/StringBuilder;

    .line 308
    .line 309
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 310
    .line 311
    .line 312
    invoke-static {p1}, Lcom/bytedance/realx/base/ExceptionUtils;->stackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p3

    .line 316
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->releaseAudioResources()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 334
    .line 335
    .line 336
    const/16 p0, -0xca

    .line 337
    .line 338
    return p0

    .line 339
    :goto_1
    const-string p2, "initPlayout exception"

    .line 340
    .line 341
    invoke-static {v3, p2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 342
    .line 343
    .line 344
    invoke-static {p1}, Lcom/bytedance/realx/base/ExceptionUtils;->stackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    new-instance p1, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 354
    .line 355
    .line 356
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 357
    .line 358
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 369
    .line 370
    const/16 p0, -0xcd

    .line 371
    .line 372
    return p0
.end method

.method private isVolumeFixed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioManager;->isVolumeFixed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private logBufferCapacityInFrames()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioTrack: buffer capacity in frames: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getBufferCapacityInFrames()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "WebRtcAudioTrack"

    .line 22
    .line 23
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private logBufferSizeInFrames()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioTrack: buffer size in frames: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getBufferSizeInFrames()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "WebRtcAudioTrack"

    .line 22
    .line 23
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private logMainParameters()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioTrack: session ID: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/media/AudioTrack;->getAudioSessionId()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", channels: "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/media/AudioTrack;->getChannelCount()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", sample rate: "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getSampleRate()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p0, ", max gain: "

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "WebRtcAudioTrack"

    .line 62
    .line 63
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private logMainParametersExtended()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->logBufferSizeInFrames()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->logBufferCapacityInFrames()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private logUnderrunCount()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "underrun count: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getUnderrunCount()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "WebRtcAudioTrack"

    .line 26
    .line 27
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private native nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V
.end method

.method private native nativeGetPlayoutData(IJ)V
.end method

.method private releaseAudioResources()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioTrack"

    .line 2
    .line 3
    const-string v1, "releaseAudioResources"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private reportWebRtcAudioTrackError(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Run-time playback error: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "WebRtcAudioTrack"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallbackOld:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;->onWebRtcAudioTrackError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;->onWebRtcAudioTrackError(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private reportWebRtcAudioTrackInitError(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Init playout error: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "WebRtcAudioTrack"

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallbackOld:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;->onWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;->onWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private reportWebRtcAudioTrackStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Start playout error: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, ". "

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "WebRtcAudioTrack"

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallbackOld:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;->onWebRtcAudioTrackStartError(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;->onWebRtcAudioTrackStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public static declared-synchronized setAudioTrackUsageAttribute(I)V
    .locals 4

    .line 1
    const-string v0, "Default usage attribute is changed from: "

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "WebRtcAudioTrack"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->DEFAULT_USAGE:I

    .line 14
    .line 15
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, " to "

    .line 19
    .line 20
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->usageAttribute:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    monitor-exit v1

    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw p0
.end method

.method public static setErrorCallback(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;)V
    .locals 2

    .line 11
    const-string v0, "WebRtcAudioTrack"

    const-string v1, "Set extended error callback"

    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    sput-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$ErrorCallback;

    return-void
.end method

.method public static setErrorCallback(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const-string v0, "WebRtcAudioTrack"

    .line 2
    .line 3
    const-string v1, "Set error callback (deprecated"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->errorCallbackOld:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 9
    .line 10
    return-void
.end method

.method public static setSpeakerMute(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setSpeakerMute("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ")"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "WebRtcAudioTrack"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->speakerMute:Z

    .line 26
    .line 27
    return-void
.end method

.method private setStreamVolume(I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "setStreamVolume("

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ")"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "WebRtcAudioTrack"

    .line 26
    .line 27
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    return v2

    .line 36
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->isVolumeFixed()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const-string p0, "The device implements a fixed volume policy."

    .line 43
    .line 44
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v2

    .line 48
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 49
    .line 50
    invoke-virtual {p0, v2, p1, v2}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    return p0
.end method

.method private startPlayout()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "startPlayout"

    .line 7
    .line 8
    const-string v1, "WebRtcAudioTrack"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string p0, "null audio track object"

    .line 18
    .line 19
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/16 p0, -0x64

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    const-string p0, "the previous audio thread leak"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/16 p0, -0x65

    .line 35
    .line 36
    return p0

    .line 37
    :cond_1
    const-string v1, "StartPlayout:"

    .line 38
    .line 39
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 40
    .line 41
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v1, 0x3

    .line 51
    if-eq v0, v1, :cond_2

    .line 52
    .line 53
    sget-object v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;->AUDIO_TRACK_START_STATE_MISMATCH:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;

    .line 54
    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v2, "AudioTrack.play failed - incorrect state :"

    .line 58
    .line 59
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroid/media/AudioTrack;->getPlayState()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-direct {p0, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/media/AudioTrack;->getPlayState()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 105
    .line 106
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->releaseAudioResources()V

    .line 107
    .line 108
    .line 109
    const/16 p0, -0x67

    .line 110
    .line 111
    return p0

    .line 112
    :cond_2
    new-instance v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 113
    .line 114
    const-string v1, "BaeTrackJavaThread"

    .line 115
    .line 116
    invoke-direct {v0, p0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 122
    .line 123
    .line 124
    const/4 p0, 0x0

    .line 125
    return p0

    .line 126
    :catch_0
    move-exception v0

    .line 127
    sget-object v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;->AUDIO_TRACK_START_EXCEPTION:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;

    .line 128
    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v3, "AudioTrack.play failed: "

    .line 132
    .line 133
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-direct {p0, v1, v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->reportWebRtcAudioTrackStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->releaseAudioResources()V

    .line 151
    .line 152
    .line 153
    new-instance v1, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 178
    .line 179
    const/16 p0, -0x66

    .line 180
    .line 181
    return p0
.end method

.method private stopPlayout()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->threadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "stopPlayout"

    .line 7
    .line 8
    const-string v1, "WebRtcAudioTrack"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "StopPlayout:"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->logUnderrunCount()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string v0, "Stopping the AudioTrackThread..."

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;->stopThread()V

    .line 32
    .line 33
    .line 34
    const-string v0, "interrupt the AudioTrackThread..."

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 45
    .line 46
    const-wide/16 v2, 0x7d0

    .line 47
    .line 48
    invoke-static {v0, v2, v3}, Lcom/bytedance/realx/base/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    const-string v0, "Join of AudioTrackThread timed out."

    .line 55
    .line 56
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->apiResult:Ljava/lang/String;

    .line 80
    .line 81
    :cond_0
    const-string v0, "AudioTrackThread has now been stopped."

    .line 82
    .line 83
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack$AudioTrackThread;

    .line 88
    .line 89
    :cond_1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioTrack;->releaseAudioResources()V

    .line 90
    .line 91
    .line 92
    const-string p0, "stopPlayout release done."

    .line 93
    .line 94
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const/4 p0, 0x1

    .line 98
    return p0
.end method
