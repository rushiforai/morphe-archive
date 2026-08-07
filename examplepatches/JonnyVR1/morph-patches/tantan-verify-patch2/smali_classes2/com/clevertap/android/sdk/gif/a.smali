.class Lcom/clevertap/android/sdk/gif/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/gif/a$a;
    }
.end annotation


# static fields
.field private static final y:Ljava/lang/String; = "a"


# instance fields
.field private a:[I

.field private final b:Lcom/clevertap/android/sdk/gif/a$a;

.field private c:[B

.field private d:I

.field private e:I

.field private f:I

.field private g:Lcom/clevertap/android/sdk/gif/c;

.field private h:Z

.field private i:I

.field private j:[B

.field private k:[I

.field private l:Lcom/clevertap/android/sdk/gif/d;

.field private final m:[I

.field private n:[B

.field private o:[S

.field private p:Landroid/graphics/Bitmap;

.field private q:Ljava/nio/ByteBuffer;

.field private r:I

.field private s:Z

.field private t:I

.field private u:[B

.field private v:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private w:I

.field private x:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 25
    new-instance v0, Lcom/clevertap/android/sdk/gif/e;

    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/e;-><init>()V

    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/gif/a;-><init>(Lcom/clevertap/android/sdk/gif/a$a;)V

    return-void
.end method

.method public constructor <init>(Lcom/clevertap/android/sdk/gif/a$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x100

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->m:[I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 12
    .line 13
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->x:I

    .line 14
    .line 15
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 16
    .line 17
    new-instance p1, Lcom/clevertap/android/sdk/gif/c;

    .line 18
    .line 19
    invoke-direct {p1}, Lcom/clevertap/android/sdk/gif/c;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 23
    .line 24
    return-void
.end method

.method private b(III)I
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, p1

    .line 3
    move v2, v0

    .line 4
    move v3, v2

    .line 5
    move v4, v3

    .line 6
    move v5, v4

    .line 7
    move v6, v5

    .line 8
    :goto_0
    iget v7, p0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 9
    .line 10
    add-int/2addr v7, p1

    .line 11
    if-ge v1, v7, :cond_1

    .line 12
    .line 13
    iget-object v7, p0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 14
    .line 15
    array-length v8, v7

    .line 16
    if-ge v1, v8, :cond_1

    .line 17
    .line 18
    if-ge v1, p2, :cond_1

    .line 19
    .line 20
    aget-byte v7, v7, v1

    .line 21
    .line 22
    and-int/lit16 v7, v7, 0xff

    .line 23
    .line 24
    iget-object v8, p0, Lcom/clevertap/android/sdk/gif/a;->a:[I

    .line 25
    .line 26
    aget v7, v8, v7

    .line 27
    .line 28
    if-eqz v7, :cond_0

    .line 29
    .line 30
    shr-int/lit8 v8, v7, 0x18

    .line 31
    .line 32
    and-int/lit16 v8, v8, 0xff

    .line 33
    .line 34
    add-int/2addr v2, v8

    .line 35
    shr-int/lit8 v8, v7, 0x10

    .line 36
    .line 37
    and-int/lit16 v8, v8, 0xff

    .line 38
    .line 39
    add-int/2addr v3, v8

    .line 40
    shr-int/lit8 v8, v7, 0x8

    .line 41
    .line 42
    and-int/lit16 v8, v8, 0xff

    .line 43
    .line 44
    add-int/2addr v4, v8

    .line 45
    and-int/lit16 v7, v7, 0xff

    .line 46
    .line 47
    add-int/2addr v5, v7

    .line 48
    add-int/lit8 v6, v6, 0x1

    .line 49
    .line 50
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    add-int/2addr p1, p3

    .line 54
    move p3, p1

    .line 55
    :goto_1
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 56
    .line 57
    add-int/2addr v1, p1

    .line 58
    if-ge p3, v1, :cond_3

    .line 59
    .line 60
    iget-object v1, p0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 61
    .line 62
    array-length v7, v1

    .line 63
    if-ge p3, v7, :cond_3

    .line 64
    .line 65
    if-ge p3, p2, :cond_3

    .line 66
    .line 67
    aget-byte v1, v1, p3

    .line 68
    .line 69
    and-int/lit16 v1, v1, 0xff

    .line 70
    .line 71
    iget-object v7, p0, Lcom/clevertap/android/sdk/gif/a;->a:[I

    .line 72
    .line 73
    aget v1, v7, v1

    .line 74
    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    shr-int/lit8 v7, v1, 0x18

    .line 78
    .line 79
    and-int/lit16 v7, v7, 0xff

    .line 80
    .line 81
    add-int/2addr v2, v7

    .line 82
    shr-int/lit8 v7, v1, 0x10

    .line 83
    .line 84
    and-int/lit16 v7, v7, 0xff

    .line 85
    .line 86
    add-int/2addr v3, v7

    .line 87
    shr-int/lit8 v7, v1, 0x8

    .line 88
    .line 89
    and-int/lit16 v7, v7, 0xff

    .line 90
    .line 91
    add-int/2addr v4, v7

    .line 92
    and-int/lit16 v1, v1, 0xff

    .line 93
    .line 94
    add-int/2addr v5, v1

    .line 95
    add-int/lit8 v6, v6, 0x1

    .line 96
    .line 97
    :cond_2
    add-int/lit8 p3, p3, 0x1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    if-nez v6, :cond_4

    .line 101
    .line 102
    return v0

    .line 103
    :cond_4
    div-int/2addr v2, v6

    .line 104
    shl-int/lit8 p0, v2, 0x18

    .line 105
    .line 106
    div-int/2addr v3, v6

    .line 107
    shl-int/lit8 p1, v3, 0x10

    .line 108
    .line 109
    or-int/2addr p0, p1

    .line 110
    div-int/2addr v4, v6

    .line 111
    shl-int/lit8 p1, v4, 0x8

    .line 112
    .line 113
    or-int/2addr p0, p1

    .line 114
    div-int/2addr v5, v6

    .line 115
    or-int/2addr p0, v5

    .line 116
    return p0
.end method

.method private c(Lcom/clevertap/android/sdk/gif/b;)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/clevertap/android/sdk/gif/a;->x:I

    .line 7
    .line 8
    iput v2, v0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v3, v0, Lcom/clevertap/android/sdk/gif/a;->q:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iget v4, v1, Lcom/clevertap/android/sdk/gif/b;->a:I

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 17
    .line 18
    .line 19
    :cond_0
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 22
    .line 23
    iget v3, v1, Lcom/clevertap/android/sdk/gif/c;->m:I

    .line 24
    .line 25
    iget v1, v1, Lcom/clevertap/android/sdk/gif/c;->i:I

    .line 26
    .line 27
    :goto_0
    mul-int/2addr v3, v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    iget v3, v1, Lcom/clevertap/android/sdk/gif/b;->g:I

    .line 30
    .line 31
    iget v1, v1, Lcom/clevertap/android/sdk/gif/b;->h:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    array-length v1, v1

    .line 39
    if-ge v1, v3, :cond_3

    .line 40
    .line 41
    :cond_2
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 42
    .line 43
    invoke-interface {v1, v3}, Lcom/clevertap/android/sdk/gif/a$a;->a(I)[B

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 48
    .line 49
    :cond_3
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->o:[S

    .line 50
    .line 51
    const/16 v4, 0x1000

    .line 52
    .line 53
    if-nez v1, :cond_4

    .line 54
    .line 55
    new-array v1, v4, [S

    .line 56
    .line 57
    iput-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->o:[S

    .line 58
    .line 59
    :cond_4
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->u:[B

    .line 60
    .line 61
    if-nez v1, :cond_5

    .line 62
    .line 63
    new-array v1, v4, [B

    .line 64
    .line 65
    iput-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->u:[B

    .line 66
    .line 67
    :cond_5
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 68
    .line 69
    if-nez v1, :cond_6

    .line 70
    .line 71
    const/16 v1, 0x1001

    .line 72
    .line 73
    new-array v1, v1, [B

    .line 74
    .line 75
    iput-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 76
    .line 77
    :cond_6
    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/a;->p()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    const/4 v5, 0x1

    .line 82
    shl-int v6, v5, v1

    .line 83
    .line 84
    add-int/lit8 v7, v6, 0x1

    .line 85
    .line 86
    add-int/lit8 v8, v6, 0x2

    .line 87
    .line 88
    add-int/2addr v1, v5

    .line 89
    shl-int v9, v5, v1

    .line 90
    .line 91
    sub-int/2addr v9, v5

    .line 92
    move v10, v2

    .line 93
    :goto_2
    if-ge v10, v6, :cond_7

    .line 94
    .line 95
    iget-object v11, v0, Lcom/clevertap/android/sdk/gif/a;->o:[S

    .line 96
    .line 97
    aput-short v2, v11, v10

    .line 98
    .line 99
    iget-object v11, v0, Lcom/clevertap/android/sdk/gif/a;->u:[B

    .line 100
    .line 101
    int-to-byte v12, v10

    .line 102
    aput-byte v12, v11, v10

    .line 103
    .line 104
    add-int/lit8 v10, v10, 0x1

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_7
    const/4 v10, -0x1

    .line 108
    move/from16 v19, v1

    .line 109
    .line 110
    move v11, v2

    .line 111
    move v12, v11

    .line 112
    move v13, v12

    .line 113
    move v14, v13

    .line 114
    move v15, v14

    .line 115
    move/from16 v16, v15

    .line 116
    .line 117
    move/from16 v21, v16

    .line 118
    .line 119
    move/from16 v22, v21

    .line 120
    .line 121
    move/from16 v17, v8

    .line 122
    .line 123
    move/from16 v20, v9

    .line 124
    .line 125
    move/from16 v18, v10

    .line 126
    .line 127
    :goto_3
    move/from16 v23, v2

    .line 128
    .line 129
    if-ge v11, v3, :cond_14

    .line 130
    .line 131
    const/4 v2, 0x3

    .line 132
    if-nez v12, :cond_9

    .line 133
    .line 134
    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/a;->o()I

    .line 135
    .line 136
    .line 137
    move-result v12

    .line 138
    if-gtz v12, :cond_8

    .line 139
    .line 140
    iput v2, v0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 141
    .line 142
    goto/16 :goto_a

    .line 143
    .line 144
    :cond_8
    move/from16 v15, v23

    .line 145
    .line 146
    :cond_9
    move/from16 p1, v5

    .line 147
    .line 148
    iget-object v5, v0, Lcom/clevertap/android/sdk/gif/a;->c:[B

    .line 149
    .line 150
    aget-byte v5, v5, v15

    .line 151
    .line 152
    and-int/lit16 v5, v5, 0xff

    .line 153
    .line 154
    shl-int/2addr v5, v13

    .line 155
    add-int/2addr v14, v5

    .line 156
    add-int/lit8 v13, v13, 0x8

    .line 157
    .line 158
    add-int/lit8 v15, v15, 0x1

    .line 159
    .line 160
    add-int/2addr v12, v10

    .line 161
    move/from16 v5, v17

    .line 162
    .line 163
    move/from16 v4, v18

    .line 164
    .line 165
    move/from16 v10, v19

    .line 166
    .line 167
    move/from16 v24, v22

    .line 168
    .line 169
    :goto_4
    if-lt v13, v10, :cond_13

    .line 170
    .line 171
    and-int v2, v14, v20

    .line 172
    .line 173
    shr-int/2addr v14, v10

    .line 174
    sub-int/2addr v13, v10

    .line 175
    if-ne v2, v6, :cond_a

    .line 176
    .line 177
    move v10, v1

    .line 178
    move v5, v8

    .line 179
    move/from16 v20, v9

    .line 180
    .line 181
    const/4 v2, 0x3

    .line 182
    const/4 v4, -0x1

    .line 183
    goto :goto_4

    .line 184
    :cond_a
    if-le v2, v5, :cond_b

    .line 185
    .line 186
    move/from16 v22, v1

    .line 187
    .line 188
    const/4 v1, 0x3

    .line 189
    iput v1, v0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_b
    move/from16 v22, v1

    .line 193
    .line 194
    const/4 v1, 0x3

    .line 195
    if-ne v2, v7, :cond_c

    .line 196
    .line 197
    :goto_5
    move/from16 v18, v4

    .line 198
    .line 199
    move/from16 v17, v5

    .line 200
    .line 201
    move/from16 v19, v10

    .line 202
    .line 203
    move/from16 v1, v22

    .line 204
    .line 205
    move/from16 v2, v23

    .line 206
    .line 207
    move/from16 v22, v24

    .line 208
    .line 209
    :goto_6
    const/16 v4, 0x1000

    .line 210
    .line 211
    const/4 v10, -0x1

    .line 212
    move/from16 v5, p1

    .line 213
    .line 214
    goto :goto_3

    .line 215
    :cond_c
    const/4 v1, -0x1

    .line 216
    if-ne v4, v1, :cond_d

    .line 217
    .line 218
    iget-object v4, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 219
    .line 220
    add-int/lit8 v18, v21, 0x1

    .line 221
    .line 222
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->u:[B

    .line 223
    .line 224
    aget-byte v1, v1, v2

    .line 225
    .line 226
    aput-byte v1, v4, v21

    .line 227
    .line 228
    move v4, v2

    .line 229
    move/from16 v24, v4

    .line 230
    .line 231
    move/from16 v21, v18

    .line 232
    .line 233
    move/from16 v1, v22

    .line 234
    .line 235
    :goto_7
    const/4 v2, 0x3

    .line 236
    goto :goto_4

    .line 237
    :cond_d
    if-lt v2, v5, :cond_e

    .line 238
    .line 239
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 240
    .line 241
    add-int/lit8 v18, v21, 0x1

    .line 242
    .line 243
    move-object/from16 v25, v1

    .line 244
    .line 245
    move/from16 v1, v24

    .line 246
    .line 247
    int-to-byte v1, v1

    .line 248
    aput-byte v1, v25, v21

    .line 249
    .line 250
    move v1, v4

    .line 251
    move/from16 v21, v18

    .line 252
    .line 253
    goto :goto_8

    .line 254
    :cond_e
    move v1, v2

    .line 255
    :goto_8
    if-lt v1, v6, :cond_f

    .line 256
    .line 257
    move/from16 v18, v1

    .line 258
    .line 259
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 260
    .line 261
    add-int/lit8 v24, v21, 0x1

    .line 262
    .line 263
    move-object/from16 v25, v1

    .line 264
    .line 265
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->u:[B

    .line 266
    .line 267
    aget-byte v1, v1, v18

    .line 268
    .line 269
    aput-byte v1, v25, v21

    .line 270
    .line 271
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->o:[S

    .line 272
    .line 273
    aget-short v1, v1, v18

    .line 274
    .line 275
    move/from16 v21, v24

    .line 276
    .line 277
    goto :goto_8

    .line 278
    :cond_f
    move/from16 v18, v1

    .line 279
    .line 280
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->u:[B

    .line 281
    .line 282
    move-object/from16 v24, v1

    .line 283
    .line 284
    aget-byte v1, v24, v18

    .line 285
    .line 286
    and-int/lit16 v1, v1, 0xff

    .line 287
    .line 288
    move/from16 v18, v2

    .line 289
    .line 290
    iget-object v2, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 291
    .line 292
    add-int/lit8 v25, v21, 0x1

    .line 293
    .line 294
    move-object/from16 v26, v2

    .line 295
    .line 296
    int-to-byte v2, v1

    .line 297
    aput-byte v2, v26, v21

    .line 298
    .line 299
    move/from16 v21, v1

    .line 300
    .line 301
    const/16 v1, 0x1000

    .line 302
    .line 303
    if-ge v5, v1, :cond_10

    .line 304
    .line 305
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->o:[S

    .line 306
    .line 307
    int-to-short v4, v4

    .line 308
    aput-short v4, v1, v5

    .line 309
    .line 310
    aput-byte v2, v24, v5

    .line 311
    .line 312
    add-int/lit8 v5, v5, 0x1

    .line 313
    .line 314
    and-int v1, v5, v20

    .line 315
    .line 316
    if-nez v1, :cond_11

    .line 317
    .line 318
    const/16 v1, 0x1000

    .line 319
    .line 320
    if-ge v5, v1, :cond_10

    .line 321
    .line 322
    add-int/lit8 v10, v10, 0x1

    .line 323
    .line 324
    add-int v20, v20, v5

    .line 325
    .line 326
    :cond_10
    :goto_9
    if-lez v25, :cond_12

    .line 327
    .line 328
    iget-object v2, v0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 329
    .line 330
    add-int/lit8 v4, v16, 0x1

    .line 331
    .line 332
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->n:[B

    .line 333
    .line 334
    add-int/lit8 v25, v25, -0x1

    .line 335
    .line 336
    aget-byte v1, v1, v25

    .line 337
    .line 338
    aput-byte v1, v2, v16

    .line 339
    .line 340
    add-int/lit8 v11, v11, 0x1

    .line 341
    .line 342
    move/from16 v16, v4

    .line 343
    .line 344
    :cond_11
    const/16 v1, 0x1000

    .line 345
    .line 346
    goto :goto_9

    .line 347
    :cond_12
    move/from16 v4, v18

    .line 348
    .line 349
    move/from16 v24, v21

    .line 350
    .line 351
    move/from16 v1, v22

    .line 352
    .line 353
    move/from16 v21, v25

    .line 354
    .line 355
    goto :goto_7

    .line 356
    :cond_13
    move/from16 v22, v1

    .line 357
    .line 358
    move/from16 v1, v24

    .line 359
    .line 360
    move/from16 v2, v22

    .line 361
    .line 362
    move/from16 v22, v1

    .line 363
    .line 364
    move v1, v2

    .line 365
    move/from16 v18, v4

    .line 366
    .line 367
    move/from16 v17, v5

    .line 368
    .line 369
    move/from16 v19, v10

    .line 370
    .line 371
    move/from16 v2, v23

    .line 372
    .line 373
    goto/16 :goto_6

    .line 374
    .line 375
    :cond_14
    :goto_a
    move/from16 v1, v16

    .line 376
    .line 377
    :goto_b
    if-ge v1, v3, :cond_15

    .line 378
    .line 379
    iget-object v2, v0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 380
    .line 381
    aput-byte v23, v2, v1

    .line 382
    .line 383
    add-int/lit8 v1, v1, 0x1

    .line 384
    .line 385
    goto :goto_b

    .line 386
    :cond_15
    return-void
.end method

.method private d([ILcom/clevertap/android/sdk/gif/b;I)V
    .locals 4

    .line 1
    iget v0, p2, Lcom/clevertap/android/sdk/gif/b;->h:I

    .line 2
    .line 3
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 4
    .line 5
    div-int/2addr v0, v1

    .line 6
    iget v2, p2, Lcom/clevertap/android/sdk/gif/b;->f:I

    .line 7
    .line 8
    div-int/2addr v2, v1

    .line 9
    iget v3, p2, Lcom/clevertap/android/sdk/gif/b;->g:I

    .line 10
    .line 11
    div-int/2addr v3, v1

    .line 12
    iget p2, p2, Lcom/clevertap/android/sdk/gif/b;->e:I

    .line 13
    .line 14
    div-int/2addr p2, v1

    .line 15
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 16
    .line 17
    mul-int/2addr v2, v1

    .line 18
    add-int/2addr v2, p2

    .line 19
    mul-int/2addr v0, v1

    .line 20
    add-int/2addr v0, v2

    .line 21
    :goto_0
    if-ge v2, v0, :cond_1

    .line 22
    .line 23
    add-int p2, v2, v3

    .line 24
    .line 25
    move v1, v2

    .line 26
    :goto_1
    if-ge v1, p2, :cond_0

    .line 27
    .line 28
    aput p3, p1, v1

    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget p2, p0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 34
    .line 35
    add-int/2addr v2, p2

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method private h()Lcom/clevertap/android/sdk/gif/d;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->l:Lcom/clevertap/android/sdk/gif/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/clevertap/android/sdk/gif/d;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/d;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->l:Lcom/clevertap/android/sdk/gif/d;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/a;->l:Lcom/clevertap/android/sdk/gif/d;

    .line 13
    .line 14
    return-object p0
.end method

.method private j()Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/a;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 9
    .line 10
    :goto_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 11
    .line 12
    iget v2, p0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 13
    .line 14
    iget p0, p0, Lcom/clevertap/android/sdk/gif/a;->d:I

    .line 15
    .line 16
    invoke-interface {v1, v2, p0, v0}, Lcom/clevertap/android/sdk/gif/a$a;->b(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lcom/clevertap/android/sdk/gif/a;->s(Landroid/graphics/Bitmap;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method private o()I
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/a;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    :try_start_0
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->c:[B

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 13
    .line 14
    const/16 v3, 0xff

    .line 15
    .line 16
    invoke-interface {v2, v3}, Lcom/clevertap/android/sdk/gif/a$a;->a(I)[B

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->c:[B

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception v2

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    iget v2, p0, Lcom/clevertap/android/sdk/gif/a;->x:I

    .line 26
    .line 27
    iget v3, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 28
    .line 29
    sub-int/2addr v2, v3

    .line 30
    const/4 v4, 0x0

    .line 31
    if-lt v2, v0, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 34
    .line 35
    iget-object v5, p0, Lcom/clevertap/android/sdk/gif/a;->c:[B

    .line 36
    .line 37
    invoke-static {v2, v3, v5, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    iget v2, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 41
    .line 42
    add-int/2addr v2, v0

    .line 43
    iput v2, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 44
    .line 45
    return v0

    .line 46
    :cond_1
    iget-object v3, p0, Lcom/clevertap/android/sdk/gif/a;->q:Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/nio/Buffer;->remaining()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    add-int/2addr v3, v2

    .line 53
    if-lt v3, v0, :cond_2

    .line 54
    .line 55
    iget-object v3, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 56
    .line 57
    iget v5, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 58
    .line 59
    iget-object v6, p0, Lcom/clevertap/android/sdk/gif/a;->c:[B

    .line 60
    .line 61
    invoke-static {v3, v5, v6, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    .line 63
    .line 64
    iget v3, p0, Lcom/clevertap/android/sdk/gif/a;->x:I

    .line 65
    .line 66
    iput v3, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/a;->q()V

    .line 69
    .line 70
    .line 71
    sub-int v3, v0, v2

    .line 72
    .line 73
    iget-object v5, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 74
    .line 75
    iget-object v6, p0, Lcom/clevertap/android/sdk/gif/a;->c:[B

    .line 76
    .line 77
    invoke-static {v5, v4, v6, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    .line 79
    .line 80
    iget v2, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 81
    .line 82
    add-int/2addr v2, v3

    .line 83
    iput v2, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 84
    .line 85
    return v0

    .line 86
    :cond_2
    iput v1, p0, Lcom/clevertap/android/sdk/gif/a;->t:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    return v0

    .line 89
    :goto_1
    sget-object v3, Lcom/clevertap/android/sdk/gif/a;->y:Ljava/lang/String;

    .line 90
    .line 91
    const-string v4, "Error Reading Block"

    .line 92
    .line 93
    invoke-static {v3, v4, v2}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    iput v1, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 97
    .line 98
    :cond_3
    return v0
.end method

.method private p()I
    .locals 3

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/a;->q()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 5
    .line 6
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 7
    .line 8
    add-int/lit8 v2, v1, 0x1

    .line 9
    .line 10
    iput v2, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 11
    .line 12
    aget-byte p0, v0, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    and-int/lit16 p0, p0, 0xff

    .line 15
    .line 16
    return p0

    .line 17
    :catch_0
    const/4 v0, 0x1

    .line 18
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method private q()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/clevertap/android/sdk/gif/a;->x:I

    .line 2
    .line 3
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 9
    .line 10
    const/16 v1, 0x4000

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Lcom/clevertap/android/sdk/gif/a$a;->a(I)[B

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 21
    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->w:I

    .line 24
    .line 25
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->q:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, p0, Lcom/clevertap/android/sdk/gif/a;->x:I

    .line 36
    .line 37
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->q:Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/a;->v:[B

    .line 40
    .line 41
    invoke-virtual {v2, p0, v0, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private static s(Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xc
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private x(Lcom/clevertap/android/sdk/gif/b;Lcom/clevertap/android/sdk/gif/b;)Landroid/graphics/Bitmap;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lcom/clevertap/android/sdk/gif/a;->k:[I

    .line 8
    .line 9
    const/4 v10, 0x0

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    invoke-static {v3, v10}, Ljava/util/Arrays;->fill([II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v11, 0x3

    .line 16
    const/4 v12, 0x2

    .line 17
    const/4 v13, 0x1

    .line 18
    if-eqz v2, :cond_4

    .line 19
    .line 20
    iget v4, v2, Lcom/clevertap/android/sdk/gif/b;->c:I

    .line 21
    .line 22
    if-lez v4, :cond_4

    .line 23
    .line 24
    if-ne v4, v12, :cond_5

    .line 25
    .line 26
    iget-boolean v4, v1, Lcom/clevertap/android/sdk/gif/b;->k:Z

    .line 27
    .line 28
    if-nez v4, :cond_2

    .line 29
    .line 30
    iget-object v4, v0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 31
    .line 32
    iget v5, v4, Lcom/clevertap/android/sdk/gif/c;->a:I

    .line 33
    .line 34
    iget-object v6, v1, Lcom/clevertap/android/sdk/gif/b;->i:[I

    .line 35
    .line 36
    if-eqz v6, :cond_3

    .line 37
    .line 38
    iget v4, v4, Lcom/clevertap/android/sdk/gif/c;->b:I

    .line 39
    .line 40
    iget v6, v1, Lcom/clevertap/android/sdk/gif/b;->j:I

    .line 41
    .line 42
    if-ne v4, v6, :cond_3

    .line 43
    .line 44
    :cond_1
    :goto_0
    move v5, v10

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget v4, v0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 47
    .line 48
    if-nez v4, :cond_1

    .line 49
    .line 50
    iput-boolean v13, v0, Lcom/clevertap/android/sdk/gif/a;->h:Z

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    :goto_1
    invoke-direct {v0, v3, v2, v5}, Lcom/clevertap/android/sdk/gif/a;->d([ILcom/clevertap/android/sdk/gif/b;I)V

    .line 54
    .line 55
    .line 56
    :cond_4
    :goto_2
    move-object v2, v3

    .line 57
    goto :goto_3

    .line 58
    :cond_5
    if-ne v4, v11, :cond_4

    .line 59
    .line 60
    iget-object v4, v0, Lcom/clevertap/android/sdk/gif/a;->p:Landroid/graphics/Bitmap;

    .line 61
    .line 62
    if-nez v4, :cond_6

    .line 63
    .line 64
    invoke-direct {v0, v3, v2, v10}, Lcom/clevertap/android/sdk/gif/a;->d([ILcom/clevertap/android/sdk/gif/b;I)V

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_6
    iget v5, v2, Lcom/clevertap/android/sdk/gif/b;->h:I

    .line 69
    .line 70
    iget v6, v0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 71
    .line 72
    div-int v9, v5, v6

    .line 73
    .line 74
    iget v5, v2, Lcom/clevertap/android/sdk/gif/b;->f:I

    .line 75
    .line 76
    div-int v7, v5, v6

    .line 77
    .line 78
    iget v5, v2, Lcom/clevertap/android/sdk/gif/b;->g:I

    .line 79
    .line 80
    div-int v8, v5, v6

    .line 81
    .line 82
    iget v2, v2, Lcom/clevertap/android/sdk/gif/b;->e:I

    .line 83
    .line 84
    div-int v6, v2, v6

    .line 85
    .line 86
    iget v5, v0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 87
    .line 88
    mul-int v2, v7, v5

    .line 89
    .line 90
    add-int/2addr v2, v6

    .line 91
    move-object/from16 v17, v4

    .line 92
    .line 93
    move v4, v2

    .line 94
    move-object/from16 v2, v17

    .line 95
    .line 96
    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :goto_3
    invoke-direct/range {p0 .. p1}, Lcom/clevertap/android/sdk/gif/a;->c(Lcom/clevertap/android/sdk/gif/b;)V

    .line 101
    .line 102
    .line 103
    iget v3, v1, Lcom/clevertap/android/sdk/gif/b;->h:I

    .line 104
    .line 105
    iget v4, v0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 106
    .line 107
    div-int/2addr v3, v4

    .line 108
    iget v5, v1, Lcom/clevertap/android/sdk/gif/b;->f:I

    .line 109
    .line 110
    div-int/2addr v5, v4

    .line 111
    iget v6, v1, Lcom/clevertap/android/sdk/gif/b;->g:I

    .line 112
    .line 113
    div-int/2addr v6, v4

    .line 114
    iget v7, v1, Lcom/clevertap/android/sdk/gif/b;->e:I

    .line 115
    .line 116
    div-int/2addr v7, v4

    .line 117
    iget v4, v0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 118
    .line 119
    if-nez v4, :cond_7

    .line 120
    .line 121
    move v4, v13

    .line 122
    goto :goto_4

    .line 123
    :cond_7
    move v4, v10

    .line 124
    :goto_4
    const/16 v8, 0x8

    .line 125
    .line 126
    move v9, v10

    .line 127
    move v14, v13

    .line 128
    :goto_5
    if-ge v10, v3, :cond_12

    .line 129
    .line 130
    iget-boolean v15, v1, Lcom/clevertap/android/sdk/gif/b;->d:Z

    .line 131
    .line 132
    if-eqz v15, :cond_c

    .line 133
    .line 134
    if-lt v9, v3, :cond_b

    .line 135
    .line 136
    add-int/lit8 v14, v14, 0x1

    .line 137
    .line 138
    const/4 v15, 0x4

    .line 139
    if-eq v14, v12, :cond_a

    .line 140
    .line 141
    if-eq v14, v11, :cond_9

    .line 142
    .line 143
    if-eq v14, v15, :cond_8

    .line 144
    .line 145
    goto :goto_6

    .line 146
    :cond_8
    move v8, v12

    .line 147
    move v9, v13

    .line 148
    goto :goto_6

    .line 149
    :cond_9
    move v9, v12

    .line 150
    move v8, v15

    .line 151
    goto :goto_6

    .line 152
    :cond_a
    move v9, v15

    .line 153
    :cond_b
    :goto_6
    add-int v15, v9, v8

    .line 154
    .line 155
    goto :goto_7

    .line 156
    :cond_c
    move v15, v9

    .line 157
    move v9, v10

    .line 158
    :goto_7
    add-int/2addr v9, v5

    .line 159
    iget v11, v0, Lcom/clevertap/android/sdk/gif/a;->d:I

    .line 160
    .line 161
    if-ge v9, v11, :cond_11

    .line 162
    .line 163
    iget v11, v0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 164
    .line 165
    mul-int/2addr v9, v11

    .line 166
    add-int v16, v9, v7

    .line 167
    .line 168
    add-int v12, v16, v6

    .line 169
    .line 170
    add-int v13, v9, v11

    .line 171
    .line 172
    if-ge v13, v12, :cond_d

    .line 173
    .line 174
    add-int v12, v9, v11

    .line 175
    .line 176
    :cond_d
    iget v9, v0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 177
    .line 178
    mul-int v11, v10, v9

    .line 179
    .line 180
    iget v13, v1, Lcom/clevertap/android/sdk/gif/b;->g:I

    .line 181
    .line 182
    mul-int/2addr v11, v13

    .line 183
    sub-int v13, v12, v16

    .line 184
    .line 185
    mul-int/2addr v13, v9

    .line 186
    add-int/2addr v13, v11

    .line 187
    move/from16 v9, v16

    .line 188
    .line 189
    :goto_8
    if-ge v9, v12, :cond_11

    .line 190
    .line 191
    move-object/from16 p2, v2

    .line 192
    .line 193
    iget v2, v0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 194
    .line 195
    move/from16 v16, v3

    .line 196
    .line 197
    const/4 v3, 0x1

    .line 198
    if-ne v2, v3, :cond_e

    .line 199
    .line 200
    iget-object v2, v0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 201
    .line 202
    aget-byte v2, v2, v11

    .line 203
    .line 204
    and-int/lit16 v2, v2, 0xff

    .line 205
    .line 206
    iget-object v3, v0, Lcom/clevertap/android/sdk/gif/a;->a:[I

    .line 207
    .line 208
    aget v2, v3, v2

    .line 209
    .line 210
    goto :goto_9

    .line 211
    :cond_e
    iget v2, v1, Lcom/clevertap/android/sdk/gif/b;->g:I

    .line 212
    .line 213
    invoke-direct {v0, v11, v13, v2}, Lcom/clevertap/android/sdk/gif/a;->b(III)I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    :goto_9
    if-eqz v2, :cond_f

    .line 218
    .line 219
    aput v2, p2, v9

    .line 220
    .line 221
    goto :goto_a

    .line 222
    :cond_f
    iget-boolean v2, v0, Lcom/clevertap/android/sdk/gif/a;->h:Z

    .line 223
    .line 224
    if-nez v2, :cond_10

    .line 225
    .line 226
    if-eqz v4, :cond_10

    .line 227
    .line 228
    const/4 v3, 0x1

    .line 229
    iput-boolean v3, v0, Lcom/clevertap/android/sdk/gif/a;->h:Z

    .line 230
    .line 231
    :cond_10
    :goto_a
    iget v2, v0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 232
    .line 233
    add-int/2addr v11, v2

    .line 234
    add-int/lit8 v9, v9, 0x1

    .line 235
    .line 236
    move-object/from16 v2, p2

    .line 237
    .line 238
    move/from16 v3, v16

    .line 239
    .line 240
    goto :goto_8

    .line 241
    :cond_11
    move-object/from16 p2, v2

    .line 242
    .line 243
    move/from16 v16, v3

    .line 244
    .line 245
    add-int/lit8 v10, v10, 0x1

    .line 246
    .line 247
    move-object/from16 v2, p2

    .line 248
    .line 249
    move v9, v15

    .line 250
    move/from16 v3, v16

    .line 251
    .line 252
    const/4 v11, 0x3

    .line 253
    const/4 v12, 0x2

    .line 254
    const/4 v13, 0x1

    .line 255
    goto :goto_5

    .line 256
    :cond_12
    move-object/from16 p2, v2

    .line 257
    .line 258
    iget-boolean v2, v0, Lcom/clevertap/android/sdk/gif/a;->s:Z

    .line 259
    .line 260
    if-eqz v2, :cond_13

    .line 261
    .line 262
    iget v1, v1, Lcom/clevertap/android/sdk/gif/b;->c:I

    .line 263
    .line 264
    if-eqz v1, :cond_14

    .line 265
    .line 266
    const/4 v3, 0x1

    .line 267
    if-ne v1, v3, :cond_13

    .line 268
    .line 269
    goto :goto_b

    .line 270
    :cond_13
    move-object/from16 v2, p2

    .line 271
    .line 272
    goto :goto_c

    .line 273
    :cond_14
    :goto_b
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->p:Landroid/graphics/Bitmap;

    .line 274
    .line 275
    if-nez v1, :cond_15

    .line 276
    .line 277
    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/a;->j()Landroid/graphics/Bitmap;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    iput-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->p:Landroid/graphics/Bitmap;

    .line 282
    .line 283
    :cond_15
    iget-object v1, v0, Lcom/clevertap/android/sdk/gif/a;->p:Landroid/graphics/Bitmap;

    .line 284
    .line 285
    iget v4, v0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 286
    .line 287
    const/4 v6, 0x0

    .line 288
    iget v8, v0, Lcom/clevertap/android/sdk/gif/a;->d:I

    .line 289
    .line 290
    const/4 v3, 0x0

    .line 291
    const/4 v5, 0x0

    .line 292
    move v7, v4

    .line 293
    move-object/from16 v2, p2

    .line 294
    .line 295
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 296
    .line 297
    .line 298
    :goto_c
    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/a;->j()Landroid/graphics/Bitmap;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    iget v3, v0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 303
    .line 304
    const/4 v5, 0x0

    .line 305
    iget v7, v0, Lcom/clevertap/android/sdk/gif/a;->d:I

    .line 306
    .line 307
    move-object v0, v1

    .line 308
    move-object v1, v2

    .line 309
    const/4 v2, 0x0

    .line 310
    const/4 v4, 0x0

    .line 311
    move v6, v3

    .line 312
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 313
    .line 314
    .line 315
    return-object v0
.end method


# virtual methods
.method public a()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 2
    .line 3
    iget v0, v0, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget v0, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/a;->g()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    sub-int/2addr v2, v3

    .line 17
    if-ne v0, v2, :cond_1

    .line 18
    .line 19
    iget v0, p0, Lcom/clevertap/android/sdk/gif/a;->i:I

    .line 20
    .line 21
    add-int/2addr v0, v3

    .line 22
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->i:I

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 25
    .line 26
    iget v2, v0, Lcom/clevertap/android/sdk/gif/c;->j:I

    .line 27
    .line 28
    const/4 v4, -0x1

    .line 29
    if-eq v2, v4, :cond_2

    .line 30
    .line 31
    iget v4, p0, Lcom/clevertap/android/sdk/gif/a;->i:I

    .line 32
    .line 33
    if-le v4, v2, :cond_2

    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 37
    .line 38
    add-int/2addr v1, v3

    .line 39
    iget v0, v0, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 40
    .line 41
    rem-int/2addr v1, v0

    .line 42
    iput v1, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 43
    .line 44
    return v3
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public f(I)I
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 4
    .line 5
    iget v0, p0, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 6
    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/c;->e:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/clevertap/android/sdk/gif/b;

    .line 16
    .line 17
    iget p0, p0, Lcom/clevertap/android/sdk/gif/b;->b:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, -0x1

    .line 21
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 2
    .line 3
    iget p0, p0, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 4
    .line 5
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 2
    .line 3
    iget p0, p0, Lcom/clevertap/android/sdk/gif/c;->i:I

    .line 4
    .line 5
    return p0
.end method

.method public k()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 2
    .line 3
    iget v0, v0, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, v0}, Lcom/clevertap/android/sdk/gif/a;->f(I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public declared-synchronized l()Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const-string v0, "Unable to decode frame, status="

    .line 2
    .line 3
    const-string v1, "No Valid Color Table for frame #"

    .line 4
    .line 5
    const-string v2, "unable to decode frame, frameCount="

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-object v3, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 9
    .line 10
    iget v3, v3, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    if-lez v3, :cond_0

    .line 14
    .line 15
    iget v3, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 16
    .line 17
    if-gez v3, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto/16 :goto_4

    .line 22
    .line 23
    :cond_0
    :goto_0
    sget-object v3, Lcom/clevertap/android/sdk/gif/a;->y:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v5, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 31
    .line 32
    iget v2, v2, Lcom/clevertap/android/sdk/gif/c;->d:I

    .line 33
    .line 34
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, " framePointer="

    .line 38
    .line 39
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget v2, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 43
    .line 44
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v3, v2}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iput v4, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 55
    .line 56
    :cond_1
    iget v2, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    if-eq v2, v4, :cond_7

    .line 60
    .line 61
    const/4 v5, 0x2

    .line 62
    if-ne v2, v5, :cond_2

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_2
    const/4 v0, 0x0

    .line 66
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 67
    .line 68
    iget-object v2, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 69
    .line 70
    iget-object v2, v2, Lcom/clevertap/android/sdk/gif/c;->e:Ljava/util/List;

    .line 71
    .line 72
    iget v5, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 73
    .line 74
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Lcom/clevertap/android/sdk/gif/b;

    .line 79
    .line 80
    iget v5, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 81
    .line 82
    sub-int/2addr v5, v4

    .line 83
    if-ltz v5, :cond_3

    .line 84
    .line 85
    iget-object v6, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 86
    .line 87
    iget-object v6, v6, Lcom/clevertap/android/sdk/gif/c;->e:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    check-cast v5, Lcom/clevertap/android/sdk/gif/b;

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    move-object v5, v3

    .line 97
    :goto_1
    iget-object v6, v2, Lcom/clevertap/android/sdk/gif/b;->i:[I

    .line 98
    .line 99
    if-eqz v6, :cond_4

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_4
    iget-object v6, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 103
    .line 104
    iget-object v6, v6, Lcom/clevertap/android/sdk/gif/c;->f:[I

    .line 105
    .line 106
    :goto_2
    iput-object v6, p0, Lcom/clevertap/android/sdk/gif/a;->a:[I

    .line 107
    .line 108
    if-nez v6, :cond_5

    .line 109
    .line 110
    sget-object v0, Lcom/clevertap/android/sdk/gif/a;->y:Ljava/lang/String;

    .line 111
    .line 112
    new-instance v2, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget v1, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 118
    .line 119
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iput v4, p0, Lcom/clevertap/android/sdk/gif/a;->t:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    .line 131
    monitor-exit p0

    .line 132
    return-object v3

    .line 133
    :cond_5
    :try_start_1
    iget-boolean v1, v2, Lcom/clevertap/android/sdk/gif/b;->k:Z

    .line 134
    .line 135
    if-eqz v1, :cond_6

    .line 136
    .line 137
    iget-object v1, p0, Lcom/clevertap/android/sdk/gif/a;->m:[I

    .line 138
    .line 139
    array-length v3, v6

    .line 140
    invoke-static {v6, v0, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Lcom/clevertap/android/sdk/gif/a;->m:[I

    .line 144
    .line 145
    iput-object v1, p0, Lcom/clevertap/android/sdk/gif/a;->a:[I

    .line 146
    .line 147
    iget v3, v2, Lcom/clevertap/android/sdk/gif/b;->j:I

    .line 148
    .line 149
    aput v0, v1, v3

    .line 150
    .line 151
    :cond_6
    invoke-direct {p0, v2, v5}, Lcom/clevertap/android/sdk/gif/a;->x(Lcom/clevertap/android/sdk/gif/b;Lcom/clevertap/android/sdk/gif/b;)Landroid/graphics/Bitmap;

    .line 152
    .line 153
    .line 154
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 155
    monitor-exit p0

    .line 156
    return-object v0

    .line 157
    :cond_7
    :goto_3
    :try_start_2
    sget-object v1, Lcom/clevertap/android/sdk/gif/a;->y:Ljava/lang/String;

    .line 158
    .line 159
    new-instance v2, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget v0, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 165
    .line 166
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-static {v1, v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 174
    .line 175
    .line 176
    monitor-exit p0

    .line 177
    return-object v3

    .line 178
    :goto_4
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 179
    throw v0
.end method

.method public m()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 2
    .line 3
    iget p0, p0, Lcom/clevertap/android/sdk/gif/c;->m:I

    .line 4
    .line 5
    return p0
.end method

.method public declared-synchronized n([B)I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/a;->h()Lcom/clevertap/android/sdk/gif/d;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/gif/d;->p([B)Lcom/clevertap/android/sdk/gif/d;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/gif/d;->b()Lcom/clevertap/android/sdk/gif/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Lcom/clevertap/android/sdk/gif/a;->v(Lcom/clevertap/android/sdk/gif/c;[B)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget p1, p0, Lcom/clevertap/android/sdk/gif/a;->t:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return p1

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->i:I

    .line 3
    .line 4
    return-void
.end method

.method public declared-synchronized t(Lcom/clevertap/android/sdk/gif/c;Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/clevertap/android/sdk/gif/a;->u(Lcom/clevertap/android/sdk/gif/c;Ljava/nio/ByteBuffer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw p1
.end method

.method public declared-synchronized u(Lcom/clevertap/android/sdk/gif/c;Ljava/nio/ByteBuffer;I)V
    .locals 2

    .line 1
    const-string v0, "Sample size must be >=0, not: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    if-lez p3, :cond_2

    .line 5
    .line 6
    :try_start_0
    invoke-static {p3}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->t:I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/a;->g:Lcom/clevertap/android/sdk/gif/c;

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/a;->h:Z

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    iput v1, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/a;->r()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iput-object p2, p0, Lcom/clevertap/android/sdk/gif/a;->q:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/clevertap/android/sdk/gif/a;->q:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 35
    .line 36
    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/a;->s:Z

    .line 40
    .line 41
    iget-object p2, p1, Lcom/clevertap/android/sdk/gif/c;->e:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/clevertap/android/sdk/gif/b;

    .line 58
    .line 59
    iget v0, v0, Lcom/clevertap/android/sdk/gif/b;->c:I

    .line 60
    .line 61
    const/4 v1, 0x3

    .line 62
    if-ne v0, v1, :cond_0

    .line 63
    .line 64
    const/4 p2, 0x1

    .line 65
    iput-boolean p2, p0, Lcom/clevertap/android/sdk/gif/a;->s:Z

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catchall_0
    move-exception p1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    :goto_0
    iput p3, p0, Lcom/clevertap/android/sdk/gif/a;->r:I

    .line 71
    .line 72
    iget p2, p1, Lcom/clevertap/android/sdk/gif/c;->m:I

    .line 73
    .line 74
    div-int v0, p2, p3

    .line 75
    .line 76
    iput v0, p0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 77
    .line 78
    iget p1, p1, Lcom/clevertap/android/sdk/gif/c;->i:I

    .line 79
    .line 80
    div-int p3, p1, p3

    .line 81
    .line 82
    iput p3, p0, Lcom/clevertap/android/sdk/gif/a;->d:I

    .line 83
    .line 84
    iget-object p3, p0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 85
    .line 86
    mul-int/2addr p2, p1

    .line 87
    invoke-interface {p3, p2}, Lcom/clevertap/android/sdk/gif/a$a;->a(I)[B

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/a;->j:[B

    .line 92
    .line 93
    iget-object p1, p0, Lcom/clevertap/android/sdk/gif/a;->b:Lcom/clevertap/android/sdk/gif/a$a;

    .line 94
    .line 95
    iget p2, p0, Lcom/clevertap/android/sdk/gif/a;->e:I

    .line 96
    .line 97
    iget p3, p0, Lcom/clevertap/android/sdk/gif/a;->d:I

    .line 98
    .line 99
    mul-int/2addr p2, p3

    .line 100
    invoke-interface {p1, p2}, Lcom/clevertap/android/sdk/gif/a$a;->c(I)[I

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/a;->k:[I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    .line 106
    monitor-exit p0

    .line 107
    return-void

    .line 108
    :cond_2
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 109
    .line 110
    new-instance p2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p1

    .line 126
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    throw p1
.end method

.method public declared-synchronized v(Lcom/clevertap/android/sdk/gif/c;[B)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/gif/a;->t(Lcom/clevertap/android/sdk/gif/c;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw p1
.end method

.method public w(I)Z
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-lt p1, v0, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/a;->g()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-lt p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iput p1, p0, Lcom/clevertap/android/sdk/gif/a;->f:I

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method
