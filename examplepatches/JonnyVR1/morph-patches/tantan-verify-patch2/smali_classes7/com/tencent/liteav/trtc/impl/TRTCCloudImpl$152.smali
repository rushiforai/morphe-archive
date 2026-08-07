.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onSpeedTest(Ljava/lang/String;IFFII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$downLoss:F

.field final synthetic val$finishedCount:I

.field final synthetic val$ip:Ljava/lang/String;

.field final synthetic val$rtt:I

.field final synthetic val$totalCount:I

.field final synthetic val$upLoss:F


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IFFII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$ip:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$rtt:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$upLoss:F

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$downLoss:F

    .line 10
    .line 11
    iput p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$finishedCount:I

    .line 12
    .line 13
    iput p7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$totalCount:I

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$ip:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->ip:Ljava/lang/String;

    .line 15
    .line 16
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$rtt:I

    .line 17
    .line 18
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->rtt:I

    .line 19
    .line 20
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$upLoss:F

    .line 21
    .line 22
    iput v3, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->upLostRate:F

    .line 23
    .line 24
    iget v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$downLoss:F

    .line 25
    .line 26
    iput v4, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->downLostRate:F

    .line 27
    .line 28
    cmpl-float v5, v3, v4

    .line 29
    .line 30
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 31
    .line 32
    const/high16 v7, 0x42c80000    # 100.0f

    .line 33
    .line 34
    if-ltz v5, :cond_0

    .line 35
    .line 36
    mul-float/2addr v3, v7

    .line 37
    float-to-int v3, v3

    .line 38
    invoke-virtual {v6, v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkQuality(II)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->quality:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    mul-float/2addr v4, v7

    .line 46
    float-to-int v3, v4

    .line 47
    invoke-virtual {v6, v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getNetworkQuality(II)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->quality:I

    .line 52
    .line 53
    :goto_0
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$finishedCount:I

    .line 54
    .line 55
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$totalCount:I

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/trtc/TRTCCloudListener;->onSpeedTest(Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;II)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 61
    .line 62
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$finishedCount:I

    .line 63
    .line 64
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$152;->val$totalCount:I

    .line 69
    .line 70
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCSpeedTestResult;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    filled-new-array {v2, p0, v1}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string v1, "SpeedTest progress %d/%d, result: %s"

    .line 83
    .line 84
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method
