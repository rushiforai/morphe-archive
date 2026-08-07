.class public Lcom/imomo/momo/mediamuxer/MediaMuxer;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MEDIA_MUXER_FLV:I = 0x2

.field public static final MEDIA_MUXER_MP4:I = 0x1

.field public static final MEDIA_MUXER_NONE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "MediaMuxer"


# instance fields
.field private mHandler:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "mdlog"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "mmcrypto"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "mmssl"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "cosmosffmpeg"

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "c++_shared"

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "MediaMuxer"

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 7
    .line 8
    return-void
.end method

.method private native nativeAddAudioStream(JIII)I
.end method

.method private native nativeAddVideoStream(JII[BII)I
.end method

.method private native nativeInitMuxer(I)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetFileName(JLjava/lang/String;)I
.end method

.method private native nativeWriteAudioFrame(J[BIJ)I
.end method

.method private native nativeWriteHeader(J)I
.end method

.method private native nativeWriteTrailer(J)I
.end method

.method private native nativeWriteVideoFrame(J[BIJJI)I
.end method


# virtual methods
.method public addAudioStream(III)Z
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v3, p1

    .line 5
    move v4, p2

    .line 6
    move v5, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeAddAudioStream(JIII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public addVideoStream(II[BII)Z
    .locals 8

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v3, p1

    .line 5
    move v4, p2

    .line 6
    move-object v5, p3

    .line 7
    move v6, p4

    .line 8
    move v7, p5

    .line 9
    invoke-direct/range {v0 .. v7}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeAddVideoStream(JII[BII)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public initMuxer(I)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeInitMuxer(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 6
    .line 7
    const-wide/16 p0, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, p0

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeRelease(J)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 9
    .line 10
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeSetFileName(JLjava/lang/String;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public writeAudioFrame([BIJ)Z
    .locals 7

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move v4, p2

    .line 6
    move-wide v5, p3

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeWriteAudioFrame(J[BIJ)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public writeHeader()Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeWriteHeader(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public writeTrailer()Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeWriteTrailer(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public writeVideoFrame([BIJJI)Z
    .locals 10

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediamuxer/MediaMuxer;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move v4, p2

    .line 6
    move-wide v5, p3

    .line 7
    move-wide v7, p5

    .line 8
    move/from16 v9, p7

    .line 9
    .line 10
    invoke-direct/range {v0 .. v9}, Lcom/imomo/momo/mediamuxer/MediaMuxer;->nativeWriteVideoFrame(J[BIJJI)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method
