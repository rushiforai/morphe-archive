.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setNetworkQosParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "setNetworkQosParam"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;

    .line 15
    .line 16
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;->preference:I

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->val$param:Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;

    .line 24
    .line 25
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;->controlMode:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$202(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$35;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    const-string p0, "setNetworkQosParam param is null"

    .line 47
    .line 48
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
