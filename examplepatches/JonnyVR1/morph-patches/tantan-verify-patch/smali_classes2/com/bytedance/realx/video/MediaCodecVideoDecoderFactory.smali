.class Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecVideoDecoderFactory"


# instance fields
.field private enableAgfxSurfaceTextureHelper:Z


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
    iput-boolean v0, p0, Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;->enableAgfxSurfaceTextureHelper:Z

    .line 6
    .line 7
    return-void
.end method

.method public static createDecoder(Lcom/bytedance/realx/video/RXVideoCodecDesc;)Lcom/bytedance/realx/video/VideoDecoder;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecDesc;->getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;->findCodecForType(Lcom/bytedance/realx/video/RXVideoCodecStandard;)Landroid/media/MediaCodecInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, v2, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 22
    .line 23
    array-length v4, v3

    .line 24
    const/4 v5, 0x0

    .line 25
    :goto_0
    if-ge v5, v4, :cond_1

    .line 26
    .line 27
    aget v6, v3, v5

    .line 28
    .line 29
    new-instance v7, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v8, "support codecColorFormat:"

    .line 32
    .line 33
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    const-string v7, "MediaCodecVideoDecoderFactory"

    .line 44
    .line 45
    invoke-static {v7, v6}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    add-int/lit8 v5, v5, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget-object v3, Lcom/bytedance/realx/video/MediaCodecUtils;->DECODER_COLOR_FORMATS:[I

    .line 52
    .line 53
    invoke-static {v3, v2}, Lcom/bytedance/realx/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    if-nez v2, :cond_2

    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_2
    new-instance v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 61
    .line 62
    new-instance v3, Lcom/bytedance/realx/video/MediaCodecWrapperFactoryImpl;

    .line 63
    .line 64
    invoke-direct {v3}, Lcom/bytedance/realx/video/MediaCodecWrapperFactoryImpl;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-direct {v1, v3, v0, p0, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;-><init>(Lcom/bytedance/realx/video/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/bytedance/realx/video/RXVideoCodecStandard;I)V

    .line 76
    .line 77
    .line 78
    return-object v1
.end method

.method public static enableEglLock(Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MediaCodecVideoDecoderFactory enableEglLock:"

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MediaCodecVideoDecoderFactory"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-boolean p0, Lcom/bytedance/realx/video/EglBase$EglLock;->enableEglLock:Z

    .line 21
    .line 22
    return-void
.end method

.method private static findCodecForType(Lcom/bytedance/realx/video/RXVideoCodecStandard;)Landroid/media/MediaCodecInfo;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "MediaCodecVideoDecoderFactory"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    const/4 v2, 0x0

    .line 5
    :try_start_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 6
    .line 7
    .line 8
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    if-ge v1, v3, :cond_2

    .line 10
    .line 11
    :try_start_1
    invoke-static {v1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 15
    goto :goto_1

    .line 16
    :catch_0
    move-exception p0

    .line 17
    goto :goto_3

    .line 18
    :catch_1
    move-exception v3

    .line 19
    :try_start_2
    const-string v4, "Cannot retrieve decoder codec info"

    .line 20
    .line 21
    invoke-static {v0, v4, v3}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    move-object v3, v2

    .line 25
    :goto_1
    if-eqz v3, :cond_1

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-nez v4, :cond_1

    .line 32
    .line 33
    invoke-static {v3}, Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;->isSoftwareDecoder(Landroid/media/MediaCodecInfo;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_0

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_0
    invoke-static {v3, p0}, Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;->isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 41
    .line 42
    .line 43
    move-result v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    return-object v3

    .line 47
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :goto_3
    const-string v1, "findCodecForType got system error:"

    .line 51
    .line 52
    invoke-static {v0, v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-object v2
.end method

.method public static getSupportedCodecs()[Lcom/bytedance/realx/video/RXVideoCodecDesc;
    .locals 4
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
    sget-object v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;->findCodecForType(Lcom/bytedance/realx/video/RXVideoCodecStandard;)Landroid/media/MediaCodecInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-static {v2, v1}, Lcom/bytedance/realx/video/MediaCodecVideoDecoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    new-instance v2, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 21
    .line 22
    sget-object v3, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 23
    .line 24
    invoke-direct {v2, v1, v3}, Lcom/bytedance/realx/video/RXVideoCodecDesc;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    new-instance v2, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 31
    .line 32
    sget-object v3, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 33
    .line 34
    invoke-direct {v2, v1, v3}, Lcom/bytedance/realx/video/RXVideoCodecDesc;-><init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    new-array v1, v1, [Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, [Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 51
    .line 52
    return-object v0
.end method

.method private static isH264HighProfileSupported(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

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
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    const-string v1, "OMX.Exynos."

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v2

    .line 24
    :cond_1
    invoke-virtual {p1}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 p1, 0x0

    .line 33
    move v0, p1

    .line 34
    :goto_0
    iget-object v1, p0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 35
    .line 36
    array-length v3, v1

    .line 37
    if-ge v0, v3, :cond_3

    .line 38
    .line 39
    aget-object v1, v1, v0

    .line 40
    .line 41
    iget v1, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 42
    .line 43
    const/16 v3, 0x8

    .line 44
    .line 45
    if-ne v3, v1, :cond_2

    .line 46
    .line 47
    return v2

    .line 48
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    return p1
.end method

.method private static isSoftwareDecoder(Landroid/media/MediaCodecInfo;)Z
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
    const-string v1, "omx.qcom.video.decoder.hevcswvdec"

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_5

    .line 82
    .line 83
    const-string v1, "c2.google."

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_5

    .line 90
    .line 91
    const-string v1, "omx."

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_4

    .line 98
    .line 99
    const-string v1, "c2."

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    if-nez p0, :cond_4

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_4
    return v0

    .line 109
    :cond_5
    :goto_0
    const/4 p0, 0x1

    .line 110
    return p0

    .line 111
    :goto_1
    const-string v1, "MediaCodecVideoDecoderFactory"

    .line 112
    .line 113
    const-string v2, "check decoder softonly error."

    .line 114
    .line 115
    invoke-static {v1, v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 116
    .line 117
    .line 118
    return v0
.end method

.method private static isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1}, Lcom/bytedance/realx/video/MediaCodecUtils;->codecSupportsType(Landroid/media/MediaCodecInfo;Lcom/bytedance/realx/video/RXVideoCodecStandard;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    sget-object v0, Lcom/bytedance/realx/video/MediaCodecUtils;->DECODER_COLOR_FORMATS:[I

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0, p0}, Lcom/bytedance/realx/video/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    return p0
.end method
