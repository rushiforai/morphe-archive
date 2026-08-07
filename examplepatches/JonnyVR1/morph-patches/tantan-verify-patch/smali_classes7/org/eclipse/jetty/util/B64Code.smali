.class public Lorg/eclipse/jetty/util/B64Code;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final pad:C = '='

.field static final rfc1421alphabet:[C

.field static final rfc1421nibbles:[B


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v1, v0, [C

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lorg/eclipse/jetty/util/B64Code;->rfc1421alphabet:[C

    .line 9
    .line 10
    const/16 v1, 0x100

    .line 11
    .line 12
    new-array v2, v1, [B

    .line 13
    .line 14
    sput-object v2, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :goto_0
    if-ge v3, v1, :cond_0

    .line 19
    .line 20
    sget-object v4, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B

    .line 21
    .line 22
    const/4 v5, -0x1

    .line 23
    aput-byte v5, v4, v3

    .line 24
    .line 25
    add-int/lit8 v3, v3, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_1
    if-ge v1, v0, :cond_1

    .line 30
    .line 31
    sget-object v3, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B

    .line 32
    .line 33
    sget-object v4, Lorg/eclipse/jetty/util/B64Code;->rfc1421alphabet:[C

    .line 34
    .line 35
    aget-char v4, v4, v1

    .line 36
    .line 37
    int-to-byte v4, v4

    .line 38
    aput-byte v1, v3, v4

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    int-to-byte v1, v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    sget-object v0, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B

    .line 45
    .line 46
    const/16 v1, 0x3d

    .line 47
    .line 48
    aput-byte v2, v0, v1

    .line 49
    .line 50
    return-void

    .line 51
    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x2bs
        0x2fs
    .end array-data
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

.method public static decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 230
    invoke-static {p0}, Lorg/eclipse/jetty/util/B64Code;->decode(Ljava/lang/String;)[B

    move-result-object p0

    if-nez p1, :cond_0

    .line 231
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    return-object p1

    .line 232
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 11

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x4

    .line 233
    new-array v2, v1, [B

    .line 234
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    mul-int/2addr v4, v1

    const/4 v5, 0x3

    div-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    const/4 v4, 0x0

    move v6, v4

    move v7, v6

    .line 235
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v6, v8, :cond_7

    add-int/lit8 v8, v6, 0x1

    .line 236
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v9, 0x3d

    if-ne v6, v9, :cond_1

    goto :goto_3

    .line 237
    :cond_1
    invoke-static {v6}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v9

    if-eqz v9, :cond_2

    :goto_1
    move v6, v8

    goto :goto_0

    .line 238
    :cond_2
    sget-object v9, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B

    aget-byte v6, v9, v6

    if-ltz v6, :cond_6

    add-int/lit8 v9, v7, 0x1

    .line 239
    aput-byte v6, v2, v7

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-eq v9, v7, :cond_5

    if-eq v9, v5, :cond_4

    if-eq v9, v1, :cond_3

    goto :goto_2

    .line 240
    :cond_3
    aget-byte v6, v2, v7

    shl-int/lit8 v6, v6, 0x6

    aget-byte v7, v2, v5

    or-int/2addr v6, v7

    invoke-virtual {v3, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    move v7, v4

    goto :goto_1

    .line 241
    :cond_4
    aget-byte v6, v2, v6

    shl-int/2addr v6, v1

    aget-byte v10, v2, v7

    ushr-int/lit8 v7, v10, 0x2

    or-int/2addr v6, v7

    invoke-virtual {v3, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_2

    .line 242
    :cond_5
    aget-byte v10, v2, v4

    shl-int/lit8 v7, v10, 0x2

    aget-byte v6, v2, v6

    ushr-int/2addr v6, v1

    or-int/2addr v6, v7

    invoke-virtual {v3, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    :goto_2
    move v7, v9

    goto :goto_1

    .line 243
    :cond_6
    const-string p0, "Not B64 encoded"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0

    .line 244
    :cond_7
    :goto_3
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method public static decode([C)[B
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    array-length v1, p0

    .line 6
    rem-int/lit8 v2, v1, 0x4

    .line 7
    .line 8
    if-nez v2, :cond_a

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    sub-int/2addr v1, v2

    .line 12
    :goto_0
    if-ltz v1, :cond_1

    .line 13
    .line 14
    aget-char v3, p0, v1

    .line 15
    .line 16
    const/16 v4, 0x3d

    .line 17
    .line 18
    if-ne v3, v4, :cond_1

    .line 19
    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v3, 0x0

    .line 24
    if-gez v1, :cond_2

    .line 25
    .line 26
    new-array p0, v3, [B

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_2
    add-int/2addr v1, v2

    .line 30
    mul-int/lit8 v1, v1, 0x3

    .line 31
    .line 32
    div-int/lit8 v1, v1, 0x4

    .line 33
    .line 34
    new-array v4, v1, [B

    .line 35
    .line 36
    div-int/lit8 v5, v1, 0x3

    .line 37
    .line 38
    mul-int/lit8 v5, v5, 0x3

    .line 39
    .line 40
    move v6, v3

    .line 41
    :goto_1
    const-string v7, "Not B64 encoded"

    .line 42
    .line 43
    if-ge v3, v5, :cond_4

    .line 44
    .line 45
    :try_start_0
    sget-object v8, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_4

    .line 46
    .line 47
    add-int/lit8 v9, v6, 0x1

    .line 48
    .line 49
    :try_start_1
    aget-char v10, p0, v6

    .line 50
    .line 51
    aget-byte v10, v8, v10
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_2

    .line 52
    .line 53
    add-int/lit8 v11, v6, 0x2

    .line 54
    .line 55
    :try_start_2
    aget-char v9, p0, v9

    .line 56
    .line 57
    aget-byte v9, v8, v9
    :try_end_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_1

    .line 58
    .line 59
    add-int/lit8 v12, v6, 0x3

    .line 60
    .line 61
    :try_start_3
    aget-char v11, p0, v11

    .line 62
    .line 63
    aget-byte v11, v8, v11
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    .line 64
    .line 65
    add-int/lit8 v6, v6, 0x4

    .line 66
    .line 67
    :try_start_4
    aget-char v12, p0, v12

    .line 68
    .line 69
    aget-byte v8, v8, v12

    .line 70
    .line 71
    if-ltz v10, :cond_3

    .line 72
    .line 73
    if-ltz v9, :cond_3

    .line 74
    .line 75
    if-ltz v11, :cond_3

    .line 76
    .line 77
    if-ltz v8, :cond_3

    .line 78
    .line 79
    add-int/lit8 v7, v3, 0x1

    .line 80
    .line 81
    shl-int/lit8 v10, v10, 0x2

    .line 82
    .line 83
    ushr-int/lit8 v12, v9, 0x4

    .line 84
    .line 85
    or-int/2addr v10, v12

    .line 86
    int-to-byte v10, v10

    .line 87
    aput-byte v10, v4, v3

    .line 88
    .line 89
    add-int/lit8 v10, v3, 0x2

    .line 90
    .line 91
    shl-int/lit8 v9, v9, 0x4

    .line 92
    .line 93
    ushr-int/lit8 v12, v11, 0x2

    .line 94
    .line 95
    or-int/2addr v9, v12

    .line 96
    int-to-byte v9, v9

    .line 97
    aput-byte v9, v4, v7

    .line 98
    .line 99
    add-int/lit8 v3, v3, 0x3

    .line 100
    .line 101
    shl-int/lit8 v7, v11, 0x6

    .line 102
    .line 103
    or-int/2addr v7, v8

    .line 104
    int-to-byte v7, v7

    .line 105
    aput-byte v7, v4, v10

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 109
    .line 110
    invoke-direct {p0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p0

    .line 114
    :catch_0
    move v6, v12

    .line 115
    goto :goto_2

    .line 116
    :catch_1
    move v6, v11

    .line 117
    goto :goto_2

    .line 118
    :catch_2
    move v6, v9

    .line 119
    goto :goto_2

    .line 120
    :cond_4
    if-eq v1, v3, :cond_9

    .line 121
    .line 122
    rem-int/lit8 v1, v1, 0x3

    .line 123
    .line 124
    const/4 v5, 0x2

    .line 125
    if-eq v1, v2, :cond_7

    .line 126
    .line 127
    if-eq v1, v5, :cond_5

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_5
    sget-object v1, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B
    :try_end_4
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_4

    .line 131
    .line 132
    add-int/lit8 v2, v6, 0x1

    .line 133
    .line 134
    :try_start_5
    aget-char v8, p0, v6

    .line 135
    .line 136
    aget-byte v8, v1, v8
    :try_end_5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_3

    .line 137
    .line 138
    add-int/lit8 v9, v6, 0x2

    .line 139
    .line 140
    :try_start_6
    aget-char v2, p0, v2

    .line 141
    .line 142
    aget-byte v2, v1, v2
    :try_end_6
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_2

    .line 143
    .line 144
    add-int/lit8 v6, v6, 0x3

    .line 145
    .line 146
    :try_start_7
    aget-char p0, p0, v9

    .line 147
    .line 148
    aget-byte p0, v1, p0

    .line 149
    .line 150
    if-ltz v8, :cond_6

    .line 151
    .line 152
    if-ltz v2, :cond_6

    .line 153
    .line 154
    if-ltz p0, :cond_6

    .line 155
    .line 156
    add-int/lit8 v1, v3, 0x1

    .line 157
    .line 158
    shl-int/lit8 v7, v8, 0x2

    .line 159
    .line 160
    ushr-int/lit8 v8, v2, 0x4

    .line 161
    .line 162
    or-int/2addr v7, v8

    .line 163
    int-to-byte v7, v7

    .line 164
    aput-byte v7, v4, v3

    .line 165
    .line 166
    shl-int/lit8 v2, v2, 0x4

    .line 167
    .line 168
    ushr-int/2addr p0, v5

    .line 169
    or-int/2addr p0, v2

    .line 170
    int-to-byte p0, p0

    .line 171
    aput-byte p0, v4, v1

    .line 172
    .line 173
    return-object v4

    .line 174
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 175
    .line 176
    invoke-direct {p0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    throw p0

    .line 180
    :catch_3
    move v6, v2

    .line 181
    goto :goto_2

    .line 182
    :cond_7
    sget-object v1, Lorg/eclipse/jetty/util/B64Code;->rfc1421nibbles:[B
    :try_end_7
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_4

    .line 183
    .line 184
    add-int/lit8 v2, v6, 0x1

    .line 185
    .line 186
    :try_start_8
    aget-char v8, p0, v6

    .line 187
    .line 188
    aget-byte v8, v1, v8
    :try_end_8
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_8 .. :try_end_8} :catch_3

    .line 189
    .line 190
    add-int/lit8 v6, v6, 0x2

    .line 191
    .line 192
    :try_start_9
    aget-char p0, p0, v2

    .line 193
    .line 194
    aget-byte p0, v1, p0

    .line 195
    .line 196
    if-ltz v8, :cond_8

    .line 197
    .line 198
    if-ltz p0, :cond_8

    .line 199
    .line 200
    shl-int/lit8 v1, v8, 0x2

    .line 201
    .line 202
    ushr-int/lit8 p0, p0, 0x4

    .line 203
    .line 204
    or-int/2addr p0, v1

    .line 205
    int-to-byte p0, p0

    .line 206
    aput-byte p0, v4, v3

    .line 207
    .line 208
    return-object v4

    .line 209
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 210
    .line 211
    invoke-direct {p0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    throw p0
    :try_end_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9 .. :try_end_9} :catch_4

    .line 215
    :catch_4
    :goto_2
    const-string p0, "char "

    .line 216
    .line 217
    const-string v1, " was not B64 encoded"

    .line 218
    .line 219
    invoke-static {p0, v6, v1}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 220
    .line 221
    .line 222
    return-object v0

    .line 223
    :cond_9
    :goto_3
    return-object v4

    .line 224
    :cond_a
    const-string p0, "Input block size is not 4"

    .line 225
    .line 226
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-object v0
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 223
    :try_start_0
    invoke-static {p0, v0}, Lorg/eclipse/jetty/util/B64Code;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 224
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    if-nez p1, :cond_0

    .line 219
    const-string p1, "ISO-8859-1"

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    goto :goto_0

    .line 220
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    .line 221
    :goto_0
    new-instance p1, Ljava/lang/String;

    invoke-static {p0}, Lorg/eclipse/jetty/util/B64Code;->encode([B)[C

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    return-object p1
.end method

.method public static encode([B)[C
    .locals 1

    const/4 v0, 0x0

    .line 222
    invoke-static {p0, v0}, Lorg/eclipse/jetty/util/B64Code;->encode([BZ)[C

    move-result-object p0

    return-object p0
.end method

.method public static encode([BZ)[C
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    array-length v1, v0

    .line 8
    add-int/lit8 v2, v1, 0x2

    .line 9
    .line 10
    div-int/lit8 v2, v2, 0x3

    .line 11
    .line 12
    mul-int/lit8 v3, v2, 0x4

    .line 13
    .line 14
    const/4 v4, 0x2

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    mul-int/lit8 v2, v2, 0x8

    .line 18
    .line 19
    div-int/lit8 v2, v2, 0x4c

    .line 20
    .line 21
    add-int/2addr v2, v4

    .line 22
    add-int/2addr v3, v2

    .line 23
    :cond_1
    new-array v2, v3, [C

    .line 24
    .line 25
    div-int/lit8 v3, v1, 0x3

    .line 26
    .line 27
    mul-int/lit8 v3, v3, 0x3

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    move v6, v5

    .line 31
    move v7, v6

    .line 32
    :goto_0
    const/16 v8, 0xa

    .line 33
    .line 34
    const/16 v9, 0xd

    .line 35
    .line 36
    if-ge v5, v3, :cond_3

    .line 37
    .line 38
    add-int/lit8 v10, v5, 0x1

    .line 39
    .line 40
    aget-byte v11, v0, v5

    .line 41
    .line 42
    add-int/lit8 v12, v5, 0x2

    .line 43
    .line 44
    aget-byte v10, v0, v10

    .line 45
    .line 46
    add-int/lit8 v5, v5, 0x3

    .line 47
    .line 48
    aget-byte v12, v0, v12

    .line 49
    .line 50
    add-int/lit8 v13, v6, 0x1

    .line 51
    .line 52
    sget-object v14, Lorg/eclipse/jetty/util/B64Code;->rfc1421alphabet:[C

    .line 53
    .line 54
    ushr-int/lit8 v15, v11, 0x2

    .line 55
    .line 56
    and-int/lit8 v15, v15, 0x3f

    .line 57
    .line 58
    aget-char v15, v14, v15

    .line 59
    .line 60
    aput-char v15, v2, v6

    .line 61
    .line 62
    add-int/lit8 v15, v6, 0x2

    .line 63
    .line 64
    shl-int/lit8 v11, v11, 0x4

    .line 65
    .line 66
    and-int/lit8 v11, v11, 0x3f

    .line 67
    .line 68
    ushr-int/lit8 v16, v10, 0x4

    .line 69
    .line 70
    and-int/lit8 v16, v16, 0xf

    .line 71
    .line 72
    or-int v11, v11, v16

    .line 73
    .line 74
    aget-char v11, v14, v11

    .line 75
    .line 76
    aput-char v11, v2, v13

    .line 77
    .line 78
    add-int/lit8 v11, v6, 0x3

    .line 79
    .line 80
    shl-int/2addr v10, v4

    .line 81
    and-int/lit8 v10, v10, 0x3f

    .line 82
    .line 83
    ushr-int/lit8 v13, v12, 0x6

    .line 84
    .line 85
    and-int/lit8 v13, v13, 0x3

    .line 86
    .line 87
    or-int/2addr v10, v13

    .line 88
    aget-char v10, v14, v10

    .line 89
    .line 90
    aput-char v10, v2, v15

    .line 91
    .line 92
    add-int/lit8 v10, v6, 0x4

    .line 93
    .line 94
    and-int/lit8 v12, v12, 0x3f

    .line 95
    .line 96
    aget-char v12, v14, v12

    .line 97
    .line 98
    aput-char v12, v2, v11

    .line 99
    .line 100
    add-int/lit8 v7, v7, 0x4

    .line 101
    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    rem-int/lit8 v11, v7, 0x4c

    .line 105
    .line 106
    if-nez v11, :cond_2

    .line 107
    .line 108
    add-int/lit8 v11, v6, 0x5

    .line 109
    .line 110
    aput-char v9, v2, v10

    .line 111
    .line 112
    add-int/lit8 v6, v6, 0x6

    .line 113
    .line 114
    aput-char v8, v2, v11

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    move v6, v10

    .line 118
    goto :goto_0

    .line 119
    :cond_3
    if-eq v1, v5, :cond_6

    .line 120
    .line 121
    rem-int/lit8 v1, v1, 0x3

    .line 122
    .line 123
    const/16 v3, 0x3d

    .line 124
    .line 125
    const/4 v7, 0x1

    .line 126
    if-eq v1, v7, :cond_5

    .line 127
    .line 128
    if-eq v1, v4, :cond_4

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    add-int/lit8 v1, v5, 0x1

    .line 132
    .line 133
    aget-byte v5, v0, v5

    .line 134
    .line 135
    aget-byte v0, v0, v1

    .line 136
    .line 137
    add-int/lit8 v1, v6, 0x1

    .line 138
    .line 139
    sget-object v7, Lorg/eclipse/jetty/util/B64Code;->rfc1421alphabet:[C

    .line 140
    .line 141
    ushr-int/lit8 v10, v5, 0x2

    .line 142
    .line 143
    and-int/lit8 v10, v10, 0x3f

    .line 144
    .line 145
    aget-char v10, v7, v10

    .line 146
    .line 147
    aput-char v10, v2, v6

    .line 148
    .line 149
    add-int/lit8 v10, v6, 0x2

    .line 150
    .line 151
    shl-int/lit8 v5, v5, 0x4

    .line 152
    .line 153
    and-int/lit8 v5, v5, 0x3f

    .line 154
    .line 155
    ushr-int/lit8 v11, v0, 0x4

    .line 156
    .line 157
    and-int/lit8 v11, v11, 0xf

    .line 158
    .line 159
    or-int/2addr v5, v11

    .line 160
    aget-char v5, v7, v5

    .line 161
    .line 162
    aput-char v5, v2, v1

    .line 163
    .line 164
    add-int/lit8 v1, v6, 0x3

    .line 165
    .line 166
    shl-int/2addr v0, v4

    .line 167
    and-int/lit8 v0, v0, 0x3f

    .line 168
    .line 169
    aget-char v0, v7, v0

    .line 170
    .line 171
    aput-char v0, v2, v10

    .line 172
    .line 173
    add-int/lit8 v6, v6, 0x4

    .line 174
    .line 175
    aput-char v3, v2, v1

    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_5
    aget-byte v0, v0, v5

    .line 179
    .line 180
    add-int/lit8 v1, v6, 0x1

    .line 181
    .line 182
    sget-object v4, Lorg/eclipse/jetty/util/B64Code;->rfc1421alphabet:[C

    .line 183
    .line 184
    ushr-int/lit8 v5, v0, 0x2

    .line 185
    .line 186
    and-int/lit8 v5, v5, 0x3f

    .line 187
    .line 188
    aget-char v5, v4, v5

    .line 189
    .line 190
    aput-char v5, v2, v6

    .line 191
    .line 192
    add-int/lit8 v5, v6, 0x2

    .line 193
    .line 194
    shl-int/lit8 v0, v0, 0x4

    .line 195
    .line 196
    and-int/lit8 v0, v0, 0x3f

    .line 197
    .line 198
    aget-char v0, v4, v0

    .line 199
    .line 200
    aput-char v0, v2, v1

    .line 201
    .line 202
    add-int/lit8 v0, v6, 0x3

    .line 203
    .line 204
    aput-char v3, v2, v5

    .line 205
    .line 206
    add-int/lit8 v6, v6, 0x4

    .line 207
    .line 208
    aput-char v3, v2, v0

    .line 209
    .line 210
    :cond_6
    :goto_1
    if-eqz p1, :cond_7

    .line 211
    .line 212
    add-int/lit8 v0, v6, 0x1

    .line 213
    .line 214
    aput-char v9, v2, v6

    .line 215
    .line 216
    aput-char v8, v2, v0

    .line 217
    .line 218
    :cond_7
    return-object v2
.end method
