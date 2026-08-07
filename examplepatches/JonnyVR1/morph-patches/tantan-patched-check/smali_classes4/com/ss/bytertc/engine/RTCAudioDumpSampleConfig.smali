.class public Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public aec_far_in_enable:Z

.field public aec_far_in_ref_enable:Z

.field public aec_near_in_enable:Z

.field public aec_out_enable:Z

.field public agc_out_enable:Z

.field public ainr_out_enable:Z

.field public audio_share_in_enable:Z

.field public audio_share_out_enable:Z

.field public audio_share_win_ref_enable:Z

.field public decoder_out_enable:Z

.field public external_audio_in_enable:Z

.field public front_aec_near_ref_enable:Z

.field public loopback_device_in_enable:Z

.field public mix_out_enable:Z

.field public ns_out_enable:Z

.field public pitchfilter_out_enable:Z

.field public postprocess_out_enable:Z

.field public push_audio_frame_in_enable:Z

.field public remotefilter_out_enable:Z

.field public send2encoder_enable:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_near_in_enable:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_enable:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_ref_enable:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_out_enable:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->agc_out_enable:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ns_out_enable:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ainr_out_enable:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->mix_out_enable:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->send2encoder_enable:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_in_enable:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_win_ref_enable:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_out_enable:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->external_audio_in_enable:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->pitchfilter_out_enable:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->decoder_out_enable:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->front_aec_near_ref_enable:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->postprocess_out_enable:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->remotefilter_out_enable:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->push_audio_frame_in_enable:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->loopback_device_in_enable:Z

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->reset()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_near_in_enable:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_enable:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_ref_enable:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_out_enable:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->agc_out_enable:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ns_out_enable:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ainr_out_enable:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->mix_out_enable:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->send2encoder_enable:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_in_enable:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_win_ref_enable:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_out_enable:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->external_audio_in_enable:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->pitchfilter_out_enable:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->decoder_out_enable:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->front_aec_near_ref_enable:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->postprocess_out_enable:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->remotefilter_out_enable:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->push_audio_frame_in_enable:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->loopback_device_in_enable:Z

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public AllMode()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_near_in_enable:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_enable:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_ref_enable:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_out_enable:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->agc_out_enable:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ns_out_enable:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ainr_out_enable:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->mix_out_enable:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->send2encoder_enable:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_in_enable:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_win_ref_enable:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_out_enable:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->external_audio_in_enable:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->pitchfilter_out_enable:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->decoder_out_enable:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->front_aec_near_ref_enable:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->postprocess_out_enable:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->remotefilter_out_enable:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->push_audio_frame_in_enable:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->loopback_device_in_enable:Z

    .line 41
    .line 42
    return-void
.end method

.method public NormalMode()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->reset()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_near_in_enable:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_ref_enable:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->mix_out_enable:Z

    .line 10
    .line 11
    return-void
.end method

.method public getAecFarIn()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAecFarInRef()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_ref_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAecNearIn()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_near_in_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAecOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAgcOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->agc_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAinrOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ainr_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAudioShareIn()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_in_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAudioShareOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAudioShareWinRef()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_win_ref_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getDecodeOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->decoder_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getExternalAudioIn()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->external_audio_in_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getFrontAecRef()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->front_aec_near_ref_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLoopbackDeviceIn()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->loopback_device_in_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMixOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->mix_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getNsOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ns_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPitchFilterOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->pitchfilter_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPostProcessOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->postprocess_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPushAudioFrameIn()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->push_audio_frame_in_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRemoteFilterOut()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->remotefilter_out_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSend2encoder()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->send2encoder_enable:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_near_in_enable:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "[\"aec_near_in\","

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "["

    .line 9
    .line 10
    :goto_0
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_enable:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const-string v1, "\"aec_far_in\","

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :cond_1
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_far_in_ref_enable:Z

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    const-string v1, "\"aec_far_in_ref\","

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_2
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->aec_out_enable:Z

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    const-string v1, "\"aec_out\","

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_3
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->agc_out_enable:Z

    .line 41
    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    const-string v1, "\"agc_out\","

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_4
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ns_out_enable:Z

    .line 51
    .line 52
    if-eqz v1, :cond_5

    .line 53
    .line 54
    const-string v1, "\"ns_out\","

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :cond_5
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->ainr_out_enable:Z

    .line 61
    .line 62
    if-eqz v1, :cond_6

    .line 63
    .line 64
    const-string v1, "\"ainr_out\","

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_6
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->mix_out_enable:Z

    .line 71
    .line 72
    if-eqz v1, :cond_7

    .line 73
    .line 74
    const-string v1, "\"mix_out\","

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    :cond_7
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->send2encoder_enable:Z

    .line 81
    .line 82
    if-eqz v1, :cond_8

    .line 83
    .line 84
    const-string v1, "\"send2encoder\","

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    :cond_8
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_in_enable:Z

    .line 91
    .line 92
    if-eqz v1, :cond_9

    .line 93
    .line 94
    const-string v1, "\"audio_share_in\","

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :cond_9
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_win_ref_enable:Z

    .line 101
    .line 102
    if-eqz v1, :cond_a

    .line 103
    .line 104
    const-string v1, "\"audio_share_win_ref\","

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    :cond_a
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->audio_share_out_enable:Z

    .line 111
    .line 112
    if-eqz v1, :cond_b

    .line 113
    .line 114
    const-string v1, "\"audio_share_out\","

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    :cond_b
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->external_audio_in_enable:Z

    .line 121
    .line 122
    if-eqz v1, :cond_c

    .line 123
    .line 124
    const-string v1, "\"external_audio_in\","

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    :cond_c
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->pitchfilter_out_enable:Z

    .line 131
    .line 132
    if-eqz v1, :cond_d

    .line 133
    .line 134
    const-string v1, "\"pitchfilter_out\","

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    :cond_d
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->decoder_out_enable:Z

    .line 141
    .line 142
    if-eqz v1, :cond_e

    .line 143
    .line 144
    const-string v1, "\"decoder_out\","

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    :cond_e
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/RTCAudioDumpSampleConfig;->front_aec_near_ref_enable:Z

    .line 151
    .line 152
    if-eqz p0, :cond_f

    .line 153
    .line 154
    const-string p0, "\"front_aec_near_ref\","

    .line 155
    .line 156
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    :cond_f
    const-string p0, "]"

    .line 161
    .line 162
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0
.end method
