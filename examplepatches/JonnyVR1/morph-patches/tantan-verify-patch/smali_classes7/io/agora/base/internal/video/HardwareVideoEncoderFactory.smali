.class public Lio/agora/base/internal/video/HardwareVideoEncoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/VideoEncoderFactory;


# static fields
.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_L_MS:I = 0x3a98

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_M_MS:I = 0x4e20

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_N_MS:I = 0x3a98

.field private static final TAG:Ljava/lang/String; = "HardwareVideoEncoderFactory"


# instance fields
.field private final enableH264HighProfile:Z

.field private final enableIntelVp8Encoder:Z

.field private final sharedContext:Lio/agora/base/internal/video/EglBase$Context;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 5
    .line 6
    iput-boolean p2, p0, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->enableIntelVp8Encoder:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->enableH264HighProfile:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, v0, p1, p2}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;-><init>(Lio/agora/base/internal/video/EglBase$Context;ZZ)V

    return-void
.end method

.method private createBitrateAdjuster(Lio/agora/base/internal/video/VideoCodecType;Ljava/lang/String;)Lio/agora/base/internal/video/BitrateAdjuster;
    .locals 1

    .line 1
    const-string p0, "OMX.Exynos."

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x3b6

    .line 8
    .line 9
    if-eqz p0, :cond_3

    .line 10
    .line 11
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->VP8:Lio/agora/base/internal/video/VideoCodecType;

    .line 12
    .line 13
    if-ne p1, p0, :cond_0

    .line 14
    .line 15
    new-instance p0, Lio/agora/base/internal/video/DynamicBitrateAdjuster;

    .line 16
    .line 17
    invoke-direct {p0}, Lio/agora/base/internal/video/DynamicBitrateAdjuster;-><init>()V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 22
    .line 23
    if-eq p1, p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->H265:Lio/agora/base/internal/video/VideoCodecType;

    .line 26
    .line 27
    if-ne p1, p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance p0, Lio/agora/base/internal/video/FramerateBitrateAdjuster;

    .line 31
    .line 32
    invoke-direct {p0}, Lio/agora/base/internal/video/FramerateBitrateAdjuster;-><init>()V

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    :goto_0
    new-instance p0, Lio/agora/base/internal/video/FactorBitrateAdjuster;

    .line 37
    .line 38
    invoke-direct {p0, v0}, Lio/agora/base/internal/video/FactorBitrateAdjuster;-><init>(I)V

    .line 39
    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 43
    .line 44
    if-eq p1, p0, :cond_4

    .line 45
    .line 46
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->H265:Lio/agora/base/internal/video/VideoCodecType;

    .line 47
    .line 48
    if-ne p1, p0, :cond_5

    .line 49
    .line 50
    :cond_4
    const-string p0, "OMX.qcom."

    .line 51
    .line 52
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_6

    .line 57
    .line 58
    const-string p0, "OMX.MTK."

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_6

    .line 65
    .line 66
    const-string p0, "OMX.hisi."

    .line 67
    .line 68
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_5
    new-instance p0, Lio/agora/base/internal/video/BaseBitrateAdjuster;

    .line 76
    .line 77
    invoke-direct {p0}, Lio/agora/base/internal/video/BaseBitrateAdjuster;-><init>()V

    .line 78
    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_6
    :goto_1
    new-instance p0, Lio/agora/base/internal/video/FactorBitrateAdjuster;

    .line 82
    .line 83
    invoke-direct {p0, v0}, Lio/agora/base/internal/video/FactorBitrateAdjuster;-><init>(I)V

    .line 84
    .line 85
    .line 86
    return-object p0
.end method

.method private getForcedKeyFrameIntervalMs(Lio/agora/base/internal/video/VideoCodecType;Ljava/lang/String;)I
    .locals 0

    .line 1
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->VP8:Lio/agora/base/internal/video/VideoCodecType;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const-string p0, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/16 p0, 0x3a98

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private getKeyFrameIntervalSec(Lio/agora/base/internal/video/VideoCodecType;)I
    .locals 2

    .line 1
    sget-object p0, Lio/agora/base/internal/video/HardwareVideoEncoderFactory$1;->$SwitchMap$io$agora$base$internal$video$VideoCodecType:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    const/16 v1, 0x14

    .line 17
    .line 18
    if-eq p0, v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x5

    .line 24
    if-ne p0, v0, :cond_0

    .line 25
    .line 26
    const-string p0, "HardwareVideoEncoderFactory"

    .line 27
    .line 28
    const-string p1, "UNKNOWN is not excepted but h264"

    .line 29
    .line 30
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return v1

    .line 34
    :cond_0
    const-string p0, "Unsupported VideoCodecType "

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_1
    return v1

    .line 42
    :cond_2
    const/16 p0, 0x64

    .line 43
    .line 44
    return p0
.end method

