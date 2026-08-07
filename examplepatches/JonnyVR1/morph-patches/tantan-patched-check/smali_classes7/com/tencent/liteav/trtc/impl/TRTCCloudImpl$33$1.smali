.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V
    .locals 8

    .line 1
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 4
    .line 5
    iget-boolean v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->val$mute:Z

    .line 6
    .line 7
    iput-boolean v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 8
    .line 9
    iget-object p1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "muteRemoteVideoStream "

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", mute "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 29
    .line 30
    iget-boolean v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->val$mute:Z

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 49
    .line 50
    iget-boolean v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->val$mute:Z

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/TXCRenderAndDec;->muteVideo(Z)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 56
    .line 57
    iget-boolean v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->val$mute:Z

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v1, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 62
    .line 63
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 64
    .line 65
    iget-wide v4, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 66
    .line 67
    const/4 v6, 0x2

    .line 68
    const/4 v7, 0x1

    .line 69
    invoke-static/range {v1 .. v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 75
    .line 76
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 77
    .line 78
    iget-wide v3, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 79
    .line 80
    const/4 v5, 0x3

    .line 81
    const/4 v6, 0x1

    .line 82
    invoke-static/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 86
    .line 87
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 88
    .line 89
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 90
    .line 91
    iget-wide v3, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 92
    .line 93
    const/4 v5, 0x7

    .line 94
    invoke-static/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 101
    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->isRendering()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 111
    .line 112
    iget-object v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 113
    .line 114
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 115
    .line 116
    iget-wide v3, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 117
    .line 118
    iget v5, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 119
    .line 120
    const/4 v6, 0x1

    .line 121
    invoke-static/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 122
    .line 123
    .line 124
    :cond_2
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 127
    .line 128
    if-eqz p1, :cond_3

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->isRendering()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_3

    .line 135
    .line 136
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;

    .line 137
    .line 138
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$33;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 139
    .line 140
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 141
    .line 142
    iget-wide v3, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 143
    .line 144
    const/4 v5, 0x7

    .line 145
    const/4 v6, 0x1

    .line 146
    invoke-static/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 147
    .line 148
    .line 149
    :cond_3
    return-void
.end method
