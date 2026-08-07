.class public final Ll/p6f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/oij0;

.field public final b:Ll/y80;

.field public final c:Ll/kmc0;

.field public final d:Ll/ry3;

.field public final e:Ll/t4f;

.field public f:Ll/pnd0$a;

.field public final g:Ll/pnd0;

.field public h:Ll/imc0;

.field public i:Z

.field public j:Ll/nnd0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/oij0;Ll/kmc0;Ll/y80;Ll/ry3;Ll/t4f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p6f;->a:Ll/oij0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p6f;->c:Ll/kmc0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/p6f;->b:Ll/y80;

    .line 9
    .line 10
    iput-object p4, p0, Ll/p6f;->d:Ll/ry3;

    .line 11
    .line 12
    iput-object p5, p0, Ll/p6f;->e:Ll/t4f;

    .line 13
    .line 14
    new-instance p1, Ll/pnd0;

    .line 15
    .line 16
    iget-object p2, p2, Ll/kmc0;->e:Ll/ond0;

    .line 17
    .line 18
    invoke-direct {p1, p3, p2, p4, p5}, Ll/pnd0;-><init>(Ll/y80;Ll/ond0;Ll/ry3;Ll/t4f;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/p6f;->g:Ll/pnd0;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a()Ll/imc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6f;->h:Ll/imc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/rg50;Ll/azm$a;Z)Ll/o6f;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/azm$a;->connectTimeoutMillis()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-interface {p2}, Ll/azm$a;->readTimeoutMillis()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    invoke-interface {p2}, Ll/azm$a;->writeTimeoutMillis()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    invoke-virtual {p1}, Ll/rg50;->y()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    invoke-virtual {p1}, Ll/rg50;->E()Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    move-object v1, p0

    .line 22
    move v7, p3

    .line 23
    :try_start_0
    invoke-virtual/range {v1 .. v7}, Ll/p6f;->d(IIIIZZ)Ll/imc0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1, p2}, Ll/imc0;->r(Ll/rg50;Ll/azm$a;)Ll/o6f;

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_0
    .catch Lokhttp3/internal/connection/RouteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_2

    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    goto :goto_0

    .line 35
    :catch_1
    move-exception v0

    .line 36
    move-object p0, v0

    .line 37
    goto :goto_1

    .line 38
    :catch_2
    move-exception v0

    .line 39
    move-object p0, v0

    .line 40
    new-instance p1, Ljava/io/IOException;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    throw p1

    .line 46
    :goto_0
    invoke-virtual {v1}, Ll/p6f;->h()V

    .line 47
    .line 48
    .line 49
    new-instance p1, Lokhttp3/internal/connection/RouteException;

    .line 50
    .line 51
    invoke-direct {p1, p0}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :goto_1
    invoke-virtual {v1}, Ll/p6f;->h()V

    .line 56
    .line 57
    .line 58
    throw p0
.end method

