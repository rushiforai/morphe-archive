.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onPlayProgress(JJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$curPtsMS:J

.field final synthetic val$durationMS:J


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;->val$curPtsMS:J

    .line 4
    .line 5
    iput-wide p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;->val$durationMS:J

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloud$BGMNotify;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;->val$curPtsMS:J

    .line 10
    .line 11
    iget-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$126;->val$durationMS:J

    .line 12
    .line 13
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/tencent/trtc/TRTCCloud$BGMNotify;->onBGMProgress(JJ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
