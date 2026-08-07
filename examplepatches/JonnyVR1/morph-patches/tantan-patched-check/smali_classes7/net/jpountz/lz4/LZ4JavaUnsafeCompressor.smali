.class final Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;
.super Lnet/jpountz/lz4/LZ4Compressor;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Lnet/jpountz/lz4/LZ4Compressor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;

    .line 2
    .line 3
    invoke-direct {v0}, Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;->INSTANCE:Lnet/jpountz/lz4/LZ4Compressor;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4Compressor;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static compress64k(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v5, p5

    add-int v4, v1, v2

    add-int/lit8 v6, v4, -0x5

    add-int/lit8 v7, v4, -0xc

    const/16 v8, 0xd

    if-lt v2, v8, :cond_8

    const/16 v2, 0x2000

    .line 263
    new-array v2, v2, [S

    add-int/lit8 v8, v1, 0x1

    move/from16 v10, p4

    move v9, v1

    .line 264
    :goto_0
    sget v11, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    const/4 v12, 0x1

    shl-int v11, v12, v11

    :goto_1
    add-int/2addr v12, v8

    add-int/lit8 v13, v11, 0x1

    .line 265
    sget v14, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    ushr-int/2addr v11, v14

    if-le v12, v7, :cond_0

    move/from16 v16, v4

    move v1, v9

    :goto_2
    move v4, v10

    goto/16 :goto_7

    .line 266
    :cond_0
    invoke-static {v0, v8}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    move-result v14

    invoke-static {v14}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    move-result v14

    .line 267
    invoke-static {v2, v14}, Lnet/jpountz/util/UnsafeUtils;->readShort([SI)I

    move-result v15

    add-int/2addr v15, v1

    move/from16 v16, v4

    sub-int v4, v8, v1

    .line 268
    invoke-static {v2, v14, v4}, Lnet/jpountz/util/UnsafeUtils;->writeShort([SII)V

    .line 269
    invoke-static {v0, v15, v8}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 270
    invoke-static {v0, v15, v8, v1, v9}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytesBackward(Ljava/nio/ByteBuffer;IIII)I

    move-result v4

    sub-int/2addr v8, v4

    sub-int/2addr v15, v4

    sub-int v4, v8, v9

    add-int/lit8 v11, v10, 0x1

    add-int v12, v11, v4

    add-int/lit8 v12, v12, 0x8

    ushr-int/lit8 v13, v4, 0x8

    add-int/2addr v12, v13

    .line 271
    const-string v13, "maxDestLen is too small"

    if-gt v12, v5, :cond_6

    const/16 v12, 0xf

    if-lt v4, v12, :cond_1

    const/16 v14, 0xf0

    .line 272
    invoke-static {v3, v10, v14}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    add-int/lit8 v14, v4, -0xf

    .line 273
    invoke-static {v14, v3, v11}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    move-result v11

    goto :goto_3

    :cond_1
    shl-int/lit8 v14, v4, 0x4

    .line 274
    invoke-static {v3, v10, v14}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    .line 275
    :goto_3
    invoke-static {v0, v9, v3, v11, v4}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    add-int/2addr v11, v4

    :goto_4
    sub-int v4, v8, v15

    int-to-short v4, v4

    .line 276
    invoke-static {v3, v11, v4}, Lnet/jpountz/util/ByteBufferUtils;->writeShortLE(Ljava/nio/ByteBuffer;II)V

    add-int/lit8 v4, v11, 0x2

    add-int/lit8 v8, v8, 0x4

    add-int/lit8 v15, v15, 0x4

    .line 277
    invoke-static {v0, v15, v8, v6}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytes(Ljava/nio/ByteBuffer;III)I

    move-result v9

    add-int/lit8 v11, v11, 0x8

    ushr-int/lit8 v14, v9, 0x8

    add-int/2addr v11, v14

    if-gt v11, v5, :cond_5

    add-int/2addr v8, v9

    if-lt v9, v12, :cond_2

    .line 278
    invoke-static {v3, v10}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    move-result v11

    or-int/2addr v11, v12

    invoke-static {v3, v10, v11}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    add-int/lit8 v9, v9, -0xf

    .line 279
    invoke-static {v9, v3, v4}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    move-result v4

    :goto_5
    move v10, v4

    goto :goto_6

    .line 280
    :cond_2
    invoke-static {v3, v10}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    move-result v11

    or-int/2addr v9, v11

    invoke-static {v3, v10, v9}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    goto :goto_5

    :goto_6
    if-le v8, v7, :cond_3

    move v1, v8

    goto/16 :goto_2

    :cond_3
    add-int/lit8 v4, v8, -0x2

    .line 281
    invoke-static {v0, v4}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    move-result v9

    invoke-static {v9}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    move-result v9

    sub-int/2addr v4, v1

    invoke-static {v2, v9, v4}, Lnet/jpountz/util/UnsafeUtils;->writeShort([SII)V

    .line 282
    invoke-static {v0, v8}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    move-result v4

    invoke-static {v4}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    move-result v4

    .line 283
    invoke-static {v2, v4}, Lnet/jpountz/util/UnsafeUtils;->readShort([SI)I

    move-result v9

    add-int v15, v1, v9

    sub-int v9, v8, v1

    .line 284
    invoke-static {v2, v4, v9}, Lnet/jpountz/util/UnsafeUtils;->writeShort([SII)V

    .line 285
    invoke-static {v0, v8, v15}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    move-result v4

    if-nez v4, :cond_4

    add-int/lit8 v4, v8, 0x1

    move v9, v8

    move v8, v4

    move/from16 v4, v16

    goto/16 :goto_0

    :cond_4
    add-int/lit8 v11, v10, 0x1

    const/4 v4, 0x0

    .line 286
    invoke-static {v3, v10, v4}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    goto :goto_4

    .line 287
    :cond_5
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    invoke-direct {v0, v13}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_6
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    invoke-direct {v0, v13}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    move v8, v12

    move/from16 v4, v16

    move v12, v11

    move v11, v13

    goto/16 :goto_1

    :cond_8
    move/from16 v16, v4

    move/from16 v4, p4

    :goto_7
    sub-int v2, v16, v1

    .line 289
    invoke-static/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->lastLiterals(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I

    move-result v0

    sub-int v0, v0, p4

    return v0
.end method

.method public static compress64k([BII[BII)I
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move/from16 v5, p5

    .line 10
    .line 11
    add-int v4, v1, v2

    .line 12
    .line 13
    add-int/lit8 v6, v4, -0x5

    .line 14
    .line 15
    add-int/lit8 v7, v4, -0xc

    .line 16
    .line 17
    const/16 v8, 0xd

    .line 18
    .line 19
    if-lt v2, v8, :cond_8

    .line 20
    .line 21
    const/16 v2, 0x2000

    .line 22
    .line 23
    new-array v2, v2, [S

    .line 24
    .line 25
    add-int/lit8 v8, v1, 0x1

    .line 26
    .line 27
    move/from16 v10, p4

    .line 28
    .line 29
    move v9, v1

    .line 30
    :goto_0
    sget v11, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    .line 31
    .line 32
    const/4 v12, 0x1

    .line 33
    shl-int v11, v12, v11

    .line 34
    .line 35
    :goto_1
    add-int/2addr v12, v8

    .line 36
    add-int/lit8 v13, v11, 0x1

    .line 37
    .line 38
    sget v14, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    .line 39
    .line 40
    ushr-int/2addr v11, v14

    .line 41
    if-le v12, v7, :cond_0

    .line 42
    .line 43
    move/from16 v16, v4

    .line 44
    .line 45
    move v1, v9

    .line 46
    :goto_2
    move v4, v10

    .line 47
    goto/16 :goto_7

    .line 48
    .line 49
    :cond_0
    invoke-static {v0, v8}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 50
    .line 51
    .line 52
    move-result v14

    .line 53
    invoke-static {v14}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    .line 54
    .line 55
    .line 56
    move-result v14

    .line 57
    invoke-static {v2, v14}, Lnet/jpountz/util/UnsafeUtils;->readShort([SI)I

    .line 58
    .line 59
    .line 60
    move-result v15

    .line 61
    add-int/2addr v15, v1

    .line 62
    move/from16 v16, v4

    .line 63
    .line 64
    sub-int v4, v8, v1

    .line 65
    .line 66
    invoke-static {v2, v14, v4}, Lnet/jpountz/util/UnsafeUtils;->writeShort([SII)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v15, v8}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->readIntEquals([BII)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_7

    .line 74
    .line 75
    invoke-static {v0, v15, v8, v1, v9}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->commonBytesBackward([BIIII)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    sub-int/2addr v8, v4

    .line 80
    sub-int/2addr v15, v4

    .line 81
    sub-int v4, v8, v9

    .line 82
    .line 83
    add-int/lit8 v11, v10, 0x1

    .line 84
    .line 85
    add-int v12, v11, v4

    .line 86
    .line 87
    add-int/lit8 v12, v12, 0x8

    .line 88
    .line 89
    ushr-int/lit8 v13, v4, 0x8

    .line 90
    .line 91
    add-int/2addr v12, v13

    .line 92
    const-string v13, "maxDestLen is too small"

    .line 93
    .line 94
    if-gt v12, v5, :cond_6

    .line 95
    .line 96
    const/16 v12, 0xf

    .line 97
    .line 98
    if-lt v4, v12, :cond_1

    .line 99
    .line 100
    const/16 v14, 0xf0

    .line 101
    .line 102
    invoke-static {v3, v10, v14}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 103
    .line 104
    .line 105
    add-int/lit8 v14, v4, -0xf

    .line 106
    .line 107
    invoke-static {v14, v3, v11}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->writeLen(I[BI)I

    .line 108
    .line 109
    .line 110
    move-result v11

    .line 111
    goto :goto_3

    .line 112
    :cond_1
    shl-int/lit8 v14, v4, 0x4

    .line 113
    .line 114
    invoke-static {v3, v10, v14}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 115
    .line 116
    .line 117
    :goto_3
    invoke-static {v0, v9, v3, v11, v4}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->wildArraycopy([BI[BII)V

    .line 118
    .line 119
    .line 120
    add-int/2addr v11, v4

    .line 121
    :goto_4
    sub-int v4, v8, v15

    .line 122
    .line 123
    int-to-short v4, v4

    .line 124
    invoke-static {v3, v11, v4}, Lnet/jpountz/util/UnsafeUtils;->writeShortLE([BII)V

    .line 125
    .line 126
    .line 127
    add-int/lit8 v4, v11, 0x2

    .line 128
    .line 129
    add-int/lit8 v8, v8, 0x4

    .line 130
    .line 131
    add-int/lit8 v15, v15, 0x4

    .line 132
    .line 133
    invoke-static {v0, v15, v8, v6}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->commonBytes([BIII)I

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    add-int/lit8 v11, v11, 0x8

    .line 138
    .line 139
    ushr-int/lit8 v14, v9, 0x8

    .line 140
    .line 141
    add-int/2addr v11, v14

    .line 142
    if-gt v11, v5, :cond_5

    .line 143
    .line 144
    add-int/2addr v8, v9

    .line 145
    if-lt v9, v12, :cond_2

    .line 146
    .line 147
    invoke-static {v3, v10}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 148
    .line 149
    .line 150
    move-result v11

    .line 151
    or-int/2addr v11, v12

    .line 152
    invoke-static {v3, v10, v11}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 153
    .line 154
    .line 155
    add-int/lit8 v9, v9, -0xf

    .line 156
    .line 157
    invoke-static {v9, v3, v4}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->writeLen(I[BI)I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    :goto_5
    move v10, v4

    .line 162
    goto :goto_6

    .line 163
    :cond_2
    invoke-static {v3, v10}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 164
    .line 165
    .line 166
    move-result v11

    .line 167
    or-int/2addr v9, v11

    .line 168
    invoke-static {v3, v10, v9}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 169
    .line 170
    .line 171
    goto :goto_5

    .line 172
    :goto_6
    if-le v8, v7, :cond_3

    .line 173
    .line 174
    move v1, v8

    .line 175
    goto/16 :goto_2

    .line 176
    .line 177
    :cond_3
    add-int/lit8 v4, v8, -0x2

    .line 178
    .line 179
    invoke-static {v0, v4}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 180
    .line 181
    .line 182
    move-result v9

    .line 183
    invoke-static {v9}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    .line 184
    .line 185
    .line 186
    move-result v9

    .line 187
    sub-int/2addr v4, v1

    .line 188
    invoke-static {v2, v9, v4}, Lnet/jpountz/util/UnsafeUtils;->writeShort([SII)V

    .line 189
    .line 190
    .line 191
    invoke-static {v0, v8}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    invoke-static {v4}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    .line 196
    .line 197
    .line 198
    move-result v4

    .line 199
    invoke-static {v2, v4}, Lnet/jpountz/util/UnsafeUtils;->readShort([SI)I

    .line 200
    .line 201
    .line 202
    move-result v9

    .line 203
    add-int v15, v1, v9

    .line 204
    .line 205
    sub-int v9, v8, v1

    .line 206
    .line 207
    invoke-static {v2, v4, v9}, Lnet/jpountz/util/UnsafeUtils;->writeShort([SII)V

    .line 208
    .line 209
    .line 210
    invoke-static {v0, v8, v15}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->readIntEquals([BII)Z

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    if-nez v4, :cond_4

    .line 215
    .line 216
    add-int/lit8 v4, v8, 0x1

    .line 217
    .line 218
    move v9, v8

    .line 219
    move v8, v4

    .line 220
    move/from16 v4, v16

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :cond_4
    add-int/lit8 v11, v10, 0x1

    .line 225
    .line 226
    const/4 v4, 0x0

    .line 227
    invoke-static {v3, v10, v4}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 228
    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_5
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    .line 232
    .line 233
    invoke-direct {v0, v13}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    throw v0

    .line 237
    :cond_6
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    .line 238
    .line 239
    invoke-direct {v0, v13}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    throw v0

    .line 243
    :cond_7
    move v8, v12

    .line 244
    move/from16 v4, v16

    .line 245
    .line 246
    move v12, v11

    .line 247
    move v11, v13

    .line 248
    goto/16 :goto_1

    .line 249
    .line 250
    :cond_8
    move/from16 v16, v4

    .line 251
    .line 252
    move/from16 v4, p4

    .line 253
    .line 254
    :goto_7
    sub-int v2, v16, v1

    .line 255
    .line 256
    invoke-static/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->lastLiterals([BII[BII)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    sub-int v0, v0, p4

    .line 261
    .line 262
    return v0
.end method


# virtual methods
.method public compress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I
    .locals 18

    .line 1
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move/from16 v0, p2

    .line 14
    .line 15
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    add-int/2addr v2, v0

    .line 24
    move/from16 v3, p5

    .line 25
    .line 26
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->array()[B

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int v5, v3, v0

    .line 35
    .line 36
    move-object/from16 v0, p0

    .line 37
    .line 38
    move/from16 v3, p3

    .line 39
    .line 40
    move/from16 v6, p6

    .line 41
    .line 42
    invoke-virtual/range {v0 .. v6}, Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;->compress([BII[BII)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    return v0

    .line 47
    :cond_0
    move/from16 v0, p2

    .line 48
    .line 49
    move/from16 v2, p3

    .line 50
    .line 51
    move/from16 v3, p5

    .line 52
    .line 53
    move/from16 v6, p6

    .line 54
    .line 55
    invoke-static/range {p1 .. p1}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static/range {p4 .. p4}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-static {v1, v0, v2}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 64
    .line 65
    .line 66
    invoke-static {v4, v3, v6}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 67
    .line 68
    .line 69
    add-int v5, v3, v6

    .line 70
    .line 71
    const v6, 0x1000b

    .line 72
    .line 73
    .line 74
    if-ge v2, v6, :cond_1

    .line 75
    .line 76
    move-object/from16 v17, v1

    .line 77
    .line 78
    move v1, v0

    .line 79
    move-object/from16 v0, v17

    .line 80
    .line 81
    move-object/from16 v17, v4

    .line 82
    .line 83
    move v4, v3

    .line 84
    move-object/from16 v3, v17

    .line 85
    .line 86
    invoke-static/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;->compress64k(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    return v0

    .line 91
    :cond_1
    move-object v3, v1

    .line 92
    move v1, v0

    .line 93
    move-object v0, v3

    .line 94
    move-object v3, v4

    .line 95
    add-int v2, v1, p3

    .line 96
    .line 97
    add-int/lit8 v4, v2, -0x5

    .line 98
    .line 99
    add-int/lit8 v6, v2, -0xc

    .line 100
    .line 101
    add-int/lit8 v7, v1, 0x1

    .line 102
    .line 103
    const/16 v8, 0x1000

    .line 104
    .line 105
    new-array v8, v8, [I

    .line 106
    .line 107
    invoke-static {v8, v1}, Ljava/util/Arrays;->fill([II)V

    .line 108
    .line 109
    .line 110
    move/from16 v9, p5

    .line 111
    .line 112
    move v10, v7

    .line 113
    move v7, v1

    .line 114
    :goto_0
    sget v11, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    .line 115
    .line 116
    const/4 v12, 0x1

    .line 117
    shl-int v11, v12, v11

    .line 118
    .line 119
    :goto_1
    add-int/2addr v12, v10

    .line 120
    add-int/lit8 v13, v11, 0x1

    .line 121
    .line 122
    sget v14, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    .line 123
    .line 124
    ushr-int/2addr v11, v14

    .line 125
    if-le v12, v6, :cond_2

    .line 126
    .line 127
    move/from16 p0, v2

    .line 128
    .line 129
    move v1, v7

    .line 130
    :goto_2
    move v4, v9

    .line 131
    goto/16 :goto_7

    .line 132
    .line 133
    :cond_2
    invoke-static {v0, v10}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    .line 134
    .line 135
    .line 136
    move-result v14

    .line 137
    invoke-static {v14}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    .line 138
    .line 139
    .line 140
    move-result v14

    .line 141
    invoke-static {v8, v14}, Lnet/jpountz/util/UnsafeUtils;->readInt([II)I

    .line 142
    .line 143
    .line 144
    move-result v15

    .line 145
    move/from16 p0, v2

    .line 146
    .line 147
    sub-int v2, v10, v15

    .line 148
    .line 149
    invoke-static {v8, v14, v10}, Lnet/jpountz/util/UnsafeUtils;->writeInt([III)V

    .line 150
    .line 151
    .line 152
    const/high16 v14, 0x10000

    .line 153
    .line 154
    if-ge v2, v14, :cond_a

    .line 155
    .line 156
    invoke-static {v0, v15, v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    .line 157
    .line 158
    .line 159
    move-result v16

    .line 160
    if-eqz v16, :cond_a

    .line 161
    .line 162
    invoke-static {v0, v15, v10, v1, v7}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytesBackward(Ljava/nio/ByteBuffer;IIII)I

    .line 163
    .line 164
    .line 165
    move-result v11

    .line 166
    sub-int/2addr v10, v11

    .line 167
    sub-int/2addr v15, v11

    .line 168
    sub-int v11, v10, v7

    .line 169
    .line 170
    add-int/lit8 v12, v9, 0x1

    .line 171
    .line 172
    add-int v13, v12, v11

    .line 173
    .line 174
    add-int/lit8 v13, v13, 0x8

    .line 175
    .line 176
    ushr-int/lit8 v16, v11, 0x8

    .line 177
    .line 178
    add-int v13, v13, v16

    .line 179
    .line 180
    const-string v14, "maxDestLen is too small"

    .line 181
    .line 182
    if-gt v13, v5, :cond_9

    .line 183
    .line 184
    const/16 v13, 0xf

    .line 185
    .line 186
    if-lt v11, v13, :cond_3

    .line 187
    .line 188
    const/16 v13, 0xf0

    .line 189
    .line 190
    invoke-static {v3, v9, v13}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    .line 191
    .line 192
    .line 193
    add-int/lit8 v13, v11, -0xf

    .line 194
    .line 195
    invoke-static {v13, v3, v12}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    .line 196
    .line 197
    .line 198
    move-result v12

    .line 199
    goto :goto_3

    .line 200
    :cond_3
    shl-int/lit8 v13, v11, 0x4

    .line 201
    .line 202
    invoke-static {v3, v9, v13}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    .line 203
    .line 204
    .line 205
    :goto_3
    invoke-static {v0, v7, v3, v12, v11}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 206
    .line 207
    .line 208
    add-int/2addr v12, v11

    .line 209
    :goto_4
    invoke-static {v3, v12, v2}, Lnet/jpountz/util/ByteBufferUtils;->writeShortLE(Ljava/nio/ByteBuffer;II)V

    .line 210
    .line 211
    .line 212
    add-int/lit8 v2, v12, 0x2

    .line 213
    .line 214
    add-int/lit8 v10, v10, 0x4

    .line 215
    .line 216
    add-int/lit8 v15, v15, 0x4

    .line 217
    .line 218
    invoke-static {v0, v15, v10, v4}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytes(Ljava/nio/ByteBuffer;III)I

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    add-int/lit8 v12, v12, 0x8

    .line 223
    .line 224
    ushr-int/lit8 v11, v7, 0x8

    .line 225
    .line 226
    add-int/2addr v12, v11

    .line 227
    if-gt v12, v5, :cond_8

    .line 228
    .line 229
    add-int/2addr v10, v7

    .line 230
    const/16 v11, 0xf

    .line 231
    .line 232
    if-lt v7, v11, :cond_4

    .line 233
    .line 234
    invoke-static {v3, v9}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 235
    .line 236
    .line 237
    move-result v12

    .line 238
    or-int/2addr v12, v11

    .line 239
    invoke-static {v3, v9, v12}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    .line 240
    .line 241
    .line 242
    add-int/lit8 v7, v7, -0xf

    .line 243
    .line 244
    invoke-static {v7, v3, v2}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    :goto_5
    move v9, v2

    .line 249
    goto :goto_6

    .line 250
    :cond_4
    invoke-static {v3, v9}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 251
    .line 252
    .line 253
    move-result v12

    .line 254
    or-int/2addr v7, v12

    .line 255
    invoke-static {v3, v9, v7}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    .line 256
    .line 257
    .line 258
    goto :goto_5

    .line 259
    :goto_6
    if-le v10, v6, :cond_5

    .line 260
    .line 261
    move v1, v10

    .line 262
    goto/16 :goto_2

    .line 263
    .line 264
    :goto_7
    sub-int v2, p0, v1

    .line 265
    .line 266
    invoke-static/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->lastLiterals(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    sub-int v0, v0, p5

    .line 271
    .line 272
    return v0

    .line 273
    :cond_5
    add-int/lit8 v2, v10, -0x2

    .line 274
    .line 275
    invoke-static {v0, v2}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    .line 276
    .line 277
    .line 278
    move-result v7

    .line 279
    invoke-static {v7}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    .line 280
    .line 281
    .line 282
    move-result v7

    .line 283
    invoke-static {v8, v7, v2}, Lnet/jpountz/util/UnsafeUtils;->writeInt([III)V

    .line 284
    .line 285
    .line 286
    invoke-static {v0, v10}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    invoke-static {v2}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    .line 291
    .line 292
    .line 293
    move-result v2

    .line 294
    invoke-static {v8, v2}, Lnet/jpountz/util/UnsafeUtils;->readInt([II)I

    .line 295
    .line 296
    .line 297
    move-result v15

    .line 298
    invoke-static {v8, v2, v10}, Lnet/jpountz/util/UnsafeUtils;->writeInt([III)V

    .line 299
    .line 300
    .line 301
    sub-int v2, v10, v15

    .line 302
    .line 303
    const/high16 v7, 0x10000

    .line 304
    .line 305
    if-ge v2, v7, :cond_7

    .line 306
    .line 307
    invoke-static {v0, v15, v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    .line 308
    .line 309
    .line 310
    move-result v12

    .line 311
    if-nez v12, :cond_6

    .line 312
    .line 313
    goto :goto_8

    .line 314
    :cond_6
    add-int/lit8 v12, v9, 0x1

    .line 315
    .line 316
    const/4 v13, 0x0

    .line 317
    invoke-static {v3, v9, v13}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

    .line 318
    .line 319
    .line 320
    goto :goto_4

    .line 321
    :cond_7
    :goto_8
    add-int/lit8 v2, v10, 0x1

    .line 322
    .line 323
    move v7, v10

    .line 324
    move v10, v2

    .line 325
    move/from16 v2, p0

    .line 326
    .line 327
    goto/16 :goto_0

    .line 328
    .line 329
    :cond_8
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    .line 330
    .line 331
    invoke-direct {v0, v14}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    throw v0

    .line 335
    :cond_9
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    .line 336
    .line 337
    invoke-direct {v0, v14}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    throw v0

    .line 341
    :cond_a
    move/from16 v2, p0

    .line 342
    .line 343
    move v10, v12

    .line 344
    move v12, v11

    .line 345
    move v11, v13

    .line 346
    goto/16 :goto_1
.end method

.method public compress([BII[BII)I
    .locals 17

    move/from16 v2, p3

    .line 347
    invoke-static/range {p1 .. p3}, Lnet/jpountz/util/UnsafeUtils;->checkRange([BII)V

    .line 348
    invoke-static/range {p4 .. p6}, Lnet/jpountz/util/UnsafeUtils;->checkRange([BII)V

    add-int v5, p5, p6

    const v0, 0x1000b

    if-ge v2, v0, :cond_0

    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v3, p4

    move/from16 v4, p5

    .line 349
    invoke-static/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4JavaUnsafeCompressor;->compress64k([BII[BII)I

    move-result v0

    return v0

    :cond_0
    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v3, p4

    add-int v2, v1, p3

    add-int/lit8 v4, v2, -0x5

    add-int/lit8 v6, v2, -0xc

    add-int/lit8 v7, v1, 0x1

    const/16 v8, 0x1000

    .line 350
    new-array v8, v8, [I

    .line 351
    invoke-static {v8, v1}, Ljava/util/Arrays;->fill([II)V

    move/from16 v10, p5

    move v9, v7

    move v7, v1

    .line 352
    :goto_0
    sget v11, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    const/4 v12, 0x1

    shl-int v11, v12, v11

    :goto_1
    add-int/2addr v12, v9

    add-int/lit8 v13, v11, 0x1

    .line 353
    sget v14, Lnet/jpountz/lz4/LZ4Constants;->SKIP_STRENGTH:I

    ushr-int/2addr v11, v14

    if-le v12, v6, :cond_1

    move/from16 p0, v2

    move v1, v7

    :goto_2
    move v4, v10

    goto/16 :goto_7

    .line 354
    :cond_1
    invoke-static {v0, v9}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    move-result v14

    invoke-static {v14}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    move-result v14

    .line 355
    invoke-static {v8, v14}, Lnet/jpountz/util/UnsafeUtils;->readInt([II)I

    move-result v15

    move/from16 p0, v2

    sub-int v2, v9, v15

    .line 356
    invoke-static {v8, v14, v9}, Lnet/jpountz/util/UnsafeUtils;->writeInt([III)V

    const/high16 v14, 0x10000

    if-ge v2, v14, :cond_9

    .line 357
    invoke-static {v0, v15, v9}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->readIntEquals([BII)Z

    move-result v16

    if-eqz v16, :cond_9

    .line 358
    invoke-static {v0, v15, v9, v1, v7}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->commonBytesBackward([BIIII)I

    move-result v11

    sub-int/2addr v9, v11

    sub-int/2addr v15, v11

    sub-int v11, v9, v7

    add-int/lit8 v12, v10, 0x1

    add-int v13, v12, v11

    add-int/lit8 v13, v13, 0x8

    ushr-int/lit8 v16, v11, 0x8

    add-int v13, v13, v16

    .line 359
    const-string v14, "maxDestLen is too small"

    if-gt v13, v5, :cond_8

    const/16 v13, 0xf

    if-lt v11, v13, :cond_2

    const/16 v13, 0xf0

    .line 360
    invoke-static {v3, v10, v13}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    add-int/lit8 v13, v11, -0xf

    .line 361
    invoke-static {v13, v3, v12}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->writeLen(I[BI)I

    move-result v12

    goto :goto_3

    :cond_2
    shl-int/lit8 v13, v11, 0x4

    .line 362
    invoke-static {v3, v10, v13}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 363
    :goto_3
    invoke-static {v0, v7, v3, v12, v11}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->wildArraycopy([BI[BII)V

    add-int/2addr v12, v11

    .line 364
    :goto_4
    invoke-static {v3, v12, v2}, Lnet/jpountz/util/UnsafeUtils;->writeShortLE([BII)V

    add-int/lit8 v2, v12, 0x2

    add-int/lit8 v9, v9, 0x4

    add-int/lit8 v15, v15, 0x4

    .line 365
    invoke-static {v0, v15, v9, v4}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->commonBytes([BIII)I

    move-result v7

    add-int/lit8 v12, v12, 0x8

    ushr-int/lit8 v11, v7, 0x8

    add-int/2addr v12, v11

    if-gt v12, v5, :cond_7

    add-int/2addr v9, v7

    const/16 v11, 0xf

    if-lt v7, v11, :cond_3

    .line 366
    invoke-static {v3, v10}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    move-result v12

    or-int/2addr v12, v11

    invoke-static {v3, v10, v12}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    add-int/lit8 v7, v7, -0xf

    .line 367
    invoke-static {v7, v3, v2}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->writeLen(I[BI)I

    move-result v2

    :goto_5
    move v10, v2

    goto :goto_6

    .line 368
    :cond_3
    invoke-static {v3, v10}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    move-result v12

    or-int/2addr v7, v12

    invoke-static {v3, v10, v7}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    goto :goto_5

    :goto_6
    if-le v9, v6, :cond_4

    move v1, v9

    goto/16 :goto_2

    :goto_7
    sub-int v2, p0, v1

    .line 369
    invoke-static/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->lastLiterals([BII[BII)I

    move-result v0

    sub-int v0, v0, p5

    return v0

    :cond_4
    add-int/lit8 v2, v9, -0x2

    .line 370
    invoke-static {v0, v2}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    move-result v7

    invoke-static {v7}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    move-result v7

    invoke-static {v8, v7, v2}, Lnet/jpountz/util/UnsafeUtils;->writeInt([III)V

    .line 371
    invoke-static {v0, v9}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    move-result v2

    invoke-static {v2}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    move-result v2

    .line 372
    invoke-static {v8, v2}, Lnet/jpountz/util/UnsafeUtils;->readInt([II)I

    move-result v15

    .line 373
    invoke-static {v8, v2, v9}, Lnet/jpountz/util/UnsafeUtils;->writeInt([III)V

    sub-int v2, v9, v15

    const/high16 v7, 0x10000

    if-ge v2, v7, :cond_6

    .line 374
    invoke-static {v0, v15, v9}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->readIntEquals([BII)Z

    move-result v12

    if-nez v12, :cond_5

    goto :goto_8

    :cond_5
    add-int/lit8 v12, v10, 0x1

    const/4 v13, 0x0

    .line 375
    invoke-static {v3, v10, v13}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    goto :goto_4

    :cond_6
    :goto_8
    add-int/lit8 v2, v9, 0x1

    move v7, v9

    move v9, v2

    move/from16 v2, p0

    goto/16 :goto_0

    .line 376
    :cond_7
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    invoke-direct {v0, v14}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 377
    :cond_8
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    invoke-direct {v0, v14}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    move/from16 v2, p0

    move v9, v12

    move v12, v11

    move v11, v13

    goto/16 :goto_1
.end method
