.class Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->toI420()Lio/agora/base/VideoFrame$I420Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/VideoFrame$I420Buffer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/WrappedNativeTextureBuffer;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;->this$0:Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/VideoFrame$I420Buffer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;->this$0:Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->access$000(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;)Lio/agora/base/internal/video/YuvConverter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;->this$0:Lio/agora/base/internal/video/WrappedNativeTextureBuffer;

    .line 8
    .line 9
    invoke-static {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer;->access$100(Lio/agora/base/internal/video/WrappedNativeTextureBuffer;)Lio/agora/base/VideoFrame$ColorSpace;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, p0, v1}, Lio/agora/base/internal/video/YuvConverter;->convert(Lio/agora/base/VideoFrame$TextureBuffer;Lio/agora/base/VideoFrame$ColorSpace;)Lio/agora/base/VideoFrame$I420Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    invoke-virtual {p0}, Lio/agora/base/internal/video/WrappedNativeTextureBuffer$2;->call()Lio/agora/base/VideoFrame$I420Buffer;

    move-result-object p0

    return-object p0
.end method
