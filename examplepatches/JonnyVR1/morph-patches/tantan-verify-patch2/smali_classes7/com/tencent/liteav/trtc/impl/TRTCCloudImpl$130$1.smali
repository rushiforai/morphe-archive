.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isRoomExit()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 16
    .line 17
    const-string v1, "force onExitRoom after 2s"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getRoomExitCode()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {v1, v2, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->setRoomExit(ZI)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 45
    .line 46
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;

    .line 47
    .line 48
    invoke-direct {v2, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method
