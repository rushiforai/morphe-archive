.class public Ll/z0r0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Ljava/nio/ByteBuffer;

.field private b:Ljava/nio/ByteBuffer;

.field private c:Ljava/util/zip/Adler32;

.field private d:Ll/d1r0;

.field private e:Ljava/io/OutputStream;

.field private f:I

.field private g:I

.field private h:[B


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ll/d1r0;)V
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
    iput-object v0, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

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
    iput-object v0, p0, Ll/z0r0;->b:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    new-instance v0, Ljava/util/zip/Adler32;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/zip/Adler32;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/z0r0;->c:Ljava/util/zip/Adler32;

    .line 25
    .line 26
    new-instance v0, Ljava/io/BufferedOutputStream;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/z0r0;->e:Ljava/io/OutputStream;

    .line 32
    .line 33
    iput-object p2, p0, Ll/z0r0;->d:Ll/d1r0;

    .line 34
    .line 35
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ljava/util/TimeZone;->getRawOffset()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    const v0, 0x36ee80

    .line 44
    .line 45
    .line 46
    div-int/2addr p2, v0

    .line 47
    iput p2, p0, Ll/z0r0;->f:I

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/util/TimeZone;->useDaylightTime()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput p1, p0, Ll/z0r0;->g:I

    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public a(Ll/w0r0;)I
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/w0r0;->x()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x8000

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "Blob size="

    .line 14
    .line 15
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, " should be less than 32768 Drop blob chid="

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, " id="

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v2

    .line 53
    :cond_0
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    add-int/lit8 v1, v0, 0xc

    .line 59
    .line 60
    iget-object v3, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-gt v1, v3, :cond_1

    .line 67
    .line 68
    iget-object v3, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    const/16 v4, 0x1000

    .line 75
    .line 76
    if-le v3, v4, :cond_2

    .line 77
    .line 78
    :cond_1
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    :cond_2
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    const/16 v3, -0x3d02

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 92
    .line 93
    const/4 v3, 0x5

    .line 94
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iget-object v3, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    invoke-virtual {p1, v3}, Ll/w0r0;->d(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    iput-object v3, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    const-string v3, "CONN"

    .line 117
    .line 118
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-nez v3, :cond_4

    .line 127
    .line 128
    iget-object v3, p0, Ll/z0r0;->h:[B

    .line 129
    .line 130
    if-nez v3, :cond_3

    .line 131
    .line 132
    iget-object v3, p0, Ll/z0r0;->d:Ll/d1r0;

    .line 133
    .line 134
    invoke-virtual {v3}, Ll/d1r0;->X()[B

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    iput-object v3, p0, Ll/z0r0;->h:[B

    .line 139
    .line 140
    :cond_3
    iget-object v3, p0, Ll/z0r0;->h:[B

    .line 141
    .line 142
    iget-object v4, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 143
    .line 144
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    const/4 v5, 0x1

    .line 149
    invoke-static {v3, v4, v5, v1, v0}, Lcom/xiaomi/push/service/ar;->a([B[BZII)[B

    .line 150
    .line 151
    .line 152
    :cond_4
    iget-object v0, p0, Ll/z0r0;->c:Ljava/util/zip/Adler32;

    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/util/zip/Adler32;->reset()V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/z0r0;->c:Ljava/util/zip/Adler32;

    .line 158
    .line 159
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v3, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    invoke-virtual {v0, v1, v2, v3}, Ljava/util/zip/Adler32;->update([BII)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/z0r0;->c:Ljava/util/zip/Adler32;

    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/util/zip/Adler32;->getValue()J

    .line 177
    .line 178
    .line 179
    move-result-wide v0

    .line 180
    long-to-int v0, v0

    .line 181
    iget-object v1, p0, Ll/z0r0;->b:Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    invoke-virtual {v1, v2, v0}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/z0r0;->e:Ljava/io/OutputStream;

    .line 187
    .line 188
    iget-object v1, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 189
    .line 190
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iget-object v3, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Ll/z0r0;->e:Ljava/io/OutputStream;

    .line 204
    .line 205
    iget-object v1, p0, Ll/z0r0;->b:Ljava/nio/ByteBuffer;

    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    const/4 v3, 0x4

    .line 212
    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/z0r0;->e:Ljava/io/OutputStream;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Ll/z0r0;->a:Ljava/nio/ByteBuffer;

    .line 221
    .line 222
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    add-int/2addr p0, v3

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    const-string v1, "[Slim] Wrote {cmd="

    .line 230
    .line 231
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v1, ";chid="

    .line 242
    .line 243
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string p1, ";len="

    .line 254
    .line 255
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    const-string p1, "}"

    .line 262
    .line 263
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-static {p1}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    return p0
.end method

.method public b()V
    .locals 7

    .line 1
    new-instance v0, Ll/jzq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jzq0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x6a

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/jzq0;->m(I)Ll/jzq0;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/q4r0;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/jzq0;->n(Ljava/lang/String;)Ll/jzq0;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/t5r0;->d()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/jzq0;->v(Ljava/lang/String;)Ll/jzq0;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/xiaomi/push/service/ax;->a()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/jzq0;->B(Ljava/lang/String;)Ll/jzq0;

    .line 30
    .line 31
    .line 32
    const/16 v1, 0x30

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/jzq0;->u(I)Ll/jzq0;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/z0r0;->d:Ll/d1r0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/u1r0;->t()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/jzq0;->G(Ljava/lang/String;)Ll/jzq0;

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/z0r0;->d:Ll/d1r0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/b2r0;->c()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/jzq0;->K(Ljava/lang/String;)Ll/jzq0;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ll/jzq0;->O(Ljava/lang/String;)Ll/jzq0;

    .line 64
    .line 65
    .line 66
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/jzq0;->A(I)Ll/jzq0;

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Ll/z0r0;->d:Ll/d1r0;

    .line 72
    .line 73
    invoke-virtual {v2}, Ll/b2r0;->F()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const-string v3, "com.xiaomi.xmsf"

    .line 78
    .line 79
    invoke-static {v2, v3}, Lcom/xiaomi/push/g;->b(Landroid/content/Context;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v0, v2}, Ll/jzq0;->F(I)Ll/jzq0;

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Ll/z0r0;->d:Ll/d1r0;

    .line 87
    .line 88
    invoke-virtual {v2}, Ll/u1r0;->f()Ll/v1r0;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v2}, Ll/v1r0;->a()[B

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    if-eqz v2, :cond_0

    .line 97
    .line 98
    invoke-static {v2}, Ll/gzq0;->m([B)Ll/gzq0;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v0, v2}, Ll/jzq0;->q(Ll/gzq0;)Ll/jzq0;

    .line 103
    .line 104
    .line 105
    :cond_0
    new-instance v2, Ll/w0r0;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/w0r0;-><init>()V

    .line 108
    .line 109
    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-virtual {v2, v3}, Ll/w0r0;->h(I)V

    .line 112
    .line 113
    .line 114
    const-string v3, "CONN"

    .line 115
    .line 116
    const/4 v4, 0x0

    .line 117
    invoke-virtual {v2, v3, v4}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const-wide/16 v5, 0x0

    .line 121
    .line 122
    const-string v3, "xiaomi.com"

    .line 123
    .line 124
    invoke-virtual {v2, v5, v6, v3, v4}, Ll/w0r0;->j(JLjava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ll/e0r0;->h()[B

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v2, v0, v4}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v2}, Ll/z0r0;->a(Ll/w0r0;)I

    .line 135
    .line 136
    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    const-string v2, "[slim] open conn: andver="

    .line 140
    .line 141
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, " sdk=48 tz="

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget v1, p0, Ll/z0r0;->f:I

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v1, ":"

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget p0, p0, Ll/z0r0;->g:I

    .line 163
    .line 164
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string p0, " Model="

    .line 168
    .line 169
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-static {}, Ll/q4r0;->a()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string p0, " os="

    .line 180
    .line 181
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    sget-object p0, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    new-instance v0, Ll/w0r0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0r0;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "CLOSE"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/z0r0;->a(Ll/w0r0;)I

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/z0r0;->e:Ljava/io/OutputStream;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
