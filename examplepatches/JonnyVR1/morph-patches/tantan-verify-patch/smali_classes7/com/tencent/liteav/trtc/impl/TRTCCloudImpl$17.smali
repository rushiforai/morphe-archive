.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
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
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

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
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    const-string v2, " self:"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/4 v4, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 20
    .line 21
    new-instance v5, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v6, "startRemoteView user is not exist save view"

    .line 24
    .line 25
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v0, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 41
    .line 42
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 49
    .line 50
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 51
    .line 52
    iput-object v6, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 53
    .line 54
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 55
    .line 56
    iget-object v5, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 57
    .line 58
    iget-object v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v5, v6, v0}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->addUserInfo(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 69
    .line 70
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    const-string v6, "Remote-startRemoteView userID:%s (save view before user enter)"

    .line 75
    .line 76
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {v3, p0, v1, v4}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_0
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 104
    .line 105
    if-eqz v5, :cond_1

    .line 106
    .line 107
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 108
    .line 109
    iget-object v6, v6, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 110
    .line 111
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-eqz v5, :cond_1

    .line 116
    .line 117
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 118
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v2, "startRemoteView user view is the same, ignore "

    .line 122
    .line 123
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_1
    iget-object v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 140
    .line 141
    iget-object v6, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 142
    .line 143
    if-eqz v6, :cond_2

    .line 144
    .line 145
    move v6, v3

    .line 146
    goto :goto_0

    .line 147
    :cond_2
    move v6, v4

    .line 148
    :goto_0
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 149
    .line 150
    iput-object v7, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 151
    .line 152
    iget-wide v8, v5, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->tinyID:J

    .line 153
    .line 154
    const-wide/16 v10, 0x0

    .line 155
    .line 156
    cmp-long v8, v8, v10

    .line 157
    .line 158
    iget-object v9, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 159
    .line 160
    if-nez v8, :cond_3

    .line 161
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string v1, "startRemoteView user tinyID is 0, ignore "

    .line 165
    .line 166
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {v9, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_3
    iget-object v8, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 185
    .line 186
    invoke-virtual {v9, v8, v5, v7, v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRenderView(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V

    .line 187
    .line 188
    .line 189
    new-instance v5, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 195
    .line 196
    iget-wide v8, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 197
    .line 198
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    iget v9, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 203
    .line 204
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    iget-object v12, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 209
    .line 210
    if-eqz v12, :cond_4

    .line 211
    .line 212
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 213
    .line 214
    .line 215
    move-result v12

    .line 216
    goto :goto_1

    .line 217
    :cond_4
    move v12, v4

    .line 218
    :goto_1
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 219
    .line 220
    .line 221
    move-result-object v12

    .line 222
    filled-new-array {v7, v8, v9, v12}, [Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    const-string v8, "Remote-startRemoteView userID:%s tinyID:%d streamType:%d view:%d"

    .line 227
    .line 228
    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 239
    .line 240
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 252
    .line 253
    invoke-virtual {v5, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-static {v3, v2, v1, v4}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 257
    .line 258
    .line 259
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 260
    .line 261
    iget-wide v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 262
    .line 263
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    iget v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 268
    .line 269
    new-instance v5, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    const-string v7, "Start watching "

    .line 272
    .line 273
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->val$userId:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-static {v1, v2, v3, v4, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;IILjava/lang/String;)V

    .line 286
    .line 287
    .line 288
    if-eqz v6, :cond_5

    .line 289
    .line 290
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 291
    .line 292
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 293
    .line 294
    invoke-virtual {v1}, Lcom/tencent/liteav/TXCRenderAndDec;->isRendering()Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-nez v1, :cond_6

    .line 299
    .line 300
    :cond_5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 301
    .line 302
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 303
    .line 304
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->render:Lcom/tencent/liteav/TXCRenderAndDec;

    .line 305
    .line 306
    iget v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 307
    .line 308
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/liteav/TXCRenderAndDec;I)V

    .line 309
    .line 310
    .line 311
    :cond_6
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 312
    .line 313
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    const v2, 0x9c55

    .line 318
    .line 319
    .line 320
    iget v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 321
    .line 322
    invoke-static {v1, v2, v10, v11, v3}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 323
    .line 324
    .line 325
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 326
    .line 327
    iget-boolean v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;->muteVideo:Z

    .line 328
    .line 329
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$17;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 330
    .line 331
    if-nez v1, :cond_7

    .line 332
    .line 333
    iget-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 334
    .line 335
    iget-wide v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 336
    .line 337
    iget v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 338
    .line 339
    const/4 v8, 0x1

    .line 340
    invoke-static/range {v2 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 341
    .line 342
    .line 343
    goto :goto_2

    .line 344
    :cond_7
    iget-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 345
    .line 346
    iget-wide v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 347
    .line 348
    iget v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->streamType:I

    .line 349
    .line 350
    const/4 v8, 0x1

    .line 351
    invoke-static/range {v2 .. v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JJIZ)I

    .line 352
    .line 353
    .line 354
    :goto_2
    iget-wide v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 355
    .line 356
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    const-string v8, ""

    .line 361
    .line 362
    const/4 v9, 0x0

    .line 363
    const/16 v3, 0xfaf

    .line 364
    .line 365
    const-wide/16 v4, 0x1

    .line 366
    .line 367
    const-wide/16 v6, -0x1

    .line 368
    .line 369
    invoke-static/range {v2 .. v9}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 370
    .line 371
    .line 372
    return-void
.end method
