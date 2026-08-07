.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;

.field final synthetic val$surfaceView:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;Landroid/view/SurfaceView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;->val$surfaceView:Landroid/view/SurfaceView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;->val$surfaceView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
