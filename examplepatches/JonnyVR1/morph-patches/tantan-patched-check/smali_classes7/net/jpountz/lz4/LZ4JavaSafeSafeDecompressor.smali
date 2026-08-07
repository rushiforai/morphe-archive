.class final Lnet/jpountz/lz4/LZ4JavaSafeSafeDecompressor;
.super Lnet/jpountz/lz4/LZ4SafeDecompressor;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Lnet/jpountz/lz4/LZ4SafeDecompressor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lnet/jpountz/lz4/LZ4JavaSafeSafeDecompressor;

    .line 2
    .line 3
    invoke-direct {v0}, Lnet/jpountz/lz4/LZ4JavaSafeSafeDecompressor;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lnet/jpountz/lz4/LZ4JavaSafeSafeDecompressor;->INSTANCE:Lnet/jpountz/lz4/LZ4SafeDecompressor;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4SafeDecompressor;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public decompress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I
    .locals 17

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    move/from16 v2, p5

    .line 16
    .line 17
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    add-int/2addr v0, v3

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
    move-result v3

    .line 34
    add-int v5, v2, v3

    .line 35
    .line 36
    move/from16 v3, p3

    .line 37
    .line 38
    move/from16 v6, p6

    .line 39
    .line 40
    move v2, v0

    .line 41
    move-object/from16 v0, p0

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v6}, Lnet/jpountz/lz4/LZ4JavaSafeSafeDecompressor;->decompress([BII[BII)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    return v0

    .line 48
    :cond_0
    move/from16 v3, p3

    .line 49
    .line 50
    move/from16 v2, p5

    .line 51
    .line 52
    move/from16 v6, p6

    .line 53
    .line 54
    invoke-static/range {p1 .. p1}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static/range {p4 .. p4}, Lnet/jpountz/util/ByteBufferUtils;->inNativeByteOrder(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-static {v1, v0, v3}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 63
    .line 64
    .line 65
    invoke-static {v4, v2, v6}, Lnet/jpountz/util/ByteBufferUtils;->checkRange(Ljava/nio/ByteBuffer;II)V

    .line 66
    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    const/4 v7, 0x1

    .line 70
    if-nez v6, :cond_2

    .line 71
    .line 72
    if-ne v3, v7, :cond_1

    .line 73
    .line 74
    invoke-static {v1, v0}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    return v5

    .line 81
    :cond_1
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    .line 82
    .line 83
    const-string v1, "Output buffer too small"

    .line 84
    .line 85
    invoke-direct {v0, v1}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    throw v0

    .line 89
    :cond_2
    add-int/2addr v3, v0

    .line 90
    add-int/2addr v6, v2

    .line 91
    move v8, v2

    .line 92
    :goto_0
    invoke-static {v1, v0}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    and-int/lit16 v10, v9, 0xff

    .line 97
    .line 98
    add-int/2addr v0, v7

    .line 99
    ushr-int/lit8 v10, v10, 0x4

    .line 100
    .line 101
    const/16 v11, 0xf

    .line 102
    .line 103
    const/4 v12, -0x1

    .line 104
    if-ne v10, v11, :cond_5

    .line 105
    .line 106
    move v13, v12

    .line 107
    :goto_1
    if-ge v0, v3, :cond_4

    .line 108
    .line 109
    add-int/lit8 v13, v0, 0x1

    .line 110
    .line 111
    invoke-static {v1, v0}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-ne v0, v12, :cond_3

    .line 116
    .line 117
    add-int/lit16 v10, v10, 0xff

    .line 118
    .line 119
    move/from16 v16, v13

    .line 120
    .line 121
    move v13, v0

    .line 122
    move/from16 v0, v16

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    move/from16 v16, v13

    .line 126
    .line 127
    move v13, v0

    .line 128
    move/from16 v0, v16

    .line 129
    .line 130
    :cond_4
    and-int/lit16 v13, v13, 0xff

    .line 131
    .line 132
    add-int/2addr v10, v13

    .line 133
    :cond_5
    add-int v13, v8, v10

    .line 134
    .line 135
    add-int/lit8 v14, v6, -0x8

    .line 136
    .line 137
    const-string v15, "Malformed input at "

    .line 138
    .line 139
    move/from16 p0, v5

    .line 140
    .line 141
    if-gt v13, v14, :cond_d

    .line 142
    .line 143
    add-int v5, v0, v10

    .line 144
    .line 145
    add-int/lit8 v7, v3, -0x8

    .line 146
    .line 147
    if-le v5, v7, :cond_6

    .line 148
    .line 149
    goto :goto_4

    .line 150
    :cond_6
    invoke-static {v1, v0, v4, v8, v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1, v5}, Lnet/jpountz/util/ByteBufferUtils;->readShortLE(Ljava/nio/ByteBuffer;I)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/lit8 v5, v5, 0x2

    .line 158
    .line 159
    sub-int v0, v13, v0

    .line 160
    .line 161
    if-lt v0, v2, :cond_c

    .line 162
    .line 163
    and-int/lit8 v7, v9, 0xf

    .line 164
    .line 165
    if-ne v7, v11, :cond_9

    .line 166
    .line 167
    move v8, v12

    .line 168
    :goto_2
    if-ge v5, v3, :cond_8

    .line 169
    .line 170
    add-int/lit8 v8, v5, 0x1

    .line 171
    .line 172
    invoke-static {v1, v5}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    if-ne v5, v12, :cond_7

    .line 177
    .line 178
    add-int/lit16 v7, v7, 0xff

    .line 179
    .line 180
    move/from16 v16, v8

    .line 181
    .line 182
    move v8, v5

    .line 183
    move/from16 v5, v16

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_7
    move/from16 v16, v8

    .line 187
    .line 188
    move v8, v5

    .line 189
    move/from16 v5, v16

    .line 190
    .line 191
    :cond_8
    and-int/lit16 v8, v8, 0xff

    .line 192
    .line 193
    add-int/2addr v7, v8

    .line 194
    :cond_9
    add-int/lit8 v7, v7, 0x4

    .line 195
    .line 196
    add-int v8, v13, v7

    .line 197
    .line 198
    if-le v8, v14, :cond_b

    .line 199
    .line 200
    if-gt v8, v6, :cond_a

    .line 201
    .line 202
    invoke-static {v4, v0, v13, v7}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->safeIncrementalCopy(Ljava/nio/ByteBuffer;III)V

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_a
    invoke-static {v15, v5}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 207
    .line 208
    .line 209
    return p0

    .line 210
    :cond_b
    invoke-static {v4, v0, v13, v8}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildIncrementalCopy(Ljava/nio/ByteBuffer;III)V

    .line 211
    .line 212
    .line 213
    :goto_3
    const/4 v7, 0x1

    .line 214
    move v0, v5

    .line 215
    move/from16 v5, p0

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_c
    invoke-static {v15, v5}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 219
    .line 220
    .line 221
    return p0

    .line 222
    :cond_d
    :goto_4
    if-gt v13, v6, :cond_f

    .line 223
    .line 224
    add-int v5, v0, v10

    .line 225
    .line 226
    if-ne v5, v3, :cond_e

    .line 227
    .line 228
    invoke-static {v1, v0, v4, v8, v10}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->safeArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 229
    .line 230
    .line 231
    sub-int/2addr v13, v2

    .line 232
    return v13

    .line 233
    :cond_e
    invoke-static {v15, v0}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 234
    .line 235
    .line 236
    return p0

    .line 237
    :cond_f
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    .line 238
    .line 239
    invoke-direct {v0}, Lnet/jpountz/lz4/LZ4Exception;-><init>()V

    .line 240
    .line 241
    .line 242
    throw v0
.end method

.method public decompress([BII[BII)I
    .locals 17

    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, p5

    .line 243
    invoke-static/range {p1 .. p3}, Lnet/jpountz/util/SafeUtils;->checkRange([BII)V

    .line 244
    invoke-static/range {p4 .. p6}, Lnet/jpountz/util/SafeUtils;->checkRange([BII)V

    const/4 v4, 0x1

    if-nez p6, :cond_1

    if-ne v1, v4, :cond_0

    .line 245
    invoke-static/range {p1 .. p2}, Lnet/jpountz/util/SafeUtils;->readByte([BI)B

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 246
    :cond_0
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    const-string v1, "Output buffer too small"

    invoke-direct {v0, v1}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    add-int v1, p2, v1

    add-int v5, v3, p6

    move/from16 v6, p2

    move v7, v3

    .line 247
    :goto_0
    invoke-static {v0, v6}, Lnet/jpountz/util/SafeUtils;->readByte([BI)B

    move-result v8

    and-int/lit16 v9, v8, 0xff

    add-int/2addr v6, v4

    ushr-int/lit8 v9, v9, 0x4

    const/16 v10, 0xf

    const/4 v11, -0x1

    if-ne v9, v10, :cond_4

    move v12, v11

    :goto_1
    if-ge v6, v1, :cond_3

    add-int/lit8 v12, v6, 0x1

    .line 248
    invoke-static {v0, v6}, Lnet/jpountz/util/SafeUtils;->readByte([BI)B

    move-result v6

    if-ne v6, v11, :cond_2

    add-int/lit16 v9, v9, 0xff

    move/from16 v16, v12

    move v12, v6

    move/from16 v6, v16

    goto :goto_1

    :cond_2
    move/from16 v16, v12

    move v12, v6

    move/from16 v6, v16

    :cond_3
    and-int/lit16 v12, v12, 0xff

    add-int/2addr v9, v12

    :cond_4
    add-int v12, v7, v9

    add-int/lit8 v13, v5, -0x8

    .line 249
    const-string v14, "Malformed input at "

    if-gt v12, v13, :cond_c

    add-int v15, v6, v9

    add-int/lit8 v4, v1, -0x8

    if-le v15, v4, :cond_5

    goto :goto_5

    .line 250
    :cond_5
    invoke-static {v0, v6, v2, v7, v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->wildArraycopy([BI[BII)V

    .line 251
    invoke-static {v0, v15}, Lnet/jpountz/util/SafeUtils;->readShortLE([BI)I

    move-result v4

    add-int/lit8 v15, v15, 0x2

    sub-int v4, v12, v4

    if-lt v4, v3, :cond_b

    and-int/lit8 v6, v8, 0xf

    if-ne v6, v10, :cond_8

    move v7, v11

    :goto_2
    if-ge v15, v1, :cond_7

    add-int/lit8 v7, v15, 0x1

    .line 252
    invoke-static {v0, v15}, Lnet/jpountz/util/SafeUtils;->readByte([BI)B

    move-result v8

    if-ne v8, v11, :cond_6

    add-int/lit16 v6, v6, 0xff

    move v15, v7

    move v7, v8

    goto :goto_2

    :cond_6
    move v15, v7

    move v7, v8

    :cond_7
    and-int/lit16 v7, v7, 0xff

    add-int/2addr v6, v7

    :cond_8
    add-int/lit8 v6, v6, 0x4

    add-int v7, v12, v6

    if-le v7, v13, :cond_a

    if-gt v7, v5, :cond_9

    .line 253
    invoke-static {v2, v4, v12, v6}, Lnet/jpountz/lz4/LZ4SafeUtils;->safeIncrementalCopy([BIII)V

    goto :goto_4

    .line 254
    :cond_9
    invoke-static {v14, v15}, Ll/f7r;->a(Ljava/lang/String;I)V

    :goto_3
    const/4 v0, 0x0

    return v0

    .line 255
    :cond_a
    invoke-static {v2, v4, v12, v7}, Lnet/jpountz/lz4/LZ4SafeUtils;->wildIncrementalCopy([BIII)V

    :goto_4
    move v6, v15

    const/4 v4, 0x1

    goto :goto_0

    .line 256
    :cond_b
    invoke-static {v14, v15}, Ll/f7r;->a(Ljava/lang/String;I)V

    goto :goto_3

    :cond_c
    :goto_5
    if-gt v12, v5, :cond_e

    add-int v4, v6, v9

    if-ne v4, v1, :cond_d

    .line 257
    invoke-static {v0, v6, v2, v7, v9}, Lnet/jpountz/lz4/LZ4SafeUtils;->safeArraycopy([BI[BII)V

    sub-int/2addr v12, v3

    return v12

    .line 258
    :cond_d
    invoke-static {v14, v6}, Ll/f7r;->a(Ljava/lang/String;I)V

    goto :goto_3

    .line 259
    :cond_e
    new-instance v0, Lnet/jpountz/lz4/LZ4Exception;

    invoke-direct {v0}, Lnet/jpountz/lz4/LZ4Exception;-><init>()V

    throw v0
.end method
