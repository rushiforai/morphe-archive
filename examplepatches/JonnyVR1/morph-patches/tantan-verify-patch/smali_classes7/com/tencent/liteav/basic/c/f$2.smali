.class Lcom/tencent/liteav/basic/c/f$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/f;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/basic/c/f;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/f$2;->a:Lcom/tencent/liteav/basic/c/f;

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
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/f$2;->a:Lcom/tencent/liteav/basic/c/f;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/basic/c/f$2$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/tencent/liteav/basic/c/f$2$1;-><init>(Lcom/tencent/liteav/basic/c/f$2;)V

    .line 6
    .line 7
    .line 8
    const/16 p0, 0x67

    .line 9
    .line 10
    invoke-static {v0, p0, v1}, Lcom/tencent/liteav/basic/c/f;->a(Lcom/tencent/liteav/basic/c/f;ILjava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {p1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
