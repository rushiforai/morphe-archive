.class public Lio/agora/base/VideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/RefCounted;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/VideoFrame$AlphaStitchMode;,
        Lio/agora/base/VideoFrame$SourceType;,
        Lio/agora/base/VideoFrame$HdrMetadata;,
        Lio/agora/base/VideoFrame$ColorSpace;,
        Lio/agora/base/VideoFrame$TextureBuffer;,
        Lio/agora/base/VideoFrame$RgbaBuffer;,
        Lio/agora/base/VideoFrame$I422Buffer;,
        Lio/agora/base/VideoFrame$I010Buffer;,
        Lio/agora/base/VideoFrame$I420Buffer;,
        Lio/agora/base/VideoFrame$Buffer;
    }
.end annotation


# instance fields
.field private alphaBuffer:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private alphaStitchMode:Lio/agora/base/VideoFrame$AlphaStitchMode;

.field private buffer:Lio/agora/base/VideoFrame$Buffer;

.field private colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

.field private metaInfo:Lio/agora/base/VideoFrameMetaInfo;

.field private nativeAlphaBuffer:J

.field private rotation:I

.field private sampleAspectRatio:F

.field private sourceType:Lio/agora/base/VideoFrame$SourceType;

.field private timestampNs:J


# direct methods
.method public constructor <init>(Lio/agora/base/VideoFrame$Buffer;IJ)V
    .locals 11

    .line 57
    new-instance v5, Lio/agora/base/internal/video/WrappedNativeColorSpace;

    invoke-direct {v5}, Lio/agora/base/internal/video/WrappedNativeColorSpace;-><init>()V

    sget-object v0, Lio/agora/base/VideoFrame$SourceType;->kUnspecified:Lio/agora/base/VideoFrame$SourceType;

    .line 58
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    .line 59
    invoke-direct/range {v0 .. v10}, Lio/agora/base/VideoFrame;-><init>(Lio/agora/base/VideoFrame$Buffer;IJLio/agora/base/VideoFrame$ColorSpace;Ljava/nio/ByteBuffer;JFI)V

    return-void
.end method

