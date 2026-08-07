.class Ll/e1r0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z1r0;
.implements Ll/d2r0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e1r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field private b:Z

.field final synthetic c:Ll/e1r0;


# direct methods
.method public constructor <init>(Ll/e1r0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e1r0$b;->c:Ll/e1r0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p2, p0, Ll/e1r0$b;->b:Z

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    const-string p1, " RCV "

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p1, " Sent "

    .line 14
    .line 15
    :goto_0
    iput-object p1, p0, Ll/e1r0$b;->a:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Ll/g2r0;)V
    .locals 3

    .line 359
    sget-boolean v0, Ll/e1r0;->g:Z

    .line 360
    iget-object v1, p0, Ll/e1r0$b;->c:Ll/e1r0;

    .line 361
    const-string v2, "[Slim] "

    if-eqz v0, :cond_0

    .line 362
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 363
    invoke-static {v1}, Ll/e1r0;->a(Ll/e1r0;)Ljava/text/SimpleDateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll/e1r0$b;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " PKT "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ll/g2r0;->d()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 364
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V

    return-void

    .line 365
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 366
    invoke-static {v1}, Ll/e1r0;->a(Ll/e1r0;)Ljava/text/SimpleDateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll/e1r0$b;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " PKT ["

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ll/g2r0;->m()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ","

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    invoke-virtual {p1}, Ll/g2r0;->l()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 368
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ll/w0r0;)V
    .locals 5

    .line 1
    sget-boolean v0, Ll/e1r0;->g:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/e1r0$b;->c:Ll/e1r0;

    .line 4
    .line 5
    const-string v2, "[Slim] "

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/e1r0;->a(Ll/e1r0;)Ljava/text/SimpleDateFormat;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ljava/util/Date;

    .line 19
    .line 20
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/e1r0$b;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ll/w0r0;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/e1r0;->a(Ll/e1r0;)Ljava/text/SimpleDateFormat;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ljava/util/Date;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/e1r0$b;->a:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v1, " Blob ["

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v1, ","

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-static {v1}, Lcom/xiaomi/push/service/aj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v1, "]"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    if-eqz p1, :cond_5

    .line 127
    .line 128
    invoke-virtual {p1}, Ll/w0r0;->a()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    const v1, 0x1869f

    .line 133
    .line 134
    .line 135
    if-ne v0, v1, :cond_5

    .line 136
    .line 137
    invoke-virtual {p1}, Ll/w0r0;->c()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-boolean v2, p0, Ll/e1r0$b;->b:Z

    .line 142
    .line 143
    const/4 v3, 0x0

    .line 144
    if-nez v2, :cond_3

    .line 145
    .line 146
    const-string v2, "BIND"

    .line 147
    .line 148
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-eqz v4, :cond_1

    .line 153
    .line 154
    const-string v0, "build binded result for loopback."

    .line 155
    .line 156
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    new-instance v0, Ll/izq0;

    .line 160
    .line 161
    invoke-direct {v0}, Ll/izq0;-><init>()V

    .line 162
    .line 163
    .line 164
    const/4 v4, 0x1

    .line 165
    invoke-virtual {v0, v4}, Ll/izq0;->m(Z)Ll/izq0;

    .line 166
    .line 167
    .line 168
    const-string v4, "login success."

    .line 169
    .line 170
    invoke-virtual {v0, v4}, Ll/izq0;->t(Ljava/lang/String;)Ll/izq0;

    .line 171
    .line 172
    .line 173
    const-string v4, "success"

    .line 174
    .line 175
    invoke-virtual {v0, v4}, Ll/izq0;->q(Ljava/lang/String;)Ll/izq0;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v4}, Ll/izq0;->k(Ljava/lang/String;)Ll/izq0;

    .line 179
    .line 180
    .line 181
    new-instance v4, Ll/w0r0;

    .line 182
    .line 183
    invoke-direct {v4}, Ll/w0r0;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Ll/e0r0;->h()[B

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v4, v0, v3}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 191
    .line 192
    .line 193
    const/4 v0, 0x2

    .line 194
    invoke-virtual {v4, v0}, Ll/w0r0;->m(S)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v4, v1}, Ll/w0r0;->h(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v4, v2, v3}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v4, v0}, Ll/w0r0;->k(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v4, v3}, Ll/w0r0;->v(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    invoke-virtual {v4, p1}, Ll/w0r0;->B(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    move-object v3, v4

    .line 221
    goto :goto_1

    .line 222
    :cond_1
    const-string v2, "UBND"

    .line 223
    .line 224
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-eqz v2, :cond_2

    .line 229
    .line 230
    goto :goto_1

    .line 231
    :cond_2
    const-string v2, "SECMSG"

    .line 232
    .line 233
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_3

    .line 238
    .line 239
    new-instance v0, Ll/w0r0;

    .line 240
    .line 241
    invoke-direct {v0}, Ll/w0r0;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0, v1}, Ll/w0r0;->h(I)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0, v2, v3}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {v0, v2}, Ll/w0r0;->B(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    invoke-virtual {v0, v2}, Ll/w0r0;->k(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1}, Ll/w0r0;->g()S

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    invoke-virtual {v0, v2}, Ll/w0r0;->m(S)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1}, Ll/w0r0;->E()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    invoke-virtual {v0, v2}, Ll/w0r0;->v(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-virtual {p1}, Ll/w0r0;->F()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    invoke-virtual {v2, v1, v4}, Lcom/xiaomi/push/service/am;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/service/am$b;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    iget-object v1, v1, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {p1, v1}, Ll/w0r0;->q(Ljava/lang/String;)[B

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-virtual {v0, p1, v3}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 301
    .line 302
    .line 303
    move-object v3, v0

    .line 304
    :cond_3
    :goto_1
    if-eqz v3, :cond_5

    .line 305
    .line 306
    iget-object p1, p0, Ll/e1r0$b;->c:Ll/e1r0;

    .line 307
    .line 308
    invoke-static {p1}, Ll/e1r0;->c(Ll/e1r0;)Ll/u1r0;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    invoke-virtual {p1}, Ll/u1r0;->e()Ljava/util/Map;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    :cond_4
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    if-eqz v0, :cond_5

    .line 329
    .line 330
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    check-cast v0, Ljava/util/Map$Entry;

    .line 335
    .line 336
    iget-object v1, p0, Ll/e1r0$b;->c:Ll/e1r0;

    .line 337
    .line 338
    invoke-static {v1}, Ll/e1r0;->b(Ll/e1r0;)Ll/e1r0$b;

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    if-eq v1, v2, :cond_4

    .line 347
    .line 348
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    check-cast v0, Ll/u1r0$a;

    .line 353
    .line 354
    invoke-virtual {v0, v3}, Ll/u1r0$a;->a(Ll/w0r0;)V

    .line 355
    .line 356
    .line 357
    goto :goto_2

    .line 358
    :cond_5
    return-void
.end method

.method public a(Ll/g2r0;)Z
    .locals 0

    .line 369
    const/4 p0, 0x1

    return p0
.end method
