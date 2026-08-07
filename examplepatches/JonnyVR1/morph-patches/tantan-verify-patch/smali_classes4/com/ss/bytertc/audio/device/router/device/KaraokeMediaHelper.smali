.class public Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final KARAOKE_APP_SUPPORT:Ljava/lang/String;

.field private final KARAOKE_ENABLE:Ljava/lang/String;

.field private final KARAOKE_EQ:Ljava/lang/String;

.field private final KARAOKE_KTVMODE:Ljava/lang/String;

.field private final KARAOKE_REVERB:Ljava/lang/String;

.field private final KARAOKE_SUPPORT:Ljava/lang/String;

.field private final KARAOKE_VOLUME:Ljava/lang/String;

.field private final VOLUME_MAX_APP:I

.field private final VOLUME_MIN_APP:I

.field private mAudioManager:Landroid/media/AudioManager;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mEnabled:I

.field private mEqMode:I

.field private mInitialized:Z

.field private mReverbMode:I

.field private mSp:Landroid/content/SharedPreferences;

.field private mVolume:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "audio_karaoke_enable"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_ENABLE:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "audio_karaoke_volume"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_VOLUME:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "audio_karaoke_EQ"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_EQ:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "karaoke_Reverb"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_REVERB:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "audio_karaoke_support"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_SUPPORT:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "karaoke_app_support"

    .line 25
    .line 26
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_APP_SUPPORT:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "audio_karaoke_ktvmode"

    .line 29
    .line 30
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->KARAOKE_KTVMODE:Ljava/lang/String;

    .line 31
    .line 32
    const/16 v0, 0xf

    .line 33
    .line 34
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->VOLUME_MAX_APP:I

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->VOLUME_MIN_APP:I

    .line 38
    .line 39
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mContext:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mContentResolver:Landroid/content/ContentResolver;

    .line 46
    .line 47
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mContext:Landroid/content/Context;

    .line 48
    .line 49
    const-string v1, "audio"

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Landroid/media/AudioManager;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 58
    .line 59
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mContext:Landroid/content/Context;

    .line 60
    .line 61
    const-string v1, "loopback_mode"

    .line 62
    .line 63
    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mSp:Landroid/content/SharedPreferences;

    .line 68
    .line 69
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mInitialized:Z

    .line 70
    .line 71
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public closeKTVDevice()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v1, "audio_karaoke_ktvmode=disable"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mInitialized:Z

    .line 10
    .line 11
    return-void
.end method

.method public getMicVolParam()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mVolume:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlayFeedbackParam()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->isEnable()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

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

.method public isAppSupportKaraoke(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "karaoke_app_support:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "true"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public isDeviceSupportKaraoke()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v0, "audio_karaoke_support"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "true"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public isEnable()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mEnabled:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public openKTVDevice()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mInitialized:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mSp:Landroid/content/SharedPreferences;

    .line 7
    .line 8
    const-string v1, "audio_karaoke_volume"

    .line 9
    .line 10
    const/16 v2, 0x32

    .line 11
    .line 12
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mVolume:I

    .line 17
    .line 18
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mSp:Landroid/content/SharedPreferences;

    .line 19
    .line 20
    const-string v1, "audio_karaoke_EQ"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mEqMode:I

    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mSp:Landroid/content/SharedPreferences;

    .line 30
    .line 31
    const-string v1, "karaoke_Reverb"

    .line 32
    .line 33
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mReverbMode:I

    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 40
    .line 41
    const-string v1, "audio_karaoke_ktvmode=enable"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v2, "audio_karaoke_volume="

    .line 51
    .line 52
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mVolume:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 68
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v2, "audio_karaoke_EQ="

    .line 72
    .line 73
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mEqMode:I

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 89
    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v2, "karaoke_Reverb="

    .line 93
    .line 94
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mReverbMode:I

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const/4 v0, 0x1

    .line 110
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mInitialized:Z

    .line 111
    .line 112
    return-void
.end method

.method public setFeedbackEffect(I)V
    .locals 3

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-gt p1, v0, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mReverbMode:I

    .line 7
    .line 8
    if-eq v0, p1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "karaoke_Reverb="

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mReverbMode:I

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setMicVolParam(I)V
    .locals 3

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    if-le p1, v0, :cond_0

    .line 4
    .line 5
    move p1, v0

    .line 6
    :cond_0
    if-gez p1, :cond_1

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    :cond_1
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mVolume:I

    .line 10
    .line 11
    if-eq v0, p1, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->isEnable()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "audio_karaoke_volume="

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mVolume:I

    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public setPlayFeedbackParam(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mEnabled:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mEnabled:I

    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/KaraokeMediaHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "audio_karaoke_enable="

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
