.class public Ll/o1g0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/nio/ByteBuffer;

.field public b:Ll/s1;

.field public c:Ll/r1;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:[I

.field public i:Landroid/graphics/Bitmap$Config;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroid/graphics/Bitmap;

.field public l:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 5
    .line 6
    iput-object v0, p0, Ll/o1g0;->i:Landroid/graphics/Bitmap$Config;

    .line 7
    .line 8
    new-instance v0, Ll/s1;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/s1;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/o1g0;->b:Ll/s1;

    .line 14
    .line 15
    return-void
.end method

.method public static n(I[BI)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/zip/CRC32;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    invoke-virtual {v0, p1, p0, v1}, Ljava/util/zip/CRC32;->update([BII)V

    .line 8
    .line 9
    .line 10
    if-lez p2, :cond_0

    .line 11
    .line 12
    add-int/lit8 v2, p0, 0x4

    .line 13
    .line 14
    invoke-virtual {v0, p1, v2, p2}, Ljava/util/zip/CRC32;->update([BII)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    long-to-int v0, v2

    .line 22
    add-int/2addr p0, v1

    .line 23
    add-int/2addr p0, p2

    .line 24
    invoke-static {v0, p1, p0}, Ll/o1g0;->o(I[BI)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static o(I[BI)V
    .locals 2

    .line 1
    shr-int/lit8 v0, p0, 0x18

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    int-to-byte v0, v0

    .line 6
    aput-byte v0, p1, p2

    .line 7
    .line 8
    add-int/lit8 v0, p2, 0x1

    .line 9
    .line 10
    shr-int/lit8 v1, p0, 0x10

    .line 11
    .line 12
    and-int/lit16 v1, v1, 0xff

    .line 13
    .line 14
    int-to-byte v1, v1

    .line 15
    aput-byte v1, p1, v0

    .line 16
    .line 17
    add-int/lit8 v0, p2, 0x2

    .line 18
    .line 19
    shr-int/lit8 v1, p0, 0x8

    .line 20
    .line 21
    and-int/lit16 v1, v1, 0xff

    .line 22
    .line 23
    int-to-byte v1, v1

    .line 24
    aput-byte v1, p1, v0

    .line 25
    .line 26
    add-int/lit8 p2, p2, 0x3

    .line 27
    .line 28
    and-int/lit16 p0, p0, 0xff

    .line 29
    .line 30
    int-to-byte p0, p0

    .line 31
    aput-byte p0, p1, p2

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public final a([BI)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o1g0;->c:Ll/r1;

    .line 2
    .line 3
    iget v0, v0, Ll/r1;->p:I

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    const/16 v0, 0xc

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/16 p0, 0x8

    .line 21
    .line 22
    new-array v0, p0, [B

    .line 23
    .line 24
    fill-array-data v0, :array_0

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    move v2, v1

    .line 29
    :goto_0
    if-ge v2, p0, :cond_1

    .line 30
    .line 31
    aget-byte v3, v0, v2

    .line 32
    .line 33
    aput-byte v3, p1, p2

    .line 34
    .line 35
    add-int/lit8 p2, p2, 0x1

    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    add-int/lit8 p2, p2, -0x4

    .line 41
    .line 42
    invoke-static {p2, p1, v1}, Ll/o1g0;->n(I[BI)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x49t
        0x45t
        0x4et
        0x44t
    .end array-data
.end method

.method public b()V
    .locals 2

    .line 1
    iget v0, p0, Ll/o1g0;->d:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iget-object v1, p0, Ll/o1g0;->c:Ll/r1;

    .line 6
    .line 7
    iget v1, v1, Ll/uo0;->b:I

    .line 8
    .line 9
    rem-int/2addr v0, v1

    .line 10
    iput v0, p0, Ll/o1g0;->d:I

    .line 11
    .line 12
    return-void
.end method

.method public final c()Landroid/graphics/Bitmap;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/o1g0;->j:Ljava/util/List;

    .line 4
    .line 5
    iget v2, v0, Ll/o1g0;->d:I

    .line 6
    .line 7
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_8

    .line 12
    .line 13
    iget-object v1, v0, Ll/o1g0;->c:Ll/r1;

    .line 14
    .line 15
    iget-object v1, v1, Ll/uo0;->d:Ljava/util/List;

    .line 16
    .line 17
    iget v2, v0, Ll/o1g0;->d:I

    .line 18
    .line 19
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/q1;

    .line 24
    .line 25
    iget v2, v0, Ll/o1g0;->d:I

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    sub-int/2addr v2, v3

    .line 29
    const/4 v4, 0x0

    .line 30
    if-ltz v2, :cond_0

    .line 31
    .line 32
    iget-object v5, v0, Ll/o1g0;->c:Ll/r1;

    .line 33
    .line 34
    iget-object v5, v5, Ll/uo0;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ll/q1;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move-object v2, v4

    .line 44
    :goto_0
    invoke-virtual {v0, v1}, Ll/o1g0;->d(Ll/q1;)Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget-object v6, v0, Ll/o1g0;->c:Ll/r1;

    .line 49
    .line 50
    iget-boolean v6, v6, Ll/r1;->o:Z

    .line 51
    .line 52
    if-eqz v6, :cond_1

    .line 53
    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    iget-object v6, v0, Ll/o1g0;->h:[I

    .line 57
    .line 58
    iget v8, v0, Ll/o1g0;->f:I

    .line 59
    .line 60
    const/4 v10, 0x0

    .line 61
    iget v12, v0, Ll/o1g0;->g:I

    .line 62
    .line 63
    const/4 v7, 0x0

    .line 64
    const/4 v9, 0x0

    .line 65
    move v11, v8

    .line 66
    invoke-virtual/range {v5 .. v12}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 67
    .line 68
    .line 69
    iget-object v6, v0, Ll/o1g0;->k:Landroid/graphics/Bitmap;

    .line 70
    .line 71
    iget-object v7, v0, Ll/o1g0;->h:[I

    .line 72
    .line 73
    iget v9, v0, Ll/o1g0;->f:I

    .line 74
    .line 75
    const/4 v11, 0x0

    .line 76
    iget v13, v0, Ll/o1g0;->g:I

    .line 77
    .line 78
    const/4 v8, 0x0

    .line 79
    move v12, v9

    .line 80
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 81
    .line 82
    .line 83
    iget-object v1, v0, Ll/o1g0;->j:Ljava/util/List;

    .line 84
    .line 85
    iget v2, v0, Ll/o1g0;->d:I

    .line 86
    .line 87
    invoke-interface {v1, v2, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    goto/16 :goto_5

    .line 91
    .line 92
    :cond_1
    invoke-virtual {v0}, Ll/o1g0;->h()Landroid/graphics/Bitmap;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    new-instance v7, Landroid/graphics/Canvas;

    .line 97
    .line 98
    invoke-direct {v7, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 99
    .line 100
    .line 101
    const/4 v8, 0x0

    .line 102
    if-nez v2, :cond_2

    .line 103
    .line 104
    iget-object v9, v0, Ll/o1g0;->l:Landroid/graphics/Bitmap;

    .line 105
    .line 106
    invoke-virtual {v7, v9, v8, v8, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    iget-object v9, v0, Ll/o1g0;->k:Landroid/graphics/Bitmap;

    .line 111
    .line 112
    invoke-virtual {v7, v9, v8, v8, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    iget v8, v1, Ll/q1;->i:I

    .line 116
    .line 117
    const/4 v14, 0x0

    .line 118
    if-nez v8, :cond_3

    .line 119
    .line 120
    iget v8, v1, Ll/q1;->g:I

    .line 121
    .line 122
    iget v9, v1, Ll/q1;->h:I

    .line 123
    .line 124
    iget v10, v1, Ll/q1;->e:I

    .line 125
    .line 126
    add-int/2addr v10, v8

    .line 127
    iget v11, v1, Ll/q1;->f:I

    .line 128
    .line 129
    add-int/2addr v11, v9

    .line 130
    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 131
    .line 132
    .line 133
    sget-object v8, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 134
    .line 135
    invoke-virtual {v7, v14, v8}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 136
    .line 137
    .line 138
    iget v8, v0, Ll/o1g0;->f:I

    .line 139
    .line 140
    iget v9, v0, Ll/o1g0;->g:I

    .line 141
    .line 142
    invoke-virtual {v7, v14, v14, v8, v9}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 143
    .line 144
    .line 145
    :cond_3
    iget v8, v1, Ll/q1;->g:I

    .line 146
    .line 147
    int-to-float v8, v8

    .line 148
    iget v9, v1, Ll/q1;->h:I

    .line 149
    .line 150
    int-to-float v9, v9

    .line 151
    invoke-virtual {v7, v5, v8, v9, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v7, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 158
    .line 159
    .line 160
    iget v4, v1, Ll/to0;->a:I

    .line 161
    .line 162
    const/4 v5, 0x2

    .line 163
    if-eqz v4, :cond_5

    .line 164
    .line 165
    if-eq v4, v3, :cond_5

    .line 166
    .line 167
    if-eq v4, v5, :cond_5

    .line 168
    .line 169
    const/4 v1, 0x3

    .line 170
    if-eq v4, v1, :cond_4

    .line 171
    .line 172
    goto/16 :goto_4

    .line 173
    .line 174
    :cond_4
    if-nez v2, :cond_7

    .line 175
    .line 176
    iget-object v7, v0, Ll/o1g0;->l:Landroid/graphics/Bitmap;

    .line 177
    .line 178
    iget-object v8, v0, Ll/o1g0;->h:[I

    .line 179
    .line 180
    iget v10, v0, Ll/o1g0;->f:I

    .line 181
    .line 182
    const/4 v12, 0x0

    .line 183
    iget v14, v0, Ll/o1g0;->g:I

    .line 184
    .line 185
    const/4 v9, 0x0

    .line 186
    const/4 v11, 0x0

    .line 187
    move v13, v10

    .line 188
    invoke-virtual/range {v7 .. v14}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 189
    .line 190
    .line 191
    iget-object v15, v0, Ll/o1g0;->k:Landroid/graphics/Bitmap;

    .line 192
    .line 193
    iget-object v1, v0, Ll/o1g0;->h:[I

    .line 194
    .line 195
    iget v2, v0, Ll/o1g0;->f:I

    .line 196
    .line 197
    const/16 v20, 0x0

    .line 198
    .line 199
    iget v3, v0, Ll/o1g0;->g:I

    .line 200
    .line 201
    const/16 v17, 0x0

    .line 202
    .line 203
    const/16 v19, 0x0

    .line 204
    .line 205
    move/from16 v21, v2

    .line 206
    .line 207
    move-object/from16 v16, v1

    .line 208
    .line 209
    move/from16 v18, v2

    .line 210
    .line 211
    move/from16 v22, v3

    .line 212
    .line 213
    invoke-virtual/range {v15 .. v22}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 214
    .line 215
    .line 216
    goto :goto_4

    .line 217
    :cond_5
    iget-object v7, v0, Ll/o1g0;->h:[I

    .line 218
    .line 219
    iget v9, v0, Ll/o1g0;->f:I

    .line 220
    .line 221
    const/4 v11, 0x0

    .line 222
    iget v13, v0, Ll/o1g0;->g:I

    .line 223
    .line 224
    const/4 v8, 0x0

    .line 225
    const/4 v10, 0x0

    .line 226
    move v12, v9

    .line 227
    invoke-virtual/range {v6 .. v13}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 228
    .line 229
    .line 230
    iget-object v15, v0, Ll/o1g0;->k:Landroid/graphics/Bitmap;

    .line 231
    .line 232
    iget-object v2, v0, Ll/o1g0;->h:[I

    .line 233
    .line 234
    iget v3, v0, Ll/o1g0;->f:I

    .line 235
    .line 236
    const/16 v20, 0x0

    .line 237
    .line 238
    iget v4, v0, Ll/o1g0;->g:I

    .line 239
    .line 240
    const/16 v17, 0x0

    .line 241
    .line 242
    const/16 v19, 0x0

    .line 243
    .line 244
    move/from16 v21, v3

    .line 245
    .line 246
    move-object/from16 v16, v2

    .line 247
    .line 248
    move/from16 v18, v3

    .line 249
    .line 250
    move/from16 v22, v4

    .line 251
    .line 252
    invoke-virtual/range {v15 .. v22}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 253
    .line 254
    .line 255
    iget v2, v1, Ll/to0;->a:I

    .line 256
    .line 257
    if-ne v2, v5, :cond_7

    .line 258
    .line 259
    iget v2, v1, Ll/q1;->g:I

    .line 260
    .line 261
    :goto_2
    iget v3, v1, Ll/q1;->g:I

    .line 262
    .line 263
    iget v4, v1, Ll/q1;->e:I

    .line 264
    .line 265
    add-int/2addr v3, v4

    .line 266
    if-ge v2, v3, :cond_7

    .line 267
    .line 268
    iget v3, v1, Ll/q1;->h:I

    .line 269
    .line 270
    :goto_3
    iget v4, v1, Ll/q1;->h:I

    .line 271
    .line 272
    iget v5, v1, Ll/q1;->f:I

    .line 273
    .line 274
    add-int/2addr v4, v5

    .line 275
    if-ge v3, v4, :cond_6

    .line 276
    .line 277
    iget-object v4, v0, Ll/o1g0;->k:Landroid/graphics/Bitmap;

    .line 278
    .line 279
    invoke-virtual {v4, v2, v3, v14}, Landroid/graphics/Bitmap;->setPixel(III)V

    .line 280
    .line 281
    .line 282
    add-int/lit8 v3, v3, 0x1

    .line 283
    .line 284
    goto :goto_3

    .line 285
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 286
    .line 287
    goto :goto_2

    .line 288
    :cond_7
    :goto_4
    iget-object v1, v0, Ll/o1g0;->j:Ljava/util/List;

    .line 289
    .line 290
    iget v2, v0, Ll/o1g0;->d:I

    .line 291
    .line 292
    invoke-interface {v1, v2, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 293
    .line 294
    .line 295
    :cond_8
    :goto_5
    iget-object v1, v0, Ll/o1g0;->j:Ljava/util/List;

    .line 296
    .line 297
    iget v0, v0, Ll/o1g0;->d:I

    .line 298
    .line 299
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    check-cast v0, Landroid/graphics/Bitmap;

    .line 304
    .line 305
    return-object v0
.end method

.method public final d(Ll/q1;)Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    iget-object v0, p0, Ll/o1g0;->c:Ll/r1;

    .line 2
    .line 3
    iget v1, v0, Ll/r1;->n:I

    .line 4
    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v1, v0, Ll/r1;->m:I

    .line 9
    .line 10
    :goto_0
    const v2, 0x6663544c

    .line 11
    .line 12
    .line 13
    const v3, 0x6163544c

    .line 14
    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz p1, :cond_3

    .line 18
    .line 19
    iget-boolean v5, p1, Ll/q1;->k:Z

    .line 20
    .line 21
    if-nez v5, :cond_1

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_1
    iget v5, v0, Ll/r1;->m:I

    .line 25
    .line 26
    add-int/lit8 v5, v5, -0x14

    .line 27
    .line 28
    iget-boolean v0, v0, Ll/r1;->o:Z

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/16 v0, 0x26

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v0, v4

    .line 36
    :goto_1
    sub-int/2addr v5, v0

    .line 37
    iget v0, p1, Ll/q1;->j:I

    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x18

    .line 40
    .line 41
    add-int/2addr v5, v0

    .line 42
    goto :goto_4

    .line 43
    :cond_3
    :goto_2
    iget v0, v0, Ll/r1;->m:I

    .line 44
    .line 45
    add-int/lit8 v5, v0, -0x14

    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    add-int/lit8 v5, v0, -0x3a

    .line 50
    .line 51
    :cond_4
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    invoke-virtual {v6, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 54
    .line 55
    .line 56
    :goto_3
    iget-object v0, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-gt v0, v1, :cond_6

    .line 63
    .line 64
    iget-object v0, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->getInt()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eq v6, v3, :cond_5

    .line 77
    .line 78
    if-eq v6, v2, :cond_5

    .line 79
    .line 80
    add-int/lit8 v6, v0, 0xc

    .line 81
    .line 82
    add-int/2addr v5, v6

    .line 83
    :cond_5
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    invoke-virtual {v6}, Ljava/nio/Buffer;->position()I

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    add-int/2addr v7, v0

    .line 90
    add-int/lit8 v7, v7, 0x4

    .line 91
    .line 92
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 93
    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_6
    add-int/lit8 v5, v5, 0xc

    .line 97
    .line 98
    :goto_4
    iget-object v0, p0, Ll/o1g0;->c:Ll/r1;

    .line 99
    .line 100
    iget-object v0, v0, Ll/r1;->q:[Ll/o1;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    array-length v6, v0

    .line 105
    if-lez v6, :cond_7

    .line 106
    .line 107
    array-length v6, v0

    .line 108
    move v7, v4

    .line 109
    :goto_5
    if-ge v7, v6, :cond_7

    .line 110
    .line 111
    aget-object v8, v0, v7

    .line 112
    .line 113
    iget v8, v8, Ll/o1;->a:I

    .line 114
    .line 115
    add-int/2addr v5, v8

    .line 116
    add-int/lit8 v7, v7, 0x1

    .line 117
    .line 118
    goto :goto_5

    .line 119
    :cond_7
    new-array v0, v5, [B

    .line 120
    .line 121
    move v6, v4

    .line 122
    move v7, v6

    .line 123
    :goto_6
    const/16 v8, 0x8

    .line 124
    .line 125
    if-ge v6, v8, :cond_8

    .line 126
    .line 127
    sget-object v8, Ll/p1;->a:[B

    .line 128
    .line 129
    aget-byte v8, v8, v6

    .line 130
    .line 131
    aput-byte v8, v0, v7

    .line 132
    .line 133
    add-int/lit8 v7, v7, 0x1

    .line 134
    .line 135
    add-int/lit8 v6, v6, 0x1

    .line 136
    .line 137
    goto :goto_6

    .line 138
    :cond_8
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 141
    .line 142
    .line 143
    if-eqz p1, :cond_11

    .line 144
    .line 145
    iget-boolean v6, p1, Ll/q1;->k:Z

    .line 146
    .line 147
    if-nez v6, :cond_9

    .line 148
    .line 149
    goto/16 :goto_b

    .line 150
    .line 151
    :cond_9
    :goto_7
    iget-object v1, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    iget-object v6, p0, Ll/o1g0;->c:Ll/r1;

    .line 158
    .line 159
    iget v6, v6, Ll/r1;->m:I

    .line 160
    .line 161
    if-ge v1, v6, :cond_10

    .line 162
    .line 163
    iget-object v1, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->getInt()I

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    if-eq v6, v3, :cond_f

    .line 176
    .line 177
    if-ne v6, v2, :cond_a

    .line 178
    .line 179
    goto :goto_a

    .line 180
    :cond_a
    iget-object v9, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    invoke-virtual {v9}, Ljava/nio/Buffer;->position()I

    .line 183
    .line 184
    .line 185
    move-result v10

    .line 186
    sub-int/2addr v10, v8

    .line 187
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 188
    .line 189
    .line 190
    iget-object v9, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 191
    .line 192
    add-int/lit8 v1, v1, 0xc

    .line 193
    .line 194
    invoke-virtual {v9, v0, v7, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    .line 197
    const v9, 0x49484452

    .line 198
    .line 199
    .line 200
    if-ne v6, v9, :cond_d

    .line 201
    .line 202
    iget-object v6, p0, Ll/o1g0;->c:Ll/r1;

    .line 203
    .line 204
    iget v6, v6, Ll/uo0;->e:I

    .line 205
    .line 206
    iget v9, p1, Ll/q1;->e:I

    .line 207
    .line 208
    const/4 v10, 0x1

    .line 209
    if-eq v6, v9, :cond_b

    .line 210
    .line 211
    add-int/lit8 v6, v7, 0x8

    .line 212
    .line 213
    invoke-static {v9, v0, v6}, Ll/o1g0;->o(I[BI)V

    .line 214
    .line 215
    .line 216
    move v6, v10

    .line 217
    goto :goto_8

    .line 218
    :cond_b
    move v6, v4

    .line 219
    :goto_8
    iget-object v9, p0, Ll/o1g0;->c:Ll/r1;

    .line 220
    .line 221
    iget v9, v9, Ll/uo0;->f:I

    .line 222
    .line 223
    iget v11, p1, Ll/q1;->f:I

    .line 224
    .line 225
    if-eq v9, v11, :cond_c

    .line 226
    .line 227
    add-int/lit8 v6, v7, 0xc

    .line 228
    .line 229
    invoke-static {v11, v0, v6}, Ll/o1g0;->o(I[BI)V

    .line 230
    .line 231
    .line 232
    goto :goto_9

    .line 233
    :cond_c
    move v10, v6

    .line 234
    goto :goto_9

    .line 235
    :cond_d
    move v10, v4

    .line 236
    :goto_9
    if-eqz v10, :cond_e

    .line 237
    .line 238
    add-int/lit8 v6, v7, 0x4

    .line 239
    .line 240
    const/16 v9, 0xd

    .line 241
    .line 242
    invoke-static {v6, v0, v9}, Ll/o1g0;->n(I[BI)V

    .line 243
    .line 244
    .line 245
    :cond_e
    add-int/2addr v7, v1

    .line 246
    goto :goto_7

    .line 247
    :cond_f
    :goto_a
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 248
    .line 249
    invoke-virtual {v6}, Ljava/nio/Buffer;->position()I

    .line 250
    .line 251
    .line 252
    move-result v9

    .line 253
    add-int/2addr v9, v1

    .line 254
    add-int/lit8 v9, v9, 0x4

    .line 255
    .line 256
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 257
    .line 258
    .line 259
    goto :goto_7

    .line 260
    :cond_10
    iget v1, p1, Ll/q1;->j:I

    .line 261
    .line 262
    invoke-static {v1, v0, v7}, Ll/o1g0;->o(I[BI)V

    .line 263
    .line 264
    .line 265
    add-int/lit8 v1, v7, 0x4

    .line 266
    .line 267
    const/16 v2, 0x49

    .line 268
    .line 269
    aput-byte v2, v0, v1

    .line 270
    .line 271
    add-int/lit8 v1, v7, 0x5

    .line 272
    .line 273
    const/16 v2, 0x44

    .line 274
    .line 275
    aput-byte v2, v0, v1

    .line 276
    .line 277
    add-int/lit8 v1, v7, 0x6

    .line 278
    .line 279
    const/16 v2, 0x41

    .line 280
    .line 281
    aput-byte v2, v0, v1

    .line 282
    .line 283
    add-int/lit8 v1, v7, 0x7

    .line 284
    .line 285
    const/16 v2, 0x54

    .line 286
    .line 287
    aput-byte v2, v0, v1

    .line 288
    .line 289
    add-int/lit8 v1, v7, 0x8

    .line 290
    .line 291
    iget-object v2, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 292
    .line 293
    iget v3, p1, Ll/to0;->c:I

    .line 294
    .line 295
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 296
    .line 297
    .line 298
    iget-object v2, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 299
    .line 300
    iget v3, p1, Ll/q1;->j:I

    .line 301
    .line 302
    invoke-virtual {v2, v0, v1, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 303
    .line 304
    .line 305
    add-int/lit8 v7, v7, 0x4

    .line 306
    .line 307
    iget v2, p1, Ll/q1;->j:I

    .line 308
    .line 309
    invoke-static {v7, v0, v2}, Ll/o1g0;->n(I[BI)V

    .line 310
    .line 311
    .line 312
    iget p1, p1, Ll/q1;->j:I

    .line 313
    .line 314
    add-int/2addr v1, p1

    .line 315
    add-int/lit8 v1, v1, 0x4

    .line 316
    .line 317
    goto :goto_c

    .line 318
    :cond_11
    :goto_b
    iget-object p1, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 319
    .line 320
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 321
    .line 322
    .line 323
    move-result p1

    .line 324
    if-gt p1, v1, :cond_13

    .line 325
    .line 326
    iget-object p1, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 327
    .line 328
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 333
    .line 334
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->getInt()I

    .line 335
    .line 336
    .line 337
    move-result v6

    .line 338
    if-eq v6, v3, :cond_12

    .line 339
    .line 340
    if-eq v6, v2, :cond_12

    .line 341
    .line 342
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 343
    .line 344
    invoke-virtual {v6}, Ljava/nio/Buffer;->position()I

    .line 345
    .line 346
    .line 347
    move-result v9

    .line 348
    sub-int/2addr v9, v8

    .line 349
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 350
    .line 351
    .line 352
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 353
    .line 354
    add-int/lit8 p1, p1, 0xc

    .line 355
    .line 356
    invoke-virtual {v6, v0, v7, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 357
    .line 358
    .line 359
    add-int/2addr v7, p1

    .line 360
    goto :goto_b

    .line 361
    :cond_12
    iget-object v6, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 362
    .line 363
    invoke-virtual {v6}, Ljava/nio/Buffer;->position()I

    .line 364
    .line 365
    .line 366
    move-result v9

    .line 367
    add-int/2addr v9, p1

    .line 368
    add-int/lit8 v9, v9, 0x4

    .line 369
    .line 370
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 371
    .line 372
    .line 373
    goto :goto_b

    .line 374
    :cond_13
    move v1, v7

    .line 375
    :goto_c
    iget-object p1, p0, Ll/o1g0;->c:Ll/r1;

    .line 376
    .line 377
    iget-object p1, p1, Ll/r1;->q:[Ll/o1;

    .line 378
    .line 379
    if-eqz p1, :cond_14

    .line 380
    .line 381
    array-length v2, p1

    .line 382
    if-lez v2, :cond_14

    .line 383
    .line 384
    array-length v2, p1

    .line 385
    move v3, v4

    .line 386
    :goto_d
    if-ge v3, v2, :cond_14

    .line 387
    .line 388
    aget-object v6, p1, v3

    .line 389
    .line 390
    iget-object v7, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 391
    .line 392
    iget v8, v6, Ll/o1;->b:I

    .line 393
    .line 394
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 395
    .line 396
    .line 397
    iget-object v7, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 398
    .line 399
    iget v8, v6, Ll/o1;->a:I

    .line 400
    .line 401
    invoke-virtual {v7, v0, v1, v8}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 402
    .line 403
    .line 404
    iget v6, v6, Ll/o1;->a:I

    .line 405
    .line 406
    add-int/2addr v1, v6

    .line 407
    add-int/lit8 v3, v3, 0x1

    .line 408
    .line 409
    goto :goto_d

    .line 410
    :cond_14
    invoke-virtual {p0, v0, v1}, Ll/o1g0;->a([BI)V

    .line 411
    .line 412
    .line 413
    invoke-static {v0, v4, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    return-object p0
.end method

.method public e(I)I
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/o1g0;->c:Ll/r1;

    .line 4
    .line 5
    iget v0, p0, Ll/uo0;->b:I

    .line 6
    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uo0;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/q1;

    .line 16
    .line 17
    iget p0, p0, Ll/to0;->b:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, -0x1

    .line 21
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o1g0;->c:Ll/r1;

    .line 2
    .line 3
    iget p0, p0, Ll/uo0;->b:I

    .line 4
    .line 5
    return p0
.end method

.method public final g()Ll/s1;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o1g0;->b:Ll/s1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/s1;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/s1;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/o1g0;->b:Ll/s1;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/o1g0;->b:Ll/s1;

    .line 13
    .line 14
    return-object p0
.end method

.method public final h()Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget v0, p0, Ll/o1g0;->f:I

    .line 2
    .line 3
    iget v1, p0, Ll/o1g0;->g:I

    .line 4
    .line 5
    iget-object p0, p0, Ll/o1g0;->i:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public i()Landroid/graphics/Bitmap;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o1g0;->c:Ll/r1;

    .line 2
    .line 3
    iget v0, v0, Ll/uo0;->b:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Ll/o1g0;->d:I

    .line 9
    .line 10
    if-gez v0, :cond_1

    .line 11
    .line 12
    :cond_0
    iput v1, p0, Ll/o1g0;->e:I

    .line 13
    .line 14
    :cond_1
    iget v0, p0, Ll/o1g0;->e:I

    .line 15
    .line 16
    if-eq v0, v1, :cond_3

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ll/o1g0;->e:I

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/o1g0;->c()Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public j([B)I
    .locals 1
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/o1g0;->g()Ll/s1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/s1;->r([B)Ll/s1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/s1;->c()Ll/r1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/o1g0;->c:Ll/r1;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0, p1}, Ll/o1g0;->m(Ll/r1;[B)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget p0, p0, Ll/o1g0;->e:I

    .line 21
    .line 22
    return p0
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/o1g0;->d:I

    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/r1;Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1    # Ll/r1;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/o1g0;->e:I

    .line 3
    .line 4
    iput-object p1, p0, Ll/o1g0;->c:Ll/r1;

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    iput v1, p0, Ll/o1g0;->d:I

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/o1g0;->a:Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    iget p2, p1, Ll/uo0;->e:I

    .line 26
    .line 27
    iput p2, p0, Ll/o1g0;->f:I

    .line 28
    .line 29
    iget v0, p1, Ll/uo0;->f:I

    .line 30
    .line 31
    iput v0, p0, Ll/o1g0;->g:I

    .line 32
    .line 33
    mul-int/2addr p2, v0

    .line 34
    new-array p2, p2, [I

    .line 35
    .line 36
    iput-object p2, p0, Ll/o1g0;->h:[I

    .line 37
    .line 38
    new-instance p2, Ljava/util/ArrayList;

    .line 39
    .line 40
    iget v0, p1, Ll/uo0;->b:I

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-static {v0, v1}, Ljava/util/Collections;->nCopies(ILjava/lang/Object;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 48
    .line 49
    .line 50
    iput-object p2, p0, Ll/o1g0;->j:Ljava/util/List;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/o1g0;->h()Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iput-object p2, p0, Ll/o1g0;->k:Landroid/graphics/Bitmap;

    .line 57
    .line 58
    iget-boolean p1, p1, Ll/r1;->o:Z

    .line 59
    .line 60
    if-nez p1, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ll/o1g0;->d(Ll/q1;)Landroid/graphics/Bitmap;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Ll/o1g0;->l:Landroid/graphics/Bitmap;

    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public m(Ll/r1;[B)V
    .locals 0
    .param p1    # Ll/r1;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/o1g0;->l(Ll/r1;Ljava/nio/ByteBuffer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
