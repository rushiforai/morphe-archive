.class public Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;
.implements Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;,
        Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeAudioLayer;
    }
.end annotation


# static fields
.field private static final BITS_PER_SAMPLE:I = 0x10

.field private static final DEBUG:Z = false

.field private static final DEFAULT_FRAME_PER_BUFFER:I = 0x100

.field private static MAX_VOLUMED:I = 0x0

.field private static MAX_VOLUMED_VOIP:I = 0x0

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioManager"

.field private static final blacklistDeviceForAAudioUsage:Z

.field private static blacklistDeviceForOpenSLESUsage:Z

.field private static blacklistDeviceForOpenSLESUsageIsOverridden:Z

.field private static useStereoInput:Z

.field private static useStereoOutput:Z


# instance fields
.field private aAudio:Z

.field private apiLevel:I

.field private final audioManager:Landroid/media/AudioManager;

.field private curMode:I

.field private hardwareAEC:Z

.field private hardwareAGC:Z

.field private hardwareNS:Z

.field private initialized:Z

.field private inputBufferSize:I

.field private inputChannels:I

.field private lastRecordcallbackInfos:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;",
            ">;"
        }
    .end annotation
.end field

.field private lowLatencyInput:Z

.field private lowLatencyOutput:Z

.field private mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

.field private mMicMuteChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

.field private mVolumeChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;

.field private microphoneVolume:I

.field private modeInvalid:Z

.field private nativeAudioManager:J

.field private nativeChannels:I

.field private nativeSampleRate:I

.field private outputBufferSize:I

.field private outputChannels:I

.field private phoneStateListener:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

.field private preferAudioLayer:I

.field private proAudio:Z

.field private recordingCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;

.field private sampleRate:I


