.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startSpeedTest(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$sdkAppId:I

.field final synthetic val$userId:Ljava/lang/String;

.field final synthetic val$userSig:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->val$sdkAppId:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->val$userId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->val$userSig:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    const-string v1, "startSpeedTest"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 9
    .line 10
    iget-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 11
    .line 12
    iget v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->val$sdkAppId:I

    .line 13
    .line 14
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->val$userId:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$110;->val$userSig:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static/range {v2 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JILjava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
