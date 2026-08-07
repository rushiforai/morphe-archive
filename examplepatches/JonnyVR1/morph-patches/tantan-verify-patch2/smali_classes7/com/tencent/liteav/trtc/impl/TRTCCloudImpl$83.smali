.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->callExperimentalAPI(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$api:Ljava/lang/String;

.field final synthetic val$jsonStr:Ljava/lang/String;

.field final synthetic val$params:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$jsonStr:Ljava/lang/String;

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
    .locals 4

    .line 1
    const-string v0, "callExperimentalAPI[illegal api]: "

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "setSEIPayloadType"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setSEIPayloadType(Lorg/json/JSONObject;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception v0

    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "setLocalAudioMuteMode"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 43
    .line 44
    const-string v2, "setVideoEncodeParamEx"

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 55
    .line 56
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "setAudioSampleRate"

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5500(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 79
    .line 80
    const-string v2, "muteRemoteAudioInSpeaker"

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteAudioInSpeaker(Lorg/json/JSONObject;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 97
    .line 98
    const-string v2, "enableAudioAGC"

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_5

    .line 105
    .line 106
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 109
    .line 110
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5600(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 115
    .line 116
    const-string v2, "enableAudioAEC"

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_6

    .line 123
    .line 124
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 127
    .line 128
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5700(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 133
    .line 134
    const-string v2, "enableAudioANS"

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_7

    .line 141
    .line 142
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 143
    .line 144
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 145
    .line 146
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5800(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_7
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 151
    .line 152
    const-string v2, "setPerformanceMode"

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_8

    .line 159
    .line 160
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 161
    .line 162
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setPerformanceMode(Lorg/json/JSONObject;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_8
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 169
    .line 170
    const-string v2, "setCustomRenderMode"

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-eqz v1, :cond_9

    .line 177
    .line 178
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 179
    .line 180
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 181
    .line 182
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$5900(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_9
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 187
    .line 188
    const-string v2, "setMediaCodecConfig"

    .line 189
    .line 190
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    if-eqz v1, :cond_a

    .line 195
    .line 196
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 197
    .line 198
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 199
    .line 200
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_a
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 205
    .line 206
    const-string v2, "sendJsonCMD"

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-eqz v1, :cond_b

    .line 213
    .line 214
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 215
    .line 216
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 217
    .line 218
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$jsonStr:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendJsonCmd(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :cond_b
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 225
    .line 226
    const-string v2, "updatePrivateMapKey"

    .line 227
    .line 228
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-eqz v1, :cond_c

    .line 233
    .line 234
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 235
    .line 236
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->updatePrivateMapKey(Lorg/json/JSONObject;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_c
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 243
    .line 244
    const-string v2, "setFramework"

    .line 245
    .line 246
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    if-eqz v1, :cond_d

    .line 251
    .line 252
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 253
    .line 254
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 255
    .line 256
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6100(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_d
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 261
    .line 262
    const-string v2, "forceCallbackMixedPlayAudioFrame"

    .line 263
    .line 264
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    if-eqz v1, :cond_e

    .line 269
    .line 270
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 271
    .line 272
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$params:Lorg/json/JSONObject;

    .line 273
    .line 274
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$6200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lorg/json/JSONObject;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_e
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 279
    .line 280
    const-string v2, "setSystemAudioKitEnabled"

    .line 281
    .line 282
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    if-eqz v1, :cond_f

    .line 287
    .line 288
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setSystemAudioKitEnabled()V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :cond_f
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 297
    .line 298
    new-instance v2, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$api:Ljava/lang/String;

    .line 304
    .line 305
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    .line 314
    .line 315
    return-void

    .line 316
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 317
    .line 318
    new-instance v2, Ljava/lang/StringBuilder;

    .line 319
    .line 320
    const-string v3, "callExperimentalAPI[failed]: "

    .line 321
    .line 322
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$83;->val$jsonStr:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    const-string p0, " "

    .line 331
    .line 332
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    return-void
.end method
