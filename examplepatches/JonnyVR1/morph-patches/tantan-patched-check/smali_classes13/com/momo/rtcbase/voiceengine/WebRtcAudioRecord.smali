.class public Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioSamples;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;,
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;
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

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioRecord"

.field private static audioManager:Landroid/media/AudioManager;

.field private static audioSamplesReadyCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

.field private static audioSource:I

.field private static errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

.field private static volatile microphoneMute:Z

.field private static preaudioSource:I


# instance fields
.field private audioRecord:Landroid/media/AudioRecord;

.field private audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

.field private emptyBytes:[B

.field private mChannels:I

.field private mSampleRate:I

.field private final nativeAudioRecord:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->getDefaultAudioSource()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->DEFAULT_AUDIO_SOURCE:I

    .line 6
    .line 7
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

    .line 8
    .line 9
    sput v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->preaudioSource:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    sput-object v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioManager:Landroid/media/AudioManager;

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
    const v0, 0xbb80

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->mSampleRate:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->mChannels:I

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "WebRtcAudioRecord Created:"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "WebRtcAudioRecord"

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-wide p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 36
    .line 37
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->create()Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->assertTrue(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeDataIsRecorded(IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100()Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSamplesReadyCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$1300(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200()I
    .locals 1

    .line 1
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->preaudioSource:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$202(I)I
    .locals 0

    .line 1
    sput p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->preaudioSource:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->mSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->mChannels:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;II)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->resetAudioRecord(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->microphoneMute:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$800(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->emptyBytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 2
    .line 3
    return-wide v0
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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "Built-in AEC is not supported on this platform"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->setAEC(Z)Z

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "Built-in NS is not supported on this platform"

    .line 30
    .line 31
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_0
    invoke-virtual {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->setNS(Z)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public static getAudioSource()I
    .locals 1

    .line 1
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

    .line 2
    .line 3
    return v0
.end method

.method private static getDefaultAudioSource()I
    .locals 1

    const/4 v0, 0x7

    return v0
.end method

.method private initRecording(II)I
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "initRecording(sampleRate="

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
    const-string v1, ")"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "WebRtcAudioRecord"

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 34
    .line 35
    const/4 v2, -0x1

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    const-string p1, "InitRecording called twice without StopRecording."

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v2

    .line 44
    :cond_0
    iput p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->mSampleRate:I

    .line 45
    .line 46
    iput p2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->mChannels:I

    .line 47
    .line 48
    mul-int/lit8 v0, p2, 0x2

    .line 49
    .line 50
    div-int/lit8 v3, p1, 0x64

    .line 51
    .line 52
    mul-int/2addr v0, v3

    .line 53
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v4, "byteBuffer.capacity: "

    .line 62
    .line 63
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    new-array v0, v0, [B

    .line 89
    .line 90
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->emptyBytes:[B

    .line 91
    .line 92
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    iget-wide v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 95
    .line 96
    invoke-direct {p0, v0, v4, v5}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->channelCountToConfiguration(I)I

    .line 100
    .line 101
    .line 102
    move-result v9

    .line 103
    const/4 p2, 0x2

    .line 104
    invoke-static {p1, v9, p2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eq v0, v2, :cond_4

    .line 109
    .line 110
    const/4 v4, -0x2

    .line 111
    if-ne v0, v4, :cond_1

    .line 112
    .line 113
    goto/16 :goto_0

    .line 114
    .line 115
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v5, "AudioRecord.getMinBufferSize: "

    .line 118
    .line 119
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-static {v1, v4}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    mul-int/2addr v0, p2

    .line 133
    iget-object p2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 140
    .line 141
    .line 142
    move-result v11

    .line 143
    new-instance p2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v0, "bufferSizeInBytes: "

    .line 146
    .line 147
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-static {v1, p2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :try_start_0
    new-instance v6, Landroid/media/AudioRecord;

    .line 161
    .line 162
    sget v7, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

    .line 163
    .line 164
    const/4 v10, 0x2

    .line 165
    move v8, p1

    .line 166
    invoke-direct/range {v6 .. v11}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 167
    .line 168
    .line 169
    iput-object v6, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    .line 171
    invoke-virtual {v6}, Landroid/media/AudioRecord;->getState()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    const/4 p2, 0x1

    .line 176
    if-eq p1, p2, :cond_2

    .line 177
    .line 178
    const-string p1, "Failed to create a new AudioRecord instance"

    .line 179
    .line 180
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->releaseAudioResources()V

    .line 184
    .line 185
    .line 186
    return v2

    .line 187
    :cond_2
    iget-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 188
    .line 189
    if-eqz p1, :cond_3

    .line 190
    .line 191
    iget-object p2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 192
    .line 193
    invoke-virtual {p2}, Landroid/media/AudioRecord;->getAudioSessionId()I

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    invoke-virtual {p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->enable(I)V

    .line 198
    .line 199
    .line 200
    :cond_3
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->logMainParameters()V

    .line 201
    .line 202
    .line 203
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->logMainParametersExtended()V

    .line 204
    .line 205
    .line 206
    return v3

    .line 207
    :catch_0
    move-exception v0

    .line 208
    move-object p1, v0

    .line 209
    new-instance p2, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    const-string v0, "AudioRecord ctor error: "

    .line 212
    .line 213
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->releaseAudioResources()V

    .line 231
    .line 232
    .line 233
    return v2

    .line 234
    :cond_4
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    const-string p2, "AudioRecord.getMinBufferSize failed: "

    .line 237
    .line 238
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    return v2
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
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getSampleRate()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "WebRtcAudioRecord"

    .line 50
    .line 51
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
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
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;->onWebRtcAudioRecordError(Ljava/lang/String;)V

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
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;->onWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private reportWebRtcAudioRecordStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V
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
    const-string v0, "WebRtcAudioRecord"

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
    sget-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0, p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;->onWebRtcAudioRecordStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private resetAudioRecord(II)I
    .locals 9

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->releaseAudioResources()V

    .line 2
    .line 3
    .line 4
    mul-int/lit8 v0, p2, 0x2

    .line 5
    .line 6
    div-int/lit8 v1, p1, 0x64

    .line 7
    .line 8
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    mul-int v3, v0, v1

    .line 17
    .line 18
    if-eq v2, v3, :cond_1

    .line 19
    .line 20
    :cond_0
    mul-int/2addr v0, v1

    .line 21
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    iget-wide v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeAudioRecord:J

    .line 28
    .line 29
    invoke-direct {p0, v0, v1, v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->nativeCacheDirectBufferAddress(Ljava/nio/ByteBuffer;J)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    new-array v0, v0, [B

    .line 39
    .line 40
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->emptyBytes:[B

    .line 41
    .line 42
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "byteBuffer.capacity: "

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "WebRtcAudioRecord"

    .line 63
    .line 64
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->channelCountToConfiguration(I)I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    const/4 p2, 0x2

    .line 72
    invoke-static {p1, v5, p2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    const/4 v8, -0x1

    .line 77
    if-eq v0, v8, :cond_7

    .line 78
    .line 79
    const/4 v2, -0x2

    .line 80
    if-ne v0, v2, :cond_2

    .line 81
    .line 82
    goto/16 :goto_0

    .line 83
    .line 84
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v3, "AudioRecord.getMinBufferSize: "

    .line 87
    .line 88
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    mul-int/2addr v0, p2

    .line 102
    iget-object p2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    new-instance p2, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v0, "bufferSizeInBytes: "

    .line 115
    .line 116
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-static {v1, p2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :try_start_0
    new-instance v2, Landroid/media/AudioRecord;

    .line 130
    .line 131
    sget v3, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

    .line 132
    .line 133
    const/4 v6, 0x2

    .line 134
    move v4, p1

    .line 135
    invoke-direct/range {v2 .. v7}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 136
    .line 137
    .line 138
    iput-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 139
    .line 140
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    const/4 p2, 0x1

    .line 145
    if-eq p1, p2, :cond_3

    .line 146
    .line 147
    const-string p1, "Failed to create a new AudioRecord instance"

    .line 148
    .line 149
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->releaseAudioResources()V

    .line 153
    .line 154
    .line 155
    return v8

    .line 156
    :cond_3
    iget-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 157
    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->release()V

    .line 161
    .line 162
    .line 163
    :cond_4
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->create()Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 168
    .line 169
    if-eqz p1, :cond_5

    .line 170
    .line 171
    iget-object p2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 172
    .line 173
    invoke-virtual {p2}, Landroid/media/AudioRecord;->getAudioSessionId()I

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    invoke-virtual {p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->enable(I)V

    .line 178
    .line 179
    .line 180
    :cond_5
    :try_start_1
    iget-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    const/4 p2, 0x3

    .line 192
    if-eq p1, p2, :cond_6

    .line 193
    .line 194
    sget-object p1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;->AUDIO_RECORD_START_STATE_MISMATCH:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;

    .line 195
    .line 196
    new-instance p2, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    const-string v0, "AudioRecord.startRecording failed - incorrect state :"

    .line 199
    .line 200
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 204
    .line 205
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    return v8

    .line 220
    :cond_6
    const/4 p0, 0x0

    .line 221
    return p0

    .line 222
    :catch_0
    move-exception v0

    .line 223
    move-object p1, v0

    .line 224
    sget-object p2, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;->AUDIO_RECORD_START_EXCEPTION:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;

    .line 225
    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    const-string v1, "AudioRecord.startRecording failed: "

    .line 229
    .line 230
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-direct {p0, p2, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    return v8

    .line 248
    :catch_1
    move-exception v0

    .line 249
    move-object p1, v0

    .line 250
    new-instance p2, Ljava/lang/StringBuilder;

    .line 251
    .line 252
    const-string v0, "AudioRecord ctor error: "

    .line 253
    .line 254
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->releaseAudioResources()V

    .line 272
    .line 273
    .line 274
    return v8

    .line 275
    :cond_7
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 276
    .line 277
    const-string p2, "AudioRecord.getMinBufferSize failed: "

    .line 278
    .line 279
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordInitError(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    return v8
.end method

.method public static setAudioManager(Landroid/media/AudioManager;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    return-void
.end method

.method public static declared-synchronized setAudioSource(I)V
    .locals 4

    .line 1
    const-string v0, "Audio source is changed from: "

    .line 2
    .line 3
    const-class v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "WebRtcAudioRecord"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

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
    sput p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I
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

.method public static setErrorCallback(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;)V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioRecord"

    .line 2
    .line 3
    const-string v1, "Set error callback"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->errorCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordErrorCallback;

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->microphoneMute:Z

    .line 26
    .line 27
    return-void
.end method

.method public static setOnAudioSamplesReady(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSamplesReadyCallback:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 2
    .line 3
    return-void
.end method

.method private startRecording()Z
    .locals 5

    .line 1
    const-string v0, "WebRtcAudioRecord"

    .line 2
    .line 3
    const-string v1, "startRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->assertTrue(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    move v0, v1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v0, v2

    .line 27
    :goto_1
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->assertTrue(Z)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v3, 0x3

    .line 42
    if-eq v0, v3, :cond_2

    .line 43
    .line 44
    sget-object v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;->AUDIO_RECORD_START_STATE_MISMATCH:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v3, "AudioRecord.startRecording failed - incorrect state :"

    .line 49
    .line 50
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioRecord:Landroid/media/AudioRecord;

    .line 54
    .line 55
    invoke-virtual {v3}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-direct {p0, v0, v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return v2

    .line 70
    :cond_2
    new-instance v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 71
    .line 72
    const-string v2, "AudioRecordJavaThread"

    .line 73
    .line 74
    invoke-direct {v0, p0, v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;-><init>(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 80
    .line 81
    .line 82
    return v1

    .line 83
    :catch_0
    move-exception v0

    .line 84
    sget-object v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;->AUDIO_RECORD_START_EXCEPTION:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;

    .line 85
    .line 86
    new-instance v3, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v4, "AudioRecord.startRecording failed: "

    .line 89
    .line 90
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-direct {p0, v1, v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->reportWebRtcAudioRecordStartError(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordStartErrorCode;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return v2
.end method

.method private stopRecording()Z
    .locals 5

    .line 1
    const-string v0, "stopRecording"

    .line 2
    .line 3
    const-string v1, "WebRtcAudioRecord"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->assertTrue(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->stopThread()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 25
    .line 26
    const-wide/16 v3, 0x7d0

    .line 27
    .line 28
    invoke-static {v0, v3, v4}, Lcom/momo/rtcbase/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    const-string v0, "Join of AudioRecordJavaThread timed out"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioThread:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->effects:Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->release()V

    .line 50
    .line 51
    .line 52
    :cond_2
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->releaseAudioResources()V

    .line 53
    .line 54
    .line 55
    return v2
.end method

.method private updateAudioSource(I)I
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "Audio source is changed from: "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, " to "

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "WebRtcAudioRecord"

    .line 26
    .line 27
    invoke-static {v0, p0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sput p1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioSource:I

    .line 31
    .line 32
    const/4 p0, 0x2

    .line 33
    const/4 v0, 0x1

    .line 34
    if-eq p1, v0, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x7

    .line 37
    if-eq p1, v1, :cond_0

    .line 38
    .line 39
    return p1

    .line 40
    :cond_0
    sget-object v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioManager:Landroid/media/AudioManager;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const/4 v2, 0x3

    .line 45
    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioContentType(I)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioTrackUsageAttribute(I)V

    .line 52
    .line 53
    .line 54
    return p1

    .line 55
    :cond_2
    sget-object v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->audioManager:Landroid/media/AudioManager;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setMode(I)V

    .line 61
    .line 62
    .line 63
    :cond_3
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioContentType(I)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->setAudioTrackUsageAttribute(I)V

    .line 67
    .line 68
    .line 69
    return p1
.end method
