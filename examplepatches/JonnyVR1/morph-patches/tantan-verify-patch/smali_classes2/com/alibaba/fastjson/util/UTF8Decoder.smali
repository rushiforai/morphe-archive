.class public Lcom/alibaba/fastjson/util/UTF8Decoder;
.super Ljava/nio/charset/CharsetDecoder;
.source "SourceFile"


# static fields
.field private static final charset:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/alibaba/fastjson/util/UTF8Decoder;->charset:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/util/UTF8Decoder;->charset:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, v1}, Ljava/nio/charset/CharsetDecoder;-><init>(Ljava/nio/charset/Charset;FF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private decodeArrayLoop(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;
    .locals 11

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int v5, v1, v2

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/nio/CharBuffer;->array()[C

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p2}, Ljava/nio/CharBuffer;->arrayOffset()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {p2}, Ljava/nio/Buffer;->position()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    add-int/2addr v2, v3

    .line 37
    invoke-virtual {p2}, Ljava/nio/CharBuffer;->arrayOffset()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    add-int/2addr v3, v4

    .line 46
    sub-int v4, v5, v0

    .line 47
    .line 48
    sub-int v6, v3, v2

    .line 49
    .line 50
    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    add-int/2addr v4, v2

    .line 55
    :goto_0
    if-ge v2, v4, :cond_0

    .line 56
    .line 57
    aget-byte v6, p0, v0

    .line 58
    .line 59
    if-ltz v6, :cond_0

    .line 60
    .line 61
    add-int/lit8 v7, v2, 0x1

    .line 62
    .line 63
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    int-to-char v6, v6

    .line 66
    aput-char v6, v1, v2

    .line 67
    .line 68
    move v2, v7

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    move v4, v0

    .line 71
    move v7, v2

    .line 72
    :goto_1
    if-ge v4, v5, :cond_10

    .line 73
    .line 74
    aget-byte v0, p0, v4

    .line 75
    .line 76
    if-ltz v0, :cond_2

    .line 77
    .line 78
    if-lt v7, v3, :cond_1

    .line 79
    .line 80
    const/4 v8, 0x1

    .line 81
    move-object v3, p1

    .line 82
    move-object v6, p2

    .line 83
    invoke-static/range {v3 .. v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->xflow(Ljava/nio/Buffer;IILjava/nio/Buffer;II)Ljava/nio/charset/CoderResult;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_1
    move v6, v3

    .line 89
    move-object v3, p1

    .line 90
    move p1, v6

    .line 91
    move-object v6, p2

    .line 92
    add-int/lit8 p2, v7, 0x1

    .line 93
    .line 94
    int-to-char v0, v0

    .line 95
    aput-char v0, v1, v7

    .line 96
    .line 97
    add-int/lit8 v4, v4, 0x1

    .line 98
    .line 99
    move v7, p2

    .line 100
    goto/16 :goto_5

    .line 101
    .line 102
    :cond_2
    move v6, v3

    .line 103
    move-object v3, p1

    .line 104
    move p1, v6

    .line 105
    move-object v6, p2

    .line 106
    shr-int/lit8 p2, v0, 0x5

    .line 107
    .line 108
    const/4 v2, -0x2

    .line 109
    const/4 v8, 0x2

    .line 110
    if-ne p2, v2, :cond_6

    .line 111
    .line 112
    sub-int p2, v5, v4

    .line 113
    .line 114
    if-lt p2, v8, :cond_5

    .line 115
    .line 116
    if-lt v7, p1, :cond_3

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_3
    add-int/lit8 p2, v4, 0x1

    .line 120
    .line 121
    aget-byte p2, p0, p2

    .line 122
    .line 123
    invoke-static {v0, p2}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isMalformed2(II)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_4

    .line 128
    .line 129
    invoke-static {v3, v4, v6, v7, v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->malformed(Ljava/nio/ByteBuffer;ILjava/nio/CharBuffer;II)Ljava/nio/charset/CoderResult;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    return-object p0

    .line 134
    :cond_4
    add-int/lit8 v2, v7, 0x1

    .line 135
    .line 136
    shl-int/lit8 v0, v0, 0x6

    .line 137
    .line 138
    xor-int/2addr p2, v0

    .line 139
    xor-int/lit16 p2, p2, 0xf80

    .line 140
    .line 141
    int-to-char p2, p2

    .line 142
    aput-char p2, v1, v7

    .line 143
    .line 144
    add-int/lit8 v4, v4, 0x2

    .line 145
    .line 146
    :goto_2
    move v7, v2

    .line 147
    goto/16 :goto_5

    .line 148
    .line 149
    :cond_5
    :goto_3
    const/4 v8, 0x2

    .line 150
    invoke-static/range {v3 .. v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->xflow(Ljava/nio/Buffer;IILjava/nio/Buffer;II)Ljava/nio/charset/CoderResult;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0

    .line 155
    :cond_6
    shr-int/lit8 p2, v0, 0x4

    .line 156
    .line 157
    if-ne p2, v2, :cond_a

    .line 158
    .line 159
    sub-int p2, v5, v4

    .line 160
    .line 161
    const/4 v2, 0x3

    .line 162
    if-lt p2, v2, :cond_9

    .line 163
    .line 164
    if-lt v7, p1, :cond_7

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_7
    add-int/lit8 p2, v4, 0x1

    .line 168
    .line 169
    aget-byte p2, p0, p2

    .line 170
    .line 171
    add-int/lit8 v8, v4, 0x2

    .line 172
    .line 173
    aget-byte v8, p0, v8

    .line 174
    .line 175
    invoke-static {v0, p2, v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isMalformed3(III)Z

    .line 176
    .line 177
    .line 178
    move-result v9

    .line 179
    if-eqz v9, :cond_8

    .line 180
    .line 181
    invoke-static {v3, v4, v6, v7, v2}, Lcom/alibaba/fastjson/util/UTF8Decoder;->malformed(Ljava/nio/ByteBuffer;ILjava/nio/CharBuffer;II)Ljava/nio/charset/CoderResult;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    return-object p0

    .line 186
    :cond_8
    add-int/lit8 v2, v7, 0x1

    .line 187
    .line 188
    shl-int/lit8 v0, v0, 0xc

    .line 189
    .line 190
    shl-int/lit8 p2, p2, 0x6

    .line 191
    .line 192
    xor-int/2addr p2, v0

    .line 193
    xor-int/2addr p2, v8

    .line 194
    xor-int/lit16 p2, p2, 0x1f80

    .line 195
    .line 196
    int-to-char p2, p2

    .line 197
    aput-char p2, v1, v7

    .line 198
    .line 199
    add-int/lit8 v4, v4, 0x3

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_9
    :goto_4
    const/4 v8, 0x3

    .line 203
    invoke-static/range {v3 .. v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->xflow(Ljava/nio/Buffer;IILjava/nio/Buffer;II)Ljava/nio/charset/CoderResult;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    return-object p0

    .line 208
    :cond_a
    shr-int/lit8 p2, v0, 0x3

    .line 209
    .line 210
    if-ne p2, v2, :cond_f

    .line 211
    .line 212
    sub-int p2, v5, v4

    .line 213
    .line 214
    const/4 v2, 0x4

    .line 215
    if-lt p2, v2, :cond_e

    .line 216
    .line 217
    sub-int p2, p1, v7

    .line 218
    .line 219
    if-ge p2, v8, :cond_b

    .line 220
    .line 221
    goto :goto_7

    .line 222
    :cond_b
    add-int/lit8 p2, v4, 0x1

    .line 223
    .line 224
    aget-byte p2, p0, p2

    .line 225
    .line 226
    add-int/lit8 v8, v4, 0x2

    .line 227
    .line 228
    aget-byte v8, p0, v8

    .line 229
    .line 230
    add-int/lit8 v9, v4, 0x3

    .line 231
    .line 232
    aget-byte v9, p0, v9

    .line 233
    .line 234
    and-int/lit8 v0, v0, 0x7

    .line 235
    .line 236
    shl-int/lit8 v0, v0, 0x12

    .line 237
    .line 238
    and-int/lit8 v10, p2, 0x3f

    .line 239
    .line 240
    shl-int/lit8 v10, v10, 0xc

    .line 241
    .line 242
    or-int/2addr v0, v10

    .line 243
    and-int/lit8 v10, v8, 0x3f

    .line 244
    .line 245
    shl-int/lit8 v10, v10, 0x6

    .line 246
    .line 247
    or-int/2addr v0, v10

    .line 248
    and-int/lit8 v10, v9, 0x3f

    .line 249
    .line 250
    or-int/2addr v0, v10

    .line 251
    invoke-static {p2, v8, v9}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isMalformed4(III)Z

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    if-nez p2, :cond_d

    .line 256
    .line 257
    const/high16 p2, 0x10000

    .line 258
    .line 259
    if-lt v0, p2, :cond_d

    .line 260
    .line 261
    const v8, 0x10ffff

    .line 262
    .line 263
    .line 264
    if-le v0, v8, :cond_c

    .line 265
    .line 266
    goto :goto_6

    .line 267
    :cond_c
    add-int/lit8 v2, v7, 0x1

    .line 268
    .line 269
    sub-int/2addr v0, p2

    .line 270
    shr-int/lit8 p2, v0, 0xa

    .line 271
    .line 272
    and-int/lit16 p2, p2, 0x3ff

    .line 273
    .line 274
    const v8, 0xd800

    .line 275
    .line 276
    .line 277
    or-int/2addr p2, v8

    .line 278
    int-to-char p2, p2

    .line 279
    aput-char p2, v1, v7

    .line 280
    .line 281
    add-int/lit8 v7, v7, 0x2

    .line 282
    .line 283
    const p2, 0xdc00

    .line 284
    .line 285
    .line 286
    and-int/lit16 v0, v0, 0x3ff

    .line 287
    .line 288
    or-int/2addr p2, v0

    .line 289
    int-to-char p2, p2

    .line 290
    aput-char p2, v1, v2

    .line 291
    .line 292
    add-int/lit8 v4, v4, 0x4

    .line 293
    .line 294
    :goto_5
    move-object p2, v3

    .line 295
    move v3, p1

    .line 296
    move-object p1, p2

    .line 297
    move-object p2, v6

    .line 298
    goto/16 :goto_1

    .line 299
    .line 300
    :cond_d
    :goto_6
    invoke-static {v3, v4, v6, v7, v2}, Lcom/alibaba/fastjson/util/UTF8Decoder;->malformed(Ljava/nio/ByteBuffer;ILjava/nio/CharBuffer;II)Ljava/nio/charset/CoderResult;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    return-object p0

    .line 305
    :cond_e
    :goto_7
    const/4 v8, 0x4

    .line 306
    invoke-static/range {v3 .. v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->xflow(Ljava/nio/Buffer;IILjava/nio/Buffer;II)Ljava/nio/charset/CoderResult;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    return-object p0

    .line 311
    :cond_f
    const/4 p0, 0x1

    .line 312
    invoke-static {v3, v4, v6, v7, p0}, Lcom/alibaba/fastjson/util/UTF8Decoder;->malformed(Ljava/nio/ByteBuffer;ILjava/nio/CharBuffer;II)Ljava/nio/charset/CoderResult;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    return-object p0

    .line 317
    :cond_10
    move-object v3, p1

    .line 318
    move-object v6, p2

    .line 319
    const/4 v8, 0x0

    .line 320
    invoke-static/range {v3 .. v8}, Lcom/alibaba/fastjson/util/UTF8Decoder;->xflow(Ljava/nio/Buffer;IILjava/nio/Buffer;II)Ljava/nio/charset/CoderResult;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    return-object p0
.end method

.method private static isMalformed2(II)Z
    .locals 0

    and-int/lit8 p0, p0, 0x1e

    if-eqz p0, :cond_1

    and-int/lit16 p0, p1, 0xc0

    const/16 p1, 0x80

    if-eq p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private static isMalformed3(III)Z
    .locals 2

    const/16 v0, -0x20

    const/16 v1, 0x80

    if-ne p0, v0, :cond_0

    and-int/lit16 p0, p1, 0xe0

    if-eq p0, v1, :cond_2

    :cond_0
    and-int/lit16 p0, p1, 0xc0

    if-ne p0, v1, :cond_2

    and-int/lit16 p0, p2, 0xc0

    if-eq p0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0

    :cond_2
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private static isMalformed4(III)Z
    .locals 1

    and-int/lit16 p0, p0, 0xc0

    const/16 v0, 0x80

    if-ne p0, v0, :cond_1

    and-int/lit16 p0, p1, 0xc0

    if-ne p0, v0, :cond_1

    and-int/lit16 p0, p2, 0xc0

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private static isNotContinuation(I)Z
    .locals 1

    and-int/lit16 p0, p0, 0xc0

    const/16 v0, 0x80

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static lookupN(Ljava/nio/ByteBuffer;I)Ljava/nio/charset/CoderResult;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    if-ge v0, p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-static {v1}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isNotContinuation(I)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-static {v0}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-static {p1}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method private static malformed(Ljava/nio/ByteBuffer;ILjava/nio/CharBuffer;II)Ljava/nio/charset/CoderResult;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int v0, p1, v0

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p4}, Lcom/alibaba/fastjson/util/UTF8Decoder;->malformedN(Ljava/nio/ByteBuffer;I)Ljava/nio/charset/CoderResult;

    .line 11
    .line 12
    .line 13
    move-result-object p4

    .line 14
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p3}, Ljava/nio/CharBuffer;->position(I)Ljava/nio/Buffer;

    .line 18
    .line 19
    .line 20
    return-object p4
.end method

.method public static malformedN(Ljava/nio/ByteBuffer;I)Ljava/nio/charset/CoderResult;
    .locals 9

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_b

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eq p1, v2, :cond_a

    .line 7
    .line 8
    const/16 v3, 0x80

    .line 9
    .line 10
    const/4 v4, 0x3

    .line 11
    if-eq p1, v4, :cond_6

    .line 12
    .line 13
    if-ne p1, v0, :cond_5

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    and-int/lit16 p1, p1, 0xff

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    and-int/lit16 v5, v0, 0xff

    .line 26
    .line 27
    const/16 v6, 0xf4

    .line 28
    .line 29
    if-gt p1, v6, :cond_4

    .line 30
    .line 31
    const/16 v7, 0xf0

    .line 32
    .line 33
    if-ne p1, v7, :cond_0

    .line 34
    .line 35
    const/16 v8, 0x90

    .line 36
    .line 37
    if-lt v5, v8, :cond_4

    .line 38
    .line 39
    const/16 v8, 0xbf

    .line 40
    .line 41
    if-gt v5, v8, :cond_4

    .line 42
    .line 43
    :cond_0
    if-ne p1, v6, :cond_1

    .line 44
    .line 45
    and-int/lit16 p1, v0, 0xf0

    .line 46
    .line 47
    if-ne p1, v3, :cond_4

    .line 48
    .line 49
    :cond_1
    invoke-static {v5}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isNotContinuation(I)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-static {p0}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isNotContinuation(I)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_3

    .line 65
    .line 66
    invoke-static {v2}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_3
    invoke-static {v4}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_4
    :goto_0
    invoke-static {v1}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_5
    invoke-static {}, Ll/wpg0;->a()V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    return-object p0

    .line 86
    :cond_6
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    const/16 v0, -0x20

    .line 95
    .line 96
    if-ne p1, v0, :cond_7

    .line 97
    .line 98
    and-int/lit16 p1, p0, 0xe0

    .line 99
    .line 100
    if-eq p1, v3, :cond_9

    .line 101
    .line 102
    :cond_7
    invoke-static {p0}, Lcom/alibaba/fastjson/util/UTF8Decoder;->isNotContinuation(I)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_8

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_8
    move v1, v2

    .line 110
    :cond_9
    :goto_1
    invoke-static {v1}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :cond_a
    invoke-static {v1}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_b
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    shr-int/lit8 v2, p1, 0x2

    .line 125
    .line 126
    const/4 v3, 0x5

    .line 127
    const/4 v4, -0x2

    .line 128
    if-ne v2, v4, :cond_d

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-ge p1, v0, :cond_c

    .line 135
    .line 136
    sget-object p0, Ljava/nio/charset/CoderResult;->UNDERFLOW:Ljava/nio/charset/CoderResult;

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_c
    invoke-static {p0, v3}, Lcom/alibaba/fastjson/util/UTF8Decoder;->lookupN(Ljava/nio/ByteBuffer;I)Ljava/nio/charset/CoderResult;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_d
    shr-int/2addr p1, v1

    .line 145
    if-ne p1, v4, :cond_f

    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/nio/Buffer;->remaining()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-ge p1, v3, :cond_e

    .line 152
    .line 153
    sget-object p0, Ljava/nio/charset/CoderResult;->UNDERFLOW:Ljava/nio/charset/CoderResult;

    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_e
    const/4 p1, 0x6

    .line 157
    invoke-static {p0, p1}, Lcom/alibaba/fastjson/util/UTF8Decoder;->lookupN(Ljava/nio/ByteBuffer;I)Ljava/nio/charset/CoderResult;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0

    .line 162
    :cond_f
    invoke-static {v1}, Ljava/nio/charset/CoderResult;->malformedForLength(I)Ljava/nio/charset/CoderResult;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0
.end method

.method private static xflow(Ljava/nio/Buffer;IILjava/nio/Buffer;II)Ljava/nio/charset/CoderResult;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3, p4}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    if-eqz p5, :cond_1

    .line 8
    .line 9
    sub-int/2addr p2, p1

    .line 10
    if-ge p2, p5, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object p0, Ljava/nio/charset/CoderResult;->OVERFLOW:Ljava/nio/charset/CoderResult;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    :goto_0
    sget-object p0, Ljava/nio/charset/CoderResult;->UNDERFLOW:Ljava/nio/charset/CoderResult;

    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method public decodeLoop(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/alibaba/fastjson/util/UTF8Decoder;->decodeArrayLoop(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
