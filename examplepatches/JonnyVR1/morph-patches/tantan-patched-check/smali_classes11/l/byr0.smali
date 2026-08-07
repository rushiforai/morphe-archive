.class public abstract Ll/byr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cyr0;


# static fields
.field public static final b:Ljava/util/logging/Logger;


# instance fields
.field public final a:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Ll/byr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/byr0;->b:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ayr0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ayr0;-><init>(Ll/byr0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/cpx0;Ll/gyr0;)Ll/fyr0;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/16 v3, 0x8

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object v2, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    invoke-interface {p1, v2}, Ll/cpx0;->f0(Ljava/nio/ByteBuffer;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v4, 0x0

    .line 35
    if-eq v2, v3, :cond_1

    .line 36
    .line 37
    if-ltz v2, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {p1, v0, v1}, Ll/cpx0;->l(J)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/vg3;->a()V

    .line 44
    .line 45
    .line 46
    return-object v4

    .line 47
    :cond_1
    iget-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    invoke-static {v0}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 67
    .line 68
    .line 69
    move-result-wide v0

    .line 70
    const-wide/16 v5, 0x8

    .line 71
    .line 72
    cmp-long v2, v0, v5

    .line 73
    .line 74
    const-wide/16 v5, 0x1

    .line 75
    .line 76
    if-gez v2, :cond_3

    .line 77
    .line 78
    cmp-long v2, v0, v5

    .line 79
    .line 80
    if-gtz v2, :cond_2

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    sget-object p0, Ll/byr0;->b:Ljava/util/logging/Logger;

    .line 84
    .line 85
    sget-object p1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    .line 86
    .line 87
    new-instance p2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const/16 v2, 0x50

    .line 90
    .line 91
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 92
    .line 93
    .line 94
    const-string v2, "Plausibility check failed: size < 8 (size = "

    .line 95
    .line 96
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v0, "). Stop parsing!"

    .line 103
    .line 104
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    const-string v0, "com.coremedia.iso.AbstractBoxParser"

    .line 112
    .line 113
    const-string v1, "parseBox"

    .line 114
    .line 115
    invoke-virtual {p0, p1, v0, v1, p2}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-object v4

    .line 119
    :cond_3
    :goto_1
    iget-object v2, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 120
    .line 121
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 126
    .line 127
    const/4 v7, 0x4

    .line 128
    new-array v7, v7, [B

    .line 129
    .line 130
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    .line 133
    :try_start_0
    new-instance v2, Ljava/lang/String;

    .line 134
    .line 135
    const-string v8, "ISO-8859-1"

    .line 136
    .line 137
    invoke-direct {v2, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    .line 139
    .line 140
    cmp-long v5, v0, v5

    .line 141
    .line 142
    const-wide/16 v6, -0x10

    .line 143
    .line 144
    const/16 v8, 0x10

    .line 145
    .line 146
    if-nez v5, :cond_4

    .line 147
    .line 148
    iget-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 155
    .line 156
    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    invoke-interface {p1, v0}, Ll/cpx0;->f0(Ljava/nio/ByteBuffer;)I

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 177
    .line 178
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 182
    .line 183
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 188
    .line 189
    invoke-static {v0}, Ll/eyr0;->f(Ljava/nio/ByteBuffer;)J

    .line 190
    .line 191
    .line 192
    move-result-wide v0

    .line 193
    add-long/2addr v0, v6

    .line 194
    goto :goto_2

    .line 195
    :cond_4
    const-wide/16 v9, 0x0

    .line 196
    .line 197
    cmp-long v3, v0, v9

    .line 198
    .line 199
    if-nez v3, :cond_5

    .line 200
    .line 201
    invoke-interface {p1}, Ll/cpx0;->zzc()J

    .line 202
    .line 203
    .line 204
    move-result-wide v0

    .line 205
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 206
    .line 207
    .line 208
    move-result-wide v9

    .line 209
    sub-long/2addr v0, v9

    .line 210
    goto :goto_2

    .line 211
    :cond_5
    const-wide/16 v9, -0x8

    .line 212
    .line 213
    add-long/2addr v0, v9

    .line 214
    :goto_2
    const-string v3, "uuid"

    .line 215
    .line 216
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    if-eqz v3, :cond_7

    .line 221
    .line 222
    iget-object v3, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 223
    .line 224
    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    check-cast v3, Ljava/nio/ByteBuffer;

    .line 229
    .line 230
    iget-object v4, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 231
    .line 232
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    check-cast v4, Ljava/nio/ByteBuffer;

    .line 237
    .line 238
    invoke-virtual {v4}, Ljava/nio/Buffer;->limit()I

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    add-int/2addr v4, v8

    .line 243
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 244
    .line 245
    .line 246
    iget-object v3, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 247
    .line 248
    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    check-cast v3, Ljava/nio/ByteBuffer;

    .line 253
    .line 254
    invoke-interface {p1, v3}, Ll/cpx0;->f0(Ljava/nio/ByteBuffer;)I

    .line 255
    .line 256
    .line 257
    new-array v4, v8, [B

    .line 258
    .line 259
    iget-object v3, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 260
    .line 261
    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    check-cast v3, Ljava/nio/ByteBuffer;

    .line 266
    .line 267
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    add-int/lit8 v3, v3, -0x10

    .line 272
    .line 273
    :goto_3
    iget-object v5, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 274
    .line 275
    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v5

    .line 279
    check-cast v5, Ljava/nio/ByteBuffer;

    .line 280
    .line 281
    invoke-virtual {v5}, Ljava/nio/Buffer;->position()I

    .line 282
    .line 283
    .line 284
    move-result v5

    .line 285
    if-ge v3, v5, :cond_6

    .line 286
    .line 287
    iget-object v5, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 288
    .line 289
    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v5

    .line 293
    check-cast v5, Ljava/nio/ByteBuffer;

    .line 294
    .line 295
    invoke-virtual {v5}, Ljava/nio/Buffer;->position()I

    .line 296
    .line 297
    .line 298
    move-result v5

    .line 299
    add-int/lit8 v5, v5, -0x10

    .line 300
    .line 301
    iget-object v8, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 302
    .line 303
    invoke-virtual {v8}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v8

    .line 307
    check-cast v8, Ljava/nio/ByteBuffer;

    .line 308
    .line 309
    invoke-virtual {v8, v3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 310
    .line 311
    .line 312
    move-result v8

    .line 313
    sub-int v5, v3, v5

    .line 314
    .line 315
    aput-byte v8, v4, v5

    .line 316
    .line 317
    add-int/lit8 v3, v3, 0x1

    .line 318
    .line 319
    goto :goto_3

    .line 320
    :cond_6
    add-long/2addr v0, v6

    .line 321
    :cond_7
    move-wide v8, v0

    .line 322
    instance-of v0, p2, Ll/fyr0;

    .line 323
    .line 324
    if-eqz v0, :cond_8

    .line 325
    .line 326
    move-object v0, p2

    .line 327
    check-cast v0, Ll/fyr0;

    .line 328
    .line 329
    invoke-interface {v0}, Ll/fyr0;->zza()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    goto :goto_4

    .line 334
    :cond_8
    const-string v0, ""

    .line 335
    .line 336
    :goto_4
    invoke-virtual {p0, v2, v4, v0}, Ll/byr0;->b(Ljava/lang/String;[BLjava/lang/String;)Ll/fyr0;

    .line 337
    .line 338
    .line 339
    move-result-object v5

    .line 340
    invoke-interface {v5, p2}, Ll/fyr0;->d(Ll/gyr0;)V

    .line 341
    .line 342
    .line 343
    iget-object p2, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 344
    .line 345
    invoke-virtual {p2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object p2

    .line 349
    check-cast p2, Ljava/nio/ByteBuffer;

    .line 350
    .line 351
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 352
    .line 353
    .line 354
    iget-object p2, p0, Ll/byr0;->a:Ljava/lang/ThreadLocal;

    .line 355
    .line 356
    invoke-virtual {p2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object p2

    .line 360
    move-object v7, p2

    .line 361
    check-cast v7, Ljava/nio/ByteBuffer;

    .line 362
    .line 363
    move-object v10, p0

    .line 364
    move-object v6, p1

    .line 365
    invoke-interface/range {v5 .. v10}, Ll/fyr0;->b(Ll/cpx0;Ljava/nio/ByteBuffer;JLl/cyr0;)V

    .line 366
    .line 367
    .line 368
    return-object v5

    .line 369
    :catch_0
    move-exception v0

    .line 370
    move-object p0, v0

    .line 371
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 372
    .line 373
    .line 374
    return-object v4
.end method

.method public abstract b(Ljava/lang/String;[BLjava/lang/String;)Ll/fyr0;
.end method
