.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteSubStreamView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$userId:Ljava/lang/String;

.field final synthetic val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "startRemoteSubStreamView user is not exist save view"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 45
    .line 46
    iput-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->addUserInfo(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 63
    .line 64
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v2, "startRemoteSubStreamView user view is the same, ignore "

    .line 77
    .line 78
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 95
    .line 96
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 97
    .line 98
    const/4 v3, 0x1

    .line 99
    const/4 v4, 0x0

    .line 100
    if-eqz v2, :cond_2

    .line 101
    .line 102
    move v2, v3

    .line 103
    goto :goto_0

    .line 104
    :cond_2
    move v2, v4

    .line 105
    :goto_0
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 106
    .line 107
    iput-object v5, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 108
    .line 109
    iget-wide v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->tinyID:J

    .line 110
    .line 111
    const-wide/16 v8, 0x0

    .line 112
    .line 113
    cmp-long v6, v6, v8

    .line 114
    .line 115
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 116
    .line 117
    if-nez v6, :cond_3

    .line 118
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v1, "startRemoteSubStreamView user tinyID is 0, ignore "

    .line 122
    .line 123
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v7, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v10, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 142
    .line 143
    invoke-virtual {v7, v6, v1, v5, v10}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRenderView(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 147
    .line 148
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 149
    .line 150
    iget-wide v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 151
    .line 152
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    const/4 v7, 0x7

    .line 157
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v10

    .line 161
    iget-object v11, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 162
    .line 163
    if-eqz v11, :cond_4

    .line 164
    .line 165
    invoke-virtual {v11}, Ljava/lang/Object;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v11

    .line 169
    goto :goto_1

    .line 170
    :cond_4
    move v11, v4

    .line 171
    :goto_1
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object v11

    .line 175
    filled-new-array {v5, v6, v10, v11}, [Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    const-string v6, "startRemoteSubStreamView userID:%s tinyID:%d streamType:%d view:%d"

    .line 180
    .line 181
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 194
    .line 195
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    const-string v6, "startRemoteSubStreamView userID:%s"

    .line 200
    .line 201
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v5, " self:"

    .line 209
    .line 210
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const-string v5, ""

    .line 227
    .line 228
    invoke-static {v3, v1, v5, v4}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 229
    .line 230
    .line 231
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 232
    .line 233
    iget-wide v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 234
    .line 235
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    new-instance v5, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    const-string v6, "Start watching "

    .line 242
    .line 243
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->val$userId:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v5

    .line 255
    invoke-static {v1, v3, v7, v4, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;)V

    .line 256
    .line 257
    .line 258
    iget-wide v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 259
    .line 260
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    const v3, 0x9c55

    .line 265
    .line 266
    .line 267
    invoke-static {v1, v3, v8, v9, v7}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 268
    .line 269
    .line 270
    if-eqz v2, :cond_5

    .line 271
    .line 272
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 273
    .line 274
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 275
    .line 276
    invoke-virtual {v1}, Lcom/tencent/liteav/TXCRenderAndDec;->isRendering()Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    if-nez v1, :cond_6

    .line 281
    .line 282
    :cond_5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 283
    .line 284
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 285
    .line 286
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 287
    .line 288
    invoke-static {v1, v2, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;I)V

    .line 289
    .line 290
    .line 291
    :cond_6
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->subRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 292
    .line 293
    iget-boolean v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 294
    .line 295
    if-nez v1, :cond_7

    .line 296
    .line 297
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$19;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 298
    .line 299
    iget-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 300
    .line 301
    iget-wide v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 302
    .line 303
    const/4 v7, 0x7

    .line 304
    const/4 v8, 0x1

    .line 305
    invoke-static/range {v2 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 306
    .line 307
    .line 308
    :cond_7
    return-void
.end method
