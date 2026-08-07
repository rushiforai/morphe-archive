.class public interface abstract Lcom/clevertap/android/sdk/pushnotification/INotificationRenderer;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getActionButtonIconKey()Ljava/lang/String;
.end method

.method public abstract getCollapseKey(Landroid/os/Bundle;)Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getMessage(Landroid/os/Bundle;)Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getTitle(Landroid/os/Bundle;Landroid/content/Context;)Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract renderNotification(Landroid/os/Bundle;Landroid/content/Context;Landroidx/core/app/NotificationCompat$Builder;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;I)Landroidx/core/app/NotificationCompat$Builder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public setActionButtons(Landroid/content/Context;Landroid/os/Bundle;ILandroidx/core/app/NotificationCompat$Builder;Lorg/json/JSONArray;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 17

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v3, p4

    .line 6
    .line 7
    move-object/from16 v4, p5

    .line 8
    .line 9
    const-string v5, "dl"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/clevertap/android/sdk/ManifestInfo;->getInstance(Landroid/content/Context;)Lcom/clevertap/android/sdk/ManifestInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/ManifestInfo;->getIntentServiceName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v6, "No Intent Service found"

    .line 20
    .line 21
    const-class v7, Lcom/clevertap/android/sdk/pushnotification/CTNotificationIntentService;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    goto :goto_1

    .line 30
    :catch_0
    :try_start_1
    sget-object v0, Lcom/clevertap/android/sdk/pushnotification/CTNotificationIntentService;->MAIN_ACTION:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :catch_1
    invoke-static {v6}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    :try_start_2
    sget-object v0, Lcom/clevertap/android/sdk/pushnotification/CTNotificationIntentService;->MAIN_ACTION:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catch_2
    invoke-static {v6}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    const/4 v7, 0x0

    .line 44
    :goto_1
    invoke-static {v1, v7}, Lcom/clevertap/android/sdk/Utils;->isServiceAvailable(Landroid/content/Context;Ljava/lang/Class;)Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v4, :cond_c

    .line 49
    .line 50
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_c

    .line 55
    .line 56
    const/4 v9, 0x0

    .line 57
    :goto_2
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ge v9, v0, :cond_c

    .line 62
    .line 63
    :try_start_3
    invoke-virtual {v4, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v10, "l"

    .line 68
    .line 69
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    invoke-interface/range {p0 .. p0}, Lcom/clevertap/android/sdk/pushnotification/INotificationRenderer;->getActionButtonIconKey()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v12

    .line 81
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v12

    .line 85
    const-string v13, "id"

    .line 86
    .line 87
    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v13

    .line 91
    const-string v14, "ac"

    .line 92
    .line 93
    const/4 v15, 0x1

    .line 94
    invoke-virtual {v0, v14, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 95
    .line 96
    .line 97
    move-result v14

    .line 98
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_1

    .line 103
    .line 104
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    :cond_1
    move/from16 v11, p3

    .line 111
    .line 112
    const/4 v13, 0x0

    .line 113
    goto/16 :goto_b

    .line 114
    .line 115
    :cond_2
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 119
    if-nez v0, :cond_3

    .line 120
    .line 121
    :try_start_4
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v7, "drawable"

    .line 126
    .line 127
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v15

    .line 131
    invoke-virtual {v0, v12, v7, v15}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    move-result v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 135
    goto :goto_5

    .line 136
    :catchall_0
    move-exception v0

    .line 137
    :try_start_5
    new-instance v7, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    const-string v12, "unable to add notification action icon: "

    .line 143
    .line 144
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    goto :goto_4

    .line 162
    :catchall_1
    move-exception v0

    .line 163
    move/from16 v11, p3

    .line 164
    .line 165
    :goto_3
    const/4 v13, 0x0

    .line 166
    goto/16 :goto_c

    .line 167
    .line 168
    :cond_3
    :goto_4
    const/4 v0, 0x0

    .line 169
    :goto_5
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 170
    .line 171
    const/16 v12, 0x1f

    .line 172
    .line 173
    if-ge v7, v12, :cond_4

    .line 174
    .line 175
    if-eqz v14, :cond_4

    .line 176
    .line 177
    if-eqz v6, :cond_4

    .line 178
    .line 179
    const/4 v7, 0x1

    .line 180
    goto :goto_6

    .line 181
    :cond_4
    const/4 v7, 0x0

    .line 182
    :goto_6
    const-string v12, "pt_dismiss_on_click"

    .line 183
    .line 184
    invoke-virtual {v2, v12}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 188
    const-string v15, "true"

    .line 189
    .line 190
    if-nez v7, :cond_5

    .line 191
    .line 192
    :try_start_6
    invoke-static {v2}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;->isForPushTemplates(Landroid/os/Bundle;)Z

    .line 193
    .line 194
    .line 195
    move-result v16

    .line 196
    if-eqz v16, :cond_5

    .line 197
    .line 198
    const-string v8, "remind"

    .line 199
    .line 200
    invoke-virtual {v13, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    if-eqz v8, :cond_5

    .line 205
    .line 206
    if-eqz v12, :cond_5

    .line 207
    .line 208
    invoke-virtual {v12, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result v8

    .line 212
    if-eqz v8, :cond_5

    .line 213
    .line 214
    if-eqz v14, :cond_5

    .line 215
    .line 216
    if-eqz v6, :cond_5

    .line 217
    .line 218
    const/4 v7, 0x1

    .line 219
    :cond_5
    if-nez v7, :cond_6

    .line 220
    .line 221
    invoke-static {v2}, Lcom/clevertap/android/sdk/pushnotification/PushNotificationHandler;->isForPushTemplates(Landroid/os/Bundle;)Z

    .line 222
    .line 223
    .line 224
    move-result v8

    .line 225
    if-eqz v8, :cond_6

    .line 226
    .line 227
    if-eqz v12, :cond_6

    .line 228
    .line 229
    invoke-virtual {v12, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 230
    .line 231
    .line 232
    move-result v8

    .line 233
    if-eqz v8, :cond_6

    .line 234
    .line 235
    if-eqz v14, :cond_6

    .line 236
    .line 237
    if-eqz v6, :cond_6

    .line 238
    .line 239
    const/4 v15, 0x1

    .line 240
    goto :goto_7

    .line 241
    :cond_6
    move v15, v7

    .line 242
    :goto_7
    if-eqz v15, :cond_7

    .line 243
    .line 244
    new-instance v7, Landroid/content/Intent;

    .line 245
    .line 246
    const-string v8, "com.clevertap.PUSH_EVENT"

    .line 247
    .line 248
    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v8

    .line 255
    invoke-virtual {v7, v8}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 256
    .line 257
    .line 258
    const-string v8, "ct_type"

    .line 259
    .line 260
    const-string v12, "com.clevertap.ACTION_BUTTON_CLICK"

    .line 261
    .line 262
    invoke-virtual {v7, v8, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    .line 266
    .line 267
    .line 268
    move-result v8

    .line 269
    if-nez v8, :cond_9

    .line 270
    .line 271
    invoke-virtual {v7, v5, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 272
    .line 273
    .line 274
    goto :goto_8

    .line 275
    :cond_7
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    .line 276
    .line 277
    .line 278
    move-result v7

    .line 279
    if-nez v7, :cond_8

    .line 280
    .line 281
    new-instance v7, Landroid/content/Intent;

    .line 282
    .line 283
    const-string v8, "android.intent.action.VIEW"

    .line 284
    .line 285
    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 286
    .line 287
    .line 288
    move-result-object v11

    .line 289
    invoke-direct {v7, v8, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 290
    .line 291
    .line 292
    invoke-static {v1, v7}, Lcom/clevertap/android/sdk/Utils;->setPackageNameFromResolveInfoList(Landroid/content/Context;Landroid/content/Intent;)V

    .line 293
    .line 294
    .line 295
    goto :goto_8

    .line 296
    :cond_8
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 297
    .line 298
    .line 299
    move-result-object v7

    .line 300
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v8

    .line 304
    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 305
    .line 306
    .line 307
    move-result-object v7

    .line 308
    :cond_9
    :goto_8
    if-eqz v7, :cond_a

    .line 309
    .line 310
    invoke-virtual {v7, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 311
    .line 312
    .line 313
    const-string v8, "wzrk_acts"

    .line 314
    .line 315
    invoke-virtual {v7, v8}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    const-string v8, "actionId"

    .line 319
    .line 320
    invoke-virtual {v7, v8, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 321
    .line 322
    .line 323
    const-string v8, "autoCancel"

    .line 324
    .line 325
    invoke-virtual {v7, v8, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 326
    .line 327
    .line 328
    const-string v8, "wzrk_c2a"

    .line 329
    .line 330
    invoke-virtual {v7, v8, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 331
    .line 332
    .line 333
    const-string v8, "notificationId"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 334
    .line 335
    move/from16 v11, p3

    .line 336
    .line 337
    :try_start_7
    invoke-virtual {v7, v8, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 338
    .line 339
    .line 340
    const/high16 v8, 0x24000000

    .line 341
    .line 342
    invoke-virtual {v7, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 343
    .line 344
    .line 345
    goto :goto_9

    .line 346
    :catchall_2
    move-exception v0

    .line 347
    goto/16 :goto_3

    .line 348
    .line 349
    :cond_a
    move/from16 v11, p3

    .line 350
    .line 351
    :goto_9
    new-instance v8, Ljava/util/Random;

    .line 352
    .line 353
    invoke-direct {v8}, Ljava/util/Random;-><init>()V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v8}, Ljava/util/Random;->nextInt()I

    .line 357
    .line 358
    .line 359
    move-result v8

    .line 360
    const/high16 v12, 0xc000000

    .line 361
    .line 362
    if-eqz v15, :cond_b

    .line 363
    .line 364
    invoke-static {v1, v8, v7, v12}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 365
    .line 366
    .line 367
    move-result-object v7
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 368
    const/4 v13, 0x0

    .line 369
    goto :goto_a

    .line 370
    :cond_b
    const/4 v13, 0x0

    .line 371
    :try_start_8
    invoke-static {v1, v8, v7, v12, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/PendingIntent;

    .line 372
    .line 373
    .line 374
    move-result-object v7

    .line 375
    :goto_a
    invoke-virtual {v3, v0, v10, v7}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 376
    .line 377
    .line 378
    goto :goto_d

    .line 379
    :catchall_3
    move-exception v0

    .line 380
    goto :goto_c

    .line 381
    :goto_b
    const-string v0, "not adding push notification action: action label or id missing"

    .line 382
    .line 383
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 384
    .line 385
    .line 386
    goto :goto_d

    .line 387
    :goto_c
    new-instance v7, Ljava/lang/StringBuilder;

    .line 388
    .line 389
    const-string v8, "error adding notification action : "

    .line 390
    .line 391
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 406
    .line 407
    .line 408
    :goto_d
    add-int/lit8 v9, v9, 0x1

    .line 409
    .line 410
    goto/16 :goto_2

    .line 411
    .line 412
    :cond_c
    return-object v3
.end method

.method public abstract setSmallIcon(ILandroid/content/Context;)V
.end method
