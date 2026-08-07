.class final Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;
.super Lcom/cosmos/photon/push/service/IPushChannel$Stub;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/service/PushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "MsgSendBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/service/PushService;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/service/PushService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/cosmos/photon/push/service/IPushChannel$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/service/PushService;Lcom/cosmos/photon/push/service/PushService$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;-><init>(Lcom/cosmos/photon/push/service/PushService;)V

    return-void
.end method


# virtual methods
.method public executeAction(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const-string v0, "executeAction %s"

    .line 2
    .line 3
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-Channel"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const-string v0, "channel"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    const-string v0, "package"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/cosmos/photon/push/service/PushService;->access$100(Lcom/cosmos/photon/push/service/PushService;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    if-eqz v5, :cond_0

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    new-instance v1, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;

    .line 53
    .line 54
    move-object v2, p0

    .line 55
    move-object v3, p2

    .line 56
    invoke-direct/range {v1 .. v6}, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder$1;-><init>(Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move-object v2, p0

    .line 64
    move-object v3, p2

    .line 65
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/4 p2, -0x1

    .line 73
    sparse-switch p0, :sswitch_data_0

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :sswitch_0
    const-string p0, "send_probe_packet"

    .line 78
    .line 79
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-nez p0, :cond_1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_1
    const/4 p2, 0x5

    .line 87
    goto :goto_1

    .line 88
    :sswitch_1
    const-string p0, "unset_alias"

    .line 89
    .line 90
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-nez p0, :cond_2

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    const/4 p2, 0x4

    .line 98
    goto :goto_1

    .line 99
    :sswitch_2
    const-string p0, "set_alias"

    .line 100
    .line 101
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-nez p0, :cond_3

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    const/4 p2, 0x3

    .line 109
    goto :goto_1

    .line 110
    :sswitch_3
    const-string p0, "watch"

    .line 111
    .line 112
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-nez p0, :cond_4

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_4
    const/4 p2, 0x2

    .line 120
    goto :goto_1

    .line 121
    :sswitch_4
    const-string p0, "check"

    .line 122
    .line 123
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-nez p0, :cond_5

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_5
    const/4 p2, 0x1

    .line 131
    goto :goto_1

    .line 132
    :sswitch_5
    const-string p0, "logout"

    .line 133
    .line 134
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-nez p0, :cond_6

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_6
    const/4 p2, 0x0

    .line 142
    :goto_1
    const-string p0, "has_channel"

    .line 143
    .line 144
    const-string v0, "MoPush-IM"

    .line 145
    .line 146
    const-string v1, "key_pkg"

    .line 147
    .line 148
    const-string v3, "key_alias"

    .line 149
    .line 150
    const/4 v4, 0x0

    .line 151
    packed-switch p2, :pswitch_data_0

    .line 152
    .line 153
    .line 154
    return-object v4

    .line 155
    :pswitch_0
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Lcom/cosmos/photon/push/PushImManager;->sendProbePacket()V

    .line 160
    .line 161
    .line 162
    return-object v4

    .line 163
    :pswitch_1
    if-nez p1, :cond_7

    .line 164
    .line 165
    return-object v4

    .line 166
    :cond_7
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    if-nez p2, :cond_8

    .line 179
    .line 180
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    if-nez p2, :cond_8

    .line 185
    .line 186
    const-string p2, "unsetAlias %s"

    .line 187
    .line 188
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-static {v0, p2, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    iget-object p2, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 196
    .line 197
    invoke-static {p2}, Lcom/cosmos/photon/push/service/PushService;->access$500(Lcom/cosmos/photon/push/service/PushService;)Ljava/util/Map;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    check-cast p1, Ljava/util/Set;

    .line 206
    .line 207
    if-eqz p1, :cond_8

    .line 208
    .line 209
    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    :cond_8
    return-object v4

    .line 213
    :pswitch_2
    if-nez p1, :cond_9

    .line 214
    .line 215
    return-object v4

    .line 216
    :cond_9
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    if-nez p2, :cond_b

    .line 229
    .line 230
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    if-nez p2, :cond_b

    .line 235
    .line 236
    iget-object p2, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 237
    .line 238
    invoke-static {p2}, Lcom/cosmos/photon/push/service/PushService;->access$500(Lcom/cosmos/photon/push/service/PushService;)Ljava/util/Map;

    .line 239
    .line 240
    .line 241
    move-result-object p2

    .line 242
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    check-cast p2, Ljava/util/Set;

    .line 247
    .line 248
    if-nez p2, :cond_a

    .line 249
    .line 250
    new-instance p2, Ljava/util/HashSet;

    .line 251
    .line 252
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 253
    .line 254
    .line 255
    iget-object v1, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 256
    .line 257
    invoke-static {v1}, Lcom/cosmos/photon/push/service/PushService;->access$500(Lcom/cosmos/photon/push/service/PushService;)Ljava/util/Map;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    :cond_a
    invoke-interface {p2, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    if-nez p1, :cond_b

    .line 269
    .line 270
    invoke-interface {p2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    const-string p1, "setAlias %s : sendSyncRequest All"

    .line 274
    .line 275
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-static {v0, p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    invoke-static {}, Lcom/cosmos/photon/push/PushImManager;->getInstance()Lcom/cosmos/photon/push/PushImManager;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    const-string p1, "*"

    .line 287
    .line 288
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/PushImManager;->sendSyncRequest(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    :cond_b
    return-object v4

    .line 292
    :pswitch_3
    new-instance p1, Landroid/os/Bundle;

    .line 293
    .line 294
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 295
    .line 296
    .line 297
    iget-object p2, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 298
    .line 299
    invoke-static {p2}, Lcom/cosmos/photon/push/service/PushService;->access$200(Lcom/cosmos/photon/push/service/PushService;)Z

    .line 300
    .line 301
    .line 302
    move-result p2

    .line 303
    invoke-virtual {p1, p0, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 304
    .line 305
    .line 306
    iget-object p0, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 307
    .line 308
    invoke-static {p0}, Lcom/cosmos/photon/push/service/PushService;->access$200(Lcom/cosmos/photon/push/service/PushService;)Z

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    if-eqz p0, :cond_c

    .line 313
    .line 314
    iget-object p0, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 315
    .line 316
    invoke-static {p0}, Lcom/cosmos/photon/push/service/PushService;->access$300(Lcom/cosmos/photon/push/service/PushService;)V

    .line 317
    .line 318
    .line 319
    :cond_c
    return-object p1

    .line 320
    :pswitch_4
    new-instance p1, Landroid/os/Bundle;

    .line 321
    .line 322
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 323
    .line 324
    .line 325
    iget-object p2, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 326
    .line 327
    invoke-static {p2}, Lcom/cosmos/photon/push/service/PushService;->access$200(Lcom/cosmos/photon/push/service/PushService;)Z

    .line 328
    .line 329
    .line 330
    move-result p2

    .line 331
    invoke-virtual {p1, p0, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 332
    .line 333
    .line 334
    return-object p1

    .line 335
    :pswitch_5
    if-nez p1, :cond_d

    .line 336
    .line 337
    return-object v4

    .line 338
    :cond_d
    const-string p0, "key_token"

    .line 339
    .line 340
    invoke-virtual {p1, p0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    iget-object p1, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 345
    .line 346
    invoke-static {p1}, Lcom/cosmos/photon/push/service/PushService;->access$400(Lcom/cosmos/photon/push/service/PushService;)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    if-eqz p0, :cond_e

    .line 355
    .line 356
    iget-object p0, v2, Lcom/cosmos/photon/push/service/PushService$MsgSendBinder;->this$0:Lcom/cosmos/photon/push/service/PushService;

    .line 357
    .line 358
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    .line 359
    .line 360
    .line 361
    :cond_e
    return-object v4

    .line 362
    nop

    .line 363
    :sswitch_data_0
    .sparse-switch
        -0x4167ea76 -> :sswitch_5
        0x5a3e508 -> :sswitch_4
        0x6bac4cf -> :sswitch_3
        0x368d6433 -> :sswitch_2
        0x3aa1b1ba -> :sswitch_1
        0x4fea934e -> :sswitch_0
    .end sparse-switch

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
