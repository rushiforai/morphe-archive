.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteVideoStream(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$mute:Z

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

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
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 6
    .line 7
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "muteRemoteVideoStream "

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 18
    .line 19
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, " no exist."

    .line 30
    .line 31
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 42
    .line 43
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 50
    .line 51
    iget-boolean v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

    .line 52
    .line 53
    iput-boolean v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 54
    .line 55
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v2, v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->addUserInfo(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 66
    .line 67
    iget-boolean v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

    .line 68
    .line 69
    iput-boolean v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 70
    .line 71
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 72
    .line 73
    new-instance v4, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v2, ", mute:"

    .line 84
    .line 85
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

    .line 89
    .line 90
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v3, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance v2, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v3, "muteRemoteVideoStream userId:%s mute:%b self:"

    .line 103
    .line 104
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$userId:Ljava/lang/String;

    .line 121
    .line 122
    iget-boolean v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

    .line 123
    .line 124
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    const-string v3, ""

    .line 137
    .line 138
    const/4 v4, 0x0

    .line 139
    const/4 v5, 0x1

    .line 140
    invoke-static {v5, v2, v3, v4}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 141
    .line 142
    .line 143
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 144
    .line 145
    const-wide/16 v4, 0x0

    .line 146
    .line 147
    cmp-long v2, v2, v4

    .line 148
    .line 149
    if-nez v2, :cond_1

    .line 150
    .line 151
    return-void

    .line 152
    :cond_1
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 153
    .line 154
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 155
    .line 156
    if-eqz v2, :cond_2

    .line 157
    .line 158
    iget-boolean v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

    .line 159
    .line 160
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/TXCRenderAndDec;->muteVideo(Z)V

    .line 161
    .line 162
    .line 163
    :cond_2
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->val$mute:Z

    .line 164
    .line 165
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 166
    .line 167
    if-eqz v2, :cond_3

    .line 168
    .line 169
    iget-wide v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 170
    .line 171
    iget-wide v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 172
    .line 173
    const/4 v8, 0x2

    .line 174
    const/4 v9, 0x1

    .line 175
    invoke-static/range {v3 .. v9}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 176
    .line 177
    .line 178
    iget-object v10, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$32;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 179
    .line 180
    iget-wide v11, v10, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 181
    .line 182
    iget-wide v13, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 183
    .line 184
    const/4 v15, 0x3

    .line 185
    const/16 v16, 0x1

    .line 186
    .line 187
    invoke-static/range {v10 .. v16}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 188
    .line 189
    .line 190
    iget-wide v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 191
    .line 192
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    const-string v8, ""

    .line 197
    .line 198
    const/4 v9, 0x0

    .line 199
    const/16 v3, 0xfae

    .line 200
    .line 201
    const-wide/16 v4, 0x1

    .line 202
    .line 203
    const-wide/16 v6, -0x1

    .line 204
    .line 205
    invoke-static/range {v2 .. v9}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_3
    iget-wide v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 210
    .line 211
    iget-wide v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 212
    .line 213
    iget v8, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 214
    .line 215
    const/4 v9, 0x1

    .line 216
    invoke-static/range {v3 .. v9}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 217
    .line 218
    .line 219
    iget-wide v0, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 220
    .line 221
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    const-string v8, ""

    .line 226
    .line 227
    const/4 v9, 0x0

    .line 228
    const/16 v3, 0xfae

    .line 229
    .line 230
    const-wide/16 v4, 0x0

    .line 231
    .line 232
    const-wide/16 v6, -0x1

    .line 233
    .line 234
    invoke-static/range {v2 .. v9}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 235
    .line 236
    .line 237
    return-void
.end method
