.class public Ll/er60;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ll/er60;

.field public static b:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static B(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ll/pf60;

    .line 6
    .line 7
    const-string v1, "moment_type"

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/pf60;

    .line 13
    .line 14
    const-string v1, "moment_id"

    .line 15
    .line 16
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/pf60;

    .line 22
    .line 23
    const-string v2, "owner_id"

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/pf60;

    .line 31
    .line 32
    const-string v3, "receiver_user_id"

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 35
    .line 36
    invoke-direct {v2, v3, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ll/pf60;

    .line 40
    .line 41
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-string p2, ""

    .line 51
    .line 52
    :goto_0
    const-string v3, "moments_user_id"

    .line 53
    .line 54
    invoke-direct {p1, v3, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    filled-new-array {v0, p0, v1, v2, p1}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static D(Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "topic_latest"

    .line 18
    .line 19
    const-string v2, "qa_latest"

    .line 20
    .line 21
    const-string v3, "push"

    .line 22
    .line 23
    const-string v4, "from_activity_tab_two"

    .line 24
    .line 25
    const-string v5, "from_activity_tab_one"

    .line 26
    .line 27
    const-string v6, "p_live_moment"

    .line 28
    .line 29
    const-string v7, "qa_recommend"

    .line 30
    .line 31
    const-string v8, "topic_recommend"

    .line 32
    .line 33
    const-string v9, "chat"

    .line 34
    .line 35
    const/4 v10, -0x1

    .line 36
    sparse-switch v0, :sswitch_data_0

    .line 37
    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :sswitch_0
    const-string v0, "activities"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    const/16 v10, 0x1c

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :sswitch_1
    const-string v0, "from_topic_official"

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_2

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_2
    const/16 v10, 0x1b

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :sswitch_2
    const-string v0, "from_nearby_focus"

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :cond_3
    const/16 v10, 0x1a

    .line 80
    .line 81
    goto/16 :goto_0

    .line 82
    .line 83
    :sswitch_3
    const-string v0, "from_poi_aggregation"

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-nez p0, :cond_4

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :cond_4
    const/16 v10, 0x19

    .line 94
    .line 95
    goto/16 :goto_0

    .line 96
    .line 97
    :sswitch_4
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_5

    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :cond_5
    const/16 v10, 0x18

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :sswitch_5
    const-string v0, "from_discover_dating"

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-nez p0, :cond_6

    .line 116
    .line 117
    goto/16 :goto_0

    .line 118
    .line 119
    :cond_6
    const/16 v10, 0x17

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :sswitch_6
    const-string v0, "from_h5_topic_aggregation"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_7

    .line 130
    .line 131
    goto/16 :goto_0

    .line 132
    .line 133
    :cond_7
    const/16 v10, 0x16

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_7
    const-string v0, "push_new_moment"

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-nez p0, :cond_8

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_8
    const/16 v10, 0x15

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :sswitch_8
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_9

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_9
    const/16 v10, 0x14

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_9
    const-string v0, "p_chat_view"

    .line 164
    .line 165
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-nez p0, :cond_a

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_a
    const/16 v10, 0x13

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_a
    const-string v0, "from_nearby_falls_feed"

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-nez p0, :cond_b

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_b
    const/16 v10, 0x12

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_b
    const-string v0, "aggregate_page"

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-nez p0, :cond_c

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_c
    const/16 v10, 0x11

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_c
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-nez p0, :cond_d

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :cond_d
    const/16 v10, 0x10

    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :sswitch_d
    invoke-virtual {p0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-nez p0, :cond_e

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :cond_e
    const/16 v10, 0xf

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_e
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    if-nez p0, :cond_f

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :cond_f
    const/16 v10, 0xe

    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :sswitch_f
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-nez p0, :cond_10

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_10
    const/16 v10, 0xd

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_10
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-nez p0, :cond_11

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :cond_11
    const/16 v10, 0xc

    .line 262
    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :sswitch_11
    const-string v0, "from_profile"

    .line 266
    .line 267
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-nez p0, :cond_12

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :cond_12
    const/16 v10, 0xb

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_12
    const-string v0, "from_topic_nearby_header"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    if-nez p0, :cond_13

    .line 286
    .line 287
    goto/16 :goto_0

    .line 288
    .line 289
    :cond_13
    const/16 v10, 0xa

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_13
    const-string v0, "from_topic_aggregation"

    .line 294
    .line 295
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    if-nez p0, :cond_14

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :cond_14
    const/16 v10, 0x9

    .line 304
    .line 305
    goto/16 :goto_0

    .line 306
    .line 307
    :sswitch_14
    const-string v0, "my_tab"

    .line 308
    .line 309
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    if-nez p0, :cond_15

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :cond_15
    const/16 v10, 0x8

    .line 318
    .line 319
    goto :goto_0

    .line 320
    :sswitch_15
    const-string v0, "from_qa_topic_aggregation"

    .line 321
    .line 322
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result p0

    .line 326
    if-nez p0, :cond_16

    .line 327
    .line 328
    goto :goto_0

    .line 329
    :cond_16
    const/4 v10, 0x7

    .line 330
    goto :goto_0

    .line 331
    :sswitch_16
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result p0

    .line 335
    if-nez p0, :cond_17

    .line 336
    .line 337
    goto :goto_0

    .line 338
    :cond_17
    const/4 v10, 0x6

    .line 339
    goto :goto_0

    .line 340
    :sswitch_17
    const-string v0, "photo_album_activities"

    .line 341
    .line 342
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 343
    .line 344
    .line 345
    move-result p0

    .line 346
    if-nez p0, :cond_18

    .line 347
    .line 348
    goto :goto_0

    .line 349
    :cond_18
    const/4 v10, 0x5

    .line 350
    goto :goto_0

    .line 351
    :sswitch_18
    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p0

    .line 355
    if-nez p0, :cond_19

    .line 356
    .line 357
    goto :goto_0

    .line 358
    :cond_19
    const/4 v10, 0x4

    .line 359
    goto :goto_0

    .line 360
    :sswitch_19
    const-string v0, "from_activities_moment"

    .line 361
    .line 362
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    move-result p0

    .line 366
    if-nez p0, :cond_1a

    .line 367
    .line 368
    goto :goto_0

    .line 369
    :cond_1a
    const/4 v10, 0x3

    .line 370
    goto :goto_0

    .line 371
    :sswitch_1a
    const-string v0, "from_album"

    .line 372
    .line 373
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result p0

    .line 377
    if-nez p0, :cond_1b

    .line 378
    .line 379
    goto :goto_0

    .line 380
    :cond_1b
    const/4 v10, 0x2

    .line 381
    goto :goto_0

    .line 382
    :sswitch_1b
    const-string v0, "from_discover_discussion"

    .line 383
    .line 384
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result p0

    .line 388
    if-nez p0, :cond_1c

    .line 389
    .line 390
    goto :goto_0

    .line 391
    :cond_1c
    const/4 v10, 0x1

    .line 392
    goto :goto_0

    .line 393
    :sswitch_1c
    const-string v0, "from_no_topic_aggregation_list"

    .line 394
    .line 395
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result p0

    .line 399
    if-nez p0, :cond_1d

    .line 400
    .line 401
    goto :goto_0

    .line 402
    :cond_1d
    const/4 v10, 0x0

    .line 403
    :goto_0
    packed-switch v10, :pswitch_data_0

    .line 404
    .line 405
    .line 406
    const-string p0, "other"

    .line 407
    .line 408
    return-object p0

    .line 409
    :pswitch_0
    const-string p0, "p_follow"

    .line 410
    .line 411
    return-object p0

    .line 412
    :pswitch_1
    const-string p0, "p_poi_detail"

    .line 413
    .line 414
    return-object p0

    .line 415
    :pswitch_2
    return-object v1

    .line 416
    :pswitch_3
    const-string p0, "p_discover_dating"

    .line 417
    .line 418
    return-object p0

    .line 419
    :pswitch_4
    return-object v2

    .line 420
    :pswitch_5
    return-object v9

    .line 421
    :pswitch_6
    const-string p0, "nearby"

    .line 422
    .line 423
    return-object p0

    .line 424
    :pswitch_7
    const-string p0, "music"

    .line 425
    .line 426
    return-object p0

    .line 427
    :pswitch_8
    return-object v3

    .line 428
    :pswitch_9
    return-object v9

    .line 429
    :pswitch_a
    invoke-static {v4}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    return-object p0

    .line 434
    :pswitch_b
    invoke-static {v5}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object p0

    .line 438
    return-object p0

    .line 439
    :pswitch_c
    return-object v6

    .line 440
    :pswitch_d
    return-object v7

    .line 441
    :pswitch_e
    return-object v8

    .line 442
    :pswitch_f
    const-string p0, "activity"

    .line 443
    .line 444
    return-object p0

    .line 445
    :pswitch_10
    const-string p0, "album"

    .line 446
    .line 447
    return-object p0

    .line 448
    :pswitch_11
    const-string p0, "p_discover_discussion"

    .line 449
    .line 450
    return-object p0

    .line 451
    :pswitch_12
    const-string p0, "topic_detail"

    .line 452
    .line 453
    return-object p0

    .line 454
    nop

    .line 455
    :sswitch_data_0
    .sparse-switch
        -0x778b4f2c -> :sswitch_1c
        -0x74d799d7 -> :sswitch_1b
        -0x6bf3ee66 -> :sswitch_1a
        -0x63ad66c3 -> :sswitch_19
        -0x61919654 -> :sswitch_18
        -0x6173e9d6 -> :sswitch_17
        -0x4db73ab3 -> :sswitch_16
        -0x45ca9728 -> :sswitch_15
        -0x3f29b97e -> :sswitch_14
        -0x3ed15183 -> :sswitch_13
        -0x2d58bad8 -> :sswitch_12
        -0x1a4701ec -> :sswitch_11
        -0x14049c9c -> :sswitch_10
        -0xf4fc67f -> :sswitch_f
        -0xf4fb299 -> :sswitch_e
        0x2e9358 -> :sswitch_d
        0x34af1a -> :sswitch_c
        0x101dd0f -> :sswitch_b
        0x13a81d90 -> :sswitch_a
        0x2be0e61d -> :sswitch_9
        0x2dcf8c96 -> :sswitch_8
        0x323ad3c4 -> :sswitch_7
        0x3c3c1255 -> :sswitch_6
        0x41382f6c -> :sswitch_5
        0x47385c97 -> :sswitch_4
        0x490c71d8 -> :sswitch_3
        0x4aa45d8d -> :sswitch_2
        0x5b0c3130 -> :sswitch_1
        0x7a1b3bed -> :sswitch_0
    .end sparse-switch

    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_f
        :pswitch_d
        :pswitch_12
        :pswitch_10
        :pswitch_12
        :pswitch_12
        :pswitch_10
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_8
        :pswitch_12
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_12
        :pswitch_f
    .end packed-switch
.end method

.method public static w()Ll/er60;
    .locals 2

    .line 1
    sget-object v0, Ll/er60;->a:Ll/er60;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/er60;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/er60;->a:Ll/er60;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/er60;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/er60;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/er60;->a:Ll/er60;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/er60;->a:Ll/er60;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final A()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->H1:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->momentValue:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, ""

    .line 25
    .line 26
    return-object p0
.end method

.method public final C(Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 11
    .line 12
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 13
    .line 14
    if-lez v1, :cond_5

    .line 15
    .line 16
    if-gtz p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    invoke-static {}, Ll/bnl0;->w0()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    div-float/2addr v0, v2

    .line 30
    int-to-float v1, v1

    .line 31
    int-to-float p1, p1

    .line 32
    div-float/2addr v1, p1

    .line 33
    const/high16 p1, 0x3f800000    # 1.0f

    .line 34
    .line 35
    sub-float p1, v1, p1

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/high16 v2, 0x3f400000    # 0.75f

    .line 42
    .line 43
    sub-float v2, v1, v2

    .line 44
    .line 45
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/high16 v3, 0x3f100000    # 0.5625f

    .line 50
    .line 51
    sub-float v3, v1, v3

    .line 52
    .line 53
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    sub-float/2addr v1, v0

    .line 58
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v1, 0x4

    .line 63
    new-array v1, v1, [F

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    aput p1, v1, v4

    .line 67
    .line 68
    const/4 v4, 0x1

    .line 69
    aput v2, v1, v4

    .line 70
    .line 71
    const/4 v4, 0x2

    .line 72
    aput v3, v1, v4

    .line 73
    .line 74
    const/4 v4, 0x3

    .line 75
    aput v0, v1, v4

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ll/er60;->x([F)F

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    cmpl-float p1, p0, p1

    .line 82
    .line 83
    if-nez p1, :cond_2

    .line 84
    .line 85
    const-string p0, "1.1"

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_2
    cmpl-float p1, p0, v2

    .line 89
    .line 90
    if-nez p1, :cond_3

    .line 91
    .line 92
    const-string p0, "3.4"

    .line 93
    .line 94
    return-object p0

    .line 95
    :cond_3
    cmpl-float p0, p0, v3

    .line 96
    .line 97
    if-nez p0, :cond_4

    .line 98
    .line 99
    const-string p0, "9.16"

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_4
    const-string p0, "full"

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_5
    :goto_0
    return-object v0
.end method

.method public E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;
    .locals 1

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
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/er60;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public F(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const-string p0, "link"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "H5"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    return-object p1

    .line 19
    :cond_1
    const-string p0, ""

    .line 20
    .line 21
    return-object p0
.end method

.method public G(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, "0"

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/jka;->y7(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const-string p0, "1"

    .line 25
    .line 26
    :cond_1
    :goto_0
    return-object p0
.end method

.method public final H(Ljava/util/ArrayList;IIZLcom/p1/mobile/putong/feed/data/Moment;ZLjava/util/Map;)Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;IIZ",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p5, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    xor-int/lit8 v3, v2, 0x1

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    :try_start_0
    const-string v5, "code"

    .line 18
    .line 19
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {v1, v5, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string p2, "is_from_photo_to_video"

    .line 27
    .line 28
    invoke-virtual {v1, p2, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string p2, "is_anonymous"

    .line 32
    .line 33
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    const-string p2, "moment_id"

    .line 37
    .line 38
    iget-object p3, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    const-string p2, "have_message"

    .line 44
    .line 45
    iget-object p3, p5, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    xor-int/lit8 p3, p3, 0x1

    .line 52
    .line 53
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    const-string p2, "is_topic"

    .line 57
    .line 58
    invoke-virtual {v1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    const-string p2, "topic_id"

    .line 62
    .line 63
    if-nez v2, :cond_0

    .line 64
    .line 65
    iget-object p3, p5, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    check-cast p3, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 72
    .line 73
    iget-object p3, p3, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catch_0
    move-exception p2

    .line 77
    goto :goto_3

    .line 78
    :cond_0
    move-object p3, v0

    .line 79
    :goto_0
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    const-string p2, "posted_source"

    .line 83
    .line 84
    iget-object p3, p5, Lcom/p1/mobile/putong/feed/data/Moment;->from:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p3, :cond_1

    .line 87
    .line 88
    move-object p3, v0

    .line 89
    :cond_1
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    iget-boolean p2, p5, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 93
    .line 94
    if-eqz p2, :cond_3

    .line 95
    .line 96
    const-string p2, "newuser_checkin_change_content"

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/er60;->A()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    iget-object p5, p5, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p3, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p3

    .line 108
    if-eqz p3, :cond_2

    .line 109
    .line 110
    const-string p3, "0"

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_2
    const-string p3, "1"

    .line 114
    .line 115
    :goto_1
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    :cond_3
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_4

    .line 123
    .line 124
    invoke-interface {p7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    if-eqz p3, :cond_4

    .line 133
    .line 134
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    .line 135
    .line 136
    .line 137
    move-result p3

    .line 138
    if-nez p3, :cond_4

    .line 139
    .line 140
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    if-eqz p3, :cond_4

    .line 149
    .line 150
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    check-cast p3, Ljava/lang/String;

    .line 155
    .line 156
    invoke-interface {p7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p5

    .line 160
    invoke-virtual {v1, p3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :goto_3
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    :cond_4
    const-string p2, "moment_type"

    .line 168
    .line 169
    if-eqz p4, :cond_5

    .line 170
    .line 171
    :try_start_1
    const-string p3, "qa"

    .line 172
    .line 173
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :catch_1
    move-exception p2

    .line 178
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    goto :goto_5

    .line 182
    :cond_5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 183
    .line 184
    .line 185
    move-result p3

    .line 186
    if-eqz p3, :cond_6

    .line 187
    .line 188
    :try_start_2
    const-string p3, "word"

    .line 189
    .line 190
    invoke-virtual {v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 191
    .line 192
    .line 193
    :goto_4
    return-object v1

    .line 194
    :catch_2
    move-exception p2

    .line 195
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    :cond_6
    :goto_5
    if-eqz p1, :cond_7

    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    goto :goto_6

    .line 205
    :cond_7
    move p2, v4

    .line 206
    :goto_6
    move p3, v4

    .line 207
    :goto_7
    if-ge p3, p2, :cond_b

    .line 208
    .line 209
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object p4

    .line 213
    check-cast p4, Lcom/p1/mobile/putong/data/Media;

    .line 214
    .line 215
    iget-object p5, p4, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 216
    .line 217
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p5

    .line 221
    if-eqz p5, :cond_a

    .line 222
    .line 223
    iget-object p5, p4, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 224
    .line 225
    iget-object p5, p5, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result p5

    .line 231
    if-eqz p5, :cond_a

    .line 232
    .line 233
    instance-of p5, p4, Lcom/p1/mobile/putong/data/Video;

    .line 234
    .line 235
    if-eqz p5, :cond_8

    .line 236
    .line 237
    move-object p5, p4

    .line 238
    check-cast p5, Lcom/p1/mobile/putong/data/Video;

    .line 239
    .line 240
    iget-object p5, p5, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 241
    .line 242
    invoke-virtual {p0, p5}, Ll/er60;->C(Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p5

    .line 246
    goto :goto_8

    .line 247
    :cond_8
    move-object p5, v0

    .line 248
    :goto_8
    instance-of p6, p4, Lcom/p1/mobile/putong/data/Picture;

    .line 249
    .line 250
    if-eqz p6, :cond_9

    .line 251
    .line 252
    move-object p5, p4

    .line 253
    check-cast p5, Lcom/p1/mobile/putong/data/Picture;

    .line 254
    .line 255
    invoke-virtual {p0, p5}, Ll/er60;->C(Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p5

    .line 259
    :cond_9
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 260
    .line 261
    iput-object p5, p4, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 262
    .line 263
    :cond_a
    add-int/lit8 p3, p3, 0x1

    .line 264
    .line 265
    goto :goto_7

    .line 266
    :cond_b
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 271
    .line 272
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/Media;->newBuildMediaLogParmas(Lorg/json/JSONObject;)V

    .line 273
    .line 274
    .line 275
    return-object v1
.end method

.method public I(ZLjava/lang/String;)V
    .locals 1

    .line 1
    const-string p0, "p_moment_post"

    .line 2
    .line 3
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    new-array p2, p2, [Ll/tfj0$a;

    .line 11
    .line 12
    const-string v0, "e_set_my_state_post"

    .line 13
    .line 14
    invoke-static {v0, p0, p2}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const-string p0, "post_success"

    .line 18
    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "p_set_my_state_post"

    .line 32
    .line 33
    const-string p2, ""

    .line 34
    .line 35
    invoke-static {p1, p2, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public a(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/er60;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V
    .locals 3

    .line 1
    const-string v0, "topic_id"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "is_create"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "topic_type"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_topic"

    .line 46
    .line 47
    if-nez p3, :cond_0

    .line 48
    .line 49
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p2, p0}, Ll/ksg;->j(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    filled-new-array {v0, v1, p0, p3}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p2, p0}, Ll/ksg;->j(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/er60;->d(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V
    .locals 3

    .line 1
    const-string v0, "topic_id"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "is_create"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "topic_type"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_topic"

    .line 46
    .line 47
    if-nez p3, :cond_0

    .line 48
    .line 49
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p2, p0}, Ll/ksg;->j(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    filled-new-array {v0, v1, p0, p3}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p2, p0}, Ll/ksg;->j(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "moment_id"

    .line 8
    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "comment_user_id"

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->isAnonymousMoment()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "is_masked"

    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p0, p2, p1}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "e_moment_comment_pic"

    .line 42
    .line 43
    const-string p2, "p_immersion_comment_page"

    .line 44
    .line 45
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZ)V
    .locals 7

    .line 1
    const/4 v6, -0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/er60;->g(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLjava/lang/Throwable;Z)V
    .locals 0

    .line 1
    invoke-static {p4}, Ll/ksg;->O(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    invoke-virtual/range {p0 .. p5}, Ll/er60;->f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLjava/lang/Throwable;ZI)V
    .locals 0

    .line 1
    invoke-static {p4}, Ll/ksg;->O(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    invoke-virtual/range {p0 .. p6}, Ll/er60;->g(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "moment_id"

    .line 8
    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "comment_user_id"

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->isAnonymousMoment()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "is_masked"

    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p0, p2, p1}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "e_moment_comment_pic"

    .line 42
    .line 43
    const-string p2, "p_user_moment_interactions_details_view"

    .line 44
    .line 45
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/ksg;->O(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/er60;->k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p2, p3}, Ll/ksg;->L(Ljava/lang/String;Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "moment_id"

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "owner_id"

    .line 20
    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "is_state"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/er60;->G(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->isAnonymousMoment()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v2, "is_masked"

    .line 46
    .line 47
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    filled-new-array {v0, v1, p0, p1}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p2, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "e_moment_user_pic"

    .line 60
    .line 61
    invoke-static {p1, p3, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "IZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-boolean v0, Ll/er60;->b:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 9
    .line 10
    move-object v2, v0

    .line 11
    check-cast v2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-static {p1}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const-string v0, "p_topic_detail"

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    move-object v1, p0

    .line 24
    move-object v6, p1

    .line 25
    move v3, p3

    .line 26
    move v7, p4

    .line 27
    move-object v8, p5

    .line 28
    invoke-virtual/range {v1 .. v8}, Ll/er60;->H(Ljava/util/ArrayList;IIZLcom/p1/mobile/putong/feed/data/Moment;ZLjava/util/Map;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "e_moment_posted"

    .line 33
    .line 34
    invoke-static {p1, p2, p0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 39
    sput-boolean p0, Ll/er60;->b:Z

    .line 40
    .line 41
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;ZLjava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-boolean v0, Ll/er60;->b:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 9
    .line 10
    move-object v2, v0

    .line 11
    check-cast v2, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-static {p3}, Ll/ksg;->O(Ljava/lang/Throwable;)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-static {p1}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const-string p3, "p_topic_detail"

    .line 22
    .line 23
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    move-object v1, p0

    .line 28
    move-object v6, p1

    .line 29
    move v7, p4

    .line 30
    move-object v8, p5

    .line 31
    invoke-virtual/range {v1 .. v8}, Ll/er60;->H(Ljava/util/ArrayList;IIZLcom/p1/mobile/putong/feed/data/Moment;ZLjava/util/Map;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_moment_posted"

    .line 36
    .line 37
    invoke-static {p1, p2, p0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 42
    sput-boolean p0, Ll/er60;->b:Z

    .line 43
    .line 44
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLl/pf60;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "IZ",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 5
    .line 6
    move-object v2, v0

    .line 7
    check-cast v2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-static {p1}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    const-string v0, "p_topic_detail"

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    const/4 v8, 0x0

    .line 20
    move-object v1, p0

    .line 21
    move-object v6, p1

    .line 22
    move v3, p3

    .line 23
    move v7, p4

    .line 24
    invoke-virtual/range {v1 .. v8}, Ll/er60;->H(Ljava/util/ArrayList;IIZLcom/p1/mobile/putong/feed/data/Moment;ZLjava/util/Map;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p5, :cond_1

    .line 29
    .line 30
    :try_start_0
    iget-object p1, p5, Ll/pf60;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Ljava/lang/String;

    .line 33
    .line 34
    iget-object p3, p5, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-virtual {p0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    const-string p1, "e_moment_posted"

    .line 49
    .line 50
    invoke-static {p1, p2, p0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/ksg;->O(Ljava/lang/Throwable;)I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    invoke-virtual/range {p0 .. p5}, Ll/er60;->q(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "is_input"

    .line 8
    .line 9
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-static {p0, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p4, "moment_id"

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p4, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    xor-int/lit8 p3, p3, 0x1

    .line 26
    .line 27
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    const-string v0, "is_match"

    .line 32
    .line 33
    invoke-static {v0, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const-string v0, "owner_id"

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p0, p4, p3, p1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "e_send_message"

    .line 50
    .line 51
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "is_input"

    .line 8
    .line 9
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-static {p0, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p4, "moment_id"

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p4, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    xor-int/lit8 p3, p3, 0x1

    .line 26
    .line 27
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    const-string v0, "is_match"

    .line 32
    .line 33
    invoke-static {v0, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const-string v0, "owner_id"

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p0, p4, p3, p1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "e_send_message"

    .line 50
    .line 51
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public u(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "e_follow"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "e_cancelfollow"

    .line 7
    .line 8
    return-object p0
.end method

.method public v(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    new-array p0, v0, [Ll/pf60;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pf60;

    .line 17
    .line 18
    const-string v2, "owner_id"

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    new-instance v1, Ll/pf60;

    .line 33
    .line 34
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 37
    .line 38
    const-string v3, "liveId"

    .line 39
    .line 40
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/pf60;

    .line 47
    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 53
    .line 54
    const-string v3, "anchorId"

    .line 55
    .line 56
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    new-instance v1, Ll/pf60;

    .line 64
    .line 65
    const-string v2, "moment_id"

    .line 66
    .line 67
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    new-instance v1, Ll/pf60;

    .line 82
    .line 83
    const-string v2, "moment_user_id"

    .line 84
    .line 85
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-direct {v1, v2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    :cond_2
    new-instance p2, Ll/pf60;

    .line 94
    .line 95
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 96
    .line 97
    if-eqz v1, :cond_3

    .line 98
    .line 99
    const-string v1, "live"

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    :goto_1
    const-string v2, "moment_type"

    .line 111
    .line 112
    invoke-direct {p2, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance p2, Ll/pf60;

    .line 119
    .line 120
    const-string v1, "receiver_user_id"

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 123
    .line 124
    invoke-direct {p2, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-array p1, v0, [Ll/pf60;

    .line 131
    .line 132
    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    check-cast p0, [Ll/pf60;

    .line 137
    .line 138
    return-object p0
.end method

.method public final varargs x([F)F
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    aget v0, p1, p0

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    :goto_0
    if-ge p0, v1, :cond_1

    .line 6
    .line 7
    aget v2, p1, p0

    .line 8
    .line 9
    cmpg-float v3, v2, v0

    .line 10
    .line 11
    if-gez v3, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return v0
.end method

.method public y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_f

    .line 6
    .line 7
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "audio_room"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {}, Ll/j4h;->d()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const-string v0, "video"

    .line 23
    .line 24
    const-string v1, "photo"

    .line 25
    .line 26
    if-eqz p0, :cond_4

    .line 27
    .line 28
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 29
    .line 30
    if-eqz p0, :cond_4

    .line 31
    .line 32
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    instance-of v2, v2, Lcom/p1/mobile/putong/data/Video;

    .line 37
    .line 38
    if-nez v2, :cond_3

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    instance-of v2, p0, Lcom/p1/mobile/putong/data/Video;

    .line 43
    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    :cond_2
    return-object v1

    .line 62
    :cond_3
    :goto_0
    return-object v0

    .line 63
    :cond_4
    invoke-static {p1}, Ll/ksg;->f0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_5

    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_5
    invoke-static {p1}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    const/4 v2, 0x0

    .line 81
    const-string v3, "word"

    .line 82
    .line 83
    const-string v4, "forwarding"

    .line 84
    .line 85
    if-eqz p0, :cond_a

    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-eqz v5, :cond_8

    .line 94
    .line 95
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-nez v5, :cond_7

    .line 100
    .line 101
    invoke-static {p1}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-eqz p0, :cond_6

    .line 106
    .line 107
    return-object v4

    .line 108
    :cond_6
    return-object v3

    .line 109
    :cond_7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    const/4 v6, 0x1

    .line 114
    if-ne v5, v6, :cond_a

    .line 115
    .line 116
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 121
    .line 122
    if-eqz p0, :cond_a

    .line 123
    .line 124
    return-object v1

    .line 125
    :cond_8
    invoke-static {p1}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_9

    .line 130
    .line 131
    return-object v4

    .line 132
    :cond_9
    return-object v3

    .line 133
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 134
    .line 135
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_d

    .line 140
    .line 141
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-lez p0, :cond_d

    .line 148
    .line 149
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 156
    .line 157
    if-eqz p0, :cond_b

    .line 158
    .line 159
    return-object v0

    .line 160
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Audio;

    .line 167
    .line 168
    if-eqz p0, :cond_c

    .line 169
    .line 170
    const-string p0, "voice"

    .line 171
    .line 172
    return-object p0

    .line 173
    :cond_c
    return-object v1

    .line 174
    :cond_d
    invoke-static {p1}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-eqz p0, :cond_e

    .line 179
    .line 180
    return-object v4

    .line 181
    :cond_e
    return-object v3

    .line 182
    :cond_f
    const-string p0, ""

    .line 183
    .line 184
    return-object p0
.end method

.method public z(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
