.class public Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordErrorCode;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;
    }
.end annotation


# static fields
.field private static final AUDIO_RECORD_THREAD_JOIN_TIMEOUT_MS:J = 0x7d0L

.field private static final BITS_PER_SAMPLE:I = 0x10

.field private static final BUFFERS_PER_SECOND:I = 0x64

.field private static final BUFFER_SIZE_FACTOR:I = 0x2

.field private static final CALLBACK_BUFFER_SIZE_MS:I = 0xa

.field private static final DEBUG:Z = false

.field private static final DEFAULT_AUDIO_SOURCE:I

.field private static final INVALID_AUDIO_SESSION_ID:I = -0x1

.field private static final INVALID_AUDIO_SOURCE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioRecord"

.field private static audioSamplesReadyCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static defaultMediaModeAudioSource:I

.field private static errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private static volatile microphoneMute:Z


# instance fields
.field private apiResult:Ljava/lang/String;

.field private audioRecord:Landroid/media/AudioRecord;

.field private audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

.field private emptyBytes:[B

.field private final nativeAudioRecord:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->getDefaultAudioSource()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->DEFAULT_AUDIO_SOURCE:I

    .line 6
    .line 7
    sput v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->defaultMediaModeAudioSource:I

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "ctor"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "WebRtcAudioRecord"

    .line 27
    .line 28
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iput-wide p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 32
    .line 33
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->IsAudioEffectSupported()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->create()Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->microphoneMute:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->emptyBytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->nativeDataIsRecorded(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700()Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioSamplesReadyCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 2
    .line 3
    return-object v0
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

    const/16 p0, 0x10

    return p0

    :cond_0
    const/16 p0, 0xc

    return p0
.end method

.method private cvtNativeSetAudioSource(IZ)I
    .locals 1

    .line 1
    sget p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->defaultMediaModeAudioSource:I

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    move p0, v0

    .line 7
    :cond_0
    if-eqz p1, :cond_4

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    if-eq p1, p2, :cond_3

    .line 11
    .line 12
    const/4 p2, 0x5

    .line 13
    if-eq p1, p2, :cond_3

    .line 14
    .line 15
    const/4 p2, 0x6

    .line 16
    if-eq p1, p2, :cond_3

    .line 17
    .line 18
    if-eq p1, v0, :cond_2

    .line 19
    .line 20
    const/16 p2, 0x9

    .line 21
    .line 22
    if-eq p1, p2, :cond_1

    .line 23
    .line 24
    const/16 p2, 0xa

    .line 25
    .line 26
    if-eq p1, p2, :cond_1

    .line 27
    .line 28
    return p0

    .line 29
    :cond_1
    return p2

    .line 30
    :cond_2
    return v0

    .line 31
    :cond_3
    return p2

    .line 32
    :cond_4
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method private enableBuiltInAEC(Z)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableBuiltInAEC("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x29

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "WebRtcAudioRecord"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "Built-in AEC is not supported on this platform"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->setAEC(Z)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method private enableBuiltInNS(Z)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enableBuiltInNS("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const/16 v1, 0x29

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "WebRtcAudioRecord"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "Built-in NS is not supported on this platform"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->setNS(Z)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method private getApiResult()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private getAudioSessionId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getAudioSessionId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private getAudioSource()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getAudioSource()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private static getDefaultAudioSource()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method private initRecording(IIIZI)I
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "InitRecording(sampleRate="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", channels="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", frameSizeMs="

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", forbidVoip="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", preferredSource="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "):"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 53
    .line 54
    const-string v1, "WebRtcAudioRecord"

    .line 55
    .line 56
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 60
    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    const-string p1, "InitRecording called twice without StopRecording."

    .line 64
    .line 65
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/16 p0, -0x190

    .line 69
    .line 70
    return p0

    .line 71
    :cond_0
    mul-int/lit8 v0, p2, 0x2

    .line 72
    .line 73
    div-int/lit8 v1, p1, 0x64

    .line 74
    .line 75
    if-lez p3, :cond_1

    .line 76
    .line 77
    rem-int/lit8 v2, p3, 0xa

    .line 78
    .line 79
    if-nez v2, :cond_1

    .line 80
    .line 81
    mul-int/2addr p3, p1

    .line 82
    div-int/lit16 v1, p3, 0x3e8

    .line 83
    .line 84
    :cond_1
    mul-int/2addr v0, v1

    .line 85
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    iput-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 90
    .line 91
    const-string p3, "WebRtcAudioRecord"

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v2, "byteBuffer.capacity: "

    .line 96
    .line 97
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {p3, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 119
    .line 120
    .line 121
    move-result p3

    .line 122
    new-array p3, p3, [B

    .line 123
    .line 124
    iput-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->emptyBytes:[B

    .line 125
    .line 126
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 127
    .line 128
    iget-wide v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 129
    .line 130
    invoke-direct {p0, p3, v2, v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V

    .line 131
    .line 132
    .line 133
    invoke-direct {p0, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->channelCountToConfiguration(I)I

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    const/4 p2, 0x2

    .line 138
    invoke-static {p1, v7, p2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 139
    .line 140
    .line 141
    move-result p3

    .line 142
    const/4 v0, -0x1

    .line 143
    if-eq p3, v0, :cond_9

    .line 144
    .line 145
    const/4 v0, -0x2

    .line 146
    if-ne p3, v0, :cond_2

    .line 147
    .line 148
    goto/16 :goto_4

    .line 149
    .line 150
    :cond_2
    const-string v0, "WebRtcAudioRecord"

    .line 151
    .line 152
    new-instance v2, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    const-string v3, "AudioRecord.getMinBufferSize: "

    .line 155
    .line 156
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    mul-int/2addr v0, p2

    .line 176
    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    const-string p2, "WebRtcAudioRecord"

    .line 181
    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string v2, "bufferSizeInBytes: "

    .line 185
    .line 186
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {p2, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    :try_start_1
    invoke-direct {p0, p5, p4}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->cvtNativeSetAudioSource(IZ)I

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    new-instance p2, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    iget-object p4, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string p4, ",AudioSource:"

    .line 215
    .line 216
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    const-string p4, ",MinBufferSize:"

    .line 223
    .line 224
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    const-string p3, ",byteBuffer.capcity:"

    .line 231
    .line 232
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 236
    .line 237
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 238
    .line 239
    .line 240
    move-result p3

    .line 241
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    const-string p3, ", bufferSizeInBytes:"

    .line 245
    .line 246
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {p2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 257
    .line 258
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 259
    .line 260
    if-nez p2, :cond_3

    .line 261
    .line 262
    new-instance v4, Landroid/media/AudioRecord;

    .line 263
    .line 264
    const/4 v8, 0x2

    .line 265
    move v6, p1

    .line 266
    invoke-direct/range {v4 .. v9}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 267
    .line 268
    .line 269
    move-object p2, v4

    .line 270
    goto :goto_0

    .line 271
    :catchall_0
    move-exception v0

    .line 272
    move-object p1, v0

    .line 273
    goto :goto_3

    .line 274
    :cond_3
    :goto_0
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 275
    .line 276
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 277
    if-eqz p2, :cond_6

    .line 278
    .line 279
    invoke-virtual {p2}, Landroid/media/AudioRecord;->getState()I

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    const/4 p2, 0x1

    .line 284
    if-eq p1, p2, :cond_4

    .line 285
    .line 286
    goto :goto_1

    .line 287
    :cond_4
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 288
    .line 289
    if-eqz p1, :cond_5

    .line 290
    .line 291
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 292
    .line 293
    invoke-virtual {p2}, Landroid/media/AudioRecord;->getAudioSessionId()I

    .line 294
    .line 295
    .line 296
    move-result p2

    .line 297
    invoke-virtual {p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->enable(I)V

    .line 298
    .line 299
    .line 300
    :cond_5
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->logMainParameters()V

    .line 301
    .line 302
    .line 303
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->logMainParametersExtended()V

    .line 304
    .line 305
    .line 306
    return v1

    .line 307
    :cond_6
    :goto_1
    const-string p1, "Failed to create a new AudioRecord instance"

    .line 308
    .line 309
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->releaseAudioResources()V

    .line 313
    .line 314
    .line 315
    new-instance p1, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 318
    .line 319
    .line 320
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    const-string p2, "Failed to create a new AudioRecord instance state:"

    .line 326
    .line 327
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 331
    .line 332
    if-nez p2, :cond_7

    .line 333
    .line 334
    const-string p2, "null"

    .line 335
    .line 336
    goto :goto_2

    .line 337
    :cond_7
    invoke-virtual {p2}, Landroid/media/AudioRecord;->getState()I

    .line 338
    .line 339
    .line 340
    move-result p2

    .line 341
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    :goto_2
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 353
    .line 354
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 355
    .line 356
    if-nez p0, :cond_8

    .line 357
    .line 358
    const/16 p0, -0x192

    .line 359
    .line 360
    return p0

    .line 361
    :cond_8
    const/16 p0, -0x193

    .line 362
    .line 363
    return p0

    .line 364
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 365
    :try_start_3
    throw p1
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_0

    .line 366
    :catch_0
    move-exception v0

    .line 367
    move-object p1, v0

    .line 368
    new-instance p2, Ljava/lang/StringBuilder;

    .line 369
    .line 370
    const-string p3, "AudioRecord ctor error: "

    .line 371
    .line 372
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object p3

    .line 379
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p2

    .line 386
    invoke-direct {p0, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->releaseAudioResources()V

    .line 390
    .line 391
    .line 392
    new-instance p2, Ljava/lang/StringBuilder;

    .line 393
    .line 394
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 395
    .line 396
    .line 397
    iget-object p3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    const-string p3, "AudioRecord ctor error: "

    .line 403
    .line 404
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object p1

    .line 411
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 419
    .line 420
    const/16 p0, -0x191

    .line 421
    .line 422
    return p0

    .line 423
    :cond_9
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 424
    .line 425
    const-string p2, "AudioRecord.getMinBufferSize failed: "

    .line 426
    .line 427
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    new-instance p1, Ljava/lang/StringBuilder;

    .line 441
    .line 442
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 443
    .line 444
    .line 445
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 446
    .line 447
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    const-string p2, "AudioRecord.getMinBufferSize failed: "

    .line 451
    .line 452
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object p1

    .line 462
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 463
    .line 464
    return p3
.end method

.method private logMainParameters()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioRecord: session ID: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getAudioSessionId()I

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
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getChannelCount()I

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
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getSampleRate()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, ", source:"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getAudioSource()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "WebRtcAudioRecord"

    .line 64
    .line 65
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private logMainParametersExtended()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioRecord: buffer size in frames: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getBufferSizeInFrames()I

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
    const-string v0, "WebRtcAudioRecord"

    .line 22
    .line 23
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private native nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V
.end method

.method private native nativeDataIsRecorded(IJ)V
.end method

.method private releaseAudioResources()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioRecord"

    .line 2
    .line 3
    const-string v1, "releaseAudioResources"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private reportWebRtcAudioRecordError(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Run-time recording error: "

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
    const-string v0, "WebRtcAudioRecord"

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
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;->onWebRtcAudioRecordError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private reportWebRtcAudioRecordInitError(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Init recording error: "

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
    const-string v0, "WebRtcAudioRecord"

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
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;->onWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private reportWebRtcAudioRecordStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Start recording error: "

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
    const-string v0, "WebRtcAudioRecord"

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
    sget-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;->onWebRtcAudioRecordStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static setErrorCallback(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;)V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioRecord"

    .line 2
    .line 3
    const-string v1, "Set error callback"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->errorCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 9
    .line 10
    return-void
.end method

.method public static setMicrophoneMute(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMicrophoneMute("

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
    const-string v1, "WebRtcAudioRecord"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->microphoneMute:Z

    .line 26
    .line 27
    return-void
.end method

.method public static setOnAudioSamplesReady(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioSamplesReadyCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 2
    .line 3
    return-void
.end method

.method private startRecording()I
    .locals 5

    .line 1
    const-string v0, "StartRecording:"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "WebRtcAudioRecord"

    .line 6
    .line 7
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p0, "null audio record object"

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/16 p0, -0x12c

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    const-string p0, "the previous audio thread leak"

    .line 27
    .line 28
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/16 p0, -0x12d

    .line 32
    .line 33
    return p0

    .line 34
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x3

    .line 44
    if-eq v0, v1, :cond_3

    .line 45
    .line 46
    sget-object v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;->AUDIO_RECORD_START_STATE_MISMATCH:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;

    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v2, "AudioRecord.startRecording failed - incorrect state :"

    .line 51
    .line 52
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-direct {p0, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 100
    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->release()V

    .line 104
    .line 105
    .line 106
    :cond_2
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->releaseAudioResources()V

    .line 107
    .line 108
    .line 109
    const/16 p0, -0x12f

    .line 110
    .line 111
    return p0

    .line 112
    :cond_3
    new-instance v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

    .line 113
    .line 114
    const-string v1, "BaeRecordJavaThread"

    .line 115
    .line 116
    invoke-direct {v0, p0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

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
    sget-object v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;->AUDIO_RECORD_START_EXCEPTION:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;

    .line 128
    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v3, "AudioRecord.startRecording failed: "

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
    invoke-direct {p0, v1, v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->reportWebRtcAudioRecordStartError(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    new-instance v1, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 175
    .line 176
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->releaseAudioResources()V

    .line 177
    .line 178
    .line 179
    const/16 p0, -0x12e

    .line 180
    .line 181
    return p0
.end method

.method private stopRecording()Z
    .locals 4

    .line 1
    const-string v0, "StopRecording:"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "WebRtcAudioRecord"

    .line 6
    .line 7
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->stopThread()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

    .line 18
    .line 19
    const-wide/16 v2, 0x7d0

    .line 20
    .line 21
    invoke-static {v0, v2, v3}, Lcom/bytedance/realx/base/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const-string v0, "Join of AudioRecordJavaThread timed out"

    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->apiResult:Ljava/lang/String;

    .line 53
    .line 54
    :cond_0
    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->audioThread:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;

    .line 56
    .line 57
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->effects:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->release()V

    .line 62
    .line 63
    .line 64
    :cond_2
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->releaseAudioResources()V

    .line 65
    .line 66
    .line 67
    const-string p0, "stopRecording release done."

    .line 68
    .line 69
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0
.end method
