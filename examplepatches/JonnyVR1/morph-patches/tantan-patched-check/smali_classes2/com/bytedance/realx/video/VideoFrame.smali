.class public Lcom/bytedance/realx/video/VideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/VideoFrame$ColorSpace;,
        Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;,
        Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;,
        Lcom/bytedance/realx/video/VideoFrame$I420Buffer;,
        Lcom/bytedance/realx/video/VideoFrame$Buffer;
    }
.end annotation


# instance fields
.field private final buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

.field private colorSpace:I

.field private final extendedData:Ljava/nio/ByteBuffer;

.field private isFlip:Z

.field private iso:I

.field private final rotation:I

.field private final timestampNs:J


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V
    .locals 6

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move-wide v4, p3

    .line 79
    invoke-direct/range {v0 .. v5}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;Ljava/nio/ByteBuffer;IJ)V

    return-void
.end method

.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJZ)V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 46
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->colorSpace:I

    const/4 v0, -0x1

    .line 47
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->iso:I

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 48
    rem-int/lit8 v1, p2, 0x5a

    if-nez v1, :cond_0

    .line 49
    iput-object p1, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 50
    iput p2, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 51
    iput-wide p3, p0, Lcom/bytedance/realx/video/VideoFrame;->timestampNs:J

    .line 52
    iput-object v0, p0, Lcom/bytedance/realx/video/VideoFrame;->extendedData:Ljava/nio/ByteBuffer;

    .line 53
    iput-boolean p5, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    return-void

    .line 54
    :cond_0
    const-string p0, "rotation must be a multiple of 90"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    const-string p0, "buffer not allowed to be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;Ljava/nio/ByteBuffer;IJ)V
    .locals 2

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 58
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->colorSpace:I

    const/4 v0, -0x1

    .line 59
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->iso:I

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 60
    rem-int/lit8 v1, p3, 0x5a

    if-nez v1, :cond_0

    .line 61
    iput-object p1, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 62
    iput p3, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 63
    iput-wide p4, p0, Lcom/bytedance/realx/video/VideoFrame;->timestampNs:J

    .line 64
    iput-object p2, p0, Lcom/bytedance/realx/video/VideoFrame;->extendedData:Ljava/nio/ByteBuffer;

    return-void

    .line 65
    :cond_0
    const-string p0, "rotation must be a multiple of 90"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1
    const-string p0, "buffer not allowed to be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;Ljava/nio/ByteBuffer;IJZ)V
    .locals 2

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 69
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->colorSpace:I

    const/4 v0, -0x1

    .line 70
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->iso:I

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 71
    rem-int/lit8 v1, p3, 0x5a

    if-nez v1, :cond_0

    .line 72
    iput-object p1, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 73
    iput p3, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 74
    iput-wide p4, p0, Lcom/bytedance/realx/video/VideoFrame;->timestampNs:J

    .line 75
    iput-object p2, p0, Lcom/bytedance/realx/video/VideoFrame;->extendedData:Ljava/nio/ByteBuffer;

    .line 76
    iput-boolean p6, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    return-void

    .line 77
    :cond_0
    const-string p0, "rotation must be a multiple of 90"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_1
    const-string p0, "buffer not allowed to be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;Ljava/nio/ByteBuffer;IJZI)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->colorSpace:I

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lcom/bytedance/realx/video/VideoFrame;->iso:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    rem-int/lit8 v1, p3, 0x5a

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iput-object p1, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 20
    .line 21
    iput p3, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 22
    .line 23
    iput-wide p4, p0, Lcom/bytedance/realx/video/VideoFrame;->timestampNs:J

    .line 24
    .line 25
    iput-object p2, p0, Lcom/bytedance/realx/video/VideoFrame;->extendedData:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    iput-boolean p6, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 28
    .line 29
    iput p7, p0, Lcom/bytedance/realx/video/VideoFrame;->colorSpace:I

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-string p0, "rotation must be a multiple of 90"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw v0

    .line 38
    :cond_1
    const-string p0, "buffer not allowed to be null"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0
.end method

.method public static allocateDirectByteBuffer(I)Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorSpace()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/VideoFrame;->colorSpace:I

    .line 2
    .line 3
    return p0
.end method

.method public getExtendedData()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrame;->extendedData:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFlipState()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIso()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/VideoFrame;->iso:I

    .line 2
    .line 3
    return p0
.end method

.method public getRotatedHeight()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getRotatedWidth()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public getRotation()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/VideoFrame;->rotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimestampNs()J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/VideoFrame;->timestampNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public release()V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoFrame;->buffer:Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFlipState(Z)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/bytedance/realx/video/VideoFrame;->isFlip:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIso(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/VideoFrame;->iso:I

    .line 2
    .line 3
    return-void
.end method
