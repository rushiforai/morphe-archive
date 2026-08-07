.class public Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static NUM_STEP:I = 0x6

.field public static points68:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static points96:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private facePoints:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    const/16 v1, 0x44

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 9
    .line 10
    new-instance v0, Landroid/util/SparseArray;

    .line 11
    .line 12
    const/16 v1, 0x60

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->transform68Points()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->transform96Points()V

    .line 23
    .line 24
    .line 25
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

.method private static transform68Points()V
    .locals 14

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 2
    .line 3
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 13
    .line 14
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 18
    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 25
    .line 26
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 27
    .line 28
    const/4 v3, 0x4

    .line 29
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 36
    .line 37
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 38
    .line 39
    const/4 v2, 0x6

    .line 40
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 41
    .line 42
    .line 43
    const/4 v4, 0x3

    .line 44
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 48
    .line 49
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 50
    .line 51
    const/16 v4, 0x8

    .line 52
    .line 53
    invoke-direct {v1, v4}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 60
    .line 61
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 62
    .line 63
    const/16 v3, 0xa

    .line 64
    .line 65
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 66
    .line 67
    .line 68
    const/4 v5, 0x5

    .line 69
    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 73
    .line 74
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 75
    .line 76
    const/16 v5, 0xc

    .line 77
    .line 78
    invoke-direct {v1, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 85
    .line 86
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 87
    .line 88
    const/16 v2, 0xe

    .line 89
    .line 90
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 91
    .line 92
    .line 93
    const/4 v6, 0x7

    .line 94
    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 98
    .line 99
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 100
    .line 101
    const/16 v6, 0x10

    .line 102
    .line 103
    invoke-direct {v1, v6}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 110
    .line 111
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 112
    .line 113
    const/16 v4, 0x12

    .line 114
    .line 115
    invoke-direct {v1, v4}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 116
    .line 117
    .line 118
    const/16 v7, 0x9

    .line 119
    .line 120
    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 124
    .line 125
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 126
    .line 127
    const/16 v7, 0x14

    .line 128
    .line 129
    invoke-direct {v1, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 136
    .line 137
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 138
    .line 139
    const/16 v3, 0x16

    .line 140
    .line 141
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 142
    .line 143
    .line 144
    const/16 v8, 0xb

    .line 145
    .line 146
    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 150
    .line 151
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 152
    .line 153
    const/16 v8, 0x18

    .line 154
    .line 155
    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 162
    .line 163
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 164
    .line 165
    const/16 v5, 0x1a

    .line 166
    .line 167
    invoke-direct {v1, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 168
    .line 169
    .line 170
    const/16 v9, 0xd

    .line 171
    .line 172
    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 173
    .line 174
    .line 175
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 176
    .line 177
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 178
    .line 179
    const/16 v9, 0x1c

    .line 180
    .line 181
    invoke-direct {v1, v9}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 185
    .line 186
    .line 187
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 188
    .line 189
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 190
    .line 191
    const/16 v2, 0x1e

    .line 192
    .line 193
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 194
    .line 195
    .line 196
    const/16 v10, 0xf

    .line 197
    .line 198
    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 202
    .line 203
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 204
    .line 205
    const/16 v10, 0x20

    .line 206
    .line 207
    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 214
    .line 215
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 216
    .line 217
    const/16 v6, 0x21

    .line 218
    .line 219
    invoke-direct {v1, v6}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 220
    .line 221
    .line 222
    const/16 v11, 0x11

    .line 223
    .line 224
    invoke-virtual {v0, v11, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 228
    .line 229
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 230
    .line 231
    const/16 v11, 0x22

    .line 232
    .line 233
    invoke-direct {v1, v11}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 240
    .line 241
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 242
    .line 243
    const/16 v4, 0x23

    .line 244
    .line 245
    invoke-direct {v1, v4}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 246
    .line 247
    .line 248
    const/16 v12, 0x13

    .line 249
    .line 250
    invoke-virtual {v0, v12, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 254
    .line 255
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 256
    .line 257
    const/16 v12, 0x24

    .line 258
    .line 259
    invoke-direct {v1, v12}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 266
    .line 267
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 268
    .line 269
    const/16 v7, 0x25

    .line 270
    .line 271
    invoke-direct {v1, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 272
    .line 273
    .line 274
    const/16 v13, 0x15

    .line 275
    .line 276
    invoke-virtual {v0, v13, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 277
    .line 278
    .line 279
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 280
    .line 281
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 282
    .line 283
    const/16 v13, 0x26

    .line 284
    .line 285
    invoke-direct {v1, v13}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 289
    .line 290
    .line 291
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 292
    .line 293
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 294
    .line 295
    const/16 v3, 0x27

    .line 296
    .line 297
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 298
    .line 299
    .line 300
    const/16 v3, 0x17

    .line 301
    .line 302
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 306
    .line 307
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 308
    .line 309
    const/16 v3, 0x28

    .line 310
    .line 311
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 315
    .line 316
    .line 317
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 318
    .line 319
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 320
    .line 321
    const/16 v3, 0x29

    .line 322
    .line 323
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 324
    .line 325
    .line 326
    const/16 v3, 0x19

    .line 327
    .line 328
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 329
    .line 330
    .line 331
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 332
    .line 333
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 334
    .line 335
    const/16 v3, 0x2a

    .line 336
    .line 337
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 341
    .line 342
    .line 343
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 344
    .line 345
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 346
    .line 347
    const/16 v3, 0x2b

    .line 348
    .line 349
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 350
    .line 351
    .line 352
    const/16 v3, 0x1b

    .line 353
    .line 354
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 355
    .line 356
    .line 357
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 358
    .line 359
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 360
    .line 361
    const/16 v3, 0x2c

    .line 362
    .line 363
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 367
    .line 368
    .line 369
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 370
    .line 371
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 372
    .line 373
    const/16 v3, 0x2d

    .line 374
    .line 375
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 376
    .line 377
    .line 378
    const/16 v3, 0x1d

    .line 379
    .line 380
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 381
    .line 382
    .line 383
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 384
    .line 385
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 386
    .line 387
    const/16 v3, 0x2e

    .line 388
    .line 389
    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 393
    .line 394
    .line 395
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 396
    .line 397
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 398
    .line 399
    const/16 v2, 0x2f

    .line 400
    .line 401
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 402
    .line 403
    .line 404
    const/16 v2, 0x1f

    .line 405
    .line 406
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 407
    .line 408
    .line 409
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 410
    .line 411
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 412
    .line 413
    const/16 v2, 0x30

    .line 414
    .line 415
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 422
    .line 423
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 424
    .line 425
    const/16 v2, 0x31

    .line 426
    .line 427
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 434
    .line 435
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 436
    .line 437
    const/16 v2, 0x32

    .line 438
    .line 439
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v0, v11, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 443
    .line 444
    .line 445
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 446
    .line 447
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 448
    .line 449
    const/16 v2, 0x33

    .line 450
    .line 451
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 455
    .line 456
    .line 457
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 458
    .line 459
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 460
    .line 461
    const/16 v2, 0x34

    .line 462
    .line 463
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v0, v12, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 467
    .line 468
    .line 469
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 470
    .line 471
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 472
    .line 473
    const/16 v2, 0x35

    .line 474
    .line 475
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 479
    .line 480
    .line 481
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 482
    .line 483
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 484
    .line 485
    const/16 v2, 0x36

    .line 486
    .line 487
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 488
    .line 489
    .line 490
    const/16 v2, 0x26

    .line 491
    .line 492
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 493
    .line 494
    .line 495
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 496
    .line 497
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 498
    .line 499
    const/16 v2, 0x37

    .line 500
    .line 501
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 502
    .line 503
    .line 504
    const/16 v2, 0x27

    .line 505
    .line 506
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 507
    .line 508
    .line 509
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 510
    .line 511
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 512
    .line 513
    const/16 v2, 0x38

    .line 514
    .line 515
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 516
    .line 517
    .line 518
    const/16 v2, 0x28

    .line 519
    .line 520
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 521
    .line 522
    .line 523
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 524
    .line 525
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 526
    .line 527
    const/16 v2, 0x39

    .line 528
    .line 529
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 530
    .line 531
    .line 532
    const/16 v2, 0x29

    .line 533
    .line 534
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 535
    .line 536
    .line 537
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 538
    .line 539
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 540
    .line 541
    const/16 v2, 0x3a

    .line 542
    .line 543
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 544
    .line 545
    .line 546
    const/16 v2, 0x2a

    .line 547
    .line 548
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 549
    .line 550
    .line 551
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 552
    .line 553
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 554
    .line 555
    const/16 v2, 0x3b

    .line 556
    .line 557
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 558
    .line 559
    .line 560
    const/16 v2, 0x2b

    .line 561
    .line 562
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 563
    .line 564
    .line 565
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 566
    .line 567
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 568
    .line 569
    const/16 v2, 0x3c

    .line 570
    .line 571
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 572
    .line 573
    .line 574
    const/16 v2, 0x2c

    .line 575
    .line 576
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 577
    .line 578
    .line 579
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 580
    .line 581
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 582
    .line 583
    const/16 v2, 0x3d

    .line 584
    .line 585
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 586
    .line 587
    .line 588
    const/16 v2, 0x2d

    .line 589
    .line 590
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 591
    .line 592
    .line 593
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 594
    .line 595
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 596
    .line 597
    const/16 v2, 0x3e

    .line 598
    .line 599
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 600
    .line 601
    .line 602
    const/16 v2, 0x2e

    .line 603
    .line 604
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 605
    .line 606
    .line 607
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 608
    .line 609
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 610
    .line 611
    const/16 v2, 0x3f

    .line 612
    .line 613
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 614
    .line 615
    .line 616
    const/16 v2, 0x2f

    .line 617
    .line 618
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 619
    .line 620
    .line 621
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 622
    .line 623
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 624
    .line 625
    const/16 v2, 0x54

    .line 626
    .line 627
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 628
    .line 629
    .line 630
    const/16 v2, 0x30

    .line 631
    .line 632
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 633
    .line 634
    .line 635
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 636
    .line 637
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 638
    .line 639
    const/16 v2, 0x55

    .line 640
    .line 641
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 642
    .line 643
    .line 644
    const/16 v2, 0x31

    .line 645
    .line 646
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 647
    .line 648
    .line 649
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 650
    .line 651
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 652
    .line 653
    const/16 v2, 0x56

    .line 654
    .line 655
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 656
    .line 657
    .line 658
    const/16 v2, 0x32

    .line 659
    .line 660
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 661
    .line 662
    .line 663
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 664
    .line 665
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 666
    .line 667
    const/16 v2, 0x57

    .line 668
    .line 669
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 670
    .line 671
    .line 672
    const/16 v2, 0x33

    .line 673
    .line 674
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 675
    .line 676
    .line 677
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 678
    .line 679
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 680
    .line 681
    const/16 v2, 0x58

    .line 682
    .line 683
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 684
    .line 685
    .line 686
    const/16 v2, 0x34

    .line 687
    .line 688
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 689
    .line 690
    .line 691
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 692
    .line 693
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 694
    .line 695
    const/16 v2, 0x59

    .line 696
    .line 697
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 698
    .line 699
    .line 700
    const/16 v2, 0x35

    .line 701
    .line 702
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 703
    .line 704
    .line 705
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 706
    .line 707
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 708
    .line 709
    const/16 v2, 0x5a

    .line 710
    .line 711
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 712
    .line 713
    .line 714
    const/16 v2, 0x36

    .line 715
    .line 716
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 717
    .line 718
    .line 719
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 720
    .line 721
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 722
    .line 723
    const/16 v2, 0x5b

    .line 724
    .line 725
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 726
    .line 727
    .line 728
    const/16 v2, 0x37

    .line 729
    .line 730
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 731
    .line 732
    .line 733
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 734
    .line 735
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 736
    .line 737
    const/16 v2, 0x5c

    .line 738
    .line 739
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 740
    .line 741
    .line 742
    const/16 v2, 0x38

    .line 743
    .line 744
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 745
    .line 746
    .line 747
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 748
    .line 749
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 750
    .line 751
    const/16 v2, 0x5d

    .line 752
    .line 753
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 754
    .line 755
    .line 756
    const/16 v2, 0x39

    .line 757
    .line 758
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 759
    .line 760
    .line 761
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 762
    .line 763
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 764
    .line 765
    const/16 v2, 0x5e

    .line 766
    .line 767
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 768
    .line 769
    .line 770
    const/16 v2, 0x3a

    .line 771
    .line 772
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 773
    .line 774
    .line 775
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 776
    .line 777
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 778
    .line 779
    const/16 v2, 0x5f

    .line 780
    .line 781
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 782
    .line 783
    .line 784
    const/16 v2, 0x3b

    .line 785
    .line 786
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 787
    .line 788
    .line 789
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 790
    .line 791
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 792
    .line 793
    const/16 v2, 0x60

    .line 794
    .line 795
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 796
    .line 797
    .line 798
    const/16 v2, 0x3c

    .line 799
    .line 800
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 801
    .line 802
    .line 803
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 804
    .line 805
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 806
    .line 807
    const/16 v2, 0x61

    .line 808
    .line 809
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 810
    .line 811
    .line 812
    const/16 v2, 0x3d

    .line 813
    .line 814
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 815
    .line 816
    .line 817
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 818
    .line 819
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 820
    .line 821
    const/16 v2, 0x62

    .line 822
    .line 823
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 824
    .line 825
    .line 826
    const/16 v2, 0x3e

    .line 827
    .line 828
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 829
    .line 830
    .line 831
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 832
    .line 833
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 834
    .line 835
    const/16 v2, 0x63

    .line 836
    .line 837
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 838
    .line 839
    .line 840
    const/16 v2, 0x3f

    .line 841
    .line 842
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 843
    .line 844
    .line 845
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 846
    .line 847
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 848
    .line 849
    const/16 v2, 0x64

    .line 850
    .line 851
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 852
    .line 853
    .line 854
    const/16 v2, 0x40

    .line 855
    .line 856
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 857
    .line 858
    .line 859
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 860
    .line 861
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 862
    .line 863
    const/16 v2, 0x65

    .line 864
    .line 865
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 866
    .line 867
    .line 868
    const/16 v2, 0x41

    .line 869
    .line 870
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 871
    .line 872
    .line 873
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 874
    .line 875
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 876
    .line 877
    const/16 v2, 0x66

    .line 878
    .line 879
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 880
    .line 881
    .line 882
    const/16 v2, 0x42

    .line 883
    .line 884
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 885
    .line 886
    .line 887
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 888
    .line 889
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 890
    .line 891
    const/16 v2, 0x67

    .line 892
    .line 893
    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    .line 894
    .line 895
    .line 896
    const/16 v2, 0x43

    .line 897
    .line 898
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 899
    .line 900
    .line 901
    return-void
.end method

.method private static transform96Points()V
    .locals 16

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 3
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 4
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 5
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 6
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 7
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x6

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 8
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/4 v2, 0x7

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 9
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0xf

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x8

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 10
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x9

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 11
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0xa

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 12
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0xb

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 13
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0xc

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 14
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0xd

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 15
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0xe

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 16
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x1a

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0xf

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 17
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x1c

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x10

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 18
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x1e

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x11

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 19
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x12

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 20
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x21

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x13

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 21
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x22

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x14

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 22
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x23

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x22

    invoke-virtual {v1, v3, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v3, 0x15

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 23
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x24

    invoke-virtual {v1, v2, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const v4, 0x3f4ccccd    # 0.8f

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v1, v4, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v6, 0x16

    invoke-virtual {v0, v6, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 24
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v6, 0x25

    invoke-virtual {v1, v3, v6}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-virtual {v1, v6, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v7, 0x17

    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 25
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v7, 0x43

    invoke-direct {v1, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v7, 0x18

    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 26
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v7, 0x42

    invoke-direct {v1, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v7, 0x19

    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 27
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v7, 0x41

    invoke-direct {v1, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v8, 0x42

    invoke-virtual {v1, v7, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v8, 0x1a

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 28
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v8, 0x40

    invoke-virtual {v1, v8, v7}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v8, 0x1b

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 29
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v8, 0x40

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v8, 0x1c

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 30
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v8, 0x44

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v8, 0x1d

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 31
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v8, 0x27

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v9, 0x26

    invoke-virtual {v1, v9, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const v9, 0x3f8ccccd    # 1.1f

    invoke-virtual {v1, v9, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v9, 0x1e

    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 32
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v9, 0x28

    invoke-direct {v1, v9}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v8, v9}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v10, 0x1f

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 33
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v9}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v10, 0x29

    invoke-virtual {v1, v9, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v6, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v10, 0x20

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 34
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v10, 0x29

    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v10, 0x21

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 35
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v10, 0x2a

    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v10, 0x22

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 36
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v10, 0x47

    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 37
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x46

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v2, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v6, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 38
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x45

    invoke-virtual {v1, v3, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v3, 0x25

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 39
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x45

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x26

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 40
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x34

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 41
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v8, 0x35

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v3, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 42
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v9, 0x48

    invoke-virtual {v1, v8, v9}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/4 v10, 0x0

    const v11, 0x3e99999a    # 0.3f

    invoke-virtual {v1, v11, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v10, 0x29

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 43
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v9}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v10, 0x2a

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 44
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v10, 0x36

    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v9, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const v12, 0x3f99999a    # 1.2f

    const v13, 0x3f99999a    # 1.2f

    invoke-virtual {v1, v12, v13}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v12, 0x2b

    invoke-virtual {v0, v12, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v12, 0x37

    invoke-virtual {v1, v10, v12}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v6, v4}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v13, 0x2c

    invoke-virtual {v0, v13, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 46
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v12}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v13, 0x2d

    invoke-virtual {v0, v13, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 47
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v13, 0x38

    invoke-direct {v1, v13}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v13, v12}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v11, v11}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v14, 0x2e

    invoke-virtual {v0, v14, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 48
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v13}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v14, 0x49

    invoke-virtual {v1, v14, v13}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v5, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v15, 0x2f

    invoke-virtual {v0, v15, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 49
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v14}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v15, 0x30

    invoke-virtual {v0, v15, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 50
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v15, 0x39

    invoke-direct {v1, v15}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v15, v14}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v4, 0x31

    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v15}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v3, v15}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const v4, 0x3fa66666    # 1.3f

    const v14, 0x3f99999a    # 1.2f

    invoke-virtual {v1, v4, v14}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v4, 0x32

    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 52
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v4, 0x3a

    invoke-direct {v1, v4}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v14, 0x33

    invoke-virtual {v0, v14, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 53
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v14, 0x3b

    invoke-direct {v1, v14}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v4, v14}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 54
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v14}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x4b

    invoke-virtual {v1, v14, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const v3, 0x3e4ccccd    # 0.2f

    invoke-virtual {v1, v11, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 55
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x4b

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v10, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 56
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x3c

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v8, 0x4b

    invoke-virtual {v1, v8, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/high16 v8, 0x3fc00000    # 1.5f

    const/high16 v10, 0x3fc00000    # 1.5f

    invoke-virtual {v1, v8, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v12, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 57
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v8, 0x3d

    invoke-virtual {v1, v3, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v13, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 58
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v15, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 59
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v8, 0x3e

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v10, 0x3d

    invoke-virtual {v1, v8, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/4 v10, 0x0

    invoke-virtual {v1, v6, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 60
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    invoke-direct {v1, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v10, 0x4c

    invoke-virtual {v1, v10, v8}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const v10, 0x3dcccccd    # 0.1f

    invoke-virtual {v1, v5, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v14, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 61
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v10, 0x4c

    invoke-direct {v1, v10}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 62
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x3f

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x3d

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 63
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x3f

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v1, v4, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v5, v6}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 64
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x4e

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x3f

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 65
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x2c

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x4e

    const/16 v4, 0x50

    invoke-virtual {v1, v3, v4}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v11, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v3, 0x40

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 66
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x50

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v7, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 67
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x52

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x42

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 68
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x2f

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x43

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 69
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x30

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x44

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 70
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x32

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v3, 0x45

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 71
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v3, 0x33

    invoke-direct {v1, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 72
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x53

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x47

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 73
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x51

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    invoke-virtual {v0, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x2c

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4f

    const/16 v3, 0x51

    invoke-virtual {v1, v2, v3}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    invoke-virtual {v1, v11, v5}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    move-result-object v1

    const/16 v2, 0x49

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 75
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x4f

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4a

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 76
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x2e

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4b

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 77
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x54

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4c

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 78
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x55

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4d

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 79
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x56

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4e

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 80
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x57

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x4f

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 81
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x58

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x50

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 82
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x59

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x51

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 83
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x5a

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x52

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 84
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x5b

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x53

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 85
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x5c

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x54

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 86
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x5d

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x55

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 87
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x5e

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x56

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 88
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x5f

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x57

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 89
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x60

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x58

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 90
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x61

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x59

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 91
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x62

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x5a

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 92
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x63

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x5b

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 93
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x5c

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 94
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x65

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x5d

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x66

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x5e

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 96
    sget-object v0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    const/16 v2, 0x67

    invoke-direct {v1, v2}, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;-><init>(I)V

    const/16 v2, 0x5f

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public convert96to104([FFFFF)[F
    .locals 9

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0xc0

    .line 3
    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move v2, p2

    .line 11
    move v3, p3

    .line 12
    move v4, p4

    .line 13
    move v5, p5

    .line 14
    invoke-virtual/range {v0 .. v5}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->extend96Points([FFFFF)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    div-int/lit8 p1, p1, 0x2

    .line 23
    .line 24
    const/16 p2, 0x60

    .line 25
    .line 26
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    check-cast p3, Ljava/lang/Float;

    .line 31
    .line 32
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/lit8 p3, p1, 0x60

    .line 37
    .line 38
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    check-cast p4, Ljava/lang/Float;

    .line 43
    .line 44
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    const/16 p4, 0x61

    .line 49
    .line 50
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p4

    .line 54
    check-cast p4, Ljava/lang/Float;

    .line 55
    .line 56
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    add-int/lit8 p4, p1, 0x61

    .line 61
    .line 62
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    check-cast p4, Ljava/lang/Float;

    .line 67
    .line 68
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    const/16 p4, 0x62

    .line 73
    .line 74
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p4

    .line 78
    check-cast p4, Ljava/lang/Float;

    .line 79
    .line 80
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    add-int/lit8 p4, p1, 0x62

    .line 85
    .line 86
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p4

    .line 90
    check-cast p4, Ljava/lang/Float;

    .line 91
    .line 92
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    const/16 p4, 0x63

    .line 97
    .line 98
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    check-cast p4, Ljava/lang/Float;

    .line 103
    .line 104
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    add-int/lit8 p4, p1, 0x63

    .line 109
    .line 110
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p4

    .line 114
    check-cast p4, Ljava/lang/Float;

    .line 115
    .line 116
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->curve4(FFFFFFFF)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object p4

    .line 124
    new-instance p5, Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {p5}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .line 128
    .line 129
    const/4 v0, 0x0

    .line 130
    move v1, v0

    .line 131
    :goto_0
    if-ge v1, p2, :cond_1

    .line 132
    .line 133
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    check-cast v2, Ljava/lang/Float;

    .line 138
    .line 139
    invoke-interface {p5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    add-int/lit8 v1, v1, 0x1

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_1
    move p2, v0

    .line 146
    :goto_1
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-ge p2, v1, :cond_2

    .line 151
    .line 152
    invoke-interface {p4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    check-cast v1, Landroid/graphics/PointF;

    .line 157
    .line 158
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 159
    .line 160
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-interface {p5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    add-int/lit8 p2, p2, 0x1

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_2
    :goto_2
    if-ge p1, p3, :cond_3

    .line 171
    .line 172
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    check-cast p2, Ljava/lang/Float;

    .line 177
    .line 178
    invoke-interface {p5, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    add-int/lit8 p1, p1, 0x1

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_3
    move p0, v0

    .line 185
    :goto_3
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-ge p0, p1, :cond_4

    .line 190
    .line 191
    invoke-interface {p4, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    check-cast p1, Landroid/graphics/PointF;

    .line 196
    .line 197
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 198
    .line 199
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-interface {p5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    add-int/lit8 p0, p0, 0x1

    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_4
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    new-array p0, p0, [F

    .line 214
    .line 215
    :goto_4
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-ge v0, p1, :cond_5

    .line 220
    .line 221
    invoke-interface {p5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    check-cast p1, Ljava/lang/Float;

    .line 226
    .line 227
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    aput p1, p0, v0

    .line 232
    .line 233
    add-int/lit8 v0, v0, 0x1

    .line 234
    .line 235
    goto :goto_4

    .line 236
    :cond_5
    return-object p0
.end method

.method public curve4(FFFFFFFF)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFFFFFF)",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p7

    .line 6
    .line 7
    move/from16 v3, p8

    .line 8
    .line 9
    new-instance v4, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v5, Landroid/graphics/PointF;

    .line 15
    .line 16
    invoke-direct {v5, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    sget v5, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->NUM_STEP:I

    .line 23
    .line 24
    add-int/lit8 v6, v5, 0x1

    .line 25
    .line 26
    int-to-float v6, v6

    .line 27
    const/high16 v7, 0x3f800000    # 1.0f

    .line 28
    .line 29
    div-float/2addr v7, v6

    .line 30
    mul-float v6, v7, v7

    .line 31
    .line 32
    mul-float v8, v6, v7

    .line 33
    .line 34
    const/high16 v9, 0x40400000    # 3.0f

    .line 35
    .line 36
    mul-float/2addr v7, v9

    .line 37
    mul-float v10, v6, v9

    .line 38
    .line 39
    const/high16 v11, 0x40c00000    # 6.0f

    .line 40
    .line 41
    mul-float/2addr v6, v11

    .line 42
    mul-float/2addr v11, v8

    .line 43
    const/high16 v12, 0x40000000    # 2.0f

    .line 44
    .line 45
    mul-float v13, p3, v12

    .line 46
    .line 47
    sub-float v13, v0, v13

    .line 48
    .line 49
    add-float v13, v13, p5

    .line 50
    .line 51
    mul-float v12, v12, p4

    .line 52
    .line 53
    sub-float v12, v1, v12

    .line 54
    .line 55
    add-float v12, v12, p6

    .line 56
    .line 57
    sub-float v14, p3, p5

    .line 58
    .line 59
    mul-float/2addr v14, v9

    .line 60
    sub-float/2addr v14, v0

    .line 61
    add-float/2addr v14, v2

    .line 62
    sub-float v15, p4, p6

    .line 63
    .line 64
    mul-float/2addr v15, v9

    .line 65
    sub-float/2addr v15, v1

    .line 66
    add-float/2addr v15, v3

    .line 67
    sub-float v9, p3, v0

    .line 68
    .line 69
    mul-float/2addr v9, v7

    .line 70
    mul-float v16, v13, v10

    .line 71
    .line 72
    add-float v9, v9, v16

    .line 73
    .line 74
    mul-float v16, v14, v8

    .line 75
    .line 76
    add-float v9, v9, v16

    .line 77
    .line 78
    sub-float v16, p4, v1

    .line 79
    .line 80
    mul-float v16, v16, v7

    .line 81
    .line 82
    mul-float/2addr v10, v12

    .line 83
    add-float v16, v16, v10

    .line 84
    .line 85
    mul-float/2addr v8, v15

    .line 86
    add-float v16, v16, v8

    .line 87
    .line 88
    mul-float/2addr v13, v6

    .line 89
    mul-float/2addr v14, v11

    .line 90
    add-float/2addr v13, v14

    .line 91
    mul-float/2addr v12, v6

    .line 92
    mul-float/2addr v15, v11

    .line 93
    add-float/2addr v12, v15

    .line 94
    :goto_0
    add-int/lit8 v6, v5, -0x1

    .line 95
    .line 96
    if-eqz v5, :cond_0

    .line 97
    .line 98
    add-float/2addr v0, v9

    .line 99
    add-float v1, v1, v16

    .line 100
    .line 101
    add-float/2addr v9, v13

    .line 102
    add-float v16, v16, v12

    .line 103
    .line 104
    add-float/2addr v13, v14

    .line 105
    add-float/2addr v12, v15

    .line 106
    new-instance v5, Landroid/graphics/PointF;

    .line 107
    .line 108
    invoke-direct {v5, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move v5, v6

    .line 115
    goto :goto_0

    .line 116
    :cond_0
    new-instance v0, Landroid/graphics/PointF;

    .line 117
    .line 118
    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 119
    .line 120
    .line 121
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    return-object v4
.end method

.method public extTool([FIIFLjava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([FIIF",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    aget p0, p1, p3

    .line 2
    .line 3
    aget v0, p1, p2

    .line 4
    .line 5
    sub-float/2addr p0, v0

    .line 6
    add-int/lit8 p3, p3, 0x60

    .line 7
    .line 8
    aget p3, p1, p3

    .line 9
    .line 10
    add-int/lit8 p2, p2, 0x60

    .line 11
    .line 12
    aget v1, p1, p2

    .line 13
    .line 14
    sub-float/2addr p3, v1

    .line 15
    mul-float/2addr p0, p4

    .line 16
    add-float/2addr v0, p0

    .line 17
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    aget p0, p1, p2

    .line 25
    .line 26
    mul-float/2addr p4, p3

    .line 27
    add-float/2addr p0, p4

    .line 28
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p6, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public extend96Points([FFFFF)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([FFFFF)",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v6, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v7, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const/16 v3, 0x42

    .line 17
    .line 18
    const/16 v4, 0x31

    .line 19
    .line 20
    move-object v1, p0

    .line 21
    move-object v2, p1

    .line 22
    move v5, p2

    .line 23
    invoke-virtual/range {v1 .. v7}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->extTool([FIIFLjava/util/List;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    const/16 v4, 0x2d

    .line 27
    .line 28
    move v5, p3

    .line 29
    invoke-virtual/range {v1 .. v7}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->extTool([FIIFLjava/util/List;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    const/16 v3, 0x47

    .line 33
    .line 34
    const/16 v4, 0x33

    .line 35
    .line 36
    move v5, p4

    .line 37
    invoke-virtual/range {v1 .. v7}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->extTool([FIIFLjava/util/List;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    const/16 v4, 0x3b

    .line 41
    .line 42
    move v5, p5

    .line 43
    invoke-virtual/range {v1 .. v7}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->extTool([FIIFLjava/util/List;Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    :goto_0
    array-length p1, v2

    .line 48
    div-int/lit8 p1, p1, 0x2

    .line 49
    .line 50
    if-ge p0, p1, :cond_0

    .line 51
    .line 52
    aget p1, v2, p0

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    add-int/lit8 p0, p0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    array-length p0, v2

    .line 68
    div-int/lit8 p0, p0, 0x2

    .line 69
    .line 70
    :goto_1
    array-length p1, v2

    .line 71
    if-ge p0, p1, :cond_1

    .line 72
    .line 73
    aget p1, v2, p0

    .line 74
    .line 75
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    add-int/lit8 p0, p0, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    return-object v0
.end method

.method public get104PointAt(I)Landroid/graphics/PointF;
    .locals 11

    .line 1
    const/16 v0, 0x60

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/PointF;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/16 v2, 0x13

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/16 v3, 0x12

    .line 27
    .line 28
    invoke-virtual {p0, v3}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const/16 v4, 0x10

    .line 33
    .line 34
    invoke-virtual {p0, v4}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    const/4 v5, 0x2

    .line 39
    invoke-virtual {p0, v5}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const/16 v6, 0x17

    .line 44
    .line 45
    invoke-virtual {p0, v6}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    const/16 v7, 0x18

    .line 50
    .line 51
    invoke-virtual {p0, v7}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 56
    .line 57
    iget v8, v1, Landroid/graphics/PointF;->y:F

    .line 58
    .line 59
    sub-float/2addr v5, v8

    .line 60
    const v8, 0x3f4ccccd    # 0.8f

    .line 61
    .line 62
    .line 63
    mul-float/2addr v5, v8

    .line 64
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 65
    .line 66
    iget v9, v3, Landroid/graphics/PointF;->y:F

    .line 67
    .line 68
    sub-float/2addr v4, v9

    .line 69
    mul-float/2addr v4, v8

    .line 70
    const/high16 v8, 0x3fc00000    # 1.5f

    .line 71
    .line 72
    const/high16 v9, 0x3f800000    # 1.0f

    .line 73
    .line 74
    const/high16 v10, 0x40000000    # 2.0f

    .line 75
    .line 76
    packed-switch p1, :pswitch_data_0

    .line 77
    .line 78
    .line 79
    return-object v0

    .line 80
    :pswitch_0
    const/16 p1, 0x22

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iget p1, p0, Landroid/graphics/PointF;->x:F

    .line 87
    .line 88
    iget v1, v3, Landroid/graphics/PointF;->x:F

    .line 89
    .line 90
    sub-float v1, p1, v1

    .line 91
    .line 92
    div-float/2addr v1, v10

    .line 93
    add-float/2addr p1, v1

    .line 94
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 95
    .line 96
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 97
    .line 98
    sub-float/2addr p0, v4

    .line 99
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 100
    .line 101
    return-object v0

    .line 102
    :pswitch_1
    const/16 p1, 0x20

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    iget p1, p0, Landroid/graphics/PointF;->x:F

    .line 109
    .line 110
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 111
    .line 112
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 113
    .line 114
    sub-float/2addr p0, v4

    .line 115
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 116
    .line 117
    return-object v0

    .line 118
    :pswitch_2
    const/16 p1, 0x1f

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    iget p1, p0, Landroid/graphics/PointF;->x:F

    .line 125
    .line 126
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 127
    .line 128
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 129
    .line 130
    mul-float/2addr v4, v9

    .line 131
    sub-float/2addr p0, v4

    .line 132
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 133
    .line 134
    return-object v0

    .line 135
    :pswitch_3
    const/16 p1, 0x1d

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 142
    .line 143
    iget p1, v7, Landroid/graphics/PointF;->x:F

    .line 144
    .line 145
    iget v1, v6, Landroid/graphics/PointF;->x:F

    .line 146
    .line 147
    sub-float/2addr p1, v1

    .line 148
    div-float/2addr p1, v10

    .line 149
    sub-float/2addr p0, p1

    .line 150
    iput p0, v0, Landroid/graphics/PointF;->x:F

    .line 151
    .line 152
    iget p0, v7, Landroid/graphics/PointF;->y:F

    .line 153
    .line 154
    mul-float/2addr v4, v8

    .line 155
    sub-float/2addr p0, v4

    .line 156
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 157
    .line 158
    return-object v0

    .line 159
    :pswitch_4
    iget p0, v7, Landroid/graphics/PointF;->x:F

    .line 160
    .line 161
    iget p1, v6, Landroid/graphics/PointF;->x:F

    .line 162
    .line 163
    sub-float p1, p0, p1

    .line 164
    .line 165
    div-float/2addr p1, v10

    .line 166
    add-float/2addr p0, p1

    .line 167
    iput p0, v0, Landroid/graphics/PointF;->x:F

    .line 168
    .line 169
    iget p0, v7, Landroid/graphics/PointF;->y:F

    .line 170
    .line 171
    mul-float/2addr v5, v8

    .line 172
    sub-float/2addr p0, v5

    .line 173
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 174
    .line 175
    return-object v0

    .line 176
    :pswitch_5
    iget p0, v6, Landroid/graphics/PointF;->x:F

    .line 177
    .line 178
    iput p0, v0, Landroid/graphics/PointF;->x:F

    .line 179
    .line 180
    iget p0, v6, Landroid/graphics/PointF;->y:F

    .line 181
    .line 182
    mul-float/2addr v5, v9

    .line 183
    sub-float/2addr p0, v5

    .line 184
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 185
    .line 186
    return-object v0

    .line 187
    :pswitch_6
    const/16 p1, 0x15

    .line 188
    .line 189
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    iget p1, p0, Landroid/graphics/PointF;->x:F

    .line 194
    .line 195
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 196
    .line 197
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 198
    .line 199
    sub-float/2addr p0, v5

    .line 200
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 201
    .line 202
    return-object v0

    .line 203
    :pswitch_7
    iget p0, v1, Landroid/graphics/PointF;->x:F

    .line 204
    .line 205
    iget p1, v2, Landroid/graphics/PointF;->x:F

    .line 206
    .line 207
    sub-float/2addr p1, p0

    .line 208
    div-float/2addr p1, v10

    .line 209
    add-float/2addr p0, p1

    .line 210
    iput p0, v0, Landroid/graphics/PointF;->x:F

    .line 211
    .line 212
    iget p0, v2, Landroid/graphics/PointF;->y:F

    .line 213
    .line 214
    sub-float/2addr p0, v5

    .line 215
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 216
    .line 217
    return-object v0

    .line 218
    nop

    .line 219
    :pswitch_data_0
    .packed-switch 0x60
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public get96PointAt(I)Landroid/graphics/PointF;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->facePoints:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget-object v1, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points96:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 18
    .line 19
    iget v1, p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interP1:I

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    if-eq v1, v2, :cond_1

    .line 23
    .line 24
    iget v3, p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interP2:I

    .line 25
    .line 26
    if-eq v3, v2, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->facePoints:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 29
    .line 30
    aget-object v1, p0, v1

    .line 31
    .line 32
    aget-object p0, p0, v3

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getX()F

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getX()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {v1}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getX()F

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    sub-float/2addr v3, v4

    .line 47
    const/high16 v4, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr v3, v4

    .line 50
    iget v5, p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interRatioX:F

    .line 51
    .line 52
    mul-float/2addr v3, v5

    .line 53
    add-float/2addr v2, v3

    .line 54
    iput v2, v0, Landroid/graphics/PointF;->x:F

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getY()F

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getY()F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-virtual {v1}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getY()F

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    sub-float/2addr p0, v1

    .line 69
    div-float/2addr p0, v4

    .line 70
    iget p1, p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interRatioY:F

    .line 71
    .line 72
    mul-float/2addr p0, p1

    .line 73
    add-float/2addr v2, p0

    .line 74
    iput v2, v0, Landroid/graphics/PointF;->y:F

    .line 75
    .line 76
    return-object v0

    .line 77
    :cond_1
    iget-object v1, p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->facePoints:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 78
    .line 79
    iget v2, p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->transformPoint:I

    .line 80
    .line 81
    aget-object v1, v1, v2

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getX()F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 88
    .line 89
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->facePoints:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 90
    .line 91
    iget p1, p1, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->transformPoint:I

    .line 92
    .line 93
    aget-object p0, p0, p1

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getY()F

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 100
    .line 101
    return-object v0
.end method

.method public with([Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->facePoints:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    return-object p0
.end method
