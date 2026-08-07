.class Lio/agora/base/internal/video/VideoFrameSenderExImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoFrameSenderExImpl;->reconstructTextureBuffer(Lio/agora/base/VideoFrame$Buffer;)Lio/agora/base/VideoFrame$Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/VideoFrameSenderExImpl;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoFrameSenderExImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/VideoFrameSenderExImpl$1;->this$0:Lio/agora/base/internal/video/VideoFrameSenderExImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 14
    invoke-virtual {p0}, Lio/agora/base/internal/video/VideoFrameSenderExImpl$1;->call()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public call()Ljava/lang/Void;
    .locals 2

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoFrameSenderExImpl$1;->this$0:Lio/agora/base/internal/video/VideoFrameSenderExImpl;

    .line 2
    .line 3
    invoke-static {p0}, Lio/agora/base/internal/video/VideoFrameSenderExImpl;->access$000(Lio/agora/base/internal/video/VideoFrameSenderExImpl;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-string p0, "VideoFrameSenderExImpl"

    .line 8
    .line 9
    invoke-static {v0, v1, p0}, Lio/agora/base/internal/video/TextureBufferPool;->deleteFenceObject(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
