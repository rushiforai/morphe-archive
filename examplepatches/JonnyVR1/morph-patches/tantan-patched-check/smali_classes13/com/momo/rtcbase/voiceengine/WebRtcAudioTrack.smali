.class public Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final AUDIO_TRACK_THREAD_JOIN_TIMEOUT_MS:J = 0x7d0L

.field private static final BITS_PER_SAMPLE:I = 0x10

.field private static final BUFFERS_PER_SECOND:I = 0x64

.field private static final CALLBACK_BUFFER_SIZE_MS:I = 0xa

.field private static final DEBUG:Z = false

.field private static final DEFAULT_USAGE:I

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioTrack"

.field private static audioContentType:I

.field private static errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;

.field private static errorCallbackOld:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

.field private static preaudioContentType:I

.field private static volatile speakerMute:Z

.field private static usageAttribute:I


# instance fields
.field private final audioManager:Landroid/media/AudioManager;

.field private audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

.field private audioTrack:Landroid/media/AudioTrack;

.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private emptyBytes:[B

.field private mChannels:I

.field private mSampleRate:I

.field private final nativeAudioTrack:J

.field private final threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->getDefaultUsageAttribute()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->DEFAULT_USAGE:I

    .line 6
    .line 7
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->usageAttribute:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioContentType:I

    .line 11
    .line 12
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->preaudioContentType:I

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 10
    .line 11
    const v1, 0xbb80

    .line 12
    .line 13
    .line 14
    iput v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->mSampleRate:I

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->mChannels:I

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "ctor"

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "WebRtcAudioTrack"

    .line 41
    .line 42
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput-wide p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->nativeAudioTrack:J

    .line 46
    .line 47
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "audio"

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Landroid/media/AudioManager;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 60
    .line 61
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->emptyBytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300()I
    .locals 1

    .line 1
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->preaudioContentType:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$302(I)I
    .locals 0

    .line 1
    sput p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->preaudioContentType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->mSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->mChannels:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;II)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->resetPlayout(II)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$700(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->nativeAudioTrack:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$800(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->nativeGetPlayoutData(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->speakerMute:Z

    .line 2
    .line 3
    return v0
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
    .locals 10
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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0}, Landroid/media/AudioTrack;->getNativeOutputSampleRate(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "nativeOutputSampleRate: "

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    if-eq p0, v0, :cond_0

    .line 31
    .line 32
    const-string v0, "Unable to use fast mode since requested sample rate is not native"

    .line 33
    .line 34
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->usageAttribute:I

    .line 38
    .line 39
    sget v2, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->DEFAULT_USAGE:I

    .line 40
    .line 41
    if-eq v0, v2, :cond_1

    .line 42
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v2, "A non default usage attribute is used: "

    .line 46
    .line 47
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    sget v2, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->usageAttribute:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioContentType:I

    .line 63
    .line 64
    const/4 v1, 0x2

    .line 65
    const/4 v2, 0x1

    .line 66
    if-ne v0, v2, :cond_2

    .line 67
    .line 68
    new-instance v3, Landroid/media/AudioTrack;

    .line 69
    .line 70
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 71
    .line 72
    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 73
    .line 74
    .line 75
    sget v4, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->usageAttribute:I

    .line 76
    .line 77
    invoke-virtual {v0, v4}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    new-instance v0, Landroid/media/AudioFormat$Builder;

    .line 90
    .line 91
    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0, p0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0, p1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    const/4 v7, 0x1

    .line 111
    const/4 v8, 0x0

    .line 112
    move v6, p2

    .line 113
    invoke-direct/range {v3 .. v8}, Landroid/media/AudioTrack;-><init>(Landroid/media/AudioAttributes;Landroid/media/AudioFormat;III)V

    .line 114
    .line 115
    .line 116
    return-object v3

    .line 117
    :cond_2
    move v6, p2

    .line 118
    new-instance v4, Landroid/media/AudioTrack;

    .line 119
    .line 120
    new-instance p2, Landroid/media/AudioAttributes$Builder;

    .line 121
    .line 122
    invoke-direct {p2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 123
    .line 124
    .line 125
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->usageAttribute:I

    .line 126
    .line 127
    invoke-virtual {p2, v0}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    const/4 v0, 0x3

    .line 132
    invoke-virtual {p2, v0}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p2}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    new-instance p2, Landroid/media/AudioFormat$Builder;

    .line 141
    .line 142
    invoke-direct {p2}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2, v1}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2, p0}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, p1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    const/4 v8, 0x1

    .line 162
    const/4 v9, 0x0

    .line 163
    move v7, v6

    .line 164
    move-object v6, p0

    .line 165
    invoke-direct/range {v4 .. v9}, Landroid/media/AudioTrack;-><init>(Landroid/media/AudioAttributes;Landroid/media/AudioFormat;III)V

    .line 166
    .line 167
    .line 168
    return-object v4
.end method

.method private static createAudioTrackOnLowerThanLollipop(III)Landroid/media/AudioTrack;
    .locals 10

    .line 1
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioContentType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v2, Landroid/media/AudioTrack;

    .line 7
    .line 8
    const/4 v6, 0x2

    .line 9
    const/4 v8, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    move v4, p0

    .line 12
    move v5, p1

    .line 13
    move v7, p2

    .line 14
    invoke-direct/range {v2 .. v8}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 15
    .line 16
    .line 17
    return-object v2

    .line 18
    :cond_0
    move v4, p0

    .line 19
    move v5, p1

    .line 20
    move v7, p2

    .line 21
    new-instance v3, Landroid/media/AudioTrack;

    .line 22
    .line 23
    move v8, v7

    .line 24
    const/4 v7, 0x2

    .line 25
    const/4 v9, 0x1

    .line 26
    move v6, v5

    .line 27
    move v5, v4

    .line 28
    const/4 v4, 0x3

    .line 29
    invoke-direct/range {v3 .. v9}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 30
    .line 31
    .line 32
    return-object v3
.end method

.method public static getAudioContentType()I
    .locals 1

    .line 1
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioContentType:I

    .line 2
    .line 3
    return v0
.end method

.method private static getDefaultUsageAttribute()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method private getStreamMaxVolume()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "WebRtcAudioTrack"

    .line 7
    .line 8
    const-string v1, "getStreamMaxVolume"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v1

    .line 21
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method private getStreamVolume()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "WebRtcAudioTrack"

    .line 7
    .line 8
    const-string v1, "getStreamVolume"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v1

    .line 21
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method private initPlayout(II)Z
    .locals 4

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->mSampleRate:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->mChannels:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "initPlayout(sampleRate="

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ", channels="

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, ")"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "WebRtcAudioTrack"

    .line 38
    .line 39
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    mul-int/lit8 v0, p2, 0x2

    .line 43
    .line 44
    div-int/lit8 v2, p1, 0x64

    .line 45
    .line 46
    mul-int/2addr v0, v2

    .line 47
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v2, "byteBuffer.capacity: "

    .line 56
    .line 57
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    new-array v0, v0, [B

    .line 83
    .line 84
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->emptyBytes:[B

    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    iget-wide v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->nativeAudioTrack:J

    .line 89
    .line 90
    invoke-direct {p0, v0, v2, v3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->channelCountToConfiguration(I)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    const/4 v0, 0x2

    .line 98
    invoke-static {p1, p2, v0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    new-instance v2, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    const-string v3, "AudioTrack.getMinBufferSize: "

    .line 105
    .line 106
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    const/4 v2, 0x0

    .line 126
    if-ge v0, v1, :cond_0

    .line 127
    .line 128
    const-string p1, "AudioTrack.getMinBufferSize returns an invalid value."

    .line 129
    .line 130
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return v2

    .line 134
    :cond_0
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 135
    .line 136
    if-eqz v1, :cond_1

    .line 137
    .line 138
    const-string p1, "Conflict with existing AudioTrack."

    .line 139
    .line 140
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return v2

    .line 144
    :cond_1
    :try_start_0
    invoke-static {p1, p2, v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->createAudioTrackOnLollipopOrHigher(III)Landroid/media/AudioTrack;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    if-eqz p1, :cond_3

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getState()I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    const/4 p2, 0x1

    .line 157
    if-eq p1, p2, :cond_2

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_2
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->logMainParameters()V

    .line 161
    .line 162
    .line 163
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->logMainParametersExtended()V

    .line 164
    .line 165
    .line 166
    return p2

    .line 167
    :cond_3
    :goto_0
    const-string p1, "Initialization of audio track failed."

    .line 168
    .line 169
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 173
    .line 174
    .line 175
    return v2

    .line 176
    :catch_0
    move-exception p1

    .line 177
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 185
    .line 186
    .line 187
    return v2
.end method

.method private isVolumeFixed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

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
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private logMainParametersExtended()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->logBufferSizeInFrames()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->logBufferCapacityInFrames()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private logUnderrunCount()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallbackOld:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;->onWebRtcAudioTrackError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;->onWebRtcAudioTrackError(Ljava/lang/String;)V

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallbackOld:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;->onWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;->onWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private reportWebRtcAudioTrackStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V
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
    const-string v0, " "

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallbackOld:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;->onWebRtcAudioTrackStartError(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-interface {p0, p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;->onWebRtcAudioTrackStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method private resetPlayout(II)Z
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->channelCountToConfiguration(I)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, 0x2

    .line 9
    invoke-static {p1, p2, v0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "AudioTrack.getMinBufferSize: "

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "WebRtcAudioTrack"

    .line 28
    .line 29
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    if-ge v0, v1, :cond_0

    .line 40
    .line 41
    const-string p1, "AudioTrack.getMinBufferSize returns an invalid value."

    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return v2

    .line 47
    :cond_0
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    const-string p1, "Conflict with existing AudioTrack."

    .line 52
    .line 53
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :cond_1
    :try_start_0
    invoke-static {p1, p2, v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->createAudioTrackOnLollipopOrHigher(III)Landroid/media/AudioTrack;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getState()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    const/4 p2, 0x1

    .line 70
    if-eq p1, p2, :cond_2

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/media/AudioTrack;->play()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getPlayState()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    const/4 v0, 0x3

    .line 85
    if-eq p1, v0, :cond_3

    .line 86
    .line 87
    sget-object p1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;->AUDIO_TRACK_START_STATE_MISMATCH:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;

    .line 88
    .line 89
    new-instance p2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v0, "AudioTrack.play failed - incorrect state :"

    .line 92
    .line 93
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 113
    .line 114
    .line 115
    return v2

    .line 116
    :cond_3
    return p2

    .line 117
    :catch_0
    move-exception p1

    .line 118
    sget-object p2, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;->AUDIO_TRACK_START_EXCEPTION:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;

    .line 119
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v1, "AudioTrack.play failed: "

    .line 123
    .line 124
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-direct {p0, p2, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 142
    .line 143
    .line 144
    return v2

    .line 145
    :cond_4
    :goto_0
    const-string p1, "Initialization of audio track failed."

    .line 146
    .line 147
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 151
    .line 152
    .line 153
    return v2

    .line 154
    :catch_1
    move-exception p1

    .line 155
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackInitError(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 163
    .line 164
    .line 165
    return v2
.end method

.method public static setAudioContentType(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Audio track is changed from: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioContentType:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " to "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sput p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioContentType:I

    .line 31
    .line 32
    return-void
.end method

.method public static declared-synchronized setAudioTrackUsageAttribute(I)V
    .locals 4

    .line 1
    const-string v0, "Default usage attribute is changed from: "

    .line 2
    .line 3
    const-class v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

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
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->DEFAULT_USAGE:I

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
    invoke-static {v2, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->usageAttribute:I
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

.method public static setErrorCallback(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;)V
    .locals 2

    .line 11
    const-string v0, "WebRtcAudioTrack"

    const-string v1, "Set extended error callback"

    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    sput-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$ErrorCallback;

    return-void
.end method

.method public static setErrorCallback(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;)V
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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->errorCallbackOld:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$WebRtcAudioTrackErrorCallback;

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->speakerMute:Z

    .line 26
    .line 27
    return-void
.end method

.method private setStreamVolume(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    const/4 v3, 0x0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    move v0, v2

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v0, v3

    .line 39
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->isVolumeFixed()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    const-string p0, "The device implements a fixed volume policy."

    .line 49
    .line 50
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v3

    .line 54
    :cond_1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioManager:Landroid/media/AudioManager;

    .line 55
    .line 56
    invoke-virtual {p0, v3, p1, v3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 57
    .line 58
    .line 59
    return v2
.end method

.method private startPlayout()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "WebRtcAudioTrack"

    .line 7
    .line 8
    const-string v1, "startPlayout"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    move v0, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v2

    .line 22
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    move v0, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v0, v2

    .line 32
    :goto_1
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 33
    .line 34
    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v3, 0x3

    .line 47
    if-eq v0, v3, :cond_2

    .line 48
    .line 49
    sget-object v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;->AUDIO_TRACK_START_STATE_MISMATCH:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;

    .line 50
    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v3, "AudioTrack.play failed - incorrect state :"

    .line 54
    .line 55
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v3, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 59
    .line 60
    invoke-virtual {v3}, Landroid/media/AudioTrack;->getPlayState()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {p0, v0, v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 75
    .line 76
    .line 77
    return v2

    .line 78
    :cond_2
    new-instance v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 79
    .line 80
    const-string v2, "AudioTrackJavaThread"

    .line 81
    .line 82
    invoke-direct {v0, p0, v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;-><init>(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 88
    .line 89
    .line 90
    return v1

    .line 91
    :catch_0
    move-exception v0

    .line 92
    sget-object v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;->AUDIO_TRACK_START_EXCEPTION:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;

    .line 93
    .line 94
    new-instance v3, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v4, "AudioTrack.play failed: "

    .line 97
    .line 98
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-direct {p0, v1, v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->reportWebRtcAudioTrackStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackStartErrorCode;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 116
    .line 117
    .line 118
    return v2
.end method

.method private stopPlayout()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->threadChecker:Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    const-string v0, "stopPlayout"

    .line 7
    .line 8
    const-string v1, "WebRtcAudioTrack"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    move v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->assertTrue(Z)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->logUnderrunCount()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->stopThread()V

    .line 30
    .line 31
    .line 32
    const-string v0, "Stopping the AudioTrackThread..."

    .line 33
    .line 34
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 43
    .line 44
    const-wide/16 v3, 0x7d0

    .line 45
    .line 46
    invoke-static {v0, v3, v4}, Lcom/momo/rtcbase/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    const-string v0, "Join of AudioTrackThread timed out."

    .line 53
    .line 54
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    const-string v0, "AudioTrackThread has now been stopped."

    .line 61
    .line 62
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->releaseAudioResources()V

    .line 69
    .line 70
    .line 71
    return v2
.end method
