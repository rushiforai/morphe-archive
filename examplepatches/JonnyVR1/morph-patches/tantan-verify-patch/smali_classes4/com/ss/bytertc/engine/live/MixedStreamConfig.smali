.class public Lcom/ss/bytertc/engine/live/MixedStreamConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "MixedStreamConfig"


# instance fields
.field public advancedConfig:Lorg/json/JSONObject;

.field public audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

.field public authInfo:Lorg/json/JSONObject;

.field public backgroundColor:Ljava/lang/String;

.field public backgroundImageURL:Ljava/lang/String;

.field public controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

.field public interpolationMode:Lcom/ss/bytertc/engine/live/InterpolationMode;

.field public layoutMode:Lcom/ss/bytertc/engine/live/StreamLayoutMode;

.field public regions:[Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;

.field public roomID:Ljava/lang/String;

.field public spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

.field public syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

.field public userConfigExtraInfo:Ljava/lang/String;

.field public userID:Ljava/lang/String;

.field public videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->regions:[Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userConfigExtraInfo:Ljava/lang/String;

    .line 10
    .line 11
    const-string v2, "#000000"

    .line 12
    .line 13
    iput-object v2, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundColor:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundImageURL:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->advancedConfig:Lorg/json/JSONObject;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->roomID:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userID:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->authInfo:Lorg/json/JSONObject;

    .line 24
    .line 25
    sget-object v0, Lcom/ss/bytertc/engine/live/InterpolationMode;->LAST_FRAME_FILL:Lcom/ss/bytertc/engine/live/InterpolationMode;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->interpolationMode:Lcom/ss/bytertc/engine/live/InterpolationMode;

    .line 28
    .line 29
    sget-object v0, Lcom/ss/bytertc/engine/live/StreamLayoutMode;->AUTO:Lcom/ss/bytertc/engine/live/StreamLayoutMode;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->layoutMode:Lcom/ss/bytertc/engine/live/StreamLayoutMode;

    .line 32
    .line 33
    return-void
.end method

.method public static defaultMixedStreamConfig()Lcom/ss/bytertc/engine/live/MixedStreamConfig;
    .locals 7

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/ss/bytertc/engine/live/MixedStreamVideoCodecType;->MIXED_STREAM_VIDEO_CODEC_TYPE_H264:Lcom/ss/bytertc/engine/live/MixedStreamVideoCodecType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->videoCodec:Lcom/ss/bytertc/engine/live/MixedStreamVideoCodecType;

    .line 9
    .line 10
    const/16 v1, 0xf

    .line 11
    .line 12
    iput v1, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->fps:I

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    iput v1, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->gop:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    iput-boolean v2, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->enableBframe:Z

    .line 19
    .line 20
    const/16 v3, 0x280

    .line 21
    .line 22
    iput v3, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->height:I

    .line 23
    .line 24
    const/16 v3, 0x168

    .line 25
    .line 26
    iput v3, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->width:I

    .line 27
    .line 28
    const/16 v3, 0x1f4

    .line 29
    .line 30
    iput v3, v0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->bitrate:I

    .line 31
    .line 32
    new-instance v3, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 33
    .line 34
    invoke-direct {v3}, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;-><init>()V

    .line 35
    .line 36
    .line 37
    sget-object v4, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->MIXED_STREAM_AUDIO_CODEC_TYPE_AAC:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 38
    .line 39
    iput-object v4, v3, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioCodec:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 40
    .line 41
    iput v1, v3, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->channels:I

    .line 42
    .line 43
    const/16 v1, 0x40

    .line 44
    .line 45
    iput v1, v3, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->bitrate:I

    .line 46
    .line 47
    const v1, 0xbb80

    .line 48
    .line 49
    .line 50
    iput v1, v3, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->sampleRate:I

    .line 51
    .line 52
    sget-object v1, Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;->MIXED_STREAM_AUDIO_PROFILE_LC:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 53
    .line 54
    iput-object v1, v3, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioProfile:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 55
    .line 56
    new-instance v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 57
    .line 58
    invoke-direct {v1}, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-boolean v2, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->enableVolumeIndication:Z

    .line 62
    .line 63
    sget-object v4, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->MIXED_STREAM_SEI_CONTENT_MODE_DEFAULT:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 64
    .line 65
    iput-object v4, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiContentMode:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 66
    .line 67
    iput-boolean v2, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->isAddVolumeValue:Z

    .line 68
    .line 69
    iput v2, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->talkVolume:I

    .line 70
    .line 71
    const/high16 v4, 0x40000000    # 2.0f

    .line 72
    .line 73
    iput v4, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->volumeIndicationInterval:F

    .line 74
    .line 75
    const/16 v4, 0x64

    .line 76
    .line 77
    iput v4, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadType:I

    .line 78
    .line 79
    const-string v4, ""

    .line 80
    .line 81
    iput-object v4, v1, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadUuid:Ljava/lang/String;

    .line 82
    .line 83
    new-instance v5, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 84
    .line 85
    invoke-direct {v5}, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v4, v5, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->baseUserID:Ljava/lang/String;

    .line 89
    .line 90
    sget-object v6, Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;->MIXED_STREAM_SYNC_STRATEGY_NO_SYNC:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 91
    .line 92
    iput-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->syncStrategy:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 93
    .line 94
    const/16 v6, 0x7d0

    .line 95
    .line 96
    iput v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->maxCacheTimeMs:I

    .line 97
    .line 98
    const/4 v6, 0x1

    .line 99
    iput-boolean v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->videoNeedSdkMix:Z

    .line 100
    .line 101
    new-instance v6, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 102
    .line 103
    invoke-direct {v6}, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-boolean v2, v6, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->enableSpatialRender:Z

    .line 107
    .line 108
    new-instance v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;

    .line 109
    .line 110
    invoke-direct {v2}, Lcom/ss/bytertc/engine/live/MixedStreamConfig;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v3, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 114
    .line 115
    iput-object v0, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 116
    .line 117
    iput-object v1, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 118
    .line 119
    iput-object v5, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 120
    .line 121
    iput-object v6, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 122
    .line 123
    const-string v0, "#000000"

    .line 124
    .line 125
    iput-object v0, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundColor:Ljava/lang/String;

    .line 126
    .line 127
    iput-object v4, v2, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userConfigExtraInfo:Ljava/lang/String;

    .line 128
    .line 129
    return-object v2
.end method


# virtual methods
.method public getMixedStreamAdvancedConfig()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->advancedConfig:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getMixedStreamAudioConfigAudioProfile()Ljava/lang/String;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioProfile:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;->getValue()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getMixedStreamAudioConfigChannels()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->channels:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamAudioConfigCodec()Ljava/lang/String;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioCodec:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->getValue()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getMixedStreamAudioConfigSampleRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->sampleRate:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamAuthInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->authInfo:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getMixedStreamBackgroundColor()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundColor:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getMixedStreamBackgroundImageURL()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundImageURL:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getMixedStreamInterpolationMode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->interpolationMode:Lcom/ss/bytertc/engine/live/InterpolationMode;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/InterpolationMode;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMixedStreamLayoutMode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->layoutMode:Lcom/ss/bytertc/engine/live/StreamLayoutMode;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/StreamLayoutMode;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionAlpha(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)D
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    iget-wide p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alpha:D

    .line 7
    .line 8
    return-wide p0
.end method

.method public getMixedStreamLayoutRegionAlternateImageFillMode(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;->FIT:Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alternateImageFillMode:Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;->getValue()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public getMixedStreamLayoutRegionAlternateImageURL(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alternateImageURL:Ljava/lang/String;

    .line 7
    .line 8
    return-object p0
.end method

.method public getMixedStreamLayoutRegionApplySpatialAudio(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    iget-boolean p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->applySpatialAudio:Z

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionConfigs()[Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->regions:[Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMixedStreamLayoutRegionContentType(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->regionContentType:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionType;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionType;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getMixedStreamLayoutRegionCornerRadius(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)D
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    iget-wide p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->cornerRadius:D

    .line 7
    .line 8
    return-wide p0
.end method

.method public getMixedStreamLayoutRegionData(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)[B
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->imageWaterMark:[B

    .line 6
    .line 7
    return-object p0
.end method

.method public getMixedStreamLayoutRegionDataParamImageHeight(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->imageWaterMarkConfig:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;->imageHeight:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamLayoutRegionDataParamImageWidth(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->imageWaterMarkConfig:Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionImageWaterMarkConfig;->imageWidth:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamLayoutRegionH(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->height:I

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionLocalUser(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-boolean p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->isLocalUser:Z

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionMediaType(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamMediaType;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getMixedStreamLayoutRegionRenderMode(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->renderMode:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getMixedStreamLayoutRegionRoomID(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p1, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->roomID:Ljava/lang/String;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    return-object p1
.end method

.method public getMixedStreamLayoutRegionScreenStream(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->streamType:Lcom/ss/bytertc/engine/live/MixedStreamVideoType;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamVideoType;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getMixedStreamLayoutRegionSpatialPositionX(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->spatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->x:F

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamLayoutRegionSpatialPositionY(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->spatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->y:F

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamLayoutRegionSpatialPositionZ(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->spatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 6
    .line 7
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->z:F

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamLayoutRegionUserID(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p1, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->userID:Ljava/lang/String;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    return-object p1
.end method

.method public getMixedStreamLayoutRegionW(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->width:I

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionX(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->locationX:I

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionY(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->locationY:I

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutRegionZOrder(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->zOrder:I

    .line 6
    .line 7
    return p0
.end method

.method public getMixedStreamLayoutSourceCropH(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)D
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 7
    .line 8
    iget-wide p0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->heightProportion:D

    .line 9
    .line 10
    return-wide p0
.end method

.method public getMixedStreamLayoutSourceCropW(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)D
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 7
    .line 8
    iget-wide p0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->widthProportion:D

    .line 9
    .line 10
    return-wide p0
.end method

.method public getMixedStreamLayoutSourceCropX(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)D
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 7
    .line 8
    iget-wide p0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->locationX:D

    .line 9
    .line 10
    return-wide p0
.end method

.method public getMixedStreamLayoutSourceCropY(Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;)D
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-wide/16 p0, 0x0

    .line 4
    .line 5
    return-wide p0

    .line 6
    :cond_0
    iget-object p0, p1, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 7
    .line 8
    iget-wide p0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->locationY:D

    .line 9
    .line 10
    return-wide p0
.end method

.method public getMixedStreamLayoutmode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->layoutMode:Lcom/ss/bytertc/engine/live/StreamLayoutMode;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/StreamLayoutMode;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMixedStreamRoomID()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->roomID:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getMixedStreamServerControlConfigEnableVolumeIndication()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->enableVolumeIndication:Z

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamServerControlConfigIsAddVolumeValue()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->isAddVolumeValue:Z

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamServerControlConfigMediaType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/ss/bytertc/engine/live/MixedStreamMediaType;->MIXED_STREAM_MEDIA_TYPE_AUDIO_AND_VIDEO:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamMediaType;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 13
    .line 14
    goto :goto_0
.end method

.method public getMixedStreamServerControlConfigPushStreamMode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/ss/bytertc/engine/live/MixedStreamPushMode;->ON_STREAM:Lcom/ss/bytertc/engine/live/MixedStreamPushMode;

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamPushMode;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->pushStreamMode:Lcom/ss/bytertc/engine/live/MixedStreamPushMode;

    .line 13
    .line 14
    goto :goto_0
.end method

.method public getMixedStreamServerControlConfigSeiContentMode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->MIXED_STREAM_SEI_CONTENT_MODE_DEFAULT:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiContentMode:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 13
    .line 14
    goto :goto_0
.end method

.method public getMixedStreamServerControlConfigSeiPayloadType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadType:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamServerControlConfigSeiPayloadUuid()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadUuid:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public getMixedStreamServerControlConfigTalkVolume()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->talkVolume:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamServerControlConfigVolumeIndicationInterval()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x40000000    # 2.0f

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->volumeIndicationInterval:F

    .line 9
    .line 10
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationForwardX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->x:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationForwardY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->y:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationForwardZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->forward:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->z:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationRightX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->x:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationRightY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->y:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationRightZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->right:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->z:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationUpX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->x:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationUpY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->y:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialOrientationUpZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/HumanOrientation;->up:Lcom/ss/bytertc/engine/data/Orientation;

    .line 10
    .line 11
    iget p0, p0, Lcom/ss/bytertc/engine/data/Orientation;->z:F

    .line 12
    .line 13
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialPositionX()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 8
    .line 9
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->x:F

    .line 10
    .line 11
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialPositionY()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 8
    .line 9
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->y:F

    .line 10
    .line 11
    return p0
.end method

.method public getMixedStreamSpatialConfigAudienceSpatialPositionZ()F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 8
    .line 9
    iget p0, p0, Lcom/ss/bytertc/engine/data/Position;->z:F

    .line 10
    .line 11
    return p0
.end method

.method public getMixedStreamSpatialConfigEnableSpatialRender()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->spatialAudioConfig:Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->enableSpatialRender:Z

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamSyncControlConfigBaseUser()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->baseUserID:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public getMixedStreamSyncControlConfigQueueLength()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->maxCacheTimeMs:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamSyncControlConfigSyncStrategy()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;->MIXED_STREAM_SYNC_STRATEGY_NO_SYNC:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->syncStrategy:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 13
    .line 14
    goto :goto_0
.end method

.method public getMixedStreamSyncControlConfigVideoNeedMix()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->videoNeedSdkMix:Z

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamUserConfigExtraInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userConfigExtraInfo:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getMixedStreamUserID()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userID:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getMixedStreamVideoConfigBFrame()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->enableBframe:Z

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamVideoConfigBitrate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->bitrate:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamVideoConfigCodec()Ljava/lang/String;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->videoCodec:Lcom/ss/bytertc/engine/live/MixedStreamVideoCodecType;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/live/MixedStreamVideoCodecType;->getValue()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getMixedStreamVideoConfigFps()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->fps:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamVideoConfigGop()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->gop:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamVideoConfigHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->height:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamVideoConfigWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->width:I

    .line 8
    .line 9
    return p0
.end method

.method public getMixedStreamaudioConfigBitrate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->bitrate:I

    .line 8
    .line 9
    return p0
.end method

.method public getTranscodeMessage()Lorg/json/JSONObject;
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "transcode"

    .line 4
    .line 5
    const-string v2, "mediaType"

    .line 6
    .line 7
    const-string v3, "height"

    .line 8
    .line 9
    const-string v4, "width"

    .line 10
    .line 11
    const-string v5, "bitrate"

    .line 12
    .line 13
    new-instance v6, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v7, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v8, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v9, Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v10, Lorg/json/JSONObject;

    .line 34
    .line 35
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v11, Lorg/json/JSONObject;

    .line 39
    .line 40
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 41
    .line 42
    .line 43
    new-instance v12, Lorg/json/JSONObject;

    .line 44
    .line 45
    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v12, Lorg/json/JSONArray;

    .line 49
    .line 50
    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 51
    .line 52
    .line 53
    new-instance v13, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 56
    .line 57
    .line 58
    new-instance v14, Lorg/json/JSONObject;

    .line 59
    .line 60
    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 61
    .line 62
    .line 63
    new-instance v15, Lorg/json/JSONObject;

    .line 64
    .line 65
    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    .line 66
    .line 67
    .line 68
    move-object/from16 v16, v15

    .line 69
    .line 70
    :try_start_0
    const-string v15, "videoCodec"

    .line 71
    .line 72
    move-object/from16 v17, v11

    .line 73
    .line 74
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 75
    .line 76
    iget-object v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->videoCodec:Lcom/ss/bytertc/engine/live/MixedStreamVideoCodecType;

    .line 77
    .line 78
    invoke-virtual {v6, v15, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    const-string v11, "fps"

    .line 82
    .line 83
    iget-object v15, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 84
    .line 85
    iget v15, v15, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->fps:I

    .line 86
    .line 87
    invoke-virtual {v6, v11, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string v11, "gop"

    .line 91
    .line 92
    iget-object v15, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 93
    .line 94
    iget v15, v15, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->gop:I

    .line 95
    .line 96
    invoke-virtual {v6, v11, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 100
    .line 101
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->bitrate:I

    .line 102
    .line 103
    invoke-virtual {v6, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 107
    .line 108
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->width:I

    .line 109
    .line 110
    invoke-virtual {v6, v4, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 114
    .line 115
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->height:I

    .line 116
    .line 117
    invoke-virtual {v6, v3, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 118
    .line 119
    .line 120
    const-string v11, "enableBframe"

    .line 121
    .line 122
    iget-object v15, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->videoConfig:Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;

    .line 123
    .line 124
    iget-boolean v15, v15, Lcom/ss/bytertc/engine/live/MixedStreamVideoConfig;->enableBframe:Z

    .line 125
    .line 126
    invoke-virtual {v6, v11, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 127
    .line 128
    .line 129
    const-string v11, "audioCodec"

    .line 130
    .line 131
    iget-object v15, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 132
    .line 133
    iget-object v15, v15, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioCodec:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 134
    .line 135
    invoke-virtual {v7, v11, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 139
    .line 140
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->bitrate:I

    .line 141
    .line 142
    invoke-virtual {v7, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 143
    .line 144
    .line 145
    const-string v5, "sampleRate"

    .line 146
    .line 147
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 148
    .line 149
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->sampleRate:I

    .line 150
    .line 151
    invoke-virtual {v7, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 152
    .line 153
    .line 154
    const-string v5, "channels"

    .line 155
    .line 156
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 157
    .line 158
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->channels:I

    .line 159
    .line 160
    invoke-virtual {v7, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 161
    .line 162
    .line 163
    const-string v5, "audioProfile"

    .line 164
    .line 165
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->audioConfig:Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;

    .line 166
    .line 167
    iget-object v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioProfile:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 168
    .line 169
    invoke-virtual {v7, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 170
    .line 171
    .line 172
    const-string v5, "enableVolumeIndication"

    .line 173
    .line 174
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 175
    .line 176
    iget-boolean v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->enableVolumeIndication:Z

    .line 177
    .line 178
    invoke-virtual {v8, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 179
    .line 180
    .line 181
    const-string v5, "talkVolume"

    .line 182
    .line 183
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 184
    .line 185
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->talkVolume:I

    .line 186
    .line 187
    invoke-virtual {v8, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 188
    .line 189
    .line 190
    const-string v5, "isAddVolumeValue"

    .line 191
    .line 192
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 193
    .line 194
    iget-boolean v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->isAddVolumeValue:Z

    .line 195
    .line 196
    invoke-virtual {v8, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    const-string v5, "volumeIndicationInterval"

    .line 200
    .line 201
    iget-object v11, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 202
    .line 203
    iget v11, v11, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->volumeIndicationInterval:F

    .line 204
    .line 205
    move-object v15, v6

    .line 206
    move-object/from16 v18, v7

    .line 207
    .line 208
    float-to-double v6, v11

    .line 209
    invoke-virtual {v8, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 210
    .line 211
    .line 212
    const-string v5, "seiContentMode"

    .line 213
    .line 214
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 215
    .line 216
    iget-object v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiContentMode:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 217
    .line 218
    invoke-virtual {v8, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    .line 220
    .line 221
    const-string v5, "seiPayloadType"

    .line 222
    .line 223
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 224
    .line 225
    iget v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadType:I

    .line 226
    .line 227
    invoke-virtual {v8, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 228
    .line 229
    .line 230
    const-string v5, "seiPayloadUuid"

    .line 231
    .line 232
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 233
    .line 234
    iget-object v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->seiPayloadUuid:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v8, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    .line 238
    .line 239
    iget-object v5, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 240
    .line 241
    iget-object v5, v5, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 242
    .line 243
    invoke-virtual {v8, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 244
    .line 245
    .line 246
    const-string v5, "pushStreamMode"

    .line 247
    .line 248
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->controlConfig:Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;

    .line 249
    .line 250
    iget-object v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamControlConfig;->pushStreamMode:Lcom/ss/bytertc/engine/live/MixedStreamPushMode;

    .line 251
    .line 252
    invoke-virtual {v8, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    .line 254
    .line 255
    const-string v5, "syncStrategy"

    .line 256
    .line 257
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 258
    .line 259
    iget-object v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->syncStrategy:Lcom/ss/bytertc/engine/live/MixedStreamSyncStrategy;

    .line 260
    .line 261
    invoke-virtual {v10, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 262
    .line 263
    .line 264
    const-string v5, "maxCacheTimeMs"

    .line 265
    .line 266
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 267
    .line 268
    iget v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->maxCacheTimeMs:I

    .line 269
    .line 270
    invoke-virtual {v10, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 271
    .line 272
    .line 273
    const-string v5, "videoNeedSdkMix"

    .line 274
    .line 275
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 276
    .line 277
    iget-boolean v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->videoNeedSdkMix:Z

    .line 278
    .line 279
    invoke-virtual {v10, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 280
    .line 281
    .line 282
    const-string v5, "baseuserID"

    .line 283
    .line 284
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->syncControlConfig:Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;

    .line 285
    .line 286
    iget-object v6, v6, Lcom/ss/bytertc/engine/live/MixedStreamSyncControlConfig;->baseUserID:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {v10, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 289
    .line 290
    .line 291
    const-string v5, "backgroundColor"

    .line 292
    .line 293
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundColor:Ljava/lang/String;

    .line 294
    .line 295
    invoke-virtual {v14, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    .line 297
    .line 298
    const-string v5, "backgroundImageURL"

    .line 299
    .line 300
    iget-object v6, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->backgroundImageURL:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {v14, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 303
    .line 304
    .line 305
    iget-object v5, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->regions:[Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    .line 307
    const-string v6, "roomID"

    .line 308
    .line 309
    const-string v7, "userID"

    .line 310
    .line 311
    if-eqz v5, :cond_0

    .line 312
    .line 313
    :try_start_1
    array-length v11, v5

    .line 314
    const/16 v19, 0x0

    .line 315
    .line 316
    move-object/from16 v20, v5

    .line 317
    .line 318
    move/from16 v5, v19

    .line 319
    .line 320
    :goto_0
    if-ge v5, v11, :cond_0

    .line 321
    .line 322
    move/from16 v19, v5

    .line 323
    .line 324
    aget-object v5, v20, v19

    .line 325
    .line 326
    move/from16 v21, v11

    .line 327
    .line 328
    new-instance v11, Lorg/json/JSONObject;

    .line 329
    .line 330
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 331
    .line 332
    .line 333
    move-object/from16 v22, v15

    .line 334
    .line 335
    iget-object v15, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->userID:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {v11, v7, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 338
    .line 339
    .line 340
    iget-object v15, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->roomID:Ljava/lang/String;

    .line 341
    .line 342
    invoke-virtual {v11, v6, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 343
    .line 344
    .line 345
    const-string v15, "locationX"

    .line 346
    .line 347
    move-object/from16 v23, v7

    .line 348
    .line 349
    iget v7, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->locationX:I

    .line 350
    .line 351
    invoke-virtual {v11, v15, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 352
    .line 353
    .line 354
    const-string v7, "locationY"

    .line 355
    .line 356
    iget v15, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->locationY:I

    .line 357
    .line 358
    invoke-virtual {v11, v7, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 359
    .line 360
    .line 361
    iget v7, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->width:I

    .line 362
    .line 363
    invoke-virtual {v11, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 364
    .line 365
    .line 366
    iget v7, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->height:I

    .line 367
    .line 368
    invoke-virtual {v11, v3, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 369
    .line 370
    .line 371
    const-string v7, "zOrder"

    .line 372
    .line 373
    iget v15, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->zOrder:I

    .line 374
    .line 375
    invoke-virtual {v11, v7, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 376
    .line 377
    .line 378
    const-string v7, "alpha"

    .line 379
    .line 380
    move-object v15, v3

    .line 381
    move-object/from16 v24, v4

    .line 382
    .line 383
    iget-wide v3, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alpha:D

    .line 384
    .line 385
    invoke-virtual {v11, v7, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 386
    .line 387
    .line 388
    const-string v3, "cornerRadius"

    .line 389
    .line 390
    move-object v4, v6

    .line 391
    iget-wide v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->cornerRadius:D

    .line 392
    .line 393
    invoke-virtual {v11, v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 394
    .line 395
    .line 396
    iget-object v3, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->mediaType:Lcom/ss/bytertc/engine/live/MixedStreamMediaType;

    .line 397
    .line 398
    invoke-virtual {v11, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 399
    .line 400
    .line 401
    const-string v3, "renderMode"

    .line 402
    .line 403
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->renderMode:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 404
    .line 405
    invoke-virtual {v11, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 406
    .line 407
    .line 408
    const-string v3, "isLocalUser"

    .line 409
    .line 410
    iget-boolean v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->isLocalUser:Z

    .line 411
    .line 412
    invoke-virtual {v11, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 413
    .line 414
    .line 415
    const-string v3, "streamType"

    .line 416
    .line 417
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->streamType:Lcom/ss/bytertc/engine/live/MixedStreamVideoType;

    .line 418
    .line 419
    invoke-virtual {v11, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 420
    .line 421
    .line 422
    const-string v3, "applySpatialAudio"

    .line 423
    .line 424
    iget-boolean v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->applySpatialAudio:Z

    .line 425
    .line 426
    invoke-virtual {v11, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 427
    .line 428
    .line 429
    const-string v3, "alternateImageFillMode"

    .line 430
    .line 431
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alternateImageFillMode:Lcom/ss/bytertc/engine/live/MixedStreamAlternateImageFillMode;

    .line 432
    .line 433
    invoke-virtual {v11, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 434
    .line 435
    .line 436
    const-string v3, "alternateImageURL"

    .line 437
    .line 438
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->alternateImageURL:Ljava/lang/String;

    .line 439
    .line 440
    invoke-virtual {v11, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 441
    .line 442
    .line 443
    const-string v3, "sourceCropX"

    .line 444
    .line 445
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 446
    .line 447
    iget-wide v6, v6, Lcom/ss/bytertc/engine/live/SourceCrop;->locationX:D

    .line 448
    .line 449
    invoke-virtual {v11, v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 450
    .line 451
    .line 452
    const-string v3, "sourceCropY"

    .line 453
    .line 454
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 455
    .line 456
    iget-wide v6, v6, Lcom/ss/bytertc/engine/live/SourceCrop;->locationY:D

    .line 457
    .line 458
    invoke-virtual {v11, v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 459
    .line 460
    .line 461
    const-string v3, "sourceCropW"

    .line 462
    .line 463
    iget-object v6, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 464
    .line 465
    iget-wide v6, v6, Lcom/ss/bytertc/engine/live/SourceCrop;->widthProportion:D

    .line 466
    .line 467
    invoke-virtual {v11, v3, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 468
    .line 469
    .line 470
    const-string v3, "sourceCropH"

    .line 471
    .line 472
    iget-object v5, v5, Lcom/ss/bytertc/engine/live/MixedStreamLayoutRegionConfig;->sourceCrop:Lcom/ss/bytertc/engine/live/SourceCrop;

    .line 473
    .line 474
    iget-wide v5, v5, Lcom/ss/bytertc/engine/live/SourceCrop;->heightProportion:D

    .line 475
    .line 476
    invoke-virtual {v11, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 480
    .line 481
    .line 482
    add-int/lit8 v5, v19, 0x1

    .line 483
    .line 484
    move-object v6, v4

    .line 485
    move-object v3, v15

    .line 486
    move/from16 v11, v21

    .line 487
    .line 488
    move-object/from16 v15, v22

    .line 489
    .line 490
    move-object/from16 v7, v23

    .line 491
    .line 492
    move-object/from16 v4, v24

    .line 493
    .line 494
    goto/16 :goto_0

    .line 495
    .line 496
    :cond_0
    move-object v4, v6

    .line 497
    move-object/from16 v23, v7

    .line 498
    .line 499
    move-object/from16 v22, v15

    .line 500
    .line 501
    const-string v2, "regions"

    .line 502
    .line 503
    invoke-virtual {v14, v2, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 504
    .line 505
    .line 506
    const-string v2, "userConfigExtraInfo"

    .line 507
    .line 508
    iget-object v3, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userConfigExtraInfo:Ljava/lang/String;

    .line 509
    .line 510
    invoke-virtual {v14, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 511
    .line 512
    .line 513
    invoke-virtual {v14, v1, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 514
    .line 515
    .line 516
    const-string v2, "video"

    .line 517
    .line 518
    move-object/from16 v15, v22

    .line 519
    .line 520
    invoke-virtual {v14, v2, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 521
    .line 522
    .line 523
    const-string v2, "audio"

    .line 524
    .line 525
    move-object/from16 v3, v18

    .line 526
    .line 527
    invoke-virtual {v14, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    .line 529
    .line 530
    const-string v2, "serverControl"

    .line 531
    .line 532
    invoke-virtual {v14, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 533
    .line 534
    .line 535
    const-string v2, "clientMix"

    .line 536
    .line 537
    invoke-virtual {v14, v2, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 538
    .line 539
    .line 540
    const-string v2, "syncControl"

    .line 541
    .line 542
    invoke-virtual {v14, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 543
    .line 544
    .line 545
    const-string v2, "layout"

    .line 546
    .line 547
    move-object/from16 v3, v17

    .line 548
    .line 549
    invoke-virtual {v14, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 550
    .line 551
    .line 552
    iget-object v2, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->advancedConfig:Lorg/json/JSONObject;

    .line 553
    .line 554
    if-eqz v2, :cond_1

    .line 555
    .line 556
    const-string v3, "advancedConfig"

    .line 557
    .line 558
    invoke-virtual {v14, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 559
    .line 560
    .line 561
    :cond_1
    iget-object v2, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->authInfo:Lorg/json/JSONObject;

    .line 562
    .line 563
    if-eqz v2, :cond_2

    .line 564
    .line 565
    const-string v3, "authInfo"

    .line 566
    .line 567
    invoke-virtual {v14, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 568
    .line 569
    .line 570
    :cond_2
    const-string v2, "type"

    .line 571
    .line 572
    move-object/from16 v3, v16

    .line 573
    .line 574
    invoke-virtual {v3, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 575
    .line 576
    .line 577
    iget-object v1, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->roomID:Ljava/lang/String;

    .line 578
    .line 579
    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 580
    .line 581
    .line 582
    iget-object v1, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->userID:Ljava/lang/String;

    .line 583
    .line 584
    move-object/from16 v2, v23

    .line 585
    .line 586
    invoke-virtual {v3, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 587
    .line 588
    .line 589
    const-string v1, "transcodeMeta"

    .line 590
    .line 591
    invoke-virtual {v3, v1, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 592
    .line 593
    .line 594
    const-string v1, "layoutMode"

    .line 595
    .line 596
    iget-object v2, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->layoutMode:Lcom/ss/bytertc/engine/live/StreamLayoutMode;

    .line 597
    .line 598
    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 599
    .line 600
    .line 601
    const-string v1, "interpolationMode"

    .line 602
    .line 603
    iget-object v0, v0, Lcom/ss/bytertc/engine/live/MixedStreamConfig;->interpolationMode:Lcom/ss/bytertc/engine/live/InterpolationMode;

    .line 604
    .line 605
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 606
    .line 607
    .line 608
    return-object v3

    .line 609
    :catch_0
    move-exception v0

    .line 610
    const-string v1, "MixedStreamConfig"

    .line 611
    .line 612
    const-string v2, "get json message happen exception"

    .line 613
    .line 614
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 615
    .line 616
    .line 617
    const/4 v0, 0x0

    .line 618
    return-object v0
.end method
