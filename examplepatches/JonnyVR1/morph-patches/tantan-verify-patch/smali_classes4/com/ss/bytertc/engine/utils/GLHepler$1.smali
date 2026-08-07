.class Lcom/ss/bytertc/engine/utils/GLHepler$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/GLHepler;->create(Ljava/lang/String;Landroid/opengl/EGLContext;)Lcom/ss/bytertc/engine/utils/GLHepler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/ss/bytertc/engine/utils/GLHepler;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$eglContext:Landroid/opengl/EGLContext;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$threadName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/opengl/EGLContext;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/GLHepler$1;->val$eglContext:Landroid/opengl/EGLContext;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/GLHepler$1;->val$handler:Landroid/os/Handler;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/GLHepler$1;->val$threadName:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()Lcom/ss/bytertc/engine/utils/GLHepler;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lcom/ss/bytertc/engine/utils/GLHepler;

    .line 3
    .line 4
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/GLHepler$1;->val$eglContext:Landroid/opengl/EGLContext;

    .line 5
    .line 6
    iget-object v3, p0, Lcom/ss/bytertc/engine/utils/GLHepler$1;->val$handler:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-direct {v1, v2, v3, v0}, Lcom/ss/bytertc/engine/utils/GLHepler;-><init>(Landroid/opengl/EGLContext;Landroid/os/Handler;Lcom/ss/bytertc/engine/utils/GLHepler$1;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-object v1

    .line 12
    :catch_0
    move-exception v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/GLHepler$1;->val$threadName:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, " create failure"

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v2, "TextureHelper"

    .line 33
    .line 34
    invoke-static {v2, p0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 38
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/GLHepler$1;->call()Lcom/ss/bytertc/engine/utils/GLHepler;

    move-result-object p0

    return-object p0
.end method