.method public final c(IIIIZ)Ll/imc0;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/p6f;->c:Ll/kmc0;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, v0, Ll/p6f;->a:Ll/oij0;

    .line 7
    .line 8
    invoke-virtual {v2}, Ll/oij0;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_11

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, v0, Ll/p6f;->i:Z

    .line 16
    .line 17
    iget-object v3, v0, Ll/p6f;->a:Ll/oij0;

    .line 18
    .line 19
    iget-object v4, v3, Ll/oij0;->i:Ll/imc0;

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    iget-boolean v6, v4, Ll/imc0;->k:Z

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/oij0;->n()Ljava/net/Socket;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto/16 :goto_9

    .line 35
    .line 36
    :cond_0
    move-object v3, v5

    .line 37
    :goto_0
    iget-object v6, v0, Ll/p6f;->a:Ll/oij0;

    .line 38
    .line 39
    iget-object v7, v6, Ll/oij0;->i:Ll/imc0;

    .line 40
    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    move-object v4, v5

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move-object v7, v5

    .line 46
    :goto_1
    const/4 v8, 0x1

    .line 47
    if-nez v7, :cond_4

    .line 48
    .line 49
    iget-object v9, v0, Ll/p6f;->c:Ll/kmc0;

    .line 50
    .line 51
    iget-object v10, v0, Ll/p6f;->b:Ll/y80;

    .line 52
    .line 53
    invoke-virtual {v9, v10, v6, v5, v2}, Ll/kmc0;->g(Ll/y80;Ll/oij0;Ljava/util/List;Z)Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-eqz v6, :cond_2

    .line 58
    .line 59
    iget-object v6, v0, Ll/p6f;->a:Ll/oij0;

    .line 60
    .line 61
    iget-object v7, v6, Ll/oij0;->i:Ll/imc0;

    .line 62
    .line 63
    move-object v6, v5

    .line 64
    move v9, v8

    .line 65
    goto :goto_3

    .line 66
    :cond_2
    iget-object v6, v0, Ll/p6f;->j:Ll/nnd0;

    .line 67
    .line 68
    if-eqz v6, :cond_3

    .line 69
    .line 70
    iput-object v5, v0, Ll/p6f;->j:Ll/nnd0;

    .line 71
    .line 72
    :goto_2
    move v9, v2

    .line 73
    goto :goto_3

    .line 74
    :cond_3
    invoke-virtual {v0}, Ll/p6f;->g()Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eqz v6, :cond_4

    .line 79
    .line 80
    iget-object v6, v0, Ll/p6f;->a:Ll/oij0;

    .line 81
    .line 82
    iget-object v6, v6, Ll/oij0;->i:Ll/imc0;

    .line 83
    .line 84
    invoke-virtual {v6}, Ll/imc0;->b()Ll/nnd0;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move v9, v2

    .line 90
    move-object v6, v5

    .line 91
    :goto_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    invoke-static {v3}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 93
    .line 94
    .line 95
    if-eqz v4, :cond_5

    .line 96
    .line 97
    iget-object v1, v0, Ll/p6f;->e:Ll/t4f;

    .line 98
    .line 99
    iget-object v3, v0, Ll/p6f;->d:Ll/ry3;

    .line 100
    .line 101
    invoke-virtual {v1, v3, v4}, Ll/t4f;->connectionReleased(Ll/ry3;Ll/bx5;)V

    .line 102
    .line 103
    .line 104
    :cond_5
    if-eqz v9, :cond_6

    .line 105
    .line 106
    iget-object v1, v0, Ll/p6f;->e:Ll/t4f;

    .line 107
    .line 108
    iget-object v3, v0, Ll/p6f;->d:Ll/ry3;

    .line 109
    .line 110
    invoke-virtual {v1, v3, v7}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    if-eqz v7, :cond_7

    .line 114
    .line 115
    return-object v7

    .line 116
    :cond_7
    if-nez v6, :cond_9

    .line 117
    .line 118
    iget-object v1, v0, Ll/p6f;->f:Ll/pnd0$a;

    .line 119
    .line 120
    if-eqz v1, :cond_8

    .line 121
    .line 122
    invoke-virtual {v1}, Ll/pnd0$a;->b()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_9

    .line 127
    .line 128
    :cond_8
    iget-object v1, v0, Ll/p6f;->g:Ll/pnd0;

    .line 129
    .line 130
    invoke-virtual {v1}, Ll/pnd0;->b()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_9

    .line 135
    .line 136
    iget-object v1, v0, Ll/p6f;->g:Ll/pnd0;

    .line 137
    .line 138
    invoke-virtual {v1}, Ll/pnd0;->d()Ll/pnd0$a;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iput-object v1, v0, Ll/p6f;->f:Ll/pnd0$a;

    .line 143
    .line 144
    move v1, v8

    .line 145
    goto :goto_4

    .line 146
    :cond_9
    move v1, v2

    .line 147
    :goto_4
    iget-object v3, v0, Ll/p6f;->c:Ll/kmc0;

    .line 148
    .line 149
    monitor-enter v3

    .line 150
    :try_start_1
    iget-object v4, v0, Ll/p6f;->a:Ll/oij0;

    .line 151
    .line 152
    invoke-virtual {v4}, Ll/oij0;->i()Z

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    if-nez v4, :cond_10

    .line 157
    .line 158
    if-eqz v1, :cond_a

    .line 159
    .line 160
    iget-object v1, v0, Ll/p6f;->f:Ll/pnd0$a;

    .line 161
    .line 162
    invoke-virtual {v1}, Ll/pnd0$a;->a()Ljava/util/List;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iget-object v4, v0, Ll/p6f;->c:Ll/kmc0;

    .line 167
    .line 168
    iget-object v10, v0, Ll/p6f;->b:Ll/y80;

    .line 169
    .line 170
    iget-object v11, v0, Ll/p6f;->a:Ll/oij0;

    .line 171
    .line 172
    invoke-virtual {v4, v10, v11, v1, v2}, Ll/kmc0;->g(Ll/y80;Ll/oij0;Ljava/util/List;Z)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-eqz v2, :cond_b

    .line 177
    .line 178
    iget-object v2, v0, Ll/p6f;->a:Ll/oij0;

    .line 179
    .line 180
    iget-object v7, v2, Ll/oij0;->i:Ll/imc0;

    .line 181
    .line 182
    move v9, v8

    .line 183
    goto :goto_5

    .line 184
    :catchall_1
    move-exception v0

    .line 185
    goto/16 :goto_8

    .line 186
    .line 187
    :cond_a
    move-object v1, v5

    .line 188
    :cond_b
    :goto_5
    if-nez v9, :cond_d

    .line 189
    .line 190
    if-nez v6, :cond_c

    .line 191
    .line 192
    iget-object v2, v0, Ll/p6f;->f:Ll/pnd0$a;

    .line 193
    .line 194
    invoke-virtual {v2}, Ll/pnd0$a;->c()Ll/nnd0;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    move-object v6, v2

    .line 199
    :cond_c
    new-instance v7, Ll/imc0;

    .line 200
    .line 201
    iget-object v2, v0, Ll/p6f;->c:Ll/kmc0;

    .line 202
    .line 203
    invoke-direct {v7, v2, v6}, Ll/imc0;-><init>(Ll/kmc0;Ll/nnd0;)V

    .line 204
    .line 205
    .line 206
    iput-object v7, v0, Ll/p6f;->h:Ll/imc0;

    .line 207
    .line 208
    :cond_d
    move-object v10, v7

    .line 209
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 210
    if-eqz v9, :cond_e

    .line 211
    .line 212
    iget-object v1, v0, Ll/p6f;->e:Ll/t4f;

    .line 213
    .line 214
    iget-object v0, v0, Ll/p6f;->d:Ll/ry3;

    .line 215
    .line 216
    invoke-virtual {v1, v0, v10}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V

    .line 217
    .line 218
    .line 219
    return-object v10

    .line 220
    :cond_e
    iget-object v2, v0, Ll/p6f;->d:Ll/ry3;

    .line 221
    .line 222
    iget-object v3, v0, Ll/p6f;->e:Ll/t4f;

    .line 223
    .line 224
    move/from16 v11, p1

    .line 225
    .line 226
    move/from16 v12, p2

    .line 227
    .line 228
    move/from16 v13, p3

    .line 229
    .line 230
    move/from16 v14, p4

    .line 231
    .line 232
    move/from16 v15, p5

    .line 233
    .line 234
    move-object/from16 v16, v2

    .line 235
    .line 236
    move-object/from16 v17, v3

    .line 237
    .line 238
    invoke-virtual/range {v10 .. v17}, Ll/imc0;->h(IIIIZLl/ry3;Ll/t4f;)V

    .line 239
    .line 240
    .line 241
    iget-object v2, v0, Ll/p6f;->c:Ll/kmc0;

    .line 242
    .line 243
    iget-object v2, v2, Ll/kmc0;->e:Ll/ond0;

    .line 244
    .line 245
    invoke-virtual {v10}, Ll/imc0;->b()Ll/nnd0;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    invoke-virtual {v2, v3}, Ll/ond0;->a(Ll/nnd0;)V

    .line 250
    .line 251
    .line 252
    iget-object v2, v0, Ll/p6f;->c:Ll/kmc0;

    .line 253
    .line 254
    monitor-enter v2

    .line 255
    :try_start_2
    iput-object v5, v0, Ll/p6f;->h:Ll/imc0;

    .line 256
    .line 257
    iget-object v3, v0, Ll/p6f;->c:Ll/kmc0;

    .line 258
    .line 259
    iget-object v4, v0, Ll/p6f;->b:Ll/y80;

    .line 260
    .line 261
    iget-object v7, v0, Ll/p6f;->a:Ll/oij0;

    .line 262
    .line 263
    invoke-virtual {v3, v4, v7, v1, v8}, Ll/kmc0;->g(Ll/y80;Ll/oij0;Ljava/util/List;Z)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eqz v1, :cond_f

    .line 268
    .line 269
    iput-boolean v8, v10, Ll/imc0;->k:Z

    .line 270
    .line 271
    invoke-virtual {v10}, Ll/imc0;->d()Ljava/net/Socket;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    iget-object v1, v0, Ll/p6f;->a:Ll/oij0;

    .line 276
    .line 277
    iget-object v10, v1, Ll/oij0;->i:Ll/imc0;

    .line 278
    .line 279
    iput-object v6, v0, Ll/p6f;->j:Ll/nnd0;

    .line 280
    .line 281
    goto :goto_6

    .line 282
    :catchall_2
    move-exception v0

    .line 283
    goto :goto_7

    .line 284
    :cond_f
    iget-object v1, v0, Ll/p6f;->c:Ll/kmc0;

    .line 285
    .line 286
    invoke-virtual {v1, v10}, Ll/kmc0;->f(Ll/imc0;)V

    .line 287
    .line 288
    .line 289
    iget-object v1, v0, Ll/p6f;->a:Ll/oij0;

    .line 290
    .line 291
    invoke-virtual {v1, v10}, Ll/oij0;->a(Ll/imc0;)V

    .line 292
    .line 293
    .line 294
    :goto_6
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 295
    invoke-static {v5}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 296
    .line 297
    .line 298
    iget-object v1, v0, Ll/p6f;->e:Ll/t4f;

    .line 299
    .line 300
    iget-object v0, v0, Ll/p6f;->d:Ll/ry3;

    .line 301
    .line 302
    invoke-virtual {v1, v0, v10}, Ll/t4f;->connectionAcquired(Ll/ry3;Ll/bx5;)V

    .line 303
    .line 304
    .line 305
    return-object v10

    .line 306
    :goto_7
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 307
    throw v0

    .line 308
    :cond_10
    :try_start_4
    new-instance v0, Ljava/io/IOException;

    .line 309
    .line 310
    const-string v1, "Canceled"

    .line 311
    .line 312
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    throw v0

    .line 316
    :goto_8
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 317
    throw v0

    .line 318
    :cond_11
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    .line 319
    .line 320
    const-string v2, "Canceled"

    .line 321
    .line 322
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    throw v0

    .line 326
    :goto_9
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 327
    throw v0
