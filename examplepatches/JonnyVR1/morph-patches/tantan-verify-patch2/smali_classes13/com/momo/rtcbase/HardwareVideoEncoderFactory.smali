.class public Lcom/momo/rtcbase/HardwareVideoEncoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoEncoderFactory;


# static fields
.field private static final H264_HW_EXCEPTION_MODELS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_L_MS:I = 0x3a98

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_M_MS:I = 0x4e20

.field private static final QCOM_VP8_KEY_FRAME_INTERVAL_ANDROID_N_MS:I = 0x3a98

.field private static final TAG:Ljava/lang/String; = "HardwareVideoEncoderFactory"


# instance fields
.field private brmodecq:I

.field private final codecAllowedPredicate:Lcom/momo/rtcbase/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/rtcbase/Predicate<",
            "Landroid/media/MediaCodecInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final enableH264HighProfile:Z

.field private final enableIntelVp8Encoder:Z

.field private resetCodecInterval:I

.field private final sharedContext:Lcom/momo/rtcbase/EglBase14$Context;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "Nexus 7"

    .line 2
    .line 3
    const-string v1, "Nexus 4"

    .line 4
    .line 5
    const-string v2, "SAMSUNG-SGH-I337"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->H264_HW_EXCEPTION_MODELS:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;)V
    .locals 3

    .line 39
    new-instance v0, Lcom/momo/rtcbase/EglBase14$Context;

    invoke-direct {v0, p1}, Lcom/momo/rtcbase/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;)V

    const/4 p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;ZZLcom/momo/rtcbase/Predicate;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;ZZ)V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;ZZLcom/momo/rtcbase/Predicate;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;ZZII)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;ZZLcom/momo/rtcbase/Predicate;)V

    .line 37
    iput p4, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->resetCodecInterval:I

    .line 38
    iput p5, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->brmodecq:I

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;ZZLcom/momo/rtcbase/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/EglBase$Context;",
            "ZZ",
            "Lcom/momo/rtcbase/Predicate<",
            "Landroid/media/MediaCodecInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->resetCodecInterval:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->brmodecq:I

    .line 8
    .line 9
    instance-of v0, p1, Lcom/momo/rtcbase/EglBase14$Context;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p1, Lcom/momo/rtcbase/EglBase14$Context;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "HardwareVideoEncoderFactory"

    .line 19
    .line 20
    const-string v0, "No shared EglBase.Context.  Encoders will not use texture mode."

    .line 21
    .line 22
    invoke-static {p1, v0}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 27
    .line 28
    :goto_0
    iput-boolean p2, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->enableIntelVp8Encoder:Z

    .line 29
    .line 30
    iput-boolean p3, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->enableH264HighProfile:Z

    .line 31
    .line 32
    iput-object p4, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->codecAllowedPredicate:Lcom/momo/rtcbase/Predicate;

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, v0, p1, p2}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;ZZ)V

    return-void
.end method

.method private createBitrateAdjuster(Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/String;)Lcom/momo/rtcbase/BitrateAdjuster;
    .locals 0

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
    if-eqz p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/momo/rtcbase/VideoCodecType;->VP8:Lcom/momo/rtcbase/VideoCodecType;

    .line 10
    .line 11
    if-ne p1, p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Lcom/momo/rtcbase/DynamicBitrateAdjuster;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/momo/rtcbase/DynamicBitrateAdjuster;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance p0, Lcom/momo/rtcbase/FramerateBitrateAdjuster;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/momo/rtcbase/FramerateBitrateAdjuster;-><init>()V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    new-instance p0, Lcom/momo/rtcbase/BaseBitrateAdjuster;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/momo/rtcbase/BaseBitrateAdjuster;-><init>()V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method private findCodecForType(Lcom/momo/rtcbase/VideoCodecType;)Landroid/media/MediaCodecInfo;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ge v0, v1, :cond_2

    .line 8
    .line 9
    :try_start_0
    invoke-static {v0}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    goto :goto_1

    .line 14
    :catch_0
    move-exception v1

    .line 15
    const-string v3, "HardwareVideoEncoderFactory"

    .line 16
    .line 17
    const-string v4, "Cannot retrieve encoder codec info"

    .line 18
    .line 19
    invoke-static {v3, v4, v1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :goto_1
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_0
    const-string v1, "HardwareVideoEncoderFactory->"

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v1, v3}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, v2, p1}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    return-object v2

    .line 47
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    return-object v2
.end method

