.class public Lcom/immomo/mediabase/mediacodec/AudioDecode;
.super Lcom/immomo/mediabase/mediacodec/MediaCodecBase;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioDecode_HUOHL"


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public decodeAudioFrame(Ljava/nio/ByteBuffer;J)I
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

.method public initAudioDeocde(Landroid/media/MediaFormat;)I
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mFormat:Landroid/media/MediaFormat;

    .line 2
    .line 3
    :try_start_0
    const-string v0, "mime"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mCodec:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-super {p0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->initCodec(Z)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :catch_0
    move-exception p1

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "initAudioDeocde: Init Error: "

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "AudioDecode_HUOHL"

    .line 41
    .line 42
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/immomo/mediabase/mediacodec/MediaCodecBase;->mListener:Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;

    .line 46
    .line 47
    const/4 v0, -0x1

    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-interface {p0, v0, p1}, Lcom/immomo/mediabase/mediacodec/MediaCodecBase$MediaCodecListener;->onError(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return v0
.end method
