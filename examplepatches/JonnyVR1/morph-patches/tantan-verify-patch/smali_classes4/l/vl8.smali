.class public Ll/vl8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    sget v1, Ll/dbc0;->Zt:I

    .line 9
    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "assets://asset/asset.PNG?id=avatar_verification_guide&ext=PNG"

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->Yt:I

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "assets://asset/asset.PNG?id=avatar_verification_fail&ext=PNG"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 33
    .line 34
    sget v1, Ll/dbc0;->au:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "assets://asset/asset.PNG?id=avatar_verification_success&ext=PNG"

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 46
    .line 47
    sget v1, Ll/dbc0;->hu:I

    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "assets://asset/asset.PNG?id=see_intro_female&ext=PNG"

    .line 54
    .line 55
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 59
    .line 60
    sget v1, Ll/dbc0;->iu:I

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "assets://asset/asset.PNG?id=see_intro_male&ext=PNG"

    .line 67
    .line 68
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 72
    .line 73
    sget v1, Ll/dbc0;->qs:I

    .line 74
    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-string v2, "assets://asset/asset.PNG?id=good_to_fake_right&ext=PNG"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 85
    .line 86
    sget v1, Ll/dbc0;->ps:I

    .line 87
    .line 88
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const-string v2, "assets://asset/asset.PNG?id=good_to_fake_wrong&ext=PNG"

    .line 93
    .line 94
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 98
    .line 99
    sget v1, Ll/dbc0;->Gu:I

    .line 100
    .line 101
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const-string v2, "assets://asset/asset.PNG?id=avatar_warning&ext=PNG"

    .line 106
    .line 107
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 111
    .line 112
    sget v1, Ll/dbc0;->Du:I

    .line 113
    .line 114
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const-string v2, "assets://asset/asset.PNG?id=avatar_verified&ext=PNG"

    .line 119
    .line 120
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 124
    .line 125
    sget v1, Ll/dbc0;->zu:I

    .line 126
    .line 127
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const-string v2, "assets://asset/asset.PNG?id=quickchat_intro_background&ext=PNG"

    .line 132
    .line 133
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 137
    .line 138
    sget v1, Ll/dbc0;->o8:I

    .line 139
    .line 140
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const-string v2, "assets://asset/asset.PNG?id=quickchat_intro&ext=PNG"

    .line 145
    .line 146
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 150
    .line 151
    sget v1, Ll/dbc0;->Bu:I

    .line 152
    .line 153
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    const-string v2, "assets://asset/asset.PNG?id=quickchat_intro_user_blur&ext=PNG"

    .line 158
    .line 159
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 163
    .line 164
    sget v1, Ll/dbc0;->os:I

    .line 165
    .line 166
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    const-string v2, "assets://asset/asset.PNG?id=fake_forbidden_fore_shape&ext=PNG"

    .line 171
    .line 172
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 176
    .line 177
    sget v1, Ll/dbc0;->ns:I

    .line 178
    .line 179
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    const-string v2, "assets://asset/asset.PNG?id=fake_forbidden_back_shape&ext=PNG"

    .line 184
    .line 185
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 189
    .line 190
    sget v1, Ll/dbc0;->av:I

    .line 191
    .line 192
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    const-string v2, "assets://asset/asset.PNG?id=tf_rect_rounded_light&ext=PNG"

    .line 197
    .line 198
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 202
    .line 203
    sget v1, Ll/dbc0;->rv:I

    .line 204
    .line 205
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    const-string v2, "assets://asset/asset.PNG?id=vip_alert_dialog_page_2_avatar_round_bg&ext=PNG"

    .line 210
    .line 211
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 215
    .line 216
    sget v1, Ll/dbc0;->Ou:I

    .line 217
    .line 218
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    const-string v2, "assets://asset/asset.PNG?id=see_avatar_big_border&ext=PNG"

    .line 223
    .line 224
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 228
    .line 229
    sget v1, Ll/dbc0;->Mu:I

    .line 230
    .line 231
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    const-string v2, "assets://asset/asset.PNG?id=rect_rounded_tantan_orange&ext=PNG"

    .line 236
    .line 237
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 241
    .line 242
    sget v1, Ll/dbc0;->Pu:I

    .line 243
    .line 244
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    const-string v2, "assets://asset/asset.PNG?id=see_avatar_heart&ext=PNG"

    .line 249
    .line 250
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 254
    .line 255
    sget v1, Ll/dbc0;->Qu:I

    .line 256
    .line 257
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    const-string v2, "assets://asset/asset.PNG?id=see_avatar_small_border&ext=PNG"

    .line 262
    .line 263
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 267
    .line 268
    sget v1, Ll/dbc0;->Xu:I

    .line 269
    .line 270
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    const-string v2, "assets://asset/asset.PNG?id=tf_circle_bounded_light&ext=PNG"

    .line 275
    .line 276
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 280
    .line 281
    sget v1, Ll/dbc0;->Q1:I

    .line 282
    .line 283
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    const-string v2, "assets://asset/asset.PNG?id=core_bother_opt_see_avatar_big_border&ext=PNG"

    .line 288
    .line 289
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 293
    .line 294
    sget v1, Ll/dbc0;->S1:I

    .line 295
    .line 296
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    const-string v2, "assets://asset/asset.PNG?id=core_bother_opt_see_avatar_small_border&ext=PNG"

    .line 301
    .line 302
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 306
    .line 307
    sget v1, Ll/dbc0;->R1:I

    .line 308
    .line 309
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    const-string v2, "assets://asset/asset.PNG?id=core_bother_opt_see_avatar_heart&ext=PNG"

    .line 314
    .line 315
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 319
    .line 320
    sget v1, Ll/dbc0;->N1:I

    .line 321
    .line 322
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    const-string v2, "assets://asset/asset.PNG?id=core_bother_opt_no_match_see_guide_bg&ext=PNG"

    .line 327
    .line 328
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 332
    .line 333
    sget v1, Ll/dbc0;->P1:I

    .line 334
    .line 335
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    const-string v2, "assets://asset/asset.PNG?id=core_bother_opt_no_match_see_guide_head_bg&ext=PNG"

    .line 340
    .line 341
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 345
    .line 346
    sget v1, Ll/dbc0;->O1:I

    .line 347
    .line 348
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    const-string v2, "assets://asset/asset.PNG?id=core_bother_opt_no_match_see_guide_btn&ext=PNG"

    .line 353
    .line 354
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 358
    .line 359
    sget v1, Ll/dbc0;->lk:I

    .line 360
    .line 361
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    const-string v2, "assets://asset/asset.PNG?id=core_popup_profile_verification_function_guide&ext=PNG"

    .line 366
    .line 367
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 371
    .line 372
    sget v1, Ll/dbc0;->Lu:I

    .line 373
    .line 374
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    const-string v2, "assets://asset/asset.PNG?id=rect_rounded_large_tantan_orange&ext=PNG"

    .line 379
    .line 380
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 384
    .line 385
    sget v1, Ll/dbc0;->tu:I

    .line 386
    .line 387
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    const-string v2, "assets://asset/asset.PNG?id=new_home_popup_thin_img&ext=PNG"

    .line 392
    .line 393
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 397
    .line 398
    sget v1, Ll/dbc0;->Xt:I

    .line 399
    .line 400
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    const-string v2, "assets://asset/asset.PNG?id=img_popup_profile_verification_checking&ext=PNG"

    .line 405
    .line 406
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 410
    .line 411
    sget v1, Ll/dbc0;->B5:I

    .line 412
    .line 413
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    const-string v2, "assets://asset/asset.PNG?id=core_coin_see_icon&ext=PNG"

    .line 418
    .line 419
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 423
    .line 424
    sget v1, Ll/dbc0;->A5:I

    .line 425
    .line 426
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 427
    .line 428
    .line 429
    move-result-object v1

    .line 430
    const-string v2, "assets://asset/asset.PNG?id=core_coin_see_button&ext=PNG"

    .line 431
    .line 432
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    .line 434
    .line 435
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 436
    .line 437
    sget v1, Ll/dbc0;->ej:I

    .line 438
    .line 439
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    const-string v2, "assets://asset/asset.PNG?id=core_oms_complete_profile&ext=PNG"

    .line 444
    .line 445
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 449
    .line 450
    sget v1, Ll/dbc0;->t:I

    .line 451
    .line 452
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    const-string v2, "assets://asset/asset.PNG?id=core_oms_common_button_orange_bg&ext=PNG"

    .line 457
    .line 458
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 462
    .line 463
    sget v1, Ll/dbc0;->ij:I

    .line 464
    .line 465
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 466
    .line 467
    .line 468
    move-result-object v1

    .line 469
    const-string v2, "assets://asset/asset.PNG?id=core_oms_verification_complete&ext=PNG"

    .line 470
    .line 471
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    .line 473
    .line 474
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 475
    .line 476
    sget v1, Ll/dbc0;->kj:I

    .line 477
    .line 478
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    const-string v2, "assets://asset/asset.PNG?id=core_oms_verification_ing&ext=PNG"

    .line 483
    .line 484
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 488
    .line 489
    sget v1, Ll/dbc0;->kj:I

    .line 490
    .line 491
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 492
    .line 493
    .line 494
    move-result-object v1

    .line 495
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 499
    .line 500
    sget v1, Ll/dbc0;->jj:I

    .line 501
    .line 502
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 503
    .line 504
    .line 505
    move-result-object v1

    .line 506
    const-string v2, "assets://asset/asset.PNG?id=core_oms_verification_fail&ext=PNG"

    .line 507
    .line 508
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 512
    .line 513
    sget v1, Ll/dbc0;->fj:I

    .line 514
    .line 515
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 516
    .line 517
    .line 518
    move-result-object v1

    .line 519
    const-string v2, "assets://asset/asset.PNG?id=core_oms_fast_match&ext=PNG"

    .line 520
    .line 521
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    .line 523
    .line 524
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 525
    .line 526
    sget v1, Ll/dbc0;->g0:I

    .line 527
    .line 528
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    const-string v2, "assets://asset/asset.PNG?id=core_oms_fast_match_bg&ext=PNG"

    .line 533
    .line 534
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 538
    .line 539
    sget v1, Ll/dbc0;->gj:I

    .line 540
    .line 541
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 542
    .line 543
    .line 544
    move-result-object v1

    .line 545
    const-string v2, "assets://asset/asset.PNG?id=core_oms_long_time_no_see&ext=PNG"

    .line 546
    .line 547
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    .line 549
    .line 550
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 551
    .line 552
    sget v1, Ll/dbc0;->y:I

    .line 553
    .line 554
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 555
    .line 556
    .line 557
    move-result-object v1

    .line 558
    const-string v2, "assets://asset/asset.PNG?id=core_oms_common_checkbox_bg&ext=PNG"

    .line 559
    .line 560
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 564
    .line 565
    sget v1, Ll/dbc0;->hj:I

    .line 566
    .line 567
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    const-string v2, "assets://asset/asset.PNG?id=core_oms_ready_active&ext=PNG"

    .line 572
    .line 573
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    .line 575
    .line 576
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

.method public static a()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/vl8;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object v0
.end method
