.class Lio/agora/base/internal/video/EglRenderer$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/EglRenderer;->releaseEglSurface()V
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
.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

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

    .line 57
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglRenderer$10;->call()Ljava/lang/Void;

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
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    const-string v1, "detach egl context and release egl surface"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 9
    .line 10
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$100(Lio/agora/base/internal/video/EglRenderer;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 17
    .line 18
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 25
    .line 26
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->detachCurrent()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$102(Lio/agora/base/internal/video/EglRenderer;Z)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 40
    .line 41
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->releaseSurface()V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p0, p0, Lio/agora/base/internal/video/EglRenderer$10;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 49
    .line 50
    const-string v0, "releaseEglSurface in renderThread done."

    .line 51
    .line 52
    invoke-static {p0, v0}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method
