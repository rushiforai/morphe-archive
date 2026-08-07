.class Lcom/tencent/iliveroom/a/a$30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setMixTranscodingConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

.field final synthetic b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a$30;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/iliveroom/a/a$30;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

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
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a$30;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string v1, "setMixTranscodingConfig: set null config."

    .line 10
    .line 11
    invoke-static {v2, v1}, Lcom/tencent/iliveroom/a/a;->d(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->J(Lcom/tencent/iliveroom/a/a;)J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-static {v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v1, v2, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 26
    .line 27
    if-eqz v1, :cond_b

    .line 28
    .line 29
    const-string v1, "setMixTranscodingConfig: set mix config"

    .line 30
    .line 31
    invoke-static {v2, v1}, Lcom/tencent/iliveroom/a/a;->e(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a$30;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 35
    .line 36
    iget-object v2, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->backgroundPicUrl:Ljava/lang/String;

    .line 37
    .line 38
    const-string v3, ""

    .line 39
    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    move-object v2, v3

    .line 43
    :cond_1
    iget-object v1, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixExtraInfo:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    move-object v1, v3

    .line 48
    :cond_2
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;

    .line 49
    .line 50
    invoke-direct {v4}, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object v5, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 54
    .line 55
    iget-object v5, v5, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 56
    .line 57
    iget v6, v5, Lcom/tencent/iliveroom/OneSecAdapterParams;->appId:I

    .line 58
    .line 59
    iput v6, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->appId:I

    .line 60
    .line 61
    iget v5, v5, Lcom/tencent/iliveroom/OneSecAdapterParams;->bizId:I

    .line 62
    .line 63
    iput v5, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->bizId:I

    .line 64
    .line 65
    const/4 v5, 0x1

    .line 66
    iput v5, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->mode:I

    .line 67
    .line 68
    iget-object v6, v0, Lcom/tencent/iliveroom/a/a$30;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 69
    .line 70
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoWidth:I

    .line 71
    .line 72
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->videoWidth:I

    .line 73
    .line 74
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoHeight:I

    .line 75
    .line 76
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->videoHeight:I

    .line 77
    .line 78
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoBitrate:I

    .line 79
    .line 80
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->videoBitrate:I

    .line 81
    .line 82
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoFramerate:I

    .line 83
    .line 84
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->videoFramerate:I

    .line 85
    .line 86
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoGOP:I

    .line 87
    .line 88
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->videoGOP:I

    .line 89
    .line 90
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoCodecType:I

    .line 91
    .line 92
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->videoCodecType:I

    .line 93
    .line 94
    iget-boolean v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->enableBFrame:Z

    .line 95
    .line 96
    iput-boolean v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->enableBFrame:Z

    .line 97
    .line 98
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioSampleRate:I

    .line 99
    .line 100
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->audioSampleRate:I

    .line 101
    .line 102
    iget v7, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioBitrate:I

    .line 103
    .line 104
    iput v7, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->audioBitrate:I

    .line 105
    .line 106
    iget v6, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioChannels:I

    .line 107
    .line 108
    iput v6, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->audioChannels:I

    .line 109
    .line 110
    iput-object v1, v4, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;->mixExtraInfo:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v2, v4, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;->backgroundURL:Ljava/lang/String;

    .line 113
    .line 114
    new-instance v1, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object v1, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 120
    .line 121
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a$30;->b:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 122
    .line 123
    iget v1, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoCodecType:I

    .line 124
    .line 125
    const/4 v2, 0x2

    .line 126
    if-ne v1, v2, :cond_4

    .line 127
    .line 128
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 129
    .line 130
    invoke-static {v1}, Lcom/tencent/iliveroom/a/a;->H(Lcom/tencent/iliveroom/a/a;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-eqz v1, :cond_3

    .line 139
    .line 140
    iget-object v6, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 141
    .line 142
    iget-object v1, v6, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 143
    .line 144
    iget v7, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->bizId:I

    .line 145
    .line 146
    iget-wide v8, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->sdkAppId:J

    .line 147
    .line 148
    iget-object v10, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 149
    .line 150
    iget-wide v11, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 151
    .line 152
    invoke-static/range {v6 .. v12}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;IJLjava/lang/String;J)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-static {v6, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    :cond_3
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 160
    .line 161
    invoke-static {v1}, Lcom/tencent/iliveroom/a/a;->H(Lcom/tencent/iliveroom/a/a;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->streamId:Ljava/lang/String;

    .line 166
    .line 167
    :cond_4
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a$30;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 168
    .line 169
    iget-object v1, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 170
    .line 171
    if-eqz v1, :cond_a

    .line 172
    .line 173
    new-instance v1, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .line 177
    .line 178
    iget-object v6, v0, Lcom/tencent/iliveroom/a/a$30;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 179
    .line 180
    iget-object v6, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    if-eqz v7, :cond_9

    .line 191
    .line 192
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v7

    .line 196
    check-cast v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;

    .line 197
    .line 198
    if-eqz v7, :cond_8

    .line 199
    .line 200
    new-instance v8, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;

    .line 201
    .line 202
    new-instance v9, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    iget-wide v10, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 208
    .line 209
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v9

    .line 219
    iget v10, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->x:I

    .line 220
    .line 221
    iget v11, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->y:I

    .line 222
    .line 223
    iget v12, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->width:I

    .line 224
    .line 225
    iget v13, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->height:I

    .line 226
    .line 227
    iget v14, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->zOrder:I

    .line 228
    .line 229
    invoke-direct/range {v8 .. v14}, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;-><init>(Ljava/lang/String;IIIII)V

    .line 230
    .line 231
    .line 232
    iget-object v9, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->roomId:Ljava/lang/String;

    .line 233
    .line 234
    iput-object v9, v8, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->roomId:Ljava/lang/String;

    .line 235
    .line 236
    const-string v9, "mixUserId:"

    .line 237
    .line 238
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    iget-wide v9, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 242
    .line 243
    invoke-virtual {v1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    const-string v9, ",roomId:"

    .line 247
    .line 248
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    iget-object v9, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->roomId:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    iget v9, v8, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->width:I

    .line 257
    .line 258
    if-nez v9, :cond_6

    .line 259
    .line 260
    iget v9, v8, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->height:I

    .line 261
    .line 262
    if-nez v9, :cond_6

    .line 263
    .line 264
    iget-boolean v9, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    .line 265
    .line 266
    if-eqz v9, :cond_5

    .line 267
    .line 268
    const-string v8, ",isMute:"

    .line 269
    .line 270
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    iget-boolean v7, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    .line 274
    .line 275
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    goto :goto_0

    .line 279
    :cond_5
    const/4 v9, 0x3

    .line 280
    iput v9, v8, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->inputType:I

    .line 281
    .line 282
    goto :goto_1

    .line 283
    :cond_6
    iget-boolean v9, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    .line 284
    .line 285
    if-eqz v9, :cond_7

    .line 286
    .line 287
    iput v2, v8, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->inputType:I

    .line 288
    .line 289
    goto :goto_1

    .line 290
    :cond_7
    iput v5, v8, Lcom/tencent/trtc/TRTCCloudDef$TRTCMixUser;->inputType:I

    .line 291
    .line 292
    :goto_1
    iget-object v10, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 293
    .line 294
    iget-object v9, v10, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 295
    .line 296
    iget v11, v9, Lcom/tencent/iliveroom/OneSecAdapterParams;->bizId:I

    .line 297
    .line 298
    iget-wide v12, v9, Lcom/tencent/iliveroom/OneSecAdapterParams;->sdkAppId:J

    .line 299
    .line 300
    iget-object v14, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->roomId:Ljava/lang/String;

    .line 301
    .line 302
    move-object/from16 v17, v6

    .line 303
    .line 304
    iget-wide v5, v7, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 305
    .line 306
    move-wide v15, v5

    .line 307
    invoke-static/range {v10 .. v16}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;IJLjava/lang/String;J)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    iput-object v5, v8, Lcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner$TRTCMixUserInner;->streamId:Ljava/lang/String;

    .line 312
    .line 313
    iget-object v5, v4, Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 314
    .line 315
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    goto :goto_2

    .line 319
    :cond_8
    move-object/from16 v17, v6

    .line 320
    .line 321
    :goto_2
    move-object/from16 v6, v17

    .line 322
    .line 323
    const/4 v5, 0x1

    .line 324
    goto/16 :goto_0

    .line 325
    .line 326
    :cond_9
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    const/4 v3, 0x0

    .line 331
    const-string v5, "setMixTranscodingConfig"

    .line 332
    .line 333
    invoke-static {v2, v5, v1, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 334
    .line 335
    .line 336
    :cond_a
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a$30;->c:Lcom/tencent/iliveroom/a/a;

    .line 337
    .line 338
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->K(Lcom/tencent/iliveroom/a/a;)J

    .line 339
    .line 340
    .line 341
    move-result-wide v1

    .line 342
    invoke-static {v0, v1, v2, v4}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :cond_b
    const-string v0, "setMixTranscodingConfig: room params is null, ignore mix config."

    .line 347
    .line 348
    invoke-static {v2, v0}, Lcom/tencent/iliveroom/a/a;->f(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    return-void
.end method
