.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
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

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$pixelFormat:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$bufferType:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$pixelFormat:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$bufferType:I

    .line 12
    .line 13
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "setRemoteVideoRenderListener userid:%s pixelFormat:%d bufferType:%d"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$userId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;-><init>()V

    .line 47
    .line 48
    .line 49
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$bufferType:I

    .line 50
    .line 51
    iput v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->bufferType:I

    .line 52
    .line 53
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$pixelFormat:I

    .line 54
    .line 55
    iput v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->pixelFormat:I

    .line 56
    .line 57
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->val$userId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 71
    .line 72
    const/4 v1, 0x1

    .line 73
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6302(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)Z

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 79
    .line 80
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$85;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->forEachUser(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
