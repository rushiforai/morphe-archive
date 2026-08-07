.class public Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;
    }
.end annotation


# static fields
.field private static final BITS_PER_SAMPLE:I = 0x10

.field private static final DEBUG:Z = false

.field private static final DEFAULT_FRAME_PER_BUFFER:I = 0x100

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioManager"

.field private static final blacklistDeviceForAAudioUsage:Z = true

.field private static blacklistDeviceForOpenSLESUsage:Z = false

.field private static blacklistDeviceForOpenSLESUsageIsOverridden:Z = false

.field private static useStereoInput:Z = false

.field private static useStereoOutput:Z = true


# instance fields
.field private aAudio:Z

.field private final audioManager:Landroid/media/AudioManager;

.field private hardwareAEC:Z

.field private hardwareAGC:Z

.field private hardwareNS:Z

.field private initialized:Z

.field private inputBufferSize:I

.field private inputChannels:I

.field private lowLatencyInput:Z

.field private lowLatencyOutput:Z

.field private final nativeAudioManager:J

.field private nativeChannels:I

.field private nativeSampleRate:I

.field private outputBufferSize:I

.field private outputChannels:I

.field private proAudio:Z

.field private sampleRate:I

.field private final volumeLogger:Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(J)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "ctor"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v15, "WebRtcAudioManager"

    .line 25
    .line 26
    invoke-static {v15, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    move-wide/from16 v13, p1

    .line 30
    .line 31
    iput-wide v13, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->nativeAudioManager:J

    .line 32
    .line 33
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "audio"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/media/AudioManager;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 46
    .line 47
    new-instance v2, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;

    .line 48
    .line 49
    invoke-direct {v2, v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;-><init>(Landroid/media/AudioManager;)V

    .line 50
    .line 51
    .line 52
    iput-object v2, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->volumeLogger:Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;

    .line 53
    .line 54
    invoke-direct {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->storeAudioParameters()V

    .line 55
    .line 56
    .line 57
    iget v1, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->sampleRate:I

    .line 58
    .line 59
    iget v2, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputChannels:I

    .line 60
    .line 61
    iget v3, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputChannels:I

    .line 62
    .line 63
    iget-boolean v4, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareAEC:Z

    .line 64
    .line 65
    iget-boolean v5, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareAGC:Z

    .line 66
    .line 67
    iget-boolean v6, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareNS:Z

    .line 68
    .line 69
    iget-boolean v7, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 70
    .line 71
    iget-boolean v8, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyInput:Z

    .line 72
    .line 73
    iget-boolean v9, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->proAudio:Z

    .line 74
    .line 75
    iget-boolean v10, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->aAudio:Z

    .line 76
    .line 77
    iget v11, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputBufferSize:I

    .line 78
    .line 79
    iget v12, v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputBufferSize:I

    .line 80
    .line 81
    invoke-direct/range {v0 .. v14}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->nativeCacheAudioParameters(IIIZZZZZZZIIJ)V

    .line 82
    .line 83
    .line 84
    invoke-static {v15}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->logAudioState(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
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

.method private dispose()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "dispose"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "WebRtcAudioManager"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->initialized:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->volumeLogger:Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;->access$100(Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private getLowLatencyInputFramesPerBuffer()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isLowLatencyInputSupported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->assertTrue(Z)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getLowLatencyOutputFramesPerBuffer()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private getLowLatencyOutputFramesPerBuffer()I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isLowLatencyOutputSupported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->assertTrue(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 9
    .line 10
    const-string v0, "android.media.property.OUTPUT_FRAMES_PER_BUFFER"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/16 p0, 0x100

    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
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

.method private getNativeOutputSampleRate()I
    .locals 4

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->runningOnEmulator()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "WebRtcAudioManager"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Running emulator, overriding sample rate to 8 kHz."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, 0x1f40

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->isDefaultSampleRateOverridden()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v2, " Hz"

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    new-instance p0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v0, "Default sample rate is overriden to "

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getSampleRateForApiLevel()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v3, "Sample rate is set to "

    .line 61
    .line 62
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return p0
.end method

.method private getSampleRateForApiLevel()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

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

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getDefaultSampleRateHz()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public static declared-synchronized getStereoInput()Z
    .locals 2

    .line 1
    const-class v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->useStereoInput:Z
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
    const-class v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->useStereoOutput:Z
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
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "init"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "WebRtcAudioManager"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->initialized:Z

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return v2

    .line 30
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v3, "audio mode is: "

    .line 33
    .line 34
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/media/AudioManager;->getMode()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-static {v3}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->modeToString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iput-boolean v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->initialized:Z

    .line 58
    .line 59
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->volumeLogger:Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager$VolumeLogger;->start()V

    .line 62
    .line 63
    .line 64
    return v2
.end method

.method private isAAudioSupported()Z
    .locals 1

    .line 1
    const-string p0, "WebRtcAudioManager"

    .line 2
    .line 3
    const-string v0, "AAudio support is currently disabled on all devices!"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private static isAcousticEchoCancelerSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->canUseAcousticEchoCanceler()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method private isCommunicationModeEnabled()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->audioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioManager;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x3

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private isDeviceBlacklistedForOpenSLESUsage()Z
    .locals 2

    .line 1
    sget-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsageIsOverridden:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsage:Z

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->deviceIsBlacklistedForOpenSLESUsage()Z

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return p0
.end method

.method private isLowLatencyOutputSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

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
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioEffects;->canUseNoiseSuppressor()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method private isProAudioSupported()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/ContextUtils;->getApplicationContext()Landroid/content/Context;

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

.method private native nativeCacheAudioParameters(IIIZZZZZZZIIJ)V
.end method

.method public static declared-synchronized setBlacklistDeviceForOpenSLESUsage(Z)V
    .locals 2

    .line 1
    const-class v0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    sput-boolean v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsageIsOverridden:Z

    .line 6
    .line 7
    sput-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->blacklistDeviceForOpenSLESUsage:Z
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
    const-class v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;

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
    invoke-static {v2, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->useStereoInput:Z
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
    const-class v1, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;

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
    const/16 p0, 0x29

    .line 17
    .line 18
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v2, p0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    sput-boolean p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->useStereoOutput:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit v1

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p0
.end method

.method private storeAudioParameters()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getStereoOutput()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x2

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    iput v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputChannels:I

    .line 13
    .line 14
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getStereoInput()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    move v1, v2

    .line 21
    :cond_1
    iput v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputChannels:I

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getNativeOutputSampleRate()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->sampleRate:I

    .line 28
    .line 29
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isAcousticEchoCancelerSupported()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareAEC:Z

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareAGC:Z

    .line 37
    .line 38
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isNoiseSuppressorSupported()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareNS:Z

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isLowLatencyOutputSupported()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isLowLatencyInputSupported()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyInput:Z

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isProAudioSupported()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->proAudio:Z

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isAAudioSupported()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->aAudio:Z

    .line 67
    .line 68
    iget-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getLowLatencyOutputFramesPerBuffer()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    iget v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->sampleRate:I

    .line 78
    .line 79
    iget v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputChannels:I

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getMinOutputFrameSize(II)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    :goto_1
    iput v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputBufferSize:I

    .line 86
    .line 87
    iget-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyInput:Z

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getLowLatencyInputFramesPerBuffer()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    goto :goto_2

    .line 96
    :cond_3
    iget v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->sampleRate:I

    .line 97
    .line 98
    iget v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputChannels:I

    .line 99
    .line 100
    invoke-static {v0, v1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->getMinInputFrameSize(II)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    :goto_2
    iput v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputBufferSize:I

    .line 105
    .line 106
    return-void
.end method

.method private update()V
    .locals 15

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->storeAudioParameters()V

    .line 2
    .line 3
    .line 4
    iget v1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->sampleRate:I

    .line 5
    .line 6
    iget v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputChannels:I

    .line 7
    .line 8
    iget v3, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputChannels:I

    .line 9
    .line 10
    iget-boolean v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareAEC:Z

    .line 11
    .line 12
    iget-boolean v5, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareAGC:Z

    .line 13
    .line 14
    iget-boolean v6, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->hardwareNS:Z

    .line 15
    .line 16
    iget-boolean v7, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyOutput:Z

    .line 17
    .line 18
    iget-boolean v8, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->lowLatencyInput:Z

    .line 19
    .line 20
    iget-boolean v9, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->proAudio:Z

    .line 21
    .line 22
    iget-boolean v10, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->aAudio:Z

    .line 23
    .line 24
    iget v11, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->outputBufferSize:I

    .line 25
    .line 26
    iget v12, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->inputBufferSize:I

    .line 27
    .line 28
    iget-wide v13, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->nativeAudioManager:J

    .line 29
    .line 30
    move-object v0, p0

    .line 31
    invoke-direct/range {v0 .. v14}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->nativeCacheAudioParameters(IIIZZZZZZZIIJ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public isLowLatencyInputSupported()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioManager;->isLowLatencyOutputSupported()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
