.class public Ll/a33;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a33$a;
    }
.end annotation


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

.method private static a(Ljava/util/HashMap;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-lez p1, :cond_0

    .line 37
    .line 38
    new-instance p1, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_0
    return v0
.end method

.method public static b(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/a33;->c(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/HashMap;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/HashMap;)V
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

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
    if-eqz v0, :cond_9

    .line 8
    .line 9
    if-eqz v1, :cond_9

    .line 10
    .line 11
    new-instance v3, Ljava/io/File;

    .line 12
    .line 13
    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance v3, Ll/a33$a;

    .line 26
    .line 27
    invoke-direct {v3}, Ll/a33$a;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iput v4, v3, Ll/a33$a;->a:I

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iput v4, v3, Ll/a33$a;->b:I

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-nez v4, :cond_1

    .line 47
    .line 48
    const/4 v4, -0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    :goto_0
    iput v4, v3, Ll/a33$a;->c:I

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    mul-int/2addr v4, v5

    .line 65
    mul-int/lit8 v4, v4, 0x4

    .line 66
    .line 67
    iput v4, v3, Ll/a33$a;->d:I

    .line 68
    .line 69
    const-string v4, "PixelXDimension"

    .line 70
    .line 71
    invoke-static {v2, v4}, Ll/a33;->a(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    const-string v6, "PixelYDimension"

    .line 76
    .line 77
    invoke-static {v2, v6}, Ll/a33;->a(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    const-string v8, "ThumbnailImageWidth"

    .line 82
    .line 83
    invoke-static {v2, v8}, Ll/a33;->a(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    const-string v10, "ThumbnailImageLength"

    .line 88
    .line 89
    invoke-static {v2, v10}, Ll/a33;->a(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v11

    .line 93
    const-string v12, "ImageWidth"

    .line 94
    .line 95
    invoke-static {v2, v12}, Ll/a33;->a(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    const-string v14, "ImageLength"

    .line 100
    .line 101
    invoke-static {v2, v14}, Ll/a33;->a(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v15

    .line 105
    move/from16 v16, v5

    .line 106
    .line 107
    iget v5, v3, Ll/a33$a;->a:I

    .line 108
    .line 109
    move/from16 v17, v7

    .line 110
    .line 111
    if-ne v5, v13, :cond_2

    .line 112
    .line 113
    iget v7, v3, Ll/a33$a;->b:I

    .line 114
    .line 115
    if-eq v7, v15, :cond_5

    .line 116
    .line 117
    :cond_2
    if-lez v15, :cond_5

    .line 118
    .line 119
    if-lez v13, :cond_5

    .line 120
    .line 121
    int-to-float v7, v13

    .line 122
    const/high16 v13, 0x3f800000    # 1.0f

    .line 123
    .line 124
    mul-float v18, v7, v13

    .line 125
    .line 126
    int-to-float v15, v15

    .line 127
    div-float v18, v18, v15

    .line 128
    .line 129
    int-to-float v15, v5

    .line 130
    mul-float/2addr v15, v13

    .line 131
    move/from16 v19, v13

    .line 132
    .line 133
    iget v13, v3, Ll/a33$a;->b:I

    .line 134
    .line 135
    move/from16 v20, v7

    .line 136
    .line 137
    int-to-float v7, v13

    .line 138
    div-float/2addr v15, v7

    .line 139
    int-to-float v7, v9

    .line 140
    mul-float v7, v7, v19

    .line 141
    .line 142
    div-float v7, v7, v20

    .line 143
    .line 144
    move/from16 v19, v7

    .line 145
    .line 146
    int-to-float v7, v5

    .line 147
    mul-float v7, v7, v19

    .line 148
    .line 149
    float-to-int v7, v7

    .line 150
    move/from16 v20, v7

    .line 151
    .line 152
    int-to-float v7, v13

    .line 153
    mul-float v7, v7, v19

    .line 154
    .line 155
    float-to-int v7, v7

    .line 156
    if-lez v20, :cond_4

    .line 157
    .line 158
    if-lez v7, :cond_4

    .line 159
    .line 160
    if-gt v9, v5, :cond_3

    .line 161
    .line 162
    if-gt v11, v13, :cond_3

    .line 163
    .line 164
    cmpl-float v5, v18, v15

    .line 165
    .line 166
    if-eqz v5, :cond_4

    .line 167
    .line 168
    :cond_3
    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    invoke-virtual {v2, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    invoke-virtual {v2, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    :cond_4
    iget v5, v3, Ll/a33$a;->a:I

    .line 183
    .line 184
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-virtual {v2, v12, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    iget v5, v3, Ll/a33$a;->b:I

    .line 192
    .line 193
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-virtual {v2, v14, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    if-lez v17, :cond_5

    .line 201
    .line 202
    if-lez v16, :cond_5

    .line 203
    .line 204
    iget v5, v3, Ll/a33$a;->a:I

    .line 205
    .line 206
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    iget v4, v3, Ll/a33$a;->b:I

    .line 214
    .line 215
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v2, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    :cond_5
    if-eqz v2, :cond_6

    .line 223
    .line 224
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-lez v4, :cond_6

    .line 229
    .line 230
    invoke-static {}, Ll/vrq;->b()Ll/vrq;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    invoke-virtual {v4, v2}, Ll/vrq;->d(Ljava/lang/Object;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    goto :goto_1

    .line 239
    :cond_6
    const/4 v2, 0x0

    .line 240
    :goto_1
    if-eqz v2, :cond_7

    .line 241
    .line 242
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    array-length v4, v4

    .line 247
    iput v4, v3, Ll/a33$a;->e:I

    .line 248
    .line 249
    :cond_7
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 250
    .line 251
    .line 252
    move-result v4

    .line 253
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 254
    .line 255
    .line 256
    move-result v5

    .line 257
    mul-int/2addr v4, v5

    .line 258
    mul-int/lit8 v4, v4, 0x4

    .line 259
    .line 260
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    invoke-virtual {v1, v4}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 265
    .line 266
    .line 267
    new-instance v1, Ljava/io/FileOutputStream;

    .line 268
    .line 269
    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v3}, Ll/a33$a;->a()[B

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 277
    .line 278
    .line 279
    const/4 v0, 0x0

    .line 280
    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 288
    .line 289
    .line 290
    if-eqz v2, :cond_8

    .line 291
    .line 292
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-lez v0, :cond_8

    .line 297
    .line 298
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 303
    .line 304
    .line 305
    :cond_8
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    :cond_9
    const-string v0, "Bitmap or path is null"

    .line 313
    .line 314
    invoke-static {v0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    return-void
.end method
