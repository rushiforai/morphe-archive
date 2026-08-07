.class Lcom/bytedance/realx/video/WrappedNativeI420Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$I420Buffer;


# instance fields
.field private final dataU:Ljava/nio/ByteBuffer;

.field private final dataV:Ljava/nio/ByteBuffer;

.field private final dataY:Ljava/nio/ByteBuffer;

.field private final height:I

.field private final nativeBuffer:J

.field private final strideU:I

.field private final strideV:I

.field private final strideY:I

.field private final width:I


# direct methods
.method public constructor <init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IJ)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->height:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    iput p4, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->strideY:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iput p6, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->strideU:I

    .line 15
    .line 16
    iput-object p7, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    iput p8, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->strideV:I

    .line 19
    .line 20
    iput-wide p9, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->nativeBuffer:J

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->retain()V

    .line 23
    .line 24
    .line 25
    return-void
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
    invoke-static/range {p0 .. p6}, Lcom/bytedance/realx/video/JavaI420Buffer;->cropAndScaleI420(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDataU()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->dataU:Ljava/nio/ByteBuffer;

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

.method public getDataV()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->dataV:Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->dataY:Ljava/nio/ByteBuffer;

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
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideU()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->strideU:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideV()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->strideV:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->strideY:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->nativeBuffer:J

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
    iget-wide v0, p0, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->nativeBuffer:J

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
    invoke-static {p0, p1, p2, p3, p4}, Lcom/bytedance/realx/video/JavaI420Buffer;->scaleAndFillI420(Lcom/bytedance/realx/video/VideoFrame$I420Buffer;IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/WrappedNativeI420Buffer;->retain()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method
