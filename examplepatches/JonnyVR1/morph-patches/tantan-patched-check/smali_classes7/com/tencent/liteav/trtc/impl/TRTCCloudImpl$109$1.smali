.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$1;
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

.field final synthetic val$localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$1;->val$localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$1;->val$localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$109;->val$margin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 6
    .line 7
    iget v1, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->leftMargin:F

    .line 8
    .line 9
    iget v2, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->rightMargin:F

    .line 10
    .line 11
    iget v3, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->topMargin:F

    .line 12
    .line 13
    iget p0, p0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->bottomMargin:F

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogMarginRatio(FFFF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
