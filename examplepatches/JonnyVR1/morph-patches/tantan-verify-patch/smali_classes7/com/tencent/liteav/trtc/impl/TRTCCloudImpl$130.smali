.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onExitRoom(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$err:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->val$err:I

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsExitOldRoom:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    iput-boolean p0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsExitOldRoom:Z

    .line 9
    .line 10
    const-string p0, "exit no current room, ignore onExitRoom."

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMicStard()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->val$err:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->setRoomExit(ZI)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    const-string v1, "onExitRoom delay 2s when mic is not release."

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 42
    .line 43
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;)V

    .line 46
    .line 47
    .line 48
    const/16 p0, 0x7d0

    .line 49
    .line 50
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/Runnable;I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$2;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
