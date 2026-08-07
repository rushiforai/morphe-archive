.class public Lcom/ss/bytertc/engine/video/VideoProfile;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static sVideoProfileMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/ss/bytertc/engine/video/VideoPreset;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 7
    .line 8
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 9
    .line 10
    const/16 v2, 0x41

    .line 11
    .line 12
    const/16 v3, 0xa0

    .line 13
    .line 14
    const/16 v4, 0x78

    .line 15
    .line 16
    const/16 v5, 0xf

    .line 17
    .line 18
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 26
    .line 27
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 28
    .line 29
    const/16 v2, 0x32

    .line 30
    .line 31
    invoke-direct {v1, v4, v4, v5, v2}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 39
    .line 40
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 41
    .line 42
    const/16 v3, 0x140

    .line 43
    .line 44
    const/16 v6, 0xb4

    .line 45
    .line 46
    const/16 v7, 0x8c

    .line 47
    .line 48
    invoke-direct {v1, v3, v6, v5, v7}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    const/16 v8, 0xa

    .line 52
    .line 53
    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 57
    .line 58
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 59
    .line 60
    const/16 v8, 0x64

    .line 61
    .line 62
    invoke-direct {v1, v6, v6, v5, v8}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 63
    .line 64
    .line 65
    const/16 v8, 0xc

    .line 66
    .line 67
    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 71
    .line 72
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 73
    .line 74
    const/16 v8, 0xf0

    .line 75
    .line 76
    invoke-direct {v1, v8, v6, v5, v4}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 77
    .line 78
    .line 79
    const/16 v4, 0xd

    .line 80
    .line 81
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 85
    .line 86
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 87
    .line 88
    invoke-direct {v1, v8, v6, v5, v8}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 89
    .line 90
    .line 91
    const/16 v4, 0xe

    .line 92
    .line 93
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 97
    .line 98
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 99
    .line 100
    const/16 v4, 0xc8

    .line 101
    .line 102
    invoke-direct {v1, v3, v8, v5, v4}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 103
    .line 104
    .line 105
    const/16 v4, 0x14

    .line 106
    .line 107
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 111
    .line 112
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 113
    .line 114
    const/16 v4, 0x168

    .line 115
    .line 116
    invoke-direct {v1, v3, v8, v5, v4}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 117
    .line 118
    .line 119
    const/16 v6, 0x15

    .line 120
    .line 121
    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 125
    .line 126
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 127
    .line 128
    invoke-direct {v1, v8, v8, v5, v7}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 129
    .line 130
    .line 131
    const/16 v6, 0x16

    .line 132
    .line 133
    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 137
    .line 138
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 139
    .line 140
    const/16 v6, 0x1a8

    .line 141
    .line 142
    const/16 v7, 0xdc

    .line 143
    .line 144
    invoke-direct {v1, v6, v8, v5, v7}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 145
    .line 146
    .line 147
    const/16 v6, 0x17

    .line 148
    .line 149
    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 153
    .line 154
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 155
    .line 156
    const/16 v6, 0x280

    .line 157
    .line 158
    const/16 v7, 0x258

    .line 159
    .line 160
    invoke-direct {v1, v6, v4, v5, v7}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 161
    .line 162
    .line 163
    const/16 v8, 0x1e

    .line 164
    .line 165
    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 169
    .line 170
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 171
    .line 172
    const/16 v9, 0x104

    .line 173
    .line 174
    invoke-direct {v1, v4, v4, v5, v9}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 175
    .line 176
    .line 177
    const/16 v9, 0x20

    .line 178
    .line 179
    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 183
    .line 184
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 185
    .line 186
    invoke-direct {v1, v6, v4, v8, v7}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 187
    .line 188
    .line 189
    const/16 v9, 0x21

    .line 190
    .line 191
    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 195
    .line 196
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 197
    .line 198
    const/16 v9, 0x320

    .line 199
    .line 200
    invoke-direct {v1, v6, v4, v5, v9}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 201
    .line 202
    .line 203
    const/16 v10, 0x22

    .line 204
    .line 205
    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 209
    .line 210
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 211
    .line 212
    const/16 v10, 0x190

    .line 213
    .line 214
    invoke-direct {v1, v4, v4, v8, v10}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 215
    .line 216
    .line 217
    const/16 v11, 0x23

    .line 218
    .line 219
    invoke-virtual {v0, v11, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 220
    .line 221
    .line 222
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 223
    .line 224
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 225
    .line 226
    const/16 v11, 0x1e0

    .line 227
    .line 228
    invoke-direct {v1, v11, v4, v5, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 229
    .line 230
    .line 231
    const/16 v3, 0x24

    .line 232
    .line 233
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 237
    .line 238
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 239
    .line 240
    const/16 v3, 0x1ea

    .line 241
    .line 242
    invoke-direct {v1, v11, v4, v8, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 243
    .line 244
    .line 245
    const/16 v3, 0x25

    .line 246
    .line 247
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 251
    .line 252
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 253
    .line 254
    const/16 v3, 0x1f4

    .line 255
    .line 256
    invoke-direct {v1, v6, v11, v5, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 257
    .line 258
    .line 259
    const/16 v3, 0x28

    .line 260
    .line 261
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 265
    .line 266
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 267
    .line 268
    invoke-direct {v1, v11, v11, v5, v10}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 269
    .line 270
    .line 271
    const/16 v3, 0x2a

    .line 272
    .line 273
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 277
    .line 278
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 279
    .line 280
    const/16 v3, 0x2ee

    .line 281
    .line 282
    invoke-direct {v1, v6, v11, v8, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 283
    .line 284
    .line 285
    const/16 v3, 0x2b

    .line 286
    .line 287
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 291
    .line 292
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 293
    .line 294
    invoke-direct {v1, v11, v11, v8, v7}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 295
    .line 296
    .line 297
    const/16 v3, 0x2d

    .line 298
    .line 299
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 300
    .line 301
    .line 302
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 303
    .line 304
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 305
    .line 306
    const/16 v3, 0x4b0

    .line 307
    .line 308
    const/16 v4, 0x350

    .line 309
    .line 310
    invoke-direct {v1, v4, v11, v5, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 311
    .line 312
    .line 313
    const/16 v3, 0x2e

    .line 314
    .line 315
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 316
    .line 317
    .line 318
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 319
    .line 320
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 321
    .line 322
    invoke-direct {v1, v4, v11, v8, v9}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 323
    .line 324
    .line 325
    const/16 v3, 0x2f

    .line 326
    .line 327
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 328
    .line 329
    .line 330
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 331
    .line 332
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 333
    .line 334
    const/16 v3, 0x3a2

    .line 335
    .line 336
    invoke-direct {v1, v4, v11, v8, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 337
    .line 338
    .line 339
    const/16 v3, 0x30

    .line 340
    .line 341
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 342
    .line 343
    .line 344
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 345
    .line 346
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 347
    .line 348
    const/16 v3, 0x46a

    .line 349
    .line 350
    const/16 v4, 0x500

    .line 351
    .line 352
    const/16 v6, 0x2d0

    .line 353
    .line 354
    invoke-direct {v1, v4, v6, v5, v3}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 361
    .line 362
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 363
    .line 364
    const/16 v2, 0x6ae

    .line 365
    .line 366
    invoke-direct {v1, v4, v6, v8, v2}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 367
    .line 368
    .line 369
    const/16 v2, 0x34

    .line 370
    .line 371
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 372
    .line 373
    .line 374
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 375
    .line 376
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 377
    .line 378
    const/16 v2, 0x38e

    .line 379
    .line 380
    const/16 v3, 0x3c0

    .line 381
    .line 382
    invoke-direct {v1, v3, v6, v5, v2}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 383
    .line 384
    .line 385
    const/16 v2, 0x36

    .line 386
    .line 387
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 388
    .line 389
    .line 390
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 391
    .line 392
    new-instance v1, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 393
    .line 394
    const/16 v2, 0x564

    .line 395
    .line 396
    invoke-direct {v1, v3, v6, v8, v2}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 397
    .line 398
    .line 399
    const/16 v2, 0x37

    .line 400
    .line 401
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 402
    .line 403
    .line 404
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

.method public static addVideoVideoPreset(ILcom/ss/bytertc/engine/video/VideoPreset;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static getVideoVideoPreset()Lcom/ss/bytertc/engine/video/VideoPreset;
    .locals 9

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/RTCData;->instance()Lcom/ss/bytertc/engine/data/RTCData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/RTCData;->getVideoStreamDescriptions()[Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    array-length v1, v0

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    move v4, v3

    .line 13
    move v5, v4

    .line 14
    move v6, v5

    .line 15
    :goto_0
    if-ge v2, v1, :cond_4

    .line 16
    .line 17
    aget-object v7, v0, v2

    .line 18
    .line 19
    iget-object v8, v7, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 20
    .line 21
    iget-object v8, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v8, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    if-le v8, v3, :cond_0

    .line 30
    .line 31
    iget-object v3, v7, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 32
    .line 33
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v3, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    :cond_0
    iget-object v8, v7, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 42
    .line 43
    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v8, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    if-le v8, v4, :cond_1

    .line 52
    .line 53
    iget-object v4, v7, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 54
    .line 55
    iget-object v4, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v4, Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    :cond_1
    iget v8, v7, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 64
    .line 65
    if-le v8, v5, :cond_2

    .line 66
    .line 67
    move v5, v8

    .line 68
    :cond_2
    iget v7, v7, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 69
    .line 70
    if-le v7, v6, :cond_3

    .line 71
    .line 72
    move v6, v7

    .line 73
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    new-instance v0, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 77
    .line 78
    invoke-direct {v0, v3, v4, v5, v6}, Lcom/ss/bytertc/engine/video/VideoPreset;-><init>(IIII)V

    .line 79
    .line 80
    .line 81
    return-object v0
.end method

.method public static getVideoVideoPresetById(I)Lcom/ss/bytertc/engine/video/VideoPreset;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 12
    .line 13
    const/16 v0, 0x21

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/ss/bytertc/engine/video/VideoPreset;

    .line 20
    .line 21
    :cond_0
    return-object p0
.end method

.method public static getsVideoProfileMap()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/ss/bytertc/engine/video/VideoPreset;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoProfile;->sVideoProfileMap:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object v0
.end method
