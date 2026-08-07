.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopLocalPreview()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "stopLocalPreview self:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    const-string v2, ""

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->CAMERA:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 40
    .line 41
    if-ne v0, v2, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 44
    .line 45
    sget-object v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 46
    .line 47
    invoke-static {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->c(Z)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->getSurfaceView()Landroid/view/SurfaceView;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 72
    .line 73
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;

    .line 74
    .line 75
    invoke-direct {v2, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;Landroid/view/SurfaceView;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 82
    .line 83
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 84
    .line 85
    const/4 v2, 0x0

    .line 86
    iput-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localView:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 87
    .line 88
    invoke-static {v0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2002(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$DisplayOrientationDetector;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 101
    .line 102
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_2

    .line 107
    .line 108
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$16;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 109
    .line 110
    invoke-virtual {p0, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableVideoStream(Z)V

    .line 111
    .line 112
    .line 113
    :cond_2
    const p0, 0x9c6e

    .line 114
    .line 115
    .line 116
    const/4 v0, 0x2

    .line 117
    invoke-static {p0, v3, v0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(III)V

    .line 118
    .line 119
    .line 120
    return-void
.end method
