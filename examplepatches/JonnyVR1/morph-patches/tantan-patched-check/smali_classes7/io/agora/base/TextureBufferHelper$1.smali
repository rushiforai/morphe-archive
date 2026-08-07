.class final Lio/agora/base/TextureBufferHelper$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/TextureBufferHelper;->create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/TextureBufferHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/TextureBufferHelper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

.field final synthetic val$threadName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lio/agora/base/TextureBufferHelper$1;->val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    iput-object p2, p0, Lio/agora/base/TextureBufferHelper$1;->val$handler:Landroid/os/Handler;

    iput-object p3, p0, Lio/agora/base/TextureBufferHelper$1;->val$threadName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/TextureBufferHelper;
    .locals 4

    .line 1
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lio/agora/base/TextureBufferHelper;

    iget-object v2, p0, Lio/agora/base/TextureBufferHelper$1;->val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    iget-object v3, p0, Lio/agora/base/TextureBufferHelper$1;->val$handler:Landroid/os/Handler;

    invoke-direct {v1, v2, v3, v0}, Lio/agora/base/TextureBufferHelper;-><init>(Lio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;Lio/agora/base/TextureBufferHelper$1;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lio/agora/base/TextureBufferHelper$1;->val$threadName:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " create failure"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "TextureBufferHelper"

    invoke-static {v2, p0, v1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2
    invoke-virtual {p0}, Lio/agora/base/TextureBufferHelper$1;->call()Lio/agora/base/TextureBufferHelper;

    move-result-object p0

    return-object p0
.end method
