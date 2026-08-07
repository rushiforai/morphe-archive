.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioVolumeEvaluation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$intervalMs:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;->val$intervalMs:I

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
    .locals 5

    .line 1
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;->val$intervalMs:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    const/16 v2, 0x64

    .line 7
    .line 8
    if-ge v0, v2, :cond_1

    .line 9
    .line 10
    move v0, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v1

    .line 13
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 14
    .line 15
    iget v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 16
    .line 17
    if-ne v0, v3, :cond_2

    .line 18
    .line 19
    return-void

    .line 20
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v4, "enableAudioVolumeEvaluation "

    .line 23
    .line 24
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$64;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 38
    .line 39
    iput v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioVolumeEvalInterval:I

    .line 40
    .line 41
    if-lez v0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startVolumeLevelCal(Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startVolumeLevelCal(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
