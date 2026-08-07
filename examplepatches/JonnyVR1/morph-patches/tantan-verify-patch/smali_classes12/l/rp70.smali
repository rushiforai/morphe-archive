.class public Ll/rp70;
.super Ll/p33;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rp70$a;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:I

.field public i:I

.field public j:Z

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:[I

.field public s:[I

.field public t:[I

.field public u:Z

.field public v:[I

.field public w:Ll/rp70$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p33;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/io/InputStream;)Ll/rp70;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/as3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/as3;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ll/rp70;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/rp70;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "PPS: pic_parameter_set_id"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Ll/rp70;->e:I

    .line 18
    .line 19
    const-string v1, "PPS: seq_parameter_set_id"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, p0, Ll/rp70;->f:I

    .line 26
    .line 27
    const-string v1, "PPS: entropy_coding_mode_flag"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput-boolean v1, p0, Ll/rp70;->a:Z

    .line 34
    .line 35
    const-string v1, "PPS: pic_order_present_flag"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput-boolean v1, p0, Ll/rp70;->g:Z

    .line 42
    .line 43
    const-string v1, "PPS: num_slice_groups_minus1"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iput v1, p0, Ll/rp70;->h:I

    .line 50
    .line 51
    const/4 v2, 0x6

    .line 52
    const/4 v3, 0x0

    .line 53
    const/4 v4, 0x2

    .line 54
    if-lez v1, :cond_9

    .line 55
    .line 56
    const-string v1, "PPS: slice_group_map_type"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput v1, p0, Ll/rp70;->i:I

    .line 63
    .line 64
    iget v5, p0, Ll/rp70;->h:I

    .line 65
    .line 66
    add-int/lit8 v6, v5, 0x1

    .line 67
    .line 68
    new-array v6, v6, [I

    .line 69
    .line 70
    iput-object v6, p0, Ll/rp70;->r:[I

    .line 71
    .line 72
    add-int/lit8 v6, v5, 0x1

    .line 73
    .line 74
    new-array v6, v6, [I

    .line 75
    .line 76
    iput-object v6, p0, Ll/rp70;->s:[I

    .line 77
    .line 78
    add-int/lit8 v6, v5, 0x1

    .line 79
    .line 80
    new-array v6, v6, [I

    .line 81
    .line 82
    iput-object v6, p0, Ll/rp70;->t:[I

    .line 83
    .line 84
    if-nez v1, :cond_1

    .line 85
    .line 86
    move v1, v3

    .line 87
    :goto_0
    iget v5, p0, Ll/rp70;->h:I

    .line 88
    .line 89
    if-le v1, v5, :cond_0

    .line 90
    .line 91
    goto/16 :goto_5

    .line 92
    .line 93
    :cond_0
    iget-object v5, p0, Ll/rp70;->t:[I

    .line 94
    .line 95
    const-string v6, "PPS: run_length_minus1"

    .line 96
    .line 97
    invoke-virtual {v0, v6}, Ll/as3;->l(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    aput v6, v5, v1

    .line 102
    .line 103
    add-int/lit8 v1, v1, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    if-ne v1, v4, :cond_3

    .line 107
    .line 108
    move v1, v3

    .line 109
    :goto_1
    iget v5, p0, Ll/rp70;->h:I

    .line 110
    .line 111
    if-lt v1, v5, :cond_2

    .line 112
    .line 113
    goto/16 :goto_5

    .line 114
    .line 115
    :cond_2
    iget-object v5, p0, Ll/rp70;->r:[I

    .line 116
    .line 117
    const-string v6, "PPS: top_left"

    .line 118
    .line 119
    invoke-virtual {v0, v6}, Ll/as3;->l(Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    aput v6, v5, v1

    .line 124
    .line 125
    iget-object v5, p0, Ll/rp70;->s:[I

    .line 126
    .line 127
    const-string v6, "PPS: bottom_right"

    .line 128
    .line 129
    invoke-virtual {v0, v6}, Ll/as3;->l(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v6

    .line 133
    aput v6, v5, v1

    .line 134
    .line 135
    add-int/lit8 v1, v1, 0x1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    const/4 v6, 0x3

    .line 139
    if-eq v1, v6, :cond_8

    .line 140
    .line 141
    const/4 v7, 0x4

    .line 142
    if-eq v1, v7, :cond_8

    .line 143
    .line 144
    const/4 v8, 0x5

    .line 145
    if-ne v1, v8, :cond_4

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_4
    if-ne v1, v2, :cond_9

    .line 149
    .line 150
    add-int/lit8 v1, v5, 0x1

    .line 151
    .line 152
    if-le v1, v7, :cond_5

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_5
    const/4 v6, 0x1

    .line 156
    add-int/2addr v5, v6

    .line 157
    if-le v5, v4, :cond_6

    .line 158
    .line 159
    move v6, v4

    .line 160
    :cond_6
    :goto_2
    const-string v1, "PPS: pic_size_in_map_units_minus1"

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    add-int/lit8 v5, v1, 0x1

    .line 167
    .line 168
    new-array v5, v5, [I

    .line 169
    .line 170
    iput-object v5, p0, Ll/rp70;->v:[I

    .line 171
    .line 172
    move v5, v3

    .line 173
    :goto_3
    if-le v5, v1, :cond_7

    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_7
    iget-object v7, p0, Ll/rp70;->v:[I

    .line 177
    .line 178
    new-instance v8, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    const-string v9, "PPS: slice_group_id ["

    .line 181
    .line 182
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v9, "]f"

    .line 189
    .line 190
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v8

    .line 197
    invoke-virtual {v0, v6, v8}, Ll/as3;->j(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v8

    .line 201
    aput v8, v7, v5

    .line 202
    .line 203
    add-int/lit8 v5, v5, 0x1

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_8
    :goto_4
    const-string v1, "PPS: slice_group_change_direction_flag"

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    iput-boolean v1, p0, Ll/rp70;->u:Z

    .line 213
    .line 214
    const-string v1, "PPS: slice_group_change_rate_minus1"

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    iput v1, p0, Ll/rp70;->d:I

    .line 221
    .line 222
    :cond_9
    :goto_5
    const-string v1, "PPS: num_ref_idx_l0_active_minus1"

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    iput v1, p0, Ll/rp70;->b:I

    .line 229
    .line 230
    const-string v1, "PPS: num_ref_idx_l1_active_minus1"

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Ll/as3;->l(Ljava/lang/String;)I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    iput v1, p0, Ll/rp70;->c:I

    .line 237
    .line 238
    const-string v1, "PPS: weighted_pred_flag"

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    iput-boolean v1, p0, Ll/rp70;->j:Z

    .line 245
    .line 246
    const-string v1, "PPS: weighted_bipred_idc"

    .line 247
    .line 248
    invoke-virtual {v0, v4, v1}, Ll/as3;->g(ILjava/lang/String;)J

    .line 249
    .line 250
    .line 251
    move-result-wide v5

    .line 252
    long-to-int v1, v5

    .line 253
    iput v1, p0, Ll/rp70;->k:I

    .line 254
    .line 255
    const-string v1, "PPS: pic_init_qp_minus26"

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ll/as3;->h(Ljava/lang/String;)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    iput v1, p0, Ll/rp70;->l:I

    .line 262
    .line 263
    const-string v1, "PPS: pic_init_qs_minus26"

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Ll/as3;->h(Ljava/lang/String;)I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    iput v1, p0, Ll/rp70;->m:I

    .line 270
    .line 271
    const-string v1, "PPS: chroma_qp_index_offset"

    .line 272
    .line 273
    invoke-virtual {v0, v1}, Ll/as3;->h(Ljava/lang/String;)I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    iput v1, p0, Ll/rp70;->n:I

    .line 278
    .line 279
    const-string v1, "PPS: deblocking_filter_control_present_flag"

    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    iput-boolean v1, p0, Ll/rp70;->o:Z

    .line 286
    .line 287
    const-string v1, "PPS: constrained_intra_pred_flag"

    .line 288
    .line 289
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    iput-boolean v1, p0, Ll/rp70;->p:Z

    .line 294
    .line 295
    const-string v1, "PPS: redundant_pic_cnt_present_flag"

    .line 296
    .line 297
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    iput-boolean v1, p0, Ll/rp70;->q:Z

    .line 302
    .line 303
    invoke-virtual {v0}, Ll/q33;->b()Z

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    if-eqz v1, :cond_e

    .line 308
    .line 309
    new-instance v1, Ll/rp70$a;

    .line 310
    .line 311
    invoke-direct {v1}, Ll/rp70$a;-><init>()V

    .line 312
    .line 313
    .line 314
    iput-object v1, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 315
    .line 316
    const-string v5, "PPS: transform_8x8_mode_flag"

    .line 317
    .line 318
    invoke-virtual {v0, v5}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 319
    .line 320
    .line 321
    move-result v5

    .line 322
    iput-boolean v5, v1, Ll/rp70$a;->a:Z

    .line 323
    .line 324
    const-string v1, "PPS: pic_scaling_matrix_present_flag"

    .line 325
    .line 326
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    if-eqz v1, :cond_d

    .line 331
    .line 332
    :goto_6
    iget-object v1, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 333
    .line 334
    iget-boolean v1, v1, Ll/rp70$a;->a:Z

    .line 335
    .line 336
    mul-int/2addr v1, v4

    .line 337
    add-int/2addr v1, v2

    .line 338
    if-lt v3, v1, :cond_a

    .line 339
    .line 340
    goto :goto_8

    .line 341
    :cond_a
    const-string v1, "PPS: pic_scaling_list_present_flag"

    .line 342
    .line 343
    invoke-virtual {v0, v1}, Ll/as3;->f(Ljava/lang/String;)Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-eqz v1, :cond_c

    .line 348
    .line 349
    iget-object v1, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 350
    .line 351
    iget-object v1, v1, Ll/rp70$a;->b:Ll/f1e0;

    .line 352
    .line 353
    const/16 v5, 0x8

    .line 354
    .line 355
    new-array v6, v5, [Ll/e1e0;

    .line 356
    .line 357
    iput-object v6, v1, Ll/f1e0;->a:[Ll/e1e0;

    .line 358
    .line 359
    new-array v5, v5, [Ll/e1e0;

    .line 360
    .line 361
    iput-object v5, v1, Ll/f1e0;->b:[Ll/e1e0;

    .line 362
    .line 363
    if-ge v3, v2, :cond_b

    .line 364
    .line 365
    const/16 v1, 0x10

    .line 366
    .line 367
    invoke-static {v0, v1}, Ll/e1e0;->a(Ll/as3;I)Ll/e1e0;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    aput-object v1, v6, v3

    .line 372
    .line 373
    goto :goto_7

    .line 374
    :cond_b
    add-int/lit8 v1, v3, -0x6

    .line 375
    .line 376
    const/16 v6, 0x40

    .line 377
    .line 378
    invoke-static {v0, v6}, Ll/e1e0;->a(Ll/as3;I)Ll/e1e0;

    .line 379
    .line 380
    .line 381
    move-result-object v6

    .line 382
    aput-object v6, v5, v1

    .line 383
    .line 384
    :cond_c
    :goto_7
    add-int/lit8 v3, v3, 0x1

    .line 385
    .line 386
    goto :goto_6

    .line 387
    :cond_d
    :goto_8
    iget-object v1, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 388
    .line 389
    const-string v2, "PPS: second_chroma_qp_index_offset"

    .line 390
    .line 391
    invoke-virtual {v0, v2}, Ll/as3;->h(Ljava/lang/String;)I

    .line 392
    .line 393
    .line 394
    move-result v2

    .line 395
    iput v2, v1, Ll/rp70$a;->c:I

    .line 396
    .line 397
    :cond_e
    invoke-virtual {v0}, Ll/as3;->i()V

    .line 398
    .line 399
    .line 400
    return-object p0
.end method


# virtual methods
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
    if-nez p1, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    if-eq v2, v3, :cond_2

    .line 18
    .line 19
    return v1

    .line 20
    :cond_2
    check-cast p1, Ll/rp70;

    .line 21
    .line 22
    iget-object v2, p0, Ll/rp70;->s:[I

    .line 23
    .line 24
    iget-object v3, p1, Ll/rp70;->s:[I

    .line 25
    .line 26
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_3

    .line 31
    .line 32
    return v1

    .line 33
    :cond_3
    iget v2, p0, Ll/rp70;->n:I

    .line 34
    .line 35
    iget v3, p1, Ll/rp70;->n:I

    .line 36
    .line 37
    if-eq v2, v3, :cond_4

    .line 38
    .line 39
    return v1

    .line 40
    :cond_4
    iget-boolean v2, p0, Ll/rp70;->p:Z

    .line 41
    .line 42
    iget-boolean v3, p1, Ll/rp70;->p:Z

    .line 43
    .line 44
    if-eq v2, v3, :cond_5

    .line 45
    .line 46
    return v1

    .line 47
    :cond_5
    iget-boolean v2, p0, Ll/rp70;->o:Z

    .line 48
    .line 49
    iget-boolean v3, p1, Ll/rp70;->o:Z

    .line 50
    .line 51
    if-eq v2, v3, :cond_6

    .line 52
    .line 53
    return v1

    .line 54
    :cond_6
    iget-boolean v2, p0, Ll/rp70;->a:Z

    .line 55
    .line 56
    iget-boolean v3, p1, Ll/rp70;->a:Z

    .line 57
    .line 58
    if-eq v2, v3, :cond_7

    .line 59
    .line 60
    return v1

    .line 61
    :cond_7
    iget-object v2, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 62
    .line 63
    iget-object v3, p1, Ll/rp70;->w:Ll/rp70$a;

    .line 64
    .line 65
    if-nez v2, :cond_8

    .line 66
    .line 67
    if-eqz v3, :cond_9

    .line 68
    .line 69
    return v1

    .line 70
    :cond_8
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-nez v2, :cond_9

    .line 75
    .line 76
    return v1

    .line 77
    :cond_9
    iget v2, p0, Ll/rp70;->b:I

    .line 78
    .line 79
    iget v3, p1, Ll/rp70;->b:I

    .line 80
    .line 81
    if-eq v2, v3, :cond_a

    .line 82
    .line 83
    return v1

    .line 84
    :cond_a
    iget v2, p0, Ll/rp70;->c:I

    .line 85
    .line 86
    iget v3, p1, Ll/rp70;->c:I

    .line 87
    .line 88
    if-eq v2, v3, :cond_b

    .line 89
    .line 90
    return v1

    .line 91
    :cond_b
    iget v2, p0, Ll/rp70;->h:I

    .line 92
    .line 93
    iget v3, p1, Ll/rp70;->h:I

    .line 94
    .line 95
    if-eq v2, v3, :cond_c

    .line 96
    .line 97
    return v1

    .line 98
    :cond_c
    iget v2, p0, Ll/rp70;->l:I

    .line 99
    .line 100
    iget v3, p1, Ll/rp70;->l:I

    .line 101
    .line 102
    if-eq v2, v3, :cond_d

    .line 103
    .line 104
    return v1

    .line 105
    :cond_d
    iget v2, p0, Ll/rp70;->m:I

    .line 106
    .line 107
    iget v3, p1, Ll/rp70;->m:I

    .line 108
    .line 109
    if-eq v2, v3, :cond_e

    .line 110
    .line 111
    return v1

    .line 112
    :cond_e
    iget-boolean v2, p0, Ll/rp70;->g:Z

    .line 113
    .line 114
    iget-boolean v3, p1, Ll/rp70;->g:Z

    .line 115
    .line 116
    if-eq v2, v3, :cond_f

    .line 117
    .line 118
    return v1

    .line 119
    :cond_f
    iget v2, p0, Ll/rp70;->e:I

    .line 120
    .line 121
    iget v3, p1, Ll/rp70;->e:I

    .line 122
    .line 123
    if-eq v2, v3, :cond_10

    .line 124
    .line 125
    return v1

    .line 126
    :cond_10
    iget-boolean v2, p0, Ll/rp70;->q:Z

    .line 127
    .line 128
    iget-boolean v3, p1, Ll/rp70;->q:Z

    .line 129
    .line 130
    if-eq v2, v3, :cond_11

    .line 131
    .line 132
    return v1

    .line 133
    :cond_11
    iget-object v2, p0, Ll/rp70;->t:[I

    .line 134
    .line 135
    iget-object v3, p1, Ll/rp70;->t:[I

    .line 136
    .line 137
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-nez v2, :cond_12

    .line 142
    .line 143
    return v1

    .line 144
    :cond_12
    iget v2, p0, Ll/rp70;->f:I

    .line 145
    .line 146
    iget v3, p1, Ll/rp70;->f:I

    .line 147
    .line 148
    if-eq v2, v3, :cond_13

    .line 149
    .line 150
    return v1

    .line 151
    :cond_13
    iget-boolean v2, p0, Ll/rp70;->u:Z

    .line 152
    .line 153
    iget-boolean v3, p1, Ll/rp70;->u:Z

    .line 154
    .line 155
    if-eq v2, v3, :cond_14

    .line 156
    .line 157
    return v1

    .line 158
    :cond_14
    iget v2, p0, Ll/rp70;->d:I

    .line 159
    .line 160
    iget v3, p1, Ll/rp70;->d:I

    .line 161
    .line 162
    if-eq v2, v3, :cond_15

    .line 163
    .line 164
    return v1

    .line 165
    :cond_15
    iget-object v2, p0, Ll/rp70;->v:[I

    .line 166
    .line 167
    iget-object v3, p1, Ll/rp70;->v:[I

    .line 168
    .line 169
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-nez v2, :cond_16

    .line 174
    .line 175
    return v1

    .line 176
    :cond_16
    iget v2, p0, Ll/rp70;->i:I

    .line 177
    .line 178
    iget v3, p1, Ll/rp70;->i:I

    .line 179
    .line 180
    if-eq v2, v3, :cond_17

    .line 181
    .line 182
    return v1

    .line 183
    :cond_17
    iget-object v2, p0, Ll/rp70;->r:[I

    .line 184
    .line 185
    iget-object v3, p1, Ll/rp70;->r:[I

    .line 186
    .line 187
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-nez v2, :cond_18

    .line 192
    .line 193
    return v1

    .line 194
    :cond_18
    iget v2, p0, Ll/rp70;->k:I

    .line 195
    .line 196
    iget v3, p1, Ll/rp70;->k:I

    .line 197
    .line 198
    if-eq v2, v3, :cond_19

    .line 199
    .line 200
    return v1

    .line 201
    :cond_19
    iget-boolean p0, p0, Ll/rp70;->j:Z

    .line 202
    .line 203
    iget-boolean p1, p1, Ll/rp70;->j:Z

    .line 204
    .line 205
    if-eq p0, p1, :cond_1a

    .line 206
    .line 207
    return v1

    .line 208
    :cond_1a
    return v0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rp70;->s:[I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x1f

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/2addr v0, v1

    .line 11
    iget v2, p0, Ll/rp70;->n:I

    .line 12
    .line 13
    add-int/2addr v0, v2

    .line 14
    mul-int/2addr v0, v1

    .line 15
    iget-boolean v2, p0, Ll/rp70;->p:Z

    .line 16
    .line 17
    const/16 v3, 0x4d5

    .line 18
    .line 19
    const/16 v4, 0x4cf

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    move v2, v4

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v2, v3

    .line 26
    :goto_0
    add-int/2addr v0, v2

    .line 27
    mul-int/2addr v0, v1

    .line 28
    iget-boolean v2, p0, Ll/rp70;->o:Z

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    move v2, v4

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v2, v3

    .line 35
    :goto_1
    add-int/2addr v0, v2

    .line 36
    mul-int/2addr v0, v1

    .line 37
    iget-boolean v2, p0, Ll/rp70;->a:Z

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    move v2, v4

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v2, v3

    .line 44
    :goto_2
    add-int/2addr v0, v2

    .line 45
    mul-int/2addr v0, v1

    .line 46
    iget-object v2, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 47
    .line 48
    if-nez v2, :cond_3

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    goto :goto_3

    .line 52
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    :goto_3
    add-int/2addr v0, v2

    .line 57
    mul-int/2addr v0, v1

    .line 58
    iget v2, p0, Ll/rp70;->b:I

    .line 59
    .line 60
    add-int/2addr v0, v2

    .line 61
    mul-int/2addr v0, v1

    .line 62
    iget v2, p0, Ll/rp70;->c:I

    .line 63
    .line 64
    add-int/2addr v0, v2

    .line 65
    mul-int/2addr v0, v1

    .line 66
    iget v2, p0, Ll/rp70;->h:I

    .line 67
    .line 68
    add-int/2addr v0, v2

    .line 69
    mul-int/2addr v0, v1

    .line 70
    iget v2, p0, Ll/rp70;->l:I

    .line 71
    .line 72
    add-int/2addr v0, v2

    .line 73
    mul-int/2addr v0, v1

    .line 74
    iget v2, p0, Ll/rp70;->m:I

    .line 75
    .line 76
    add-int/2addr v0, v2

    .line 77
    mul-int/2addr v0, v1

    .line 78
    iget-boolean v2, p0, Ll/rp70;->g:Z

    .line 79
    .line 80
    if-eqz v2, :cond_4

    .line 81
    .line 82
    move v2, v4

    .line 83
    goto :goto_4

    .line 84
    :cond_4
    move v2, v3

    .line 85
    :goto_4
    add-int/2addr v0, v2

    .line 86
    mul-int/2addr v0, v1

    .line 87
    iget v2, p0, Ll/rp70;->e:I

    .line 88
    .line 89
    add-int/2addr v0, v2

    .line 90
    mul-int/2addr v0, v1

    .line 91
    iget-boolean v2, p0, Ll/rp70;->q:Z

    .line 92
    .line 93
    if-eqz v2, :cond_5

    .line 94
    .line 95
    move v2, v4

    .line 96
    goto :goto_5

    .line 97
    :cond_5
    move v2, v3

    .line 98
    :goto_5
    add-int/2addr v0, v2

    .line 99
    mul-int/2addr v0, v1

    .line 100
    iget-object v2, p0, Ll/rp70;->t:[I

    .line 101
    .line 102
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([I)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    add-int/2addr v0, v2

    .line 107
    mul-int/2addr v0, v1

    .line 108
    iget v2, p0, Ll/rp70;->f:I

    .line 109
    .line 110
    add-int/2addr v0, v2

    .line 111
    mul-int/2addr v0, v1

    .line 112
    iget-boolean v2, p0, Ll/rp70;->u:Z

    .line 113
    .line 114
    if-eqz v2, :cond_6

    .line 115
    .line 116
    move v2, v4

    .line 117
    goto :goto_6

    .line 118
    :cond_6
    move v2, v3

    .line 119
    :goto_6
    add-int/2addr v0, v2

    .line 120
    mul-int/2addr v0, v1

    .line 121
    iget v2, p0, Ll/rp70;->d:I

    .line 122
    .line 123
    add-int/2addr v0, v2

    .line 124
    mul-int/2addr v0, v1

    .line 125
    iget-object v2, p0, Ll/rp70;->v:[I

    .line 126
    .line 127
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([I)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    add-int/2addr v0, v2

    .line 132
    mul-int/2addr v0, v1

    .line 133
    iget v2, p0, Ll/rp70;->i:I

    .line 134
    .line 135
    add-int/2addr v0, v2

    .line 136
    mul-int/2addr v0, v1

    .line 137
    iget-object v2, p0, Ll/rp70;->r:[I

    .line 138
    .line 139
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([I)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    add-int/2addr v0, v2

    .line 144
    mul-int/2addr v0, v1

    .line 145
    iget v2, p0, Ll/rp70;->k:I

    .line 146
    .line 147
    add-int/2addr v0, v2

    .line 148
    mul-int/2addr v0, v1

    .line 149
    iget-boolean p0, p0, Ll/rp70;->j:Z

    .line 150
    .line 151
    if-eqz p0, :cond_7

    .line 152
    .line 153
    move v3, v4

    .line 154
    :cond_7
    add-int/2addr v0, v3

    .line 155
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PictureParameterSet{\n       entropy_coding_mode_flag="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/rp70;->a:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",\n       num_ref_idx_l0_active_minus1="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/rp70;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",\n       num_ref_idx_l1_active_minus1="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/rp70;->c:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ",\n       slice_group_change_rate_minus1="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/rp70;->d:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ",\n       pic_parameter_set_id="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/rp70;->e:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",\n       seq_parameter_set_id="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/rp70;->f:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ",\n       pic_order_present_flag="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Ll/rp70;->g:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ",\n       num_slice_groups_minus1="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/rp70;->h:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ",\n       slice_group_map_type="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/rp70;->i:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ",\n       weighted_pred_flag="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-boolean v1, p0, Ll/rp70;->j:Z

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ",\n       weighted_bipred_idc="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Ll/rp70;->k:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ",\n       pic_init_qp_minus26="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Ll/rp70;->l:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ",\n       pic_init_qs_minus26="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Ll/rp70;->m:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ",\n       chroma_qp_index_offset="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget v1, p0, Ll/rp70;->n:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ",\n       deblocking_filter_control_present_flag="

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-boolean v1, p0, Ll/rp70;->o:Z

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ",\n       constrained_intra_pred_flag="

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-boolean v1, p0, Ll/rp70;->p:Z

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, ",\n       redundant_pic_cnt_present_flag="

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-boolean v1, p0, Ll/rp70;->q:Z

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, ",\n       top_left="

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-object v1, p0, Ll/rp70;->r:[I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, ",\n       bottom_right="

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Ll/rp70;->s:[I

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v1, ",\n       run_length_minus1="

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Ll/rp70;->t:[I

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v1, ",\n       slice_group_change_direction_flag="

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-boolean v1, p0, Ll/rp70;->u:Z

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v1, ",\n       slice_group_id="

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Ll/rp70;->v:[I

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v1, ",\n       extended="

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Ll/rp70;->w:Ll/rp70$a;

    .line 229
    .line 230
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const/16 p0, 0x7d

    .line 234
    .line 235
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    return-object p0
.end method
