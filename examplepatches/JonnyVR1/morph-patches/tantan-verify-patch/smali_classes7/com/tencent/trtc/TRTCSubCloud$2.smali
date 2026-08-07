.class Lcom/tencent/trtc/TRTCSubCloud$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud;->enterRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:J

.field final synthetic c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

.field final synthetic d:I

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:I

.field final synthetic g:J

.field final synthetic h:Lcom/tencent/trtc/TRTCSubCloud;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;JLcom/tencent/trtc/TRTCCloudDef$TRTCParams;ILjava/lang/String;IJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 6
    .line 7
    iput-object p5, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 8
    .line 9
    iput p6, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->d:I

    .line 10
    .line 11
    iput-object p7, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->e:Ljava/lang/String;

    .line 12
    .line 13
    iput p8, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->f:I

    .line 14
    .line 15
    iput-wide p9, p0, Lcom/tencent/trtc/TRTCSubCloud$2;->g:J

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public run()V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$1000(Lcom/tencent/trtc/TRTCSubCloud;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->a:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 23
    .line 24
    invoke-static {v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$1100(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    :cond_0
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$1200(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-wide v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 43
    .line 44
    iget-wide v5, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 45
    .line 46
    cmp-long v1, v3, v5

    .line 47
    .line 48
    if-nez v1, :cond_2

    .line 49
    .line 50
    :cond_1
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 51
    .line 52
    iget-wide v2, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 53
    .line 54
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v2, "enter the same room[%d] again, ignore!!!"

    .line 63
    .line 64
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v1, v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$1300(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 73
    .line 74
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    iget-object v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 79
    .line 80
    invoke-static {v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$1400(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    iget-wide v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->roomId:J

    .line 85
    .line 86
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    const-string v4, "enter another room[%d] when in room[%d], exit the old room!!!"

    .line 95
    .line 96
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$1500(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 104
    .line 105
    invoke-static {v1, v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$1602(Lcom/tencent/trtc/TRTCSubCloud;Z)Z

    .line 106
    .line 107
    .line 108
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/tencent/trtc/TRTCSubCloud;->exitRoom()V

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 114
    .line 115
    const-string v3, "========================================================================================================"

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$1700(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 121
    .line 122
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$1800(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 126
    .line 127
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->d()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    filled-new-array {v4, v5, v6}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    const-string v5, "============= SDK Version:%s Device Name:%s System Version:%s ============="

    .line 144
    .line 145
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-static {v1, v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$1900(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 153
    .line 154
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$2000(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 158
    .line 159
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$2100(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 163
    .line 164
    iget-wide v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 165
    .line 166
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    iget-object v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->a:Ljava/lang/String;

    .line 171
    .line 172
    iget-object v5, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 173
    .line 174
    iget-object v6, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 175
    .line 176
    iget v5, v5, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 177
    .line 178
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    iget v7, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->d:I

    .line 183
    .line 184
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    filled-new-array {v3, v4, v6, v5, v7}, [Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    const-string v4, "enterRoom roomId:%d(%s)  userId:%s sdkAppId:%d scene:%d"

    .line 193
    .line 194
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$2200(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    const-string v3, "enterRoom self:"

    .line 204
    .line 205
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 209
    .line 210
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string v3, ", roomId:"

    .line 218
    .line 219
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 223
    .line 224
    iget v3, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->roomId:I

    .line 225
    .line 226
    const/4 v4, -0x1

    .line 227
    if-ne v3, v4, :cond_4

    .line 228
    .line 229
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->a:Ljava/lang/String;

    .line 230
    .line 231
    goto :goto_0

    .line 232
    :cond_4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    iget v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->d:I

    .line 244
    .line 245
    const/4 v4, 0x3

    .line 246
    const-string v5, "VideoCall"

    .line 247
    .line 248
    const/4 v6, 0x2

    .line 249
    const/4 v7, 0x0

    .line 250
    if-eqz v3, :cond_8

    .line 251
    .line 252
    if-eq v3, v2, :cond_7

    .line 253
    .line 254
    if-eq v3, v6, :cond_6

    .line 255
    .line 256
    if-eq v3, v4, :cond_5

    .line 257
    .line 258
    invoke-static {}, Lcom/tencent/trtc/TRTCSubCloud;->access$2300()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    new-instance v8, Ljava/lang/StringBuilder;

    .line 263
    .line 264
    const-string v9, "enter room scene:%u error! default to VideoCall! "

    .line 265
    .line 266
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    iget v9, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->d:I

    .line 270
    .line 271
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const-string v9, " self:"

    .line 275
    .line 276
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    iget-object v9, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 280
    .line 281
    invoke-virtual {v9}, Ljava/lang/Object;->hashCode()I

    .line 282
    .line 283
    .line 284
    move-result v9

    .line 285
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v8

    .line 292
    invoke-static {v3, v8}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    :goto_1
    move v3, v7

    .line 296
    goto :goto_2

    .line 297
    :cond_5
    const-string v5, "VoiceChatRoom"

    .line 298
    .line 299
    move v3, v2

    .line 300
    goto :goto_2

    .line 301
    :cond_6
    const-string v5, "AudioCall"

    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_7
    const-string v5, "Live"

    .line 305
    .line 306
    :cond_8
    :goto_2
    iget-object v8, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->e:Ljava/lang/String;

    .line 307
    .line 308
    iget v9, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->f:I

    .line 309
    .line 310
    const/16 v10, 0x14

    .line 311
    .line 312
    if-ne v9, v10, :cond_9

    .line 313
    .line 314
    const-string v9, "Anchor"

    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_9
    const-string v9, "Audience"

    .line 318
    .line 319
    :goto_3
    iget-object v10, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 320
    .line 321
    iget-object v10, v10, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->streamId:Ljava/lang/String;

    .line 322
    .line 323
    filled-new-array {v8, v5, v9, v10}, [Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    const-string v8, "bussInfo:%s, appScene:%s, role:%s, streamid:%s"

    .line 328
    .line 329
    invoke-static {v8, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    invoke-static {v2, v1, v5, v7}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 334
    .line 335
    .line 336
    iget-wide v10, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 337
    .line 338
    const-string v14, ""

    .line 339
    .line 340
    const/4 v15, 0x0

    .line 341
    const-string v8, "18446744073709551615"

    .line 342
    .line 343
    const/16 v9, 0x1389

    .line 344
    .line 345
    const-wide/16 v12, -0x1

    .line 346
    .line 347
    invoke-static/range {v8 .. v15}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 348
    .line 349
    .line 350
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 351
    .line 352
    invoke-static {v1, v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$2402(Lcom/tencent/trtc/TRTCSubCloud;I)I

    .line 353
    .line 354
    .line 355
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 356
    .line 357
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$2500(Lcom/tencent/trtc/TRTCSubCloud;)J

    .line 358
    .line 359
    .line 360
    move-result-wide v8

    .line 361
    const-wide/16 v10, 0x0

    .line 362
    .line 363
    cmp-long v1, v8, v10

    .line 364
    .line 365
    if-nez v1, :cond_d

    .line 366
    .line 367
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersion()[I

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    array-length v5, v1

    .line 372
    if-lt v5, v2, :cond_a

    .line 373
    .line 374
    aget v5, v1, v7

    .line 375
    .line 376
    goto :goto_4

    .line 377
    :cond_a
    move v5, v7

    .line 378
    :goto_4
    array-length v8, v1

    .line 379
    if-lt v8, v6, :cond_b

    .line 380
    .line 381
    aget v2, v1, v2

    .line 382
    .line 383
    goto :goto_5

    .line 384
    :cond_b
    move v2, v7

    .line 385
    :goto_5
    array-length v8, v1

    .line 386
    if-lt v8, v4, :cond_c

    .line 387
    .line 388
    aget v7, v1, v6

    .line 389
    .line 390
    :cond_c
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 391
    .line 392
    invoke-static {v1, v5, v2, v7}, Lcom/tencent/trtc/TRTCSubCloud;->access$2700(Lcom/tencent/trtc/TRTCSubCloud;III)J

    .line 393
    .line 394
    .line 395
    move-result-wide v4

    .line 396
    invoke-static {v1, v4, v5}, Lcom/tencent/trtc/TRTCSubCloud;->access$2602(Lcom/tencent/trtc/TRTCSubCloud;J)J

    .line 397
    .line 398
    .line 399
    :cond_d
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 400
    .line 401
    invoke-static {v1, v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$2800(Lcom/tencent/trtc/TRTCSubCloud;I)V

    .line 402
    .line 403
    .line 404
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 405
    .line 406
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$2900(Lcom/tencent/trtc/TRTCSubCloud;)J

    .line 407
    .line 408
    .line 409
    move-result-wide v2

    .line 410
    iget-object v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 411
    .line 412
    invoke-static {v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$3000(Lcom/tencent/trtc/TRTCSubCloud;)I

    .line 413
    .line 414
    .line 415
    move-result v4

    .line 416
    invoke-static {v1, v2, v3, v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$3100(Lcom/tencent/trtc/TRTCSubCloud;JI)I

    .line 417
    .line 418
    .line 419
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 420
    .line 421
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$3300(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    iget-object v2, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 426
    .line 427
    invoke-static {v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$3200(Lcom/tencent/trtc/TRTCSubCloud;)Landroid/content/Context;

    .line 428
    .line 429
    .line 430
    move-result-object v2

    .line 431
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getToken(Landroid/content/Context;)[B

    .line 432
    .line 433
    .line 434
    move-result-object v9

    .line 435
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 436
    .line 437
    invoke-static {v3}, Lcom/tencent/trtc/TRTCSubCloud;->access$3400(Lcom/tencent/trtc/TRTCSubCloud;)J

    .line 438
    .line 439
    .line 440
    move-result-wide v4

    .line 441
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 442
    .line 443
    iget v6, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 444
    .line 445
    iget-object v7, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 446
    .line 447
    iget-object v8, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 448
    .line 449
    invoke-static/range {v3 .. v9}, Lcom/tencent/trtc/TRTCSubCloud;->access$3500(Lcom/tencent/trtc/TRTCSubCloud;JILjava/lang/String;Ljava/lang/String;[B)V

    .line 450
    .line 451
    .line 452
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 453
    .line 454
    iget-object v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->privateMapKey:Ljava/lang/String;

    .line 455
    .line 456
    const-string v3, ""

    .line 457
    .line 458
    if-eqz v2, :cond_e

    .line 459
    .line 460
    move-object/from16 v18, v2

    .line 461
    .line 462
    goto :goto_6

    .line 463
    :cond_e
    move-object/from16 v18, v3

    .line 464
    .line 465
    :goto_6
    iget-object v2, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->a:Ljava/lang/String;

    .line 466
    .line 467
    if-eqz v2, :cond_f

    .line 468
    .line 469
    move-object/from16 v19, v2

    .line 470
    .line 471
    goto :goto_7

    .line 472
    :cond_f
    move-object/from16 v19, v3

    .line 473
    .line 474
    :goto_7
    iget-object v2, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->e:Ljava/lang/String;

    .line 475
    .line 476
    if-eqz v2, :cond_10

    .line 477
    .line 478
    move-object/from16 v17, v2

    .line 479
    .line 480
    goto :goto_8

    .line 481
    :cond_10
    move-object/from16 v17, v3

    .line 482
    .line 483
    :goto_8
    iget-object v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userDefineRecordId:Ljava/lang/String;

    .line 484
    .line 485
    if-eqz v2, :cond_11

    .line 486
    .line 487
    move-object/from16 v28, v2

    .line 488
    .line 489
    goto :goto_9

    .line 490
    :cond_11
    move-object/from16 v28, v3

    .line 491
    .line 492
    :goto_9
    iget-object v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->streamId:Ljava/lang/String;

    .line 493
    .line 494
    if-eqz v1, :cond_12

    .line 495
    .line 496
    move-object/from16 v29, v1

    .line 497
    .line 498
    goto :goto_a

    .line 499
    :cond_12
    move-object/from16 v29, v3

    .line 500
    .line 501
    :goto_a
    iget-object v12, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 502
    .line 503
    invoke-static {v12}, Lcom/tencent/trtc/TRTCSubCloud;->access$3600(Lcom/tencent/trtc/TRTCSubCloud;)J

    .line 504
    .line 505
    .line 506
    move-result-wide v13

    .line 507
    iget-wide v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 508
    .line 509
    iget v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->f:I

    .line 510
    .line 511
    iget v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->d:I

    .line 512
    .line 513
    iget-object v5, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 514
    .line 515
    invoke-static {v5}, Lcom/tencent/trtc/TRTCSubCloud;->access$3700(Lcom/tencent/trtc/TRTCSubCloud;)I

    .line 516
    .line 517
    .line 518
    move-result v24

    .line 519
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->c()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v25

    .line 523
    invoke-static {}, Lcom/tencent/liteav/basic/util/f;->d()Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object v26

    .line 527
    iget-object v5, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 528
    .line 529
    invoke-static {v5}, Lcom/tencent/trtc/TRTCSubCloud;->access$3800(Lcom/tencent/trtc/TRTCSubCloud;)I

    .line 530
    .line 531
    .line 532
    move-result v27

    .line 533
    const/16 v21, 0xff

    .line 534
    .line 535
    const/16 v22, 0x0

    .line 536
    .line 537
    move-wide v15, v1

    .line 538
    move/from16 v20, v3

    .line 539
    .line 540
    move/from16 v23, v4

    .line 541
    .line 542
    invoke-static/range {v12 .. v29}, Lcom/tencent/trtc/TRTCSubCloud;->access$3900(Lcom/tencent/trtc/TRTCSubCloud;JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)I

    .line 543
    .line 544
    .line 545
    move-object/from16 v2, v18

    .line 546
    .line 547
    move-object/from16 v3, v19

    .line 548
    .line 549
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 550
    .line 551
    iget v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->f:I

    .line 552
    .line 553
    invoke-static {v1, v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$4002(Lcom/tencent/trtc/TRTCSubCloud;I)I

    .line 554
    .line 555
    .line 556
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 557
    .line 558
    iget v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->f:I

    .line 559
    .line 560
    invoke-static {v1, v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$4102(Lcom/tencent/trtc/TRTCSubCloud;I)I

    .line 561
    .line 562
    .line 563
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 564
    .line 565
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4200(Lcom/tencent/trtc/TRTCSubCloud;)V

    .line 566
    .line 567
    .line 568
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 569
    .line 570
    invoke-static {v1, v10, v11}, Lcom/tencent/trtc/TRTCSubCloud;->access$4302(Lcom/tencent/trtc/TRTCSubCloud;J)J

    .line 571
    .line 572
    .line 573
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 574
    .line 575
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4400(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 576
    .line 577
    .line 578
    move-result-object v1

    .line 579
    iget-wide v4, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->b:J

    .line 580
    .line 581
    iget-object v6, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 582
    .line 583
    iget-object v6, v6, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 584
    .line 585
    invoke-virtual {v1, v4, v5, v6}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->init(JLjava/lang/String;)V

    .line 586
    .line 587
    .line 588
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 589
    .line 590
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4500(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 591
    .line 592
    .line 593
    move-result-object v1

    .line 594
    iput-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->strRoomId:Ljava/lang/String;

    .line 595
    .line 596
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 597
    .line 598
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4600(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 599
    .line 600
    .line 601
    move-result-object v1

    .line 602
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 603
    .line 604
    iget v3, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 605
    .line 606
    iput v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->sdkAppId:I

    .line 607
    .line 608
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 609
    .line 610
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4700(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    iget-object v3, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->c:Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 615
    .line 616
    iget-object v3, v3, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 617
    .line 618
    iput-object v3, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->userSig:Ljava/lang/String;

    .line 619
    .line 620
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 621
    .line 622
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4800(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    iput-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->privateMapKey:Ljava/lang/String;

    .line 627
    .line 628
    iget-object v1, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->h:Lcom/tencent/trtc/TRTCSubCloud;

    .line 629
    .line 630
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$4900(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    iget-wide v2, v0, Lcom/tencent/trtc/TRTCSubCloud$2;->g:J

    .line 635
    .line 636
    iput-wide v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->enterTime:J

    .line 637
    .line 638
    return-void
.end method
