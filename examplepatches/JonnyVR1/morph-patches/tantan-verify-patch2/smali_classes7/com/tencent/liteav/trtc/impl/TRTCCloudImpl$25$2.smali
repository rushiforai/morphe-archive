.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->val$screenShareParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$25;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCScreenShareParams;->floatingView:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
