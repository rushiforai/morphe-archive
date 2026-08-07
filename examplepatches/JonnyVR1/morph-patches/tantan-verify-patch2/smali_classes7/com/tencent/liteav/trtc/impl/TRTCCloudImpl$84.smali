.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setLocalVideoRenderListener(IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$bufferType:I

.field final synthetic val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

.field final synthetic val$pixelFormat:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$pixelFormat:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$bufferType:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$pixelFormat:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$bufferType:I

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "setLocalVideoRenderListener pixelFormat:%d bufferType:%d"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 29
    .line 30
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 31
    .line 32
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$pixelFormat:I

    .line 33
    .line 34
    iput v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localPixelFormat:I

    .line 35
    .line 36
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$bufferType:I

    .line 37
    .line 38
    iput v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localBufferType:I

    .line 39
    .line 40
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$84;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 41
    .line 42
    iput-object p0, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->localListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 43
    .line 44
    if-nez p0, :cond_0

    .line 45
    .line 46
    iget-object p0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    invoke-virtual {p0, v0, v2}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/o;I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object p0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 54
    .line 55
    invoke-virtual {p0, v0, v2}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/o;I)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
