.class public Lcom/momo/xengine/media/EncodeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private audioBitrate:I

.field private audioChannels:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field private audioCodec:Ljava/lang/String;

.field private audioFormat:Lcom/momo/xengine/media/types/SampleFormat;

.field private audioSamplesRate:I

.field private gopSize:I

.field private hdr:Z

.field private path:Ljava/lang/String;

.field private rotation:F

.field private speed:F

.field private videoBitrate:J

.field private videoCodec:Ljava/lang/String;

.field private videoFrameRate:I

.field private videoResolution:Landroid/util/Size;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "H264"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoCodec:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Landroid/util/Size;

    .line 9
    .line 10
    const/16 v1, 0x2d0

    .line 11
    .line 12
    const/16 v2, 0x500

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoResolution:Landroid/util/Size;

    .line 18
    .line 19
    const/16 v0, 0x1e

    .line 20
    .line 21
    iput v0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoFrameRate:I

    .line 22
    .line 23
    const-wide/32 v1, 0x700000

    .line 24
    .line 25
    .line 26
    iput-wide v1, p0, Lcom/momo/xengine/media/EncodeConfig;->videoBitrate:J

    .line 27
    .line 28
    iput v0, p0, Lcom/momo/xengine/media/EncodeConfig;->gopSize:I

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/momo/xengine/media/EncodeConfig;->hdr:Z

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput v0, p0, Lcom/momo/xengine/media/EncodeConfig;->rotation:F

    .line 35
    .line 36
    const/high16 v0, 0x3f800000    # 1.0f

    .line 37
    .line 38
    iput v0, p0, Lcom/momo/xengine/media/EncodeConfig;->speed:F

    .line 39
    .line 40
    const-string v0, "AAC"

    .line 41
    .line 42
    iput-object v0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioCodec:Ljava/lang/String;

    .line 43
    .line 44
    const/16 v0, 0x3200

    .line 45
    .line 46
    iput v0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioBitrate:I

    .line 47
    .line 48
    sget-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_STEREO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioChannels:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 51
    .line 52
    const v0, 0xac44

    .line 53
    .line 54
    .line 55
    iput v0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioSamplesRate:I

    .line 56
    .line 57
    sget-object v0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_FLOAT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public getAudioBitrate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getAudioChannels()Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioChannels:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioCodec()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioCodec:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioFormat()Lcom/momo/xengine/media/types/SampleFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioSamplesRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->audioSamplesRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getBitrate()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoBitrate:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoFrameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getGopSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->gopSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/EncodeConfig;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotation()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->rotation:F

    .line 2
    .line 3
    return p0
.end method

.method public getSize()Landroid/util/Size;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoResolution:Landroid/util/Size;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpeed()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->speed:F

    .line 2
    .line 3
    return p0
.end method

.method public getVideoCodec()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoCodec:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/EncodeConfig;->videoFrameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public isHdr()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/EncodeConfig;->hdr:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAudioBitrate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->audioBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioChannels(Lcom/momo/xengine/media/types/AudioChannelLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/EncodeConfig;->audioChannels:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioCodec(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/EncodeConfig;->audioCodec:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioFormat(Lcom/momo/xengine/media/types/SampleFormat;)V
    .locals 0
    .param p1    # Lcom/momo/xengine/media/types/SampleFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/EncodeConfig;->audioFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioSamplesRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->audioSamplesRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setBitrate(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/EncodeConfig;->videoBitrate:J

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->videoFrameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setGopSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->gopSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setHdr(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xengine/media/EncodeConfig;->hdr:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/EncodeConfig;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRotation(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->rotation:F

    .line 2
    .line 3
    return-void
.end method

.method public setSize(Landroid/util/Size;)V
    .locals 0
    .param p1    # Landroid/util/Size;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/EncodeConfig;->videoResolution:Landroid/util/Size;

    .line 2
    .line 3
    return-void
.end method

.method public setSpeed(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->speed:F

    .line 2
    .line 3
    return-void
.end method

.method public setVideoCodec(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/EncodeConfig;->videoCodec:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/EncodeConfig;->videoFrameRate:I

    .line 2
    .line 3
    return-void
.end method
