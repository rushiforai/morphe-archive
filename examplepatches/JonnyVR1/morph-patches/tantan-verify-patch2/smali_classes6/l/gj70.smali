.class public Ll/gj70;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/gj70$a;,
        Ll/gj70$b;
    }
.end annotation


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/gj70$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v1, Ll/gj70$a;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-direct {v1, v2, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 16
    .line 17
    .line 18
    const-string v4, "from_nearby_focus"

    .line 19
    .line 20
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 24
    .line 25
    new-instance v1, Ll/gj70$a;

    .line 26
    .line 27
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 28
    .line 29
    .line 30
    const-string v4, "from_nearby_focus_single"

    .line 31
    .line 32
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 36
    .line 37
    new-instance v1, Ll/gj70$a;

    .line 38
    .line 39
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 40
    .line 41
    .line 42
    const-string v4, "from_nearby_falls_feed"

    .line 43
    .line 44
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 48
    .line 49
    new-instance v1, Ll/gj70$a;

    .line 50
    .line 51
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 52
    .line 53
    .line 54
    const-string v4, "from_nearby_falls_feed_single"

    .line 55
    .line 56
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 60
    .line 61
    new-instance v1, Ll/gj70$a;

    .line 62
    .line 63
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 64
    .line 65
    .line 66
    const-string v4, "from_profile"

    .line 67
    .line 68
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 72
    .line 73
    new-instance v1, Ll/gj70$a;

    .line 74
    .line 75
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 76
    .line 77
    .line 78
    const-string v4, "from_card_profile"

    .line 79
    .line 80
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 84
    .line 85
    new-instance v1, Ll/gj70$a;

    .line 86
    .line 87
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 88
    .line 89
    .line 90
    const-string v4, "from_activities_profile"

    .line 91
    .line 92
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 96
    .line 97
    new-instance v1, Ll/gj70$a;

    .line 98
    .line 99
    invoke-direct {v1, v2, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 100
    .line 101
    .line 102
    const-string v4, "from_activities_moment"

    .line 103
    .line 104
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 108
    .line 109
    new-instance v1, Ll/gj70$a;

    .line 110
    .line 111
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 112
    .line 113
    .line 114
    const-string v4, "mute_list"

    .line 115
    .line 116
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 120
    .line 121
    new-instance v1, Ll/gj70$a;

    .line 122
    .line 123
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 124
    .line 125
    .line 126
    const-string v4, "push"

    .line 127
    .line 128
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 132
    .line 133
    new-instance v1, Ll/gj70$a;

    .line 134
    .line 135
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 136
    .line 137
    .line 138
    const-string v4, "photo_album_activities"

    .line 139
    .line 140
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 144
    .line 145
    new-instance v1, Ll/gj70$a;

    .line 146
    .line 147
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 148
    .line 149
    .line 150
    const-string v4, "all_comment_detail_item"

    .line 151
    .line 152
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 156
    .line 157
    new-instance v1, Ll/gj70$a;

    .line 158
    .line 159
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 160
    .line 161
    .line 162
    const-string v4, "fan_list"

    .line 163
    .line 164
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 168
    .line 169
    new-instance v1, Ll/gj70$a;

    .line 170
    .line 171
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 172
    .line 173
    .line 174
    const-string v4, "from_following_list"

    .line 175
    .line 176
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 180
    .line 181
    new-instance v1, Ll/gj70$a;

    .line 182
    .line 183
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 184
    .line 185
    .line 186
    const-string v4, "my_tab"

    .line 187
    .line 188
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 192
    .line 193
    new-instance v1, Ll/gj70$a;

    .line 194
    .line 195
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 196
    .line 197
    .line 198
    const-string v4, "comment_list"

    .line 199
    .line 200
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 204
    .line 205
    new-instance v1, Ll/gj70$a;

    .line 206
    .line 207
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 208
    .line 209
    .line 210
    const-string v4, "push_new_moment"

    .line 211
    .line 212
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 216
    .line 217
    new-instance v1, Ll/gj70$a;

    .line 218
    .line 219
    invoke-direct {v1, v2, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 220
    .line 221
    .line 222
    const-string v4, "original_moments"

    .line 223
    .line 224
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 228
    .line 229
    new-instance v1, Ll/gj70$a;

    .line 230
    .line 231
    invoke-direct {v1, v2, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 232
    .line 233
    .line 234
    const-string v4, "original_personal_moments"

    .line 235
    .line 236
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 240
    .line 241
    new-instance v1, Ll/gj70$a;

    .line 242
    .line 243
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 244
    .line 245
    .line 246
    const-string v4, "aggregate_page"

    .line 247
    .line 248
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 252
    .line 253
    new-instance v1, Ll/gj70$a;

    .line 254
    .line 255
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 256
    .line 257
    .line 258
    const-string v4, "recommend_only_video"

    .line 259
    .line 260
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 264
    .line 265
    new-instance v1, Ll/gj70$a;

    .line 266
    .line 267
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 268
    .line 269
    .line 270
    const-string v4, "recommend_multiple"

    .line 271
    .line 272
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 276
    .line 277
    new-instance v1, Ll/gj70$a;

    .line 278
    .line 279
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 280
    .line 281
    .line 282
    const-string v4, "recommend_falls_to_detail"

    .line 283
    .line 284
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 288
    .line 289
    new-instance v1, Ll/gj70$a;

    .line 290
    .line 291
    invoke-direct {v1, v2, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 292
    .line 293
    .line 294
    const-string v4, "from_profile_opt"

    .line 295
    .line 296
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 300
    .line 301
    new-instance v1, Ll/gj70$a;

    .line 302
    .line 303
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 304
    .line 305
    .line 306
    const-string v4, "from_profile_opt_single"

    .line 307
    .line 308
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 312
    .line 313
    new-instance v1, Ll/gj70$a;

    .line 314
    .line 315
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 316
    .line 317
    .line 318
    const-string v4, "from_topic_nearby_header"

    .line 319
    .line 320
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 324
    .line 325
    new-instance v1, Ll/gj70$a;

    .line 326
    .line 327
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 328
    .line 329
    .line 330
    const-string v4, "from_topic_official"

    .line 331
    .line 332
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 336
    .line 337
    new-instance v1, Ll/gj70$a;

    .line 338
    .line 339
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 340
    .line 341
    .line 342
    const-string v4, "from_no_topic_aggregation_list"

    .line 343
    .line 344
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 348
    .line 349
    new-instance v1, Ll/gj70$a;

    .line 350
    .line 351
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 352
    .line 353
    .line 354
    const-string v4, "from_topic_aggregation"

    .line 355
    .line 356
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 360
    .line 361
    new-instance v1, Ll/gj70$a;

    .line 362
    .line 363
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 364
    .line 365
    .line 366
    const-string v4, "viewers_item"

    .line 367
    .line 368
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 372
    .line 373
    new-instance v1, Ll/gj70$a;

    .line 374
    .line 375
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 376
    .line 377
    .line 378
    const-string v4, "from_h5_topic_aggregation"

    .line 379
    .line 380
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 384
    .line 385
    new-instance v1, Ll/gj70$a;

    .line 386
    .line 387
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 388
    .line 389
    .line 390
    const-string v4, "fromh5_topic_vote_aggregation"

    .line 391
    .line 392
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 396
    .line 397
    new-instance v1, Ll/gj70$a;

    .line 398
    .line 399
    invoke-direct {v1, v2, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 400
    .line 401
    .line 402
    const-string v4, "from_qa_topic_aggregation"

    .line 403
    .line 404
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 408
    .line 409
    new-instance v1, Ll/gj70$a;

    .line 410
    .line 411
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 412
    .line 413
    .line 414
    const-string v4, "from_all_topic_newest"

    .line 415
    .line 416
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 420
    .line 421
    new-instance v1, Ll/gj70$a;

    .line 422
    .line 423
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 424
    .line 425
    .line 426
    const-string v4, "FROM_ALL_TOPIC_RECOMMENDED"

    .line 427
    .line 428
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 432
    .line 433
    new-instance v1, Ll/gj70$a;

    .line 434
    .line 435
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 436
    .line 437
    .line 438
    const-string v4, "from_kan_kan"

    .line 439
    .line 440
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 444
    .line 445
    new-instance v1, Ll/gj70$a;

    .line 446
    .line 447
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 448
    .line 449
    .line 450
    const-string v4, "from_look_more"

    .line 451
    .line 452
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 456
    .line 457
    new-instance v1, Ll/gj70$a;

    .line 458
    .line 459
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 460
    .line 461
    .line 462
    const-string v4, "from_kan_chat"

    .line 463
    .line 464
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 468
    .line 469
    new-instance v1, Ll/gj70$a;

    .line 470
    .line 471
    invoke-direct {v1, v3, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 472
    .line 473
    .line 474
    const-string v4, "qa_recommend"

    .line 475
    .line 476
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    .line 478
    .line 479
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 480
    .line 481
    new-instance v1, Ll/gj70$a;

    .line 482
    .line 483
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 484
    .line 485
    .line 486
    const-string v4, "topic_recommend"

    .line 487
    .line 488
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 492
    .line 493
    new-instance v1, Ll/gj70$a;

    .line 494
    .line 495
    invoke-direct {v1, v2, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 496
    .line 497
    .line 498
    const-string v4, "from_online_match"

    .line 499
    .line 500
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 504
    .line 505
    new-instance v1, Ll/gj70$a;

    .line 506
    .line 507
    invoke-direct {v1, v3, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 508
    .line 509
    .line 510
    const-string v4, "qa_latest"

    .line 511
    .line 512
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 516
    .line 517
    new-instance v1, Ll/gj70$a;

    .line 518
    .line 519
    invoke-direct {v1, v3, v3, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 520
    .line 521
    .line 522
    const-string v4, "topic_latest"

    .line 523
    .line 524
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 528
    .line 529
    new-instance v1, Ll/gj70$a;

    .line 530
    .line 531
    invoke-direct {v1, v3, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 532
    .line 533
    .line 534
    const-string v4, "from_moment_detail_album"

    .line 535
    .line 536
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 540
    .line 541
    new-instance v1, Ll/gj70$a;

    .line 542
    .line 543
    invoke-direct {v1, v3, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 544
    .line 545
    .line 546
    const-string v4, "from_group_detail_recommend"

    .line 547
    .line 548
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    .line 550
    .line 551
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 552
    .line 553
    new-instance v1, Ll/gj70$a;

    .line 554
    .line 555
    invoke-direct {v1, v3, v2, v2}, Ll/gj70$a;-><init>(ZZZ)V

    .line 556
    .line 557
    .line 558
    const-string v4, "from_group_detail_new"

    .line 559
    .line 560
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 564
    .line 565
    new-instance v1, Ll/gj70$a;

    .line 566
    .line 567
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 568
    .line 569
    .line 570
    const-string v4, "from_discover_dating"

    .line 571
    .line 572
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 576
    .line 577
    new-instance v1, Ll/gj70$a;

    .line 578
    .line 579
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 580
    .line 581
    .line 582
    const-string v4, "from_discover_discussion"

    .line 583
    .line 584
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    .line 586
    .line 587
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 588
    .line 589
    new-instance v1, Ll/gj70$a;

    .line 590
    .line 591
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 592
    .line 593
    .line 594
    const-string v4, "from_activity_tab_one"

    .line 595
    .line 596
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 597
    .line 598
    .line 599
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 600
    .line 601
    new-instance v1, Ll/gj70$a;

    .line 602
    .line 603
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 604
    .line 605
    .line 606
    const-string v4, "from_activity_tab_two"

    .line 607
    .line 608
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 609
    .line 610
    .line 611
    iget-object v0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 612
    .line 613
    new-instance v1, Ll/gj70$a;

    .line 614
    .line 615
    invoke-direct {v1, v3, v2, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 616
    .line 617
    .line 618
    const-string v2, "from_poi_aggregation"

    .line 619
    .line 620
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    .line 622
    .line 623
    iget-object p0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 624
    .line 625
    new-instance v0, Ll/gj70$a;

    .line 626
    .line 627
    invoke-direct {v0, v3, v3, v3}, Ll/gj70$a;-><init>(ZZZ)V

    .line 628
    .line 629
    .line 630
    const-string v1, "p_friend_moment"

    .line 631
    .line 632
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    return-void
.end method

.method public synthetic constructor <init>(Ll/hj70;)V
    .locals 0

    .line 636
    invoke-direct {p0}, Ll/gj70;-><init>()V

    return-void
.end method

.method public static a()Ll/gj70;
    .locals 1

    .line 1
    invoke-static {}, Ll/gj70$b;->a()Ll/gj70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/gj70$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gj70;->a:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method
