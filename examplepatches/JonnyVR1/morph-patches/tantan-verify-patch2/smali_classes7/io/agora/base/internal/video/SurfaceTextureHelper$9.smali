.class Lio/agora/base/internal/video/SurfaceTextureHelper$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/SurfaceTextureHelper;->dispose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$502(Lio/agora/base/internal/video/SurfaceTextureHelper;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 8
    .line 9
    invoke-static {v0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$600(Lio/agora/base/internal/video/SurfaceTextureHelper;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 16
    .line 17
    invoke-static {v0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$700(Lio/agora/base/internal/video/SurfaceTextureHelper;)Lio/agora/base/internal/video/TextureBufferPool;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lio/agora/base/internal/video/TextureBufferPool;->anyTextureInUse()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 28
    .line 29
    invoke-static {p0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$800(Lio/agora/base/internal/video/SurfaceTextureHelper;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 39
    .line 40
    invoke-static {v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$1400(Lio/agora/base/internal/video/SurfaceTextureHelper;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, " not release yet, this: "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v1, " isOesTextureInUse: "

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$9;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 63
    .line 64
    invoke-static {p0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$600(Lio/agora/base/internal/video/SurfaceTextureHelper;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string v0, "SurfaceTextureHelper"

    .line 76
    .line 77
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
