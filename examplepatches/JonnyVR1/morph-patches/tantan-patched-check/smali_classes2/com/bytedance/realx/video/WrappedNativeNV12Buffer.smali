.class public Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;


# static fields
.field private static final TAG:Ljava/lang/String; = "WrappedNativeNV12Buffer"


# instance fields
.field private final dataUV:Ljava/nio/ByteBuffer;

.field private final dataY:Ljava/nio/ByteBuffer;

.field private final height:I

.field private final nativeBuffer:J

.field private final strideUV:I

.field private final strideY:I

.field private final width:I


# direct methods
.method public constructor <init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IJ)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->height:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    iput p4, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->strideY:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->dataUV:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iput p6, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->strideUV:I

    .line 15
    .line 16
    iput-wide p7, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->nativeBuffer:J

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->retain()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private static native nativeNV12ToI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method


# virtual methods
.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    const-string p0, "WrappedNativeNV12Buffer"

    .line 2
    .line 3
    const-string p1, "cropAndScale has not been implemented, default return null"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public getDataUV()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->dataUV:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDataY()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideUV()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->strideUV:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->strideY:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->nativeBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/JniCommon;->nativeReleaseRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->nativeBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/JniCommon;->nativeAddRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    const-string p0, "WrappedNativeNV12Buffer"

    .line 2
    .line 3
    const-string p1, "scaleAndFill has not been implemented, default return null"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 13

    .line 1
    iget v0, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->width:I

    .line 2
    .line 3
    iget v1, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->height:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->allocate(II)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    iget v2, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->strideY:I

    .line 16
    .line 17
    iget-object v3, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->dataUV:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    iget v4, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->strideUV:I

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-virtual {v0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideY()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {v0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {v0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideU()I

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    invoke-virtual {v0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v9

    .line 41
    invoke-virtual {v0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideV()I

    .line 42
    .line 43
    .line 44
    move-result v10

    .line 45
    iget v11, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->width:I

    .line 46
    .line 47
    iget v12, p0, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->height:I

    .line 48
    .line 49
    invoke-static/range {v1 .. v12}, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->nativeNV12ToI420(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method public toNV12()Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/WrappedNativeNV12Buffer;->retain()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method
