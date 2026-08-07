.class Lcom/p1/mobile/putong/core/data/CardSwipeConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CardSwipeConfig;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x6

    .line 41
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 42
    .line 43
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    const/4 v0, 0x7

    .line 49
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 50
    .line 51
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 59
    .line 60
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    add-int/2addr p0, v0

    .line 65
    const/16 v0, 0x9

    .line 66
    .line 67
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 68
    .line 69
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    const/16 v0, 0xa

    .line 75
    .line 76
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 77
    .line 78
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    const/16 v0, 0xb

    .line 84
    .line 85
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 86
    .line 87
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    const/16 v0, 0xc

    .line 93
    .line 94
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 95
    .line 96
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    const/16 v0, 0xd

    .line 102
    .line 103
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 104
    .line 105
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    const/16 v0, 0xe

    .line 111
    .line 112
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 113
    .line 114
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    const/16 v0, 0xf

    .line 120
    .line 121
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 122
    .line 123
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    const/16 v0, 0x10

    .line 129
    .line 130
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 131
    .line 132
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p0, v0

    .line 137
    const/16 v0, 0x11

    .line 138
    .line 139
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 140
    .line 141
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    const/16 v0, 0x12

    .line 147
    .line 148
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 149
    .line 150
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    add-int/2addr p0, v0

    .line 155
    const/16 v0, 0x13

    .line 156
    .line 157
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 158
    .line 159
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    const/16 v0, 0x14

    .line 165
    .line 166
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 167
    .line 168
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    add-int/2addr p0, v0

    .line 173
    const/16 v0, 0x15

    .line 174
    .line 175
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 176
    .line 177
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    const/16 v0, 0x16

    .line 183
    .line 184
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 185
    .line 186
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    const/16 v0, 0x17

    .line 192
    .line 193
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 194
    .line 195
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    const/16 v0, 0x18

    .line 201
    .line 202
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 203
    .line 204
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    add-int/2addr p0, v0

    .line 209
    const/16 v0, 0x19

    .line 210
    .line 211
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 212
    .line 213
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    add-int/2addr p0, v0

    .line 218
    const/16 v0, 0x1a

    .line 219
    .line 220
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 221
    .line 222
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    add-int/2addr p0, v0

    .line 227
    const/16 v0, 0x1b

    .line 228
    .line 229
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 230
    .line 231
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    add-int/2addr p0, v0

    .line 236
    const/16 v0, 0x1c

    .line 237
    .line 238
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 239
    .line 240
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    add-int/2addr p0, v0

    .line 245
    const/16 v0, 0x1d

    .line 246
    .line 247
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 248
    .line 249
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    add-int/2addr p0, v0

    .line 254
    const/16 v0, 0x1e

    .line 255
    .line 256
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 257
    .line 258
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    add-int/2addr p0, v0

    .line 263
    const/16 v0, 0x1f

    .line 264
    .line 265
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 266
    .line 267
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    add-int/2addr p0, v0

    .line 272
    const/16 v0, 0x20

    .line 273
    .line 274
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 275
    .line 276
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    add-int/2addr p0, v0

    .line 281
    const/16 v0, 0x21

    .line 282
    .line 283
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 284
    .line 285
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    add-int/2addr p0, v0

    .line 290
    const/16 v0, 0x22

    .line 291
    .line 292
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 293
    .line 294
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    add-int/2addr p0, v0

    .line 299
    const/16 v0, 0x23

    .line 300
    .line 301
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 302
    .line 303
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    add-int/2addr p0, v0

    .line 308
    const/16 v0, 0x24

    .line 309
    .line 310
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 311
    .line 312
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    add-int/2addr p0, v0

    .line 317
    const/16 v0, 0x25

    .line 318
    .line 319
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 320
    .line 321
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    add-int/2addr p0, v0

    .line 326
    const/16 v0, 0x26

    .line 327
    .line 328
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 329
    .line 330
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    add-int/2addr p0, v0

    .line 335
    const/16 v0, 0x27

    .line 336
    .line 337
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 338
    .line 339
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    add-int/2addr p0, v0

    .line 344
    const/16 v0, 0x28

    .line 345
    .line 346
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 347
    .line 348
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    add-int/2addr p0, v0

    .line 353
    const/16 v0, 0x29

    .line 354
    .line 355
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 356
    .line 357
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    add-int/2addr p0, v0

    .line 362
    const/16 v0, 0x2a

    .line 363
    .line 364
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 365
    .line 366
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    add-int/2addr p0, v0

    .line 371
    const/16 v0, 0x2b

    .line 372
    .line 373
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 374
    .line 375
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 376
    .line 377
    .line 378
    move-result v0

    .line 379
    add-int/2addr p0, v0

    .line 380
    const/16 v0, 0x2c

    .line 381
    .line 382
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 383
    .line 384
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    add-int/2addr p0, v0

    .line 389
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 390
    .line 391
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 392
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 99
    .line 100
    .line 101
    move-result-wide v0

    .line 102
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 106
    .line 107
    .line 108
    move-result-wide v0

    .line 109
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 113
    .line 114
    .line 115
    move-result-wide v0

    .line 116
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 120
    .line 121
    .line 122
    move-result-wide v0

    .line 123
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 134
    .line 135
    .line 136
    move-result-wide v0

    .line 137
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 190
    .line 191
    .line 192
    move-result-wide v0

    .line 193
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 198
    .line 199
    .line 200
    move-result-wide v0

    .line 201
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 206
    .line 207
    .line 208
    move-result-wide v0

    .line 209
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 214
    .line 215
    .line 216
    move-result-wide v0

    .line 217
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 222
    .line 223
    .line 224
    move-result-wide v0

    .line 225
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 230
    .line 231
    .line 232
    move-result-wide v0

    .line 233
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 238
    .line 239
    .line 240
    move-result-wide v0

    .line 241
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 246
    .line 247
    .line 248
    move-result-wide v0

    .line 249
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 254
    .line 255
    .line 256
    move-result-wide v0

    .line 257
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 262
    .line 263
    .line 264
    move-result-wide v0

    .line 265
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 270
    .line 271
    .line 272
    move-result-wide v0

    .line 273
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 278
    .line 279
    .line 280
    move-result-wide v0

    .line 281
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 282
    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 286
    .line 287
    .line 288
    move-result-wide v0

    .line 289
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 294
    .line 295
    .line 296
    move-result-wide v0

    .line 297
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 302
    .line 303
    .line 304
    move-result-wide v0

    .line 305
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 310
    .line 311
    .line 312
    move-result-wide v0

    .line 313
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 318
    .line 319
    .line 320
    move-result-wide v0

    .line 321
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 322
    .line 323
    goto/16 :goto_0

    .line 324
    .line 325
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 326
    .line 327
    .line 328
    move-result-wide v0

    .line 329
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_2a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 334
    .line 335
    .line 336
    move-result-wide v0

    .line 337
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 338
    .line 339
    goto/16 :goto_0

    .line 340
    .line 341
    :sswitch_2b
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 342
    .line 343
    .line 344
    move-result-wide v0

    .line 345
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2b
        0x10 -> :sswitch_2a
        0x18 -> :sswitch_29
        0x20 -> :sswitch_28
        0x28 -> :sswitch_27
        0x30 -> :sswitch_26
        0x38 -> :sswitch_25
        0x41 -> :sswitch_24
        0x48 -> :sswitch_23
        0x51 -> :sswitch_22
        0x59 -> :sswitch_21
        0x60 -> :sswitch_20
        0x68 -> :sswitch_1f
        0x70 -> :sswitch_1e
        0x78 -> :sswitch_1d
        0x80 -> :sswitch_1c
        0x89 -> :sswitch_1b
        0x90 -> :sswitch_1a
        0x99 -> :sswitch_19
        0xa1 -> :sswitch_18
        0xa8 -> :sswitch_17
        0xb0 -> :sswitch_16
        0xb8 -> :sswitch_15
        0xc0 -> :sswitch_14
        0xc8 -> :sswitch_13
        0xd0 -> :sswitch_12
        0xd9 -> :sswitch_11
        0xe1 -> :sswitch_10
        0xe9 -> :sswitch_f
        0xf1 -> :sswitch_e
        0xf9 -> :sswitch_d
        0x101 -> :sswitch_c
        0x108 -> :sswitch_b
        0x111 -> :sswitch_a
        0x118 -> :sswitch_9
        0x121 -> :sswitch_8
        0x129 -> :sswitch_7
        0x130 -> :sswitch_6
        0x138 -> :sswitch_5
        0x140 -> :sswitch_4
        0x148 -> :sswitch_3
        0x150 -> :sswitch_2
        0x158 -> :sswitch_1
        0x161 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 348
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x6

    .line 32
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x7

    .line 38
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x8

    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x9

    .line 51
    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 55
    .line 56
    .line 57
    const/16 p0, 0xa

    .line 58
    .line 59
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 60
    .line 61
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 62
    .line 63
    .line 64
    const/16 p0, 0xb

    .line 65
    .line 66
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 69
    .line 70
    .line 71
    const/16 p0, 0xc

    .line 72
    .line 73
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 76
    .line 77
    .line 78
    const/16 p0, 0xd

    .line 79
    .line 80
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 81
    .line 82
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 83
    .line 84
    .line 85
    const/16 p0, 0xe

    .line 86
    .line 87
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 88
    .line 89
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 90
    .line 91
    .line 92
    const/16 p0, 0xf

    .line 93
    .line 94
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 95
    .line 96
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 97
    .line 98
    .line 99
    const/16 p0, 0x10

    .line 100
    .line 101
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 102
    .line 103
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 104
    .line 105
    .line 106
    const/16 p0, 0x11

    .line 107
    .line 108
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 109
    .line 110
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 111
    .line 112
    .line 113
    const/16 p0, 0x12

    .line 114
    .line 115
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 116
    .line 117
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 118
    .line 119
    .line 120
    const/16 p0, 0x13

    .line 121
    .line 122
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 123
    .line 124
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 125
    .line 126
    .line 127
    const/16 p0, 0x14

    .line 128
    .line 129
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 130
    .line 131
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 132
    .line 133
    .line 134
    const/16 p0, 0x15

    .line 135
    .line 136
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 137
    .line 138
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 139
    .line 140
    .line 141
    const/16 p0, 0x16

    .line 142
    .line 143
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 144
    .line 145
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 146
    .line 147
    .line 148
    const/16 p0, 0x17

    .line 149
    .line 150
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 151
    .line 152
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 153
    .line 154
    .line 155
    const/16 p0, 0x18

    .line 156
    .line 157
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 158
    .line 159
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 160
    .line 161
    .line 162
    const/16 p0, 0x19

    .line 163
    .line 164
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 165
    .line 166
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 167
    .line 168
    .line 169
    const/16 p0, 0x1a

    .line 170
    .line 171
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 172
    .line 173
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 174
    .line 175
    .line 176
    const/16 p0, 0x1b

    .line 177
    .line 178
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 179
    .line 180
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 181
    .line 182
    .line 183
    const/16 p0, 0x1c

    .line 184
    .line 185
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 186
    .line 187
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 188
    .line 189
    .line 190
    const/16 p0, 0x1d

    .line 191
    .line 192
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 193
    .line 194
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 195
    .line 196
    .line 197
    const/16 p0, 0x1e

    .line 198
    .line 199
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 200
    .line 201
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 202
    .line 203
    .line 204
    const/16 p0, 0x1f

    .line 205
    .line 206
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 207
    .line 208
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 209
    .line 210
    .line 211
    const/16 p0, 0x20

    .line 212
    .line 213
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 214
    .line 215
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 216
    .line 217
    .line 218
    const/16 p0, 0x21

    .line 219
    .line 220
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 221
    .line 222
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 223
    .line 224
    .line 225
    const/16 p0, 0x22

    .line 226
    .line 227
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 228
    .line 229
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 230
    .line 231
    .line 232
    const/16 p0, 0x23

    .line 233
    .line 234
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 235
    .line 236
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 237
    .line 238
    .line 239
    const/16 p0, 0x24

    .line 240
    .line 241
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 242
    .line 243
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 244
    .line 245
    .line 246
    const/16 p0, 0x25

    .line 247
    .line 248
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 249
    .line 250
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 251
    .line 252
    .line 253
    const/16 p0, 0x26

    .line 254
    .line 255
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 256
    .line 257
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 258
    .line 259
    .line 260
    const/16 p0, 0x27

    .line 261
    .line 262
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 263
    .line 264
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 265
    .line 266
    .line 267
    const/16 p0, 0x28

    .line 268
    .line 269
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 270
    .line 271
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 272
    .line 273
    .line 274
    const/16 p0, 0x29

    .line 275
    .line 276
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 277
    .line 278
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 279
    .line 280
    .line 281
    const/16 p0, 0x2a

    .line 282
    .line 283
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 284
    .line 285
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 286
    .line 287
    .line 288
    const/16 p0, 0x2b

    .line 289
    .line 290
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 291
    .line 292
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 293
    .line 294
    .line 295
    const/16 p0, 0x2c

    .line 296
    .line 297
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 298
    .line 299
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 300
    .line 301
    .line 302
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
