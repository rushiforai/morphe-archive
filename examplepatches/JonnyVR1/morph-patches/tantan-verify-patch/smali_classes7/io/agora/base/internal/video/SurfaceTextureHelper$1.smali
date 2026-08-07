.class Lio/agora/base/internal/video/SurfaceTextureHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/SurfaceTextureHelper;->create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;II)Lio/agora/base/internal/video/SurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/internal/video/SurfaceTextureHelper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$maxBufCount:I

.field final synthetic val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

.field final synthetic val$threadName:Ljava/lang/String;

.field final synthetic val$transfer:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$handler:Landroid/os/Handler;

    .line 6
    .line 7
    iput p4, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$maxBufCount:I

    .line 8
    .line 9
    iput p5, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$transfer:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/internal/video/SurfaceTextureHelper;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 6
    .line 7
    iget-object v3, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$handler:Landroid/os/Handler;

    .line 8
    .line 9
    iget v4, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$maxBufCount:I

    .line 10
    .line 11
    iget v5, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$transfer:I

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    invoke-direct/range {v0 .. v6}, Lio/agora/base/internal/video/SurfaceTextureHelper;-><init>(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;Landroid/os/Handler;IILio/agora/base/internal/video/SurfaceTextureHelper$1;)V
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
    iget-object p0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

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
    invoke-static {v1, p0, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

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
    invoke-virtual {p0}, Lio/agora/base/internal/video/SurfaceTextureHelper$1;->call()Lio/agora/base/internal/video/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method
