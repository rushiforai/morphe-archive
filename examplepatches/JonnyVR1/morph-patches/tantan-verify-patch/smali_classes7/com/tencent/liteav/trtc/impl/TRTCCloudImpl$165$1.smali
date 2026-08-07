.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;

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
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/TXCRenderAndDec;->enableLimitDecCache(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->enableHWVUI:Z

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/TXCRenderAndDec;->enableLimitDecCache(Z)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
