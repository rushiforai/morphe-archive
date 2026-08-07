.class public Lcom/immomo/mediabase/AudioTrackEx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioTrackEx_HUOHL"


# instance fields
.field private mAudioTrack:Landroid/media/AudioTrack;

.field private mBufferSizeInBytes:I

.field private mChannel:I

.field private mSampleRate:I

.field private mSapleBits:I

.field private mStreamType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0xac44

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSampleRate:I

    .line 8
    .line 9
    const/16 v0, 0xc

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    .line 15
    .line 16
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mStreamType:I

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mBufferSizeInBytes:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioTrack;->flush()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getMinBufferSize()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSampleRate:I

    .line 2
    .line 3
    iget v1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    .line 4
    .line 5
    iget p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public initAudioTrackEx(IIII)I
    .locals 1

    .line 65
    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSampleRate:I

    const/16 p1, 0x8

    const/4 p4, 0x4

    const/4 v0, 0x2

    if-eq p3, p1, :cond_2

    const/16 p1, 0x10

    if-eq p3, p1, :cond_1

    const/16 p1, 0x20

    if-eq p3, p1, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    iput p4, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    goto :goto_0

    .line 67
    :cond_1
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    goto :goto_0

    :cond_2
    const/4 p1, 0x3

    .line 68
    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    :goto_0
    const/4 p1, 0x1

    if-eq p2, p1, :cond_4

    if-eq p2, v0, :cond_3

    goto :goto_1

    :cond_3
    const/16 p1, 0xc

    .line 69
    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    goto :goto_1

    .line 70
    :cond_4
    iput p4, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    .line 71
    :goto_1
    invoke-virtual {p0}, Lcom/immomo/mediabase/AudioTrackEx;->getMinBufferSize()I

    move-result p1

    mul-int/2addr p1, v0

    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mBufferSizeInBytes:I

    const/4 p0, 0x0

    return p0
.end method

.method public initAudioTrackEx(Landroid/media/MediaFormat;I)I
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    :try_start_0
    const-string v0, "sample-rate"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSampleRate:I

    .line 12
    .line 13
    const-string v0, "channel-count"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    .line 20
    .line 21
    const-string v0, "pcm-encoding"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/4 v0, 0x3

    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    const/16 p1, 0x8

    .line 31
    .line 32
    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v0, 0x2

    .line 36
    if-ne p1, v0, :cond_2

    .line 37
    .line 38
    const/16 p1, 0x10

    .line 39
    .line 40
    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 v0, 0x4

    .line 44
    if-ne p1, v0, :cond_3

    .line 45
    .line 46
    const/16 p1, 0x20

    .line 47
    .line 48
    iput p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    :goto_0
    iget p1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSampleRate:I

    .line 51
    .line 52
    iget v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    .line 53
    .line 54
    iget v1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/immomo/mediabase/AudioTrackEx;->initAudioTrackEx(IIII)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_3
    const/4 p0, -0x2

    .line 62
    return p0

    .line 63
    :catch_0
    const/4 p0, -0x3

    .line 64
    return p0
.end method

.method public pausePlay()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioTrack;->pause()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setBufferSize(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediabase/AudioTrackEx;->getMinBufferSize()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mBufferSizeInBytes:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mBufferSizeInBytes:I

    .line 13
    .line 14
    return-void
.end method

.method public startPlay()I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Landroid/media/AudioTrack;

    .line 6
    .line 7
    iget v2, p0, Lcom/immomo/mediabase/AudioTrackEx;->mStreamType:I

    .line 8
    .line 9
    iget v3, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSampleRate:I

    .line 10
    .line 11
    iget v4, p0, Lcom/immomo/mediabase/AudioTrackEx;->mChannel:I

    .line 12
    .line 13
    iget v5, p0, Lcom/immomo/mediabase/AudioTrackEx;->mSapleBits:I

    .line 14
    .line 15
    iget v6, p0, Lcom/immomo/mediabase/AudioTrackEx;->mBufferSizeInBytes:I

    .line 16
    .line 17
    const/4 v7, 0x1

    .line 18
    invoke-direct/range {v1 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/media/AudioTrack;->play()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public stopPlay()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public writeSample(Ljava/nio/ByteBuffer;Z)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    .line 12
    .line 13
    xor-int/lit8 p2, p2, 0x1

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0, p2}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public writeSample([BI)I
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, v0, p2}, Lcom/immomo/mediabase/AudioTrackEx;->writeSample([BII)I

    move-result p0

    return p0
.end method

.method public writeSample([BII)I
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/immomo/mediabase/AudioTrackEx;->mAudioTrack:Landroid/media/AudioTrack;

    if-nez p0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 22
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/media/AudioTrack;->write([BII)I

    move-result p0

    sub-int/2addr p3, p0

    return p3
.end method
