.class Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoDecoderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/MediaCodecVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HwDecoderFactory"
.end annotation


# instance fields
.field private final supportedHardwareCodecs:[Lcom/momo/rtcbase/VideoCodecInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->getSupportedHardwareCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->supportedHardwareCodecs:[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 9
    .line 10
    return-void
.end method

.method private static getSupportedHardwareCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->isVp8HwSupported()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "MediaCodecVideoDecoder"

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string v1, "VP8 HW Decoder supported."

    .line 15
    .line 16
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/momo/rtcbase/VideoCodecInfo;

    .line 20
    .line 21
    new-instance v3, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v4, "VP8"

    .line 27
    .line 28
    invoke-direct {v1, v4, v3}, Lcom/momo/rtcbase/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->isVp9HwSupported()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    const-string v1, "VP9 HW Decoder supported."

    .line 41
    .line 42
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Lcom/momo/rtcbase/VideoCodecInfo;

    .line 46
    .line 47
    new-instance v3, Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v4, "VP9"

    .line 53
    .line 54
    invoke-direct {v1, v4, v3}, Lcom/momo/rtcbase/VideoCodecInfo;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->isH264HighProfileHwSupported()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    const-string v1, "H.264 High Profile HW Decoder supported."

    .line 67
    .line 68
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sget-object v1, Lcom/momo/rtcbase/H264Utils;->DEFAULT_H264_HIGH_PROFILE_CODEC:Lcom/momo/rtcbase/VideoCodecInfo;

    .line 72
    .line 73
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->isH264HwSupported()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    const-string v1, "H.264 HW Decoder supported."

    .line 83
    .line 84
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    sget-object v1, Lcom/momo/rtcbase/H264Utils;->DEFAULT_H264_BASELINE_PROFILE_CODEC:Lcom/momo/rtcbase/VideoCodecInfo;

    .line 88
    .line 89
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    new-array v1, v1, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 97
    .line 98
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, [Lcom/momo/rtcbase/VideoCodecInfo;

    .line 103
    .line 104
    return-object v0
.end method

.method private static isCodecSupported([Lcom/momo/rtcbase/VideoCodecInfo;Lcom/momo/rtcbase/VideoCodecInfo;)Z
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget-object v3, p0, v2

    .line 7
    .line 8
    invoke-static {v3, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->isSameCodec(Lcom/momo/rtcbase/VideoCodecInfo;Lcom/momo/rtcbase/VideoCodecInfo;)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return v1
.end method

.method private static isSameCodec(Lcom/momo/rtcbase/VideoCodecInfo;Lcom/momo/rtcbase/VideoCodecInfo;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "H264"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/rtcbase/VideoCodecInfo;->params:Ljava/util/Map;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/momo/rtcbase/VideoCodecInfo;->params:Ljava/util/Map;

    .line 26
    .line 27
    invoke-static {p0, p1}, Lcom/momo/rtcbase/H264Utils;->isSameH264Profile(Ljava/util/Map;Ljava/util/Map;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x1

    .line 33
    return p0
.end method


# virtual methods
.method public createDecoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoDecoder;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->supportedHardwareCodecs:[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->isCodecSupported([Lcom/momo/rtcbase/VideoCodecInfo;Lcom/momo/rtcbase/VideoCodecInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "MediaCodecVideoDecoder"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "No HW video decoder for codec "

    .line 14
    .line 15
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "Create HW video decoder for "

    .line 35
    .line 36
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p1, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory$1;

    .line 52
    .line 53
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory$1;-><init>(Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;Lcom/momo/rtcbase/VideoCodecInfo;)V

    .line 54
    .line 55
    .line 56
    return-object v0
.end method

.method public getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->supportedHardwareCodecs:[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 2
    .line 3
    return-object p0
.end method
