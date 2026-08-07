.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioFrameListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

.field final synthetic val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setAudioFrameListener "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

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
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setPlayoutDataListener(Lcom/tencent/liteav/audio/e;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioCaptureDataListener(Lcom/tencent/liteav/audio/f;)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 44
    .line 45
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119$1;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setPlayoutDataListener(Lcom/tencent/liteav/audio/e;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioCaptureDataListener(Lcom/tencent/liteav/audio/f;)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 71
    .line 72
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119$2;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$119;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method
