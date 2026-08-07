.class public final Ll/imc0;
.super Ll/dml$j;
.source "SourceFile"

# interfaces
.implements Ll/bx5;


# instance fields
.field public final b:Ll/kmc0;

.field public final c:Ll/nnd0;

.field public d:Ljava/net/Socket;

.field public e:Ljava/net/Socket;

.field public f:Ll/txk;

.field public g:Lokhttp3/Protocol;

.field public h:Ll/dml;

.field public i:Lokio/BufferedSource;

.field public j:Lokio/BufferedSink;

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public final p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/Reference<",
            "Ll/oij0;",
            ">;>;"
        }
    .end annotation
.end field

.field public q:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/kmc0;Ll/nnd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/dml$j;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/imc0;->o:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/imc0;->p:Ljava/util/List;

    .line 13
    .line 14
    const-wide v0, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Ll/imc0;->q:J

    .line 20
    .line 21
    iput-object p1, p0, Ll/imc0;->b:Ll/kmc0;

    .line 22
    .line 23
    iput-object p2, p0, Ll/imc0;->c:Ll/nnd0;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a()Lokhttp3/Protocol;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/nnd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/txk;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imc0;->f:Ll/txk;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/net/Socket;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/dml;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/imc0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p1}, Ll/dml;->F()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Ll/imc0;->o:I

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public f(Ll/gml;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object p0, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Ll/gml;->d(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(IIIIZLl/ry3;Ll/t4f;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 2
    .line 3
    if-nez v0, :cond_b

    .line 4
    .line 5
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/y80;->b()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v7, Ll/mx5;

    .line 16
    .line 17
    invoke-direct {v7, v0}, Ll/mx5;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/y80;->k()Ljavax/net/ssl/SSLSocketFactory;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    sget-object v1, Lokhttp3/a;->j:Lokhttp3/a;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, v0}, Lokhttp3/internal/platform/Platform;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    new-instance p0, Lokhttp3/internal/connection/RouteException;

    .line 66
    .line 67
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 68
    .line 69
    new-instance p2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string p3, "CLEARTEXT communication to "

    .line 72
    .line 73
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p3, " not permitted by network security policy"

    .line 80
    .line 81
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :cond_1
    new-instance p0, Lokhttp3/internal/connection/RouteException;

    .line 96
    .line 97
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 98
    .line 99
    const-string p2, "CLEARTEXT communication not enabled for client"

    .line 100
    .line 101
    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 105
    .line 106
    .line 107
    throw p0

    .line 108
    :cond_2
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ll/y80;->f()Ljava/util/List;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    sget-object v1, Lokhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lokhttp3/Protocol;

    .line 119
    .line 120
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_a

    .line 125
    .line 126
    :goto_0
    const/4 v8, 0x0

    .line 127
    move-object v9, v8

    .line 128
    :goto_1
    :try_start_0
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 129
    .line 130
    invoke-virtual {v0}, Ll/nnd0;->c()Z

    .line 131
    .line 132
    .line 133
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 134
    if-eqz v0, :cond_4

    .line 135
    .line 136
    move-object v1, p0

    .line 137
    move v2, p1

    .line 138
    move v3, p2

    .line 139
    move v4, p3

    .line 140
    move-object/from16 v5, p6

    .line 141
    .line 142
    move-object/from16 v6, p7

    .line 143
    .line 144
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Ll/imc0;->k(IIILl/ry3;Ll/t4f;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 145
    .line 146
    .line 147
    move v10, v3

    .line 148
    move-object v2, v5

    .line 149
    move-object v1, v6

    .line 150
    :try_start_2
    iget-object v0, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 151
    .line 152
    if-nez v0, :cond_3

    .line 153
    .line 154
    goto :goto_6

    .line 155
    :cond_3
    :goto_2
    move/from16 v11, p4

    .line 156
    .line 157
    goto :goto_5

    .line 158
    :catch_0
    move-exception v0

    .line 159
    :goto_3
    move/from16 v11, p4

    .line 160
    .line 161
    :goto_4
    move-object v6, v0

    .line 162
    goto/16 :goto_9

    .line 163
    .line 164
    :catch_1
    move-exception v0

    .line 165
    move v10, v3

    .line 166
    move-object v2, v5

    .line 167
    move-object v1, v6

    .line 168
    goto :goto_3

    .line 169
    :cond_4
    move v10, p2

    .line 170
    move-object/from16 v2, p6

    .line 171
    .line 172
    move-object/from16 v1, p7

    .line 173
    .line 174
    invoke-virtual {p0, p1, p2, v2, v1}, Ll/imc0;->i(IILl/ry3;Ll/t4f;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :goto_5
    :try_start_3
    invoke-virtual {p0, v7, v11, v2, v1}, Ll/imc0;->n(Ll/mx5;ILl/ry3;Ll/t4f;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 182
    .line 183
    invoke-virtual {v0}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iget-object v3, p0, Ll/imc0;->c:Ll/nnd0;

    .line 188
    .line 189
    invoke-virtual {v3}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    iget-object v4, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 194
    .line 195
    invoke-virtual {v1, v2, v0, v3, v4}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 196
    .line 197
    .line 198
    :goto_6
    iget-object p1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 199
    .line 200
    invoke-virtual {p1}, Ll/nnd0;->c()Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-eqz p1, :cond_6

    .line 205
    .line 206
    iget-object p1, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 207
    .line 208
    if-eqz p1, :cond_5

    .line 209
    .line 210
    goto :goto_7

    .line 211
    :cond_5
    new-instance p0, Ljava/net/ProtocolException;

    .line 212
    .line 213
    const-string p1, "Too many tunnel connections attempted: 21"

    .line 214
    .line 215
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    new-instance p1, Lokhttp3/internal/connection/RouteException;

    .line 219
    .line 220
    invoke-direct {p1, p0}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 221
    .line 222
    .line 223
    throw p1

    .line 224
    :cond_6
    :goto_7
    iget-object p1, p0, Ll/imc0;->h:Ll/dml;

    .line 225
    .line 226
    if-eqz p1, :cond_7

    .line 227
    .line 228
    iget-object p1, p0, Ll/imc0;->b:Ll/kmc0;

    .line 229
    .line 230
    monitor-enter p1

    .line 231
    :try_start_4
    iget-object p2, p0, Ll/imc0;->h:Ll/dml;

    .line 232
    .line 233
    invoke-virtual {p2}, Ll/dml;->F()I

    .line 234
    .line 235
    .line 236
    move-result p2

    .line 237
    iput p2, p0, Ll/imc0;->o:I

    .line 238
    .line 239
    monitor-exit p1

    .line 240
    goto :goto_8

    .line 241
    :catchall_0
    move-exception v0

    .line 242
    move-object p0, v0

    .line 243
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 244
    throw p0

    .line 245
    :cond_7
    :goto_8
    return-void

    .line 246
    :catch_2
    move-exception v0

    .line 247
    goto :goto_4

    .line 248
    :catch_3
    move-exception v0

    .line 249
    move v10, p2

    .line 250
    move/from16 v11, p4

    .line 251
    .line 252
    move-object/from16 v2, p6

    .line 253
    .line 254
    move-object/from16 v1, p7

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :goto_9
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 258
    .line 259
    invoke-static {v0}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 263
    .line 264
    invoke-static {v0}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 265
    .line 266
    .line 267
    iput-object v8, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 268
    .line 269
    iput-object v8, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 270
    .line 271
    iput-object v8, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 272
    .line 273
    iput-object v8, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 274
    .line 275
    iput-object v8, p0, Ll/imc0;->f:Ll/txk;

    .line 276
    .line 277
    iput-object v8, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 278
    .line 279
    iput-object v8, p0, Ll/imc0;->h:Ll/dml;

    .line 280
    .line 281
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 282
    .line 283
    invoke-virtual {v0}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 288
    .line 289
    invoke-virtual {v0}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    const/4 v5, 0x0

    .line 294
    invoke-virtual/range {v1 .. v6}, Ll/t4f;->connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 295
    .line 296
    .line 297
    if-nez v9, :cond_8

    .line 298
    .line 299
    new-instance v9, Lokhttp3/internal/connection/RouteException;

    .line 300
    .line 301
    invoke-direct {v9, v6}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 302
    .line 303
    .line 304
    goto :goto_a

    .line 305
    :cond_8
    invoke-virtual {v9, v6}, Lokhttp3/internal/connection/RouteException;->addConnectException(Ljava/io/IOException;)V

    .line 306
    .line 307
    .line 308
    :goto_a
    if-eqz p5, :cond_9

    .line 309
    .line 310
    invoke-virtual {v7, v6}, Ll/mx5;->b(Ljava/io/IOException;)Z

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    if-eqz v0, :cond_9

    .line 315
    .line 316
    goto/16 :goto_1

    .line 317
    .line 318
    :cond_9
    throw v9

    .line 319
    :cond_a
    new-instance p0, Lokhttp3/internal/connection/RouteException;

    .line 320
    .line 321
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 322
    .line 323
    const-string p2, "H2_PRIOR_KNOWLEDGE cannot be used with HTTPS"

    .line 324
    .line 325
    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 329
    .line 330
    .line 331
    throw p0

    .line 332
    :cond_b
    const-string p0, "already connected"

    .line 333
    .line 334
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    return-void
.end method

.method public final i(IILl/ry3;Ll/t4f;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v3, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 18
    .line 19
    if-eq v2, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object v3, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 26
    .line 27
    if-ne v2, v3, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v1, Ljava/net/Socket;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ll/y80;->j()Ljavax/net/SocketFactory;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :goto_1
    iput-object v1, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 45
    .line 46
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p4, p3, v1, v0}, Ll/t4f;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 53
    .line 54
    .line 55
    iget-object p3, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 56
    .line 57
    invoke-virtual {p3, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 58
    .line 59
    .line 60
    :try_start_0
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object p3, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 65
    .line 66
    iget-object p4, p0, Ll/imc0;->c:Ll/nnd0;

    .line 67
    .line 68
    invoke-virtual {p4}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 69
    .line 70
    .line 71
    move-result-object p4

    .line 72
    invoke-virtual {p2, p3, p4, p1}, Lokhttp3/internal/platform/Platform;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1

    .line 73
    .line 74
    .line 75
    :try_start_1
    iget-object p1, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 76
    .line 77
    invoke-static {p1}, Lokio/Okio;->source(Ljava/net/Socket;)Lokio/Source;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 86
    .line 87
    iget-object p1, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 88
    .line 89
    invoke-static {p1}, Lokio/Okio;->sink(Ljava/net/Socket;)Lokio/Sink;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Ll/imc0;->j:Lokio/BufferedSink;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    .line 98
    .line 99
    return-void

    .line 100
    :catch_0
    move-exception p0

    .line 101
    const-string p1, "throw with null exception"

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_2

    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    new-instance p1, Ljava/io/IOException;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :catch_1
    move-exception p1

    .line 121
    new-instance p2, Ljava/net/ConnectException;

    .line 122
    .line 123
    new-instance p3, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string p4, "Failed to connect to "

    .line 126
    .line 127
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-direct {p2, p0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 147
    .line 148
    .line 149
    throw p2
.end method

.method public final j(Ll/mx5;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/y80;->k()Ljavax/net/ssl/SSLSocketFactory;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    :try_start_0
    iget-object v3, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {v4}, Ll/rnl;->m()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {v5}, Ll/rnl;->y()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    const/4 v6, 0x1

    .line 31
    invoke-virtual {v1, v3, v4, v5, v6}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljavax/net/ssl/SSLSocket;
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 36
    .line 37
    :try_start_1
    invoke-virtual {p1, v1}, Ll/mx5;->a(Ljavax/net/ssl/SSLSocket;)Lokhttp3/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lokhttp3/a;->f()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ll/rnl;->m()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v0}, Ll/y80;->f()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v3, v1, v4, v5}, Lokhttp3/internal/platform/Platform;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    move-object v2, v1

    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :catch_0
    move-exception p0

    .line 72
    move-object v2, v1

    .line 73
    goto/16 :goto_2

    .line 74
    .line 75
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Ll/txk;->b(Ljavax/net/ssl/SSLSession;)Ll/txk;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v0}, Ll/y80;->e()Ljavax/net/ssl/HostnameVerifier;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-virtual {v6}, Ll/rnl;->m()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-interface {v5, v6, v3}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-nez v3, :cond_2

    .line 103
    .line 104
    invoke-virtual {v4}, Ll/txk;->f()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result p1
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    const-string v2, "Hostname "

    .line 113
    .line 114
    if-nez p1, :cond_1

    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    :try_start_2
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 122
    .line 123
    new-instance p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 124
    .line 125
    new-instance v3, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v0, " not verified:\n    certificate: "

    .line 142
    .line 143
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-static {p0}, Ll/xq4;->c(Ljava/security/cert/Certificate;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v0, "\n    DN: "

    .line 154
    .line 155
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-interface {v0}, Ljava/security/Principal;->getName()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v0, "\n    subjectAltNames: "

    .line 170
    .line 171
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-static {p0}, Ll/pg50;->a(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-direct {p1, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    throw p1

    .line 189
    :cond_1
    new-instance p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 190
    .line 191
    new-instance p1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v0, " not verified (no certificates)"

    .line 208
    .line 209
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-direct {p0, p1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    throw p0

    .line 220
    :cond_2
    invoke-virtual {v0}, Ll/y80;->a()Ll/xq4;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v4}, Ll/txk;->f()Ljava/util/List;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    invoke-virtual {v3, v0, v5}, Ll/xq4;->a(Ljava/lang/String;Ljava/util/List;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Lokhttp3/a;->f()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_3

    .line 244
    .line 245
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p1, v1}, Lokhttp3/internal/platform/Platform;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    :cond_3
    iput-object v1, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 254
    .line 255
    invoke-static {v1}, Lokio/Okio;->source(Ljava/net/Socket;)Lokio/Source;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iput-object p1, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 264
    .line 265
    iget-object p1, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 266
    .line 267
    invoke-static {p1}, Lokio/Okio;->sink(Ljava/net/Socket;)Lokio/Sink;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    iput-object p1, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 276
    .line 277
    iput-object v4, p0, Ll/imc0;->f:Ll/txk;

    .line 278
    .line 279
    if-eqz v2, :cond_4

    .line 280
    .line 281
    invoke-static {v2}, Lokhttp3/Protocol;->get(Ljava/lang/String;)Lokhttp3/Protocol;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    goto :goto_1

    .line 286
    :cond_4
    sget-object p1, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 287
    .line 288
    :goto_1
    iput-object p1, p0, Ll/imc0;->g:Lokhttp3/Protocol;
    :try_end_2
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 289
    .line 290
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 291
    .line 292
    .line 293
    move-result-object p0

    .line 294
    invoke-virtual {p0, v1}, Lokhttp3/internal/platform/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 295
    .line 296
    .line 297
    return-void

    .line 298
    :catchall_1
    move-exception p0

    .line 299
    goto :goto_3

    .line 300
    :catch_1
    move-exception p0

    .line 301
    :goto_2
    :try_start_3
    invoke-static {p0}, Ll/zlk0;->A(Ljava/lang/AssertionError;)Z

    .line 302
    .line 303
    .line 304
    move-result p1

    .line 305
    if-eqz p1, :cond_5

    .line 306
    .line 307
    new-instance p1, Ljava/io/IOException;

    .line 308
    .line 309
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 310
    .line 311
    .line 312
    throw p1

    .line 313
    :cond_5
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 314
    :goto_3
    if-eqz v2, :cond_6

    .line 315
    .line 316
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    invoke-virtual {p1, v2}, Lokhttp3/internal/platform/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 321
    .line 322
    .line 323
    :cond_6
    invoke-static {v2}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 324
    .line 325
    .line 326
    throw p0
.end method

.method public final k(IIILl/ry3;Ll/t4f;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/imc0;->m()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    const/16 v3, 0x15

    .line 11
    .line 12
    if-ge v2, v3, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p4, p5}, Ll/imc0;->i(IILl/ry3;Ll/t4f;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2, p3, v0, v1}, Ll/imc0;->l(IILl/x1d0;Ll/rnl;)Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v3, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 25
    .line 26
    invoke-static {v3}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 27
    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    iput-object v3, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 31
    .line 32
    iput-object v3, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 33
    .line 34
    iput-object v3, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 35
    .line 36
    iget-object v4, p0, Ll/imc0;->c:Ll/nnd0;

    .line 37
    .line 38
    invoke-virtual {v4}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object v5, p0, Ll/imc0;->c:Ll/nnd0;

    .line 43
    .line 44
    invoke-virtual {v5}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {p5, p4, v4, v5, v3}, Ll/t4f;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    :goto_1
    return-void
.end method

.method public final l(IILl/x1d0;Ll/rnl;)Ll/x1d0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CONNECT "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {p4, v1}, Ll/zlk0;->s(Ll/rnl;Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p4, " HTTP/1.1"

    .line 17
    .line 18
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    :goto_0
    new-instance v0, Ll/bml;

    .line 26
    .line 27
    iget-object v1, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 28
    .line 29
    iget-object v2, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-direct {v0, v3, v3, v1, v2}, Ll/bml;-><init>(Ll/rg50;Ll/imc0;Lokio/BufferedSource;Lokio/BufferedSink;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 36
    .line 37
    invoke-interface {v1}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    int-to-long v4, p1

    .line 42
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-virtual {v1, v4, v5, v2}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 48
    .line 49
    invoke-interface {v1}, Lokio/Sink;->timeout()Lokio/Timeout;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    int-to-long v4, p2

    .line 54
    invoke-virtual {v1, v4, v5, v2}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p3}, Ll/x1d0;->e()Ll/e0l;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1, p4}, Ll/bml;->A(Ll/e0l;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ll/bml;->e()V

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-virtual {v0, v1}, Ll/bml;->f(Z)Ll/i5d0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1, p3}, Ll/i5d0$a;->q(Ll/x1d0;)Ll/i5d0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-virtual {p3}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-virtual {v0, p3}, Ll/bml;->z(Ll/i5d0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3}, Ll/i5d0;->q()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/16 v1, 0xc8

    .line 88
    .line 89
    if-eq v0, v1, :cond_3

    .line 90
    .line 91
    const/16 v1, 0x197

    .line 92
    .line 93
    if-ne v0, v1, :cond_2

    .line 94
    .line 95
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/y80;->h()Ll/ce1;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 106
    .line 107
    invoke-interface {v0, v1, p3}, Ll/ce1;->b(Ll/nnd0;Ll/i5d0;)Ll/x1d0;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    const-string v1, "Connection"

    .line 114
    .line 115
    invoke-virtual {p3, v1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    const-string v1, "close"

    .line 120
    .line 121
    invoke-virtual {v1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result p3

    .line 125
    if-eqz p3, :cond_0

    .line 126
    .line 127
    return-object v0

    .line 128
    :cond_0
    move-object p3, v0

    .line 129
    goto :goto_0

    .line 130
    :cond_1
    const-string p0, "Failed to authenticate with proxy"

    .line 131
    .line 132
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-object v3

    .line 136
    :cond_2
    const-string p0, "Unexpected response code for CONNECT: "

    .line 137
    .line 138
    invoke-virtual {p3}, Ll/i5d0;->q()I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    invoke-static {p0, p1}, Ll/yll;->a(Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    return-object v3

    .line 146
    :cond_3
    iget-object p1, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 147
    .line 148
    invoke-interface {p1}, Lokio/BufferedSource;->getBuffer()Lokio/Buffer;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Lokio/Buffer;->exhausted()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-eqz p1, :cond_4

    .line 157
    .line 158
    iget-object p0, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 159
    .line 160
    invoke-interface {p0}, Lokio/BufferedSink;->buffer()Lokio/Buffer;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0}, Lokio/Buffer;->exhausted()Z

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    if-eqz p0, :cond_4

    .line 169
    .line 170
    return-object v3

    .line 171
    :cond_4
    const-string p0, "TLS tunnel buffered too many bytes!"

    .line 172
    .line 173
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-object v3
.end method

.method public final m()Ll/x1d0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "CONNECT"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-static {v1, v2}, Ll/zlk0;->s(Ll/rnl;Z)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "Host"

    .line 43
    .line 44
    invoke-virtual {v0, v2, v1}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "Proxy-Connection"

    .line 49
    .line 50
    const-string v2, "Keep-Alive"

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "User-Agent"

    .line 57
    .line 58
    invoke-static {}, Ll/q9l0;->a()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/i5d0$a;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/i5d0$a;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ll/i5d0$a;->q(Ll/x1d0;)Ll/i5d0$a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget-object v2, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ll/i5d0$a;->o(Lokhttp3/Protocol;)Ll/i5d0$a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const/16 v2, 0x197

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ll/i5d0$a;->g(I)Ll/i5d0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "Preemptive Authenticate"

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ll/i5d0$a;->l(Ljava/lang/String;)Ll/i5d0$a;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget-object v2, Ll/zlk0;->d:Ll/k5d0;

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-wide/16 v2, -0x1

    .line 104
    .line 105
    invoke-virtual {v1, v2, v3}, Ll/i5d0$a;->r(J)Ll/i5d0$a;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1, v2, v3}, Ll/i5d0$a;->p(J)Ll/i5d0$a;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "Proxy-Authenticate"

    .line 114
    .line 115
    const-string v3, "OkHttp-Preemptive"

    .line 116
    .line 117
    invoke-virtual {v1, v2, v3}, Ll/i5d0$a;->i(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0$a;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iget-object v2, p0, Ll/imc0;->c:Ll/nnd0;

    .line 126
    .line 127
    invoke-virtual {v2}, Ll/nnd0;->a()Ll/y80;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2}, Ll/y80;->h()Ll/ce1;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iget-object p0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 136
    .line 137
    invoke-interface {v2, p0, v1}, Ll/ce1;->b(Ll/nnd0;Ll/i5d0;)Ll/x1d0;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    if-eqz p0, :cond_0

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_0
    return-object v0
.end method

.method public final n(Ll/mx5;ILl/ry3;Ll/t4f;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->c:Ll/nnd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/y80;->k()Ljavax/net/ssl/SSLSocketFactory;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/nnd0;->a()Ll/y80;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/y80;->f()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object p3, Lokhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lokhttp3/Protocol;

    .line 24
    .line 25
    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p4, p0, Ll/imc0;->d:Ljava/net/Socket;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iput-object p4, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 34
    .line 35
    iput-object p3, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ll/imc0;->v(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iput-object p4, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 42
    .line 43
    sget-object p1, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 44
    .line 45
    iput-object p1, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-virtual {p4, p3}, Ll/t4f;->secureConnectStart(Ll/ry3;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/imc0;->j(Ll/mx5;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/imc0;->f:Ll/txk;

    .line 55
    .line 56
    invoke-virtual {p4, p3, p1}, Ll/t4f;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 60
    .line 61
    sget-object p3, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 62
    .line 63
    if-ne p1, p3, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0, p2}, Ll/imc0;->v(I)V

    .line 66
    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method public o(Ll/y80;Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y80;",
            "Ljava/util/List<",
            "Ll/nnd0;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/imc0;->o:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-ge v0, v1, :cond_7

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/imc0;->k:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object v0, Ll/kzm;->a:Ll/kzm;

    .line 18
    .line 19
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1, p1}, Ll/kzm;->e(Ll/y80;Ll/y80;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    return v2

    .line 32
    :cond_1
    invoke-virtual {p1}, Ll/y80;->l()Ll/rnl;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/imc0;->b()Ll/nnd0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/rnl;->m()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v1, 0x1

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    return v1

    .line 64
    :cond_2
    iget-object v0, p0, Ll/imc0;->h:Ll/dml;

    .line 65
    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    return v2

    .line 69
    :cond_3
    if-eqz p2, :cond_7

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Ll/imc0;->u(Ljava/util/List;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-nez p2, :cond_4

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    invoke-virtual {p1}, Ll/y80;->e()Ljavax/net/ssl/HostnameVerifier;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    sget-object v0, Ll/pg50;->INSTANCE:Ll/pg50;

    .line 83
    .line 84
    if-eq p2, v0, :cond_5

    .line 85
    .line 86
    return v2

    .line 87
    :cond_5
    invoke-virtual {p1}, Ll/y80;->l()Ll/rnl;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p0, p2}, Ll/imc0;->w(Ll/rnl;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_6

    .line 96
    .line 97
    return v2

    .line 98
    :cond_6
    :try_start_0
    invoke-virtual {p1}, Ll/y80;->a()Ll/xq4;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p1}, Ll/y80;->l()Ll/rnl;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ll/rnl;->m()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0}, Ll/imc0;->c()Ll/txk;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Ll/txk;->f()Ljava/util/List;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p2, p1, p0}, Ll/xq4;->a(Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    return v1

    .line 122
    :catch_0
    :cond_7
    :goto_0
    return v2
.end method

.method public p(Z)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/net/Socket;->isInputShutdown()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_4

    .line 17
    .line 18
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/net/Socket;->isOutputShutdown()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Ll/imc0;->h:Ll/dml;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    invoke-virtual {v0, p0, p1}, Ll/dml;->B(J)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 v0, 0x1

    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    :try_start_0
    iget-object p1, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/net/Socket;->getSoTimeout()I

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :try_start_1
    iget-object v2, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 55
    .line 56
    invoke-interface {v2}, Lokio/BufferedSource;->exhausted()Z

    .line 57
    .line 58
    .line 59
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    iget-object p0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 61
    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    :try_start_2
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 65
    .line 66
    .line 67
    return v1

    .line 68
    :cond_2
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 69
    .line 70
    .line 71
    return v0

    .line 72
    :catchall_0
    move-exception v2

    .line 73
    iget-object p0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 76
    .line 77
    .line 78
    throw v2
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 79
    :catch_0
    return v1

    .line 80
    :catch_1
    :cond_3
    return v0

    .line 81
    :cond_4
    :goto_0
    return v1
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imc0;->h:Ll/dml;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public r(Ll/rg50;Ll/azm$a;)Ll/o6f;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->h:Ll/dml;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/eml;

    .line 6
    .line 7
    iget-object v1, p0, Ll/imc0;->h:Ll/dml;

    .line 8
    .line 9
    invoke-direct {v0, p1, p0, p2, v1}, Ll/eml;-><init>(Ll/rg50;Ll/imc0;Ll/azm$a;Ll/dml;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 14
    .line 15
    invoke-interface {p2}, Ll/azm$a;->readTimeoutMillis()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 23
    .line 24
    invoke-interface {v0}, Lokio/Source;->timeout()Lokio/Timeout;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {p2}, Ll/azm$a;->readTimeoutMillis()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-long v1, v1

    .line 33
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 39
    .line 40
    invoke-interface {v0}, Lokio/Sink;->timeout()Lokio/Timeout;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p2}, Ll/azm$a;->writeTimeoutMillis()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    int-to-long v1, p2

    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 50
    .line 51
    .line 52
    new-instance p2, Ll/bml;

    .line 53
    .line 54
    iget-object v0, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 55
    .line 56
    iget-object v1, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 57
    .line 58
    invoke-direct {p2, p1, p0, v0, v1}, Ll/bml;-><init>(Ll/rg50;Ll/imc0;Lokio/BufferedSource;Lokio/BufferedSink;)V

    .line 59
    .line 60
    .line 61
    return-object p2
.end method

.method public s(Ll/n6f;)Ll/jnc0$f;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/imc0;->t()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/imc0$a;

    .line 11
    .line 12
    iget-object v5, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 13
    .line 14
    iget-object v6, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    move-object v3, p0

    .line 18
    move-object v7, p1

    .line 19
    invoke-direct/range {v2 .. v7}, Ll/imc0$a;-><init>(Ll/imc0;ZLokio/BufferedSource;Lokio/BufferedSink;Ll/n6f;)V

    .line 20
    .line 21
    .line 22
    return-object v2
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/imc0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/imc0;->k:Z

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Connection{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/rnl;->m()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ":"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/rnl;->y()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, ", proxy="

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, " hostAddress="

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v1, " cipherSuite="

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/imc0;->f:Ll/txk;

    .line 81
    .line 82
    if-eqz v1, :cond_0

    .line 83
    .line 84
    invoke-virtual {v1}, Ll/txk;->a()Ll/w45;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    goto :goto_0

    .line 89
    :cond_0
    const-string v1, "none"

    .line 90
    .line 91
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v1, " protocol="

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/imc0;->g:Lokhttp3/Protocol;

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const/16 p0, 0x7d

    .line 105
    .line 106
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0
.end method

.method public final u(Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/nnd0;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    check-cast v3, Ll/nnd0;

    .line 14
    .line 15
    invoke-virtual {v3}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    sget-object v5, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 24
    .line 25
    if-ne v4, v5, :cond_0

    .line 26
    .line 27
    iget-object v4, p0, Ll/imc0;->c:Ll/nnd0;

    .line 28
    .line 29
    invoke-virtual {v4}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    if-ne v4, v5, :cond_0

    .line 38
    .line 39
    iget-object v4, p0, Ll/imc0;->c:Ll/nnd0;

    .line 40
    .line 41
    invoke-virtual {v4}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v3}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v4, v3}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return v1
.end method

.method public final v(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/dml$h;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, v1}, Ll/dml$h;-><init>(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/imc0;->e:Ljava/net/Socket;

    .line 14
    .line 15
    iget-object v2, p0, Ll/imc0;->c:Ll/nnd0;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/nnd0;->a()Ll/y80;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/y80;->l()Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/rnl;->m()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Ll/imc0;->i:Lokio/BufferedSource;

    .line 30
    .line 31
    iget-object v4, p0, Ll/imc0;->j:Lokio/BufferedSink;

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/dml$h;->d(Ljava/net/Socket;Ljava/lang/String;Lokio/BufferedSource;Lokio/BufferedSink;)Ll/dml$h;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p0}, Ll/dml$h;->b(Ll/dml$j;)Ll/dml$h;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, p1}, Ll/dml$h;->c(I)Ll/dml$h;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/dml$h;->a()Ll/dml;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/imc0;->h:Ll/dml;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/dml;->e0()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public w(Ll/rnl;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/rnl;->y()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/rnl;->y()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/rnl;->m()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/imc0;->c:Ll/nnd0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/nnd0;->a()Ll/y80;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/y80;->l()Ll/rnl;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ll/rnl;->m()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x1

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Ll/imc0;->f:Ll/txk;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    sget-object v0, Ll/pg50;->INSTANCE:Ll/pg50;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/rnl;->m()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p0, p0, Ll/imc0;->f:Ll/txk;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/txk;->f()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 69
    .line 70
    invoke-virtual {v0, p1, p0}, Ll/pg50;->c(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_1

    .line 75
    .line 76
    return v1

    .line 77
    :cond_1
    return v2

    .line 78
    :cond_2
    return v1
.end method

.method public x(Ljava/io/IOException;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/imc0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    instance-of v1, p1, Lokhttp3/internal/http2/StreamResetException;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lokhttp3/internal/http2/StreamResetException;

    .line 10
    .line 11
    iget-object p1, p1, Lokhttp3/internal/http2/StreamResetException;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    .line 12
    .line 13
    sget-object v1, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    .line 14
    .line 15
    if-ne p1, v1, :cond_0

    .line 16
    .line 17
    iget p1, p0, Ll/imc0;->n:I

    .line 18
    .line 19
    add-int/2addr p1, v2

    .line 20
    iput p1, p0, Ll/imc0;->n:I

    .line 21
    .line 22
    if-le p1, v2, :cond_4

    .line 23
    .line 24
    iput-boolean v2, p0, Ll/imc0;->k:Z

    .line 25
    .line 26
    iget p1, p0, Ll/imc0;->l:I

    .line 27
    .line 28
    add-int/2addr p1, v2

    .line 29
    iput p1, p0, Ll/imc0;->l:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    sget-object v1, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 35
    .line 36
    if-eq p1, v1, :cond_4

    .line 37
    .line 38
    iput-boolean v2, p0, Ll/imc0;->k:Z

    .line 39
    .line 40
    iget p1, p0, Ll/imc0;->l:I

    .line 41
    .line 42
    add-int/2addr p1, v2

    .line 43
    iput p1, p0, Ll/imc0;->l:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0}, Ll/imc0;->q()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    instance-of v1, p1, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 53
    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    :cond_2
    iput-boolean v2, p0, Ll/imc0;->k:Z

    .line 57
    .line 58
    iget v1, p0, Ll/imc0;->m:I

    .line 59
    .line 60
    if-nez v1, :cond_4

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object v1, p0, Ll/imc0;->b:Ll/kmc0;

    .line 65
    .line 66
    iget-object v3, p0, Ll/imc0;->c:Ll/nnd0;

    .line 67
    .line 68
    invoke-virtual {v1, v3, p1}, Ll/kmc0;->c(Ll/nnd0;Ljava/io/IOException;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget p1, p0, Ll/imc0;->l:I

    .line 72
    .line 73
    add-int/2addr p1, v2

    .line 74
    iput p1, p0, Ll/imc0;->l:I

    .line 75
    .line 76
    :cond_4
    :goto_0
    monitor-exit v0

    .line 77
    return-void

    .line 78
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method
