.class Lcom/tencent/liteav/d$22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

.field final synthetic b:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field final synthetic c:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;[Lcom/tencent/liteav/renderer/TXCGLSurfaceView;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$22;->c:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/d$22;->a:[Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/d$22;->b:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/d$22;->a:[Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 2
    .line 3
    new-instance v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/d$22;->b:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v1, v2}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aput-object v1, v0, v2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/d$22;->b:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tencent/liteav/d$22;->a:[Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 20
    .line 21
    aget-object p0, p0, v2

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->addVideoView(Lcom/tencent/liteav/renderer/TXCGLSurfaceView;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
