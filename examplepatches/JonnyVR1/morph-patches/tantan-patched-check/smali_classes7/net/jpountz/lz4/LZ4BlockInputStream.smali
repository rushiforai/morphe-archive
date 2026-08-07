.class public Lnet/jpountz/lz4/LZ4BlockInputStream;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private buffer:[B

.field private final checksum:Ljava/util/zip/Checksum;

.field private compressedBuffer:[B

.field private final decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

.field private finished:Z

.field private o:I

.field private originalLen:I

.field private final stopOnEmptyBlock:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 31
    invoke-static {}, Lnet/jpountz/lz4/LZ4Factory;->fastestInstance()Lnet/jpountz/lz4/LZ4Factory;

    move-result-object v0

    invoke-virtual {v0}, Lnet/jpountz/lz4/LZ4Factory;->fastDecompressor()Lnet/jpountz/lz4/LZ4FastDecompressor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lnet/jpountz/lz4/LZ4BlockInputStream;-><init>(Ljava/io/InputStream;Lnet/jpountz/lz4/LZ4FastDecompressor;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lnet/jpountz/lz4/LZ4FastDecompressor;)V
    .locals 0

    .line 29
    invoke-static {}, Ll/emq0;->b()Ll/emq0;

    move-result-object p0

    const p1, -0x68b84d74

    invoke-virtual {p0, p1}, Ll/emq0;->g(I)Ll/z7g0;

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/io/InputStream;Lnet/jpountz/lz4/LZ4FastDecompressor;Ljava/util/zip/Checksum;)V
    .locals 1

    const/4 v0, 0x1

    .line 28
    invoke-direct {p0, p1, p2, p3, v0}, Lnet/jpountz/lz4/LZ4BlockInputStream;-><init>(Ljava/io/InputStream;Lnet/jpountz/lz4/LZ4FastDecompressor;Ljava/util/zip/Checksum;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lnet/jpountz/lz4/LZ4FastDecompressor;Ljava/util/zip/Checksum;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    .line 5
    .line 6
    iput-object p3, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->checksum:Ljava/util/zip/Checksum;

    .line 7
    .line 8
    iput-boolean p4, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->stopOnEmptyBlock:Z

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    new-array p2, p1, [B

    .line 12
    .line 13
    iput-object p2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 14
    .line 15
    sget p2, Lnet/jpountz/lz4/LZ4BlockOutputStream;->HEADER_LENGTH:I

    .line 16
    .line 17
    new-array p2, p2, [B

    .line 18
    .line 19
    iput-object p2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 20
    .line 21
    iput p1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 22
    .line 23
    iput p1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 24
    .line 25
    iput-boolean p1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 0

    .line 30
    invoke-static {}, Lnet/jpountz/lz4/LZ4Factory;->fastestInstance()Lnet/jpountz/lz4/LZ4Factory;

    move-result-object p0

    invoke-virtual {p0}, Lnet/jpountz/lz4/LZ4Factory;->fastDecompressor()Lnet/jpountz/lz4/LZ4FastDecompressor;

    invoke-static {}, Ll/emq0;->b()Ll/emq0;

    move-result-object p0

    const p1, -0x68b84d74

    invoke-virtual {p0, p1}, Ll/emq0;->g(I)Ll/z7g0;

    const/4 p0, 0x0

    throw p0
.end method

.method private readFully([BI)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4BlockInputStream;->tryReadFully([BI)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 9
    .line 10
    const-string p1, "Stream ended prematurely"

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method private refill()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 2
    .line 3
    sget v1, Lnet/jpountz/lz4/LZ4BlockOutputStream;->HEADER_LENGTH:I

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lnet/jpountz/lz4/LZ4BlockInputStream;->tryReadFully([BI)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-boolean v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->stopOnEmptyBlock:Z

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iput-boolean v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 20
    .line 21
    const-string v0, "Stream ended prematurely"

    .line 22
    .line 23
    invoke-direct {p0, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    move v2, v0

    .line 29
    :goto_0
    sget v3, Lnet/jpountz/lz4/LZ4BlockOutputStream;->MAGIC_LENGTH:I

    .line 30
    .line 31
    iget-object v4, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 32
    .line 33
    const-string v5, "Stream is corrupted"

    .line 34
    .line 35
    if-ge v2, v3, :cond_3

    .line 36
    .line 37
    aget-byte v3, v4, v2

    .line 38
    .line 39
    sget-object v4, Lnet/jpountz/lz4/LZ4BlockOutputStream;->MAGIC:[B

    .line 40
    .line 41
    aget-byte v4, v4, v2

    .line 42
    .line 43
    if-ne v3, v4, :cond_2

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-static {v5}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    aget-byte v2, v4, v3

    .line 53
    .line 54
    and-int/lit16 v6, v2, 0xf0

    .line 55
    .line 56
    and-int/lit8 v2, v2, 0xf

    .line 57
    .line 58
    add-int/lit8 v2, v2, 0xa

    .line 59
    .line 60
    const/16 v7, 0x20

    .line 61
    .line 62
    const/16 v8, 0x10

    .line 63
    .line 64
    if-eq v6, v8, :cond_5

    .line 65
    .line 66
    if-ne v6, v7, :cond_4

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_4
    invoke-static {v5}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_5
    :goto_1
    add-int/lit8 v9, v3, 0x1

    .line 74
    .line 75
    invoke-static {v4, v9}, Lnet/jpountz/util/SafeUtils;->readIntLE([BI)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    iget-object v9, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 80
    .line 81
    add-int/lit8 v10, v3, 0x5

    .line 82
    .line 83
    invoke-static {v9, v10}, Lnet/jpountz/util/SafeUtils;->readIntLE([BI)I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    iput v9, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 88
    .line 89
    iget-object v9, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 90
    .line 91
    add-int/lit8 v3, v3, 0x9

    .line 92
    .line 93
    invoke-static {v9, v3}, Lnet/jpountz/util/SafeUtils;->readIntLE([BI)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    iget v9, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 98
    .line 99
    shl-int v2, v1, v2

    .line 100
    .line 101
    if-gt v9, v2, :cond_12

    .line 102
    .line 103
    if-ltz v9, :cond_12

    .line 104
    .line 105
    if-ltz v4, :cond_12

    .line 106
    .line 107
    if-nez v9, :cond_6

    .line 108
    .line 109
    if-nez v4, :cond_12

    .line 110
    .line 111
    :cond_6
    if-eqz v9, :cond_7

    .line 112
    .line 113
    if-eqz v4, :cond_12

    .line 114
    .line 115
    :cond_7
    if-ne v6, v8, :cond_8

    .line 116
    .line 117
    if-ne v9, v4, :cond_12

    .line 118
    .line 119
    :cond_8
    if-nez v9, :cond_b

    .line 120
    .line 121
    if-nez v4, :cond_b

    .line 122
    .line 123
    if-nez v3, :cond_a

    .line 124
    .line 125
    iget-boolean v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->stopOnEmptyBlock:Z

    .line 126
    .line 127
    if-nez v0, :cond_9

    .line 128
    .line 129
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4BlockInputStream;->refill()V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_9
    iput-boolean v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 134
    .line 135
    return-void

    .line 136
    :cond_a
    invoke-static {v5}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_b
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 141
    .line 142
    array-length v2, v1

    .line 143
    if-ge v2, v9, :cond_c

    .line 144
    .line 145
    array-length v1, v1

    .line 146
    mul-int/lit8 v1, v1, 0x3

    .line 147
    .line 148
    div-int/lit8 v1, v1, 0x2

    .line 149
    .line 150
    invoke-static {v9, v1}, Ljava/lang/Math;->max(II)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    new-array v1, v1, [B

    .line 155
    .line 156
    iput-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 157
    .line 158
    :cond_c
    if-eq v6, v8, :cond_10

    .line 159
    .line 160
    if-ne v6, v7, :cond_f

    .line 161
    .line 162
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 163
    .line 164
    array-length v2, v1

    .line 165
    if-ge v2, v4, :cond_d

    .line 166
    .line 167
    array-length v1, v1

    .line 168
    mul-int/lit8 v1, v1, 0x3

    .line 169
    .line 170
    div-int/lit8 v1, v1, 0x2

    .line 171
    .line 172
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    new-array v1, v1, [B

    .line 177
    .line 178
    iput-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 179
    .line 180
    :cond_d
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 181
    .line 182
    invoke-direct {p0, v1, v4}, Lnet/jpountz/lz4/LZ4BlockInputStream;->readFully([BI)V

    .line 183
    .line 184
    .line 185
    :try_start_0
    iget-object v6, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    .line 186
    .line 187
    iget-object v7, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->compressedBuffer:[B

    .line 188
    .line 189
    iget-object v9, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 190
    .line 191
    iget v11, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 192
    .line 193
    const/4 v8, 0x0

    .line 194
    const/4 v10, 0x0

    .line 195
    invoke-virtual/range {v6 .. v11}, Lnet/jpountz/lz4/LZ4FastDecompressor;->decompress([BI[BII)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-ne v4, v1, :cond_e

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_e
    new-instance p0, Ljava/io/IOException;

    .line 203
    .line 204
    invoke-direct {p0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    throw p0
    :try_end_0
    .catch Lnet/jpountz/lz4/LZ4Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    :catch_0
    move-exception v0

    .line 209
    move-object p0, v0

    .line 210
    new-instance v0, Ljava/io/IOException;

    .line 211
    .line 212
    invoke-direct {v0, v5, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    throw v0

    .line 216
    :cond_f
    invoke-static {}, Ll/aqg0;->a()V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_10
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 221
    .line 222
    iget v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 223
    .line 224
    invoke-direct {p0, v1, v2}, Lnet/jpountz/lz4/LZ4BlockInputStream;->readFully([BI)V

    .line 225
    .line 226
    .line 227
    :goto_2
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->checksum:Ljava/util/zip/Checksum;

    .line 228
    .line 229
    invoke-interface {v1}, Ljava/util/zip/Checksum;->reset()V

    .line 230
    .line 231
    .line 232
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->checksum:Ljava/util/zip/Checksum;

    .line 233
    .line 234
    iget-object v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 235
    .line 236
    iget v4, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 237
    .line 238
    invoke-interface {v1, v2, v0, v4}, Ljava/util/zip/Checksum;->update([BII)V

    .line 239
    .line 240
    .line 241
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->checksum:Ljava/util/zip/Checksum;

    .line 242
    .line 243
    invoke-interface {v1}, Ljava/util/zip/Checksum;->getValue()J

    .line 244
    .line 245
    .line 246
    move-result-wide v1

    .line 247
    long-to-int v1, v1

    .line 248
    if-ne v1, v3, :cond_11

    .line 249
    .line 250
    iput v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 251
    .line 252
    return-void

    .line 253
    :cond_11
    invoke-static {v5}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :cond_12
    invoke-static {v5}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    return-void
.end method

.method private tryReadFully([BI)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p2, :cond_1

    .line 4
    .line 5
    iget-object v2, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 6
    .line 7
    sub-int v3, p2, v1

    .line 8
    .line 9
    invoke-virtual {v2, p1, v1, v3}, Ljava/io/InputStream;->read([BII)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-gez v2, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    add-int/2addr v1, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, 0x1

    .line 19
    return p0
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 2
    .line 3
    iget p0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public mark(I)V
    .locals 0

    return-void
.end method

.method public markSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-boolean v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 47
    :cond_0
    iget v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    iget v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    if-ne v0, v2, :cond_1

    .line 48
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4BlockInputStream;->refill()V

    .line 49
    :cond_1
    iget-boolean v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    if-eqz v0, :cond_2

    return v1

    .line 50
    :cond_2
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    iget v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    aget-byte p0, v0, v1

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 51
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lnet/jpountz/lz4/LZ4BlockInputStream;->read([BII)I

    move-result p0

    return p0
.end method

.method public read([BII)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lnet/jpountz/util/SafeUtils;->checkRange([BII)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    iget v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 11
    .line 12
    iget v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 13
    .line 14
    if-ne v0, v2, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4BlockInputStream;->refill()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-boolean v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    return v1

    .line 24
    :cond_2
    iget v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 25
    .line 26
    iget v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 27
    .line 28
    sub-int/2addr v0, v1

    .line 29
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->buffer:[B

    .line 34
    .line 35
    iget v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 36
    .line 37
    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 41
    .line 42
    add-int/2addr p1, p3

    .line 43
    iput p1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 44
    .line 45
    return p3
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/io/IOException;

    .line 2
    .line 3
    const-string v0, "mark/reset not supported"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public skip(J)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_3

    .line 6
    .line 7
    iget-boolean v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 13
    .line 14
    iget v3, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 15
    .line 16
    if-ne v2, v3, :cond_1

    .line 17
    .line 18
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4BlockInputStream;->refill()V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-boolean v2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->finished:Z

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_2
    iget v0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->originalLen:I

    .line 27
    .line 28
    iget v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 29
    .line 30
    sub-int/2addr v0, v1

    .line 31
    int-to-long v0, v0

    .line 32
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 33
    .line 34
    .line 35
    move-result-wide p1

    .line 36
    long-to-int p1, p1

    .line 37
    iget p2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 38
    .line 39
    add-int/2addr p2, p1

    .line 40
    iput p2, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->o:I

    .line 41
    .line 42
    int-to-long p0, p1

    .line 43
    return-wide p0

    .line 44
    :cond_3
    :goto_0
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "(in="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", decompressor="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ", checksum="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lnet/jpountz/lz4/LZ4BlockInputStream;->checksum:Ljava/util/zip/Checksum;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p0, ")"

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
