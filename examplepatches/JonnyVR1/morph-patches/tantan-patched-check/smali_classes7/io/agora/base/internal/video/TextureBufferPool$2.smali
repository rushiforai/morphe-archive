.class Lio/agora/base/internal/video/TextureBufferPool$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TextureBufferPool;->textureCopy(ILio/agora/base/VideoFrame$TextureBuffer$Type;IILandroid/graphics/Matrix;JILjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/VideoFrame$TextureBuffer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/TextureBufferPool;

.field final synthetic val$bufferReleaseCallback:Ljava/lang/Runnable;

.field final synthetic val$fenceObject:J

.field final synthetic val$height:I

.field final synthetic val$textureId:I

.field final synthetic val$transfer:I

.field final synthetic val$transformMatrix:Landroid/graphics/Matrix;

.field final synthetic val$type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

.field final synthetic val$width:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TextureBufferPool;ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$textureId:I

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 6
    .line 7
    iput p4, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$width:I

    .line 8
    .line 9
    iput p5, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$height:I

    .line 10
    .line 11
    iput p6, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$transfer:I

    .line 12
    .line 13
    iput-object p7, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$transformMatrix:Landroid/graphics/Matrix;

    .line 14
    .line 15
    iput-wide p8, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$fenceObject:J

    .line 16
    .line 17
    iput-object p10, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$bufferReleaseCallback:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    iget v1, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$textureId:I

    .line 4
    .line 5
    iget-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$type:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 6
    .line 7
    iget v3, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$width:I

    .line 8
    .line 9
    iget v4, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$height:I

    .line 10
    .line 11
    iget v5, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$transfer:I

    .line 12
    .line 13
    iget-object v6, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$transformMatrix:Landroid/graphics/Matrix;

    .line 14
    .line 15
    iget-wide v7, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$fenceObject:J

    .line 16
    .line 17
    iget-object v9, p0, Lio/agora/base/internal/video/TextureBufferPool$2;->val$bufferReleaseCallback:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-static/range {v0 .. v9}, Lio/agora/base/internal/video/TextureBufferPool;->access$300(Lio/agora/base/internal/video/TextureBufferPool;ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Lio/agora/base/internal/video/TextureBufferPool$2;->call()Lio/agora/base/VideoFrame$TextureBuffer;

    move-result-object p0

    return-object p0
.end method