.method private isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v3, "OMX.hisi."

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v3, "OMX.Exynos."

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v3, "OMX.MTK."

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v3, v1

    .line 53
    move v0, v2

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    move v0, v1

    .line 56
    move v3, v2

    .line 57
    :goto_1
    iget-boolean p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->enableH264HighProfile:Z

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    if-eqz v3, :cond_5

    .line 64
    .line 65
    :cond_2
    :try_start_0
    sget-object p0, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 66
    .line 67
    invoke-virtual {p0}, Lio/agora/base/internal/video/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 72
    .line 73
    .line 74
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    goto :goto_2

    .line 76
    :catch_0
    move-exception p0

    .line 77
    const-string p1, "HardwareVideoEncoderFactory"

    .line 78
    .line 79
    const-string v0, "getCapabilitiesForType:"

    .line 80
    .line 81
    invoke-static {p1, v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    :goto_2
    if-nez p0, :cond_3

    .line 86
    .line 87
    return v2

    .line 88
    :cond_3
    iget-object p0, p0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 89
    .line 90
    array-length p1, p0

    .line 91
    move v0, v2

    .line 92
    :goto_3
    if-ge v0, p1, :cond_5

    .line 93
    .line 94
    aget-object v3, p0, v0

    .line 95
    .line 96
    iget v3, v3, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 97
    .line 98
    const/16 v4, 0x8

    .line 99
    .line 100
    if-ne v3, v4, :cond_4

    .line 101
    .line 102
    return v1

    .line 103
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    return v2
.end method


# virtual methods
.method public createEncoder(Lio/agora/base/internal/video/VideoCodecInfo;Z)Lio/agora/base/internal/video/VideoEncoder;
    .locals 18
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v4

    .line 10
    iget-object v0, v2, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Lio/agora/base/internal/video/VideoCodecType;->contains(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v5, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-object v5

    .line 20
    :cond_0
    iget-object v0, v2, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Lio/agora/base/internal/video/VideoCodecType;->valueOf(Ljava/lang/String;)Lio/agora/base/internal/video/VideoCodecType;

    .line 23
    .line 24
    .line 25
    move-result-object v9

    .line 26
    move/from16 v0, p2

    .line 27
    .line 28
    invoke-static {v9, v0}, Lio/agora/base/internal/video/VideoEncoderUtils;->findCodecForType(Lio/agora/base/internal/video/VideoCodecType;Z)Landroid/media/MediaCodecInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    if-nez v6, :cond_1

    .line 33
    .line 34
    return-object v5

    .line 35
    :cond_1
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v8

    .line 39
    invoke-virtual {v9}, Lio/agora/base/internal/video/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :try_start_0
    sget-object v5, Lio/agora/base/internal/video/MediaCodecUtils;->TEXTURE_COLOR_FORMATS:[I

    .line 44
    .line 45
    invoke-virtual {v6, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    invoke-static {v5, v7}, Lio/agora/base/internal/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 53
    :try_start_1
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    invoke-static {v7}, Lio/agora/base/internal/video/MediaCodecUtils;->encoderColorFormats(Ljava/lang/String;)[I

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-virtual {v6, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v7, v0}, Lio/agora/base/internal/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v4
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    :goto_0
    move-object v11, v4

    .line 70
    move-object v10, v5

    .line 71
    goto :goto_2

    .line 72
    :catch_0
    move-exception v0

    .line 73
    goto :goto_1

    .line 74
    :catch_1
    move-exception v0

    .line 75
    move-object v5, v4

    .line 76
    :goto_1
    const-string v7, "HardwareVideoEncoderFactory"

    .line 77
    .line 78
    const-string v10, "getCapabilitiesForType:"

    .line 79
    .line 80
    invoke-static {v7, v10, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :goto_2
    sget-object v0, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 85
    .line 86
    if-ne v9, v0, :cond_2

    .line 87
    .line 88
    iget-object v0, v2, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 89
    .line 90
    const/4 v4, 0x1

    .line 91
    invoke-static {v9, v4}, Lio/agora/base/internal/video/MediaCodecUtils;->getCodecProperties(Lio/agora/base/internal/video/VideoCodecType;Z)Ljava/util/Map;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-static {v0, v4}, Lio/agora/base/internal/video/H264Utils;->isSameH264Profile(Ljava/util/Map;Ljava/util/Map;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, v2, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 99
    .line 100
    invoke-static {v9, v3}, Lio/agora/base/internal/video/MediaCodecUtils;->getCodecProperties(Lio/agora/base/internal/video/VideoCodecType;Z)Ljava/util/Map;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-static {v0, v3}, Lio/agora/base/internal/video/H264Utils;->isSameH264Profile(Ljava/util/Map;Ljava/util/Map;)Z

    .line 105
    .line 106
    .line 107
    invoke-direct {v1, v6}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iget-object v3, v2, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 112
    .line 113
    const-string v4, "is-highprofile-supported"

    .line 114
    .line 115
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    :cond_2
    new-instance v6, Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 123
    .line 124
    new-instance v7, Lio/agora/base/internal/video/MediaCodecWrapperFactoryImpl;

    .line 125
    .line 126
    invoke-direct {v7}, Lio/agora/base/internal/video/MediaCodecWrapperFactoryImpl;-><init>()V

    .line 127
    .line 128
    .line 129
    iget-object v12, v2, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 130
    .line 131
    invoke-direct {v1, v9}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->getKeyFrameIntervalSec(Lio/agora/base/internal/video/VideoCodecType;)I

    .line 132
    .line 133
    .line 134
    move-result v13

    .line 135
    invoke-direct {v1, v9, v8}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->getForcedKeyFrameIntervalMs(Lio/agora/base/internal/video/VideoCodecType;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v14

    .line 139
    invoke-static {}, Lio/agora/base/internal/video/VideoEncoderUtils;->getSupportedEncoders()I

    .line 140
    .line 141
    .line 142
    move-result v15

    .line 143
    invoke-direct {v1, v9, v8}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->createBitrateAdjuster(Lio/agora/base/internal/video/VideoCodecType;Ljava/lang/String;)Lio/agora/base/internal/video/BitrateAdjuster;

    .line 144
    .line 145
    .line 146
    move-result-object v16

    .line 147
    iget-object v0, v1, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 148
    .line 149
    move-object/from16 v17, v0

    .line 150
    .line 151
    invoke-direct/range {v6 .. v17}, Lio/agora/base/internal/video/HardwareVideoEncoder;-><init>(Lio/agora/base/internal/video/MediaCodecWrapperFactory;Ljava/lang/String;Lio/agora/base/internal/video/VideoCodecType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;IIILio/agora/base/internal/video/BitrateAdjuster;Lio/agora/base/internal/video/EglBase$Context;)V

    .line 152
    .line 153
    .line 154
    return-object v6
.end method

.method public createEncoder(Lio/agora/base/internal/video/VideoCodecInfo;ZZ)Lio/agora/base/internal/video/VideoEncoder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 155
    invoke-virtual {p0, p1, p2}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->createEncoder(Lio/agora/base/internal/video/VideoCodecInfo;Z)Lio/agora/base/internal/video/VideoEncoder;

    move-result-object p0

    return-object p0
.end method

.method public getSupportedCodecs(Z)[Lio/agora/base/internal/video/VideoCodecInfo;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lio/agora/base/internal/video/VideoCodecType;->VP8:Lio/agora/base/internal/video/VideoCodecType;

    .line 7
    .line 8
    sget-object v2, Lio/agora/base/internal/video/VideoCodecType;->VP9:Lio/agora/base/internal/video/VideoCodecType;

    .line 9
    .line 10
    sget-object v3, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 11
    .line 12
    sget-object v4, Lio/agora/base/internal/video/VideoCodecType;->H265:Lio/agora/base/internal/video/VideoCodecType;

    .line 13
    .line 14
    filled-new-array {v1, v2, v3, v4}, [Lio/agora/base/internal/video/VideoCodecType;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    move v3, v2

    .line 20
    :goto_0
    const/4 v4, 0x4

    .line 21
    if-ge v3, v4, :cond_2

    .line 22
    .line 23
    aget-object v4, v1, v3

    .line 24
    .line 25
    invoke-static {v4, p1}, Lio/agora/base/internal/video/VideoEncoderUtils;->findCodecForType(Lio/agora/base/internal/video/VideoCodecType;Z)Landroid/media/MediaCodecInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    if-eqz v5, :cond_1

    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    sget-object v7, Lio/agora/base/internal/video/VideoCodecType;->H264:Lio/agora/base/internal/video/VideoCodecType;

    .line 36
    .line 37
    if-ne v4, v7, :cond_0

    .line 38
    .line 39
    invoke-direct {p0, v5}, Lio/agora/base/internal/video/HardwareVideoEncoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-eqz v5, :cond_0

    .line 44
    .line 45
    new-instance v5, Lio/agora/base/internal/video/VideoCodecInfo;

    .line 46
    .line 47
    const/4 v7, 0x1

    .line 48
    invoke-static {v4, v7}, Lio/agora/base/internal/video/MediaCodecUtils;->getCodecProperties(Lio/agora/base/internal/video/VideoCodecType;Z)Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    invoke-direct {v5, v6, v7}, Lio/agora/base/internal/video/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    new-instance v5, Lio/agora/base/internal/video/VideoCodecInfo;

    .line 59
    .line 60
    invoke-static {v4, v2}, Lio/agora/base/internal/video/MediaCodecUtils;->getCodecProperties(Lio/agora/base/internal/video/VideoCodecType;Z)Ljava/util/Map;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-direct {v5, v6, v4}, Lio/agora/base/internal/video/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    new-array p0, p0, [Lio/agora/base/internal/video/VideoCodecInfo;

    .line 78
    .line 79
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, [Lio/agora/base/internal/video/VideoCodecInfo;

    .line 84
    .line 85
    return-object p0
.end method
