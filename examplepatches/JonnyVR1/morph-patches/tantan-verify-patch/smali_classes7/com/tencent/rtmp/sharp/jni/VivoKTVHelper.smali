.class public Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final KEY_EXT_SPKR:Ljava/lang/String; = "vivo_ktv_ext_speaker"

.field private static final KEY_KTV_MODE:Ljava/lang/String; = "vivo_ktv_mode"

.field private static final KEY_MIC_SRC:Ljava/lang/String; = "vivo_ktv_rec_source"

.field private static final KEY_MIC_TYPE:Ljava/lang/String; = "vivo_ktv_mic_type"

.field private static final KEY_PLAY_SRC:Ljava/lang/String; = "vivo_ktv_play_source"

.field private static final KEY_PRESET:Ljava/lang/String; = "vivo_ktv_preset_effect"

.field private static final KEY_VOL_MIC:Ljava/lang/String; = "vivo_ktv_volume_mic"

.field private static final TAG:Ljava/lang/String; = "VivoKTVHelper"

.field private static mVivoKTVHelper:Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mContext:Landroid/content/Context;

.field private final mParamLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    const-string v0, "audio"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/media/AudioManager;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 22
    .line 23
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mVivoKTVHelper:Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mVivoKTVHelper:Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mVivoKTVHelper:Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;

    .line 13
    .line 14
    return-object p0
.end method

.method private getKTVParam(Ljava/lang/String;)I
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "vivo"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ljava/util/StringTokenizer;

    .line 22
    .line 23
    const-string v1, "="

    .line 24
    .line 25
    invoke-direct {v0, p0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/4 v1, 0x2

    .line 33
    if-eq p0, v1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method


# virtual methods
.method public closeKTVDevice()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v0, "vivo_ktv_mode=0"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getExtSpeakerParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_ext_speaker"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMicTypeParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_mic_type"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMicVolParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_volume_mic"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPlayFeedbackParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_play_source"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPreModeParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_preset_effect"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVoiceOutParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_rec_source"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isDeviceSupportKaraoke()Z
    .locals 4

    .line 1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "vivo"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 17
    .line 18
    const-string v0, "vivo_ktv_mic_type"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v2, Ljava/util/StringTokenizer;

    .line 25
    .line 26
    const-string v3, "="

    .line 27
    .line 28
    invoke-direct {v2, p0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->countTokens()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/4 v3, 0x2

    .line 36
    if-eq p0, v3, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const/4 v0, 0x1

    .line 58
    if-eq p0, v0, :cond_1

    .line 59
    .line 60
    if-nez p0, :cond_2

    .line 61
    .line 62
    :cond_1
    return v0

    .line 63
    :cond_2
    return v1
.end method

.method public openKTVDevice()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v1, "vivo_ktv_mode=1"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->isDeviceSupportKaraoke()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setExtSpeakerParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_ext_speaker="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public setMicVolParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_volume_mic="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public setPlayFeedbackParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_play_source="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public setPreModeParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_preset_effect="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public setVoiceOutParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_rec_source="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
