.class Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoDecoderFactory;


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecVideoDecoderFactory"


# instance fields
.field private final codecAllowedPredicate:Lcom/momo/rtcbase/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/rtcbase/Predicate<",
            "Landroid/media/MediaCodecInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final sharedContext:Lcom/momo/rtcbase/EglBase$Context;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;Lcom/momo/rtcbase/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/EglBase$Context;",
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
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->codecAllowedPredicate:Lcom/momo/rtcbase/Predicate;

    .line 7
    .line 8
    return-void
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
    const-string v3, "MediaCodecVideoDecoderFactory"

    .line 16
    .line 17
    const-string v4, "Cannot retrieve decoder codec info"

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
    if-eqz v1, :cond_0

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_0
    invoke-direct {p0, v2, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    return-object v2

    .line 38
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return-object v2
.end method

.method private isCodecAllowed(Landroid/media/MediaCodecInfo;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->codecAllowedPredicate:Lcom/momo/rtcbase/Predicate;

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

.method private isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z
    .locals 1

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
    const/4 v0, 0x1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    const-string p1, "OMX.Exynos."

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method private isSupportedCodec(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Lcom/momo/rtcbase/MediaCodecUtils;->codecSupportsType(Landroid/media/MediaCodecInfo;Lcom/momo/rtcbase/VideoCodecType;)Z

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
    sget-object v0, Lcom/momo/rtcbase/MediaCodecUtils;->DECODER_COLOR_FORMATS:[I

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1, p2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {v0, p2}, Lcom/momo/rtcbase/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->isCodecAllowed(Landroid/media/MediaCodecInfo;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method


# virtual methods
.method public createDecoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoDecoder;
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoCodecInfo;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/momo/rtcbase/VideoCodecType;->valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/VideoCodecType;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-direct {p0, v3}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->findCodecForType(Lcom/momo/rtcbase/VideoCodecType;)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {v3}, Lcom/momo/rtcbase/VideoCodecType;->mimeType()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v1, v0

    .line 26
    new-instance v0, Lcom/momo/rtcbase/AndroidVideoDecoder;

    .line 27
    .line 28
    move-object v2, v1

    .line 29
    new-instance v1, Lcom/momo/rtcbase/MediaCodecWrapperFactoryImpl;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/momo/rtcbase/MediaCodecWrapperFactoryImpl;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object v4, Lcom/momo/rtcbase/MediaCodecUtils;->DECODER_COLOR_FORMATS:[I

    .line 39
    .line 40
    invoke-static {v4, v2}, Lcom/momo/rtcbase/MediaCodecUtils;->selectColorFormat([ILandroid/media/MediaCodecInfo$CodecCapabilities;)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    iget-object v5, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 49
    .line 50
    move-object v2, p1

    .line 51
    invoke-direct/range {v0 .. v5}, Lcom/momo/rtcbase/AndroidVideoDecoder;-><init>(Lcom/momo/rtcbase/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/momo/rtcbase/VideoCodecType;ILcom/momo/rtcbase/EglBase$Context;)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method public getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/rtcbase/VideoCodecType;->VP8:Lcom/momo/rtcbase/VideoCodecType;

    .line 7
    .line 8
    sget-object v2, Lcom/momo/rtcbase/VideoCodecType;->VP9:Lcom/momo/rtcbase/VideoCodecType;

    .line 9
    .line 10
    sget-object v3, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 11
    .line 12
    filled-new-array {v1, v2, v3}, [Lcom/momo/rtcbase/VideoCodecType;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :goto_0
    const/4 v4, 0x3

    .line 19
    if-ge v3, v4, :cond_2

    .line 20
    .line 21
    aget-object v4, v1, v3

    .line 22
    .line 23
    invoke-direct {p0, v4}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->findCodecForType(Lcom/momo/rtcbase/VideoCodecType;)Landroid/media/MediaCodecInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    if-eqz v5, :cond_1

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    sget-object v7, Lcom/momo/rtcbase/VideoCodecType;->H264:Lcom/momo/rtcbase/VideoCodecType;

    .line 34
    .line 35
    if-ne v4, v7, :cond_0

    .line 36
    .line 37
    invoke-direct {p0, v5}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->isH264HighProfileSupported(Landroid/media/MediaCodecInfo;)Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    if-eqz v5, :cond_0

    .line 42
    .line 43
    new-instance v5, Lcom/momo/rtcbase/VideoCodecInfo;

    .line 44
    .line 45
    const/4 v7, 0x1

    .line 46
    invoke-static {v4, v7}, Lcom/momo/rtcbase/MediaCodecUtils;->getCodecProperties(Lcom/momo/rtcbase/VideoCodecType;Z)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-direct {v5, v6, v7}, Lcom/momo/rtcbase/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    new-instance v5, Lcom/momo/rtcbase/VideoCodecInfo;

    .line 57
    .line 58
    invoke-static {v4, v2}, Lcom/momo/rtcbase/MediaCodecUtils;->getCodecProperties(Lcom/momo/rtcbase/VideoCodecType;Z)Ljava/util/Map;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-direct {v5, v6, v4}, Lcom/momo/rtcbase/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    new-array p0, p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 76
    .line 77
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 82
    .line 83
    return-object p0
.end method
