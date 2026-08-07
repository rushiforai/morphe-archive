.class Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/video/VideoStream$Buffer;


# instance fields
.field private final data:Ljava/nio/ByteBuffer;

.field private final nativeBuffer:J

.field private final size:I


# direct methods
.method public constructor <init>(ILjava/nio/ByteBuffer;J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->size:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->data:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->nativeBuffer:J

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->retain()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getData()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->data:Ljava/nio/ByteBuffer;

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

.method public getDataSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->size:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->nativeBuffer:J

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
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/WrappedNativeStreamBuffer;->nativeBuffer:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/JniCommon;->nativeAddRef(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
