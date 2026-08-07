.class Lcom/bytedance/realx/video/SurfaceTextureHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/realx/video/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;ZZZ)Lcom/bytedance/realx/video/SurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/bytedance/realx/video/SurfaceTextureHelper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$alignTimestamps:Z

.field final synthetic val$capture2DTexture:Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

.field final synthetic val$threadName:Ljava/lang/String;

.field final synthetic val$useAgfx:Z


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$handler:Landroid/os/Handler;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$alignTimestamps:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$capture2DTexture:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$useAgfx:Z

    .line 10
    .line 11
    iput-object p6, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public call()Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$handler:Landroid/os/Handler;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$alignTimestamps:Z

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$capture2DTexture:Z

    .line 10
    .line 11
    iget-boolean v5, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$useAgfx:Z

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/bytedance/realx/video/SurfaceTextureHelper;-><init>(Lcom/bytedance/realx/video/EglBase$Context;Landroid/os/Handler;ZZZLcom/bytedance/realx/video/SurfaceTextureHelper$1;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, " create failure"

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v1, "SurfaceTextureHelper"

    .line 39
    .line 40
    invoke-static {v1, p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 45
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper$1;->call()Lcom/bytedance/realx/video/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method
