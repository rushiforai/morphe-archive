.class public Lcom/cosmos/photon/push/MoPushProvider;
.super Landroid/content/ContentProvider;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    :catch_0
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->isInit()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    const-wide/16 v2, 0x64

    .line 12
    .line 13
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    sub-long/2addr v2, v0

    .line 21
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 22
    .line 23
    .line 24
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    const-wide/16 v4, 0xbb8

    .line 26
    .line 27
    cmp-long p0, v2, v4

    .line 28
    .line 29
    if-lez p0, :cond_0

    .line 30
    .line 31
    :cond_1
    const-string p0, "method:%s arg:%s extras:%s"

    .line 32
    .line 33
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-string v0, "MoPush-Channel"

    .line 38
    .line 39
    invoke-static {v0, p0, p2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/4 p2, 0x1

    .line 50
    const/4 v1, -0x1

    .line 51
    sparse-switch p0, :sswitch_data_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :sswitch_0
    const-string p0, "channel_msg"

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const/4 v1, 0x2

    .line 65
    goto :goto_0

    .line 66
    :sswitch_1
    const-string p0, "channel_push"

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    move v1, p2

    .line 76
    goto :goto_0

    .line 77
    :sswitch_2
    const-string p0, "channel_receive"

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-nez p0, :cond_4

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    const/4 v1, 0x0

    .line 87
    :goto_0
    const-string p0, "push:self"

    .line 88
    .line 89
    const-string p1, "key_ret"

    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    packed-switch v1, :pswitch_data_0

    .line 93
    .line 94
    .line 95
    goto/16 :goto_5

    .line 96
    .line 97
    :pswitch_0
    if-eqz p3, :cond_c

    .line 98
    .line 99
    :try_start_1
    const-string v1, "key_msg"

    .line 100
    .line 101
    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    check-cast p3, Lcom/cosmos/photon/push/msg/MoMessage;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 106
    .line 107
    if-eqz p3, :cond_c

    .line 108
    .line 109
    new-instance v0, Landroid/os/Bundle;

    .line 110
    .line 111
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    if-nez v1, :cond_5

    .line 119
    .line 120
    return-object v0

    .line 121
    :cond_5
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 122
    .line 123
    .line 124
    invoke-static {p3}, Lcom/cosmos/photon/push/DataProcessor;->onMsgArrivedInner(Lcom/cosmos/photon/push/msg/MoMessage;)V

    .line 125
    .line 126
    .line 127
    new-instance p1, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 128
    .line 129
    invoke-direct {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    iget-wide v1, p3, Lcom/cosmos/photon/push/msg/MoMessage;->time:J

    .line 137
    .line 138
    invoke-virtual {p0, v1, v2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iget-object p2, p3, Lcom/cosmos/photon/push/msg/MoMessage;->data:Ljava/util/HashMap;

    .line 143
    .line 144
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    iget p2, p3, Lcom/cosmos/photon/push/msg/MoMessage;->logType:I

    .line 149
    .line 150
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    sget p2, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED:I

    .line 155
    .line 156
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 164
    .line 165
    .line 166
    return-object v0

    .line 167
    :catch_1
    move-exception p0

    .line 168
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 169
    .line 170
    .line 171
    return-object v2

    .line 172
    :pswitch_1
    if-eqz p3, :cond_c

    .line 173
    .line 174
    :try_start_2
    const-string v1, "key_push_datatype"

    .line 175
    .line 176
    invoke-virtual {p3, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 180
    const-string v3, "key_push_data"

    .line 181
    .line 182
    if-ne v1, p2, :cond_7

    .line 183
    .line 184
    :try_start_3
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Lcom/cosmos/photon/push/notification/MoNotify;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :catchall_0
    move-exception v1

    .line 192
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    :try_start_4
    const-string v0, "key_push_json_data"

    .line 196
    .line 197
    invoke-virtual {p3, v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p3

    .line 201
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-nez v0, :cond_6

    .line 206
    .line 207
    invoke-static {p3}, Lcom/cosmos/photon/push/notification/MoNotify;->fromJson(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/MoNotify;

    .line 208
    .line 209
    .line 210
    move-result-object p3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 211
    goto :goto_1

    .line 212
    :cond_6
    move-object p3, v2

    .line 213
    :goto_1
    move-object v1, p3

    .line 214
    goto :goto_2

    .line 215
    :catchall_1
    move-object v1, v2

    .line 216
    :goto_2
    if-nez v1, :cond_9

    .line 217
    .line 218
    return-object v2

    .line 219
    :cond_7
    if-nez v1, :cond_8

    .line 220
    .line 221
    :try_start_5
    invoke-virtual {p3, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p3

    .line 225
    invoke-static {p3}, Lcom/cosmos/photon/push/notification/MoNotify;->fromJson(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/MoNotify;

    .line 226
    .line 227
    .line 228
    move-result-object v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 229
    goto :goto_3

    .line 230
    :catchall_2
    move-exception p0

    .line 231
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    return-object v2

    .line 235
    :cond_8
    move-object v1, v2

    .line 236
    :cond_9
    :goto_3
    if-eqz v1, :cond_c

    .line 237
    .line 238
    new-instance p3, Landroid/os/Bundle;

    .line 239
    .line 240
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 241
    .line 242
    .line 243
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    if-nez v0, :cond_a

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_a
    invoke-virtual {p3, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 251
    .line 252
    .line 253
    sget-object p1, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 254
    .line 255
    invoke-virtual {p1, v1}, Lcom/cosmos/photon/push/PushMessageReceiver;->onNotificationShow(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-nez p1, :cond_b

    .line 260
    .line 261
    invoke-static {v1}, Lcom/cosmos/photon/push/DataProcessor;->onPushArrivedInner(Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 262
    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_b
    new-instance p1, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 266
    .line 267
    invoke-direct {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 268
    .line 269
    .line 270
    invoke-virtual {p1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    iget-wide v2, v1, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 275
    .line 276
    invoke-virtual {p0, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    iget-object p2, v1, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 281
    .line 282
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iget p2, v1, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 287
    .line 288
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    sget p2, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 293
    .line 294
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    const/4 p2, 0x7

    .line 299
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 307
    .line 308
    .line 309
    :goto_4
    return-object p3

    .line 310
    :catchall_3
    move-exception p0

    .line 311
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 312
    .line 313
    .line 314
    return-object v2

    .line 315
    :pswitch_2
    if-eqz p3, :cond_c

    .line 316
    .line 317
    :try_start_6
    const-string p0, "key_pkg"

    .line 318
    .line 319
    invoke-virtual {p3, p0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 323
    invoke-static {p0}, Lcom/cosmos/photon/push/channel/inner/ClientWorker;->onReceiver(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    goto :goto_5

    .line 327
    :catchall_4
    move-exception p0

    .line 328
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 329
    .line 330
    .line 331
    :cond_c
    :goto_5
    return-object v2

    .line 332
    nop

    .line 333
    :sswitch_data_0
    .sparse-switch
        -0x1ae21c59 -> :sswitch_2
        -0x4d76b2a -> :sswitch_1
        0x105c1a45 -> :sswitch_0
    .end sparse-switch

    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
