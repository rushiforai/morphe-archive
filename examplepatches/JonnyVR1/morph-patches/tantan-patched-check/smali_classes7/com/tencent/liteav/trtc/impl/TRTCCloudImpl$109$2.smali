.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

.field final synthetic val$remoteSubView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field final synthetic val$remoteView:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->val$remoteView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->val$remoteSubView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->val$remoteView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;->val$margin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 8
    .line 9
    iget v2, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->leftMargin:F

    .line 10
    .line 11
    iget v3, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->rightMargin:F

    .line 12
    .line 13
    iget v4, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->topMargin:F

    .line 14
    .line 15
    iget v1, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->bottomMargin:F

    .line 16
    .line 17
    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogMarginRatio(FFFF)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->val$remoteSubView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;->val$margin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 27
    .line 28
    iget v1, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->leftMargin:F

    .line 29
    .line 30
    iget v2, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->rightMargin:F

    .line 31
    .line 32
    iget v3, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->topMargin:F

    .line 33
    .line 34
    iget p0, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->bottomMargin:F

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogMarginRatio(FFFF)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
