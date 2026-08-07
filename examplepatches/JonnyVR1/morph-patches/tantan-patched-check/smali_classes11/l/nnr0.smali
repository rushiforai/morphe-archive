.class public final Ll/nnr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/unr0;


# instance fields
.field public final a:Ll/tnr0;

.field public final b:J

.field public final c:J

.field public final d:Ll/lor0;

.field public e:I

.field public f:J

.field public g:J

.field public h:J

.field public i:J

.field public j:J

.field public k:J

.field public l:J


# direct methods
.method public constructor <init>(Ll/lor0;JJJJZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p2, v0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    cmp-long v0, p4, p2

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/nnr0;->d:Ll/lor0;

    .line 22
    .line 23
    iput-wide p2, p0, Ll/nnr0;->b:J

    .line 24
    .line 25
    iput-wide p4, p0, Ll/nnr0;->c:J

    .line 26
    .line 27
    sub-long/2addr p4, p2

    .line 28
    cmp-long p1, p6, p4

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    if-eqz p10, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iput v1, p0, Ll/nnr0;->e:I

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    :goto_1
    iput-wide p8, p0, Ll/nnr0;->f:J

    .line 39
    .line 40
    const/4 p1, 0x4

    .line 41
    iput p1, p0, Ll/nnr0;->e:I

    .line 42
    .line 43
    :goto_2
    new-instance p1, Ll/tnr0;

    .line 44
    .line 45
    invoke-direct {p1}, Ll/tnr0;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/nnr0;->a:Ll/tnr0;

    .line 49
    .line 50
    return-void
.end method

.method public static bridge synthetic c(Ll/nnr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nnr0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic d(Ll/nnr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nnr0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic e(Ll/nnr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/nnr0;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic f(Ll/nnr0;)Ll/lor0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnr0;->d:Ll/lor0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/nnr0;->f:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 7
    .line 8
    .line 9
    move-result-wide p1

    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 13
    .line 14
    .line 15
    move-result-wide p1

    .line 16
    iput-wide p1, p0, Ll/nnr0;->h:J

    .line 17
    .line 18
    const/4 p1, 0x2

    .line 19
    iput p1, p0, Ll/nnr0;->e:I

    .line 20
    .line 21
    iget-wide p1, p0, Ll/nnr0;->b:J

    .line 22
    .line 23
    iput-wide p1, p0, Ll/nnr0;->i:J

    .line 24
    .line 25
    iget-wide p1, p0, Ll/nnr0;->c:J

    .line 26
    .line 27
    iput-wide p1, p0, Ll/nnr0;->j:J

    .line 28
    .line 29
    iput-wide v0, p0, Ll/nnr0;->k:J

    .line 30
    .line 31
    iget-wide p1, p0, Ll/nnr0;->f:J

    .line 32
    .line 33
    iput-wide p1, p0, Ll/nnr0;->l:J

    .line 34
    .line 35
    return-void
.end method

.method public final b(Ll/qer0;)J
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Ll/nnr0;->e:I

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    const/4 v7, 0x0

    .line 9
    const-wide/16 v8, -0x1

    .line 10
    .line 11
    if-eqz v2, :cond_c

    .line 12
    .line 13
    if-eq v2, v5, :cond_b

    .line 14
    .line 15
    const/4 v5, 0x2

    .line 16
    const/4 v12, 0x3

    .line 17
    if-eq v2, v5, :cond_1

    .line 18
    .line 19
    if-eq v2, v12, :cond_0

    .line 20
    .line 21
    return-wide v8

    .line 22
    :cond_0
    const-wide/16 v17, 0x2

    .line 23
    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_1
    iget-wide v13, v0, Ll/nnr0;->i:J

    .line 27
    .line 28
    const-wide/16 v15, 0x0

    .line 29
    .line 30
    iget-wide v3, v0, Ll/nnr0;->j:J

    .line 31
    .line 32
    cmp-long v2, v13, v3

    .line 33
    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    move-wide v2, v8

    .line 37
    :goto_0
    const-wide/16 v17, 0x2

    .line 38
    .line 39
    goto/16 :goto_3

    .line 40
    .line 41
    :cond_2
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 42
    .line 43
    .line 44
    move-result-wide v13

    .line 45
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 46
    .line 47
    invoke-virtual {v2, v1, v3, v4}, Ll/tnr0;->c(Ll/qer0;J)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_4

    .line 52
    .line 53
    iget-wide v2, v0, Ll/nnr0;->i:J

    .line 54
    .line 55
    cmp-long v4, v2, v13

    .line 56
    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    const-string v0, "No ogg page can be found."

    .line 61
    .line 62
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-wide v15

    .line 66
    :cond_4
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 67
    .line 68
    invoke-virtual {v2, v1, v7}, Ll/tnr0;->b(Ll/qer0;Z)Z

    .line 69
    .line 70
    .line 71
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 72
    .line 73
    .line 74
    iget-wide v2, v0, Ll/nnr0;->h:J

    .line 75
    .line 76
    iget-object v4, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 77
    .line 78
    const-wide/16 v17, 0x2

    .line 79
    .line 80
    iget-wide v10, v4, Ll/tnr0;->b:J

    .line 81
    .line 82
    sub-long/2addr v2, v10

    .line 83
    iget v5, v4, Ll/tnr0;->d:I

    .line 84
    .line 85
    iget v4, v4, Ll/tnr0;->e:I

    .line 86
    .line 87
    add-int/2addr v5, v4

    .line 88
    cmp-long v4, v2, v15

    .line 89
    .line 90
    if-ltz v4, :cond_5

    .line 91
    .line 92
    const-wide/32 v15, 0x11940

    .line 93
    .line 94
    .line 95
    cmp-long v15, v2, v15

    .line 96
    .line 97
    if-gez v15, :cond_5

    .line 98
    .line 99
    move-wide v2, v8

    .line 100
    goto :goto_3

    .line 101
    :cond_5
    if-gez v4, :cond_6

    .line 102
    .line 103
    iput-wide v13, v0, Ll/nnr0;->j:J

    .line 104
    .line 105
    iput-wide v10, v0, Ll/nnr0;->l:J

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_6
    int-to-long v13, v5

    .line 109
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 110
    .line 111
    .line 112
    move-result-wide v15

    .line 113
    add-long/2addr v13, v15

    .line 114
    iput-wide v13, v0, Ll/nnr0;->i:J

    .line 115
    .line 116
    iput-wide v10, v0, Ll/nnr0;->k:J

    .line 117
    .line 118
    :goto_1
    iget-wide v10, v0, Ll/nnr0;->j:J

    .line 119
    .line 120
    iget-wide v13, v0, Ll/nnr0;->i:J

    .line 121
    .line 122
    sub-long v15, v10, v13

    .line 123
    .line 124
    const-wide/32 v19, 0x186a0

    .line 125
    .line 126
    .line 127
    cmp-long v19, v15, v19

    .line 128
    .line 129
    if-gez v19, :cond_7

    .line 130
    .line 131
    iput-wide v13, v0, Ll/nnr0;->j:J

    .line 132
    .line 133
    move-wide v2, v13

    .line 134
    goto :goto_3

    .line 135
    :cond_7
    int-to-long v6, v5

    .line 136
    if-gtz v4, :cond_8

    .line 137
    .line 138
    move-wide/from16 v4, v17

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_8
    const-wide/16 v4, 0x1

    .line 142
    .line 143
    :goto_2
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 144
    .line 145
    .line 146
    move-result-wide v21

    .line 147
    mul-long/2addr v6, v4

    .line 148
    sub-long v21, v21, v6

    .line 149
    .line 150
    mul-long/2addr v2, v15

    .line 151
    iget-wide v4, v0, Ll/nnr0;->l:J

    .line 152
    .line 153
    iget-wide v6, v0, Ll/nnr0;->k:J

    .line 154
    .line 155
    sub-long/2addr v4, v6

    .line 156
    div-long/2addr v2, v4

    .line 157
    add-long v2, v21, v2

    .line 158
    .line 159
    add-long/2addr v10, v8

    .line 160
    invoke-static {v2, v3, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 161
    .line 162
    .line 163
    move-result-wide v2

    .line 164
    invoke-static {v13, v14, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 165
    .line 166
    .line 167
    move-result-wide v2

    .line 168
    :goto_3
    cmp-long v4, v2, v8

    .line 169
    .line 170
    if-eqz v4, :cond_9

    .line 171
    .line 172
    return-wide v2

    .line 173
    :cond_9
    iput v12, v0, Ll/nnr0;->e:I

    .line 174
    .line 175
    :goto_4
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 176
    .line 177
    invoke-virtual {v2, v1, v8, v9}, Ll/tnr0;->c(Ll/qer0;J)Z

    .line 178
    .line 179
    .line 180
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 181
    .line 182
    const/4 v3, 0x0

    .line 183
    invoke-virtual {v2, v1, v3}, Ll/tnr0;->b(Ll/qer0;Z)Z

    .line 184
    .line 185
    .line 186
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 187
    .line 188
    iget-wide v3, v2, Ll/tnr0;->b:J

    .line 189
    .line 190
    iget-wide v5, v0, Ll/nnr0;->h:J

    .line 191
    .line 192
    cmp-long v3, v3, v5

    .line 193
    .line 194
    if-lez v3, :cond_a

    .line 195
    .line 196
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 197
    .line 198
    .line 199
    const/4 v1, 0x4

    .line 200
    iput v1, v0, Ll/nnr0;->e:I

    .line 201
    .line 202
    iget-wide v0, v0, Ll/nnr0;->k:J

    .line 203
    .line 204
    add-long v0, v0, v17

    .line 205
    .line 206
    neg-long v0, v0

    .line 207
    return-wide v0

    .line 208
    :cond_a
    iget v3, v2, Ll/tnr0;->d:I

    .line 209
    .line 210
    iget v2, v2, Ll/tnr0;->e:I

    .line 211
    .line 212
    add-int/2addr v3, v2

    .line 213
    move-object v2, v1

    .line 214
    check-cast v2, Ll/fer0;

    .line 215
    .line 216
    const/4 v4, 0x0

    .line 217
    invoke-virtual {v2, v3, v4}, Ll/fer0;->k(IZ)Z

    .line 218
    .line 219
    .line 220
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 221
    .line 222
    .line 223
    move-result-wide v2

    .line 224
    iput-wide v2, v0, Ll/nnr0;->i:J

    .line 225
    .line 226
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 227
    .line 228
    iget-wide v2, v2, Ll/tnr0;->b:J

    .line 229
    .line 230
    iput-wide v2, v0, Ll/nnr0;->k:J

    .line 231
    .line 232
    goto :goto_4

    .line 233
    :cond_b
    const-wide/16 v15, 0x0

    .line 234
    .line 235
    goto :goto_5

    .line 236
    :cond_c
    const-wide/16 v15, 0x0

    .line 237
    .line 238
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 239
    .line 240
    .line 241
    move-result-wide v2

    .line 242
    iput-wide v2, v0, Ll/nnr0;->g:J

    .line 243
    .line 244
    iput v5, v0, Ll/nnr0;->e:I

    .line 245
    .line 246
    iget-wide v6, v0, Ll/nnr0;->c:J

    .line 247
    .line 248
    const-wide/32 v10, -0xff1b

    .line 249
    .line 250
    .line 251
    add-long/2addr v6, v10

    .line 252
    cmp-long v2, v6, v2

    .line 253
    .line 254
    if-lez v2, :cond_d

    .line 255
    .line 256
    return-wide v6

    .line 257
    :cond_d
    :goto_5
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 258
    .line 259
    invoke-virtual {v2}, Ll/tnr0;->a()V

    .line 260
    .line 261
    .line 262
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 263
    .line 264
    invoke-virtual {v2, v1, v8, v9}, Ll/tnr0;->c(Ll/qer0;J)Z

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    if-eqz v2, :cond_10

    .line 269
    .line 270
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 271
    .line 272
    const/4 v3, 0x0

    .line 273
    invoke-virtual {v2, v1, v3}, Ll/tnr0;->b(Ll/qer0;Z)Z

    .line 274
    .line 275
    .line 276
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 277
    .line 278
    iget v4, v2, Ll/tnr0;->d:I

    .line 279
    .line 280
    iget v2, v2, Ll/tnr0;->e:I

    .line 281
    .line 282
    add-int/2addr v4, v2

    .line 283
    move-object v2, v1

    .line 284
    check-cast v2, Ll/fer0;

    .line 285
    .line 286
    invoke-virtual {v2, v4, v3}, Ll/fer0;->k(IZ)Z

    .line 287
    .line 288
    .line 289
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 290
    .line 291
    iget-wide v2, v2, Ll/tnr0;->b:J

    .line 292
    .line 293
    :goto_6
    iget-object v4, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 294
    .line 295
    iget v6, v4, Ll/tnr0;->a:I

    .line 296
    .line 297
    const/4 v7, 0x4

    .line 298
    and-int/2addr v6, v7

    .line 299
    if-eq v6, v7, :cond_f

    .line 300
    .line 301
    invoke-virtual {v4, v1, v8, v9}, Ll/tnr0;->c(Ll/qer0;J)Z

    .line 302
    .line 303
    .line 304
    move-result v4

    .line 305
    if-eqz v4, :cond_f

    .line 306
    .line 307
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 308
    .line 309
    .line 310
    move-result-wide v6

    .line 311
    iget-wide v10, v0, Ll/nnr0;->c:J

    .line 312
    .line 313
    cmp-long v4, v6, v10

    .line 314
    .line 315
    if-gez v4, :cond_f

    .line 316
    .line 317
    iget-object v4, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 318
    .line 319
    invoke-virtual {v4, v1, v5}, Ll/tnr0;->b(Ll/qer0;Z)Z

    .line 320
    .line 321
    .line 322
    move-result v4

    .line 323
    if-eqz v4, :cond_f

    .line 324
    .line 325
    iget-object v4, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 326
    .line 327
    iget v6, v4, Ll/tnr0;->d:I

    .line 328
    .line 329
    iget v4, v4, Ll/tnr0;->e:I

    .line 330
    .line 331
    add-int/2addr v6, v4

    .line 332
    invoke-static {v1, v6}, Ll/ter0;->e(Ll/qer0;I)Z

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    if-nez v4, :cond_e

    .line 337
    .line 338
    goto :goto_7

    .line 339
    :cond_e
    iget-object v2, v0, Ll/nnr0;->a:Ll/tnr0;

    .line 340
    .line 341
    iget-wide v2, v2, Ll/tnr0;->b:J

    .line 342
    .line 343
    goto :goto_6

    .line 344
    :cond_f
    :goto_7
    iput-wide v2, v0, Ll/nnr0;->f:J

    .line 345
    .line 346
    const/4 v1, 0x4

    .line 347
    iput v1, v0, Ll/nnr0;->e:I

    .line 348
    .line 349
    iget-wide v0, v0, Ll/nnr0;->g:J

    .line 350
    .line 351
    return-wide v0

    .line 352
    :cond_10
    invoke-static {}, Ll/vg3;->a()V

    .line 353
    .line 354
    .line 355
    return-wide v15
.end method

.method public final bridge synthetic zze()Ll/bgr0;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/nnr0;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/mnr0;

    .line 11
    .line 12
    invoke-direct {v0, p0, v1}, Ll/mnr0;-><init>(Ll/nnr0;Ll/lnr0;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    return-object v1
.end method
