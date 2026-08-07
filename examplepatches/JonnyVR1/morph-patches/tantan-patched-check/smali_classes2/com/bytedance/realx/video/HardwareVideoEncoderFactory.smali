.class public Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_L_MS:I = 0x3a98

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_M_MS:I = 0x4e20

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_N_MS:I = 0x3a98

.field private static final TAG:Ljava/lang/String; = "HwVideoEncoderFactory"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createEncoder(Lcom/bytedance/realx/video/RXVideoCodecDesc;)Lcom/bytedance/realx/video/VideoEncoder;
    .locals 11
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->findCodecForType(Lcom/bytedance/realx/video/RXVideoCodecStandard;)Landroid/media/MediaCodecInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    invoke-virtual {v1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    sget-object v4, Lcom/bytedance/realx/video/MediaCodecUtils;->TEXTURE_COLOR_FORMATS:[I

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-static {v4, v6}, Lcom/bytedance/realx/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    const-string v4, "HwVideoEncoderFactory"

    .line 32
    .line 33
    if-nez v7, :cond_1

    .line 34
    .line 35
    const-string p0, "surfaceColorFormat is null object."

    .line 36
    .line 37
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-object v2

    .line 41
    :cond_1
    const-string v6, "OMX.hisi."

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    if-eqz v6, :cond_2

    .line 48
    .line 49
    sget-object v6, Lcom/bytedance/realx/video/MediaCodecUtils;->ENCODER_COLOR_FORMATS_FOR_HISI:[I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v6, Lcom/bytedance/realx/video/MediaCodecUtils;->ENCODER_COLOR_FORMATS:[I

    .line 53
    .line 54
    :goto_0
    invoke-virtual {v1, v3}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v6, v1}, Lcom/bytedance/realx/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    if-nez v8, :cond_3

    .line 63
    .line 64
    const-string p0, "yuvColorFormat is null object."

    .line 65
    .line 66
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-object v2

    .line 70
    :cond_3
    new-instance v3, Lcom/bytedance/realx/video/HardwareVideoEncoder;

    .line 71
    .line 72
    new-instance v4, Lcom/bytedance/realx/video/MediaCodecWrapperFactoryImpl;

    .line 73
    .line 74
    invoke-direct {v4}, Lcom/bytedance/realx/video/MediaCodecWrapperFactoryImpl;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v0}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->getKeyFrameIntervalSec(Lcom/bytedance/realx/video/RXVideoCodecStandard;)I

    .line 78
    .line 79
    .line 80
    move-result v9

    .line 81
    invoke-static {v0, v5}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->getForcedKeyFrameIntervalMs(Lcom/bytedance/realx/video/RXVideoCodecStandard;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v10

    .line 85
    move-object v6, p0

    .line 86
    invoke-direct/range {v3 .. v10}, Lcom/bytedance/realx/video/HardwareVideoEncoder;-><init>(Lcom/bytedance/realx/video/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/bytedance/realx/video/RXVideoCodecDesc;Ljava/lang/Integer;Ljava/lang/Integer;II)V

    .line 87
    .line 88
    .line 89
    return-object v3
.end method

.method private static findCodecForType(Lcom/bytedance/realx/video/RXVideoCodecStandard;)Landroid/media/MediaCodecInfo;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "HwVideoEncoderFactory"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 5
    .line 6
    .line 7
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 8
    const/4 v3, 0x0

    .line 9
    :goto_0
    if-ge v3, v2, :cond_2

    .line 10
    .line 11
    :try_start_1
    invoke-static {v3}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v4
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 15
    goto :goto_1

    .line 16
    :catch_0
    move-exception v4

    .line 17
    const-string v5, "Cannot retrieve encoder codec info"

    .line 18
    .line 19
    invoke-static {v0, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    move-object v4, v1

    .line 23
    :goto_1
    if-eqz v4, :cond_1

    .line 24
    .line 25
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-eqz v5, :cond_1

    .line 30
    .line 31
    invoke-static {v4}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isSoftwareOnly(Landroid/media/MediaCodecInfo;)Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_0

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_0
    invoke-static {v4, p0}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-eqz v5, :cond_1

    .line 43
    .line 44
    return-object v4

    .line 45
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-object v1

    .line 49
    :catch_1
    move-exception p0

    .line 50
    const-string v2, "Cannot getCodecCount"

    .line 51
    .line 52
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 53
    .line 54
    .line 55
    return-object v1
.end method

.method private static getForcedKeyFrameIntervalMs(Lcom/bytedance/realx/video/RXVideoCodecStandard;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const-string p0, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

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

.method private static getKeyFrameIntervalSec(Lcom/bytedance/realx/video/RXVideoCodecStandard;)I
    .locals 3

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory$1;->$SwitchMap$com$bytedance$realx$video$RXVideoCodecStandard:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/16 v2, 0x2d0

    .line 11
    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, "Unsupported VideoCodecType "

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    :goto_0
    const/16 p0, 0x64

    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    return v2
.end method

.method public static getSupportedCodecs()[Lcom/bytedance/realx/video/RXVideoCodecDesc;
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 7
    .line 8
    sget-object v2, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 9
    .line 10
    sget-object v3, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 11
    .line 12
    filled-new-array {v1, v2, v3}, [Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_0
    const/4 v3, 0x3

    .line 18
    if-ge v2, v3, :cond_4

    .line 19
    .line 20
    aget-object v3, v1, v2

    .line 21
    .line 22
    invoke-static {v3}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->findCodecForType(Lcom/bytedance/realx/video/RXVideoCodecStandard;)Landroid/media/MediaCodecInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    if-eqz v4, :cond_3

    .line 27
    .line 28
    sget-object v5, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 29
    .line 30
    if-ne v3, v5, :cond_0

    .line 31
    .line 32
    invoke-static {v4, v3}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v5, :cond_0

    .line 37
    .line 38
    new-instance v5, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 39
    .line 40
    sget-object v6, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 41
    .line 42
    invoke-direct {v5, v3, v6}, Lcom/bytedance/realx/video/RXVideoCodecDesc;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    sget-object v5, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 49
    .line 50
    if-ne v3, v5, :cond_2

    .line 51
    .line 52
    invoke-static {v4}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    new-instance v4, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 59
    .line 60
    sget-object v5, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 61
    .line 62
    invoke-direct {v4, v3, v5}, Lcom/bytedance/realx/video/RXVideoCodecDesc;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    new-instance v4, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 69
    .line 70
    sget-object v5, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 71
    .line 72
    invoke-direct {v4, v3, v5}, Lcom/bytedance/realx/video/RXVideoCodecDesc;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    :cond_2
    sget-object v4, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 79
    .line 80
    if-ne v3, v4, :cond_3

    .line 81
    .line 82
    new-instance v4, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 83
    .line 84
    sget-object v5, Lcom/bytedance/realx/video/RXVideoCodecProfile;->VP8ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 85
    .line 86
    invoke-direct {v4, v3, v5}, Lcom/bytedance/realx/video/RXVideoCodecDesc;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    new-array v1, v1, [Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 100
    .line 101
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, [Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 106
    .line 107
    return-object v0
.end method

.method public static isBitrateModeSupported(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;I)Z
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p1, 0x0

    .line 10
    const-string v0, "HwVideoEncoderFactory"

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "get capability return null."

    .line 15
    .line 16
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return p1

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    const-string p0, "get EncoderCapabilities return null."

    .line 27
    .line 28
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return p1

    .line 32
    :cond_1
    invoke-virtual {p0, p2}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method private static isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceInfoAndroid;->GetDeviceModel()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceInfoAndroid;->GetDeviceBrand()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceInfoAndroid;->GetCpuModel()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "Amlogic"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    const-string v1, "T730"

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const-string p0, "VHD"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method private static isHardwareSupportedInCurrentSdk(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory$1;->$SwitchMap$com$bytedance$realx$video$RXVideoCodecStandard:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-static {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isHardwareSupportedInCurrentSdkVP8(Landroid/media/MediaCodecInfo;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    invoke-static {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isHardwareSupportedInCurrentSdkByteVC1(Landroid/media/MediaCodecInfo;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_2
    invoke-static {p0}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isHardwareSupportedInCurrentSdkH264(Landroid/media/MediaCodecInfo;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method private static isHardwareSupportedInCurrentSdkByteVC1(Landroid/media/MediaCodecInfo;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const-string v0, "OMX.Exynos."

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    return v1
.end method

.method private static isHardwareSupportedInCurrentSdkH264(Landroid/media/MediaCodecInfo;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const-string v0, "OMX.sprd."

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    const-string v0, "OMX.Exynos."

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    return v1
.end method

.method private static isHardwareSupportedInCurrentSdkVP8(Landroid/media/MediaCodecInfo;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const-string v0, "OMX.Exynos."

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    const-string v0, "OMX.Intel."

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    return v1
.end method

.method private static isSoftwareOnly(Landroid/media/MediaCodecInfo;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 3
    .line 4
    const/16 v2, 0x1d

    .line 5
    .line 6
    if-lt v1, v2, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Ll/jyk;->a(Landroid/media/MediaCodecInfo;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v1, "arc."

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    return v0

    .line 35
    :cond_2
    const-string v1, "omx.google."

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_5

    .line 42
    .line 43
    const-string v1, "omx.ffmpeg."

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_5

    .line 50
    .line 51
    const-string v1, "omx.sec."

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    const-string v1, ".sw."

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_5

    .line 66
    .line 67
    :cond_3
    const-string v1, "c2.android."

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_5

    .line 74
    .line 75
    const-string v1, "c2.google."

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_5

    .line 82
    .line 83
    const-string v1, "omx."

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_4

    .line 90
    .line 91
    const-string v1, "c2."

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    if-nez p0, :cond_4

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    return v0

    .line 101
    :cond_5
    :goto_0
    const/4 p0, 0x1

    .line 102
    return p0

    .line 103
    :goto_1
    const-string v1, "HwVideoEncoderFactory"

    .line 104
    .line 105
    const-string v2, "check encoder softonly error."

    .line 106
    .line 107
    invoke-static {v1, v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    return v0
.end method

.method private static isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z
    .locals 3

    .line 1
    invoke-static {p0, p1}, Lcom/bytedance/realx/video/MediaCodecUtils;->codecSupportsType(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v2, Lcom/bytedance/realx/video/MediaCodecUtils;->ENCODER_COLOR_FORMATS:[I

    .line 18
    .line 19
    invoke-static {v2, v0}, Lcom/bytedance/realx/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-static {p0, p1}, Lcom/bytedance/realx/video/HardwareVideoEncoderFactory;->isHardwareSupportedInCurrentSdk(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :catch_0
    return v1
.end method
