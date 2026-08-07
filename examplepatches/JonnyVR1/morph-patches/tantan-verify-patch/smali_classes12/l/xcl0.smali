.class public Ll/xcl0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xcl0$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:I

.field private E:F

.field private F:F

.field private final a:I

.field private final b:I

.field private c:I

.field private d:J

.field private final e:I

.field private final f:I

.field private g:I

.field private h:J

.field private i:J

.field protected j:J

.field protected k:J

.field private l:Z

.field private m:Z

.field private n:Z

.field private o:Ll/qvf0;

.field p:Ll/n410$r;

.field protected q:Ll/xcl0$a;

.field private r:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private s:Ljava/lang/Object;

.field private t:Ljava/lang/Object;

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:J


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xcl0;->a:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Ll/xcl0;->b:I

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    iput-wide v1, p0, Ll/xcl0;->d:J

    .line 13
    .line 14
    const/4 v3, 0x5

    .line 15
    iput v3, p0, Ll/xcl0;->e:I

    .line 16
    .line 17
    const/4 v3, -0x1

    .line 18
    iput v3, p0, Ll/xcl0;->f:I

    .line 19
    .line 20
    iput v0, p0, Ll/xcl0;->g:I

    .line 21
    .line 22
    iput-wide v1, p0, Ll/xcl0;->h:J

    .line 23
    .line 24
    const-wide/16 v4, -0x1

    .line 25
    .line 26
    iput-wide v4, p0, Ll/xcl0;->i:J

    .line 27
    .line 28
    iput-wide v1, p0, Ll/xcl0;->j:J

    .line 29
    .line 30
    iput-wide v1, p0, Ll/xcl0;->k:J

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/xcl0;->l:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/xcl0;->m:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/xcl0;->n:Z

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    iput-object v4, p0, Ll/xcl0;->q:Ll/xcl0$a;

    .line 40
    .line 41
    new-instance v4, Ljava/util/LinkedList;

    .line 42
    .line 43
    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v4, p0, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 47
    .line 48
    iput v0, p0, Ll/xcl0;->u:I

    .line 49
    .line 50
    iput v3, p0, Ll/xcl0;->v:I

    .line 51
    .line 52
    iput v0, p0, Ll/xcl0;->w:I

    .line 53
    .line 54
    iput v3, p0, Ll/xcl0;->x:I

    .line 55
    .line 56
    const/16 v3, 0x1f4

    .line 57
    .line 58
    iput v3, p0, Ll/xcl0;->y:I

    .line 59
    .line 60
    iput-wide v1, p0, Ll/xcl0;->z:J

    .line 61
    .line 62
    iput v0, p0, Ll/xcl0;->A:I

    .line 63
    .line 64
    iput v0, p0, Ll/xcl0;->B:I

    .line 65
    .line 66
    iput v0, p0, Ll/xcl0;->C:I

    .line 67
    .line 68
    iput v0, p0, Ll/xcl0;->D:I

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    iput v0, p0, Ll/xcl0;->F:F

    .line 72
    .line 73
    new-instance v0, Ljava/lang/Object;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ll/xcl0;->s:Ljava/lang/Object;

    .line 79
    .line 80
    new-instance v0, Ljava/lang/Object;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Ll/xcl0;->t:Ljava/lang/Object;

    .line 86
    .line 87
    return-void
.end method

