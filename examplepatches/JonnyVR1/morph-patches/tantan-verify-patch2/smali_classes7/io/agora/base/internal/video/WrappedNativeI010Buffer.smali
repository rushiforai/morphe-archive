.class Lio/agora/base/internal/video/WrappedNativeI010Buffer;
.super Lio/agora/base/JavaI010Buffer;
.source "SourceFile"


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
    .locals 10
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    const/4 v9, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move/from16 v6, p6

    .line 9
    .line 10
    move-object/from16 v7, p7

    .line 11
    .line 12
    move/from16 v8, p8

    .line 13
    .line 14
    invoke-direct/range {v0 .. v9}, Lio/agora/base/JavaI010Buffer;-><init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iput p1, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->width:I

    .line 18
    .line 19
    iput p2, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->height:I

    .line 20
    .line 21
    iput-object p3, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    iput p4, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->strideY:I

    .line 24
    .line 25
    iput-object p5, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->dataU:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    iput v6, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->strideU:I

    .line 28
    .line 29
    iput-object v7, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->dataV:Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    iput v8, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->strideV:I

    .line 32
    .line 33
    move-wide/from16 p1, p9

    .line 34
    .line 35
    iput-wide p1, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->nativeBuffer:J

    .line 36
    .line 37
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->retain()V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public cropAndScale(IIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDataU()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->dataU:Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->dataV:Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->dataY:Ljava/nio/ByteBuffer;

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
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideU()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->strideU:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideV()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->strideV:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->strideY:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public mirror(I)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->nativeBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/JniCommon;->nativeReleaseRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeI010Buffer;->nativeBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/JniCommon;->nativeAddRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public rotate(I)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public toI420()Lio/agora/base/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    invoke-super {p0}, Lio/agora/base/JavaI010Buffer;->toI420()Lio/agora/base/VideoFrame$I420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public transform(IIIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method
