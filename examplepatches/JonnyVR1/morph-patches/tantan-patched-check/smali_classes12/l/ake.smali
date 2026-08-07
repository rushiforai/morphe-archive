.class public Ll/ake;
.super Ll/cj2;
.source "SourceFile"


# annotations
.annotation runtime Ll/svd;
    tags = {
        0x3
    }
.end annotation


# static fields
.field private static q:Ljava/util/logging/Logger;


# instance fields
.field d:I

.field e:I

.field f:I

.field g:I

.field h:I

.field i:I

.field j:Ljava/lang/String;

.field k:I

.field l:I

.field m:I

.field n:Ll/iid;

.field o:Ll/ctd0;

.field p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cj2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Ll/ake;

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
    sput-object v0, Ll/ake;->q:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/cj2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ake;->i:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ake;->p:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public e(Ljava/nio/ByteBuffer;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/ake;->d:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    ushr-int/lit8 v1, v0, 0x7

    .line 12
    .line 13
    iput v1, p0, Ll/ake;->e:I

    .line 14
    .line 15
    ushr-int/lit8 v2, v0, 0x6

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    and-int/2addr v2, v3

    .line 19
    iput v2, p0, Ll/ake;->f:I

    .line 20
    .line 21
    ushr-int/lit8 v2, v0, 0x5

    .line 22
    .line 23
    and-int/2addr v2, v3

    .line 24
    iput v2, p0, Ll/ake;->g:I

    .line 25
    .line 26
    and-int/lit8 v0, v0, 0x1f

    .line 27
    .line 28
    iput v0, p0, Ll/ake;->h:I

    .line 29
    .line 30
    if-ne v1, v3, :cond_0

    .line 31
    .line 32
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Ll/ake;->l:I

    .line 37
    .line 38
    :cond_0
    iget v0, p0, Ll/ake;->f:I

    .line 39
    .line 40
    if-ne v0, v3, :cond_1

    .line 41
    .line 42
    invoke-static {p1}, Ll/y0q;->n(Ljava/nio/ByteBuffer;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Ll/ake;->i:I

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/y0q;->h(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/ake;->j:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget v0, p0, Ll/ake;->g:I

    .line 55
    .line 56
    if-ne v0, v3, :cond_2

    .line 57
    .line 58
    invoke-static {p1}, Ll/y0q;->i(Ljava/nio/ByteBuffer;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/ake;->m:I

    .line 63
    .line 64
    :cond_2
    invoke-virtual {p0}, Ll/cj2;->b()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/lit8 v0, v0, 0x4

    .line 69
    .line 70
    iget v1, p0, Ll/ake;->e:I

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    const/4 v4, 0x2

    .line 74
    if-ne v1, v3, :cond_3

    .line 75
    .line 76
    move v1, v4

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    move v1, v2

    .line 79
    :goto_0
    add-int/2addr v0, v1

    .line 80
    iget v1, p0, Ll/ake;->f:I

    .line 81
    .line 82
    if-ne v1, v3, :cond_4

    .line 83
    .line 84
    iget v1, p0, Ll/ake;->i:I

    .line 85
    .line 86
    add-int/2addr v1, v3

    .line 87
    goto :goto_1

    .line 88
    :cond_4
    move v1, v2

    .line 89
    :goto_1
    add-int/2addr v0, v1

    .line 90
    iget v1, p0, Ll/ake;->g:I

    .line 91
    .line 92
    if-ne v1, v3, :cond_5

    .line 93
    .line 94
    move v2, v4

    .line 95
    :cond_5
    add-int/2addr v0, v2

    .line 96
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p0}, Ll/cj2;->a()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    add-int/lit8 v3, v0, 0x2

    .line 105
    .line 106
    const/4 v5, 0x0

    .line 107
    const-string v6, ", size: "

    .line 108
    .line 109
    const/4 v7, -0x1

    .line 110
    if-le v2, v3, :cond_8

    .line 111
    .line 112
    invoke-static {v7, p1}, Ll/b950;->a(ILjava/nio/ByteBuffer;)Ll/cj2;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    sub-int/2addr v3, v1

    .line 121
    int-to-long v8, v3

    .line 122
    sget-object v3, Ll/ake;->q:Ljava/util/logging/Logger;

    .line 123
    .line 124
    new-instance v10, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v11, " - ESDescriptor1 read: "

    .line 133
    .line 134
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v10, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    if-eqz v2, :cond_6

    .line 144
    .line 145
    invoke-virtual {v2}, Ll/cj2;->a()I

    .line 146
    .line 147
    .line 148
    move-result v11

    .line 149
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object v11

    .line 153
    goto :goto_2

    .line 154
    :cond_6
    move-object v11, v5

    .line 155
    :goto_2
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v10

    .line 162
    invoke-virtual {v3, v10}, Ljava/util/logging/Logger;->finer(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    if-eqz v2, :cond_7

    .line 166
    .line 167
    invoke-virtual {v2}, Ll/cj2;->a()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    add-int/2addr v1, v3

    .line 172
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    .line 174
    .line 175
    add-int/2addr v0, v3

    .line 176
    goto :goto_3

    .line 177
    :cond_7
    int-to-long v0, v0

    .line 178
    add-long/2addr v0, v8

    .line 179
    long-to-int v0, v0

    .line 180
    :goto_3
    instance-of v1, v2, Ll/iid;

    .line 181
    .line 182
    if-eqz v1, :cond_8

    .line 183
    .line 184
    check-cast v2, Ll/iid;

    .line 185
    .line 186
    iput-object v2, p0, Ll/ake;->n:Ll/iid;

    .line 187
    .line 188
    :cond_8
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-virtual {p0}, Ll/cj2;->a()I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    add-int/lit8 v3, v0, 0x2

    .line 197
    .line 198
    if-le v2, v3, :cond_b

    .line 199
    .line 200
    invoke-static {v7, p1}, Ll/b950;->a(ILjava/nio/ByteBuffer;)Ll/cj2;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    sub-int/2addr v3, v1

    .line 209
    int-to-long v8, v3

    .line 210
    sget-object v3, Ll/ake;->q:Ljava/util/logging/Logger;

    .line 211
    .line 212
    new-instance v10, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string v11, " - ESDescriptor2 read: "

    .line 221
    .line 222
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v10, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    if-eqz v2, :cond_9

    .line 232
    .line 233
    invoke-virtual {v2}, Ll/cj2;->a()I

    .line 234
    .line 235
    .line 236
    move-result v11

    .line 237
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 238
    .line 239
    .line 240
    move-result-object v11

    .line 241
    goto :goto_4

    .line 242
    :cond_9
    move-object v11, v5

    .line 243
    :goto_4
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v10

    .line 250
    invoke-virtual {v3, v10}, Ljava/util/logging/Logger;->finer(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    if-eqz v2, :cond_a

    .line 254
    .line 255
    invoke-virtual {v2}, Ll/cj2;->a()I

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    add-int/2addr v1, v3

    .line 260
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 261
    .line 262
    .line 263
    add-int/2addr v0, v3

    .line 264
    goto :goto_5

    .line 265
    :cond_a
    int-to-long v0, v0

    .line 266
    add-long/2addr v0, v8

    .line 267
    long-to-int v0, v0

    .line 268
    :goto_5
    instance-of v1, v2, Ll/ctd0;

    .line 269
    .line 270
    if-eqz v1, :cond_c

    .line 271
    .line 272
    check-cast v2, Ll/ctd0;

    .line 273
    .line 274
    iput-object v2, p0, Ll/ake;->o:Ll/ctd0;

    .line 275
    .line 276
    goto :goto_6

    .line 277
    :cond_b
    sget-object v1, Ll/ake;->q:Ljava/util/logging/Logger;

    .line 278
    .line 279
    const-string v2, "SLConfigDescriptor is missing!"

    .line 280
    .line 281
    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    :cond_c
    :goto_6
    invoke-virtual {p0}, Ll/cj2;->a()I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    sub-int/2addr v1, v0

    .line 289
    if-gt v1, v4, :cond_d

    .line 290
    .line 291
    return-void

    .line 292
    :cond_d
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    invoke-static {v7, p1}, Ll/b950;->a(ILjava/nio/ByteBuffer;)Ll/cj2;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    sub-int/2addr v3, v1

    .line 305
    int-to-long v8, v3

    .line 306
    sget-object v3, Ll/ake;->q:Ljava/util/logging/Logger;

    .line 307
    .line 308
    new-instance v10, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string v11, " - ESDescriptor3 read: "

    .line 317
    .line 318
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v10, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    if-eqz v2, :cond_e

    .line 328
    .line 329
    invoke-virtual {v2}, Ll/cj2;->a()I

    .line 330
    .line 331
    .line 332
    move-result v11

    .line 333
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 334
    .line 335
    .line 336
    move-result-object v11

    .line 337
    goto :goto_7

    .line 338
    :cond_e
    move-object v11, v5

    .line 339
    :goto_7
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v10

    .line 346
    invoke-virtual {v3, v10}, Ljava/util/logging/Logger;->finer(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    if-eqz v2, :cond_f

    .line 350
    .line 351
    invoke-virtual {v2}, Ll/cj2;->a()I

    .line 352
    .line 353
    .line 354
    move-result v3

    .line 355
    add-int/2addr v1, v3

    .line 356
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 357
    .line 358
    .line 359
    add-int/2addr v0, v3

    .line 360
    goto :goto_8

    .line 361
    :cond_f
    int-to-long v0, v0

    .line 362
    add-long/2addr v0, v8

    .line 363
    long-to-int v0, v0

    .line 364
    :goto_8
    iget-object v1, p0, Ll/ake;->p:Ljava/util/List;

    .line 365
    .line 366
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    goto :goto_6
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_13

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto/16 :goto_4

    .line 19
    .line 20
    :cond_1
    check-cast p1, Ll/ake;

    .line 21
    .line 22
    iget v2, p0, Ll/ake;->f:I

    .line 23
    .line 24
    iget v3, p1, Ll/ake;->f:I

    .line 25
    .line 26
    if-eq v2, v3, :cond_2

    .line 27
    .line 28
    return v1

    .line 29
    :cond_2
    iget v2, p0, Ll/ake;->i:I

    .line 30
    .line 31
    iget v3, p1, Ll/ake;->i:I

    .line 32
    .line 33
    if-eq v2, v3, :cond_3

    .line 34
    .line 35
    return v1

    .line 36
    :cond_3
    iget v2, p0, Ll/ake;->l:I

    .line 37
    .line 38
    iget v3, p1, Ll/ake;->l:I

    .line 39
    .line 40
    if-eq v2, v3, :cond_4

    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    iget v2, p0, Ll/ake;->d:I

    .line 44
    .line 45
    iget v3, p1, Ll/ake;->d:I

    .line 46
    .line 47
    if-eq v2, v3, :cond_5

    .line 48
    .line 49
    return v1

    .line 50
    :cond_5
    iget v2, p0, Ll/ake;->m:I

    .line 51
    .line 52
    iget v3, p1, Ll/ake;->m:I

    .line 53
    .line 54
    if-eq v2, v3, :cond_6

    .line 55
    .line 56
    return v1

    .line 57
    :cond_6
    iget v2, p0, Ll/ake;->g:I

    .line 58
    .line 59
    iget v3, p1, Ll/ake;->g:I

    .line 60
    .line 61
    if-eq v2, v3, :cond_7

    .line 62
    .line 63
    return v1

    .line 64
    :cond_7
    iget v2, p0, Ll/ake;->k:I

    .line 65
    .line 66
    iget v3, p1, Ll/ake;->k:I

    .line 67
    .line 68
    if-eq v2, v3, :cond_8

    .line 69
    .line 70
    return v1

    .line 71
    :cond_8
    iget v2, p0, Ll/ake;->e:I

    .line 72
    .line 73
    iget v3, p1, Ll/ake;->e:I

    .line 74
    .line 75
    if-eq v2, v3, :cond_9

    .line 76
    .line 77
    return v1

    .line 78
    :cond_9
    iget v2, p0, Ll/ake;->h:I

    .line 79
    .line 80
    iget v3, p1, Ll/ake;->h:I

    .line 81
    .line 82
    if-eq v2, v3, :cond_a

    .line 83
    .line 84
    return v1

    .line 85
    :cond_a
    iget-object v2, p0, Ll/ake;->j:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Ll/ake;->j:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v2, :cond_b

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_c

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_b
    if-eqz v3, :cond_c

    .line 99
    .line 100
    :goto_0
    return v1

    .line 101
    :cond_c
    iget-object v2, p0, Ll/ake;->n:Ll/iid;

    .line 102
    .line 103
    iget-object v3, p1, Ll/ake;->n:Ll/iid;

    .line 104
    .line 105
    if-eqz v2, :cond_d

    .line 106
    .line 107
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-nez v2, :cond_e

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_d
    if-eqz v3, :cond_e

    .line 115
    .line 116
    :goto_1
    return v1

    .line 117
    :cond_e
    iget-object v2, p0, Ll/ake;->p:Ljava/util/List;

    .line 118
    .line 119
    iget-object v3, p1, Ll/ake;->p:Ljava/util/List;

    .line 120
    .line 121
    if-eqz v2, :cond_f

    .line 122
    .line 123
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-nez v2, :cond_10

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_f
    if-eqz v3, :cond_10

    .line 131
    .line 132
    :goto_2
    return v1

    .line 133
    :cond_10
    iget-object p0, p0, Ll/ake;->o:Ll/ctd0;

    .line 134
    .line 135
    iget-object p1, p1, Ll/ake;->o:Ll/ctd0;

    .line 136
    .line 137
    if-eqz p0, :cond_11

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Ll/ctd0;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-nez p0, :cond_12

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_11
    if-eqz p1, :cond_12

    .line 147
    .line 148
    :goto_3
    return v1

    .line 149
    :cond_12
    return v0

    .line 150
    :cond_13
    :goto_4
    return v1
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Ll/ake;->d:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Ll/ake;->e:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget v1, p0, Ll/ake;->f:I

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    mul-int/lit8 v0, v0, 0x1f

    .line 14
    .line 15
    iget v1, p0, Ll/ake;->g:I

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget v1, p0, Ll/ake;->h:I

    .line 21
    .line 22
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x1f

    .line 24
    .line 25
    iget v1, p0, Ll/ake;->i:I

    .line 26
    .line 27
    add-int/2addr v0, v1

    .line 28
    mul-int/lit8 v0, v0, 0x1f

    .line 29
    .line 30
    iget-object v1, p0, Ll/ake;->j:Ljava/lang/String;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move v1, v2

    .line 41
    :goto_0
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x1f

    .line 43
    .line 44
    iget v1, p0, Ll/ake;->k:I

    .line 45
    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x1f

    .line 48
    .line 49
    iget v1, p0, Ll/ake;->l:I

    .line 50
    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x1f

    .line 53
    .line 54
    iget v1, p0, Ll/ake;->m:I

    .line 55
    .line 56
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x1f

    .line 58
    .line 59
    iget-object v1, p0, Ll/ake;->n:Ll/iid;

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    move v1, v2

    .line 69
    :goto_1
    add-int/2addr v0, v1

    .line 70
    mul-int/lit8 v0, v0, 0x1f

    .line 71
    .line 72
    iget-object v1, p0, Ll/ake;->o:Ll/ctd0;

    .line 73
    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/ctd0;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    move v1, v2

    .line 82
    :goto_2
    add-int/2addr v0, v1

    .line 83
    mul-int/lit8 v0, v0, 0x1f

    .line 84
    .line 85
    iget-object p0, p0, Ll/ake;->p:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    invoke-interface {p0}, Ljava/util/List;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    :cond_3
    add-int/2addr v0, v2

    .line 94
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ESDescriptor{esId="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/ake;->d:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", streamDependenceFlag="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/ake;->e:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", URLFlag="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/ake;->f:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", oCRstreamFlag="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/ake;->g:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", streamPriority="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/ake;->h:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", URLLength="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/ake;->i:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", URLString=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/ake;->j:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', remoteODFlag="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/ake;->k:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", dependsOnEsId="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/ake;->l:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", oCREsId="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Ll/ake;->m:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", decoderConfigDescriptor="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/ake;->n:Ll/iid;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", slConfigDescriptor="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Ll/ake;->o:Ll/ctd0;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const/16 p0, 0x7d

    .line 124
    .line 125
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method
