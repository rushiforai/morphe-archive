.class Lio/agora/base/internal/video/TextureBufferPool$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TextureBufferPool;->dispose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/TextureBufferPool;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TextureBufferPool;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool$3;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$3;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lio/agora/base/internal/video/TextureBufferPool;->access$402(Lio/agora/base/internal/video/TextureBufferPool;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$3;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 8
    .line 9
    invoke-virtual {v0}, Lio/agora/base/internal/video/TextureBufferPool;->anyTextureInUse()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lio/agora/base/internal/video/TextureBufferPool;->access$200()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool$3;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 25
    .line 26
    invoke-static {v2}, Lio/agora/base/internal/video/TextureBufferPool;->access$500(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, " ready to release since no more buffer in flight"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool$3;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 46
    .line 47
    invoke-static {p0}, Lio/agora/base/internal/video/TextureBufferPool;->access$600(Lio/agora/base/internal/video/TextureBufferPool;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method
