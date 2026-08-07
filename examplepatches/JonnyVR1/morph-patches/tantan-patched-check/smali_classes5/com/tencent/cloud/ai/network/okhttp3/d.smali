.class public final Lcom/tencent/cloud/ai/network/okhttp3/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/d$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:I

.field public final d:I

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:I

.field public final i:I

.field public final j:Z

.field public final k:Z

.field public final l:Z

.field public m:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/d$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/d$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->a:Z

    .line 8
    .line 9
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 10
    .line 11
    invoke-direct {v2, v0}, Lcom/tencent/cloud/ai/network/okhttp3/d;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/d$a;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/d$a;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/d$a;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->e:Z

    .line 20
    .line 21
    const v1, 0x7fffffff

    .line 22
    .line 23
    .line 24
    iput v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->c:I

    .line 25
    .line 26
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 27
    .line 28
    invoke-direct {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/d;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/d$a;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/d$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->a:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->a:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->b:Z

    .line 10
    .line 11
    iget v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->b:I

    .line 12
    .line 13
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    .line 14
    .line 15
    const/4 v1, -0x1

    .line 16
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->d:I

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->e:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->f:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->g:Z

    .line 23
    .line 24
    iget v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->c:I

    .line 25
    .line 26
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->h:I

    .line 27
    .line 28
    iget v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->d:I

    .line 29
    .line 30
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->i:I

    .line 31
    .line 32
    iget-boolean p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/d$a;->e:Z

    .line 33
    .line 34
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->j:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->k:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->l:Z

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(ZZIIZZZIIZZZLjava/lang/String;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->a:Z

    .line 43
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->b:Z

    .line 44
    iput p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    .line 45
    iput p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->d:I

    .line 46
    iput-boolean p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->e:Z

    .line 47
    iput-boolean p6, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->f:Z

    .line 48
    iput-boolean p7, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->g:Z

    .line 49
    iput p8, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->h:I

    .line 50
    iput p9, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->i:I

    .line 51
    iput-boolean p10, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->j:Z

    .line 52
    iput-boolean p11, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->k:Z

    .line 53
    iput-boolean p12, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->l:Z

    .line 54
    iput-object p13, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->m:Ljava/lang/String;

    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/d;
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v6, 0x0

    .line 8
    const/4 v7, 0x1

    .line 9
    const/4 v8, 0x0

    .line 10
    const/4 v9, 0x0

    .line 11
    const/4 v10, 0x0

    .line 12
    const/4 v11, -0x1

    .line 13
    const/4 v12, -0x1

    .line 14
    const/4 v13, 0x0

    .line 15
    const/4 v14, 0x0

    .line 16
    const/4 v15, 0x0

    .line 17
    const/16 v16, -0x1

    .line 18
    .line 19
    const/16 v17, -0x1

    .line 20
    .line 21
    const/16 v18, 0x0

    .line 22
    .line 23
    const/16 v19, 0x0

    .line 24
    .line 25
    const/16 v20, 0x0

    .line 26
    .line 27
    :goto_0
    if-ge v6, v1, :cond_14

    .line 28
    .line 29
    invoke-virtual {v0, v6}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/16 v22, 0x1

    .line 34
    .line 35
    invoke-virtual {v0, v6}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    const-string v5, "Cache-Control"

    .line 40
    .line 41
    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_1

    .line 46
    .line 47
    if-eqz v8, :cond_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    move-object v8, v4

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    const-string v5, "Pragma"

    .line 53
    .line 54
    invoke-virtual {v2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_13

    .line 59
    .line 60
    :goto_1
    const/4 v7, 0x0

    .line 61
    :goto_2
    const/4 v2, 0x0

    .line 62
    :goto_3
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-ge v2, v5, :cond_13

    .line 67
    .line 68
    const-string v5, "=,;"

    .line 69
    .line 70
    invoke-static {v4, v2, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;ILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eq v5, v3, :cond_2

    .line 87
    .line 88
    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    const/16 v0, 0x2c

    .line 93
    .line 94
    if-eq v3, v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    const/16 v3, 0x3b

    .line 101
    .line 102
    if-ne v0, v3, :cond_3

    .line 103
    .line 104
    :cond_2
    move/from16 v23, v1

    .line 105
    .line 106
    goto :goto_6

    .line 107
    :cond_3
    :goto_4
    add-int/lit8 v0, v5, 0x1

    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-ge v0, v3, :cond_5

    .line 114
    .line 115
    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    move/from16 v23, v1

    .line 120
    .line 121
    const/16 v1, 0x20

    .line 122
    .line 123
    if-eq v3, v1, :cond_4

    .line 124
    .line 125
    const/16 v1, 0x9

    .line 126
    .line 127
    if-eq v3, v1, :cond_4

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :cond_4
    move v5, v0

    .line 131
    move/from16 v1, v23

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_5
    move/from16 v23, v1

    .line 135
    .line 136
    :goto_5
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-ge v0, v1, :cond_6

    .line 141
    .line 142
    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    const/16 v3, 0x22

    .line 147
    .line 148
    if-ne v1, v3, :cond_6

    .line 149
    .line 150
    add-int/lit8 v5, v5, 0x2

    .line 151
    .line 152
    const-string v0, "\""

    .line 153
    .line 154
    invoke-static {v4, v5, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;ILjava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    add-int/lit8 v0, v0, 0x1

    .line 163
    .line 164
    goto :goto_7

    .line 165
    :cond_6
    const-string v1, ",;"

    .line 166
    .line 167
    invoke-static {v4, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;ILjava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    move/from16 v24, v1

    .line 180
    .line 181
    move-object v1, v0

    .line 182
    move/from16 v0, v24

    .line 183
    .line 184
    goto :goto_7

    .line 185
    :goto_6
    add-int/lit8 v5, v5, 0x1

    .line 186
    .line 187
    move v0, v5

    .line 188
    const/4 v1, 0x0

    .line 189
    :goto_7
    const-string v3, "no-cache"

    .line 190
    .line 191
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    if-eqz v3, :cond_7

    .line 196
    .line 197
    move/from16 v9, v22

    .line 198
    .line 199
    :goto_8
    const/4 v3, -0x1

    .line 200
    goto/16 :goto_9

    .line 201
    .line 202
    :cond_7
    const-string v3, "no-store"

    .line 203
    .line 204
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_8

    .line 209
    .line 210
    move/from16 v10, v22

    .line 211
    .line 212
    goto :goto_8

    .line 213
    :cond_8
    const-string v3, "max-age"

    .line 214
    .line 215
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    if-eqz v3, :cond_9

    .line 220
    .line 221
    const/4 v3, -0x1

    .line 222
    invoke-static {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;I)I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    move v11, v1

    .line 227
    goto/16 :goto_9

    .line 228
    .line 229
    :cond_9
    const/4 v3, -0x1

    .line 230
    const-string v5, "s-maxage"

    .line 231
    .line 232
    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    if-eqz v5, :cond_a

    .line 237
    .line 238
    invoke-static {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;I)I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    move v12, v1

    .line 243
    goto/16 :goto_9

    .line 244
    .line 245
    :cond_a
    const-string v3, "private"

    .line 246
    .line 247
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    if-eqz v3, :cond_b

    .line 252
    .line 253
    move/from16 v13, v22

    .line 254
    .line 255
    goto :goto_8

    .line 256
    :cond_b
    const-string v3, "public"

    .line 257
    .line 258
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    if-eqz v3, :cond_c

    .line 263
    .line 264
    move/from16 v14, v22

    .line 265
    .line 266
    goto :goto_8

    .line 267
    :cond_c
    const-string v3, "must-revalidate"

    .line 268
    .line 269
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    if-eqz v3, :cond_d

    .line 274
    .line 275
    move/from16 v15, v22

    .line 276
    .line 277
    goto :goto_8

    .line 278
    :cond_d
    const-string v3, "max-stale"

    .line 279
    .line 280
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    if-eqz v3, :cond_e

    .line 285
    .line 286
    const v2, 0x7fffffff

    .line 287
    .line 288
    .line 289
    invoke-static {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;I)I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    move/from16 v16, v1

    .line 294
    .line 295
    goto :goto_8

    .line 296
    :cond_e
    const-string v3, "min-fresh"

    .line 297
    .line 298
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    if-eqz v3, :cond_f

    .line 303
    .line 304
    const/4 v3, -0x1

    .line 305
    invoke-static {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;I)I

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    move/from16 v17, v1

    .line 310
    .line 311
    goto :goto_9

    .line 312
    :cond_f
    const/4 v3, -0x1

    .line 313
    const-string v1, "only-if-cached"

    .line 314
    .line 315
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    if-eqz v1, :cond_10

    .line 320
    .line 321
    move/from16 v18, v22

    .line 322
    .line 323
    goto :goto_9

    .line 324
    :cond_10
    const-string v1, "no-transform"

    .line 325
    .line 326
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    if-eqz v1, :cond_11

    .line 331
    .line 332
    move/from16 v19, v22

    .line 333
    .line 334
    goto :goto_9

    .line 335
    :cond_11
    const-string v1, "immutable"

    .line 336
    .line 337
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    if-eqz v1, :cond_12

    .line 342
    .line 343
    move/from16 v20, v22

    .line 344
    .line 345
    :cond_12
    :goto_9
    move v2, v0

    .line 346
    move/from16 v1, v23

    .line 347
    .line 348
    move-object/from16 v0, p0

    .line 349
    .line 350
    goto/16 :goto_3

    .line 351
    .line 352
    :cond_13
    move/from16 v23, v1

    .line 353
    .line 354
    const/4 v3, -0x1

    .line 355
    add-int/lit8 v6, v6, 0x1

    .line 356
    .line 357
    move-object/from16 v0, p0

    .line 358
    .line 359
    move/from16 v1, v23

    .line 360
    .line 361
    goto/16 :goto_0

    .line 362
    .line 363
    :cond_14
    if-nez v7, :cond_15

    .line 364
    .line 365
    const/16 v21, 0x0

    .line 366
    .line 367
    goto :goto_a

    .line 368
    :cond_15
    move-object/from16 v21, v8

    .line 369
    .line 370
    :goto_a
    new-instance v8, Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 371
    .line 372
    invoke-direct/range {v8 .. v21}, Lcom/tencent/cloud/ai/network/okhttp3/d;-><init>(ZZIIZZZIIZZZLjava/lang/String;)V

    .line 373
    .line 374
    .line 375
    return-object v8
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->m:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->a:Z

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    const-string v1, "no-cache, "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->b:Z

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    const-string v1, "no-store, "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    :cond_2
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    .line 30
    .line 31
    const-string v2, ", "

    .line 32
    .line 33
    const/4 v3, -0x1

    .line 34
    if-eq v1, v3, :cond_3

    .line 35
    .line 36
    const-string v1, "max-age="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    :cond_3
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->d:I

    .line 50
    .line 51
    if-eq v1, v3, :cond_4

    .line 52
    .line 53
    const-string v1, "s-maxage="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->d:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    :cond_4
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->e:Z

    .line 67
    .line 68
    if-eqz v1, :cond_5

    .line 69
    .line 70
    const-string v1, "private, "

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->f:Z

    .line 76
    .line 77
    if-eqz v1, :cond_6

    .line 78
    .line 79
    const-string v1, "public, "

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    :cond_6
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->g:Z

    .line 85
    .line 86
    if-eqz v1, :cond_7

    .line 87
    .line 88
    const-string v1, "must-revalidate, "

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    :cond_7
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->h:I

    .line 94
    .line 95
    if-eq v1, v3, :cond_8

    .line 96
    .line 97
    const-string v1, "max-stale="

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->h:I

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    :cond_8
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->i:I

    .line 111
    .line 112
    if-eq v1, v3, :cond_9

    .line 113
    .line 114
    const-string v1, "min-fresh="

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->i:I

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->j:Z

    .line 128
    .line 129
    if-eqz v1, :cond_a

    .line 130
    .line 131
    const-string v1, "only-if-cached, "

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    :cond_a
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->k:Z

    .line 137
    .line 138
    if-eqz v1, :cond_b

    .line 139
    .line 140
    const-string v1, "no-transform, "

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    :cond_b
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->l:Z

    .line 146
    .line 147
    if-eqz v1, :cond_c

    .line 148
    .line 149
    const-string v1, "immutable, "

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    :cond_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-nez v1, :cond_d

    .line 159
    .line 160
    const-string v0, ""

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    add-int/lit8 v1, v1, -0x2

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    :goto_0
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->m:Ljava/lang/String;

    .line 181
    .line 182
    return-object v0
.end method