.method private getForcedKeyFrameIntervalMs(Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/String;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/momo/rtcbase/VideoCodecType;->VP8:Lcom/momo/rtcbase/VideoCodecType;

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

.method private getKeyFrameIntervalSec(Lcom/momo/rtcbase/VideoCodecType;)I
    .locals 1

    .line 1
    sget-object p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory$1;->$SwitchMap$com$momo$rtcbase$VideoCodecType:[I

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
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p0, "Unsupported VideoCodecType "

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/16 p0, 0x64

    .line 27
    .line 28
    return p0

    .line 29
    :cond_2
    return v0
.end method

.method private isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->enableH264HighProfile:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "OMX.Exynos."

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private isHardwareSupportedInCurrentSdk(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory$1;->$SwitchMap$com$momo$rtcbase$VideoCodecType:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    aget p2, v0, p2

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p2, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->isHardwareSupportedInCurrentSdkH264(Landroid/media/MediaCodecInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private isHardwareSupportedInCurrentSdkH264(Landroid/media/MediaCodecInfo;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->H264_HW_EXCEPTION_MODELS:Ljava/util/List;

    .line 2
    .line 3
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private isHardwareSupportedInCurrentSdkVp8(Landroid/media/MediaCodecInfo;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "OMX.Exynos."

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "OMX.Intel."

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-boolean p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->enableIntelVp8Encoder:Z

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_2
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method private isHardwareSupportedInCurrentSdkVp9(Landroid/media/MediaCodecInfo;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "OMX.qcom."

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    const-string p1, "OMX.Exynos."

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method private isMediaCodecAllowed(Landroid/media/MediaCodecInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->codecAllowedPredicate:Lcom/momo/rtcbase/Predicate;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/Predicate;->test(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z
    .locals 3

    .line 1
    invoke-static {p1, p2}, Lcom/momo/rtcbase/MediaCodecUtils;->codecSupportsType(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z

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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecUtils;->ENCODER_COLOR_FORMATS:[I

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p1, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v0, v2}, Lcom/momo/rtcbase/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->isHardwareSupportedInCurrentSdk(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_2

    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->isMediaCodecAllowed(Landroid/media/MediaCodecInfo;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_2
    return v1
.end method


# virtual methods
.method public createEncoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoEncoder;
    .locals 14

    .line 1
    iget-object v0, p1, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/VideoCodecType;->valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/VideoCodecType;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    invoke-direct {p0, v4}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->findCodecForType(Lcom/momo/rtcbase/VideoCodecType;)Landroid/media/MediaCodecInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v4}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sget-object v5, Lcom/momo/rtcbase/MediaCodecUtils;->TEXTURE_COLOR_FORMATS:[I

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-static {v5, v6}, Lcom/momo/rtcbase/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    sget-object v6, Lcom/momo/rtcbase/MediaCodecUtils;->ENCODER_COLOR_FORMATS:[I

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v6, v2}, Lcom/momo/rtcbase/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    sget-object v2, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 44
    .line 45
    if-ne v4, v2, :cond_2

    .line 46
    .line 47
    iget-object v2, p1, Lcom/momo/rtcbase/VideoCodecInfo;->params:Ljava/util/Map;

    .line 48
    .line 49
    const/4 v7, 0x1

    .line 50
    invoke-static {v4, v7}, Lcom/momo/rtcbase/MediaCodecUtils;->getCodecProperties(Lcom/momo/rtcbase/VideoCodecType;Z)Ljava/util/Map;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-static {v2, v7}, Lcom/momo/rtcbase/H264Utils;->isSameH264Profile(Ljava/util/Map;Ljava/util/Map;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget-object v7, p1, Lcom/momo/rtcbase/VideoCodecInfo;->params:Ljava/util/Map;

    .line 59
    .line 60
    const/4 v8, 0x0

    .line 61
    invoke-static {v4, v8}, Lcom/momo/rtcbase/MediaCodecUtils;->getCodecProperties(Lcom/momo/rtcbase/VideoCodecType;Z)Ljava/util/Map;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-static {v7, v8}, Lcom/momo/rtcbase/H264Utils;->isSameH264Profile(Ljava/util/Map;Ljava/util/Map;)Z

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    if-nez v2, :cond_1

    .line 70
    .line 71
    if-nez v7, :cond_1

    .line 72
    .line 73
    return-object v1

    .line 74
    :cond_1
    if-eqz v2, :cond_2

    .line 75
    .line 76
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    return-object v1

    .line 83
    :cond_2
    new-instance v1, Lcom/momo/rtcbase/HardwareVideoEncoder;

    .line 84
    .line 85
    new-instance v2, Lcom/momo/rtcbase/MediaCodecWrapperFactoryImpl;

    .line 86
    .line 87
    invoke-direct {v2}, Lcom/momo/rtcbase/MediaCodecWrapperFactoryImpl;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-object v7, p1, Lcom/momo/rtcbase/VideoCodecInfo;->params:Ljava/util/Map;

    .line 91
    .line 92
    invoke-direct {p0, v4}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->getKeyFrameIntervalSec(Lcom/momo/rtcbase/VideoCodecType;)I

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    invoke-direct {p0, v4, v3}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->getForcedKeyFrameIntervalMs(Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    invoke-direct {p0, v4, v3}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->createBitrateAdjuster(Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/String;)Lcom/momo/rtcbase/BitrateAdjuster;

    .line 101
    .line 102
    .line 103
    move-result-object v10

    .line 104
    iget-object v11, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->sharedContext:Lcom/momo/rtcbase/EglBase14$Context;

    .line 105
    .line 106
    iget v12, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->resetCodecInterval:I

    .line 107
    .line 108
    iget v13, p0, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->brmodecq:I

    .line 109
    .line 110
    invoke-direct/range {v1 .. v13}, Lcom/momo/rtcbase/HardwareVideoEncoder;-><init>(Lcom/momo/rtcbase/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/momo/rtcbase/VideoCodecType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;IILcom/momo/rtcbase/BitrateAdjuster;Lcom/momo/rtcbase/EglBase14$Context;II)V

    .line 111
    .line 112
    .line 113
    return-object v1
.end method

.method public getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 7
    .line 8
    filled-new-array {v1}, [Lcom/momo/rtcbase/VideoCodecType;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/4 v3, 0x0

    .line 13
    aget-object v2, v2, v3

    .line 14
    .line 15
    invoke-direct {p0, v2}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->findCodecForType(Lcom/momo/rtcbase/VideoCodecType;)Landroid/media/MediaCodecInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    if-ne v2, v1, :cond_0

    .line 26
    .line 27
    invoke-direct {p0, v4}, Lcom/momo/rtcbase/HardwareVideoEncoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    new-instance p0, Lcom/momo/rtcbase/VideoCodecInfo;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-static {v2, v1}, Lcom/momo/rtcbase/MediaCodecUtils;->getCodecProperties(Lcom/momo/rtcbase/VideoCodecType;Z)Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {p0, v5, v1}, Lcom/momo/rtcbase/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    new-instance p0, Lcom/momo/rtcbase/VideoCodecInfo;

    .line 47
    .line 48
    invoke-static {v2, v3}, Lcom/momo/rtcbase/MediaCodecUtils;->getCodecProperties(Lcom/momo/rtcbase/VideoCodecType;Z)Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {p0, v5, v1}, Lcom/momo/rtcbase/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    new-array p0, p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 63
    .line 64
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 69
    .line 70
    return-object p0
.end method
