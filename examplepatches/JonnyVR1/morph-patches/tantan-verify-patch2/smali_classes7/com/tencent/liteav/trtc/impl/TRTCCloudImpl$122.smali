.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAudioPlayPcmData(Ljava/lang/String;[BJII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$channels:I

.field final synthetic val$data:[B

.field final synthetic val$id:Ljava/lang/String;

.field final synthetic val$sampleRate:I

.field final synthetic val$timestamp:J


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;[BJIILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$data:[B

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$timestamp:J

    .line 6
    .line 7
    iput p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$sampleRate:I

    .line 8
    .line 9
    iput p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$channels:I

    .line 10
    .line 11
    iput-object p7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$data:[B

    .line 13
    .line 14
    iput-object v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 15
    .line 16
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$timestamp:J

    .line 17
    .line 18
    iput-wide v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 19
    .line 20
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$sampleRate:I

    .line 21
    .line 22
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 23
    .line 24
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$channels:I

    .line 25
    .line 26
    iput v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 27
    .line 28
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->val$id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$122;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 41
    .line 42
    invoke-virtual {p0, v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserIdByTinyId(J)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {v0, v1, p0}, Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;->onRemoteUserAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception p0

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v1, "onPlayAudioFrame failed."

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v0, "TRTCCloudImpl"

    .line 70
    .line 71
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method
