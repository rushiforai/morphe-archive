.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onRecvVideoServerConfig(Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$videoConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->val$videoConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

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
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "onRecvVideoServerConfig "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->val$videoConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->val$videoConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->val$videoConfig:Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;->saveToSharedPreferences(Landroid/content/Context;Lcom/tencent/liteav/trtc/impl/TRTCVideoServerConfig;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 41
    .line 42
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165$1;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$165;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
