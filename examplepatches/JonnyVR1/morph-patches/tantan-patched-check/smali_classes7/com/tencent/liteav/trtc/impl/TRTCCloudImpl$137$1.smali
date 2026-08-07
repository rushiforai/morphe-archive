.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

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
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 2
    .line 3
    iget v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    iget-wide v0, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$tinyID:J

    .line 9
    .line 10
    iget-wide v2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 11
    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "onRequestDownStream "

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-wide v1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, ", "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v2, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 44
    .line 45
    iget v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 58
    .line 59
    iget p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    if-ne p1, v0, :cond_0

    .line 63
    .line 64
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->getStreamType()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 75
    .line 76
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 77
    .line 78
    if-eq p1, v0, :cond_1

    .line 79
    .line 80
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->stopVideo()V

    .line 85
    .line 86
    .line 87
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 92
    .line 93
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/TXCRenderAndDec;->setStreamType(I)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/tencent/liteav/TXCRenderAndDec;->startVideo()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 109
    .line 110
    if-eqz p1, :cond_1

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->getStreamType()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 117
    .line 118
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 119
    .line 120
    if-eq p1, v0, :cond_1

    .line 121
    .line 122
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 123
    .line 124
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->stopVideo()V

    .line 127
    .line 128
    .line 129
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 132
    .line 133
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 134
    .line 135
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/TXCRenderAndDec;->setStreamType(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/tencent/liteav/TXCRenderAndDec;->startVideo()V

    .line 145
    .line 146
    .line 147
    iget-wide p1, p2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 148
    .line 149
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;

    .line 154
    .line 155
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$137;->val$stream:I

    .line 156
    .line 157
    const p2, 0x9c66

    .line 158
    .line 159
    .line 160
    const-wide/16 v0, 0x0

    .line 161
    .line 162
    invoke-static {p1, p2, v0, v1, p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 163
    .line 164
    .line 165
    :cond_1
    return-void
.end method
