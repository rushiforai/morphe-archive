.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$eventCode:I

.field final synthetic val$eventParam:Landroid/os/Bundle;

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Landroid/os/Bundle;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

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
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 6
    .line 7
    const-string v3, "EVT_STREAM_TYPE"

    .line 8
    .line 9
    const/4 v4, 0x2

    .line 10
    invoke-virtual {v2, v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 15
    .line 16
    const-string v6, "EVT_MSG"

    .line 17
    .line 18
    const-string v7, ""

    .line 19
    .line 20
    invoke-virtual {v5, v6, v7}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    iget v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 25
    .line 26
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    const-string v7, "event %d, "

    .line 35
    .line 36
    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    invoke-static {v0, v1, v2, v5, v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 44
    .line 45
    const/16 v1, 0x7ed

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    if-ne v0, v1, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 51
    .line 52
    const-string v1, "release mic~"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isRoomExit()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 66
    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    const-string v0, "onExitRoom when mic release."

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getRoomExitCode()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 85
    .line 86
    invoke-virtual {v1, v2, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->setRoomExit(ZI)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 90
    .line 91
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$1;

    .line 92
    .line 93
    invoke-direct {v2, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    iget-object v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->micStart(Z)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    const/16 v1, 0x7eb

    .line 107
    .line 108
    if-ne v0, v1, :cond_2

    .line 109
    .line 110
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 111
    .line 112
    const-string v1, "onMicDidReady~"

    .line 113
    .line 114
    new-array v2, v2, [Ljava/lang/Object;

    .line 115
    .line 116
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 126
    .line 127
    const/4 v1, 0x1

    .line 128
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->micStart(Z)V

    .line 129
    .line 130
    .line 131
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 132
    .line 133
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 134
    .line 135
    invoke-virtual {v1, v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 144
    .line 145
    new-instance v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;

    .line 146
    .line 147
    invoke-direct {v2, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method
