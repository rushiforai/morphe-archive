.class public Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;
.super Lcom/momo/mcamera/videoencoder/MediaEncoder;
.source "SourceFile"


# static fields
.field private static final BPP:F = 0.25f

.field private static final DEBUG:Z = false

.field private static final FRAME_RATE:I = 0xa

.field private static final MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final TAG:Ljava/lang/String; = "MediaVideoEncoder"

.field protected static recognizedFormats:[I


# instance fields
.field private mBitRate:J

.field private mHeight:I

.field private mSurface:Landroid/view/Surface;

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const v0, 0x7f000789

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->recognizedFormats:[I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;IIJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/videoencoder/MediaEncoder;-><init>(Lcom/momo/mcamera/videoencoder/MediaMuxerWrapper;Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mWidth:I

    .line 5
    .line 6
    iput p4, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mHeight:I

    .line 7
    .line 8
    iput-wide p5, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mBitRate:J

    .line 9
    .line 10
    return-void
.end method

.method private calcBitRate()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mWidth:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/high16 v1, 0x40200000    # 2.5f

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget p0, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mHeight:I

    .line 8
    .line 9
    int-to-float p0, p0

    .line 10
    mul-float/2addr v0, p0

    .line 11
    float-to-int p0, v0

    .line 12
    return p0
.end method

.method private static final isRecognizedViewoFormat(I)Z
    .locals 4

    .line 1
    sget-object v0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->recognizedFormats:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v0, v1

    .line 9
    :goto_0
    move v2, v1

    .line 10
    :goto_1
    if-ge v2, v0, :cond_2

    .line 11
    .line 12
    sget-object v3, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->recognizedFormats:[I

    .line 13
    .line 14
    aget v3, v3, v2

    .line 15
    .line 16
    if-ne v3, p0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    return v1
.end method

.method public static final selectColorFormat(Landroid/media/MediaCodecInfo;Ljava/lang/String;)I
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    const/4 v0, 0x5

    .line 2
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/16 v2, 0xa

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setPriority(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 12
    .line 13
    .line 14
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    move v2, v0

    .line 24
    :goto_0
    iget-object v3, v1, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 25
    .line 26
    array-length v4, v3

    .line 27
    if-ge v2, v4, :cond_1

    .line 28
    .line 29
    aget v3, v3, v2

    .line 30
    .line 31
    invoke-static {v3}, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->isRecognizedViewoFormat(I)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    move v0, v3

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v2, "MediaVideoEncoder couldn\'t find a good color format for "

    .line 47
    .line 48
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, " / "

    .line 59
    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "MediaEncoder"

    .line 71
    .line 72
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    return v0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 82
    .line 83
    .line 84
    throw p0
.end method

.method public static final selectVideoCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_3

    .line 8
    .line 9
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    move v5, v1

    .line 25
    :goto_1
    array-length v6, v4

    .line 26
    if-ge v5, v6, :cond_2

    .line 27
    .line 28
    aget-object v6, v4, v5

    .line 29
    .line 30
    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    invoke-static {v3, p0}, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->selectColorFormat(Landroid/media/MediaCodecInfo;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-lez v6, :cond_1

    .line 41
    .line 42
    return-object v3

    .line 43
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method


# virtual methods
.method public prepare(Lcom/momo/mcamera/videoencoder/ProcessSurface;Landroid/media/MediaFormat;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p2, -0x1

    .line 2
    iput p2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mTrackIndex:I

    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsEOS:Z

    .line 6
    .line 7
    iput-boolean p2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMuxerStarted:Z

    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 10
    .line 11
    const-string p1, "video/avc"

    .line 12
    .line 13
    invoke-static {p1}, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->selectVideoCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget p2, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mWidth:I

    .line 21
    .line 22
    iget v0, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mHeight:I

    .line 23
    .line 24
    invoke-static {p1, p2, v0}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string v0, "color-format"

    .line 29
    .line 30
    const v1, 0x7f000789

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mBitRate:J

    .line 37
    .line 38
    long-to-int v0, v0

    .line 39
    const-string v1, "bitrate"

    .line 40
    .line 41
    invoke-virtual {p2, v1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    const-string v0, "frame-rate"

    .line 45
    .line 46
    const/16 v1, 0xa

    .line 47
    .line 48
    invoke-virtual {p2, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    const-string v0, "i-frame-interval"

    .line 52
    .line 53
    invoke-virtual {p2, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-virtual {p1, p2, v1, v1, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    .line 74
    .line 75
    iget-object p2, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->processSurface:Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 76
    .line 77
    if-eqz p2, :cond_1

    .line 78
    .line 79
    invoke-virtual {p2, p1}, Lcom/momo/mcamera/videoencoder/ProcessSurface;->addMediaCodecSurface(Landroid/view/Surface;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mListener:Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;

    .line 88
    .line 89
    if-eqz p1, :cond_2

    .line 90
    .line 91
    :try_start_0
    invoke-interface {p1, p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;->onPrepared(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :catch_0
    move-exception p0

    .line 96
    const-string p1, "MediaVideoEncoder prepare:"

    .line 97
    .line 98
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p2, "MediaEncoder"

    .line 103
    .line 104
    invoke-static {p2, p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    .line 10
    .line 11
    :cond_0
    invoke-super {p0}, Lcom/momo/mcamera/videoencoder/MediaEncoder;->release()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public signalEndOfInputStream()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/videoencoder/MediaEncoder;->mIsEOS:Z

    .line 8
    .line 9
    return-void
.end method
