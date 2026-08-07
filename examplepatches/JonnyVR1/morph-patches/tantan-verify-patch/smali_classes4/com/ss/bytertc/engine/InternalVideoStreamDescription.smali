.class public Lcom/ss/bytertc/engine/InternalVideoStreamDescription;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;,
        Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;,
        Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;
    }
.end annotation


# instance fields
.field public encodePreference:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

.field public frameRate:I

.field public height:I

.field public maxKbps:I

.field public minKbps:I

.field public width:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/VideoStreamDescription;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->minKbps:I

    .line 6
    .line 7
    sget-object v0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 12
    .line 13
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->width:I

    .line 22
    .line 23
    iget-object v0, p1, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 24
    .line 25
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->height:I

    .line 34
    .line 35
    iget v0, p1, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 36
    .line 37
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->frameRate:I

    .line 38
    .line 39
    iget v0, p1, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 40
    .line 41
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->maxKbps:I

    .line 42
    .line 43
    iget v0, p1, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 44
    .line 45
    iput v0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->minKbps:I

    .line 46
    .line 47
    iget-object p1, p1, Lcom/ss/bytertc/engine/VideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 48
    .line 49
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->ConvertEnumValue(Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;)Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 54
    .line 55
    return-void
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/VideoStreamDescription$CodecMode;)Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;
    .locals 0

    .line 39
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;->VIDEO_CODEC_MODE_AUTO:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;

    .line 40
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$1;->$SwitchMap$com$ss$bytertc$engine$VideoStreamDescription$CodecMode:[I

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
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;->VIDEO_CODEC_MODE_AUTO:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;

    return-object p0

    .line 42
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;->VIDEO_CODEC_MODE_SOFTWARE:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;

    return-object p0

    .line 43
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;->VIDEO_CODEC_MODE_HARDWARE:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;

    return-object p0

    .line 44
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;->VIDEO_CODEC_MODE_AUTO:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecMode;

    return-object p0
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;)Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;
    .locals 0

    .line 33
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;->VIDEO_CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;

    .line 34
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$1;->$SwitchMap$com$ss$bytertc$engine$VideoStreamDescription$VideoCodecType:[I

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
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;->VIDEO_CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;

    return-object p0

    .line 36
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;->VIDEO_CODEC_TYPE_BYTEVC1:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;

    return-object p0

    .line 37
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;->VIDEO_CODEC_TYPE_H264:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;

    return-object p0

    .line 38
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;->VIDEO_CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoCodecType;

    return-object p0
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;)Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;
    .locals 1

    .line 1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 2
    .line 3
    sget-object v0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$1;->$SwitchMap$com$ss$bytertc$engine$VideoStreamDescription$EncoderPreference:[I

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
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_BALANCE:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_MAINTAIN_QUALITY:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 28
    .line 29
    :cond_2
    :goto_0
    return-object p0

    .line 30
    :cond_3
    sget-object p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;->VIDEO_ENCODER_PREFERENCE_DISABLED:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 31
    .line 32
    return-object p0
.end method


# virtual methods
.method public getEncoderPreference()Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/InternalVideoStreamDescription$VideoEncoderPreference;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxKBps()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->maxKbps:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinKBps()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->minKbps:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoStreamDescription;->width:I

    .line 2
    .line 3
    return p0
.end method
