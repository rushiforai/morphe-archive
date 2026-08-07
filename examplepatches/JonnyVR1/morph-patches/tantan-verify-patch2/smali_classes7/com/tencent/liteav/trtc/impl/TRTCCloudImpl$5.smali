.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enterRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$appScene:I

.field final synthetic val$enterTime:J

.field final synthetic val$finalRole:I

.field final synthetic val$finalStrBizInfo:Ljava/lang/String;

.field final synthetic val$finalStrRoomId:Ljava/lang/String;

.field final synthetic val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$roomId:J

.field final synthetic val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;Ljava/lang/String;JJILjava/lang/String;ILcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 8
    .line 9
    iput-wide p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$enterTime:J

    .line 10
    .line 11
    iput p8, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 12
    .line 13
    iput-object p9, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrBizInfo:Ljava/lang/String;

    .line 14
    .line 15
    iput p10, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalRole:I

    .line 16
    .line 17
    iput-object p11, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public run()V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 6
    .line 7
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 8
    .line 9
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const-string v4, ""

    .line 16
    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-wide v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 25
    .line 26
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 38
    .line 39
    :goto_0
    invoke-static {v2, v1, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 43
    .line 44
    iget v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 45
    .line 46
    const-wide/16 v2, 0x0

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    const/4 v6, 0x1

    .line 50
    if-eqz v1, :cond_4

    .line 51
    .line 52
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 63
    .line 64
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 65
    .line 66
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    :cond_1
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 75
    .line 76
    iget-object v7, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 77
    .line 78
    iget-wide v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 79
    .line 80
    iget-wide v9, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 81
    .line 82
    cmp-long v7, v7, v9

    .line 83
    .line 84
    if-nez v7, :cond_3

    .line 85
    .line 86
    cmp-long v7, v9, v2

    .line 87
    .line 88
    if-eqz v7, :cond_3

    .line 89
    .line 90
    const-wide/16 v7, -0x1

    .line 91
    .line 92
    cmp-long v7, v9, v7

    .line 93
    .line 94
    if-eqz v7, :cond_3

    .line 95
    .line 96
    :cond_2
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 97
    .line 98
    iget-wide v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 99
    .line 100
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    const-string v3, "enter the same room[%d] again!!!"

    .line 109
    .line 110
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 118
    .line 119
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 120
    .line 121
    iget-wide v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$enterTime:J

    .line 122
    .line 123
    iput-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enterTime:J

    .line 124
    .line 125
    const-string v0, "enter the same room."

    .line 126
    .line 127
    invoke-virtual {v1, v5, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEnterRoom(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_3
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 132
    .line 133
    .line 134
    move-result-object v7

    .line 135
    iget-object v8, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 136
    .line 137
    iget-object v8, v8, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 138
    .line 139
    iget-wide v8, v8, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 140
    .line 141
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    const-string v8, "enter another room[%d] when in room[%d], exit the old room!!!"

    .line 150
    .line 151
    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 159
    .line 160
    iput-boolean v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mIsExitOldRoom:Z

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->exitRoom()V

    .line 163
    .line 164
    .line 165
    :cond_4
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 166
    .line 167
    const-string v7, "========================================================================================================"

    .line 168
    .line 169
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 173
    .line 174
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 178
    .line 179
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v8

    .line 183
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v9

    .line 187
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->d()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v10

    .line 191
    filled-new-array {v8, v9, v10}, [Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v8

    .line 195
    const-string v9, "============= SDK Version:%s Device Name:%s System Version:%s ============="

    .line 196
    .line 197
    invoke-static {v9, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v8

    .line 201
    invoke-virtual {v1, v8}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 205
    .line 206
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 210
    .line 211
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 215
    .line 216
    iget-wide v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 217
    .line 218
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 219
    .line 220
    .line 221
    move-result-object v9

    .line 222
    iget-object v10, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 223
    .line 224
    iget-object v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 225
    .line 226
    iget-object v11, v7, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 227
    .line 228
    iget v7, v7, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 229
    .line 230
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object v12

    .line 234
    iget v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 235
    .line 236
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 237
    .line 238
    .line 239
    move-result-object v13

    .line 240
    iget-object v14, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrBizInfo:Ljava/lang/String;

    .line 241
    .line 242
    filled-new-array/range {v9 .. v14}, [Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v7

    .line 246
    const-string v8, "enterRoom roomId:%d(%s)  userId:%s sdkAppId:%d scene:%d, bizinfo:%s"

    .line 247
    .line 248
    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v7

    .line 252
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    const-string v7, "enterRoom self:"

    .line 258
    .line 259
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    iget-object v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 263
    .line 264
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    .line 265
    .line 266
    .line 267
    move-result v7

    .line 268
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    iget v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 276
    .line 277
    const/4 v8, 0x3

    .line 278
    const-string v9, "VideoCall"

    .line 279
    .line 280
    const/4 v10, 0x2

    .line 281
    if-eqz v7, :cond_7

    .line 282
    .line 283
    if-eq v7, v6, :cond_8

    .line 284
    .line 285
    if-eq v7, v10, :cond_6

    .line 286
    .line 287
    if-eq v7, v8, :cond_5

    .line 288
    .line 289
    new-instance v7, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    const-string v11, "enter room scene:%u error! default to VideoCall! "

    .line 292
    .line 293
    invoke-direct {v7, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iget v11, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 297
    .line 298
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    const-string v11, " self:"

    .line 302
    .line 303
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v11, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 307
    .line 308
    invoke-virtual {v11}, Ljava/lang/Object;->hashCode()I

    .line 309
    .line 310
    .line 311
    move-result v11

    .line 312
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v7

    .line 319
    const-string v11, "TRTCCloudImpl"

    .line 320
    .line 321
    invoke-static {v11, v7}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    move v7, v5

    .line 325
    :goto_1
    move v11, v10

    .line 326
    goto :goto_2

    .line 327
    :cond_5
    const-string v9, "VoiceChatRoom"

    .line 328
    .line 329
    move v7, v6

    .line 330
    goto :goto_1

    .line 331
    :cond_6
    const-string v9, "AudioCall"

    .line 332
    .line 333
    move v7, v5

    .line 334
    :cond_7
    move v11, v6

    .line 335
    goto :goto_2

    .line 336
    :cond_8
    const-string v9, "Live"

    .line 337
    .line 338
    goto :goto_1

    .line 339
    :goto_2
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 340
    .line 341
    .line 342
    move-result-object v12

    .line 343
    invoke-virtual {v12, v11, v6}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setAudioQuality(II)V

    .line 344
    .line 345
    .line 346
    iget-object v11, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrBizInfo:Ljava/lang/String;

    .line 347
    .line 348
    iget v12, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalRole:I

    .line 349
    .line 350
    const/16 v13, 0x14

    .line 351
    .line 352
    if-ne v12, v13, :cond_9

    .line 353
    .line 354
    const-string v12, "Anchor"

    .line 355
    .line 356
    goto :goto_3

    .line 357
    :cond_9
    const-string v12, "Audience"

    .line 358
    .line 359
    :goto_3
    iget-object v13, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 360
    .line 361
    iget-object v13, v13, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->streamId:Ljava/lang/String;

    .line 362
    .line 363
    filled-new-array {v11, v9, v12, v13}, [Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v9

    .line 367
    const-string v11, "bussInfo:%s, appScene:%s, role:%s, streamid:%s"

    .line 368
    .line 369
    invoke-static {v11, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v9

    .line 373
    invoke-static {v6, v1, v9, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 374
    .line 375
    .line 376
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 377
    .line 378
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mAudioFrameListener:Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 379
    .line 380
    if-eqz v1, :cond_a

    .line 381
    .line 382
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$refThis:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 383
    .line 384
    invoke-static {v1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setPlayoutDataListener(Lcom/tencent/liteav/audio/e;)V

    .line 385
    .line 386
    .line 387
    :cond_a
    iget-wide v13, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 388
    .line 389
    const-string v17, ""

    .line 390
    .line 391
    const/16 v18, 0x0

    .line 392
    .line 393
    const-string v11, "18446744073709551615"

    .line 394
    .line 395
    const/16 v12, 0x1389

    .line 396
    .line 397
    const-wide/16 v15, -0x1

    .line 398
    .line 399
    invoke-static/range {v11 .. v18}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 400
    .line 401
    .line 402
    const/16 v1, 0x2713

    .line 403
    .line 404
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v9

    .line 408
    const-string v11, "18446744073709551615"

    .line 409
    .line 410
    invoke-static {v11, v1, v9}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;ILjava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 414
    .line 415
    iput v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomState:I

    .line 416
    .line 417
    iget-wide v11, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 418
    .line 419
    cmp-long v1, v11, v2

    .line 420
    .line 421
    if-nez v1, :cond_e

    .line 422
    .line 423
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersion()[I

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    array-length v9, v1

    .line 428
    if-lt v9, v6, :cond_b

    .line 429
    .line 430
    aget v9, v1, v5

    .line 431
    .line 432
    goto :goto_4

    .line 433
    :cond_b
    move v9, v5

    .line 434
    :goto_4
    array-length v11, v1

    .line 435
    if-lt v11, v10, :cond_c

    .line 436
    .line 437
    aget v11, v1, v6

    .line 438
    .line 439
    goto :goto_5

    .line 440
    :cond_c
    move v11, v5

    .line 441
    :goto_5
    array-length v12, v1

    .line 442
    if-lt v12, v8, :cond_d

    .line 443
    .line 444
    aget v1, v1, v10

    .line 445
    .line 446
    goto :goto_6

    .line 447
    :cond_d
    move v1, v5

    .line 448
    :goto_6
    iget-object v8, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 449
    .line 450
    invoke-virtual {v8, v9, v11, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeCreateContext(III)J

    .line 451
    .line 452
    .line 453
    move-result-wide v11

    .line 454
    iput-wide v11, v8, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 455
    .line 456
    :cond_e
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 457
    .line 458
    invoke-virtual {v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updateAppScene(I)V

    .line 459
    .line 460
    .line 461
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 462
    .line 463
    iget-object v7, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 464
    .line 465
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 466
    .line 467
    invoke-virtual {v7, v1}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 468
    .line 469
    .line 470
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 471
    .line 472
    if-nez v1, :cond_10

    .line 473
    .line 474
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 475
    .line 476
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 477
    .line 478
    .line 479
    move-result v1

    .line 480
    if-eq v1, v10, :cond_f

    .line 481
    .line 482
    goto :goto_7

    .line 483
    :cond_f
    move v5, v6

    .line 484
    :cond_10
    :goto_7
    move/from16 v16, v5

    .line 485
    .line 486
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 487
    .line 488
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 489
    .line 490
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/d;->f(Z)V

    .line 491
    .line 492
    .line 493
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 494
    .line 495
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 496
    .line 497
    .line 498
    move-result v5

    .line 499
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 500
    .line 501
    invoke-static {v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 502
    .line 503
    .line 504
    move-result v6

    .line 505
    invoke-static {v1, v5, v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;II)V

    .line 506
    .line 507
    .line 508
    iget-object v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 509
    .line 510
    iget-object v1, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 511
    .line 512
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 513
    .line 514
    iget v9, v1, Lcom/tencent/liteav/g$a;->a:I

    .line 515
    .line 516
    iget v10, v1, Lcom/tencent/liteav/g$a;->b:I

    .line 517
    .line 518
    iget-object v1, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 519
    .line 520
    iget v11, v1, Lcom/tencent/liteav/g;->h:I

    .line 521
    .line 522
    iget v12, v1, Lcom/tencent/liteav/g;->c:I

    .line 523
    .line 524
    iget-boolean v13, v1, Lcom/tencent/liteav/g;->p:Z

    .line 525
    .line 526
    iget v14, v1, Lcom/tencent/liteav/g;->e:I

    .line 527
    .line 528
    const/4 v8, 0x2

    .line 529
    invoke-static/range {v7 .. v14}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIZI)V

    .line 530
    .line 531
    .line 532
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 533
    .line 534
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    iget-object v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 539
    .line 540
    if-eqz v1, :cond_11

    .line 541
    .line 542
    iget-object v1, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 543
    .line 544
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 545
    .line 546
    iget v7, v1, Lcom/tencent/liteav/g$a;->a:I

    .line 547
    .line 548
    iget v8, v1, Lcom/tencent/liteav/g$a;->b:I

    .line 549
    .line 550
    invoke-static {v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 551
    .line 552
    .line 553
    move-result-object v1

    .line 554
    iget v9, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 555
    .line 556
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 557
    .line 558
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 559
    .line 560
    .line 561
    move-result-object v1

    .line 562
    iget v10, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 563
    .line 564
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 565
    .line 566
    iget-object v6, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 567
    .line 568
    iget-boolean v11, v6, Lcom/tencent/liteav/g;->p:Z

    .line 569
    .line 570
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 571
    .line 572
    .line 573
    move-result-object v1

    .line 574
    iget v12, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->minVideoBitrate:I

    .line 575
    .line 576
    const/4 v6, 0x3

    .line 577
    invoke-static/range {v5 .. v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIZI)V

    .line 578
    .line 579
    .line 580
    goto :goto_8

    .line 581
    :cond_11
    iget-object v1, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 582
    .line 583
    iget-boolean v12, v1, Lcom/tencent/liteav/g;->p:Z

    .line 584
    .line 585
    const/4 v13, 0x0

    .line 586
    const/4 v6, 0x3

    .line 587
    const/4 v7, 0x0

    .line 588
    const/4 v8, 0x0

    .line 589
    const/4 v9, 0x0

    .line 590
    const/4 v10, 0x0

    .line 591
    const/4 v11, 0x0

    .line 592
    invoke-static/range {v5 .. v13}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIIIIIZI)V

    .line 593
    .line 594
    .line 595
    :goto_8
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 596
    .line 597
    iget-object v5, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 598
    .line 599
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 600
    .line 601
    .line 602
    move-result v6

    .line 603
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 604
    .line 605
    iget-object v7, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 606
    .line 607
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->smallEncSize:Lcom/tencent/liteav/g$a;

    .line 608
    .line 609
    iget v8, v7, Lcom/tencent/liteav/g$a;->a:I

    .line 610
    .line 611
    iget v7, v7, Lcom/tencent/liteav/g$a;->b:I

    .line 612
    .line 613
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 614
    .line 615
    .line 616
    move-result-object v1

    .line 617
    iget v9, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoFps:I

    .line 618
    .line 619
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 620
    .line 621
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;

    .line 622
    .line 623
    .line 624
    move-result-object v1

    .line 625
    iget v10, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;->videoBitrate:I

    .line 626
    .line 627
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 628
    .line 629
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 630
    .line 631
    iget v11, v1, Lcom/tencent/liteav/g;->i:I

    .line 632
    .line 633
    move/from16 v24, v8

    .line 634
    .line 635
    move v8, v7

    .line 636
    move/from16 v7, v24

    .line 637
    .line 638
    invoke-virtual/range {v5 .. v11}, Lcom/tencent/liteav/d;->a(ZIIIII)I

    .line 639
    .line 640
    .line 641
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->d()Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v1

    .line 645
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v5

    .line 649
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 650
    .line 651
    iget-object v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 652
    .line 653
    iget v7, v7, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 654
    .line 655
    invoke-static {v6, v5, v1, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Ljava/lang/String;I)V

    .line 656
    .line 657
    .line 658
    new-instance v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;

    .line 659
    .line 660
    invoke-direct {v6}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;-><init>()V

    .line 661
    .line 662
    .line 663
    iget v7, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 664
    .line 665
    iput v7, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->d:I

    .line 666
    .line 667
    iput-object v5, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->e:Ljava/lang/String;

    .line 668
    .line 669
    iput-object v1, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->f:Ljava/lang/String;

    .line 670
    .line 671
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 672
    .line 673
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 674
    .line 675
    if-eqz v1, :cond_12

    .line 676
    .line 677
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v1

    .line 681
    goto :goto_9

    .line 682
    :cond_12
    move-object v1, v4

    .line 683
    :goto_9
    iput-object v1, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->h:Ljava/lang/String;

    .line 684
    .line 685
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 686
    .line 687
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 688
    .line 689
    iput v1, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->b:I

    .line 690
    .line 691
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 692
    .line 693
    .line 694
    move-result-object v1

    .line 695
    iput-object v1, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->g:Ljava/lang/String;

    .line 696
    .line 697
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 698
    .line 699
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 700
    .line 701
    .line 702
    move-result v1

    .line 703
    iput v1, v6, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->c:I

    .line 704
    .line 705
    invoke-static {v6}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;)V

    .line 706
    .line 707
    .line 708
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 709
    .line 710
    iget-wide v5, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 711
    .line 712
    iget v7, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPriorStreamType:I

    .line 713
    .line 714
    invoke-virtual {v1, v5, v6, v7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetPriorRemoteVideoStreamType(JI)I

    .line 715
    .line 716
    .line 717
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 718
    .line 719
    iget-object v5, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 720
    .line 721
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mContext:Landroid/content/Context;

    .line 722
    .line 723
    invoke-virtual {v5, v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getToken(Landroid/content/Context;)[B

    .line 724
    .line 725
    .line 726
    move-result-object v12

    .line 727
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 728
    .line 729
    iget-wide v7, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 730
    .line 731
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 732
    .line 733
    iget v9, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 734
    .line 735
    iget-object v10, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 736
    .line 737
    iget-object v11, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 738
    .line 739
    invoke-virtual/range {v6 .. v12}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeInit(JILjava/lang/String;Ljava/lang/String;[B)V

    .line 740
    .line 741
    .line 742
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 743
    .line 744
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Ljava/util/Set;

    .line 745
    .line 746
    .line 747
    move-result-object v1

    .line 748
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 749
    .line 750
    .line 751
    move-result-object v1

    .line 752
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 753
    .line 754
    .line 755
    move-result v5

    .line 756
    if-eqz v5, :cond_13

    .line 757
    .line 758
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 759
    .line 760
    .line 761
    move-result-object v5

    .line 762
    check-cast v5, Ljava/lang/Integer;

    .line 763
    .line 764
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 765
    .line 766
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 767
    .line 768
    .line 769
    move-result v5

    .line 770
    invoke-static {v6, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 771
    .line 772
    .line 773
    goto :goto_a

    .line 774
    :cond_13
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 775
    .line 776
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 777
    .line 778
    .line 779
    move-result v5

    .line 780
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkSmallStream(Z)V

    .line 781
    .line 782
    .line 783
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 784
    .line 785
    iget-object v5, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 786
    .line 787
    invoke-virtual {v5}, Lcom/tencent/liteav/d;->h()Z

    .line 788
    .line 789
    .line 790
    move-result v5

    .line 791
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableNetworkBlackStream(Z)V

    .line 792
    .line 793
    .line 794
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 795
    .line 796
    iget-object v5, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->privateMapKey:Ljava/lang/String;

    .line 797
    .line 798
    if-eqz v5, :cond_14

    .line 799
    .line 800
    move-object v12, v5

    .line 801
    goto :goto_b

    .line 802
    :cond_14
    move-object v12, v4

    .line 803
    :goto_b
    iget-object v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrRoomId:Ljava/lang/String;

    .line 804
    .line 805
    if-eqz v5, :cond_15

    .line 806
    .line 807
    move-object v13, v5

    .line 808
    goto :goto_c

    .line 809
    :cond_15
    move-object v13, v4

    .line 810
    :goto_c
    iget-object v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalStrBizInfo:Ljava/lang/String;

    .line 811
    .line 812
    if-eqz v5, :cond_16

    .line 813
    .line 814
    move-object v11, v5

    .line 815
    goto :goto_d

    .line 816
    :cond_16
    move-object v11, v4

    .line 817
    :goto_d
    iget-object v5, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userDefineRecordId:Ljava/lang/String;

    .line 818
    .line 819
    if-eqz v5, :cond_17

    .line 820
    .line 821
    move-object/from16 v22, v5

    .line 822
    .line 823
    goto :goto_e

    .line 824
    :cond_17
    move-object/from16 v22, v4

    .line 825
    .line 826
    :goto_e
    iget-object v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->streamId:Ljava/lang/String;

    .line 827
    .line 828
    if-eqz v1, :cond_18

    .line 829
    .line 830
    move-object/from16 v23, v1

    .line 831
    .line 832
    goto :goto_f

    .line 833
    :cond_18
    move-object/from16 v23, v4

    .line 834
    .line 835
    :goto_f
    iget-object v6, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 836
    .line 837
    iget-wide v7, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 838
    .line 839
    iget-wide v9, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 840
    .line 841
    iget v14, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalRole:I

    .line 842
    .line 843
    iget v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$appScene:I

    .line 844
    .line 845
    iget v4, v6, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mPerformanceMode:I

    .line 846
    .line 847
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object v19

    .line 851
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->d()Ljava/lang/String;

    .line 852
    .line 853
    .line 854
    move-result-object v20

    .line 855
    iget-object v5, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 856
    .line 857
    iget v5, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRecvMode:I

    .line 858
    .line 859
    const/16 v15, 0xff

    .line 860
    .line 861
    move/from16 v17, v1

    .line 862
    .line 863
    move/from16 v18, v4

    .line 864
    .line 865
    move/from16 v21, v5

    .line 866
    .line 867
    invoke-virtual/range {v6 .. v23}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeEnterRoom(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)I

    .line 868
    .line 869
    .line 870
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 871
    .line 872
    iget v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$finalRole:I

    .line 873
    .line 874
    iput v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCurrentRole:I

    .line 875
    .line 876
    iput v4, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTargetRole:I

    .line 877
    .line 878
    const/16 v5, 0x15

    .line 879
    .line 880
    if-ne v4, v5, :cond_1a

    .line 881
    .line 882
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 883
    .line 884
    .line 885
    move-result v1

    .line 886
    if-nez v1, :cond_19

    .line 887
    .line 888
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 889
    .line 890
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Z

    .line 891
    .line 892
    .line 893
    move-result v1

    .line 894
    if-nez v1, :cond_19

    .line 895
    .line 896
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 897
    .line 898
    invoke-static {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$1500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 899
    .line 900
    .line 901
    move-result-object v1

    .line 902
    sget-object v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;->NONE:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$VideoSourceType;

    .line 903
    .line 904
    if-eq v1, v4, :cond_1a

    .line 905
    .line 906
    :cond_19
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 907
    .line 908
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5$1;

    .line 909
    .line 910
    invoke-direct {v4, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;)V

    .line 911
    .line 912
    .line 913
    invoke-virtual {v1, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    .line 914
    .line 915
    .line 916
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 917
    .line 918
    const-string v4, "ignore upstream for audience, when enter room!!"

    .line 919
    .line 920
    invoke-virtual {v1, v4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 921
    .line 922
    .line 923
    :cond_1a
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 924
    .line 925
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 926
    .line 927
    invoke-virtual {v1}, Lcom/tencent/liteav/d;->d()I

    .line 928
    .line 929
    .line 930
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 931
    .line 932
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startCollectStatus()V

    .line 933
    .line 934
    .line 935
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 936
    .line 937
    iput-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mLastStateTimeMs:J

    .line 938
    .line 939
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 940
    .line 941
    iget-wide v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomId:J

    .line 942
    .line 943
    iget-object v4, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 944
    .line 945
    iget-object v4, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 946
    .line 947
    invoke-virtual {v1, v2, v3, v4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->init(JLjava/lang/String;)V

    .line 948
    .line 949
    .line 950
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 951
    .line 952
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 953
    .line 954
    iput-object v13, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 955
    .line 956
    iget-object v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$roomParams:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 957
    .line 958
    iget v4, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 959
    .line 960
    iput v4, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->sdkAppId:I

    .line 961
    .line 962
    iget-object v3, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 963
    .line 964
    iput-object v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->userSig:Ljava/lang/String;

    .line 965
    .line 966
    iput-object v12, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->privateMapKey:Ljava/lang/String;

    .line 967
    .line 968
    iget-wide v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->val$enterTime:J

    .line 969
    .line 970
    iput-wide v3, v2, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enterTime:J

    .line 971
    .line 972
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 973
    .line 974
    iget v2, v1, Lcom/tencent/liteav/g;->a:I

    .line 975
    .line 976
    int-to-long v5, v2

    .line 977
    iget v1, v1, Lcom/tencent/liteav/g;->b:I

    .line 978
    .line 979
    int-to-long v7, v1

    .line 980
    const-string v9, ""

    .line 981
    .line 982
    const/4 v10, 0x2

    .line 983
    const-string v3, "18446744073709551615"

    .line 984
    .line 985
    const/16 v4, 0xfa7

    .line 986
    .line 987
    invoke-static/range {v3 .. v10}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 988
    .line 989
    .line 990
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 991
    .line 992
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 993
    .line 994
    iget v1, v1, Lcom/tencent/liteav/g;->h:I

    .line 995
    .line 996
    int-to-long v4, v1

    .line 997
    const-string v8, ""

    .line 998
    .line 999
    const/4 v9, 0x2

    .line 1000
    const-string v2, "18446744073709551615"

    .line 1001
    .line 1002
    const/16 v3, 0xfa8

    .line 1003
    .line 1004
    const-wide/16 v6, -0x1

    .line 1005
    .line 1006
    invoke-static/range {v2 .. v9}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 1007
    .line 1008
    .line 1009
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$5;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 1010
    .line 1011
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 1012
    .line 1013
    iget v0, v0, Lcom/tencent/liteav/g;->c:I

    .line 1014
    .line 1015
    int-to-long v3, v0

    .line 1016
    const-string v7, ""

    .line 1017
    .line 1018
    const/4 v8, 0x2

    .line 1019
    const-string v1, "18446744073709551615"

    .line 1020
    .line 1021
    const/16 v2, 0xfa9

    .line 1022
    .line 1023
    const-wide/16 v5, -0x1

    .line 1024
    .line 1025
    invoke-static/range {v1 .. v8}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 1026
    .line 1027
    .line 1028
    return-void
.end method
