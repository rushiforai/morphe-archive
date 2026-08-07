.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-static {p1, p2, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$23;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    invoke-static {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 21
    .line 22
    iget-object p0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 25
    .line 26
    return-void
.end method