# direct methods
.method public constructor <init>(J)V
    .locals 4

    .line 1
    const-string v0, "ctor("

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->preferAudioLayer:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    iput-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->recordingCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;

    .line 11
    .line 12
    iput-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->phoneStateListener:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 13
    .line 14
    const/16 v2, 0x64

    .line 15
    .line 16
    iput v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->microphoneVolume:I

    .line 17
    .line 18
    const/4 v2, -0x2

    .line 19
    iput v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->curMode:I

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->modeInvalid:Z

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    const-string v2, "WebRtcAudioManager"

    .line 25
    .line 26
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, ")"

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iput-wide p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 54
    .line 55
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string p2, "audio"

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Landroid/media/AudioManager;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 68
    .line 69
    const/4 p2, 0x3

    .line 70
    invoke-virtual {p1, p2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    sput p2, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->MAX_VOLUMED:I

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    sput p1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->MAX_VOLUMED_VOIP:I

    .line 81
    .line 82
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->refreshAudioParameters()V

    .line 83
    .line 84
    .line 85
    const-string p1, "WebRtcAudioManager"

    .line 86
    .line 87
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    monitor-exit p0

    .line 91
    return-void

    .line 92
    :catchall_0
    move-exception p1

    .line 93
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    throw p1
.end method

.method private SetAudioMode(I)I
    .locals 6

    .line 1
    const-string v0, "set mode from: "

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "SetAudioMode enter, modeInvalid: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->modeInvalid:Z

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ", curMode: "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->curMode:I

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, ", setMode: "

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v4, "WebRtcAudioManager"

    .line 38
    .line 39
    invoke-static {v4, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :try_start_0
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->curMode:I

    .line 43
    .line 44
    if-ne p1, v1, :cond_0

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->modeInvalid:Z

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    :cond_0
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 51
    .line 52
    invoke-virtual {v1, p1}, Landroid/media/AudioManager;->setMode(I)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->curMode:I

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, ", to: "

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, ", modeInvalid is: "

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->modeInvalid:Z

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v4, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getMode()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->curMode:I

    .line 95
    .line 96
    const/4 v1, 0x0

    .line 97
    if-eq v0, p1, :cond_2

    .line 98
    .line 99
    const/4 v0, 0x1

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    move v0, v1

    .line 102
    :goto_0
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->modeInvalid:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v5, "SetAudioMode leave, modeInvalid: "

    .line 107
    .line 108
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-boolean v5, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->modeInvalid:Z

    .line 112
    .line 113
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->curMode:I

    .line 120
    .line 121
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {v4, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return v1

    .line 138
    :catch_0
    move-exception p0

    .line 139
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 140
    .line 141
    .line 142
    const/4 p0, -0x1

    .line 143
    return p0
.end method

.method public static synthetic access$1000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->phoneStateListener:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1002(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;)Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->phoneStateListener:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->notifyPhoneStateListenerRegistered(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lastRecordcallbackInfos:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Ljava/util/Set;)Ljava/util/Set;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lastRecordcallbackInfos:Ljava/util/Set;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$700(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;[Ljava/lang/Object;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeRecordCallbackChanged([Ljava/lang/Object;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnPhoneCallEnd(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnPhoneCallStart(J)V

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

.method private earBackEnable(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackEnable(Z)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method private earBackGetIsSupport()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackSupport()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method private earBackGetLatency()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackGetLatency()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method private earBackInit()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackInit()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private earBackSetEffect(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackEffect(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private earBackSetEqualizer(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackEqualizer(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private earBackSetVolume(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackSetVolume(I)I

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private getActiveRecordingSessionIds()[I
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    new-array p0, v0, [I

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/media/AudioManager;->getActiveRecordingConfigurations()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    move v2, v0

    .line 19
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-ge v2, v3, :cond_2

    .line 24
    .line 25
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroid/media/AudioRecordingConfiguration;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/media/AudioRecordingConfiguration;->getClientAudioSessionId()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    new-array p0, p0, [I

    .line 52
    .line 53
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ge v0, v2, :cond_3

    .line 58
    .line 59
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    aput v2, p0, v0

    .line 70
    .line 71
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    return-object p0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 77
    .line 78
    .line 79
    new-array p0, v0, [I

    .line 80
    .line 81
    return-object p0
.end method

.method private getAudioDeviceInfo()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "{ Audio State: audio mode: "

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->modeToString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, ", has mic: "

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->hasMicrophone()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, ", music active: "

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/media/AudioManager;->isMusicActive()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, ", speakerphone: "

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, ", headset: "

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v0, "BT SCO: "

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v0, "music actived: "

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/media/AudioManager;->isMusicActive()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v0, "permission: "

    .line 104
    .line 105
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->isPermissionGranted()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, " bt_sco_available_off_call: "

    .line 116
    .line 117
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/media/AudioManager;->isBluetoothScoAvailableOffCall()Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p0, " }"

    .line 130
    .line 131
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    return-object p0

    .line 139
    :catch_0
    move-exception p0

    .line 140
    new-instance v0, Ljava/io/StringWriter;

    .line 141
    .line 142
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 143
    .line 144
    .line 145
    new-instance v1, Ljava/io/PrintWriter;

    .line 146
    .line 147
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 151
    .line 152
    .line 153
    const-string p0, "WebRtcAudioManager"

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0
.end method

.method private getFixedDevicePlayVolume()I
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x2

    .line 12
    if-eq v0, v2, :cond_1

    .line 13
    .line 14
    if-eq v0, v3, :cond_0

    .line 15
    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v1, v3

    .line 22
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-double v2, v0

    .line 29
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 30
    .line 31
    mul-double/2addr v2, v4

    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    .line 35
    .line 36
    .line 37
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    int-to-double v0, p0

    .line 39
    div-double/2addr v2, v0

    .line 40
    double-to-int p0, v2

    .line 41
    return p0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    new-instance v0, Ljava/io/StringWriter;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ljava/io/PrintWriter;

    .line 49
    .line 50
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 54
    .line 55
    .line 56
    const-string p0, "WebRtcAudioManager"

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, -0x1

    .line 66
    return p0
.end method

.method private getFixedDeviceRecordVolume()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->microphoneVolume:I

    .line 2
    .line 3
    return p0
.end method

.method private getLowLatencyInputFramesPerBuffer()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getLowLatencyOutputFramesPerBuffer()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private getLowLatencyOutputFramesPerBuffer()I
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isLowLatencyOutputSupported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x100

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 10
    .line 11
    const-string v0, "android.media.property.OUTPUT_FRAMES_PER_BUFFER"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    new-instance v0, Ljava/io/StringWriter;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ljava/io/PrintWriter;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "WebRtcAudioManager"

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string p0, ""

    .line 42
    .line 43
    :goto_0
    if-eqz p0, :cond_0

    .line 44
    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_0
    return v1
.end method

.method private getMicrophoneMuteState()I
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    new-instance v0, Ljava/io/StringWriter;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/io/PrintWriter;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "WebRtcAudioManager"

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, -0x1

    .line 32
    return p0
.end method

.method private static getMinInputFrameSize(II)I
    .locals 2

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    const/16 p1, 0x10

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/16 p1, 0xc

    .line 10
    .line 11
    :goto_0
    const/4 v1, 0x2

    .line 12
    invoke-static {p0, p1, v1}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    div-int/2addr p0, v0

    .line 17
    return p0
.end method

.method private static getMinOutputFrameSize(II)I
    .locals 2

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 p1, 0xc

    .line 9
    .line 10
    :goto_0
    const/4 v1, 0x2

    .line 11
    invoke-static {p0, p1, v1}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    div-int/2addr p0, v0

    .line 16
    return p0
.end method

.method private getMode()I
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioManager;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    new-instance v0, Ljava/io/StringWriter;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/io/PrintWriter;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "WebRtcAudioManager"

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, -0x1

    .line 32
    return p0
.end method

.method private getNativeOutputSampleRate()I
    .locals 4

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->runningOnEmulator()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "WebRtcAudioManager"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "Running emulator, overriding sample rate to 8 kHz."

    .line 10
    .line 11
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, 0x1f40

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->isDefaultSampleRateOverridden()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const-string v1, " Hz"

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    new-instance p0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "Default sample rate is overriden to "

    .line 28
    .line 29
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v3, "Sample rate is set to "

    .line 61
    .line 62
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return p0
.end method

.method private getPreferAudioLayer()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method private getSampleRateForApiLevel()I
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v0, "android.media.property.OUTPUT_SAMPLE_RATE"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    new-instance v0, Ljava/io/StringWriter;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ljava/io/PrintWriter;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "WebRtcAudioManager"

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p0, ""

    .line 34
    .line 35
    :goto_0
    if-nez p0, :cond_0

    .line 36
    .line 37
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    :goto_1
    return p0
.end method

.method public static declared-synchronized getStereoInput()Z
    .locals 2

    .line 1
    const-class v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->useStereoInput:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v1
.end method

.method public static declared-synchronized getStereoOutput()Z
    .locals 2

    .line 1
    const-class v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->useStereoOutput:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v1
.end method

.method private hasEarpiece()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "android.hardware.telephony"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private init()Z
    .locals 4

    .line 1
    const-string v0, "audio mode is: "

    .line 2
    .line 3
    const-string v1, "init("

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    const-string v2, "WebRtcAudioManager"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ")"

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->initialized:Z

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return v2

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    goto/16 :goto_4

    .line 44
    .line 45
    :cond_0
    const-string v1, "WebRtcAudioManager"

    .line 46
    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->modeToString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->recordingCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;

    .line 73
    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    new-instance v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;

    .line 77
    .line 78
    invoke-direct {v0, p0, p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->recordingCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    :try_start_1
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    invoke-virtual {v1, v0, v3}, Landroid/media/AudioManager;->registerAudioRecordingCallback(Landroid/media/AudioManager$AudioRecordingCallback;Landroid/os/Handler;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catch_0
    move-exception v0

    .line 91
    :try_start_2
    new-instance v1, Ljava/io/StringWriter;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 94
    .line 95
    .line 96
    new-instance v3, Ljava/io/PrintWriter;

    .line 97
    .line 98
    invoke-direct {v3, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 102
    .line 103
    .line 104
    const-string v0, "WebRtcAudioManager"

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    :goto_0
    const/16 v0, 0x20

    .line 114
    .line 115
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->registerPhoneStateListener(I)V

    .line 116
    .line 117
    .line 118
    new-instance v0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;

    .line 119
    .line 120
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;-><init>(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mVolumeChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    .line 125
    :try_start_3
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    const/4 v1, 0x3

    .line 132
    if-nez v0, :cond_2

    .line 133
    .line 134
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-virtual {p0, v1, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->onVolumeChanged(II)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :catch_1
    move-exception v0

    .line 145
    goto :goto_2

    .line 146
    :cond_2
    if-ne v0, v1, :cond_3

    .line 147
    .line 148
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 149
    .line 150
    const/4 v1, 0x0

    .line 151
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-virtual {p0, v1, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->onVolumeChanged(II)V

    .line 156
    .line 157
    .line 158
    :cond_3
    :goto_1
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->initialized:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :goto_2
    :try_start_4
    new-instance v1, Ljava/io/StringWriter;

    .line 162
    .line 163
    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 164
    .line 165
    .line 166
    new-instance v3, Ljava/io/PrintWriter;

    .line 167
    .line 168
    invoke-direct {v3, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 172
    .line 173
    .line 174
    const-string v0, "WebRtcAudioManager"

    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :goto_3
    new-instance v0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

    .line 184
    .line 185
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;-><init>(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;)V

    .line 186
    .line 187
    .line 188
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mMicMuteChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

    .line 189
    .line 190
    monitor-exit p0

    .line 191
    return v2

    .line 192
    :goto_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 193
    throw v0
.end method

.method private isAAudioSupported()Z
    .locals 1

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x1c

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method private static isAcousticEchoCancelerSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->canUseAcousticEchoCanceler()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method private isCommunicationModeEnabled()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/media/AudioManager;->getMode()I

    .line 5
    .line 6
    .line 7
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    const/4 v1, 0x3

    .line 9
    if-ne v1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    return v0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    new-instance v1, Ljava/io/StringWriter;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ljava/io/PrintWriter;

    .line 21
    .line 22
    invoke-direct {v2, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "WebRtcAudioManager"

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return v0
.end method

.method private isDeviceBlacklistedForOpenSLESUsage()Z
    .locals 2

    .line 1
    sget-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsageIsOverridden:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsage:Z

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->deviceIsBlacklistedForOpenSLESUsage()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    :goto_0
    if-eqz p0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " is blacklisted for OpenSL ES usage!"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "WebRtcAudioManager"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return p0
.end method

.method private isLowLatencyOutputSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "android.hardware.audio.low_latency"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private static isNoiseSuppressorSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEffects;->canUseNoiseSuppressor()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method private isPermissionGranted()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->isPermissionGranted()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private isProAudioSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "android.hardware.audio.pro"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private isRecordShouldUseVoiceRecognition()Z
    .locals 1

    .line 1
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "samsung"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private isWiredHeadsetOn()Z
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    new-instance v0, Ljava/io/StringWriter;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/io/PrintWriter;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "WebRtcAudioManager"

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private native nativeCacheAudioParameters(IIIIZZZZZZZIIIJ)V
.end method

.method private native nativeOnHardwareEarbackReleased(ZJ)V
.end method

.method private native nativeOnHardwareEarbackSupportParamsGet(Ljava/lang/String;J)V
.end method

.method private native nativeOnHardwareEarbackSupported(ZJ)V
.end method

.method private native nativeOnMicMuteChanged(ZJ)V
.end method

.method private native nativeOnPhoneCallEnd(J)V
.end method

.method private native nativeOnPhoneCallStart(J)V
.end method

.method private native nativeOnPhoneStateListenerRegisterChanged(ZJ)V
.end method

.method private native nativeRecordCallbackChanged([Ljava/lang/Object;J)V
.end method

.method private notifyPhoneStateListenerRegistered(Z)V
    .locals 5

    .line 1
    const-string v0, "dixing: notifyPhoneStateListenerRegistered: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 5
    .line 6
    const-wide/16 v3, 0x0

    .line 7
    .line 8
    cmp-long v1, v1, v3

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "WebRtcAudioManager"

    .line 13
    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ", "

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-wide v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 28
    .line 29
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 40
    .line 41
    invoke-direct {p0, p1, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnPhoneStateListenerRegisterChanged(ZJ)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    monitor-exit p0

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p1
.end method

.method private native onVolumeChanged(IIJ)V
.end method

.method private refreshAudioParameters()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->storeAudioParameters()V

    .line 4
    .line 5
    .line 6
    iget v1, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->apiLevel:I

    .line 7
    .line 8
    iget v2, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->sampleRate:I

    .line 9
    .line 10
    iget v3, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->outputChannels:I

    .line 11
    .line 12
    iget v4, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->inputChannels:I

    .line 13
    .line 14
    iget-boolean v5, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->hardwareAEC:Z

    .line 15
    .line 16
    iget-boolean v6, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->hardwareAGC:Z

    .line 17
    .line 18
    iget-boolean v7, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->hardwareNS:Z

    .line 19
    .line 20
    iget-boolean v8, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 21
    .line 22
    iget-boolean v9, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lowLatencyInput:Z

    .line 23
    .line 24
    iget-boolean v10, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->proAudio:Z

    .line 25
    .line 26
    iget-boolean v11, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->aAudio:Z

    .line 27
    .line 28
    iget v12, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->outputBufferSize:I

    .line 29
    .line 30
    iget v13, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->inputBufferSize:I

    .line 31
    .line 32
    iget v14, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->preferAudioLayer:I

    .line 33
    .line 34
    move v15, v1

    .line 35
    move/from16 v16, v2

    .line 36
    .line 37
    iget-wide v1, v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 38
    .line 39
    move-wide/from16 v17, v1

    .line 40
    .line 41
    move v1, v15

    .line 42
    move/from16 v2, v16

    .line 43
    .line 44
    move-wide/from16 v15, v17

    .line 45
    .line 46
    invoke-direct/range {v0 .. v16}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeCacheAudioParameters(IIIIZZZZZZZIIIJ)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private registerPhoneStateListener(I)V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static declared-synchronized setBlacklistDeviceForOpenSLESUsage(Z)V
    .locals 2

    .line 1
    const-class v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    sput-boolean v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsageIsOverridden:Z

    .line 6
    .line 7
    sput-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsage:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p0
.end method

.method public static declared-synchronized setStereoInput(Z)V
    .locals 4

    .line 1
    const-string v0, "Overriding default input behavior: setStereoInput("

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "WebRtcAudioManager"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x29

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->useStereoInput:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method public static declared-synchronized setStereoOutput(Z)V
    .locals 4

    .line 1
    const-string v0, "Overriding default output behavior: setStereoOutput("

    .line 2
    .line 3
    const-class v1, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    const-string v2, "WebRtcAudioManager"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x29

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-boolean p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->useStereoOutput:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p0
.end method

.method private storeAudioParameters()V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->apiLevel:I

    .line 4
    .line 5
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getStereoOutput()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x2

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->outputChannels:I

    .line 17
    .line 18
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getStereoInput()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    move v1, v2

    .line 25
    :cond_1
    iput v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->inputChannels:I

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getNativeOutputSampleRate()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->sampleRate:I

    .line 32
    .line 33
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isAcousticEchoCancelerSupported()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->hardwareAEC:Z

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->hardwareAGC:Z

    .line 41
    .line 42
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isNoiseSuppressorSupported()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->hardwareNS:Z

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isLowLatencyOutputSupported()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isLowLatencyInputSupported()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lowLatencyInput:Z

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isProAudioSupported()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->proAudio:Z

    .line 65
    .line 66
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isAAudioSupported()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->aAudio:Z

    .line 71
    .line 72
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getLowLatencyOutputFramesPerBuffer()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    iget v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->sampleRate:I

    .line 82
    .line 83
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->outputChannels:I

    .line 84
    .line 85
    invoke-static {v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getMinOutputFrameSize(II)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    :goto_1
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->outputBufferSize:I

    .line 90
    .line 91
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->lowLatencyInput:Z

    .line 92
    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getLowLatencyInputFramesPerBuffer()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    goto :goto_2

    .line 100
    :cond_3
    iget v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->sampleRate:I

    .line 101
    .line 102
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->inputChannels:I

    .line 103
    .line 104
    invoke-static {v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getMinInputFrameSize(II)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    :goto_2
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->inputBufferSize:I

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->getPreferAudioLayer()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->preferAudioLayer:I

    .line 115
    .line 116
    return-void
.end method

.method private terminate()V
    .locals 4

    .line 1
    const-string v0, "terminate("

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "WebRtcAudioManager"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, ")"

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->recordingCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    :try_start_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Landroid/media/AudioManager;->unregisterAudioRecordingCallback(Landroid/media/AudioManager$AudioRecordingCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    goto :goto_1

    .line 46
    :catch_0
    move-exception v0

    .line 47
    :try_start_2
    new-instance v2, Ljava/io/StringWriter;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v3, Ljava/io/PrintWriter;

    .line 53
    .line 54
    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "WebRtcAudioManager"

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->recordingCallback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;

    .line 70
    .line 71
    :cond_0
    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->registerPhoneStateListener(I)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mVolumeChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;

    .line 76
    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->release()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mVolumeChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;

    .line 83
    .line 84
    :cond_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mMicMuteChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

    .line 85
    .line 86
    if-eqz v2, :cond_2

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->release()V

    .line 89
    .line 90
    .line 91
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mMicMuteChangedObserver:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

    .line 92
    .line 93
    :cond_2
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 94
    .line 95
    if-eqz v2, :cond_3

    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->ByteAudioEarBackRelease()V

    .line 98
    .line 99
    .line 100
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 101
    .line 102
    :cond_3
    const-wide/16 v1, 0x0

    .line 103
    .line 104
    iput-wide v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 105
    .line 106
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->initialized:Z

    .line 107
    .line 108
    monitor-exit p0

    .line 109
    return-void

    .line 110
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    throw v0
.end method


# virtual methods
.method public isLowLatencyInputSupported()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->isLowLatencyOutputSupported()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onEvent(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->mByteAudioEarback:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onEvent(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onHardwareEarbackReleased(Z)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnHardwareEarbackReleased(ZJ)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method public onHardwareEarbackSupportParamsGet(Ljava/lang/String;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnHardwareEarbackSupportParamsGet(Ljava/lang/String;J)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method public onHardwareEarbackSupported(Z)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnHardwareEarbackSupported(ZJ)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method public onMicMuteChanged(Z)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeOnMicMuteChanged(ZJ)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method public onVolumeChanged(II)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->MAX_VOLUMED_VOIP:I

    .line 4
    .line 5
    :goto_0
    int-to-double v0, v0

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    sget v0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->MAX_VOLUMED:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :goto_1
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 11
    .line 12
    int-to-double v4, p2

    .line 13
    mul-double/2addr v4, v2

    .line 14
    div-double/2addr v4, v0

    .line 15
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 16
    .line 17
    mul-double/2addr v4, v0

    .line 18
    monitor-enter p0

    .line 19
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->nativeAudioManager:J

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long p2, v0, v2

    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    double-to-int p2, v4

    .line 28
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->onVolumeChanged(IIJ)V

    .line 29
    .line 30
    .line 31
    goto :goto_2

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_3

    .line 34
    :cond_1
    :goto_2
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p1
.end method
