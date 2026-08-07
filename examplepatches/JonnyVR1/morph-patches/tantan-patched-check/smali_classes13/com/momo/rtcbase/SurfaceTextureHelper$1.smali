.class Lcom/momo/rtcbase/SurfaceTextureHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/momo/rtcbase/EglBase$Context;Z)Lcom/momo/rtcbase/SurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/momo/rtcbase/SurfaceTextureHelper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$alignTimestamps:Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$sharedContext:Lcom/momo/rtcbase/EglBase$Context;

.field final synthetic val$threadName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;Landroid/os/Handler;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$handler:Landroid/os/Handler;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$alignTimestamps:Z

    .line 6
    .line 7
    iput-object p4, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public call()Lcom/momo/rtcbase/SurfaceTextureHelper;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 3
    .line 4
    iget-object v2, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 5
    .line 6
    iget-object v3, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$handler:Landroid/os/Handler;

    .line 7
    .line 8
    iget-boolean v4, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$alignTimestamps:Z

    .line 9
    .line 10
    invoke-direct {v1, v2, v3, v4, v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;-><init>(Lcom/momo/rtcbase/EglBase$Context;Landroid/os/Handler;ZLcom/momo/rtcbase/SurfaceTextureHelper$1;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-object v1

    .line 14
    :catch_0
    move-exception v1

    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->val$threadName:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, " create failure"

    .line 26
    .line 27
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v2, "SurfaceTextureHelper"

    .line 35
    .line 36
    invoke-static {v2, p0, v1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Lcom/momo/rtcbase/SurfaceTextureHelper$1;->call()Lcom/momo/rtcbase/SurfaceTextureHelper;

    move-result-object p0

    return-object p0
.end method
