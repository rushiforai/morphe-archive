.class public Ll/toh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:I

.field public static final b:I

.field public static final c:I

.field public static d:Ll/c050;

.field public static final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/data/PushMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "#ffffff"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/toh0;->a:I

    .line 8
    .line 9
    const-string v0, "#212121"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Ll/toh0;->b:I

    .line 16
    .line 17
    const-string v0, "#757575"

    .line 18
    .line 19
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Ll/toh0;->c:I

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    sput-object v0, Ll/toh0;->d:Ll/c050;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 29
    .line 30
    invoke-static {v0}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Ll/toh0;->d:Ll/c050;

    .line 35
    .line 36
    invoke-static {}, Ll/sz40;->d()V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object v0, Ll/toh0;->e:Ljava/util/HashMap;

    .line 45
    .line 46
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

.method public static bridge synthetic a()I
    .locals 1

    .line 1
    sget v0, Ll/toh0;->c:I

    return v0
.end method

.method public static bridge synthetic b()I
    .locals 1

    .line 1
    sget v0, Ll/toh0;->b:I

    return v0
.end method

.method public static bridge synthetic c()I
    .locals 1

    .line 1
    sget v0, Ll/toh0;->a:I

    return v0
.end method

.method public static d(Landroid/content/Intent;ZZ)V
    .locals 1

    .line 1
    const-string v0, "bundle_from_notification"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    const-string p1, "bundle_is_idle_push"

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static e(Landroid/content/Intent;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/api/push/PushTrackData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "bundle_push_track_info"

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V
    .locals 17

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    iget-boolean v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/toh0;->e:Ljava/util/HashMap;

    .line 9
    .line 10
    iget v3, v2, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 11
    .line 12
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 21
    .line 22
    invoke-static {v2, v0}, Ll/toh0;->j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/PushMessage;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    :try_start_0
    iget v4, v2, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 30
    .line 31
    sget-object v3, Ll/toh0;->e:Ljava/util/HashMap;

    .line 32
    .line 33
    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    :try_start_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :try_start_2
    const-string v0, "<[^>]+>"

    .line 43
    .line 44
    const/4 v3, 0x2

    .line 45
    invoke-static {v0, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v5, v2, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const-string v6, ""

    .line 56
    .line 57
    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    const/16 v6, 0xa

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    iget-object v7, v2, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    const/4 v8, 0x0

    .line 74
    if-eqz v7, :cond_1

    .line 75
    .line 76
    iget-object v7, v2, Lcom/p1/mobile/putong/data/PushMessage;->ticker:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v7, ""

    .line 83
    .line 84
    invoke-virtual {v0, v7}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    move-object v0, v8

    .line 90
    :goto_0
    sget-object v7, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 91
    .line 92
    invoke-virtual {v7}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 93
    .line 94
    .line 95
    iget-boolean v7, v2, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 96
    .line 97
    if-eqz v7, :cond_2

    .line 98
    .line 99
    sget-object v7, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 100
    .line 101
    invoke-static {v7}, Ll/sz40;->g(Landroid/content/Context;)Landroidx/core/app/NotificationCompat$Builder;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    move v9, v4

    .line 106
    move-object v4, v7

    .line 107
    move v7, v1

    .line 108
    goto :goto_1

    .line 109
    :cond_2
    sget-object v9, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 110
    .line 111
    invoke-static {v9}, Ll/sz40;->f(Landroid/content/Context;)Landroidx/core/app/NotificationCompat$Builder;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    move-object/from16 v16, v9

    .line 116
    .line 117
    move v9, v4

    .line 118
    move-object/from16 v4, v16

    .line 119
    .line 120
    :goto_1
    const/4 v10, 0x0

    .line 121
    if-nez v7, :cond_3

    .line 122
    .line 123
    move v11, v3

    .line 124
    goto :goto_2

    .line 125
    :cond_3
    move v11, v10

    .line 126
    :goto_2
    invoke-virtual {v4, v11}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 127
    .line 128
    .line 129
    move-result-object v11

    .line 130
    if-eqz v7, :cond_4

    .line 131
    .line 132
    move-object v12, v8

    .line 133
    goto :goto_3

    .line 134
    :cond_4
    invoke-static {v2}, Ll/toh0;->l(Lcom/p1/mobile/putong/data/PushMessage;)Landroid/net/Uri;

    .line 135
    .line 136
    .line 137
    move-result-object v12

    .line 138
    :goto_3
    invoke-virtual {v11, v12}, Landroidx/core/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroidx/core/app/NotificationCompat$Builder;

    .line 139
    .line 140
    .line 141
    move-result-object v11

    .line 142
    sget v12, Ll/cbc0;->A0:I

    .line 143
    .line 144
    invoke-virtual {v11, v12}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 145
    .line 146
    .line 147
    move-result-object v11

    .line 148
    iget-boolean v12, v2, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 149
    .line 150
    invoke-virtual {v11, v12}, Landroidx/core/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 151
    .line 152
    .line 153
    move-result-object v11

    .line 154
    invoke-virtual {v11, v1}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 155
    .line 156
    .line 157
    move-result-object v11

    .line 158
    iget-object v12, v2, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v11, v12}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 161
    .line 162
    .line 163
    move-result-object v11

    .line 164
    if-lez v6, :cond_5

    .line 165
    .line 166
    invoke-virtual {v5, v10, v6}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 167
    .line 168
    .line 169
    move-result-object v12

    .line 170
    goto :goto_4

    .line 171
    :cond_5
    move-object v12, v5

    .line 172
    :goto_4
    invoke-virtual {v11, v12}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 173
    .line 174
    .line 175
    move-result-object v11

    .line 176
    if-eqz v7, :cond_6

    .line 177
    .line 178
    :goto_5
    move-object v0, v8

    .line 179
    goto :goto_6

    .line 180
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v12

    .line 184
    if-eqz v12, :cond_7

    .line 185
    .line 186
    goto :goto_5

    .line 187
    :cond_7
    :goto_6
    invoke-virtual {v11, v0}, Landroidx/core/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    move-object/from16 v11, p1

    .line 192
    .line 193
    invoke-virtual {v0, v11}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 194
    .line 195
    .line 196
    invoke-static/range {p2 .. p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_8

    .line 201
    .line 202
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 203
    .line 204
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 205
    .line 206
    .line 207
    move-result-wide v11

    .line 208
    long-to-int v11, v11

    .line 209
    const/high16 v12, 0x2000000

    .line 210
    .line 211
    move-object/from16 v13, p2

    .line 212
    .line 213
    invoke-static {v0, v11, v13, v12}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {v4, v0}, Landroidx/core/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 218
    .line 219
    .line 220
    :cond_8
    const-string v0, "OPPO"

    .line 221
    .line 222
    sget-object v11, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_9

    .line 229
    .line 230
    if-eqz v7, :cond_9

    .line 231
    .line 232
    new-array v0, v10, [J

    .line 233
    .line 234
    invoke-virtual {v4, v0}, Landroidx/core/app/NotificationCompat$Builder;->setVibrate([J)Landroidx/core/app/NotificationCompat$Builder;

    .line 235
    .line 236
    .line 237
    :cond_9
    iget-wide v12, v2, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 238
    .line 239
    const-wide/16 v14, 0x0

    .line 240
    .line 241
    cmpl-double v0, v12, v14

    .line 242
    .line 243
    if-lez v0, :cond_a

    .line 244
    .line 245
    double-to-long v12, v12

    .line 246
    invoke-virtual {v4, v12, v13}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    .line 247
    .line 248
    .line 249
    :cond_a
    if-eqz v11, :cond_b

    .line 250
    .line 251
    const-string v0, "oppo"

    .line 252
    .line 253
    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v10

    .line 257
    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_c

    .line 262
    .line 263
    :cond_b
    iget v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 264
    .line 265
    if-lez v0, :cond_c

    .line 266
    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .line 271
    .line 272
    iget v10, v2, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 273
    .line 274
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v10, ""

    .line 278
    .line 279
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {v4, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 287
    .line 288
    .line 289
    :cond_c
    invoke-static/range {p3 .. p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    if-eqz v0, :cond_d

    .line 294
    .line 295
    move-object/from16 v0, p3

    .line 296
    .line 297
    invoke-virtual {v4, v0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(Landroidx/core/app/NotificationCompat$Action;)Landroidx/core/app/NotificationCompat$Builder;

    .line 298
    .line 299
    .line 300
    :cond_d
    invoke-static/range {p4 .. p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    if-eqz v0, :cond_e

    .line 305
    .line 306
    move-object/from16 v0, p4

    .line 307
    .line 308
    invoke-virtual {v4, v0}, Landroidx/core/app/NotificationCompat$Builder;->addAction(Landroidx/core/app/NotificationCompat$Action;)Landroidx/core/app/NotificationCompat$Builder;

    .line 309
    .line 310
    .line 311
    :cond_e
    iget v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->priority:I

    .line 312
    .line 313
    invoke-static {v0}, Ll/toh0;->n(I)I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    const/16 v10, 0x63

    .line 318
    .line 319
    const/16 v12, 0x9c4

    .line 320
    .line 321
    const/16 v13, 0x3e8

    .line 322
    .line 323
    const v14, -0xff0100

    .line 324
    .line 325
    .line 326
    if-ne v0, v10, :cond_f

    .line 327
    .line 328
    invoke-virtual {v4, v14, v13, v12}, Landroidx/core/app/NotificationCompat$Builder;->setLights(III)Landroidx/core/app/NotificationCompat$Builder;

    .line 329
    .line 330
    .line 331
    goto :goto_7

    .line 332
    :cond_f
    invoke-virtual {v4, v0}, Landroidx/core/app/NotificationCompat$Builder;->setPriority(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 333
    .line 334
    .line 335
    if-eqz v0, :cond_10

    .line 336
    .line 337
    if-eq v0, v1, :cond_10

    .line 338
    .line 339
    if-ne v0, v3, :cond_11

    .line 340
    .line 341
    :cond_10
    invoke-virtual {v4, v14, v13, v12}, Landroidx/core/app/NotificationCompat$Builder;->setLights(III)Landroidx/core/app/NotificationCompat$Builder;

    .line 342
    .line 343
    .line 344
    :cond_11
    :goto_7
    invoke-static {}, Ll/ilb0;->c()Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    if-eqz v0, :cond_12

    .line 349
    .line 350
    iget-object v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 351
    .line 352
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    if-eqz v0, :cond_12

    .line 357
    .line 358
    iget-object v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 359
    .line 360
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 361
    .line 362
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    if-nez v0, :cond_12

    .line 367
    .line 368
    const-string v0, "Xiaomi"

    .line 369
    .line 370
    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    if-eqz v0, :cond_13

    .line 375
    .line 376
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 377
    .line 378
    const/16 v3, 0x1b

    .line 379
    .line 380
    if-lt v0, v3, :cond_12

    .line 381
    .line 382
    goto :goto_8

    .line 383
    :cond_12
    move-object v3, v4

    .line 384
    move-object v0, v5

    .line 385
    move v5, v7

    .line 386
    move v4, v9

    .line 387
    goto :goto_9

    .line 388
    :cond_13
    :goto_8
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 389
    .line 390
    iget-object v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 391
    .line 392
    iget-object v10, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 393
    .line 394
    new-instance v0, Ll/toh0$a;

    .line 395
    .line 396
    move-object v3, v2

    .line 397
    move-object v2, v5

    .line 398
    move v1, v6

    .line 399
    move v6, v7

    .line 400
    move v5, v9

    .line 401
    invoke-direct/range {v0 .. v6}, Ll/toh0$a;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Landroidx/core/app/NotificationCompat$Builder;IZ)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {v8, v10, v0}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 405
    .line 406
    .line 407
    return-void

    .line 408
    :goto_9
    iget v6, v2, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 409
    .line 410
    if-le v6, v1, :cond_14

    .line 411
    .line 412
    new-instance v1, Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 413
    .line 414
    invoke-direct {v1}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 415
    .line 416
    .line 417
    iget-object v6, v2, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 418
    .line 419
    invoke-virtual {v1, v6}, Landroidx/core/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    new-instance v6, Ljava/lang/StringBuilder;

    .line 424
    .line 425
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 426
    .line 427
    .line 428
    iget v7, v2, Lcom/p1/mobile/putong/data/PushMessage;->counter:I

    .line 429
    .line 430
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    const-string v7, ""

    .line 434
    .line 435
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v6

    .line 442
    invoke-virtual {v1, v6}, Landroidx/core/app/NotificationCompat$BigTextStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 443
    .line 444
    .line 445
    move-result-object v1

    .line 446
    invoke-virtual {v1, v0}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    goto :goto_a

    .line 451
    :cond_14
    new-instance v1, Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 452
    .line 453
    invoke-direct {v1}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 454
    .line 455
    .line 456
    invoke-virtual {v1, v0}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    :goto_a
    invoke-virtual {v3, v0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 461
    .line 462
    .line 463
    iget-object v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 464
    .line 465
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    if-eqz v0, :cond_17

    .line 470
    .line 471
    iget-object v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 472
    .line 473
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 474
    .line 475
    .line 476
    move-result v0

    .line 477
    if-nez v0, :cond_17

    .line 478
    .line 479
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 480
    .line 481
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 482
    .line 483
    .line 484
    move-result v0

    .line 485
    if-eqz v0, :cond_17

    .line 486
    .line 487
    const-string v0, "conversation.group"

    .line 488
    .line 489
    iget-object v1, v2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 490
    .line 491
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 492
    .line 493
    .line 494
    move-result v0

    .line 495
    if-eqz v0, :cond_15

    .line 496
    .line 497
    :goto_b
    move-object v1, v8

    .line 498
    goto :goto_c

    .line 499
    :cond_15
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 500
    .line 501
    invoke-virtual {v0}, Ll/cmb0;->N()Z

    .line 502
    .line 503
    .line 504
    move-result v0

    .line 505
    if-eqz v0, :cond_16

    .line 506
    .line 507
    iget v0, v2, Lcom/p1/mobile/putong/data/PushMessage;->stackId:I

    .line 508
    .line 509
    add-int/lit16 v0, v0, -0x2710

    .line 510
    .line 511
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v0

    .line 515
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 516
    .line 517
    invoke-interface {v1, v0}, Ll/bn5;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 518
    .line 519
    .line 520
    move-result-object v8

    .line 521
    goto :goto_b

    .line 522
    :cond_16
    iget-object v8, v2, Lcom/p1/mobile/putong/data/PushMessage;->user:Lcom/p1/mobile/putong/data/User;

    .line 523
    .line 524
    goto :goto_b

    .line 525
    :goto_c
    iget-object v6, v2, Lcom/p1/mobile/putong/data/PushMessage;->primaryPicture:Ljava/lang/String;

    .line 526
    .line 527
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 528
    .line 529
    new-instance v0, Ll/toh0$b;

    .line 530
    .line 531
    invoke-direct/range {v0 .. v5}, Ll/toh0$b;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/PushMessage;Landroidx/core/app/NotificationCompat$Builder;IZ)V

    .line 532
    .line 533
    .line 534
    invoke-virtual {v7, v6, v0}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 535
    .line 536
    .line 537
    return-void

    .line 538
    :cond_17
    invoke-static {v2, v8, v3, v4, v5}, Ll/toh0;->m(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;IZ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 539
    .line 540
    .line 541
    return-void

    .line 542
    :catchall_0
    move-exception v0

    .line 543
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 544
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 545
    :catch_0
    move-exception v0

    .line 546
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 547
    .line 548
    .line 549
    return-void
.end method

.method public static g(I)V
    .locals 2

    .line 1
    sget-object v0, Ll/toh0;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    sget-object v1, Ll/toh0;->d:Ll/c050;

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ll/c050;->b(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public static h()V
    .locals 2

    .line 1
    sget-object v0, Ll/toh0;->d:Ll/c050;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/c050;->d()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/toh0;->e:Ljava/util/HashMap;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 10
    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v1

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw v1
.end method

.method public static i(Landroid/content/Intent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "bundle_from_notification"

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    :cond_1
    return v2
.end method

.method public static j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/data/PushMessage;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessage;->clone()Lcom/p1/mobile/putong/data/PushMessage;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 12
    .line 13
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silentAggregation:Z

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 16
    .line 17
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

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
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 38
    .line 39
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->value:Ljava/lang/CharSequence;

    .line 40
    .line 41
    :cond_0
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/PushMessage;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    if-nez p0, :cond_2

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_2
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method public static k(Ljava/lang/String;Ljava/lang/Class;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/BroadcastReceiver;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static l(Lcom/p1/mobile/putong/data/PushMessage;)Landroid/net/Uri;
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;IZ)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-eqz p4, :cond_6

    .line 8
    .line 9
    iget-boolean p4, p0, Lcom/p1/mobile/putong/data/PushMessage;->isNewUiCustom:Z

    .line 10
    .line 11
    if-eqz p4, :cond_6

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-eqz p4, :cond_6

    .line 18
    .line 19
    const-string p4, "superLike.received"

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_0

    .line 28
    .line 29
    iget-object p4, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 30
    .line 31
    iget-object p4, p4, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0, p1, p2, p3, p4}, Ll/toh0;->o(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 38
    .line 39
    iget-object p4, p4, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p4, :cond_4

    .line 42
    .line 43
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result p4

    .line 47
    if-eqz p4, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    sget-object p4, Ll/uqb0;->c0:Ll/bn5;

    .line 51
    .line 52
    invoke-interface {p4}, Ll/bn5;->signedIn_()Z

    .line 53
    .line 54
    .line 55
    move-result p4

    .line 56
    if-eqz p4, :cond_3

    .line 57
    .line 58
    iget-object p4, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 59
    .line 60
    iget-object p4, p4, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {}, Ll/l51;->D()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 69
    .line 70
    invoke-interface {v0, p4}, Ll/bn5;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 76
    .line 77
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 78
    .line 79
    invoke-virtual {v0, p4}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    check-cast p4, Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    :goto_0
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p0, p1, p2, p3, p4}, Ll/toh0;->o(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    invoke-static {p0, p1, p2, p3, v0}, Ll/toh0;->o(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    :goto_1
    iget-object p4, p0, Lcom/p1/mobile/putong/data/PushMessage;->user:Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    if-eqz p4, :cond_5

    .line 98
    .line 99
    iget-object v0, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 100
    .line 101
    :cond_5
    invoke-static {p0, p1, p2, p3, v0}, Ll/toh0;->o(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;ILjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    invoke-static {p0, p1, p2, p3, v0}, Ll/toh0;->o(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static n(I)I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_3

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p0, v1, :cond_2

    .line 6
    .line 7
    const/4 v2, 0x4

    .line 8
    if-eq p0, v2, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x5

    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    return v1

    .line 16
    :cond_1
    return v0

    .line 17
    :cond_2
    const/4 p0, -0x1

    .line 18
    return p0

    .line 19
    :cond_3
    const/4 p0, -0x2

    .line 20
    return p0
.end method

.method public static o(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {p0, p4}, Ll/jzb;->i(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Landroid/widget/RemoteViews;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget p4, Ll/ycc0;->Z:I

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 20
    .line 21
    const/high16 v1, 0x42300000    # 44.0f

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 28
    .line 29
    const/high16 v2, 0x41b00000    # 22.0f

    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {p1, v0, v1}, Ll/g23;->a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p4, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setCustomBigContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    .line 46
    .line 47
    .line 48
    new-instance p0, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;

    .line 49
    .line 50
    invoke-direct {p0}, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-string p4, "superLike.received"

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$Builder;

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    invoke-virtual {p2}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p1, p0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_2

    .line 81
    .line 82
    const-string p1, "samsung"

    .line 83
    .line 84
    sget-object p2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    sget-object p1, Ll/toh0;->d:Ll/c050;

    .line 90
    .line 91
    invoke-virtual {p1, p3}, Ll/c050;->b(I)V

    .line 92
    .line 93
    .line 94
    :cond_2
    sget-object p1, Ll/toh0;->d:Ll/c050;

    .line 95
    .line 96
    invoke-virtual {p1, p3, p0}, Ll/c050;->g(ILandroid/app/Notification;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static p(I)Z
    .locals 1

    .line 1
    sget-object v0, Ll/toh0;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static q()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    sget-object v1, Ll/toh0;->e:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static r(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "wrapped_intent"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    new-instance v0, Ljava/lang/Throwable;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "Sysnotif: e"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-direct {v0, p0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public static s()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    const-string v1, "audio"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/media/AudioManager;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 12
    .line 13
    const-string v2, "vibrator"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/os/Vibrator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-wide/16 v2, 0x64

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static t(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const/high16 v1, 0x10000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v1, "wrapped_intent"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    return-object v0
.end method
