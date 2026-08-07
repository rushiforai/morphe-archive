.class public final Ll/s54;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# instance fields
.field public final a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/s54;->a:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/tmc0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/tmc0;->b()Ll/n6f;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Ll/tmc0;->request()Ll/x1d0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, p1}, Ll/n6f;->r(Ll/x1d0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/x1d0;->g()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-static {v3}, Ll/zml;->b(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/4 v4, 0x0

    .line 27
    const/4 v5, 0x0

    .line 28
    if-eqz v3, :cond_3

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    if-eqz v3, :cond_3

    .line 35
    .line 36
    const-string v3, "Expect"

    .line 37
    .line 38
    invoke-virtual {p1, v3}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v6, "100-continue"

    .line 43
    .line 44
    invoke-virtual {v6, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v6, 0x1

    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/n6f;->g()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ll/n6f;->o()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v6}, Ll/n6f;->m(Z)Ll/i5d0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    move v3, v6

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move v3, v4

    .line 64
    :goto_0
    if-nez v5, :cond_2

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    invoke-virtual {v7}, Ll/z1d0;->isDuplex()Z

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    if-eqz v7, :cond_1

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/n6f;->g()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p1, v6}, Ll/n6f;->d(Ll/x1d0;Z)Lokio/Sink;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    invoke-static {v6}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-virtual {v7, v6}, Ll/z1d0;->writeTo(Lokio/BufferedSink;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_1
    invoke-virtual {v0, p1, v4}, Ll/n6f;->d(Ll/x1d0;Z)Lokio/Sink;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-static {v6}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    invoke-virtual {v7, v6}, Ll/z1d0;->writeTo(Lokio/BufferedSink;)V

    .line 108
    .line 109
    .line 110
    invoke-interface {v6}, Lokio/Sink;->close()V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    invoke-virtual {v0}, Ll/n6f;->k()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Ll/n6f;->c()Ll/imc0;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-virtual {v6}, Ll/imc0;->q()Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-nez v6, :cond_4

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/n6f;->j()V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    invoke-virtual {v0}, Ll/n6f;->k()V

    .line 132
    .line 133
    .line 134
    move v3, v4

    .line 135
    :cond_4
    :goto_1
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    if-eqz v6, :cond_5

    .line 140
    .line 141
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    invoke-virtual {v6}, Ll/z1d0;->isDuplex()Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-nez v6, :cond_6

    .line 150
    .line 151
    :cond_5
    invoke-virtual {v0}, Ll/n6f;->f()V

    .line 152
    .line 153
    .line 154
    :cond_6
    if-nez v3, :cond_7

    .line 155
    .line 156
    invoke-virtual {v0}, Ll/n6f;->o()V

    .line 157
    .line 158
    .line 159
    :cond_7
    if-nez v5, :cond_8

    .line 160
    .line 161
    invoke-virtual {v0, v4}, Ll/n6f;->m(Z)Ll/i5d0$a;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    :cond_8
    invoke-virtual {v5, p1}, Ll/i5d0$a;->q(Ll/x1d0;)Ll/i5d0$a;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v0}, Ll/n6f;->c()Ll/imc0;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-virtual {v5}, Ll/imc0;->c()Ll/txk;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v3, v5}, Ll/i5d0$a;->h(Ll/txk;)Ll/i5d0$a;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-virtual {v3, v1, v2}, Ll/i5d0$a;->r(J)Ll/i5d0$a;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 186
    .line 187
    .line 188
    move-result-wide v5

    .line 189
    invoke-virtual {v3, v5, v6}, Ll/i5d0$a;->p(J)Ll/i5d0$a;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {v3}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3}, Ll/i5d0;->q()I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    const/16 v6, 0x64

    .line 202
    .line 203
    if-ne v5, v6, :cond_9

    .line 204
    .line 205
    invoke-virtual {v0, v4}, Ll/n6f;->m(Z)Ll/i5d0$a;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-virtual {v3, p1}, Ll/i5d0$a;->q(Ll/x1d0;)Ll/i5d0$a;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {v0}, Ll/n6f;->c()Ll/imc0;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {v3}, Ll/imc0;->c()Ll/txk;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {p1, v3}, Ll/i5d0$a;->h(Ll/txk;)Ll/i5d0$a;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p1, v1, v2}, Ll/i5d0$a;->r(J)Ll/i5d0$a;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 230
    .line 231
    .line 232
    move-result-wide v1

    .line 233
    invoke-virtual {p1, v1, v2}, Ll/i5d0$a;->p(J)Ll/i5d0$a;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-virtual {p1}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    invoke-virtual {v3}, Ll/i5d0;->q()I

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    :cond_9
    invoke-virtual {v0, v3}, Ll/n6f;->n(Ll/i5d0;)V

    .line 246
    .line 247
    .line 248
    iget-boolean p0, p0, Ll/s54;->a:Z

    .line 249
    .line 250
    if-eqz p0, :cond_a

    .line 251
    .line 252
    const/16 p0, 0x65

    .line 253
    .line 254
    if-ne v5, p0, :cond_a

    .line 255
    .line 256
    invoke-virtual {v3}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    sget-object p1, Ll/zlk0;->d:Ll/k5d0;

    .line 261
    .line 262
    invoke-virtual {p0, p1}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    invoke-virtual {p0}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    goto :goto_2

    .line 271
    :cond_a
    invoke-virtual {v3}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-virtual {v0, v3}, Ll/n6f;->l(Ll/i5d0;)Ll/k5d0;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p0, p1}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {p0}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    :goto_2
    invoke-virtual {p0}, Ll/i5d0;->Z()Ll/x1d0;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    const-string v1, "Connection"

    .line 292
    .line 293
    invoke-virtual {p1, v1}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    const-string v2, "close"

    .line 298
    .line 299
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-nez p1, :cond_b

    .line 304
    .line 305
    invoke-virtual {p0, v1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-eqz p1, :cond_c

    .line 314
    .line 315
    :cond_b
    invoke-virtual {v0}, Ll/n6f;->j()V

    .line 316
    .line 317
    .line 318
    :cond_c
    const/16 p1, 0xcc

    .line 319
    .line 320
    if-eq v5, p1, :cond_d

    .line 321
    .line 322
    const/16 p1, 0xcd

    .line 323
    .line 324
    if-ne v5, p1, :cond_e

    .line 325
    .line 326
    :cond_d
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-virtual {p1}, Ll/k5d0;->contentLength()J

    .line 331
    .line 332
    .line 333
    move-result-wide v0

    .line 334
    const-wide/16 v2, 0x0

    .line 335
    .line 336
    cmp-long p1, v0, v2

    .line 337
    .line 338
    if-gtz p1, :cond_f

    .line 339
    .line 340
    :cond_e
    return-object p0

    .line 341
    :cond_f
    new-instance p1, Ljava/net/ProtocolException;

    .line 342
    .line 343
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    invoke-virtual {p0}, Ll/k5d0;->contentLength()J

    .line 348
    .line 349
    .line 350
    move-result-wide v0

    .line 351
    new-instance p0, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    const-string v2, "HTTP "

    .line 354
    .line 355
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    const-string v2, " had non-zero Content-Length: "

    .line 362
    .line 363
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object p0

    .line 373
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    throw p1
.end method
