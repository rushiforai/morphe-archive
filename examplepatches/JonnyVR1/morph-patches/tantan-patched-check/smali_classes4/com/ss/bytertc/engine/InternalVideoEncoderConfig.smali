.class public Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;,
        Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;,
        Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;
    }
.end annotation


# instance fields
.field public encodePreference:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

.field public frameRate:I

.field public height:I

.field public maxBitrate:I

.field public minBitrate:I

.field public width:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/VideoEncoderConfig;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->minBitrate:I

    .line 6
    .line 7
    sget-object v0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 10
    .line 11
    iget v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->width:I

    .line 12
    .line 13
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->width:I

    .line 14
    .line 15
    iget v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->height:I

    .line 16
    .line 17
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->height:I

    .line 18
    .line 19
    iget v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->frameRate:I

    .line 20
    .line 21
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->frameRate:I

    .line 22
    .line 23
    iget v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    .line 24
    .line 25
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->maxBitrate:I

    .line 26
    .line 27
    iget v0, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    .line 28
    .line 29
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->minBitrate:I

    .line 30
    .line 31
    iget-object p1, p1, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->ConvertEnumValue(Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;)Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 38
    .line 39
    return-void
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/VideoEncoderConfig$CodecMode;)Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;
    .locals 0

    .line 39
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;->VIDEO_CODEC_MODE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;

    .line 40
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$1;->$SwitchMap$com$ss$bytertc$engine$VideoEncoderConfig$CodecMode:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    const/4 p1, 0x1

    if-eq p0, p1, :cond_2

    const/4 p1, 0x2

    if-eq p0, p1, :cond_1

    const/4 p1, 0x3

    if-eq p0, p1, :cond_0

    .line 41
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;->VIDEO_CODEC_MODE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;

    return-object p0

    .line 42
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;->VIDEO_CODEC_MODE_SOFTWARE:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;

    return-object p0

    .line 43
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;->VIDEO_CODEC_MODE_HARDWARE:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;

    return-object p0

    .line 44
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;->VIDEO_CODEC_MODE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecMode;

    return-object p0
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoCodecType;)Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;
    .locals 0

    .line 33
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;->VIDEO_CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;

    .line 34
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$1;->$SwitchMap$com$ss$bytertc$engine$VideoEncoderConfig$VideoCodecType:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    const/4 p1, 0x1

    if-eq p0, p1, :cond_2

    const/4 p1, 0x2

    if-eq p0, p1, :cond_1

    const/4 p1, 0x3

    if-eq p0, p1, :cond_0

    .line 35
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;->VIDEO_CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;

    return-object p0

    .line 36
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;->VIDEO_CODEC_TYPE_BYTEVC1:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;

    return-object p0

    .line 37
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;->VIDEO_CODEC_TYPE_H264:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;

    return-object p0

    .line 38
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;->VIDEO_CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoCodecType;

    return-object p0
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;)Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;
    .locals 1

    .line 1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 2
    .line 3
    sget-object v0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$1;->$SwitchMap$com$ss$bytertc$engine$VideoEncoderConfig$EncoderPreference:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v0, p1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p1, v0, :cond_3

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p1, v0, :cond_2

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    if-eq p1, v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_AUTO:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_MAINTAIN_QUALITY:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 28
    .line 29
    :cond_2
    :goto_0
    return-object p0

    .line 30
    :cond_3
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_DISABLED:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 31
    .line 32
    return-object p0
.end method


# virtual methods
.method public getEncoderPreference()Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/InternalVideoEncoderConfig$InternalVideoEncoderPreference;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxKBps()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->maxBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinKBps()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->minBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;->width:I

    .line 2
    .line 3
    return p0
.end method