.method public constructor <init>(Lio/agora/base/VideoFrame$Buffer;IJLio/agora/base/VideoFrame$ColorSpace;Ljava/nio/ByteBuffer;JFI)V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_NO_STITCH:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 5
    .line 6
    iput-object v0, p0, Lio/agora/base/VideoFrame;->alphaStitchMode:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 7
    .line 8
    new-instance v0, Lio/agora/base/VideoFrameMetaInfo;

    .line 9
    .line 10
    invoke-direct {v0}, Lio/agora/base/VideoFrameMetaInfo;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lio/agora/base/VideoFrame;->metaInfo:Lio/agora/base/VideoFrameMetaInfo;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    rem-int/lit8 v1, p2, 0x5a

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iput-object p1, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 23
    .line 24
    iput p2, p0, Lio/agora/base/VideoFrame;->rotation:I

    .line 25
    .line 26
    iput-wide p3, p0, Lio/agora/base/VideoFrame;->timestampNs:J

    .line 27
    .line 28
    iput-object p5, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 29
    .line 30
    iput-object p6, p0, Lio/agora/base/VideoFrame;->alphaBuffer:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    iput-wide p7, p0, Lio/agora/base/VideoFrame;->nativeAlphaBuffer:J

    .line 33
    .line 34
    iput p9, p0, Lio/agora/base/VideoFrame;->sampleAspectRatio:F

    .line 35
    .line 36
    invoke-static {}, Lio/agora/base/VideoFrame$SourceType;->values()[Lio/agora/base/VideoFrame$SourceType;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    aget-object p1, p1, p10

    .line 41
    .line 42
    iput-object p1, p0, Lio/agora/base/VideoFrame;->sourceType:Lio/agora/base/VideoFrame$SourceType;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const-string p0, "rotation must be a multiple of 90"

    .line 46
    .line 47
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw v0

    .line 51
    :cond_1
    const-string p0, "buffer not allowed to be null"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw v0
.end method

.method private getColorSpaceMatrix()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->getMatrix()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-interface {p0}, Lio/agora/base/VideoFrame$ColorSpace;->getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Matrix;->getMatrix()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private getColorSpacePrimary()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Primary;->getPrimary()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-interface {p0}, Lio/agora/base/VideoFrame$ColorSpace;->getPrimary()Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Primary;->getPrimary()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private getColorSpaceRange()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lio/agora/base/VideoFrame$ColorSpace$Range;->Invalid:Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Range;->getRange()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-interface {p0}, Lio/agora/base/VideoFrame$ColorSpace;->getRange()Lio/agora/base/VideoFrame$ColorSpace$Range;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Range;->getRange()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method private getColorSpaceTransfer()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-interface {p0}, Lio/agora/base/VideoFrame$ColorSpace;->getTransfer()Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method


# virtual methods
.method public fillAlphaData(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/VideoFrame;->alphaBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method

.method public getAlphaBuffer()Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->alphaBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAlphaStitchMode()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->alphaStitchMode:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 2
    .line 3
    invoke-virtual {p0}, Lio/agora/base/VideoFrame$AlphaStitchMode;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getBuffer()Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorSpace()Lio/agora/base/VideoFrame$ColorSpace;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMetaInfo()Lio/agora/base/VideoFrameMetaInfo;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->metaInfo:Lio/agora/base/VideoFrameMetaInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotatedHeight()I
    .locals 2

    .line 1
    iget v0, p0, Lio/agora/base/VideoFrame;->rotation:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    iget-object v1, p0, Lio/agora/base/VideoFrame;->alphaStitchMode:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_UP:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 10
    .line 11
    if-eq v1, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_BELOW:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 14
    .line 15
    if-ne v1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 19
    .line 20
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 26
    .line 27
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    div-int/lit8 p0, p0, 0x2

    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_LEFT:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 35
    .line 36
    if-eq v1, v0, :cond_4

    .line 37
    .line 38
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_RIGHT:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 39
    .line 40
    if-ne v1, v0, :cond_3

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 44
    .line 45
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_4
    :goto_1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 51
    .line 52
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    div-int/lit8 p0, p0, 0x2

    .line 57
    .line 58
    return p0
.end method

.method public getRotatedWidth()I
    .locals 2

    .line 1
    iget v0, p0, Lio/agora/base/VideoFrame;->rotation:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    iget-object v1, p0, Lio/agora/base/VideoFrame;->alphaStitchMode:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_LEFT:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 10
    .line 11
    if-eq v1, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_RIGHT:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 14
    .line 15
    if-ne v1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 19
    .line 20
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 26
    .line 27
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    div-int/lit8 p0, p0, 0x2

    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_UP:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 35
    .line 36
    if-eq v1, v0, :cond_4

    .line 37
    .line 38
    sget-object v0, Lio/agora/base/VideoFrame$AlphaStitchMode;->ALPHA_STITCH_BELOW:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 39
    .line 40
    if-ne v1, v0, :cond_3

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 44
    .line 45
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_4
    :goto_1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 51
    .line 52
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    div-int/lit8 p0, p0, 0x2

    .line 57
    .line 58
    return p0
.end method

.method public getRotation()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/VideoFrame;->rotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getSampleAspectRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/VideoFrame;->sampleAspectRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getSourceType()Lio/agora/base/VideoFrame$SourceType;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->sourceType:Lio/agora/base/VideoFrame$SourceType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimestampNs()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lio/agora/base/VideoFrame;->timestampNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public release()V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public releaseAlphaBuffer()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/VideoFrame;->nativeAlphaBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/JniCommon;->nativeReleaseRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public replaceBuffer(Lio/agora/base/VideoFrame$Buffer;IJ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lio/agora/base/VideoFrame;->release()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 5
    .line 6
    iput p2, p0, Lio/agora/base/VideoFrame;->rotation:I

    .line 7
    .line 8
    iput-wide p3, p0, Lio/agora/base/VideoFrame;->timestampNs:J

    .line 9
    .line 10
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/VideoFrame;->buffer:Lio/agora/base/VideoFrame$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retainAlphaBuffer()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/VideoFrame;->nativeAlphaBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/JniCommon;->nativeAddRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAlphaStitchMode(I)V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lio/agora/base/VideoFrame$AlphaStitchMode;->values()[Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    aget-object p1, v0, p1

    .line 6
    .line 7
    iput-object p1, p0, Lio/agora/base/VideoFrame;->alphaStitchMode:Lio/agora/base/VideoFrame$AlphaStitchMode;

    .line 8
    .line 9
    return-void
.end method

.method public setColorSpace(Lio/agora/base/VideoFrame$ColorSpace;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/VideoFrame;->colorSpace:Lio/agora/base/VideoFrame$ColorSpace;

    .line 2
    .line 3
    return-void
.end method
