.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;

.field final synthetic val$localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$1;->val$localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$1;->val$localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;

    .line 4
    .line 5
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;->val$showType:I

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->showVideoDebugLog(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
