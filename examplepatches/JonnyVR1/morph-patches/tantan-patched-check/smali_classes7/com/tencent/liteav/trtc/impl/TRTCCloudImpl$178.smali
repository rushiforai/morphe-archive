.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkRTCState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$localQuality:Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;

.field final synthetic val$remoteQualityArray:Ljava/util/ArrayList;

.field final synthetic val$statistics:Lcom/tencent/trtc/TRTCStatistics;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCStatistics;Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->val$statistics:Lcom/tencent/trtc/TRTCStatistics;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->val$localQuality:Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->val$remoteQualityArray:Ljava/util/ArrayList;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->val$statistics:Lcom/tencent/trtc/TRTCStatistics;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tencent/trtc/TRTCCloudListener;->onStatistics(Lcom/tencent/trtc/TRTCStatistics;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->val$localQuality:Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$178;->val$remoteQualityArray:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, v1, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onNetworkQuality(Lcom/tencent/trtc/TRTCCloudDef$TRTCQuality;Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
