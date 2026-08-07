.class public final Ll/y5d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# instance fields
.field public final a:Ll/rg50;


# direct methods
.method public constructor <init>(Ll/rg50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y5d0;->a:Ll/rg50;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ll/i5d0;Ll/nnd0;)Ll/x1d0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_16

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/x1d0;->g()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/16 v3, 0x133

    .line 17
    .line 18
    const-string v4, "GET"

    .line 19
    .line 20
    if-eq v1, v3, :cond_c

    .line 21
    .line 22
    const/16 v3, 0x134

    .line 23
    .line 24
    if-eq v1, v3, :cond_c

    .line 25
    .line 26
    const/16 v3, 0x191

    .line 27
    .line 28
    if-eq v1, v3, :cond_b

    .line 29
    .line 30
    const/16 v3, 0x1f7

    .line 31
    .line 32
    if-eq v1, v3, :cond_8

    .line 33
    .line 34
    const/16 v3, 0x197

    .line 35
    .line 36
    if-eq v1, v3, :cond_5

    .line 37
    .line 38
    const/16 p2, 0x198

    .line 39
    .line 40
    if-eq v1, p2, :cond_0

    .line 41
    .line 42
    packed-switch v1, :pswitch_data_0

    .line 43
    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_0
    iget-object v1, p0, Ll/y5d0;->a:Ll/rg50;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/rg50;->E()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_1
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/x1d0;->a()Ll/z1d0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/z1d0;->isOneShot()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_2
    invoke-virtual {p1}, Ll/i5d0;->Q()Ll/i5d0;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/i5d0;->Q()Ll/i5d0;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Ll/i5d0;->q()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-ne v1, p2, :cond_3

    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_3
    const/4 p2, 0x0

    .line 90
    invoke-virtual {p0, p1, p2}, Ll/y5d0;->e(Ll/i5d0;I)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-lez p0, :cond_4

    .line 95
    .line 96
    return-object v0

    .line 97
    :cond_4
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_5
    if-eqz p2, :cond_6

    .line 103
    .line 104
    invoke-virtual {p2}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    goto :goto_0

    .line 109
    :cond_6
    iget-object v1, p0, Ll/y5d0;->a:Ll/rg50;

    .line 110
    .line 111
    invoke-virtual {v1}, Ll/rg50;->A()Ljava/net/Proxy;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    :goto_0
    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 120
    .line 121
    if-ne v1, v2, :cond_7

    .line 122
    .line 123
    iget-object p0, p0, Ll/y5d0;->a:Ll/rg50;

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/rg50;->B()Ll/ce1;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-interface {p0, p2, p1}, Ll/ce1;->b(Ll/nnd0;Ll/i5d0;)Ll/x1d0;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    return-object p0

    .line 134
    :cond_7
    const-string p0, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    .line 135
    .line 136
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-object v0

    .line 140
    :cond_8
    invoke-virtual {p1}, Ll/i5d0;->Q()Ll/i5d0;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    if-eqz p2, :cond_9

    .line 145
    .line 146
    invoke-virtual {p1}, Ll/i5d0;->Q()Ll/i5d0;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p2}, Ll/i5d0;->q()I

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-ne p2, v3, :cond_9

    .line 155
    .line 156
    return-object v0

    .line 157
    :cond_9
    const p2, 0x7fffffff

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1, p2}, Ll/y5d0;->e(Ll/i5d0;I)I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-nez p0, :cond_a

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_a
    return-object v0

    .line 172
    :cond_b
    iget-object p0, p0, Ll/y5d0;->a:Ll/rg50;

    .line 173
    .line 174
    invoke-virtual {p0}, Ll/rg50;->b()Ll/ce1;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-interface {p0, p2, p1}, Ll/ce1;->b(Ll/nnd0;Ll/i5d0;)Ll/x1d0;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    return-object p0

    .line 183
    :cond_c
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-nez p2, :cond_d

    .line 188
    .line 189
    const-string p2, "HEAD"

    .line 190
    .line 191
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-nez p2, :cond_d

    .line 196
    .line 197
    return-object v0

    .line 198
    :cond_d
    :pswitch_0
    iget-object p2, p0, Ll/y5d0;->a:Ll/rg50;

    .line 199
    .line 200
    invoke-virtual {p2}, Ll/rg50;->p()Z

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    if-nez p2, :cond_e

    .line 205
    .line 206
    return-object v0

    .line 207
    :cond_e
    const-string p2, "Location"

    .line 208
    .line 209
    invoke-virtual {p1, p2}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    if-nez p2, :cond_f

    .line 214
    .line 215
    return-object v0

    .line 216
    :cond_f
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v1}, Ll/x1d0;->k()Ll/rnl;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v1, p2}, Ll/rnl;->H(Ljava/lang/String;)Ll/rnl;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    if-nez p2, :cond_10

    .line 229
    .line 230
    return-object v0

    .line 231
    :cond_10
    invoke-virtual {p2}, Ll/rnl;->I()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    invoke-virtual {v3}, Ll/x1d0;->k()Ll/rnl;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {v3}, Ll/rnl;->I()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_11

    .line 252
    .line 253
    iget-object p0, p0, Ll/y5d0;->a:Ll/rg50;

    .line 254
    .line 255
    invoke-virtual {p0}, Ll/rg50;->q()Z

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-nez p0, :cond_11

    .line 260
    .line 261
    return-object v0

    .line 262
    :cond_11
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-static {v2}, Ll/zml;->b(Ljava/lang/String;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_14

    .line 275
    .line 276
    invoke-static {v2}, Ll/zml;->d(Ljava/lang/String;)Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    invoke-static {v2}, Ll/zml;->c(Ljava/lang/String;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-eqz v3, :cond_12

    .line 285
    .line 286
    invoke-virtual {p0, v4, v0}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 287
    .line 288
    .line 289
    goto :goto_1

    .line 290
    :cond_12
    if-eqz v1, :cond_13

    .line 291
    .line 292
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {v0}, Ll/x1d0;->a()Ll/z1d0;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    :cond_13
    invoke-virtual {p0, v2, v0}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 301
    .line 302
    .line 303
    :goto_1
    if-nez v1, :cond_14

    .line 304
    .line 305
    const-string v0, "Transfer-Encoding"

    .line 306
    .line 307
    invoke-virtual {p0, v0}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 308
    .line 309
    .line 310
    const-string v0, "Content-Length"

    .line 311
    .line 312
    invoke-virtual {p0, v0}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 313
    .line 314
    .line 315
    const-string v0, "Content-Type"

    .line 316
    .line 317
    invoke-virtual {p0, v0}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 318
    .line 319
    .line 320
    :cond_14
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-static {p1, p2}, Ll/zlk0;->D(Ll/rnl;Ll/rnl;)Z

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    if-nez p1, :cond_15

    .line 333
    .line 334
    const-string p1, "Authorization"

    .line 335
    .line 336
    invoke-virtual {p0, p1}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 337
    .line 338
    .line 339
    :cond_15
    invoke-virtual {p0, p2}, Ll/x1d0$a;->s(Ll/rnl;)Ll/x1d0$a;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    return-object p0

    .line 348
    :cond_16
    invoke-static {}, Ll/wpg0;->a()V

    .line 349
    .line 350
    .line 351
    return-object v0

    .line 352
    nop

    .line 353
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final b(Ljava/io/IOException;Z)Z
    .locals 2

    .line 1
    instance-of p0, p1, Ljava/net/ProtocolException;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    instance-of p0, p1, Ljava/io/InterruptedIOException;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    instance-of p0, p1, Ljava/net/SocketTimeoutException;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    return v1

    .line 19
    :cond_1
    return v0

    .line 20
    :cond_2
    instance-of p0, p1, Ljavax/net/ssl/SSLHandshakeException;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    instance-of p0, p0, Ljava/security/cert/CertificateException;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    return v0

    .line 33
    :cond_3
    instance-of p0, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    return v0

    .line 38
    :cond_4
    return v1
.end method

.method public final c(Ljava/io/IOException;Ll/oij0;ZLl/x1d0;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y5d0;->a:Ll/rg50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rg50;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    if-eqz p3, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1, p4}, Ll/y5d0;->d(Ljava/io/IOException;Ll/x1d0;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-eqz p4, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    invoke-virtual {p0, p1, p3}, Ll/y5d0;->b(Ljava/io/IOException;Z)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_2

    .line 25
    .line 26
    return v1

    .line 27
    :cond_2
    invoke-virtual {p2}, Ll/oij0;->c()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_3

    .line 32
    .line 33
    return v1

    .line 34
    :cond_3
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final d(Ljava/io/IOException;Ll/x1d0;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/x1d0;->a()Ll/z1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/z1d0;->isOneShot()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    :cond_0
    instance-of p0, p1, Ljava/io/FileNotFoundException;

    .line 14
    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    :cond_1
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_2
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final e(Ll/i5d0;I)I
    .locals 0

    .line 1
    const-string p0, "Retry-After"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return p2

    .line 10
    :cond_0
    const-string p1, "\\d+"

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    const p0, 0x7fffffff

    .line 28
    .line 29
    .line 30
    return p0
.end method

.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 8
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
    check-cast p1, Ll/tmc0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/tmc0;->d()Ll/oij0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    move v5, v2

    .line 14
    move-object v4, v3

    .line 15
    :goto_0
    invoke-virtual {v1, v0}, Ll/oij0;->m(Ll/x1d0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ll/oij0;->i()Z

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    if-nez v6, :cond_9

    .line 23
    .line 24
    :try_start_0
    invoke-virtual {p1, v0, v1, v3}, Ll/tmc0;->c(Ll/x1d0;Ll/oij0;Ll/n6f;)Ll/i5d0;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_0
    .catch Lokhttp3/internal/connection/RouteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v4}, Ll/i5d0;->N()Ll/i5d0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v4, v3}, Ll/i5d0$a;->b(Ll/k5d0;)Ll/i5d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v0, v4}, Ll/i5d0$a;->n(Ll/i5d0;)Ll/i5d0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/i5d0$a;->c()Ll/i5d0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_0
    move-object v4, v0

    .line 55
    sget-object v0, Ll/kzm;->a:Ll/kzm;

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Ll/kzm;->f(Ll/i5d0;)Ll/n6f;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/n6f;->c()Ll/imc0;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    invoke-virtual {v6}, Ll/imc0;->b()Ll/nnd0;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move-object v6, v3

    .line 73
    :goto_1
    invoke-virtual {p0, v4, v6}, Ll/y5d0;->a(Ll/i5d0;Ll/nnd0;)Ll/x1d0;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    if-nez v6, :cond_2

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/n6f;->h()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/oij0;->o()V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_2
    invoke-virtual {v6}, Ll/x1d0;->a()Ll/z1d0;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    if-eqz v7, :cond_4

    .line 96
    .line 97
    invoke-virtual {v7}, Ll/z1d0;->isOneShot()Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_4

    .line 102
    .line 103
    :cond_3
    :goto_2
    return-object v4

    .line 104
    :cond_4
    invoke-virtual {v4}, Ll/i5d0;->k()Ll/k5d0;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-static {v7}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ll/oij0;->h()Z

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    if-eqz v7, :cond_5

    .line 116
    .line 117
    invoke-virtual {v0}, Ll/n6f;->e()V

    .line 118
    .line 119
    .line 120
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 121
    .line 122
    const/16 v0, 0x14

    .line 123
    .line 124
    if-gt v5, v0, :cond_6

    .line 125
    .line 126
    move-object v0, v6

    .line 127
    goto :goto_0

    .line 128
    :cond_6
    const-string p0, "Too many follow-up requests: "

    .line 129
    .line 130
    invoke-static {p0, v5}, Ll/f7b0;->a(Ljava/lang/String;I)V

    .line 131
    .line 132
    .line 133
    return-object v3

    .line 134
    :catchall_0
    move-exception p0

    .line 135
    goto :goto_4

    .line 136
    :catch_0
    move-exception v6

    .line 137
    :try_start_1
    instance-of v7, v6, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 138
    .line 139
    xor-int/lit8 v7, v7, 0x1

    .line 140
    .line 141
    invoke-virtual {p0, v6, v1, v7, v0}, Ll/y5d0;->c(Ljava/io/IOException;Ll/oij0;ZLl/x1d0;)Z

    .line 142
    .line 143
    .line 144
    move-result v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 145
    if-eqz v7, :cond_7

    .line 146
    .line 147
    :goto_3
    invoke-virtual {v1}, Ll/oij0;->f()V

    .line 148
    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_7
    :try_start_2
    throw v6

    .line 153
    :catch_1
    move-exception v6

    .line 154
    invoke-virtual {v6}, Lokhttp3/internal/connection/RouteException;->getLastConnectException()Ljava/io/IOException;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    invoke-virtual {p0, v7, v1, v2, v0}, Ll/y5d0;->c(Ljava/io/IOException;Ll/oij0;ZLl/x1d0;)Z

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    if-eqz v7, :cond_8

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_8
    invoke-virtual {v6}, Lokhttp3/internal/connection/RouteException;->getFirstConnectException()Ljava/io/IOException;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 170
    :goto_4
    invoke-virtual {v1}, Ll/oij0;->f()V

    .line 171
    .line 172
    .line 173
    throw p0

    .line 174
    :cond_9
    const-string p0, "Canceled"

    .line 175
    .line 176
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    return-object v3
.end method
