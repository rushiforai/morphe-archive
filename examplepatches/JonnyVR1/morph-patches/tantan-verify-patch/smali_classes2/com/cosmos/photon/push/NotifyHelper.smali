.class public Lcom/cosmos/photon/push/NotifyHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;,
        Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;
    }
.end annotation


# static fields
.field private static emojiPattern:Ljava/util/regex/Pattern; = null

.field private static handler:Landroid/os/Handler; = null

.field private static handlerThread:Landroid/os/HandlerThread; = null

.field private static nm:Landroid/app/NotificationManager; = null

.field private static preNotifyTime:J = 0x0L

.field private static requestCode:I = 0x37


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/cosmos/photon/push/NotifyHelper;->getIconBitmap(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$100(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;JLjava/util/Map;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p10}, Lcom/cosmos/photon/push/NotifyHelper;->sendNotifyAndStatistics(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;JLjava/util/Map;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static cancelNotify(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/cosmos/photon/push/NotifyHelper;->nm:Landroid/app/NotificationManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p0, v1}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    :catch_0
    return-void
.end method

.method private static getIconBitmap(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/cosmos/photon/push/notification/MoNotify;->toPkg:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/cosmos/photon/push/util/Res;->getAppIcon(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static removeEmoji(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget-object v1, Lcom/cosmos/photon/push/NotifyHelper;->emojiPattern:Ljava/util/regex/Pattern;

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    const-string v1, "([\ue000-\ue5ff])"

    .line 11
    .line 12
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sput-object v1, Lcom/cosmos/photon/push/NotifyHelper;->emojiPattern:Ljava/util/regex/Pattern;

    .line 17
    .line 18
    :cond_1
    sget-object v1, Lcom/cosmos/photon/push/NotifyHelper;->emojiPattern:Ljava/util/regex/Pattern;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private static sendNotify(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;)Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;
    .locals 11

    .line 1
    move-object/from16 v1, p8

    .line 2
    .line 3
    move-object/from16 v0, p9

    .line 4
    .line 5
    sget-object v2, Lcom/cosmos/photon/push/NotifyHelper;->nm:Landroid/app/NotificationManager;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const-string v2, "notification"

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Landroid/app/NotificationManager;

    .line 16
    .line 17
    sput-object v2, Lcom/cosmos/photon/push/NotifyHelper;->nm:Landroid/app/NotificationManager;

    .line 18
    .line 19
    :cond_0
    new-instance v2, Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/cosmos/photon/push/notification/NotificationBuilder;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isSound:Z

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    iget-boolean v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isVibrate:Z

    .line 29
    .line 30
    if-eqz v3, :cond_9

    .line 31
    .line 32
    :cond_1
    sget-wide v3, Lcom/cosmos/photon/push/NotifyHelper;->preNotifyTime:J

    .line 33
    .line 34
    const-wide/16 v5, 0x0

    .line 35
    .line 36
    cmp-long v3, v3, v5

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v5

    .line 45
    sget-wide v7, Lcom/cosmos/photon/push/NotifyHelper;->preNotifyTime:J

    .line 46
    .line 47
    sub-long/2addr v5, v7

    .line 48
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(J)J

    .line 49
    .line 50
    .line 51
    move-result-wide v5

    .line 52
    const-wide/16 v7, 0x7d0

    .line 53
    .line 54
    cmp-long v3, v5, v7

    .line 55
    .line 56
    if-gez v3, :cond_2

    .line 57
    .line 58
    invoke-virtual {v2, v4, v4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setSound(Landroid/net/Uri;Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 59
    .line 60
    .line 61
    goto/16 :goto_1

    .line 62
    .line 63
    :cond_2
    invoke-static/range {p6 .. p6}, Lcom/cosmos/photon/push/NotifyHelper;->cancelNotify(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 67
    .line 68
    .line 69
    move-result-wide v5

    .line 70
    sput-wide v5, Lcom/cosmos/photon/push/NotifyHelper;->preNotifyTime:J

    .line 71
    .line 72
    iget-boolean v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isOpenMuteTime:Z

    .line 73
    .line 74
    if-eqz v3, :cond_5

    .line 75
    .line 76
    iget-wide v5, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->startMuteTime:J

    .line 77
    .line 78
    iget-wide v7, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->endMuteTime:J

    .line 79
    .line 80
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const/16 v9, 0xb

    .line 85
    .line 86
    invoke-virtual {v3, v9}, Ljava/util/Calendar;->get(I)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    cmp-long v9, v5, v7

    .line 91
    .line 92
    if-gez v9, :cond_3

    .line 93
    .line 94
    int-to-long v9, v3

    .line 95
    cmp-long v3, v9, v5

    .line 96
    .line 97
    if-ltz v3, :cond_5

    .line 98
    .line 99
    cmp-long v3, v9, v7

    .line 100
    .line 101
    if-gez v3, :cond_5

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_3
    int-to-long v9, v3

    .line 105
    cmp-long v5, v9, v5

    .line 106
    .line 107
    if-ltz v5, :cond_4

    .line 108
    .line 109
    const/16 v5, 0x18

    .line 110
    .line 111
    if-lt v3, v5, :cond_9

    .line 112
    .line 113
    :cond_4
    if-ltz v3, :cond_5

    .line 114
    .line 115
    cmp-long v3, v9, v7

    .line 116
    .line 117
    if-gez v3, :cond_5

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    iget-boolean v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isSound:Z

    .line 121
    .line 122
    const/4 v5, 0x2

    .line 123
    if-eqz v3, :cond_7

    .line 124
    .line 125
    iget-object v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->sound:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-nez v3, :cond_6

    .line 132
    .line 133
    iget-object v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->sound:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p0, v3}, Lcom/cosmos/photon/push/util/Res;->raw(Landroid/content/Context;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    new-instance v6, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v7, "android.resource://"

    .line 142
    .line 143
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v7, "/"

    .line 154
    .line 155
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v2, v3, v4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setSound(Landroid/net/Uri;Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_6
    invoke-static {v5}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-virtual {v2, v3, v4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setSound(Landroid/net/Uri;Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_7
    invoke-virtual {v2, v4, v4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setSound(Landroid/net/Uri;Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 182
    .line 183
    .line 184
    :goto_0
    iget-boolean v3, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isVibrate:Z

    .line 185
    .line 186
    if-eqz v3, :cond_8

    .line 187
    .line 188
    new-array v3, v5, [J

    .line 189
    .line 190
    fill-array-data v3, :array_0

    .line 191
    .line 192
    .line 193
    invoke-virtual {v2, v3}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setVibrate([J)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 194
    .line 195
    .line 196
    :cond_8
    const/16 v3, 0x1f4

    .line 197
    .line 198
    const/16 v4, 0x5dc

    .line 199
    .line 200
    const v5, -0xffff01

    .line 201
    .line 202
    .line 203
    invoke-virtual {v2, v5, v3, v4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setLights(III)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 204
    .line 205
    .line 206
    :cond_9
    :goto_1
    if-eqz p3, :cond_a

    .line 207
    .line 208
    invoke-static {p3}, Lcom/cosmos/photon/push/NotifyHelper;->removeEmoji(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p3

    .line 212
    invoke-virtual {v2, p3}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setTicker(Ljava/lang/CharSequence;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 213
    .line 214
    .line 215
    :cond_a
    if-eqz p5, :cond_b

    .line 216
    .line 217
    invoke-static/range {p5 .. p5}, Lcom/cosmos/photon/push/NotifyHelper;->removeEmoji(Ljava/lang/String;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p3

    .line 221
    goto :goto_2

    .line 222
    :cond_b
    move-object/from16 p3, p5

    .line 223
    .line 224
    :goto_2
    const/4 v3, 0x1

    .line 225
    if-ge p2, v3, :cond_c

    .line 226
    .line 227
    const p2, 0x1080077

    .line 228
    .line 229
    .line 230
    :cond_c
    iget-boolean v4, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->popNotify:Z

    .line 231
    .line 232
    invoke-virtual {v2, v4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setPopNotify(Z)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v2, p4}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setContentTitle(Ljava/lang/CharSequence;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v2, p3}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setContentText(Ljava/lang/CharSequence;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v2, p2}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setIcon(I)V

    .line 242
    .line 243
    .line 244
    iget-boolean p2, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->autoCancel:Z

    .line 245
    .line 246
    invoke-virtual {v2, p2}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setAutoCancel(Z)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2, p1}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setLargeIcon(Landroid/graphics/Bitmap;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 250
    .line 251
    .line 252
    iget-object p1, v0, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->channelId:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v2, p1}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setChannelId(Ljava/lang/String;)Lcom/cosmos/photon/push/notification/NotificationBuilder;

    .line 255
    .line 256
    .line 257
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 258
    .line 259
    const/16 p2, 0x22

    .line 260
    .line 261
    const/high16 p3, 0xc000000

    .line 262
    .line 263
    if-lt p1, p2, :cond_d

    .line 264
    .line 265
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-virtual {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround()Z

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    if-nez p1, :cond_d

    .line 274
    .line 275
    :try_start_0
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-static {p1, v3}, Ll/v250;->a(Landroid/app/ActivityOptions;I)Landroid/app/ActivityOptions;

    .line 280
    .line 281
    .line 282
    sget p2, Lcom/cosmos/photon/push/NotifyHelper;->requestCode:I

    .line 283
    .line 284
    add-int/lit8 v0, p2, 0x1

    .line 285
    .line 286
    sput v0, Lcom/cosmos/photon/push/NotifyHelper;->requestCode:I

    .line 287
    .line 288
    invoke-virtual {p1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-static {p0, p2, v1, p3, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/PendingIntent;

    .line 293
    .line 294
    .line 295
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    goto :goto_3

    .line 297
    :catch_0
    sget p1, Lcom/cosmos/photon/push/NotifyHelper;->requestCode:I

    .line 298
    .line 299
    add-int/lit8 p2, p1, 0x1

    .line 300
    .line 301
    sput p2, Lcom/cosmos/photon/push/NotifyHelper;->requestCode:I

    .line 302
    .line 303
    invoke-static {p0, p1, v1, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    goto :goto_3

    .line 308
    :cond_d
    sget p1, Lcom/cosmos/photon/push/NotifyHelper;->requestCode:I

    .line 309
    .line 310
    add-int/lit8 p2, p1, 0x1

    .line 311
    .line 312
    sput p2, Lcom/cosmos/photon/push/NotifyHelper;->requestCode:I

    .line 313
    .line 314
    invoke-static {p0, p1, v1, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    :goto_3
    invoke-virtual {v2, p0}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->setContentIntent(Landroid/app/PendingIntent;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2}, Lcom/cosmos/photon/push/notification/NotificationBuilder;->getNotification()Landroid/app/Notification;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    if-nez p0, :cond_e

    .line 326
    .line 327
    invoke-static {v3, v1}, Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;->create(ILandroid/content/Intent;)Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    return-object p0

    .line 332
    :cond_e
    if-eqz p7, :cond_f

    .line 333
    .line 334
    const/16 p1, 0x20

    .line 335
    .line 336
    iput p1, p0, Landroid/app/Notification;->flags:I

    .line 337
    .line 338
    :cond_f
    :try_start_1
    sget-object p1, Lcom/cosmos/photon/push/NotifyHelper;->nm:Landroid/app/NotificationManager;

    .line 339
    .line 340
    const/4 p2, 0x0

    .line 341
    move-object/from16 p3, p6

    .line 342
    .line 343
    invoke-static {p1, p3, p2, p0}, Ll/jj5;->h(Landroid/app/NotificationManager;Ljava/lang/String;ILandroid/app/Notification;)V

    .line 344
    .line 345
    .line 346
    invoke-static {p2, v1}, Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;->create(ILandroid/content/Intent;)Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;

    .line 347
    .line 348
    .line 349
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 350
    return-object p0

    .line 351
    :catchall_0
    move-exception v0

    .line 352
    move-object p0, v0

    .line 353
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 354
    .line 355
    .line 356
    invoke-static {v3, v1}, Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;->create(ILandroid/content/Intent;)Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;

    .line 357
    .line 358
    .line 359
    move-result-object p0

    .line 360
    return-object p0

    :array_0
    .array-data 8
        0x32
        0x64
    .end array-data
.end method

.method public static sendNotify(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 11

    .line 361
    new-instance v6, Landroid/content/Intent;

    const-class v0, Lcom/cosmos/photon/push/NotifyClickReceiver;

    invoke-direct {v6, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 362
    const-string v0, "key_push_data"

    invoke-virtual {v6, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 363
    :cond_0
    invoke-virtual {p1}, Lcom/cosmos/photon/push/notification/MoNotify;->toJson()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v1, "key_push_json_data"

    invoke-virtual {v6, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 364
    new-instance v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;

    invoke-direct {v7}, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;-><init>()V

    .line 365
    iget v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->sound:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    iput-boolean v0, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isSound:Z

    .line 366
    iget-object v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->soundType:Ljava/lang/String;

    iput-object v0, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->sound:Ljava/lang/String;

    .line 367
    iget v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->vibrate:I

    if-lez v0, :cond_2

    goto :goto_2

    :cond_2
    move v2, v1

    :goto_2
    iput-boolean v2, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isVibrate:Z

    .line 368
    iput-boolean v1, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->isOpenMuteTime:Z

    .line 369
    iget-boolean v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->autoCancel:Z

    iput-boolean v0, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->autoCancel:Z

    .line 370
    iget-boolean v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->popNotify:Z

    iput-boolean v0, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->popNotify:Z

    .line 371
    iget-object v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->channelId:Ljava/lang/String;

    iput-object v0, v7, Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;->channelId:Ljava/lang/String;

    .line 372
    iget-object v0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 373
    invoke-static {p0, p1}, Lcom/cosmos/photon/push/NotifyHelper;->getIconBitmap(Landroid/content/Context;Lcom/cosmos/photon/push/notification/MoNotify;)Landroid/graphics/Bitmap;

    move-result-object v1

    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    iget-object v2, p1, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/cosmos/photon/push/PushMessageReceiver;->getSmallIcon(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p1, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    iget-object v4, p1, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    iget-object v5, p1, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    iget-wide v8, p1, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    iget-object v10, p1, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    move-object v0, p0

    invoke-static/range {v0 .. v10}, Lcom/cosmos/photon/push/NotifyHelper;->sendNotifyAndStatistics(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;JLjava/util/Map;)V

    return-void

    :cond_3
    move-object v0, p0

    .line 374
    iget-object p0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    const-string v1, "http://"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4

    iget-object p0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    const-string v1, "https://"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4

    .line 375
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget-object v1, p1, Lcom/cosmos/photon/push/notification/MoNotify;->icon:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/cosmos/photon/push/util/Res;->drawable(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 376
    sget-object p0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    iget-object v2, p1, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/cosmos/photon/push/PushMessageReceiver;->getSmallIcon(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p1, Lcom/cosmos/photon/push/notification/MoNotify;->title:Ljava/lang/String;

    iget-object v4, p1, Lcom/cosmos/photon/push/notification/MoNotify;->desc:Ljava/lang/String;

    iget-object v5, p1, Lcom/cosmos/photon/push/notification/MoNotify;->type:Ljava/lang/String;

    iget-wide v8, p1, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    iget-object v10, p1, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    invoke-static/range {v0 .. v10}, Lcom/cosmos/photon/push/NotifyHelper;->sendNotifyAndStatistics(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;JLjava/util/Map;)V

    return-void

    .line 377
    :cond_4
    sget-object p0, Lcom/cosmos/photon/push/NotifyHelper;->handler:Landroid/os/Handler;

    if-nez p0, :cond_5

    .line 378
    new-instance p0, Landroid/os/HandlerThread;

    const-string v1, "mmpush_notify_proc"

    invoke-direct {p0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object p0, Lcom/cosmos/photon/push/NotifyHelper;->handlerThread:Landroid/os/HandlerThread;

    .line 379
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 380
    new-instance p0, Landroid/os/Handler;

    sget-object v1, Lcom/cosmos/photon/push/NotifyHelper;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object p0, Lcom/cosmos/photon/push/NotifyHelper;->handler:Landroid/os/Handler;

    .line 381
    :cond_5
    sget-object p0, Lcom/cosmos/photon/push/NotifyHelper;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/cosmos/photon/push/NotifyHelper$1;

    invoke-direct {v1, p1, v0, v6, v7}, Lcom/cosmos/photon/push/NotifyHelper$1;-><init>(Lcom/cosmos/photon/push/notification/MoNotify;Landroid/content/Context;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private static sendNotifyAndStatistics(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;JLjava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/graphics/Bitmap;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/content/Intent;",
            "Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;",
            "J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v5, p4

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v3, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object/from16 v8, p6

    .line 10
    .line 11
    move-object/from16 v9, p7

    .line 12
    .line 13
    invoke-static/range {v0 .. v9}, Lcom/cosmos/photon/push/NotifyHelper;->sendNotify(Landroid/content/Context;Landroid/graphics/Bitmap;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Lcom/cosmos/photon/push/NotifyHelper$NotifyConfig;)Lcom/cosmos/photon/push/NotifyHelper$NotifyResult;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 18
    .line 19
    invoke-direct {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string p2, "key_push_data"

    .line 23
    .line 24
    invoke-virtual {v8, p2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/cosmos/photon/push/notification/MoNotify;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(Lcom/cosmos/photon/push/notification/MoNotify;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-virtual {p1, p3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    iget p2, p2, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 39
    .line 40
    invoke-virtual {p3, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    move-wide/from16 p3, p8

    .line 45
    .line 46
    invoke-virtual {p2, p3, p4}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    move-object/from16 p3, p10

    .line 51
    .line 52
    invoke-virtual {p2, p3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {p2}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Ll/c050;->a()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_0

    .line 68
    .line 69
    sget p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const/4 p2, 0x6

    .line 76
    invoke-virtual {p0, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    iget-object p2, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast p2, Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-nez p2, :cond_1

    .line 89
    .line 90
    sget p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_SHOWN:I

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    sget p2, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast p0, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p2, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 111
    .line 112
    .line 113
    :goto_0
    invoke-virtual {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method
