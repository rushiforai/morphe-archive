.class public Lorg/eclipse/jetty/server/HttpWriter;
.super Ljava/io/Writer;
.source "SourceFile"


# static fields
.field public static final MAX_OUTPUT_CHARS:I = 0x200

.field private static final WRITE_CONV:I = 0x0

.field private static final WRITE_ISO1:I = 0x1

.field private static final WRITE_UTF8:I = 0x2


# instance fields
.field final _generator:Lorg/eclipse/jetty/http/AbstractGenerator;

.field final _out:Lorg/eclipse/jetty/server/HttpOutput;

.field _surrogate:I

.field _writeMode:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/HttpOutput;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 5
    .line 6
    iget-object p1, p1, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 7
    .line 8
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpWriter;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lorg/eclipse/jetty/server/HttpWriter;->_surrogate:I

    .line 12
    .line 13
    return-void
.end method

.method private getConverter()Ljava/io/Writer;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 2
    .line 3
    iget-object v1, v0, Lorg/eclipse/jetty/server/HttpOutput;->_converter:Ljava/io/Writer;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance v1, Ljava/io/OutputStreamWriter;

    .line 8
    .line 9
    iget-object v2, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 10
    .line 11
    iget-object v3, v2, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 12
    .line 13
    iget-object v2, v2, Lorg/eclipse/jetty/server/HttpOutput;->_characterEncoding:Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {v1, v3, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Lorg/eclipse/jetty/server/HttpOutput;->_converter:Ljava/io/Writer;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 21
    .line 22
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_converter:Ljava/io/Writer;

    .line 23
    .line 24
    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCharacterEncoding(Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const-string v0, "ISO-8859-1"

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "UTF-8"

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    iput v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_writeMode:I

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_writeMode:I

    .line 26
    .line 27
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 28
    .line 29
    iget-object v0, v0, Lorg/eclipse/jetty/server/HttpOutput;->_characterEncoding:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput-object v1, v0, Lorg/eclipse/jetty/server/HttpOutput;->_converter:Ljava/io/Writer;

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    :goto_0
    const/4 v0, 0x1

    .line 46
    iput v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_writeMode:I

    .line 47
    .line 48
    :cond_4
    :goto_1
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 49
    .line 50
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_characterEncoding:Ljava/lang/String;

    .line 51
    .line 52
    iget-object p1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 53
    .line 54
    if-nez p1, :cond_5

    .line 55
    .line 56
    new-instance p1, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 57
    .line 58
    const/16 v0, 0x200

    .line 59
    .line 60
    invoke-direct {p1, v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;-><init>(I)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 64
    .line 65
    :cond_5
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    const/16 v0, 0x200

    if-le p3, v0, :cond_0

    .line 455
    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jetty/server/HttpWriter;->write(Ljava/lang/String;II)V

    add-int/lit16 p2, p2, 0x200

    add-int/lit16 p3, p3, -0x200

    goto :goto_0

    .line 456
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    iget-object v2, v1, Lorg/eclipse/jetty/server/HttpOutput;->_chars:[C

    if-nez v2, :cond_1

    .line 457
    new-array v0, v0, [C

    iput-object v0, v1, Lorg/eclipse/jetty/server/HttpOutput;->_chars:[C

    .line 458
    :cond_1
    iget-object v0, v1, Lorg/eclipse/jetty/server/HttpOutput;->_chars:[C

    add-int v1, p2, p3

    const/4 v2, 0x0

    .line 459
    invoke-virtual {p1, p2, v1, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 460
    invoke-virtual {p0, v0, v2, p3}, Lorg/eclipse/jetty/server/HttpWriter;->write([CII)V

    return-void
.end method

.method public write([CII)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpWriter;->_out:Lorg/eclipse/jetty/server/HttpOutput;

    .line 2
    .line 3
    :goto_0
    if-lez p3, :cond_1a

    .line 4
    .line 5
    iget-object v1, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x200

    .line 11
    .line 12
    if-le p3, v1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    move v1, p3

    .line 16
    :goto_1
    iget v2, p0, Lorg/eclipse/jetty/server/HttpWriter;->_writeMode:I

    .line 17
    .line 18
    if-eqz v2, :cond_18

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x1

    .line 22
    const/16 v5, 0x3f

    .line 23
    .line 24
    if-eq v2, v4, :cond_14

    .line 25
    .line 26
    const/4 v6, 0x2

    .line 27
    if-ne v2, v6, :cond_13

    .line 28
    .line 29
    iget-object v2, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 30
    .line 31
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v6, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 36
    .line 37
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    add-int v7, v6, v1

    .line 42
    .line 43
    array-length v8, v2

    .line 44
    if-le v7, v8, :cond_1

    .line 45
    .line 46
    array-length v1, v2

    .line 47
    sub-int/2addr v1, v6

    .line 48
    :cond_1
    move v7, v3

    .line 49
    :goto_2
    if-ge v7, v1, :cond_12

    .line 50
    .line 51
    add-int v8, p2, v7

    .line 52
    .line 53
    aget-char v8, p1, v8

    .line 54
    .line 55
    iget v9, p0, Lorg/eclipse/jetty/server/HttpWriter;->_surrogate:I

    .line 56
    .line 57
    if-nez v9, :cond_2

    .line 58
    .line 59
    int-to-char v9, v8

    .line 60
    invoke-static {v9}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 61
    .line 62
    .line 63
    move-result v9

    .line 64
    if-eqz v9, :cond_4

    .line 65
    .line 66
    iput v8, p0, Lorg/eclipse/jetty/server/HttpWriter;->_surrogate:I

    .line 67
    .line 68
    goto/16 :goto_6

    .line 69
    .line 70
    :cond_2
    int-to-char v8, v8

    .line 71
    invoke-static {v8}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 72
    .line 73
    .line 74
    move-result v9

    .line 75
    iget v10, p0, Lorg/eclipse/jetty/server/HttpWriter;->_surrogate:I

    .line 76
    .line 77
    if-eqz v9, :cond_3

    .line 78
    .line 79
    int-to-char v9, v10

    .line 80
    invoke-static {v9, v8}, Ljava/lang/Character;->toCodePoint(CC)I

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    goto :goto_3

    .line 85
    :cond_3
    iput v3, p0, Lorg/eclipse/jetty/server/HttpWriter;->_surrogate:I

    .line 86
    .line 87
    add-int/lit8 v7, v7, -0x1

    .line 88
    .line 89
    move v8, v10

    .line 90
    :cond_4
    :goto_3
    and-int/lit8 v9, v8, -0x80

    .line 91
    .line 92
    if-nez v9, :cond_6

    .line 93
    .line 94
    array-length v9, v2

    .line 95
    if-lt v6, v9, :cond_5

    .line 96
    .line 97
    goto/16 :goto_4

    .line 98
    .line 99
    :cond_5
    add-int/lit8 v9, v6, 0x1

    .line 100
    .line 101
    int-to-byte v8, v8

    .line 102
    aput-byte v8, v2, v6

    .line 103
    .line 104
    move v6, v9

    .line 105
    goto/16 :goto_6

    .line 106
    .line 107
    :cond_6
    and-int/lit16 v9, v8, -0x800

    .line 108
    .line 109
    if-nez v9, :cond_8

    .line 110
    .line 111
    add-int/lit8 v9, v6, 0x2

    .line 112
    .line 113
    array-length v10, v2

    .line 114
    if-le v9, v10, :cond_7

    .line 115
    .line 116
    goto/16 :goto_4

    .line 117
    .line 118
    :cond_7
    add-int/lit8 v9, v6, 0x1

    .line 119
    .line 120
    shr-int/lit8 v10, v8, 0x6

    .line 121
    .line 122
    or-int/lit16 v10, v10, 0xc0

    .line 123
    .line 124
    int-to-byte v10, v10

    .line 125
    aput-byte v10, v2, v6

    .line 126
    .line 127
    add-int/lit8 v6, v6, 0x2

    .line 128
    .line 129
    and-int/lit8 v8, v8, 0x3f

    .line 130
    .line 131
    or-int/lit16 v8, v8, 0x80

    .line 132
    .line 133
    int-to-byte v8, v8

    .line 134
    aput-byte v8, v2, v9

    .line 135
    .line 136
    goto/16 :goto_5

    .line 137
    .line 138
    :cond_8
    const/high16 v9, -0x10000

    .line 139
    .line 140
    and-int/2addr v9, v8

    .line 141
    if-nez v9, :cond_a

    .line 142
    .line 143
    add-int/lit8 v9, v6, 0x3

    .line 144
    .line 145
    array-length v10, v2

    .line 146
    if-le v9, v10, :cond_9

    .line 147
    .line 148
    goto/16 :goto_4

    .line 149
    .line 150
    :cond_9
    add-int/lit8 v9, v6, 0x1

    .line 151
    .line 152
    shr-int/lit8 v10, v8, 0xc

    .line 153
    .line 154
    or-int/lit16 v10, v10, 0xe0

    .line 155
    .line 156
    int-to-byte v10, v10

    .line 157
    aput-byte v10, v2, v6

    .line 158
    .line 159
    add-int/lit8 v10, v6, 0x2

    .line 160
    .line 161
    shr-int/lit8 v11, v8, 0x6

    .line 162
    .line 163
    and-int/2addr v11, v5

    .line 164
    or-int/lit16 v11, v11, 0x80

    .line 165
    .line 166
    int-to-byte v11, v11

    .line 167
    aput-byte v11, v2, v9

    .line 168
    .line 169
    add-int/lit8 v6, v6, 0x3

    .line 170
    .line 171
    and-int/lit8 v8, v8, 0x3f

    .line 172
    .line 173
    or-int/lit16 v8, v8, 0x80

    .line 174
    .line 175
    int-to-byte v8, v8

    .line 176
    aput-byte v8, v2, v10

    .line 177
    .line 178
    goto/16 :goto_5

    .line 179
    .line 180
    :cond_a
    const/high16 v9, -0xe00000

    .line 181
    .line 182
    and-int/2addr v9, v8

    .line 183
    if-nez v9, :cond_c

    .line 184
    .line 185
    add-int/lit8 v9, v6, 0x4

    .line 186
    .line 187
    array-length v10, v2

    .line 188
    if-le v9, v10, :cond_b

    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_b
    add-int/lit8 v9, v6, 0x1

    .line 192
    .line 193
    shr-int/lit8 v10, v8, 0x12

    .line 194
    .line 195
    or-int/lit16 v10, v10, 0xf0

    .line 196
    .line 197
    int-to-byte v10, v10

    .line 198
    aput-byte v10, v2, v6

    .line 199
    .line 200
    add-int/lit8 v10, v6, 0x2

    .line 201
    .line 202
    shr-int/lit8 v11, v8, 0xc

    .line 203
    .line 204
    and-int/2addr v11, v5

    .line 205
    or-int/lit16 v11, v11, 0x80

    .line 206
    .line 207
    int-to-byte v11, v11

    .line 208
    aput-byte v11, v2, v9

    .line 209
    .line 210
    add-int/lit8 v9, v6, 0x3

    .line 211
    .line 212
    shr-int/lit8 v11, v8, 0x6

    .line 213
    .line 214
    and-int/2addr v11, v5

    .line 215
    or-int/lit16 v11, v11, 0x80

    .line 216
    .line 217
    int-to-byte v11, v11

    .line 218
    aput-byte v11, v2, v10

    .line 219
    .line 220
    add-int/lit8 v6, v6, 0x4

    .line 221
    .line 222
    and-int/lit8 v8, v8, 0x3f

    .line 223
    .line 224
    or-int/lit16 v8, v8, 0x80

    .line 225
    .line 226
    int-to-byte v8, v8

    .line 227
    aput-byte v8, v2, v9

    .line 228
    .line 229
    goto/16 :goto_5

    .line 230
    .line 231
    :cond_c
    const/high16 v9, -0xc000000

    .line 232
    .line 233
    and-int/2addr v9, v8

    .line 234
    if-nez v9, :cond_e

    .line 235
    .line 236
    add-int/lit8 v9, v6, 0x5

    .line 237
    .line 238
    array-length v10, v2

    .line 239
    if-le v9, v10, :cond_d

    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_d
    add-int/lit8 v9, v6, 0x1

    .line 243
    .line 244
    shr-int/lit8 v10, v8, 0x18

    .line 245
    .line 246
    or-int/lit16 v10, v10, 0xf8

    .line 247
    .line 248
    int-to-byte v10, v10

    .line 249
    aput-byte v10, v2, v6

    .line 250
    .line 251
    add-int/lit8 v10, v6, 0x2

    .line 252
    .line 253
    shr-int/lit8 v11, v8, 0x12

    .line 254
    .line 255
    and-int/2addr v11, v5

    .line 256
    or-int/lit16 v11, v11, 0x80

    .line 257
    .line 258
    int-to-byte v11, v11

    .line 259
    aput-byte v11, v2, v9

    .line 260
    .line 261
    add-int/lit8 v9, v6, 0x3

    .line 262
    .line 263
    shr-int/lit8 v11, v8, 0xc

    .line 264
    .line 265
    and-int/2addr v11, v5

    .line 266
    or-int/lit16 v11, v11, 0x80

    .line 267
    .line 268
    int-to-byte v11, v11

    .line 269
    aput-byte v11, v2, v10

    .line 270
    .line 271
    add-int/lit8 v10, v6, 0x4

    .line 272
    .line 273
    shr-int/lit8 v11, v8, 0x6

    .line 274
    .line 275
    and-int/2addr v11, v5

    .line 276
    or-int/lit16 v11, v11, 0x80

    .line 277
    .line 278
    int-to-byte v11, v11

    .line 279
    aput-byte v11, v2, v9

    .line 280
    .line 281
    add-int/lit8 v6, v6, 0x5

    .line 282
    .line 283
    and-int/lit8 v8, v8, 0x3f

    .line 284
    .line 285
    or-int/lit16 v8, v8, 0x80

    .line 286
    .line 287
    int-to-byte v8, v8

    .line 288
    aput-byte v8, v2, v10

    .line 289
    .line 290
    goto :goto_5

    .line 291
    :cond_e
    const/high16 v9, -0x80000000

    .line 292
    .line 293
    and-int/2addr v9, v8

    .line 294
    if-nez v9, :cond_10

    .line 295
    .line 296
    add-int/lit8 v9, v6, 0x6

    .line 297
    .line 298
    array-length v10, v2

    .line 299
    if-le v9, v10, :cond_f

    .line 300
    .line 301
    :goto_4
    move v1, v7

    .line 302
    goto :goto_7

    .line 303
    :cond_f
    add-int/lit8 v9, v6, 0x1

    .line 304
    .line 305
    shr-int/lit8 v10, v8, 0x1e

    .line 306
    .line 307
    or-int/lit16 v10, v10, 0xfc

    .line 308
    .line 309
    int-to-byte v10, v10

    .line 310
    aput-byte v10, v2, v6

    .line 311
    .line 312
    add-int/lit8 v10, v6, 0x2

    .line 313
    .line 314
    shr-int/lit8 v11, v8, 0x18

    .line 315
    .line 316
    and-int/2addr v11, v5

    .line 317
    or-int/lit16 v11, v11, 0x80

    .line 318
    .line 319
    int-to-byte v11, v11

    .line 320
    aput-byte v11, v2, v9

    .line 321
    .line 322
    add-int/lit8 v9, v6, 0x3

    .line 323
    .line 324
    shr-int/lit8 v11, v8, 0x12

    .line 325
    .line 326
    and-int/2addr v11, v5

    .line 327
    or-int/lit16 v11, v11, 0x80

    .line 328
    .line 329
    int-to-byte v11, v11

    .line 330
    aput-byte v11, v2, v10

    .line 331
    .line 332
    add-int/lit8 v10, v6, 0x4

    .line 333
    .line 334
    shr-int/lit8 v11, v8, 0xc

    .line 335
    .line 336
    and-int/2addr v11, v5

    .line 337
    or-int/lit16 v11, v11, 0x80

    .line 338
    .line 339
    int-to-byte v11, v11

    .line 340
    aput-byte v11, v2, v9

    .line 341
    .line 342
    add-int/lit8 v9, v6, 0x5

    .line 343
    .line 344
    shr-int/lit8 v11, v8, 0x6

    .line 345
    .line 346
    and-int/2addr v11, v5

    .line 347
    or-int/lit16 v11, v11, 0x80

    .line 348
    .line 349
    int-to-byte v11, v11

    .line 350
    aput-byte v11, v2, v10

    .line 351
    .line 352
    add-int/lit8 v6, v6, 0x6

    .line 353
    .line 354
    and-int/lit8 v8, v8, 0x3f

    .line 355
    .line 356
    or-int/lit16 v8, v8, 0x80

    .line 357
    .line 358
    int-to-byte v8, v8

    .line 359
    aput-byte v8, v2, v9

    .line 360
    .line 361
    goto :goto_5

    .line 362
    :cond_10
    add-int/lit8 v8, v6, 0x1

    .line 363
    .line 364
    aput-byte v5, v2, v6

    .line 365
    .line 366
    move v6, v8

    .line 367
    :goto_5
    iput v3, p0, Lorg/eclipse/jetty/server/HttpWriter;->_surrogate:I

    .line 368
    .line 369
    array-length v8, v2

    .line 370
    if-ne v6, v8, :cond_11

    .line 371
    .line 372
    add-int/lit8 v7, v7, 0x1

    .line 373
    .line 374
    goto :goto_4

    .line 375
    :cond_11
    :goto_6
    add-int/2addr v7, v4

    .line 376
    goto/16 :goto_2

    .line 377
    .line 378
    :cond_12
    :goto_7
    iget-object v2, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 379
    .line 380
    invoke-virtual {v2, v6}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->setCount(I)V

    .line 381
    .line 382
    .line 383
    goto :goto_a

    .line 384
    :cond_13
    invoke-static {}, Ll/wpg0;->a()V

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :cond_14
    iget-object v2, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 389
    .line 390
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    iget-object v4, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 395
    .line 396
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 397
    .line 398
    .line 399
    move-result v4

    .line 400
    array-length v6, v2

    .line 401
    sub-int/2addr v6, v4

    .line 402
    if-le v1, v6, :cond_15

    .line 403
    .line 404
    array-length v1, v2

    .line 405
    sub-int/2addr v1, v4

    .line 406
    :cond_15
    :goto_8
    if-ge v3, v1, :cond_17

    .line 407
    .line 408
    add-int v6, p2, v3

    .line 409
    .line 410
    aget-char v6, p1, v6

    .line 411
    .line 412
    add-int/lit8 v7, v4, 0x1

    .line 413
    .line 414
    const/16 v8, 0x100

    .line 415
    .line 416
    if-ge v6, v8, :cond_16

    .line 417
    .line 418
    goto :goto_9

    .line 419
    :cond_16
    move v6, v5

    .line 420
    :goto_9
    int-to-byte v6, v6

    .line 421
    aput-byte v6, v2, v4

    .line 422
    .line 423
    add-int/lit8 v3, v3, 0x1

    .line 424
    .line 425
    move v4, v7

    .line 426
    goto :goto_8

    .line 427
    :cond_17
    if-ltz v4, :cond_19

    .line 428
    .line 429
    iget-object v2, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 430
    .line 431
    invoke-virtual {v2, v4}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->setCount(I)V

    .line 432
    .line 433
    .line 434
    goto :goto_a

    .line 435
    :cond_18
    invoke-direct {p0}, Lorg/eclipse/jetty/server/HttpWriter;->getConverter()Ljava/io/Writer;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    invoke-virtual {v2, p1, p2, v1}, Ljava/io/Writer;->write([CII)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v2}, Ljava/io/Writer;->flush()V

    .line 443
    .line 444
    .line 445
    :cond_19
    :goto_a
    iget-object v2, v0, Lorg/eclipse/jetty/server/HttpOutput;->_bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 446
    .line 447
    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 448
    .line 449
    .line 450
    sub-int/2addr p3, v1

    .line 451
    add-int/2addr p2, v1

    .line 452
    goto/16 :goto_0

    .line 453
    .line 454
    :cond_1a
    return-void
.end method
