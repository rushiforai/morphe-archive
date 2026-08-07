.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;

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
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;

    .line 8
    .line 9
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;->val$videoBlockThreshold:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/TXCRenderAndDec;->setBlockInterval(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;

    .line 21
    .line 22
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$146;->val$videoBlockThreshold:I

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/TXCRenderAndDec;->setBlockInterval(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
