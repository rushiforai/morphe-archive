.class Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$RgbaBuffer;


# instance fields
.field private final data:Ljava/nio/ByteBuffer;

.field private final height:I

.field private nativeBuffer:J

.field private final width:I


# direct methods
.method public constructor <init>(IILjava/nio/ByteBuffer;J)V
    .locals 0
    .param p3    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p4, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->nativeBuffer:J

    .line 5
    .line 6
    iput p1, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->width:I

    .line 7
    .line 8
    iput p2, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->height:I

    .line 9
    .line 10
    iput-object p3, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->data:Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->retain()V

    .line 13
    .line 14
    .line 15
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

.method public getData()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->data:Ljava/nio/ByteBuffer;

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
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->width:I

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
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->nativeBuffer:J

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
    iget-wide v0, p0, Lio/agora/base/internal/video/WrappedNativeRgbaBuffer;->nativeBuffer:J

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
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public transform(IIIIIII)Lio/agora/base/VideoFrame$Buffer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method
