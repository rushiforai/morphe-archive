.class Lio/agora/base/internal/video/TextureBufferPool$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TextureBufferPool;->deleteGlFenceIfNeeded(J)V
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
.field final synthetic this$0:Lio/agora/base/internal/video/TextureBufferPool;

.field final synthetic val$fenceSyncObject:J


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TextureBufferPool;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool$5;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    iput-wide p2, p0, Lio/agora/base/internal/video/TextureBufferPool$5;->val$fenceSyncObject:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
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
    invoke-virtual {p0}, Lio/agora/base/internal/video/TextureBufferPool$5;->call()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public call()Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/TextureBufferPool$5;->val$fenceSyncObject:J

    .line 2
    .line 3
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool$5;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 4
    .line 5
    invoke-static {p0}, Lio/agora/base/internal/video/TextureBufferPool;->access$500(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, v1, p0}, Lio/agora/base/internal/video/TextureBufferPool;->deleteFenceObject(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
