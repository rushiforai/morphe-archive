.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v1, Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :catch_0
    move-object v1, v0

    .line 8
    :goto_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x2

    .line 13
    const-string v4, "TRAE"

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v5, "TraeAudioManagerLooper msg:"

    .line 20
    .line 21
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget v5, p1, Landroid/os/Message;->what:I

    .line 25
    .line 26
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v5, " _enabled:"

    .line 30
    .line 31
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 35
    .line 36
    iget-boolean v5, v5, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->_enabled:Z

    .line 37
    .line 38
    if-eqz v5, :cond_0

    .line 39
    .line 40
    const-string v5, "Y"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    const-string v5, "N"

    .line 44
    .line 45
    :goto_1
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v4, v3, v2}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 56
    .line 57
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 58
    .line 59
    const v5, 0x8004

    .line 60
    .line 61
    .line 62
    if-ne p1, v5, :cond_2

    .line 63
    .line 64
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->startService(Ljava/util/HashMap;)V

    .line 65
    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_2
    iget-boolean v5, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->_enabled:Z

    .line 70
    .line 71
    const/4 v6, 0x1

    .line 72
    if-nez v5, :cond_4

    .line 73
    .line 74
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    const-string p1, "******* disabled ,skip msg******"

    .line 81
    .line 82
    invoke-static {v4, v3, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    new-instance p1, Landroid/content/Intent;

    .line 86
    .line 87
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 93
    .line 94
    invoke-virtual {p0, p1, v1, v6}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->sendResBroadcast(Landroid/content/Intent;Ljava/util/HashMap;I)I

    .line 95
    .line 96
    .line 97
    goto/16 :goto_2

    .line 98
    .line 99
    :cond_4
    const-string v5, " connected fail,auto switch!"

    .line 100
    .line 101
    const-string v7, " sessionConnectedDev:"

    .line 102
    .line 103
    const-string v8, "PARAM_DEVICE"

    .line 104
    .line 105
    const/4 v9, 0x0

    .line 106
    packed-switch p1, :pswitch_data_0

    .line 107
    .line 108
    .line 109
    goto/16 :goto_2

    .line 110
    .line 111
    :pswitch_0
    invoke-virtual {v2}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->abandonAudioFocus()V

    .line 112
    .line 113
    .line 114
    goto/16 :goto_2

    .line 115
    .line 116
    :pswitch_1
    const-string p1, "PARAM_STREAMTYPE"

    .line 117
    .line 118
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Ljava/lang/Integer;

    .line 123
    .line 124
    if-nez p1, :cond_5

    .line 125
    .line 126
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_c

    .line 131
    .line 132
    const-string p0, " MESSAGE_VOICECALL_AUIDOPARAM_CHANGED params.get(PARAM_STREAMTYPE)==null!!"

    .line 133
    .line 134
    invoke-static {v4, v3, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    goto/16 :goto_2

    .line 138
    .line 139
    :cond_5
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    iput v1, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_streamType:I

    .line 148
    .line 149
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalNotifyStreamTypeUpdate(I)I

    .line 156
    .line 157
    .line 158
    goto/16 :goto_2

    .line 159
    .line 160
    :pswitch_2
    iget-object p1, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->sessionConnectedDev:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {p1, v2, v0, v9}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_c

    .line 169
    .line 170
    invoke-virtual {v1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    check-cast p1, Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    if-eqz v1, :cond_6

    .line 181
    .line 182
    new-instance v1, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    const-string v2, " plugout dev:"

    .line 185
    .line 186
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 198
    .line 199
    iget-object p1, p1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->sessionConnectedDev:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-static {v4, v3, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 212
    .line 213
    .line 214
    :cond_6
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 215
    .line 216
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 217
    .line 218
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 219
    .line 220
    invoke-virtual {p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->getAvailabledHighestPriorityDevice()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p0, p1, v0, v9}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 225
    .line 226
    .line 227
    goto/16 :goto_2

    .line 228
    .line 229
    :pswitch_3
    invoke-virtual {v1, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    check-cast p1, Ljava/lang/String;

    .line 234
    .line 235
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 236
    .line 237
    iget-object v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 238
    .line 239
    invoke-virtual {v1, p1, v0, v9}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_c

    .line 244
    .line 245
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-eqz v1, :cond_7

    .line 250
    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    const-string v2, " plugin dev:"

    .line 254
    .line 255
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 265
    .line 266
    iget-object p1, p1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 267
    .line 268
    iget-object p1, p1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->sessionConnectedDev:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-static {v4, v3, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 281
    .line 282
    .line 283
    :cond_7
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 284
    .line 285
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 286
    .line 287
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 288
    .line 289
    invoke-virtual {p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->getAvailabledHighestPriorityDevice()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-virtual {p0, p1, v0, v9}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 294
    .line 295
    .line 296
    goto/16 :goto_2

    .line 297
    .line 298
    :pswitch_4
    iget-object p1, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 299
    .line 300
    iget-object p1, p1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 301
    .line 302
    invoke-virtual {p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->getAvailabledHighestPriorityDevice()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 307
    .line 308
    iget-object v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 309
    .line 310
    iget-object v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 311
    .line 312
    invoke-virtual {v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->getConnectedDevice()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 317
    .line 318
    .line 319
    move-result v2

    .line 320
    if-eqz v2, :cond_8

    .line 321
    .line 322
    new-instance v2, Ljava/lang/StringBuilder;

    .line 323
    .line 324
    const-string v5, "MESSAGE_AUTO_DEVICELIST_UPDATE  connectedDev:"

    .line 325
    .line 326
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    const-string v5, " highestDev"

    .line 333
    .line 334
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    invoke-static {v4, v3, v2}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 345
    .line 346
    .line 347
    :cond_8
    sget-boolean v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 348
    .line 349
    if-eqz v2, :cond_a

    .line 350
    .line 351
    sget-boolean v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsMusicScene:Z

    .line 352
    .line 353
    if-eqz v1, :cond_9

    .line 354
    .line 355
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 356
    .line 357
    iget-object v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 358
    .line 359
    iget-boolean v2, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsBluetoothA2dpExisted:Z

    .line 360
    .line 361
    if-nez v2, :cond_9

    .line 362
    .line 363
    iget-object p0, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 364
    .line 365
    const-string p1, "DEVICE_BLUETOOTHHEADSET"

    .line 366
    .line 367
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->getAvailabledHighestPriorityDevice(Ljava/lang/String;)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p0

    .line 371
    invoke-virtual {v1, p0, v0, v6}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 372
    .line 373
    .line 374
    goto :goto_2

    .line 375
    :cond_9
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 376
    .line 377
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 378
    .line 379
    invoke-virtual {p0, p1, v0, v6}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 380
    .line 381
    .line 382
    goto :goto_2

    .line 383
    :cond_a
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper$2;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;

    .line 388
    .line 389
    if-nez v1, :cond_b

    .line 390
    .line 391
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 392
    .line 393
    invoke-virtual {p0, p1, v0, v9}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalConnectDevice(Ljava/lang/String;Ljava/util/HashMap;Z)I

    .line 394
    .line 395
    .line 396
    goto :goto_2

    .line 397
    :cond_b
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 398
    .line 399
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalNotifyDeviceListUpdate()I

    .line 400
    .line 401
    .line 402
    goto :goto_2

    .line 403
    :pswitch_5
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalGetStreamType(Ljava/util/HashMap;)I

    .line 404
    .line 405
    .line 406
    goto :goto_2

    .line 407
    :pswitch_6
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalStopRing(Ljava/util/HashMap;)I

    .line 408
    .line 409
    .line 410
    goto :goto_2

    .line 411
    :pswitch_7
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalStartRing(Ljava/util/HashMap;)I

    .line 412
    .line 413
    .line 414
    goto :goto_2

    .line 415
    :pswitch_8
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalVoicecallPostprocess(Ljava/util/HashMap;)I

    .line 416
    .line 417
    .line 418
    goto :goto_2

    .line 419
    :pswitch_9
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalVoicecallPreprocess(Ljava/util/HashMap;)I

    .line 420
    .line 421
    .line 422
    goto :goto_2

    .line 423
    :pswitch_a
    iget-object p0, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 424
    .line 425
    invoke-virtual {p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSessionGetConnectingDevice(Ljava/util/HashMap;)I

    .line 426
    .line 427
    .line 428
    goto :goto_2

    .line 429
    :pswitch_b
    iget-object p0, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 430
    .line 431
    invoke-virtual {p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSessionGetConnectedDevice(Ljava/util/HashMap;)I

    .line 432
    .line 433
    .line 434
    goto :goto_2

    .line 435
    :pswitch_c
    iget-object p0, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 436
    .line 437
    invoke-virtual {p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSessionIsDeviceChangabled(Ljava/util/HashMap;)I

    .line 438
    .line 439
    .line 440
    goto :goto_2

    .line 441
    :pswitch_d
    iget-object p0, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 442
    .line 443
    invoke-virtual {p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSessionEarAction(Ljava/util/HashMap;)I

    .line 444
    .line 445
    .line 446
    goto :goto_2

    .line 447
    :pswitch_e
    iget-object p0, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 448
    .line 449
    invoke-virtual {p0, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSessionConnectDevice(Ljava/util/HashMap;)I

    .line 450
    .line 451
    .line 452
    goto :goto_2

    .line 453
    :pswitch_f
    invoke-virtual {v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->InternalSessionGetDeviceList(Ljava/util/HashMap;)I

    .line 454
    .line 455
    .line 456
    goto :goto_2

    .line 457
    :pswitch_10
    invoke-virtual {v2}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$TraeAudioManagerLooper;->stopService()V

    .line 458
    .line 459
    .line 460
    :cond_c
    :goto_2
    return-void

    .line 461
    :pswitch_data_0
    .packed-switch 0x8005
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method
