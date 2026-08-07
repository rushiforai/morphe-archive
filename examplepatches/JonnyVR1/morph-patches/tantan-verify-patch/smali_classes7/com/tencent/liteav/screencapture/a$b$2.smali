.class Lcom/tencent/liteav/screencapture/a$b$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/screencapture/a$b;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/screencapture/a$b;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/screencapture/a$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a$b$2;->a:Lcom/tencent/liteav/screencapture/a$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a$b$2;->a:Lcom/tencent/liteav/screencapture/a$b;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/screencapture/a$b;->n:Lcom/tencent/liteav/screencapture/a;

    .line 4
    .line 5
    new-instance v1, Lcom/tencent/liteav/screencapture/a$b$2$1;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/tencent/liteav/screencapture/a$b$2$1;-><init>(Lcom/tencent/liteav/screencapture/a$b$2;)V

    .line 8
    .line 9
    .line 10
    const/16 p0, 0x68

    .line 11
    .line 12
    invoke-virtual {v0, p0, v1}, Lcom/tencent/liteav/screencapture/a;->a(ILjava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-virtual {p1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
