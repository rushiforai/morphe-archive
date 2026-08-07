.class Ll/y0r0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/nio/ByteBuffer;

.field private b:Ljava/nio/ByteBuffer;

.field private c:Ljava/util/zip/Adler32;

.field private d:Ll/b1r0;

.field private e:Ljava/io/InputStream;

.field private f:Ll/d1r0;

.field private volatile g:Z

.field private h:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ll/d1r0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x800

    .line 5
    .line 6
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/y0r0;->b:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    new-instance v0, Ljava/util/zip/Adler32;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/zip/Adler32;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/y0r0;->c:Ljava/util/zip/Adler32;

    .line 25
    .line 26
    new-instance v0, Ljava/io/BufferedInputStream;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/y0r0;->e:Ljava/io/InputStream;

    .line 32
    .line 33
    iput-object p2, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 34
    .line 35
    new-instance p1, Ll/b1r0;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/b1r0;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/y0r0;->d:Ll/b1r0;

    .line 41
    .line 42
    return-void
.end method

.method private a()Ljava/nio/ByteBuffer;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Ll/y0r0;->d(Ljava/nio/ByteBuffer;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v2, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    const/4 v3, 0x2

    .line 23
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/16 v3, -0x3d02

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    if-ne v0, v3, :cond_5

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    if-ne v2, v0, :cond_5

    .line 34
    .line 35
    iget-object v0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v3, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const v5, 0x8000

    .line 49
    .line 50
    .line 51
    if-gt v0, v5, :cond_4

    .line 52
    .line 53
    add-int/lit8 v5, v0, 0x4

    .line 54
    .line 55
    iget-object v6, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    invoke-virtual {v6}, Ljava/nio/Buffer;->remaining()I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-le v5, v6, :cond_0

    .line 62
    .line 63
    add-int/lit16 v5, v0, 0x800

    .line 64
    .line 65
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    iget-object v6, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    iget-object v7, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    iget-object v8, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    invoke-virtual {v8}, Ljava/nio/Buffer;->position()I

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    add-int/2addr v7, v8

    .line 88
    invoke-virtual {v5, v6, v1, v7}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    iput-object v5, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    iget-object v5, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    const/16 v6, 0x1000

    .line 101
    .line 102
    if-le v5, v6, :cond_1

    .line 103
    .line 104
    const/16 v5, 0x800

    .line 105
    .line 106
    if-ge v0, v5, :cond_1

    .line 107
    .line 108
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    iget-object v6, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    iget-object v7, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    iget-object v8, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    invoke-virtual {v8}, Ljava/nio/Buffer;->position()I

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    add-int/2addr v7, v8

    .line 131
    invoke-virtual {v5, v6, v1, v7}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    iput-object v5, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 135
    .line 136
    :cond_1
    :goto_0
    iget-object v5, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    invoke-direct {p0, v5, v0}, Ll/y0r0;->d(Ljava/nio/ByteBuffer;I)V

    .line 139
    .line 140
    .line 141
    iget-object v5, p0, Ll/y0r0;->b:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 144
    .line 145
    .line 146
    iget-object v5, p0, Ll/y0r0;->b:Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    invoke-direct {p0, v5, v2}, Ll/y0r0;->d(Ljava/nio/ByteBuffer;I)V

    .line 149
    .line 150
    .line 151
    iget-object v2, p0, Ll/y0r0;->b:Ljava/nio/ByteBuffer;

    .line 152
    .line 153
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Ll/y0r0;->b:Ljava/nio/ByteBuffer;

    .line 157
    .line 158
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getInt()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    iget-object v5, p0, Ll/y0r0;->c:Ljava/util/zip/Adler32;

    .line 163
    .line 164
    invoke-virtual {v5}, Ljava/util/zip/Adler32;->reset()V

    .line 165
    .line 166
    .line 167
    iget-object v5, p0, Ll/y0r0;->c:Ljava/util/zip/Adler32;

    .line 168
    .line 169
    iget-object v6, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    iget-object v7, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 176
    .line 177
    invoke-virtual {v7}, Ljava/nio/Buffer;->position()I

    .line 178
    .line 179
    .line 180
    move-result v7

    .line 181
    invoke-virtual {v5, v6, v1, v7}, Ljava/util/zip/Adler32;->update([BII)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Ll/y0r0;->c:Ljava/util/zip/Adler32;

    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/util/zip/Adler32;->getValue()J

    .line 187
    .line 188
    .line 189
    move-result-wide v5

    .line 190
    long-to-int v1, v5

    .line 191
    if-ne v2, v1, :cond_3

    .line 192
    .line 193
    iget-object v1, p0, Ll/y0r0;->h:[B

    .line 194
    .line 195
    if-eqz v1, :cond_2

    .line 196
    .line 197
    iget-object v2, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 198
    .line 199
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    const/4 v4, 0x1

    .line 204
    invoke-static {v1, v2, v4, v3, v0}, Lcom/xiaomi/push/service/ar;->a([B[BZII)[B

    .line 205
    .line 206
    .line 207
    :cond_2
    iget-object p0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 208
    .line 209
    return-object p0

    .line 210
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    const-string v1, "CRC = "

    .line 213
    .line 214
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p0, Ll/y0r0;->c:Ljava/util/zip/Adler32;

    .line 218
    .line 219
    invoke-virtual {p0}, Ljava/util/zip/Adler32;->getValue()J

    .line 220
    .line 221
    .line 222
    move-result-wide v5

    .line 223
    long-to-int p0, v5

    .line 224
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string p0, " and "

    .line 228
    .line 229
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    const-string p0, "Corrupted Blob bad CRC"

    .line 243
    .line 244
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    return-object v4

    .line 248
    :cond_4
    const-string p0, "Blob size too large"

    .line 249
    .line 250
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    return-object v4

    .line 254
    :cond_5
    const-string p0, "Malformed Input"

    .line 255
    .line 256
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    return-object v4
.end method

.method private d(Ljava/nio/ByteBuffer;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/y0r0;->e:Ljava/io/InputStream;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2, v0, p2}, Ljava/io/InputStream;->read([BII)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, -0x1

    .line 16
    if-eq v1, v2, :cond_1

    .line 17
    .line 18
    sub-int/2addr p2, v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    if-gtz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-static {}, Ll/vg3;->a()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private f()V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/y0r0;->g:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/y0r0;->b()Ll/w0r0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "CONN"

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/w0r0;->p()[B

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Ll/kzq0;->o([B)Ll/kzq0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/kzq0;->p()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/kzq0;->j()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v2}, Ll/u1r0;->j(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    move v0, v3

    .line 45
    :cond_0
    invoke-virtual {v1}, Ll/kzq0;->t()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/kzq0;->k()Ll/gzq0;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    new-instance v4, Ll/w0r0;

    .line 56
    .line 57
    invoke-direct {v4}, Ll/w0r0;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v5, "SYNC"

    .line 61
    .line 62
    const-string v6, "CONF"

    .line 63
    .line 64
    invoke-virtual {v4, v5, v6}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ll/e0r0;->h()[B

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const/4 v5, 0x0

    .line 72
    invoke-virtual {v4, v2, v5}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 76
    .line 77
    invoke-virtual {v2, v4}, Ll/d1r0;->W(Ll/w0r0;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v4, "[Slim] CONN: host = "

    .line 83
    .line 84
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ll/kzq0;->q()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {v1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    if-eqz v0, :cond_9

    .line 102
    .line 103
    iget-object v0, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/d1r0;->X()[B

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Ll/y0r0;->h:[B

    .line 110
    .line 111
    :goto_0
    iget-boolean v0, p0, Ll/y0r0;->g:Z

    .line 112
    .line 113
    if-nez v0, :cond_8

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/y0r0;->b()Ll/w0r0;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 120
    .line 121
    .line 122
    move-result-wide v1

    .line 123
    iget-object v4, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 124
    .line 125
    invoke-virtual {v4}, Ll/u1r0;->C()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ll/w0r0;->g()S

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    if-eq v4, v3, :cond_7

    .line 133
    .line 134
    const-string v5, " failure:"

    .line 135
    .line 136
    const-string v6, "; Id="

    .line 137
    .line 138
    const-string v7, "[Slim] Parse packet from Blob chid="

    .line 139
    .line 140
    const/4 v8, 0x3

    .line 141
    const/4 v9, 0x2

    .line 142
    if-eq v4, v9, :cond_4

    .line 143
    .line 144
    if-eq v4, v8, :cond_3

    .line 145
    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v2, "[Slim] unknow blob type "

    .line 149
    .line 150
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0}, Ll/w0r0;->g()S

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_3
    :try_start_0
    iget-object v1, p0, Ll/y0r0;->d:Ll/b1r0;

    .line 169
    .line 170
    invoke-virtual {v0}, Ll/w0r0;->p()[B

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget-object v4, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 175
    .line 176
    invoke-virtual {v1, v2, v4}, Ll/b1r0;->a([BLl/u1r0;)Ll/g2r0;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iget-object v2, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 181
    .line 182
    invoke-virtual {v2, v1}, Ll/d1r0;->Y(Ll/g2r0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :catch_0
    move-exception v1

    .line 187
    new-instance v2, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Ll/w0r0;->a()I

    .line 193
    .line 194
    .line 195
    move-result v4

    .line 196
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0}, Ll/w0r0;->D()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    goto :goto_0

    .line 227
    :cond_4
    const-string v4, "SECMSG"

    .line 228
    .line 229
    invoke-virtual {v0}, Ll/w0r0;->c()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v10

    .line 233
    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    if-eqz v4, :cond_6

    .line 238
    .line 239
    invoke-virtual {v0}, Ll/w0r0;->a()I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    if-eq v4, v9, :cond_5

    .line 244
    .line 245
    invoke-virtual {v0}, Ll/w0r0;->a()I

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    if-ne v4, v8, :cond_6

    .line 250
    .line 251
    :cond_5
    invoke-virtual {v0}, Ll/w0r0;->t()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v4

    .line 255
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    if-eqz v4, :cond_6

    .line 260
    .line 261
    :try_start_1
    invoke-virtual {v0}, Ll/w0r0;->a()I

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    invoke-virtual {v0}, Ll/w0r0;->F()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v8

    .line 277
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 278
    .line 279
    .line 280
    move-result-object v9

    .line 281
    invoke-virtual {v9, v4, v8}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    iget-object v8, p0, Ll/y0r0;->d:Ll/b1r0;

    .line 286
    .line 287
    iget-object v4, v4, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {v0, v4}, Ll/w0r0;->q(Ljava/lang/String;)[B

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    iget-object v9, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 294
    .line 295
    invoke-virtual {v8, v4, v9}, Ll/b1r0;->a([BLl/u1r0;)Ll/g2r0;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    iput-wide v1, v4, Ll/g2r0;->j:J

    .line 300
    .line 301
    iget-object v1, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 302
    .line 303
    invoke-virtual {v1, v4}, Ll/d1r0;->Y(Ll/g2r0;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 304
    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :catch_1
    move-exception v1

    .line 309
    new-instance v2, Ljava/lang/StringBuilder;

    .line 310
    .line 311
    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v0}, Ll/w0r0;->a()I

    .line 315
    .line 316
    .line 317
    move-result v4

    .line 318
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0}, Ll/w0r0;->D()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :cond_6
    iget-object v1, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 351
    .line 352
    invoke-virtual {v1, v0}, Ll/d1r0;->W(Ll/w0r0;)V

    .line 353
    .line 354
    .line 355
    goto/16 :goto_0

    .line 356
    .line 357
    :cond_7
    iget-object v1, p0, Ll/y0r0;->f:Ll/d1r0;

    .line 358
    .line 359
    invoke-virtual {v1, v0}, Ll/d1r0;->W(Ll/w0r0;)V

    .line 360
    .line 361
    .line 362
    goto/16 :goto_0

    .line 363
    .line 364
    :cond_8
    return-void

    .line 365
    :cond_9
    const-string p0, "[Slim] Invalid CONN"

    .line 366
    .line 367
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    const-string p0, "Invalid Connection"

    .line 371
    .line 372
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    return-void
.end method


# virtual methods
.method public b()Ll/w0r0;
    .locals 5

    .line 1
    const-string v0, "[Slim] Read {cmd="

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-direct {p0}, Ll/y0r0;->a()Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 9
    .line 10
    .line 11
    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 12
    :try_start_1
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 13
    .line 14
    .line 15
    const/16 v4, 0x8

    .line 16
    .line 17
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 18
    .line 19
    .line 20
    if-ne v3, v4, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/c1r0;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/c1r0;-><init>()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Ll/w0r0;->e(Ljava/nio/ByteBuffer;)Ll/w0r0;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ll/w0r0;->c()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ";chid="

    .line 51
    .line 52
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ll/w0r0;->a()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, ";len="

    .line 63
    .line 64
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, "}"

    .line 71
    .line 72
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 80
    .line 81
    .line 82
    return-object v2

    .line 83
    :catch_1
    move-exception v0

    .line 84
    move v3, v1

    .line 85
    :goto_1
    if-nez v3, :cond_1

    .line 86
    .line 87
    iget-object v2, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v4, "[Slim] read Blob ["

    .line 96
    .line 97
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/y0r0;->a:Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const/16 v4, 0x80

    .line 107
    .line 108
    if-le v3, v4, :cond_2

    .line 109
    .line 110
    move v3, v4

    .line 111
    :cond_2
    invoke-static {p0, v1, v3}, Ll/ksq0;->a([BII)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string p0, "] Err:"

    .line 119
    .line 120
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw v0
.end method

.method public c()V
    .locals 1

    .line 1
    :try_start_0
    invoke-direct {p0}, Ll/y0r0;->f()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception v0

    .line 6
    iget-boolean p0, p0, Ll/y0r0;->g:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    throw v0
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/y0r0;->g:Z

    .line 3
    .line 4
    return-void
.end method
