.class Lio/agora/base/internal/video/TextureBufferPool$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TextureBufferPool;->doTextureCopy(ILio/agora/base/VideoFrame$TextureBuffer$Type;IIILandroid/graphics/Matrix;JLjava/lang/Runnable;)Lio/agora/base/VideoFrame$TextureBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/TextureBufferPool;

.field final synthetic val$bufferReleaseCallback:Ljava/lang/Runnable;

.field final synthetic val$ret:[Lio/agora/base/TextureBuffer;

.field final synthetic val$texInfo:Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TextureBufferPool;[Lio/agora/base/TextureBuffer;Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/TextureBufferPool$6;->val$ret:[Lio/agora/base/TextureBuffer;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/TextureBufferPool$6;->val$texInfo:Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 6
    .line 7
    iput-object p4, p0, Lio/agora/base/internal/video/TextureBufferPool$6;->val$bufferReleaseCallback:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/base/internal/video/TextureBufferPool;->access$900(Lio/agora/base/internal/video/TextureBufferPool;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lio/agora/base/internal/video/TextureBufferPool$6$1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/TextureBufferPool$6$1;-><init>(Lio/agora/base/internal/video/TextureBufferPool$6;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
