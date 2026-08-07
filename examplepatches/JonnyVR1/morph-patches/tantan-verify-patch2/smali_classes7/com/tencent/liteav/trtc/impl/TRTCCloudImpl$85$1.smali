.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-wide v0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 28
    .line 29
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->strTinyID:Ljava/lang/String;

    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;

    .line 36
    .line 37
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v1, 0x0

    .line 45
    :goto_0
    iget-object v2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 48
    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 52
    .line 53
    iget v3, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->pixelFormat:I

    .line 54
    .line 55
    invoke-static {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Lcom/tencent/liteav/basic/a/b;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v2, v1, v0}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 63
    .line 64
    iget-object p2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 65
    .line 66
    if-eqz p2, :cond_3

    .line 67
    .line 68
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 71
    .line 72
    iget p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->pixelFormat:I

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Lcom/tencent/liteav/basic/a/b;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p2, v1, p0}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method
