.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;->accept(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;

.field final synthetic val$remoteSubView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field final synthetic val$remoteView:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->val$remoteView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->val$remoteSubView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->val$remoteView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;

    .line 8
    .line 9
    iget v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;->val$showType:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->showVideoDebugLog(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->val$remoteSubView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;

    .line 21
    .line 22
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$108;->val$showType:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->showVideoDebugLog(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
