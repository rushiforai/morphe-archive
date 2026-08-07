.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAVMemberEnter(JLjava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$terminalType:I

.field final synthetic val$tinyID:J

.field final synthetic val$userID:Ljava/lang/String;

.field final synthetic val$videoState:I

.field final synthetic val$weakSelf:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/ref/WeakReference;Ljava/lang/String;JII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$weakSelf:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 8
    .line 9
    iput p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$terminalType:I

    .line 10
    .line 11
    iput p7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

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
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    iget v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const-string v0, "ignore onAVMemberEnter when out room."

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$weakSelf:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 29
    .line 30
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 39
    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v4, " user "

    .line 43
    .line 44
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v4, "enter room when user is in room "

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-wide v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 58
    .line 59
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-wide v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 70
    .line 71
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 78
    .line 79
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    :cond_3
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 90
    .line 91
    invoke-virtual {v3, v2, v4}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setRemoteAudioStreamEventListener(Ljava/lang/String;Lcom/tencent/liteav/audio/d;)V

    .line 92
    .line 93
    .line 94
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 95
    .line 96
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 97
    .line 98
    if-eqz v3, :cond_4

    .line 99
    .line 100
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 105
    .line 106
    invoke-virtual {v3, v2, v4}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setSetAudioEngineRemoteStreamDataListener(Ljava/lang/String;Lcom/tencent/liteav/audio/e;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    invoke-static {}, Lcom/tencent/liteav/audio/a;->a()Lcom/tencent/liteav/audio/a;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 114
    .line 115
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    const/4 v5, 0x1

    .line 120
    invoke-virtual {v3, v2, v5, v4}, Lcom/tencent/liteav/audio/a;->a(Ljava/lang/String;ZI)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    iget-object v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 128
    .line 129
    iget-boolean v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteAudio:Z

    .line 130
    .line 131
    invoke-virtual {v3, v2, v4}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteRemoteAudio(Ljava/lang/String;Z)V

    .line 132
    .line 133
    .line 134
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    iget-boolean v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->muteAudioInSpeaker:Z

    .line 139
    .line 140
    invoke-virtual {v3, v2, v4}, Lcom/tencent/liteav/audio/TXCAudioEngine;->muteRemoteAudioInSpeaker(Ljava/lang/String;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 144
    .line 145
    iget-boolean v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteAudio:Z

    .line 146
    .line 147
    if-eqz v3, :cond_5

    .line 148
    .line 149
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 150
    .line 151
    iget-wide v7, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 152
    .line 153
    iget-wide v9, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 154
    .line 155
    const/4 v11, 0x1

    .line 156
    const/4 v12, 0x1

    .line 157
    invoke-static/range {v6 .. v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 158
    .line 159
    .line 160
    :cond_5
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 161
    .line 162
    iget-wide v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 163
    .line 164
    iget v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPriorStreamType:I

    .line 165
    .line 166
    invoke-static {v3, v6, v7, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JI)Lcom/tencent/liteav/TXCRenderAndDec;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 171
    .line 172
    iget-object v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRenderListenerMap:Ljava/util/HashMap;

    .line 173
    .line 174
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 175
    .line 176
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    check-cast v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;

    .line 181
    .line 182
    if-eqz v4, :cond_6

    .line 183
    .line 184
    iput-object v2, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->strTinyID:Ljava/lang/String;

    .line 185
    .line 186
    iget-object v2, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;

    .line 187
    .line 188
    if-eqz v2, :cond_6

    .line 189
    .line 190
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 191
    .line 192
    iget v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$RenderListenerAdapter;->pixelFormat:I

    .line 193
    .line 194
    invoke-static {v2, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)Lcom/tencent/liteav/basic/a/b;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    invoke-virtual {v3, v2, v4}, Lcom/tencent/liteav/TXCRenderAndDec;->setVideoFrameListener(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;)V

    .line 199
    .line 200
    .line 201
    :cond_6
    iget-wide v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 202
    .line 203
    iput-wide v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 204
    .line 205
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 206
    .line 207
    iput-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->userID:Ljava/lang/String;

    .line 208
    .line 209
    iget v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$terminalType:I

    .line 210
    .line 211
    iput v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->terminalType:I

    .line 212
    .line 213
    iget v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 214
    .line 215
    iput v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamState:I

    .line 216
    .line 217
    iget-object v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 218
    .line 219
    iput-object v3, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 220
    .line 221
    iput-wide v6, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->tinyID:J

    .line 222
    .line 223
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 224
    .line 225
    iget v6, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPriorStreamType:I

    .line 226
    .line 227
    iput v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 228
    .line 229
    iget-object v6, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 230
    .line 231
    const-wide/16 v7, 0x0

    .line 232
    .line 233
    const v9, 0x9c55

    .line 234
    .line 235
    .line 236
    const-string v10, "Start watching "

    .line 237
    .line 238
    const/4 v11, 0x0

    .line 239
    if-eqz v6, :cond_8

    .line 240
    .line 241
    iget-object v12, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 242
    .line 243
    invoke-virtual {v3, v2, v4, v6, v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRenderView(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 244
    .line 245
    .line 246
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 247
    .line 248
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 249
    .line 250
    iget-wide v12, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 251
    .line 252
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    iget v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 257
    .line 258
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    filled-new-array {v3, v4, v6}, [Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    const-string v4, "startRemoteView when user enter userID:%s tinyID:%d streamType:%d"

    .line 267
    .line 268
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 276
    .line 277
    iget-wide v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 278
    .line 279
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    iget v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 284
    .line 285
    new-instance v6, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    invoke-direct {v6, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v6

    .line 299
    invoke-static {v2, v3, v4, v11, v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 303
    .line 304
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 305
    .line 306
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 307
    .line 308
    iget v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 309
    .line 310
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;I)V

    .line 311
    .line 312
    .line 313
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 314
    .line 315
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    iget v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 320
    .line 321
    invoke-static {v2, v9, v7, v8, v3}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 322
    .line 323
    .line 324
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 325
    .line 326
    iget-boolean v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 327
    .line 328
    iget-object v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 329
    .line 330
    if-nez v2, :cond_7

    .line 331
    .line 332
    iget-wide v13, v12, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 333
    .line 334
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 335
    .line 336
    iget v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 337
    .line 338
    const/16 v18, 0x1

    .line 339
    .line 340
    move-wide v15, v2

    .line 341
    move/from16 v17, v4

    .line 342
    .line 343
    invoke-static/range {v12 .. v18}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 344
    .line 345
    .line 346
    goto :goto_0

    .line 347
    :cond_7
    iget-wide v13, v12, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 348
    .line 349
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 350
    .line 351
    iget v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 352
    .line 353
    const/16 v18, 0x1

    .line 354
    .line 355
    move-wide v15, v2

    .line 356
    move/from16 v17, v4

    .line 357
    .line 358
    invoke-static/range {v12 .. v18}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 359
    .line 360
    .line 361
    :cond_8
    :goto_0
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 362
    .line 363
    iget-wide v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 364
    .line 365
    const/4 v6, 0x7

    .line 366
    invoke-static {v2, v3, v4, v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JI)Lcom/tencent/liteav/TXCRenderAndDec;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 371
    .line 372
    iput-object v2, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 373
    .line 374
    iget-wide v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 375
    .line 376
    iput-wide v12, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->tinyID:J

    .line 377
    .line 378
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 379
    .line 380
    iget-object v4, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 381
    .line 382
    iget-boolean v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->muteRemoteVideo:Z

    .line 383
    .line 384
    iput-boolean v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 385
    .line 386
    iget-object v4, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 387
    .line 388
    if-eqz v4, :cond_9

    .line 389
    .line 390
    iget-object v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 391
    .line 392
    iget-object v13, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 393
    .line 394
    invoke-virtual {v2, v12, v3, v4, v13}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRenderView(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 395
    .line 396
    .line 397
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 398
    .line 399
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 400
    .line 401
    iget-wide v12, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 402
    .line 403
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 404
    .line 405
    .line 406
    move-result-object v4

    .line 407
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 408
    .line 409
    .line 410
    move-result-object v12

    .line 411
    filled-new-array {v3, v4, v12}, [Ljava/lang/Object;

    .line 412
    .line 413
    .line 414
    move-result-object v3

    .line 415
    const-string v4, "onUserScreenAvailable when user enter userID:%s tinyID:%d streamType:%d"

    .line 416
    .line 417
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v3

    .line 421
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    new-instance v2, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 427
    .line 428
    .line 429
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 430
    .line 431
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    const-string v4, "startRemoteSubStreamView userID:%s"

    .line 436
    .line 437
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    const-string v3, " self:"

    .line 445
    .line 446
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 450
    .line 451
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 452
    .line 453
    .line 454
    move-result v3

    .line 455
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v2

    .line 462
    const-string v3, ""

    .line 463
    .line 464
    invoke-static {v5, v2, v3, v11}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 465
    .line 466
    .line 467
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 468
    .line 469
    iget-wide v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 470
    .line 471
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v3

    .line 475
    new-instance v4, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    invoke-direct {v4, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    iget-object v10, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 481
    .line 482
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object v4

    .line 489
    invoke-static {v2, v3, v6, v11, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;)V

    .line 490
    .line 491
    .line 492
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 493
    .line 494
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 495
    .line 496
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 497
    .line 498
    invoke-static {v2, v3, v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;I)V

    .line 499
    .line 500
    .line 501
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 502
    .line 503
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    invoke-static {v2, v9, v7, v8, v6}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 508
    .line 509
    .line 510
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 511
    .line 512
    iget-boolean v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 513
    .line 514
    if-nez v2, :cond_9

    .line 515
    .line 516
    iget-object v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 517
    .line 518
    iget-wide v13, v12, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 519
    .line 520
    iget-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 521
    .line 522
    const/16 v17, 0x7

    .line 523
    .line 524
    const/16 v18, 0x1

    .line 525
    .line 526
    move-wide v15, v2

    .line 527
    invoke-static/range {v12 .. v18}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 528
    .line 529
    .line 530
    :cond_9
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 531
    .line 532
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 533
    .line 534
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 535
    .line 536
    invoke-virtual {v2, v3, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->addUserInfo(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 537
    .line 538
    .line 539
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 540
    .line 541
    new-instance v2, Ljava/lang/StringBuilder;

    .line 542
    .line 543
    const-string v3, "onAVMemberEnter "

    .line 544
    .line 545
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    iget-wide v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 549
    .line 550
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    const-string v3, ", "

    .line 554
    .line 555
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 556
    .line 557
    .line 558
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 559
    .line 560
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    iget v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 567
    .line 568
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object v2

    .line 575
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 576
    .line 577
    .line 578
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 579
    .line 580
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 581
    .line 582
    new-instance v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;

    .line 583
    .line 584
    invoke-direct {v3, v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;Lcom/tencent/trtc/TRTCCloudListener;)V

    .line 585
    .line 586
    .line 587
    invoke-virtual {v1, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 588
    .line 589
    .line 590
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 591
    .line 592
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasAudio(I)Z

    .line 593
    .line 594
    .line 595
    move-result v1

    .line 596
    if-eqz v1, :cond_a

    .line 597
    .line 598
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 599
    .line 600
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 601
    .line 602
    .line 603
    move-result v1

    .line 604
    if-nez v1, :cond_a

    .line 605
    .line 606
    move v1, v5

    .line 607
    goto :goto_1

    .line 608
    :cond_a
    move v1, v11

    .line 609
    :goto_1
    if-eqz v1, :cond_b

    .line 610
    .line 611
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 612
    .line 613
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;

    .line 614
    .line 615
    invoke-direct {v4, v0, v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;Lcom/tencent/trtc/TRTCCloudListener;Z)V

    .line 616
    .line 617
    .line 618
    invoke-virtual {v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 619
    .line 620
    .line 621
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 622
    .line 623
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 624
    .line 625
    invoke-virtual {v3}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 626
    .line 627
    .line 628
    move-result-object v3

    .line 629
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 630
    .line 631
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 632
    .line 633
    .line 634
    move-result-object v4

    .line 635
    const-string v6, "[%s]audio Available[true]"

    .line 636
    .line 637
    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 638
    .line 639
    .line 640
    move-result-object v4

    .line 641
    invoke-static {v1, v3, v11, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 642
    .line 643
    .line 644
    :cond_b
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 645
    .line 646
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasMainVideo(I)Z

    .line 647
    .line 648
    .line 649
    move-result v1

    .line 650
    if-nez v1, :cond_c

    .line 651
    .line 652
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 653
    .line 654
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSmallVideo(I)Z

    .line 655
    .line 656
    .line 657
    move-result v1

    .line 658
    if-eqz v1, :cond_d

    .line 659
    .line 660
    :cond_c
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 661
    .line 662
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 663
    .line 664
    .line 665
    move-result v1

    .line 666
    if-nez v1, :cond_d

    .line 667
    .line 668
    move v1, v5

    .line 669
    goto :goto_2

    .line 670
    :cond_d
    move v1, v11

    .line 671
    :goto_2
    if-eqz v1, :cond_e

    .line 672
    .line 673
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 674
    .line 675
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 676
    .line 677
    iget-wide v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 678
    .line 679
    invoke-virtual {v3, v6, v7}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasRecvFirstIFrame(J)Z

    .line 680
    .line 681
    .line 682
    move-result v3

    .line 683
    if-eqz v3, :cond_e

    .line 684
    .line 685
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 686
    .line 687
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;

    .line 688
    .line 689
    invoke-direct {v4, v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;ZLcom/tencent/trtc/TRTCCloudListener;)V

    .line 690
    .line 691
    .line 692
    invoke-virtual {v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 693
    .line 694
    .line 695
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 696
    .line 697
    iget-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 698
    .line 699
    invoke-virtual {v3}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v3

    .line 703
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 704
    .line 705
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 706
    .line 707
    .line 708
    move-result-object v4

    .line 709
    const-string v6, "[%s]video Available[true]"

    .line 710
    .line 711
    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 712
    .line 713
    .line 714
    move-result-object v4

    .line 715
    invoke-static {v1, v3, v11, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 716
    .line 717
    .line 718
    :cond_e
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 719
    .line 720
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->hasSubVideo(I)Z

    .line 721
    .line 722
    .line 723
    move-result v1

    .line 724
    if-eqz v1, :cond_f

    .line 725
    .line 726
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$videoState:I

    .line 727
    .line 728
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteSubVideo(I)Z

    .line 729
    .line 730
    .line 731
    move-result v1

    .line 732
    if-nez v1, :cond_f

    .line 733
    .line 734
    goto :goto_3

    .line 735
    :cond_f
    move v5, v11

    .line 736
    :goto_3
    if-eqz v5, :cond_10

    .line 737
    .line 738
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 739
    .line 740
    new-instance v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$4;

    .line 741
    .line 742
    invoke-direct {v3, v0, v2, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$4;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;Lcom/tencent/trtc/TRTCCloudListener;Z)V

    .line 743
    .line 744
    .line 745
    invoke-virtual {v1, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 746
    .line 747
    .line 748
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 749
    .line 750
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 751
    .line 752
    invoke-virtual {v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 753
    .line 754
    .line 755
    move-result-object v2

    .line 756
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 757
    .line 758
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 759
    .line 760
    .line 761
    move-result-object v3

    .line 762
    const-string v4, "[%s]subvideo Available[true]"

    .line 763
    .line 764
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 765
    .line 766
    .line 767
    move-result-object v3

    .line 768
    invoke-static {v1, v2, v11, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 769
    .line 770
    .line 771
    :cond_10
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 772
    .line 773
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 774
    .line 775
    invoke-virtual {v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 776
    .line 777
    .line 778
    move-result-object v2

    .line 779
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 780
    .line 781
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 782
    .line 783
    .line 784
    move-result-object v0

    .line 785
    const-string v3, "[%s]enter room"

    .line 786
    .line 787
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 788
    .line 789
    .line 790
    move-result-object v0

    .line 791
    invoke-static {v1, v2, v11, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 792
    .line 793
    .line 794
    return-void
.end method