.method private declared-synchronized B()V
    .locals 25

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget v0, v1, Ll/xcl0;->v:I

    .line 5
    .line 6
    const/4 v2, -0x1

    .line 7
    const/4 v3, 0x1

    .line 8
    if-eq v0, v2, :cond_0

    .line 9
    .line 10
    iget v2, v1, Ll/xcl0;->u:I

    .line 11
    .line 12
    if-lt v2, v0, :cond_0

    .line 13
    .line 14
    iget v0, v1, Ll/xcl0;->D:I

    .line 15
    .line 16
    add-int/2addr v0, v3

    .line 17
    iput v0, v1, Ll/xcl0;->D:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto/16 :goto_12

    .line 23
    .line 24
    :cond_0
    :try_start_1
    iget-object v2, v1, Ll/xcl0;->s:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    :try_start_2
    iget-object v0, v1, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v4, 0x0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget-boolean v0, v1, Ll/xcl0;->n:Z

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-direct {v1}, Ll/xcl0;->t()V

    .line 41
    .line 42
    .line 43
    iput-boolean v4, v1, Ll/xcl0;->n:Z

    .line 44
    .line 45
    iget-object v0, v1, Ll/xcl0;->p:Ll/n410$r;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-interface {v0}, Ll/n410$r;->a()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_1
    move-exception v0

    .line 54
    goto/16 :goto_11

    .line 55
    .line 56
    :cond_1
    :goto_0
    const-string v0, "EditProcess"

    .line 57
    .line 58
    const-string v4, "VideoControllerPlayer Range finish"

    .line 59
    .line 60
    invoke-static {v0, v4}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget v0, v1, Ll/xcl0;->C:I

    .line 64
    .line 65
    add-int/2addr v0, v3

    .line 66
    iput v0, v1, Ll/xcl0;->C:I

    .line 67
    .line 68
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 69
    monitor-exit p0

    .line 70
    return-void

    .line 71
    :cond_3
    :try_start_3
    iget-object v0, v1, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 72
    .line 73
    const-wide/16 v5, -0x1

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-lez v0, :cond_4

    .line 82
    .line 83
    iget-object v0, v1, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Ljava/lang/Long;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 92
    .line 93
    .line 94
    move-result-wide v7

    .line 95
    goto :goto_1

    .line 96
    :cond_4
    move-wide v7, v5

    .line 97
    :goto_1
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 98
    :try_start_4
    iget-object v0, v1, Ll/xcl0;->o:Ll/qvf0;

    .line 99
    .line 100
    const-wide/16 v9, 0x0

    .line 101
    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    const/4 v2, 0x0

    .line 105
    invoke-virtual {v0, v2, v4, v7, v8}, Ll/qvf0;->e(Ljava/nio/Buffer;IJ)V

    .line 106
    .line 107
    .line 108
    iget-object v0, v1, Ll/xcl0;->o:Ll/qvf0;

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/qvf0;->d()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    cmp-long v2, v7, v9

    .line 115
    .line 116
    if-nez v2, :cond_5

    .line 117
    .line 118
    move v0, v3

    .line 119
    :cond_5
    iget-object v2, v1, Ll/xcl0;->o:Ll/qvf0;

    .line 120
    .line 121
    invoke-virtual {v2}, Ll/qvf0;->b()J

    .line 122
    .line 123
    .line 124
    move-result-wide v11

    .line 125
    if-gez v0, :cond_7

    .line 126
    .line 127
    iget-object v0, v1, Ll/xcl0;->p:Ll/n410$r;

    .line 128
    .line 129
    invoke-interface {v0, v4}, Ll/n410$r;->b(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 130
    .line 131
    .line 132
    monitor-exit p0

    .line 133
    return-void

    .line 134
    :cond_6
    move v0, v4

    .line 135
    move-wide v11, v7

    .line 136
    :cond_7
    :try_start_5
    iget-wide v13, v1, Ll/xcl0;->i:J

    .line 137
    .line 138
    cmp-long v2, v13, v9

    .line 139
    .line 140
    if-gez v2, :cond_8

    .line 141
    .line 142
    iput-wide v11, v1, Ll/xcl0;->i:J

    .line 143
    .line 144
    :cond_8
    iget-wide v13, v1, Ll/xcl0;->h:J

    .line 145
    .line 146
    cmp-long v2, v13, v9

    .line 147
    .line 148
    if-gtz v2, :cond_9

    .line 149
    .line 150
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 151
    .line 152
    .line 153
    move-result-wide v13

    .line 154
    iput-wide v13, v1, Ll/xcl0;->h:J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 155
    .line 156
    :cond_9
    :try_start_6
    iput-boolean v4, v1, Ll/xcl0;->l:Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 157
    .line 158
    move v2, v4

    .line 159
    :goto_2
    if-lez v0, :cond_a

    .line 160
    .line 161
    add-int/lit8 v0, v0, -0x1

    .line 162
    .line 163
    :cond_a
    move v13, v0

    .line 164
    cmp-long v0, v7, v9

    .line 165
    .line 166
    if-nez v0, :cond_b

    .line 167
    .line 168
    :try_start_7
    iput-wide v9, v1, Ll/xcl0;->k:J

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :catch_0
    move-exception v0

    .line 172
    goto/16 :goto_e

    .line 173
    .line 174
    :cond_b
    sget v0, Ll/qvf0;->k:I

    .line 175
    .line 176
    mul-int/2addr v0, v13

    .line 177
    int-to-long v14, v0

    .line 178
    sub-long v14, v11, v14

    .line 179
    .line 180
    iput-wide v14, v1, Ll/xcl0;->k:J

    .line 181
    .line 182
    :goto_3
    iget-object v0, v1, Ll/xcl0;->p:Ll/n410$r;

    .line 183
    .line 184
    const-wide/16 v14, 0x3e8

    .line 185
    .line 186
    if-eqz v0, :cond_c

    .line 187
    .line 188
    iget-wide v9, v1, Ll/xcl0;->k:J

    .line 189
    .line 190
    div-long/2addr v9, v14

    .line 191
    invoke-interface {v0, v9, v10}, Ll/n410$r;->c(J)V

    .line 192
    .line 193
    .line 194
    :cond_c
    iget v0, v1, Ll/xcl0;->g:I

    .line 195
    .line 196
    if-nez v0, :cond_19

    .line 197
    .line 198
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 199
    .line 200
    .line 201
    move-result-wide v9

    .line 202
    :goto_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 203
    .line 204
    .line 205
    move-result-wide v16

    .line 206
    move-wide/from16 v18, v14

    .line 207
    .line 208
    iget-wide v14, v1, Ll/xcl0;->h:J

    .line 209
    .line 210
    sub-long v16, v16, v14

    .line 211
    .line 212
    iget-wide v14, v1, Ll/xcl0;->k:J

    .line 213
    .line 214
    move/from16 v20, v3

    .line 215
    .line 216
    iget-wide v3, v1, Ll/xcl0;->i:J

    .line 217
    .line 218
    sub-long/2addr v14, v3

    .line 219
    div-long v14, v14, v18

    .line 220
    .line 221
    sub-long v3, v14, v16

    .line 222
    .line 223
    cmp-long v0, v3, v18

    .line 224
    .line 225
    if-lez v0, :cond_d

    .line 226
    .line 227
    iput-wide v5, v1, Ll/xcl0;->i:J

    .line 228
    .line 229
    iput-wide v5, v1, Ll/xcl0;->h:J

    .line 230
    .line 231
    :cond_d
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 232
    .line 233
    .line 234
    move-result-wide v3

    .line 235
    sub-long/2addr v3, v9

    .line 236
    const-wide/16 v21, 0xc8

    .line 237
    .line 238
    cmp-long v0, v3, v21

    .line 239
    .line 240
    if-ltz v0, :cond_e

    .line 241
    .line 242
    goto :goto_8

    .line 243
    :cond_e
    iget-wide v3, v1, Ll/xcl0;->k:J

    .line 244
    .line 245
    iget-wide v5, v1, Ll/xcl0;->j:J

    .line 246
    .line 247
    sub-long/2addr v3, v5

    .line 248
    const-wide/32 v5, -0x61a80

    .line 249
    .line 250
    .line 251
    cmp-long v0, v3, v5

    .line 252
    .line 253
    const-wide/32 v5, -0xc350

    .line 254
    .line 255
    .line 256
    if-gez v0, :cond_f

    .line 257
    .line 258
    const/high16 v0, 0x40400000    # 3.0f

    .line 259
    .line 260
    iput v0, v1, Ll/xcl0;->F:F

    .line 261
    .line 262
    goto :goto_5

    .line 263
    :cond_f
    const-wide/32 v23, -0x493e0

    .line 264
    .line 265
    .line 266
    cmp-long v0, v3, v23

    .line 267
    .line 268
    if-gez v0, :cond_10

    .line 269
    .line 270
    const/high16 v0, 0x3f800000    # 1.0f

    .line 271
    .line 272
    iput v0, v1, Ll/xcl0;->F:F

    .line 273
    .line 274
    goto :goto_5

    .line 275
    :cond_10
    const-wide/32 v23, -0x30d40

    .line 276
    .line 277
    .line 278
    cmp-long v0, v3, v23

    .line 279
    .line 280
    if-gez v0, :cond_11

    .line 281
    .line 282
    const/high16 v0, 0x3f000000    # 0.5f

    .line 283
    .line 284
    iput v0, v1, Ll/xcl0;->F:F

    .line 285
    .line 286
    goto :goto_8

    .line 287
    :cond_11
    cmp-long v0, v3, v5

    .line 288
    .line 289
    if-ltz v0, :cond_12

    .line 290
    .line 291
    const/4 v0, 0x0

    .line 292
    iput v0, v1, Ll/xcl0;->F:F
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 293
    .line 294
    :cond_12
    :goto_5
    cmp-long v0, v3, v5

    .line 295
    .line 296
    if-gez v0, :cond_13

    .line 297
    .line 298
    goto :goto_8

    .line 299
    :cond_13
    const-wide/16 v3, 0x5

    .line 300
    .line 301
    :try_start_8
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 302
    .line 303
    .line 304
    goto :goto_6

    .line 305
    :catch_1
    move-exception v0

    .line 306
    :try_start_9
    const-string v3, "VideoControllerPlayer"

    .line 307
    .line 308
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    .line 310
    .line 311
    :goto_6
    cmp-long v0, v16, v14

    .line 312
    .line 313
    if-ltz v0, :cond_18

    .line 314
    .line 315
    iget-wide v3, v1, Ll/xcl0;->k:J

    .line 316
    .line 317
    iget-wide v5, v1, Ll/xcl0;->j:J

    .line 318
    .line 319
    sub-long/2addr v3, v5

    .line 320
    const-wide/32 v5, 0xc350

    .line 321
    .line 322
    .line 323
    cmp-long v0, v3, v5

    .line 324
    .line 325
    if-lez v0, :cond_15

    .line 326
    .line 327
    iget-boolean v0, v1, Ll/xcl0;->l:Z

    .line 328
    .line 329
    if-eqz v0, :cond_14

    .line 330
    .line 331
    goto :goto_8

    .line 332
    :cond_14
    move-wide/from16 v14, v18

    .line 333
    .line 334
    move/from16 v3, v20

    .line 335
    .line 336
    :goto_7
    const/4 v4, 0x0

    .line 337
    const-wide/16 v5, -0x1

    .line 338
    .line 339
    goto/16 :goto_4

    .line 340
    .line 341
    :cond_15
    :goto_8
    invoke-virtual {v1}, Ll/xcl0;->m()Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-nez v0, :cond_17

    .line 346
    .line 347
    iget-object v0, v1, Ll/xcl0;->p:Ll/n410$r;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 348
    .line 349
    if-eqz v0, :cond_1d

    .line 350
    .line 351
    if-nez v2, :cond_16

    .line 352
    .line 353
    :try_start_a
    iget v2, v1, Ll/xcl0;->u:I

    .line 354
    .line 355
    add-int/lit8 v2, v2, 0x1

    .line 356
    .line 357
    iput v2, v1, Ll/xcl0;->u:I

    .line 358
    .line 359
    move/from16 v2, v20

    .line 360
    .line 361
    invoke-interface {v0, v2}, Ll/n410$r;->b(Z)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 362
    .line 363
    .line 364
    const/4 v2, 0x1

    .line 365
    goto :goto_9

    .line 366
    :catch_2
    move-exception v0

    .line 367
    const/4 v2, 0x1

    .line 368
    goto/16 :goto_e

    .line 369
    .line 370
    :cond_16
    :try_start_b
    invoke-interface {v0}, Ll/n410$r;->d()V

    .line 371
    .line 372
    .line 373
    :goto_9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 374
    .line 375
    .line 376
    move-result-wide v3

    .line 377
    iput-wide v3, v1, Ll/xcl0;->d:J

    .line 378
    .line 379
    iget v0, v1, Ll/xcl0;->A:I

    .line 380
    .line 381
    const/16 v20, 0x1

    .line 382
    .line 383
    add-int/lit8 v0, v0, 0x1

    .line 384
    .line 385
    iput v0, v1, Ll/xcl0;->A:I

    .line 386
    .line 387
    goto :goto_c

    .line 388
    :cond_17
    iget v0, v1, Ll/xcl0;->B:I

    .line 389
    .line 390
    const/16 v20, 0x1

    .line 391
    .line 392
    add-int/lit8 v0, v0, 0x1

    .line 393
    .line 394
    iput v0, v1, Ll/xcl0;->B:I

    .line 395
    .line 396
    goto :goto_c

    .line 397
    :cond_18
    move-wide/from16 v14, v18

    .line 398
    .line 399
    const/4 v3, 0x1

    .line 400
    goto :goto_7

    .line 401
    :cond_19
    iget v0, v1, Ll/xcl0;->c:I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 402
    .line 403
    if-nez v0, :cond_1a

    .line 404
    .line 405
    monitor-exit p0

    .line 406
    return-void

    .line 407
    :cond_1a
    const/16 v0, 0x1388

    .line 408
    .line 409
    const/4 v3, 0x0

    .line 410
    :try_start_c
    invoke-direct {v1, v3, v0}, Ll/xcl0;->C(II)V

    .line 411
    .line 412
    .line 413
    iget v0, v1, Ll/xcl0;->y:I

    .line 414
    .line 415
    const/4 v3, 0x1

    .line 416
    invoke-direct {v1, v3, v0}, Ll/xcl0;->C(II)V

    .line 417
    .line 418
    .line 419
    iget-object v3, v1, Ll/xcl0;->t:Ljava/lang/Object;

    .line 420
    .line 421
    monitor-enter v3
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 422
    :try_start_d
    iget-object v0, v1, Ll/xcl0;->p:Ll/n410$r;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 423
    .line 424
    if-eqz v0, :cond_1c

    .line 425
    .line 426
    if-nez v2, :cond_1b

    .line 427
    .line 428
    :try_start_e
    iget v2, v1, Ll/xcl0;->u:I

    .line 429
    .line 430
    const/4 v4, 0x1

    .line 431
    add-int/2addr v2, v4

    .line 432
    iput v2, v1, Ll/xcl0;->u:I

    .line 433
    .line 434
    iget v2, v1, Ll/xcl0;->w:I

    .line 435
    .line 436
    add-int/2addr v2, v4

    .line 437
    iput v2, v1, Ll/xcl0;->w:I

    .line 438
    .line 439
    invoke-interface {v0, v4}, Ll/n410$r;->b(Z)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 440
    .line 441
    .line 442
    const/4 v2, 0x1

    .line 443
    goto :goto_a

    .line 444
    :catchall_2
    move-exception v0

    .line 445
    const/4 v2, 0x1

    .line 446
    goto :goto_d

    .line 447
    :cond_1b
    :try_start_f
    invoke-interface {v0}, Ll/n410$r;->d()V

    .line 448
    .line 449
    .line 450
    :goto_a
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 451
    .line 452
    .line 453
    move-result-wide v4

    .line 454
    iput-wide v4, v1, Ll/xcl0;->d:J

    .line 455
    .line 456
    goto :goto_b

    .line 457
    :catchall_3
    move-exception v0

    .line 458
    goto :goto_d

    .line 459
    :cond_1c
    :goto_b
    iget v0, v1, Ll/xcl0;->u:I

    .line 460
    .line 461
    iput v0, v1, Ll/xcl0;->v:I

    .line 462
    .line 463
    iget v0, v1, Ll/xcl0;->w:I

    .line 464
    .line 465
    iput v0, v1, Ll/xcl0;->x:I

    .line 466
    .line 467
    monitor-exit v3

    .line 468
    :cond_1d
    :goto_c
    if-gtz v13, :cond_1e

    .line 469
    .line 470
    goto :goto_f

    .line 471
    :cond_1e
    move v0, v13

    .line 472
    const/4 v3, 0x1

    .line 473
    const/4 v4, 0x0

    .line 474
    const-wide/16 v5, -0x1

    .line 475
    .line 476
    const-wide/16 v9, 0x0

    .line 477
    .line 478
    goto/16 :goto_2

    .line 479
    .line 480
    :goto_d
    monitor-exit v3
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 481
    :try_start_10
    throw v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_0
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 482
    :catch_3
    move-exception v0

    .line 483
    const/4 v2, 0x0

    .line 484
    :goto_e
    :try_start_11
    const-string v3, "EditProcess"

    .line 485
    .line 486
    new-instance v4, Ljava/lang/StringBuilder;

    .line 487
    .line 488
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 489
    .line 490
    .line 491
    const-string v5, "VideoControllerPlayer videoRefresh failed !!!"

    .line 492
    .line 493
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v5

    .line 500
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    .line 502
    .line 503
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v4

    .line 507
    invoke-static {v3, v4}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    .line 509
    .line 510
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 511
    .line 512
    .line 513
    :goto_f
    if-nez v2, :cond_1f

    .line 514
    .line 515
    iget-object v0, v1, Ll/xcl0;->p:Ll/n410$r;

    .line 516
    .line 517
    if-eqz v0, :cond_1f

    .line 518
    .line 519
    const/4 v3, 0x0

    .line 520
    invoke-interface {v0, v3}, Ll/n410$r;->b(Z)V

    .line 521
    .line 522
    .line 523
    iget v0, v1, Ll/xcl0;->B:I

    .line 524
    .line 525
    const/16 v20, 0x1

    .line 526
    .line 527
    add-int/lit8 v0, v0, 0x1

    .line 528
    .line 529
    iput v0, v1, Ll/xcl0;->B:I

    .line 530
    .line 531
    :cond_1f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 532
    .line 533
    .line 534
    move-result-wide v2

    .line 535
    iget-wide v4, v1, Ll/xcl0;->z:J

    .line 536
    .line 537
    sub-long v4, v2, v4

    .line 538
    .line 539
    const-wide/16 v6, 0x7d0

    .line 540
    .line 541
    cmp-long v0, v4, v6

    .line 542
    .line 543
    if-ltz v0, :cond_20

    .line 544
    .line 545
    iget-object v4, v1, Ll/xcl0;->s:Ljava/lang/Object;

    .line 546
    .line 547
    monitor-enter v4
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 548
    :try_start_12
    iget-object v0, v1, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 549
    .line 550
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 551
    .line 552
    .line 553
    move-result v0

    .line 554
    monitor-exit v4
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    .line 555
    :try_start_13
    const-string v4, "SeekDiag"

    .line 556
    .line 557
    new-instance v5, Ljava/lang/StringBuilder;

    .line 558
    .line 559
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 560
    .line 561
    .line 562
    const-string v6, "VCP state="

    .line 563
    .line 564
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    .line 566
    .line 567
    iget v6, v1, Ll/xcl0;->c:I

    .line 568
    .line 569
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    const-string v6, " draw="

    .line 573
    .line 574
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    .line 576
    .line 577
    iget v6, v1, Ll/xcl0;->A:I

    .line 578
    .line 579
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    const-string v6, " skip="

    .line 583
    .line 584
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    iget v6, v1, Ll/xcl0;->B:I

    .line 588
    .line 589
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    const-string v6, " empty="

    .line 593
    .line 594
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    iget v6, v1, Ll/xcl0;->C:I

    .line 598
    .line 599
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    const-string v6, " blocked="

    .line 603
    .line 604
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    .line 606
    .line 607
    iget v6, v1, Ll/xcl0;->D:I

    .line 608
    .line 609
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    const-string v6, " queue="

    .line 613
    .line 614
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 615
    .line 616
    .line 617
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 618
    .line 619
    .line 620
    const-string v0, " lostSteps="

    .line 621
    .line 622
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 623
    .line 624
    .line 625
    iget v0, v1, Ll/xcl0;->F:F

    .line 626
    .line 627
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 628
    .line 629
    .line 630
    const-string v0, " audioPts="

    .line 631
    .line 632
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 633
    .line 634
    .line 635
    iget-wide v6, v1, Ll/xcl0;->j:J

    .line 636
    .line 637
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    const-string v0, " videoPts="

    .line 641
    .line 642
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    .line 644
    .line 645
    iget-wide v6, v1, Ll/xcl0;->k:J

    .line 646
    .line 647
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 648
    .line 649
    .line 650
    const-string v0, " targetFC="

    .line 651
    .line 652
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 653
    .line 654
    .line 655
    iget v0, v1, Ll/xcl0;->v:I

    .line 656
    .line 657
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 658
    .line 659
    .line 660
    const-string v0, " renderFC="

    .line 661
    .line 662
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    iget v0, v1, Ll/xcl0;->u:I

    .line 666
    .line 667
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 668
    .line 669
    .line 670
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    .line 676
    .line 677
    iput-wide v2, v1, Ll/xcl0;->z:J

    .line 678
    .line 679
    const/4 v3, 0x0

    .line 680
    iput v3, v1, Ll/xcl0;->A:I

    .line 681
    .line 682
    iput v3, v1, Ll/xcl0;->B:I

    .line 683
    .line 684
    iput v3, v1, Ll/xcl0;->C:I

    .line 685
    .line 686
    iput v3, v1, Ll/xcl0;->D:I
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 687
    .line 688
    goto :goto_10

    .line 689
    :catchall_4
    move-exception v0

    .line 690
    :try_start_14
    monitor-exit v4
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    .line 691
    :try_start_15
    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    .line 692
    :cond_20
    :goto_10
    monitor-exit p0

    .line 693
    return-void

    .line 694
    :goto_11
    :try_start_16
    monitor-exit v2
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_1

    .line 695
    :try_start_17
    throw v0

    .line 696
    :goto_12
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    .line 697
    throw v0
.end method

.method private C(II)V
    .locals 6

    .line 1
    :cond_0
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Ll/xcl0;->v:I

    .line 4
    .line 5
    iget v1, p0, Ll/xcl0;->u:I

    .line 6
    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_1
    iget v0, p0, Ll/xcl0;->x:I

    .line 11
    .line 12
    iget v1, p0, Ll/xcl0;->w:I

    .line 13
    .line 14
    if-eq v0, v1, :cond_2

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p0, Ll/xcl0;->d:J

    .line 22
    .line 23
    sub-long v2, v0, v2

    .line 24
    .line 25
    int-to-long v4, p2

    .line 26
    cmp-long v2, v2, v4

    .line 27
    .line 28
    const-string v3, "VideoControllerPlayer"

    .line 29
    .line 30
    if-lez v2, :cond_4

    .line 31
    .line 32
    invoke-direct {p0}, Ll/xcl0;->t()V

    .line 33
    .line 34
    .line 35
    iput-wide v0, p0, Ll/xcl0;->d:J

    .line 36
    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v0, "VideoControllerPlayer reset error, because:"

    .line 40
    .line 41
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    const-string p1, "render"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const-string p1, "encoder"

    .line 50
    .line 51
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p1, " timeoutInMs:"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v3, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_4
    const-wide/16 v0, 0x5

    .line 71
    .line 72
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :catch_0
    move-exception v0

    .line 77
    invoke-static {v3, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :goto_1
    iget-boolean v0, p0, Ll/xcl0;->l:Z

    .line 81
    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    iget v0, p0, Ll/xcl0;->c:I

    .line 85
    .line 86
    const/4 v1, 0x1

    .line 87
    if-eq v0, v1, :cond_0

    .line 88
    .line 89
    :cond_5
    :goto_2
    return-void
.end method

.method public static synthetic a(Ll/xcl0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xcl0;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/xcl0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xcl0;->m:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/xcl0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcl0;->s:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/xcl0;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/xcl0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xcl0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ll/xcl0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xcl0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic g(Ll/xcl0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/xcl0;->d:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic h(Ll/xcl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xcl0;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/xcl0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xcl0;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ll/xcl0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xcl0;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ll/xcl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xcl0;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private declared-synchronized t()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    const-wide/16 v0, 0x0

    .line 3
    .line 4
    :try_start_0
    iput-wide v0, p0, Ll/xcl0;->d:J

    .line 5
    .line 6
    const-wide/16 v2, -0x1

    .line 7
    .line 8
    iput-wide v2, p0, Ll/xcl0;->i:J

    .line 9
    .line 10
    iput-wide v0, p0, Ll/xcl0;->h:J

    .line 11
    .line 12
    iput-wide v0, p0, Ll/xcl0;->j:J

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Ll/xcl0;->u:I

    .line 16
    .line 17
    const/4 v1, -0x1

    .line 18
    iput v1, p0, Ll/xcl0;->v:I

    .line 19
    .line 20
    iput v0, p0, Ll/xcl0;->w:I

    .line 21
    .line 22
    iput v1, p0, Ll/xcl0;->x:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method


# virtual methods
.method public declared-synchronized A()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "EditProcess"

    .line 3
    .line 4
    const-string v1, "VideoControllerPlayer start !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/xcl0;->q:Ll/xcl0$a;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/xcl0$a;

    .line 14
    .line 15
    const-string v1, "CodecPlayerThread"

    .line 16
    .line 17
    invoke-direct {v0, p0, v1}, Ll/xcl0$a;-><init>(Ll/xcl0;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/xcl0;->q:Ll/xcl0$a;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw v0
.end method

.method public l(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xcl0;->s:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const-wide/16 v1, -0x1

    .line 5
    .line 6
    cmp-long v1, p1, v1

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    :try_start_0
    iput-boolean p1, p0, Ll/xcl0;->n:Z

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public m()Z
    .locals 3

    .line 1
    iget v0, p0, Ll/xcl0;->E:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpg-float v2, v0, v1

    .line 6
    .line 7
    if-gez v2, :cond_0

    .line 8
    .line 9
    iget v1, p0, Ll/xcl0;->F:F

    .line 10
    .line 11
    add-float/2addr v0, v1

    .line 12
    iput v0, p0, Ll/xcl0;->E:F

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    sub-float/2addr v0, v1

    .line 17
    iput v0, p0, Ll/xcl0;->E:F

    .line 18
    .line 19
    cmpg-float v0, v0, v1

    .line 20
    .line 21
    if-gez v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Ll/xcl0;->E:F

    .line 25
    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public declared-synchronized n()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "EditProcess"

    .line 3
    .line 4
    const-string v1, "VideoControllerPlayer clearCache !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/xcl0;->o:Ll/qvf0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/qvf0;->a()Z

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/xcl0;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method

.method public o()V
    .locals 3

    .line 1
    iget v0, p0, Ll/xcl0;->g:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/xcl0;->t:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget v2, p0, Ll/xcl0;->w:I

    .line 10
    .line 11
    add-int/2addr v2, v1

    .line 12
    iput v2, p0, Ll/xcl0;->x:I

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0

    .line 19
    :cond_0
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xcl0;->t:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/xcl0;->u:I

    .line 5
    .line 6
    add-int/lit8 v1, v1, 0x1

    .line 7
    .line 8
    iput v1, p0, Ll/xcl0;->v:I

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

.method public declared-synchronized q()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "EditProcess"

    .line 3
    .line 4
    const-string v1, "VideoControllerPlayer pause !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/xcl0;->c:I

    .line 11
    .line 12
    iget v0, p0, Ll/xcl0;->u:I

    .line 13
    .line 14
    iput v0, p0, Ll/xcl0;->v:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public r()V
    .locals 2

    .line 1
    const-string v0, "EditProcess"

    .line 2
    .line 3
    const-string v1, "VideoControllerPlayer pause !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/xcl0;->c:I

    .line 10
    .line 11
    iget v0, p0, Ll/xcl0;->u:I

    .line 12
    .line 13
    iput v0, p0, Ll/xcl0;->v:I

    .line 14
    .line 15
    return-void
.end method

.method public declared-synchronized s()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "EditProcess"

    .line 3
    .line 4
    const-string v1, "VideoControllerPlayer release !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/xcl0;->c:I

    .line 11
    .line 12
    iget-object v0, p0, Ll/xcl0;->s:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    :try_start_1
    iget-object v1, p0, Ll/xcl0;->r:Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 18
    .line 19
    .line 20
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    const/4 v0, 0x0

    .line 22
    :try_start_2
    iput-object v0, p0, Ll/xcl0;->p:Ll/n410$r;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput-boolean v1, p0, Ll/xcl0;->l:Z

    .line 26
    .line 27
    iget-object v1, p0, Ll/xcl0;->q:Ll/xcl0$a;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/xcl0$a;->a()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/xcl0;->q:Ll/xcl0$a;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :catchall_1
    move-exception v1

    .line 42
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 43
    :try_start_4
    throw v1

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 45
    throw v0
.end method

.method public declared-synchronized u()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "EditProcess"

    .line 3
    .line 4
    const-string v1, "VideoControllerPlayer resume !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput v0, p0, Ll/xcl0;->c:I

    .line 11
    .line 12
    invoke-direct {p0}, Ll/xcl0;->t()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public declared-synchronized v(Z)V
    .locals 3

    .line 1
    const-string v0, "VideoControllerPlayer seekResume !!!"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "EditProcess"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ll/xcl0;->t()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iput v0, p0, Ll/xcl0;->c:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const/4 p1, 0x0

    .line 33
    iput p1, p0, Ll/xcl0;->c:I

    .line 34
    .line 35
    iget p1, p0, Ll/xcl0;->u:I

    .line 36
    .line 37
    add-int/2addr p1, v0

    .line 38
    iput p1, p0, Ll/xcl0;->v:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    :goto_0
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p1
.end method

.method public w(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/xcl0;->j:J

    .line 2
    .line 3
    return-void
.end method

.method public x(Ll/n410$r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcl0;->p:Ll/n410$r;

    .line 2
    .line 3
    return-void
.end method

.method public y(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoControllerPlayer Set Render Model  "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "!!!"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "EditProcess"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput p1, p0, Ll/xcl0;->g:I

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Ll/xcl0;->n:Z

    .line 29
    .line 30
    return-void
.end method

.method public declared-synchronized z(Ll/qvf0;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    :try_start_0
    iput-object p1, p0, Ll/xcl0;->o:Ll/qvf0;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw p1

    .line 10
    :cond_0
    :goto_0
    monitor-exit p0

    .line 11
    return-void
.end method