.end method

.method public final d(IIIIZZ)Ll/imc0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    invoke-virtual/range {p0 .. p5}, Ll/p6f;->c(IIIIZ)Ll/imc0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/p6f;->c:Ll/kmc0;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget v2, v0, Ll/imc0;->m:I

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/imc0;->q()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    monitor-exit v1

    .line 19
    return-object v0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    move-object p0, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    invoke-virtual {v0, p6}, Ll/imc0;->p(Z)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/imc0;->t()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-object v0

    .line 35
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0
.end method

.method public e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p6f;->c:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/p6f;->j:Ll/nnd0;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return v2

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/p6f;->g()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/p6f;->a:Ll/oij0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/oij0;->i:Ll/imc0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/imc0;->b()Ll/nnd0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Ll/p6f;->j:Ll/nnd0;

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return v2

    .line 31
    :cond_1
    iget-object v1, p0, Ll/p6f;->f:Ll/pnd0$a;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/pnd0$a;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_4

    .line 40
    .line 41
    :cond_2
    iget-object p0, p0, Ll/p6f;->g:Ll/pnd0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/pnd0;->b()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    const/4 v2, 0x0

    .line 51
    :cond_4
    :goto_0
    monitor-exit v0

    .line 52
    return v2

    .line 53
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p6f;->c:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/p6f;->i:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final g()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6f;->a:Ll/oij0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/oij0;->i:Ll/imc0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v1, v0, Ll/imc0;->l:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/imc0;->b()Ll/nnd0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/nnd0;->a()Ll/y80;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/y80;->l()Ll/rnl;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/p6f;->b:Ll/y80;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/y80;->l()Ll/rnl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v0, p0}, Ll/zlk0;->D(Ll/rnl;Ll/rnl;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6f;->c:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/p6f;->i:Z

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
