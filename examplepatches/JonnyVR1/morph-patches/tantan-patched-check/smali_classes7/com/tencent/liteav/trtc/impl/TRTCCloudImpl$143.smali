.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAudioQosChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$encBitrate:I

.field final synthetic val$encFrameLenMs:I

.field final synthetic val$fecRate:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;III)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->val$encFrameLenMs:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->val$encBitrate:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->val$fecRate:I

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
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->val$encFrameLenMs:I

    .line 6
    .line 7
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->val$encBitrate:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioEncoderParam(II)Z

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$143;->val$fecRate:I

    .line 17
    .line 18
    int-to-float p0, p0

    .line 19
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setEncoderFECPercent(F)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method
