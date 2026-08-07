.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

.field final synthetic val$outStreamType:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->val$outStreamType:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 12
    .line 13
    const/16 v4, 0x7d3

    .line 14
    .line 15
    if-ne v3, v4, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 18
    .line 19
    const-string v3, "EVT_PARAM2"

    .line 20
    .line 21
    const-string v4, "EVT_PARAM1"

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 40
    .line 41
    const-string v1, "onFirstVideoFrame local."

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->val$outStreamType:I

    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 51
    .line 52
    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 59
    .line 60
    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-virtual {v2, v3, v0, v1, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onFirstVideoFrame(Ljava/lang/String;III)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 72
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v5, "onFirstVideoFrame "

    .line 76
    .line 77
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 81
    .line 82
    iget-object v5, v5, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 95
    .line 96
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 97
    .line 98
    iget v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->val$outStreamType:I

    .line 99
    .line 100
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 101
    .line 102
    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 109
    .line 110
    invoke-virtual {p0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    invoke-virtual {v2, v1, v5, v0, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onFirstVideoFrame(Ljava/lang/String;III)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    const/16 v4, 0x7ea

    .line 119
    .line 120
    if-ne v3, v4, :cond_3

    .line 121
    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v3, "onFirstAudioFrame "

    .line 125
    .line 126
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 130
    .line 131
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 144
    .line 145
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$userId:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v2, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onFirstAudioFrame(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_3
    const/16 v1, 0x3eb

    .line 152
    .line 153
    const/4 v4, 0x1

    .line 154
    const/4 v5, 0x0

    .line 155
    const-string v6, ""

    .line 156
    .line 157
    if-ne v3, v1, :cond_4

    .line 158
    .line 159
    invoke-virtual {v2}, Lcom/tencent/trtc/TRTCCloudListener;->onCameraDidReady()V

    .line 160
    .line 161
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string v1, "onCameraDidReady self:"

    .line 165
    .line 166
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 170
    .line 171
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {v4, p0, v6, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_4
    const/16 v1, 0x7eb

    .line 189
    .line 190
    if-ne v3, v1, :cond_5

    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/tencent/trtc/TRTCCloudListener;->onMicDidReady()V

    .line 193
    .line 194
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v1, "onMicDidReady self:"

    .line 198
    .line 199
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 203
    .line 204
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 205
    .line 206
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-static {v4, p0, v6, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_5
    const-string v1, " self:"

    .line 222
    .line 223
    const-string v7, "EVT_MSG"

    .line 224
    .line 225
    if-gez v3, :cond_6

    .line 226
    .line 227
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 228
    .line 229
    invoke-virtual {v0, v7, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 234
    .line 235
    iget-object v4, v4, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 236
    .line 237
    invoke-virtual {v2, v3, v0, v4}, Lcom/tencent/trtc/TRTCCloudListener;->onError(ILjava/lang/String;Landroid/os/Bundle;)V

    .line 238
    .line 239
    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 243
    .line 244
    .line 245
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 246
    .line 247
    iget v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 248
    .line 249
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 254
    .line 255
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 256
    .line 257
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    const-string v3, "onError event:%d, msg:%s"

    .line 262
    .line 263
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 274
    .line 275
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    const/4 v1, 0x3

    .line 289
    invoke-static {v1, v0, v6, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 290
    .line 291
    .line 292
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 293
    .line 294
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 295
    .line 296
    invoke-static {p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(I)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_6
    const/16 v8, 0x44c

    .line 301
    .line 302
    if-le v3, v8, :cond_7

    .line 303
    .line 304
    const/16 v8, 0x456

    .line 305
    .line 306
    if-lt v3, v8, :cond_b

    .line 307
    .line 308
    :cond_7
    const/16 v8, 0x4b0

    .line 309
    .line 310
    if-le v3, v8, :cond_8

    .line 311
    .line 312
    const/16 v8, 0x4b6

    .line 313
    .line 314
    if-lt v3, v8, :cond_b

    .line 315
    .line 316
    :cond_8
    const/16 v8, 0x834

    .line 317
    .line 318
    if-le v3, v8, :cond_9

    .line 319
    .line 320
    const/16 v8, 0x83e

    .line 321
    .line 322
    if-lt v3, v8, :cond_b

    .line 323
    .line 324
    :cond_9
    const/16 v8, 0xbb9

    .line 325
    .line 326
    if-le v3, v8, :cond_a

    .line 327
    .line 328
    const/16 v8, 0xbc3

    .line 329
    .line 330
    if-lt v3, v8, :cond_b

    .line 331
    .line 332
    :cond_a
    const/16 v8, 0x13ec

    .line 333
    .line 334
    if-le v3, v8, :cond_e

    .line 335
    .line 336
    const/16 v8, 0x13f0

    .line 337
    .line 338
    if-ge v3, v8, :cond_e

    .line 339
    .line 340
    :cond_b
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 341
    .line 342
    invoke-virtual {v0, v7, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    iget-object v7, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 347
    .line 348
    iget-object v7, v7, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 349
    .line 350
    invoke-virtual {v2, v3, v0, v7}, Lcom/tencent/trtc/TRTCCloudListener;->onWarning(ILjava/lang/String;Landroid/os/Bundle;)V

    .line 351
    .line 352
    .line 353
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 354
    .line 355
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 356
    .line 357
    const/16 v2, 0x839

    .line 358
    .line 359
    if-eq v0, v2, :cond_c

    .line 360
    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 364
    .line 365
    .line 366
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 367
    .line 368
    iget v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 369
    .line 370
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 375
    .line 376
    iget-object v3, v3, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventParam:Landroid/os/Bundle;

    .line 377
    .line 378
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    const-string v3, "onWarning event:%d, msg:%s"

    .line 383
    .line 384
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 395
    .line 396
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 397
    .line 398
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 399
    .line 400
    .line 401
    move-result v1

    .line 402
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    invoke-static {v4, v0, v6, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 410
    .line 411
    .line 412
    :cond_c
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;

    .line 413
    .line 414
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$170;->val$eventCode:I

    .line 415
    .line 416
    const/16 v0, 0x44f

    .line 417
    .line 418
    if-eq p0, v0, :cond_d

    .line 419
    .line 420
    const/16 v0, 0x455

    .line 421
    .line 422
    if-eq p0, v0, :cond_d

    .line 423
    .line 424
    const/16 v0, 0x83a

    .line 425
    .line 426
    if-eq p0, v0, :cond_d

    .line 427
    .line 428
    const/16 v0, 0x83d

    .line 429
    .line 430
    if-eq p0, v0, :cond_d

    .line 431
    .line 432
    const/16 v0, 0x835

    .line 433
    .line 434
    if-eq p0, v0, :cond_d

    .line 435
    .line 436
    const/16 v0, 0x836

    .line 437
    .line 438
    if-eq p0, v0, :cond_d

    .line 439
    .line 440
    goto :goto_0

    .line 441
    :cond_d
    invoke-static {p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->b(I)V

    .line 442
    .line 443
    .line 444
    :cond_e
    :goto_0
    return-void
.end method
