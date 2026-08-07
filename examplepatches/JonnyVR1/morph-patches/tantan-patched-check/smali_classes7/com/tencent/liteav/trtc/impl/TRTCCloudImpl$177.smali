.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkRTCState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$remoteQualityArray:Ljava/util/ArrayList;

.field final synthetic val$statistics:Lcom/tencent/trtc/TRTCStatistics;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->val$statistics:Lcom/tencent/trtc/TRTCStatistics;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->val$remoteQualityArray:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 3

    .line 1
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->val$statistics:Lcom/tencent/trtc/TRTCStatistics;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->val$remoteQualityArray:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-static {v0, p1, p2, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$9200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->isRendering()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 29
    .line 30
    iget-object v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->val$statistics:Lcom/tencent/trtc/TRTCStatistics;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$177;->val$remoteQualityArray:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-static {p1, v0, p2, v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$9200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;Lcom/tencent/trtc/TRTCStatistics;Ljava/util/ArrayList;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method
