.class public Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final audioManager:Landroid/media/AudioManager;

.field private audioRecordErrorCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioRecordErrorCallback;

.field private audioSource:I

.field private audioTrackErrorCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioTrackErrorCallback;

.field private final context:Landroid/content/Context;

.field private sampleRate:I

.field private samplesReadyCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;

.field private useHardwareAcousticEchoCanceler:Z

.field private useHardwareNoiseSuppressor:Z

.field private useStereoInput:Z

.field private useStereoOutput:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x7

    .line 5
    iput v0, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioSource:I

    .line 6
    .line 7
    invoke-static {}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;->isBuiltInAcousticEchoCancelerSupported()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareAcousticEchoCanceler:Z

    .line 12
    .line 13
    invoke-static {}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;->isBuiltInNoiseSuppressorSupported()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput-boolean v0, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareNoiseSuppressor:Z

    .line 18
    .line 19
    iput-object p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->context:Landroid/content/Context;

    .line 20
    .line 21
    const-string v0, "audio"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Landroid/media/AudioManager;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioManager:Landroid/media/AudioManager;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/momo/rtcbase/audio/WebRtcAudioManager;->getSampleRate(Landroid/media/AudioManager;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->sampleRate:I

    .line 36
    .line 37
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$1;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public createAudioDeviceModule()Lcom/momo/rtcbase/audio/AudioDeviceModule;
    .locals 11

    .line 1
    const-string v0, "createAudioDeviceModule"

    .line 2
    .line 3
    const-string v1, "JavaAudioDeviceModule"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareNoiseSuppressor:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "HW NS will be used."

    .line 13
    .line 14
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;->isBuiltInNoiseSuppressorSupported()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string v0, "Overriding default behavior; now using WebRTC NS!"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    const-string v0, "HW NS will not be used."

    .line 30
    .line 31
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-boolean v0, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareAcousticEchoCanceler:Z

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const-string v0, "HW AEC will be used."

    .line 39
    .line 40
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-static {}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;->isBuiltInAcousticEchoCancelerSupported()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const-string v0, "Overriding default behavior; now using WebRTC AEC!"

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    const-string v0, "HW AEC will not be used."

    .line 56
    .line 57
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_1
    new-instance v2, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->context:Landroid/content/Context;

    .line 63
    .line 64
    iget-object v4, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioManager:Landroid/media/AudioManager;

    .line 65
    .line 66
    iget v5, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioSource:I

    .line 67
    .line 68
    iget-object v6, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioRecordErrorCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioRecordErrorCallback;

    .line 69
    .line 70
    iget-object v7, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->samplesReadyCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;

    .line 71
    .line 72
    iget-boolean v8, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareAcousticEchoCanceler:Z

    .line 73
    .line 74
    iget-boolean v9, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareNoiseSuppressor:Z

    .line 75
    .line 76
    invoke-direct/range {v2 .. v9}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;-><init>(Landroid/content/Context;Landroid/media/AudioManager;ILcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioRecordErrorCallback;Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;ZZ)V

    .line 77
    .line 78
    .line 79
    new-instance v6, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->context:Landroid/content/Context;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioManager:Landroid/media/AudioManager;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioTrackErrorCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioTrackErrorCallback;

    .line 86
    .line 87
    invoke-direct {v6, v0, v1, v3}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;-><init>(Landroid/content/Context;Landroid/media/AudioManager;Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioTrackErrorCallback;)V

    .line 88
    .line 89
    .line 90
    move-object v5, v2

    .line 91
    new-instance v2, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;

    .line 92
    .line 93
    iget-object v3, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->context:Landroid/content/Context;

    .line 94
    .line 95
    iget-object v4, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioManager:Landroid/media/AudioManager;

    .line 96
    .line 97
    iget v7, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->sampleRate:I

    .line 98
    .line 99
    iget-boolean v8, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useStereoInput:Z

    .line 100
    .line 101
    iget-boolean v9, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useStereoOutput:Z

    .line 102
    .line 103
    const/4 v10, 0x0

    .line 104
    invoke-direct/range {v2 .. v10}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;-><init>(Landroid/content/Context;Landroid/media/AudioManager;Lcom/momo/rtcbase/audio/WebRtcAudioRecord;Lcom/momo/rtcbase/audio/WebRtcAudioTrack;IZZLcom/momo/rtcbase/audio/JavaAudioDeviceModule$1;)V

    .line 105
    .line 106
    .line 107
    return-object v2
.end method

.method public setAudioRecordErrorCallback(Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioRecordErrorCallback;)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioRecordErrorCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioRecordErrorCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAudioSource(I)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioSource:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setAudioTrackErrorCallback(Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioTrackErrorCallback;)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->audioTrackErrorCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioTrackErrorCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public setSampleRate(I)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Sample rate overridden to: "

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "JavaAudioDeviceModule"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->sampleRate:I

    .line 21
    .line 22
    return-object p0
.end method

.method public setSamplesReadyCallback(Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->samplesReadyCallback:Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public setUseHardwareAcousticEchoCanceler(Z)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;->isBuiltInAcousticEchoCancelerSupported()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p1, "JavaAudioDeviceModule"

    .line 10
    .line 11
    const-string v0, "HW AEC not supported"

    .line 12
    .line 13
    invoke-static {p1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    :cond_0
    iput-boolean p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareAcousticEchoCanceler:Z

    .line 18
    .line 19
    return-object p0
.end method

.method public setUseHardwareNoiseSuppressor(Z)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule;->isBuiltInNoiseSuppressorSupported()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p1, "JavaAudioDeviceModule"

    .line 10
    .line 11
    const-string v0, "HW NS not supported"

    .line 12
    .line 13
    invoke-static {p1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    :cond_0
    iput-boolean p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useHardwareNoiseSuppressor:Z

    .line 18
    .line 19
    return-object p0
.end method

.method public setUseStereoInput(Z)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useStereoInput:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setUseStereoOutput(Z)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$Builder;->useStereoOutput:Z

    .line 2
    .line 3
    return-object p0
.end method
