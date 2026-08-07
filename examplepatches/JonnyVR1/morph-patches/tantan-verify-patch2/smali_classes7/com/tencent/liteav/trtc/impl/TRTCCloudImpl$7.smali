.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->exitRoomInternal(ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$7;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

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
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$7;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteRender(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/liteav/audio/a;->a()Lcom/tencent/liteav/audio/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-wide v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$7;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p1, v0, p0}, Lcom/tencent/liteav/audio/a;->a(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    sget-object v0, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    sget-object p2, Lcom/tencent/liteav/basic/a/b;->a:Lcom/tencent/liteav/basic/a/b;

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method
