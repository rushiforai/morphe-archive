.class public Lcom/immomo/mediabase/mediacodec/AudioEncode;
.super Lcom/immomo/mediabase/mediacodec/MediaCodecBase;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioEncode_HUOHL"


# instance fields
.field private mChannel:I

.field private mEncodeBitrate:I

.field private mMaxInputSize:I

.field private mSampleBits:I

.field private mSampleRate:I


# direct methods
.method public constructor <init>(IIIILcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x5000

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mMaxInputSize:I

    .line 7
    .line 8
    iput p1, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mSampleRate:I

    .line 9
    .line 10
    iput p2, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mChannel:I

    .line 11
    .line 12
    iput p3, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mSampleBits:I

    .line 13
    .line 14
    iput-object p5, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 15
    .line 16
    iput p4, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mEncodeBitrate:I

    .line 17
    .line 18
    const-string p1, "AudioEncode_HUOHL"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->setLogTag(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public encodeFrame(Ljava/nio/ByteBuffer;J)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->processFrame(Ljava/nio/ByteBuffer;J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public initAudioEncode(Ljava/lang/String;)I
    .locals 4

    .line 1
    :try_start_0
    invoke-static {p1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    new-instance v0, Landroid/media/MediaFormat;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "mime"

    .line 13
    .line 14
    const-string v2, "audio/mp4a-latm"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v1, "bitrate"

    .line 20
    .line 21
    iget v3, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mEncodeBitrate:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const-string v1, "channel-count"

    .line 27
    .line 28
    iget v3, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mChannel:I

    .line 29
    .line 30
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    const-string v1, "sample-rate"

    .line 34
    .line 35
    iget v3, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mSampleRate:I

    .line 36
    .line 37
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    const-string v1, "max-input-size"

    .line 41
    .line 42
    iget v3, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mMaxInputSize:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    const-string p1, "aac-profile"

    .line 54
    .line 55
    const/4 v1, 0x2

    .line 56
    invoke-virtual {v0, p1, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    const/4 p1, 0x1

    .line 60
    invoke-super {p0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->initCodec(Z)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0

    .line 65
    :catch_0
    move-exception p1

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v1, "Init AudioEncode Error : "

    .line 69
    .line 70
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "AudioEncode_HUOHL"

    .line 85
    .line 86
    invoke-static {v1, v0}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 90
    .line 91
    const/4 v0, -0x1

    .line 92
    if-eqz p0, :cond_1

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-interface {p0, v0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onError(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    return v0
.end method

.method public setMaxInputSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediabase/mediacodec/AudioEncode;->mMaxInputSize:I

    .line 2
    .line 3
    return-void
.end method

.method public start()I
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->start()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public stop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->stop()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
