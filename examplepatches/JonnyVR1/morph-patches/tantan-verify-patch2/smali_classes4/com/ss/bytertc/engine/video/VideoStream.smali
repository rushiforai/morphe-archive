.class public Lcom/ss/bytertc/engine/video/VideoStream;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/video/VideoStream$Buffer;
    }
.end annotation


# instance fields
.field private final buffer:Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

.field private final height:I

.field private final width:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/video/VideoStream$Buffer;II)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/VideoStream;->buffer:Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/video/VideoStream;->width:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/video/VideoStream;->height:I

    .line 9
    .line 10
    return-void
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
.method public getBuffer()Lcom/ss/bytertc/engine/video/VideoStream$Buffer;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoStream;->buffer:Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoStream;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoStream;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoStream;->buffer:Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/VideoStream$Buffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/VideoStream;->buffer:Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/VideoStream$Buffer;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
