.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAVMemberChange(JLjava/lang/String;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$oldState:I

.field final synthetic val$streamState:I

.field final synthetic val$tinyID:J

.field final synthetic val$userID:Ljava/lang/String;

.field final synthetic val$weakSelf:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;JLjava/lang/String;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$weakSelf:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$tinyID:J

    .line 6
    .line 7
    iput-object p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$userID:Ljava/lang/String;

    .line 8
    .line 9
    iput p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$oldState:I

    .line 10
    .line 11
    iput p7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$streamState:I

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
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-string p0, "ignore onAVMemberChange when out room"

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$weakSelf:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "onAVMemberChange "

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$tinyID:J

    .line 34
    .line 35
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v2, ", "

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$userID:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, ", old state:"

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$oldState:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v2, ", new state:"

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$streamState:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$userID:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iget v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$streamState:I

    .line 88
    .line 89
    iput v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamState:I

    .line 90
    .line 91
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 92
    .line 93
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$userID:Ljava/lang/String;

    .line 94
    .line 95
    iget-wide v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$tinyID:J

    .line 96
    .line 97
    iget v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$140;->val$oldState:I

    .line 98
    .line 99
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkUserState(Ljava/lang/String;JII)V

    .line 100
    .line 101
    .line 102
    :cond_2
    :goto_0
    return-void
.end method
