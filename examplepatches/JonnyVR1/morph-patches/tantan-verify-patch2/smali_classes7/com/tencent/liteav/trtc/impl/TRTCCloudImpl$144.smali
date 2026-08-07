.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$bitrate:I

.field final synthetic val$fps:I

.field final synthetic val$height:I

.field final synthetic val$rpsNearestMode:I

.field final synthetic val$streamType:I

.field final synthetic val$totalBitrate:I

.field final synthetic val$width:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$streamType:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$width:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$height:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$fps:I

    .line 10
    .line 11
    iput p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$bitrate:I

    .line 12
    .line 13
    iput p7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$totalBitrate:I

    .line 14
    .line 15
    iput p8, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$rpsNearestMode:I

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 4
    .line 5
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$streamType:I

    .line 6
    .line 7
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$width:I

    .line 8
    .line 9
    iget v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$height:I

    .line 10
    .line 11
    iget v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$fps:I

    .line 12
    .line 13
    iget v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$bitrate:I

    .line 14
    .line 15
    iget v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$totalBitrate:I

    .line 16
    .line 17
    iget v8, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$rpsNearestMode:I

    .line 18
    .line 19
    invoke-virtual/range {v1 .. v8}, Lcom/tencent/liteav/d;->a(IIIIIII)V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$streamType:I

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$width:I

    .line 28
    .line 29
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->val$height:I

    .line 30
    .line 31
    if-le v0, v1, :cond_0

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v2, 0x1

    .line 36
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$144;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 39
    .line 40
    iget v4, v3, Lcom/tencent/liteav/g;->l:I

    .line 41
    .line 42
    if-eq v4, v2, :cond_1

    .line 43
    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    iput v2, v3, Lcom/tencent/liteav/g;->l:I

    .line 47
    .line 48
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method
