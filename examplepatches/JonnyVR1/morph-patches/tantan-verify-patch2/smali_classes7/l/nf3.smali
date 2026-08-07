.class public final Ll/nf3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# instance fields
.field public final a:Ll/eu6;


# direct methods
.method public constructor <init>(Ll/eu6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nf3;->a:Ll/eu6;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/du6;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_1

    .line 12
    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    const-string v2, "; "

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/du6;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/du6;->c()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 v3, 0x3d

    .line 34
    .line 35
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ll/du6;->k()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/azm$a;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0}, Ll/x1d0;->a()Ll/z1d0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-wide/16 v3, -0x1

    .line 14
    .line 15
    const-string v5, "Content-Type"

    .line 16
    .line 17
    const-string v6, "Content-Length"

    .line 18
    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/z1d0;->contentType()Ll/e7y;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    if-eqz v7, :cond_0

    .line 26
    .line 27
    invoke-virtual {v7}, Ll/e7y;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    invoke-virtual {v1, v5, v7}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {v2}, Ll/z1d0;->contentLength()J

    .line 35
    .line 36
    .line 37
    move-result-wide v7

    .line 38
    cmp-long v2, v7, v3

    .line 39
    .line 40
    const-string v9, "Transfer-Encoding"

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v6, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v9}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const-string v2, "chunked"

    .line 56
    .line 57
    invoke-virtual {v1, v9, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v6}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_0
    const-string v2, "Host"

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    const/4 v8, 0x0

    .line 70
    if-nez v7, :cond_3

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    invoke-static {v7, v8}, Ll/zlk0;->s(Ll/rnl;Z)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    invoke-virtual {v1, v2, v7}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 81
    .line 82
    .line 83
    :cond_3
    const-string v2, "Connection"

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    if-nez v7, :cond_4

    .line 90
    .line 91
    const-string v7, "Keep-Alive"

    .line 92
    .line 93
    invoke-virtual {v1, v2, v7}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 94
    .line 95
    .line 96
    :cond_4
    const-string v2, "Accept-Encoding"

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    const-string v9, "gzip"

    .line 103
    .line 104
    if-nez v7, :cond_5

    .line 105
    .line 106
    const-string v7, "Range"

    .line 107
    .line 108
    invoke-virtual {v0, v7}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    if-nez v7, :cond_5

    .line 113
    .line 114
    invoke-virtual {v1, v2, v9}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 115
    .line 116
    .line 117
    const/4 v8, 0x1

    .line 118
    :cond_5
    iget-object v2, p0, Ll/nf3;->a:Ll/eu6;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    invoke-interface {v2, v7}, Ll/eu6;->a(Ll/rnl;)Ljava/util/List;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    if-nez v7, :cond_6

    .line 133
    .line 134
    const-string v7, "Cookie"

    .line 135
    .line 136
    invoke-virtual {p0, v2}, Ll/nf3;->a(Ljava/util/List;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v1, v7, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 141
    .line 142
    .line 143
    :cond_6
    const-string v2, "User-Agent"

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    if-nez v7, :cond_7

    .line 150
    .line 151
    invoke-static {}, Ll/q9l0;->a()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    invoke-virtual {v1, v2, v7}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 156
    .line 157
    .line 158
    :cond_7
    invoke-virtual {v1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-interface {p1, v1}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    iget-object p0, p0, Ll/nf3;->a:Ll/eu6;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {p1}, Ll/i5d0;->F()Ll/e0l;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-static {p0, v1, v2}, Ll/yml;->g(Ll/eu6;Ll/rnl;Ll/e0l;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p0, v0}, Ll/i5d0$a;->q(Ll/x1d0;)Ll/i5d0$a;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    if-eqz v8, :cond_8

    .line 188
    .line 189
    const-string v0, "Content-Encoding"

    .line 190
    .line 191
    invoke-virtual {p1, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v9, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-eqz v1, :cond_8

    .line 200
    .line 201
    invoke-static {p1}, Ll/yml;->c(Ll/i5d0;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_8

    .line 206
    .line 207
    new-instance v1, Lokio/GzipSource;

    .line 208
    .line 209
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {v2}, Ll/k5d0;->source()Lokio/BufferedSource;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-direct {v1, v2}, Lokio/GzipSource;-><init>(Lokio/Source;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1}, Ll/i5d0;->F()Ll/e0l;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-virtual {v2}, Ll/e0l;->h()Ll/e0l$a;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {v2, v0}, Ll/e0l$a;->g(Ljava/lang/String;)Ll/e0l$a;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v0, v6}, Ll/e0l$a;->g(Ljava/lang/String;)Ll/e0l$a;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Ll/e0l$a;->e()Ll/e0l;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {p0, v0}, Ll/i5d0$a;->j(Ll/e0l;)Ll/i5d0$a;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1, v5}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    new-instance v0, Ll/vmc0;

    .line 248
    .line 249
    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-direct {v0, p1, v3, v4, v1}, Ll/vmc0;-><init>(Ljava/lang/String;JLokio/BufferedSource;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0, v0}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 257
    .line 258
    .line 259
    :cond_8
    invoke-virtual {p0}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    return-object p0
.end method
