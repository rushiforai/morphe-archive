.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoStreamType(Ljava/lang/String;I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$type:I

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->val$type:I

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
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->val$userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->val$type:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-ne v1, v2, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    :goto_0
    move v7, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const/4 v1, 0x2

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 25
    .line 26
    if-ne v1, v7, :cond_2

    .line 27
    .line 28
    :goto_2
    return-void

    .line 29
    :cond_2
    iput v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "setRemoteVideoStreamType "

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->val$userId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v3, ", "

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-wide v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 57
    .line 58
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$49;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 69
    .line 70
    iget-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 71
    .line 72
    iget-wide v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 73
    .line 74
    const/4 v8, 0x0

    .line 75
    invoke-static/range {v2 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 76
    .line 77
    .line 78
    return-void
.end method
