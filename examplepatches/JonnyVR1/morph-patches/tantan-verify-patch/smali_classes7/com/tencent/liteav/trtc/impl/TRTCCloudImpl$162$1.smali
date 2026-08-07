.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;

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
    .locals 0

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
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$162;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->getConfig()Lcom/tencent/liteav/h;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;Lcom/tencent/liteav/h;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
