.class public Ll/ib4;
.super Ll/gb20;
.source "SourceFile"

# interfaces
.implements Ll/xpl$a;
.implements Ll/xpl$d;
.implements Ll/hql;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ib4$l;,
        Ll/ib4$k;,
        Ll/ib4$j;
    }
.end annotation


# instance fields
.field private A:Lcom/momocv/videoprocessor/VideoProcessor;

.field private B:Ll/umw;

.field private C:Ll/lnw;

.field private D:Z

.field private E:Ll/v94;

.field private E0:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private F:Ll/nx3;

.field private G:Ll/yuf;

.field H:Ll/ib4$k;

.field private I:I

.field private J:Landroid/graphics/SurfaceTexture;

.field private K:Ll/ib4$l;

.field private L:I

.field private M:I

.field N:Z

.field O:Landroid/graphics/Rect;

.field P:I

.field Q:I

.field R:I

.field S:I

.field private T:J

.field private U:Z

.field private V:Ljava/lang/Object;

.field private W:J

.field private X:I

.field private Y:[B

.field private Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

.field private f:Ll/xpl;

.field private g:Landroid/hardware/Camera;

.field private i:Ll/tow;

.field private j:Ll/g510;

.field private k:Z

.field private k0:Ll/lnw;

.field private l:Ll/row;

.field private m:Ll/xpl$d;

.field private n:Ljava/lang/Object;

.field o:Ll/q210$a;

.field private p:Landroid/os/HandlerThread;

.field private p0:[B

.field private q:Landroid/os/Handler;

.field private r:I

.field private s:Z

.field private t:Z

.field u:I

.field private v:J

.field private x:J

.field y:I

.field z:J


# direct methods
.method public constructor <init>(Ll/uow;Ll/q210$a;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/gb20;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ib4;->k:Z

    .line 6
    .line 7
    new-instance v1, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/ib4;->n:Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 16
    .line 17
    iput-object v1, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 18
    .line 19
    const/16 v2, 0xc8

    .line 20
    .line 21
    iput v2, p0, Ll/ib4;->r:I

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/ib4;->s:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/ib4;->t:Z

    .line 26
    .line 27
    iput v0, p0, Ll/ib4;->u:I

    .line 28
    .line 29
    const-wide/16 v2, 0x0

    .line 30
    .line 31
    iput-wide v2, p0, Ll/ib4;->v:J

    .line 32
    .line 33
    const-wide/16 v4, 0xf

    .line 34
    .line 35
    iput-wide v4, p0, Ll/ib4;->x:J

    .line 36
    .line 37
    const/16 v4, 0x3c

    .line 38
    .line 39
    iput v4, p0, Ll/ib4;->y:I

    .line 40
    .line 41
    iput-wide v2, p0, Ll/ib4;->z:J

    .line 42
    .line 43
    new-instance v4, Ll/umw;

    .line 44
    .line 45
    invoke-direct {v4}, Ll/umw;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v4, p0, Ll/ib4;->B:Ll/umw;

    .line 49
    .line 50
    new-instance v4, Ll/lnw;

    .line 51
    .line 52
    const/4 v5, 0x1

    .line 53
    invoke-direct {v4, v5}, Ll/lnw;-><init>(I)V

    .line 54
    .line 55
    .line 56
    iput-object v4, p0, Ll/ib4;->C:Ll/lnw;

    .line 57
    .line 58
    iput-object v1, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 59
    .line 60
    iput v0, p0, Ll/ib4;->I:I

    .line 61
    .line 62
    iput-object v1, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 63
    .line 64
    iput-object v1, p0, Ll/ib4;->K:Ll/ib4$l;

    .line 65
    .line 66
    iput-boolean v0, p0, Ll/ib4;->N:Z

    .line 67
    .line 68
    new-instance v1, Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-direct {v1, v0, v0, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 71
    .line 72
    .line 73
    iput-object v1, p0, Ll/ib4;->O:Landroid/graphics/Rect;

    .line 74
    .line 75
    iput v0, p0, Ll/ib4;->P:I

    .line 76
    .line 77
    iput v0, p0, Ll/ib4;->Q:I

    .line 78
    .line 79
    iput v0, p0, Ll/ib4;->R:I

    .line 80
    .line 81
    iput v0, p0, Ll/ib4;->S:I

    .line 82
    .line 83
    iput-boolean v0, p0, Ll/ib4;->U:Z

    .line 84
    .line 85
    new-instance v1, Ljava/lang/Object;

    .line 86
    .line 87
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v1, p0, Ll/ib4;->V:Ljava/lang/Object;

    .line 91
    .line 92
    iput-wide v2, p0, Ll/ib4;->W:J

    .line 93
    .line 94
    iput v0, p0, Ll/ib4;->X:I

    .line 95
    .line 96
    new-instance v0, Ll/lnw;

    .line 97
    .line 98
    const/4 v1, 0x5

    .line 99
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Ll/ib4;->k0:Ll/lnw;

    .line 103
    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 105
    .line 106
    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 107
    .line 108
    .line 109
    iput-object v0, p0, Ll/ib4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 110
    .line 111
    iput-object p2, p0, Ll/ib4;->o:Ll/q210$a;

    .line 112
    .line 113
    if-nez p1, :cond_0

    .line 114
    .line 115
    new-instance p2, Ll/tow;

    .line 116
    .line 117
    invoke-direct {p2}, Ll/tow;-><init>()V

    .line 118
    .line 119
    .line 120
    iput-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    iput-object p1, p0, Ll/ib4;->i:Ll/tow;

    .line 124
    .line 125
    :goto_0
    iget p1, p1, Ll/uow;->D0:I

    .line 126
    .line 127
    int-to-long p1, p1

    .line 128
    iput-wide p1, p0, Ll/ib4;->x:J

    .line 129
    .line 130
    new-instance p1, Ll/biw;

    .line 131
    .line 132
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 133
    .line 134
    invoke-direct {p1, p2}, Ll/biw;-><init>(Ll/tow;)V

    .line 135
    .line 136
    .line 137
    iput-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 138
    .line 139
    iput-boolean v5, p0, Ll/wej;->useNewViewPort:Z

    .line 140
    .line 141
    new-instance p1, Ll/v94;

    .line 142
    .line 143
    invoke-direct {p1}, Ll/v94;-><init>()V

    .line 144
    .line 145
    .line 146
    iput-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 147
    .line 148
    return-void
.end method

.method private D([B)V
    .locals 11

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/ib4;->K:Ll/ib4$l;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 9
    .line 10
    iget v2, v1, Ll/tow;->e:I

    .line 11
    .line 12
    iget v1, v1, Ll/tow;->f:I

    .line 13
    .line 14
    invoke-interface {v0, p1, v2, v1}, Ll/ib4$l;->K([BII)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Ll/ib4;->n:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v0

    .line 20
    :try_start_0
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 21
    .line 22
    if-eqz v1, :cond_15

    .line 23
    .line 24
    iget-boolean v1, p0, Ll/ib4;->t:Z

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    goto/16 :goto_7

    .line 29
    .line 30
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    iget-wide v3, p0, Ll/ib4;->T:J

    .line 35
    .line 36
    sub-long/2addr v1, v3

    .line 37
    const-wide/16 v3, 0x3e8

    .line 38
    .line 39
    cmp-long v1, v1, v3

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-lez v1, :cond_3

    .line 43
    .line 44
    iget-boolean v1, p0, Ll/ib4;->U:Z

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    iput-boolean v2, p0, Ll/ib4;->U:Z

    .line 49
    .line 50
    iput-boolean v2, p0, Ll/ib4;->N:Z

    .line 51
    .line 52
    invoke-direct {p0}, Ll/ib4;->n2()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto/16 :goto_8

    .line 58
    .line 59
    :cond_3
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    iget v1, p0, Ll/ib4;->L:I

    .line 64
    .line 65
    if-nez v1, :cond_5

    .line 66
    .line 67
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/row;->h()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/row;->h()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    int-to-long v7, v1

    .line 82
    div-long/2addr v3, v7

    .line 83
    goto :goto_1

    .line 84
    :cond_4
    const-wide/16 v3, 0x42

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_5
    int-to-long v7, v1

    .line 88
    div-long/2addr v3, v7

    .line 89
    :goto_1
    iget-wide v7, p0, Ll/ib4;->v:J

    .line 90
    .line 91
    sub-long/2addr v5, v7

    .line 92
    cmp-long v1, v5, v3

    .line 93
    .line 94
    if-ltz v1, :cond_14

    .line 95
    .line 96
    iget-boolean v1, p0, Ll/ib4;->s:Z

    .line 97
    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    goto/16 :goto_6

    .line 101
    .line 102
    :cond_6
    const-wide/16 v9, 0x0

    .line 103
    .line 104
    cmp-long v1, v7, v9

    .line 105
    .line 106
    if-eqz v1, :cond_8

    .line 107
    .line 108
    const-wide/16 v9, 0x5

    .line 109
    .line 110
    mul-long/2addr v9, v3

    .line 111
    cmp-long v1, v5, v9

    .line 112
    .line 113
    if-lez v1, :cond_7

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_7
    add-long/2addr v7, v3

    .line 117
    iput-wide v7, p0, Ll/ib4;->v:J

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_8
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    iput-wide v3, p0, Ll/ib4;->v:J

    .line 125
    .line 126
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    iput-wide v3, p0, Ll/ib4;->W:J

    .line 131
    .line 132
    new-instance v1, Ll/omw;

    .line 133
    .line 134
    invoke-direct {v1}, Ll/omw;-><init>()V

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Ll/ib4;->E:Ll/v94;

    .line 138
    .line 139
    invoke-virtual {v3}, Ll/v94;->m()Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    iget-object v4, p0, Ll/ib4;->Y:[B

    .line 144
    .line 145
    if-eqz v4, :cond_9

    .line 146
    .line 147
    array-length v4, v4

    .line 148
    array-length v5, p1

    .line 149
    if-eq v4, v5, :cond_a

    .line 150
    .line 151
    :cond_9
    array-length v4, p1

    .line 152
    new-array v4, v4, [B

    .line 153
    .line 154
    iput-object v4, p0, Ll/ib4;->Y:[B

    .line 155
    .line 156
    :cond_a
    iget-object v4, p0, Ll/ib4;->Y:[B

    .line 157
    .line 158
    array-length v5, p1

    .line 159
    invoke-static {p1, v2, v4, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    .line 161
    .line 162
    if-eqz v3, :cond_b

    .line 163
    .line 164
    iget-object v3, p0, Ll/ib4;->Y:[B

    .line 165
    .line 166
    invoke-direct {p0, v3, v1}, Ll/ib4;->l2([BLl/omw;)V

    .line 167
    .line 168
    .line 169
    goto :goto_4

    .line 170
    :cond_b
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->isUseFacerig()Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_c

    .line 175
    .line 176
    iget-object v3, p0, Ll/ib4;->Y:[B

    .line 177
    .line 178
    invoke-direct {p0, v3, v1}, Ll/ib4;->m2([BLl/omw;)V

    .line 179
    .line 180
    .line 181
    :cond_c
    :goto_4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 182
    .line 183
    .line 184
    move-result-wide v3

    .line 185
    iget-wide v5, p0, Ll/ib4;->W:J

    .line 186
    .line 187
    sub-long/2addr v3, v5

    .line 188
    iput-wide v3, p0, Ll/ib4;->z:J

    .line 189
    .line 190
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    iget-wide v4, p0, Ll/ib4;->z:J

    .line 195
    .line 196
    invoke-virtual {v3, v4, v5}, Ll/u6y;->e0(J)V

    .line 197
    .line 198
    .line 199
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->isUseBodyLand()Z

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    const/4 v4, 0x2

    .line 204
    if-eqz v3, :cond_f

    .line 205
    .line 206
    iget-object v3, p0, Ll/ib4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 207
    .line 208
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-eqz v3, :cond_f

    .line 213
    .line 214
    iget-object v3, p0, Ll/ib4;->p0:[B

    .line 215
    .line 216
    if-eqz v3, :cond_d

    .line 217
    .line 218
    array-length v3, v3

    .line 219
    array-length v5, p1

    .line 220
    if-ge v3, v5, :cond_e

    .line 221
    .line 222
    :cond_d
    array-length v3, p1

    .line 223
    new-array v3, v3, [B

    .line 224
    .line 225
    iput-object v3, p0, Ll/ib4;->p0:[B

    .line 226
    .line 227
    :cond_e
    iget-object v3, p0, Ll/ib4;->p0:[B

    .line 228
    .line 229
    array-length v5, p1

    .line 230
    invoke-static {p1, v2, v3, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/ib4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 234
    .line 235
    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 236
    .line 237
    .line 238
    new-instance p1, Ll/ib4$g;

    .line 239
    .line 240
    invoke-direct {p1, p0}, Ll/ib4$g;-><init>(Ll/ib4;)V

    .line 241
    .line 242
    .line 243
    invoke-static {v4, p1}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 244
    .line 245
    .line 246
    :cond_f
    iget-object p1, p0, Ll/ib4;->Y:[B

    .line 247
    .line 248
    invoke-direct {p0, v1, p1}, Ll/ib4;->v2(Ll/omw;[B)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-lez p1, :cond_10

    .line 256
    .line 257
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    const/4 v3, 0x1

    .line 262
    invoke-virtual {p1, v3}, Ll/u6y;->l0(Z)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-virtual {p1}, Ll/nuf;->p()[F

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    aget v6, p1, v2

    .line 278
    .line 279
    iget v7, v1, Ll/omw;->e:I

    .line 280
    .line 281
    int-to-float v8, v7

    .line 282
    div-float/2addr v6, v8

    .line 283
    aget v8, p1, v3

    .line 284
    .line 285
    iget v9, v1, Ll/omw;->f:I

    .line 286
    .line 287
    int-to-float v10, v9

    .line 288
    div-float/2addr v8, v10

    .line 289
    aget v10, p1, v4

    .line 290
    .line 291
    int-to-float v7, v7

    .line 292
    div-float/2addr v10, v7

    .line 293
    const/4 v7, 0x3

    .line 294
    aget p1, p1, v7

    .line 295
    .line 296
    int-to-float v7, v9

    .line 297
    div-float/2addr p1, v7

    .line 298
    invoke-virtual {v5, v6, v8, v10, p1}, Ll/u6y;->g0(FFFF)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p1}, Ll/nuf;->c()[F

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 310
    .line 311
    .line 312
    move-result-object v5

    .line 313
    aget v4, p1, v4

    .line 314
    .line 315
    aget v3, p1, v3

    .line 316
    .line 317
    aget p1, p1, v2

    .line 318
    .line 319
    invoke-virtual {v5, v4, v3, p1}, Ll/u6y;->f0(FFF)V

    .line 320
    .line 321
    .line 322
    goto :goto_5

    .line 323
    :cond_10
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    invoke-virtual {p1, v2}, Ll/u6y;->l0(Z)V

    .line 328
    .line 329
    .line 330
    :goto_5
    iget-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 331
    .line 332
    invoke-virtual {p1}, Ll/v94;->a()I

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    if-lez p1, :cond_11

    .line 337
    .line 338
    invoke-direct {p0, v1}, Ll/ib4;->i2(Ll/omw;)V

    .line 339
    .line 340
    .line 341
    :cond_11
    iget-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 342
    .line 343
    invoke-virtual {p1}, Ll/v94;->p()Z

    .line 344
    .line 345
    .line 346
    move-result p1

    .line 347
    if-eqz p1, :cond_12

    .line 348
    .line 349
    invoke-direct {p0, v1}, Ll/ib4;->k2(Ll/omw;)V

    .line 350
    .line 351
    .line 352
    :cond_12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 353
    .line 354
    .line 355
    move-result-wide v2

    .line 356
    iget-object p1, p0, Ll/ib4;->Y:[B

    .line 357
    .line 358
    invoke-direct {p0, v1, p1}, Ll/ib4;->u2(Ll/omw;[B)V

    .line 359
    .line 360
    .line 361
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 366
    .line 367
    .line 368
    move-result-wide v4

    .line 369
    sub-long/2addr v4, v2

    .line 370
    invoke-virtual {p1, v4, v5}, Ll/u6y;->b0(J)V

    .line 371
    .line 372
    .line 373
    iget-object p1, p0, Ll/ib4;->G:Ll/yuf;

    .line 374
    .line 375
    if-eqz p1, :cond_13

    .line 376
    .line 377
    invoke-virtual {v1}, Ll/omw;->l()[[B

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    if-eqz p1, :cond_13

    .line 382
    .line 383
    iget-object p0, p0, Ll/ib4;->G:Ll/yuf;

    .line 384
    .line 385
    invoke-virtual {v1}, Ll/omw;->l()[[B

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-interface {p0, p1}, Ll/yuf;->a([[B)V

    .line 390
    .line 391
    .line 392
    :cond_13
    monitor-exit v0

    .line 393
    return-void

    .line 394
    :cond_14
    :goto_6
    monitor-exit v0

    .line 395
    return-void

    .line 396
    :cond_15
    :goto_7
    monitor-exit v0

    .line 397
    return-void

    .line 398
    :goto_8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 399
    throw p0
.end method

.method public static synthetic V1(Ll/ib4;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ib4;->D([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W1(Ll/ib4;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->p0:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X1(Ll/ib4;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ib4;->I:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Y1(Ll/ib4;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/ib4;->I:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic Z1(Ll/ib4;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ib4;->j2([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Ll/ib4;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b2(Ll/ib4;)Ll/xpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c2(Ll/ib4;)Ll/tow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->i:Ll/tow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d2(Ll/ib4;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ib4;->t:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e2(Ll/ib4;Ll/ylg;)Ll/ylg;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public static synthetic f2(Ll/ib4;Ll/yuf;)Ll/yuf;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->G:Ll/yuf;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g2(Ll/ib4;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h2(Ll/ib4;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p1
.end method

.method private i2(Ll/omw;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "hasFace"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 28
    .line 29
    invoke-virtual {v0, v4, v3}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ib4;->E:Ll/v94;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/v94;->a()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget v3, p0, Ll/ib4;->P:I

    .line 39
    .line 40
    rem-int/2addr v3, v0

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    iput v2, p0, Ll/ib4;->P:I

    .line 44
    .line 45
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/nuf;->p()[F

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v3, p1, Ll/omw;->e:I

    .line 54
    .line 55
    int-to-float v5, v3

    .line 56
    iget v3, p1, Ll/omw;->f:I

    .line 57
    .line 58
    int-to-float v6, v3

    .line 59
    aget v7, v0, v2

    .line 60
    .line 61
    aget v8, v0, v1

    .line 62
    .line 63
    const/high16 v11, 0x3f800000    # 1.0f

    .line 64
    .line 65
    move v9, v7

    .line 66
    move v10, v8

    .line 67
    move-object v4, p0

    .line 68
    invoke-direct/range {v4 .. v11}, Ll/ib4;->o2(FFFFFFF)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    aget v3, v0, v2

    .line 76
    .line 77
    const/high16 v5, 0x40000000    # 2.0f

    .line 78
    .line 79
    mul-float/2addr v3, v5

    .line 80
    const/4 v6, 0x2

    .line 81
    aget v6, v0, v6

    .line 82
    .line 83
    add-float/2addr v3, v6

    .line 84
    const/high16 v6, 0x3f000000    # 0.5f

    .line 85
    .line 86
    mul-float/2addr v3, v6

    .line 87
    iget v7, p1, Ll/omw;->e:I

    .line 88
    .line 89
    int-to-float v7, v7

    .line 90
    div-float/2addr v3, v7

    .line 91
    aget v7, v0, v1

    .line 92
    .line 93
    mul-float/2addr v7, v5

    .line 94
    const/4 v5, 0x3

    .line 95
    aget v0, v0, v5

    .line 96
    .line 97
    add-float/2addr v7, v0

    .line 98
    mul-float/2addr v7, v6

    .line 99
    iget p1, p1, Ll/omw;->f:I

    .line 100
    .line 101
    int-to-float p1, p1

    .line 102
    div-float/2addr v7, p1

    .line 103
    invoke-virtual {p0, v3, v7}, Ll/u6y;->W(FF)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    move-object v4, p0

    .line 108
    :goto_0
    iget p0, v4, Ll/ib4;->P:I

    .line 109
    .line 110
    add-int/2addr p0, v1

    .line 111
    iput p0, v4, Ll/ib4;->P:I

    .line 112
    .line 113
    iput v2, v4, Ll/ib4;->Q:I

    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    move-object v4, p0

    .line 117
    iget p0, v4, Ll/ib4;->Q:I

    .line 118
    .line 119
    add-int/2addr p0, v1

    .line 120
    iput p0, v4, Ll/ib4;->Q:I

    .line 121
    .line 122
    iget p1, v4, Ll/ib4;->r:I

    .line 123
    .line 124
    if-ne p0, p1, :cond_2

    .line 125
    .line 126
    iput v2, v4, Ll/ib4;->Q:I

    .line 127
    .line 128
    invoke-virtual {v4}, Ll/ib4;->e()Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-eqz p0, :cond_2

    .line 133
    .line 134
    invoke-direct {v4}, Ll/ib4;->n2()V

    .line 135
    .line 136
    .line 137
    :cond_2
    return-void
.end method

.method private j2([B)V
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/ib4;->B:Ll/umw;

    .line 6
    .line 7
    const/16 v3, 0x11

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Ll/umw;->h(I)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/ib4;->B:Ll/umw;

    .line 13
    .line 14
    iget-object v3, p0, Ll/ib4;->i:Ll/tow;

    .line 15
    .line 16
    iget v3, v3, Ll/tow;->e:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ll/umw;->m(I)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/ib4;->B:Ll/umw;

    .line 22
    .line 23
    iget-object v3, p0, Ll/ib4;->i:Ll/tow;

    .line 24
    .line 25
    iget v3, v3, Ll/tow;->f:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ll/umw;->j(I)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/ib4;->B:Ll/umw;

    .line 31
    .line 32
    invoke-virtual {v2, p1}, Ll/umw;->g([B)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/ib4;->B:Ll/umw;

    .line 36
    .line 37
    array-length p1, p1

    .line 38
    invoke-virtual {v2, p1}, Ll/umw;->f(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/ib4;->B:Ll/umw;

    .line 42
    .line 43
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 44
    .line 45
    iget v2, v2, Ll/tow;->e:I

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Ll/umw;->l(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/ib4;->k0:Ll/lnw;

    .line 51
    .line 52
    invoke-direct {p0}, Ll/ib4;->r2()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {p1, v2}, Ll/lnw;->A(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/ib4;->k0:Ll/lnw;

    .line 60
    .line 61
    iget-object v2, p0, Ll/ib4;->f:Ll/xpl;

    .line 62
    .line 63
    invoke-interface {v2}, Ll/xpl;->m()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {p1, v2}, Ll/lnw;->z(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/ib4;->k0:Ll/lnw;

    .line 71
    .line 72
    iget-object v2, p0, Ll/ib4;->f:Ll/xpl;

    .line 73
    .line 74
    invoke-interface {v2}, Ll/xpl;->i()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-virtual {p1, v2}, Ll/lnw;->p(Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/ib4;->k0:Ll/lnw;

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-virtual {p1, v2}, Ll/lnw;->H(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/ib4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 88
    .line 89
    if-nez p1, :cond_0

    .line 90
    .line 91
    new-instance p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 92
    .line 93
    invoke-direct {p1}, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Ll/ib4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 97
    .line 98
    :cond_0
    iget-boolean p1, p0, Ll/ib4;->D:Z

    .line 99
    .line 100
    if-nez p1, :cond_1

    .line 101
    .line 102
    iget-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/v94;->c()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_1

    .line 113
    .line 114
    iget-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/v94;->l()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iget-object v3, p0, Ll/ib4;->E:Ll/v94;

    .line 121
    .line 122
    invoke-virtual {v3}, Ll/v94;->c()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {p1, v3}, Lcom/core/glcore/util/BodyLandHelper;->setModelTypeAndPath(ZLjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iput-boolean v2, p0, Ll/ib4;->D:Z

    .line 130
    .line 131
    :cond_1
    iget-object p1, p0, Ll/ib4;->B:Ll/umw;

    .line 132
    .line 133
    iget-object v2, p0, Ll/ib4;->k0:Ll/lnw;

    .line 134
    .line 135
    iget-object v3, p0, Ll/ib4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 136
    .line 137
    invoke-static {p1, v2, v3}, Lcom/core/glcore/util/BodyLandHelper;->process(Ll/umw;Ll/lnw;Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 141
    .line 142
    .line 143
    move-result-wide v2

    .line 144
    sub-long/2addr v2, v0

    .line 145
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1, v2, v3}, Ll/u6y;->V(J)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/ib4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 153
    .line 154
    invoke-static {p1}, Lcom/core/glcore/util/BodyLandHelper;->setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 155
    .line 156
    .line 157
    sget-boolean p1, Ll/im80;->a:Z

    .line 158
    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Ll/ib4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 164
    .line 165
    if-eqz p1, :cond_4

    .line 166
    .line 167
    array-length p1, p1

    .line 168
    if-lez p1, :cond_4

    .line 169
    .line 170
    new-instance p1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Ll/ib4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 176
    .line 177
    iget-object p0, p0, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 178
    .line 179
    array-length v0, p0

    .line 180
    const/4 v1, 0x0

    .line 181
    move v2, v1

    .line 182
    :goto_0
    if-ge v2, v0, :cond_3

    .line 183
    .line 184
    aget-object v3, p0, v2

    .line 185
    .line 186
    const-string v4, "["

    .line 187
    .line 188
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    array-length v4, v3

    .line 192
    move v5, v1

    .line 193
    :goto_1
    if-ge v5, v4, :cond_2

    .line 194
    .line 195
    aget-object v6, v3, v5

    .line 196
    .line 197
    const-string v7, "[x = "

    .line 198
    .line 199
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget v7, v6, Lcom/momocv/MMPoint;->x_:I

    .line 203
    .line 204
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v7, ", y = "

    .line 208
    .line 209
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget v7, v6, Lcom/momocv/MMPoint;->y_:I

    .line 213
    .line 214
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string v7, ", score = "

    .line 218
    .line 219
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget v6, v6, Lcom/momocv/MMJoint;->score_:F

    .line 223
    .line 224
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v6, "], "

    .line 228
    .line 229
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    add-int/lit8 v5, v5, 0x1

    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_2
    const-string v3, "]"

    .line 236
    .line 237
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    add-int/lit8 v2, v2, 0x1

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_3
    const-string p0, "mao"

    .line 244
    .line 245
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    .line 251
    .line 252
    :cond_4
    return-void
.end method

.method private k2(Ll/omw;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Ll/ib4;->z:J

    .line 2
    .line 3
    const-wide/16 v2, 0x41

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "faceDetectUse A "

    .line 17
    .line 18
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-wide v3, p0, Ll/ib4;->z:J

    .line 22
    .line 23
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, " mMMCVInfo[0]"

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 43
    .line 44
    invoke-virtual {v0, v2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget p1, p0, Ll/ib4;->X:I

    .line 48
    .line 49
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    iput p1, p0, Ll/ib4;->X:I

    .line 52
    .line 53
    const/16 v0, 0xa

    .line 54
    .line 55
    if-le p1, v0, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Ll/v94;->u(Z)V

    .line 60
    .line 61
    .line 62
    iput v1, p0, Ll/ib4;->X:I

    .line 63
    .line 64
    :cond_0
    return-void

    .line 65
    :cond_1
    iput v1, p0, Ll/ib4;->X:I

    .line 66
    .line 67
    return-void
.end method

.method private l2([BLl/omw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ib4;->i:Ll/tow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, v0, Ll/tow;->e:I

    .line 6
    .line 7
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setWidth(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ib4;->i:Ll/tow;

    .line 11
    .line 12
    iget v0, v0, Ll/tow;->f:I

    .line 13
    .line 14
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setHeight(I)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/ib4;->r2()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setRotateDegree(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/xpl;->m()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setRestoreDegree(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/xpl;->i()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setIsFrontCamera(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-direct {p0, p1}, Ll/ib4;->w2([B)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->isUseFacerig()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Ll/ib4;->B:Ll/umw;

    .line 52
    .line 53
    iget-object v0, p0, Ll/ib4;->C:Ll/lnw;

    .line 54
    .line 55
    invoke-static {p1, v0}, Lcom/core/glcore/util/FacerigHelper;->process(Ll/umw;Ll/lnw;)Ll/evf;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 p1, 0x0

    .line 61
    :goto_0
    invoke-virtual {p2, p1}, Ll/omw;->D(Ll/evf;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/ib4;->E:Ll/v94;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/v94;->e()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v1, p0, Ll/ib4;->A:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 73
    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    new-instance v1, Lcom/momocv/videoprocessor/VideoProcessor;

    .line 79
    .line 80
    invoke-direct {v1}, Lcom/momocv/videoprocessor/VideoProcessor;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Ll/ib4;->A:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 84
    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v2, "VideoProcessor.Create"

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-string v2, "live_mmcv"

    .line 104
    .line 105
    invoke-static {v2, v1}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    const/4 v2, 0x2

    .line 113
    if-lt v1, v2, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Ll/ib4;->A:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 116
    .line 117
    const/4 v2, 0x0

    .line 118
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Ljava/lang/String;

    .line 123
    .line 124
    const/4 v3, 0x1

    .line 125
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v1, v2, p1}, Lcom/momocv/videoprocessor/VideoProcessor;->LoadModel(Ljava/lang/String;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    :cond_2
    iget-object p1, p0, Ll/ib4;->A:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 135
    .line 136
    if-eqz p1, :cond_3

    .line 137
    .line 138
    iget-object v1, p0, Ll/ib4;->B:Ll/umw;

    .line 139
    .line 140
    invoke-virtual {v1}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iget-object p0, p0, Ll/ib4;->C:Ll/lnw;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/lnw;->f()Lcom/momocv/videoprocessor/VideoParams;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p2}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {p1, v1, p0, v2}, Lcom/momocv/videoprocessor/VideoProcessor;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    invoke-virtual {p2, p0}, Ll/omw;->b(I)V

    .line 162
    .line 163
    .line 164
    :cond_3
    return-void
.end method

.method private m2([BLl/omw;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ib4;->w2([B)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ib4;->B:Ll/umw;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ib4;->C:Ll/lnw;

    .line 7
    .line 8
    invoke-static {p1, p0}, Lcom/core/glcore/util/FacerigHelper;->process(Ll/umw;Ll/lnw;)Ll/evf;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2, p0}, Ll/omw;->D(Ll/evf;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private n2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/ib4;->N:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v1, p0, Ll/ib4;->y:I

    .line 12
    .line 13
    neg-int v2, v1

    .line 14
    neg-int v3, v1

    .line 15
    invoke-direct {v0, v2, v3, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Ll/ib4;->p2(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Ll/ib4;->N:Z

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 v0, 0x3f000000    # 0.5f

    .line 30
    .line 31
    invoke-virtual {p0, v0, v0}, Ll/u6y;->W(FF)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private o2(FFFFFFF)V
    .locals 1

    .line 1
    const/4 p7, 0x0

    .line 2
    cmpl-float v0, p3, p7

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move p3, p7

    .line 8
    :goto_0
    cmpl-float v0, p4, p7

    .line 9
    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    move p4, p7

    .line 14
    :goto_1
    cmpl-float p7, p5, p1

    .line 15
    .line 16
    if-lez p7, :cond_2

    .line 17
    .line 18
    move p5, p1

    .line 19
    :cond_2
    cmpl-float p7, p6, p2

    .line 20
    .line 21
    if-lez p7, :cond_3

    .line 22
    .line 23
    move p6, p2

    .line 24
    :cond_3
    const/high16 p7, 0x44fa0000    # 2000.0f

    .line 25
    .line 26
    mul-float/2addr p3, p7

    .line 27
    div-float/2addr p3, p1

    .line 28
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 29
    .line 30
    sub-float/2addr p3, v0

    .line 31
    float-to-int p3, p3

    .line 32
    mul-float/2addr p4, p7

    .line 33
    div-float/2addr p4, p2

    .line 34
    sub-float/2addr p4, v0

    .line 35
    float-to-int p4, p4

    .line 36
    mul-float/2addr p5, p7

    .line 37
    div-float/2addr p5, p1

    .line 38
    sub-float/2addr p5, v0

    .line 39
    float-to-int p1, p5

    .line 40
    mul-float/2addr p6, p7

    .line 41
    div-float/2addr p6, p2

    .line 42
    sub-float/2addr p6, v0

    .line 43
    float-to-int p2, p6

    .line 44
    new-instance p5, Landroid/graphics/Rect;

    .line 45
    .line 46
    invoke-direct {p5, p3, p4, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 47
    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p5, p1}, Ll/ib4;->p2(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private final r2()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4;->i:Ll/tow;

    .line 2
    .line 3
    iget v0, v0, Ll/tow;->D:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/xpl;->m()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    rsub-int p0, v0, 0x10e

    .line 15
    .line 16
    return p0
.end method

.method private s2(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    sub-float/2addr v2, v0

    .line 22
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v2, p0, Ll/ib4;->y:I

    .line 27
    .line 28
    int-to-float v2, v2

    .line 29
    cmpl-float v0, v0, v2

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    if-gtz v0, :cond_2

    .line 33
    .line 34
    sub-float/2addr v3, v1

    .line 35
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget v1, p0, Ll/ib4;->y:I

    .line 40
    .line 41
    int-to-float v1, v1

    .line 42
    cmpl-float v0, v0, v1

    .line 43
    .line 44
    if-lez v0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    sub-int/2addr v0, v1

    .line 52
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v1, p0, Ll/ib4;->y:I

    .line 57
    .line 58
    if-gt v0, v1, :cond_2

    .line 59
    .line 60
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 61
    .line 62
    iget v1, p2, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    sub-int/2addr v0, v1

    .line 65
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget v1, p0, Ll/ib4;->y:I

    .line 70
    .line 71
    if-gt v0, v1, :cond_2

    .line 72
    .line 73
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 74
    .line 75
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    sub-int/2addr v0, v1

    .line 78
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget v1, p0, Ll/ib4;->y:I

    .line 83
    .line 84
    if-gt v0, v1, :cond_2

    .line 85
    .line 86
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 87
    .line 88
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 89
    .line 90
    sub-int/2addr p1, p2

    .line 91
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget p0, p0, Ll/ib4;->y:I

    .line 96
    .line 97
    if-le p1, p0, :cond_1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    const/4 p0, 0x0

    .line 101
    return p0

    .line 102
    :cond_2
    :goto_0
    return v2
.end method

.method private t2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ib4$k;->c()Ll/ib4$j;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/ib4$k;->c()Ll/ib4$j;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/ib4$j;->a()V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private u2(Ll/omw;[B)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib4;->j:Ll/g510;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ib4$h;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2}, Ll/ib4$h;-><init>(Ll/ib4;[B)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Ll/ib4$i;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/ib4$i;-><init>(Ll/ib4;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1, v1, p2}, Ll/g510;->A(Ll/omw;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private v2(Ll/omw;[B)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/xpl;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Ll/omw;->z(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/ib4;->r2()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1, v0}, Ll/omw;->w(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/xpl;->m()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1, v0}, Ll/omw;->C(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ll/omw;->y([B)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 30
    .line 31
    iget p2, p2, Ll/tow;->e:I

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/omw;->E(I)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 37
    .line 38
    iget p2, p2, Ll/tow;->f:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/omw;->A(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/ib4;->i:Ll/tow;

    .line 44
    .line 45
    iget p0, p0, Ll/tow;->D:I

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/omw;->x(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private w2([B)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ib4;->B:Ll/umw;

    .line 4
    .line 5
    const/16 v2, 0x11

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ll/umw;->h(I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/ib4;->B:Ll/umw;

    .line 11
    .line 12
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 13
    .line 14
    iget v2, v2, Ll/tow;->e:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/umw;->m(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/ib4;->B:Ll/umw;

    .line 20
    .line 21
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 22
    .line 23
    iget v2, v2, Ll/tow;->f:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/umw;->j(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/ib4;->B:Ll/umw;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ll/umw;->g([B)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/ib4;->B:Ll/umw;

    .line 42
    .line 43
    array-length p1, p1

    .line 44
    invoke-virtual {v1, p1}, Ll/umw;->f(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/ib4;->B:Ll/umw;

    .line 48
    .line 49
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 50
    .line 51
    iget v1, v1, Ll/tow;->e:I

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ll/umw;->l(I)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 57
    .line 58
    invoke-direct {p0}, Ll/ib4;->r2()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p1, v1}, Ll/lnw;->A(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 66
    .line 67
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 68
    .line 69
    invoke-interface {v1}, Ll/xpl;->m()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {p1, v1}, Ll/lnw;->z(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 77
    .line 78
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 79
    .line 80
    invoke-interface {v1}, Ll/xpl;->i()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {p1, v1}, Ll/lnw;->p(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p1, v1}, Ll/lnw;->M(I)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/v94;->i()F

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {p1, v1}, Ll/lnw;->K(F)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/v94;->b()F

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {p1, v1}, Ll/lnw;->L(F)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/v94;->h()F

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {p1, v1}, Ll/lnw;->C(F)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/v94;->g()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {p1, v1}, Ll/lnw;->D(Z)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/v94;->f()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {p1, v1}, Ll/lnw;->q(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/v94;->q()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {p1, v1}, Ll/lnw;->G(Z)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 151
    .line 152
    const/4 v1, 0x1

    .line 153
    invoke-virtual {p1, v1}, Ll/lnw;->h(Z)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 157
    .line 158
    invoke-virtual {v0}, Ll/v94;->d()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-virtual {p1, v2}, Ll/lnw;->r(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/ib4;->F:Ll/nx3;

    .line 166
    .line 167
    iget-object v2, p0, Ll/ib4;->C:Ll/lnw;

    .line 168
    .line 169
    const/16 v3, 0x68

    .line 170
    .line 171
    const/4 v4, 0x0

    .line 172
    if-nez p1, :cond_1

    .line 173
    .line 174
    invoke-virtual {v0}, Ll/v94;->n()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    invoke-virtual {v2, p1}, Ll/lnw;->k(Z)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 182
    .line 183
    invoke-virtual {v0}, Ll/v94;->o()Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-virtual {p1, v2}, Ll/lnw;->l(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    iget-object v2, p0, Ll/ib4;->C:Ll/lnw;

    .line 195
    .line 196
    if-ne p1, v3, :cond_0

    .line 197
    .line 198
    invoke-virtual {v2, v4}, Ll/lnw;->F(Z)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 202
    .line 203
    invoke-virtual {p1, v4}, Ll/lnw;->i(Z)V

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_0
    invoke-virtual {v0}, Ll/v94;->k()Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    invoke-virtual {v2, p1}, Ll/lnw;->i(Z)V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 215
    .line 216
    invoke-virtual {p1, v1}, Ll/lnw;->F(Z)V

    .line 217
    .line 218
    .line 219
    :goto_0
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 220
    .line 221
    invoke-virtual {p1, v4}, Ll/lnw;->n(Z)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 225
    .line 226
    invoke-virtual {p1, v1}, Ll/lnw;->w(I)V

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Ll/ib4;->C:Ll/lnw;

    .line 230
    .line 231
    const/4 v0, 0x2

    .line 232
    invoke-virtual {p1, v0}, Ll/lnw;->j(I)V

    .line 233
    .line 234
    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :cond_1
    invoke-virtual {p1}, Ll/nx3;->a()I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    invoke-virtual {v2, v1}, Ll/lnw;->j(I)V

    .line 242
    .line 243
    .line 244
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 245
    .line 246
    invoke-virtual {p1}, Ll/nx3;->b()I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    invoke-virtual {v1, v2}, Ll/lnw;->m(I)V

    .line 251
    .line 252
    .line 253
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 254
    .line 255
    invoke-virtual {p1}, Ll/nx3;->d()I

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    invoke-virtual {v1, v2}, Ll/lnw;->s(I)V

    .line 260
    .line 261
    .line 262
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 263
    .line 264
    invoke-virtual {p1}, Ll/nx3;->e()I

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    invoke-virtual {v1, v2}, Ll/lnw;->x(I)V

    .line 269
    .line 270
    .line 271
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 272
    .line 273
    invoke-virtual {p1}, Ll/nx3;->f()F

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    invoke-virtual {v1, v2}, Ll/lnw;->y(F)V

    .line 278
    .line 279
    .line 280
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 281
    .line 282
    invoke-virtual {p1}, Ll/nx3;->k()Z

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    invoke-virtual {v1, v2}, Ll/lnw;->t(Z)V

    .line 287
    .line 288
    .line 289
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 290
    .line 291
    invoke-virtual {p1}, Ll/nx3;->n()Z

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    invoke-virtual {v1, v2}, Ll/lnw;->J(Z)V

    .line 296
    .line 297
    .line 298
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 299
    .line 300
    invoke-virtual {p1}, Ll/nx3;->m()Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    invoke-virtual {v1, v2}, Ll/lnw;->I(Z)V

    .line 305
    .line 306
    .line 307
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 308
    .line 309
    invoke-virtual {p1}, Ll/nx3;->h()Z

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    invoke-virtual {v0}, Ll/v94;->n()Z

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    and-int/2addr v2, v5

    .line 318
    invoke-virtual {v1, v2}, Ll/lnw;->k(Z)V

    .line 319
    .line 320
    .line 321
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 322
    .line 323
    invoke-virtual {p1}, Ll/nx3;->i()Z

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    invoke-virtual {v0}, Ll/v94;->o()Z

    .line 328
    .line 329
    .line 330
    move-result v5

    .line 331
    and-int/2addr v2, v5

    .line 332
    invoke-virtual {v1, v2}, Ll/lnw;->l(Z)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    iget-object v1, p0, Ll/ib4;->C:Ll/lnw;

    .line 340
    .line 341
    if-ne v0, v3, :cond_2

    .line 342
    .line 343
    invoke-virtual {v1, v4}, Ll/lnw;->F(Z)V

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Ll/ib4;->C:Ll/lnw;

    .line 347
    .line 348
    invoke-virtual {v0, v4}, Ll/lnw;->i(Z)V

    .line 349
    .line 350
    .line 351
    goto :goto_1

    .line 352
    :cond_2
    invoke-virtual {p1}, Ll/nx3;->l()Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    invoke-virtual {v1, v0}, Ll/lnw;->F(Z)V

    .line 357
    .line 358
    .line 359
    iget-object v0, p0, Ll/ib4;->C:Ll/lnw;

    .line 360
    .line 361
    invoke-virtual {p1}, Ll/nx3;->g()Z

    .line 362
    .line 363
    .line 364
    move-result v1

    .line 365
    invoke-virtual {v0, v1}, Ll/lnw;->i(Z)V

    .line 366
    .line 367
    .line 368
    :goto_1
    iget-object v0, p0, Ll/ib4;->C:Ll/lnw;

    .line 369
    .line 370
    invoke-virtual {p1}, Ll/nx3;->j()Z

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    invoke-virtual {v0, v1}, Ll/lnw;->n(Z)V

    .line 375
    .line 376
    .line 377
    iget-object v0, p0, Ll/ib4;->C:Ll/lnw;

    .line 378
    .line 379
    invoke-virtual {p1}, Ll/nx3;->c()I

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    invoke-virtual {v0, p1}, Ll/lnw;->o(I)V

    .line 384
    .line 385
    .line 386
    :goto_2
    iget-object p0, p0, Ll/ib4;->C:Ll/lnw;

    .line 387
    .line 388
    invoke-virtual {p0, v4}, Ll/lnw;->B(Z)V

    .line 389
    .line 390
    .line 391
    return-void
.end method


# virtual methods
.method public B(Ll/row;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "resetCamera"

    .line 6
    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/ib4;->l:Ll/row;

    .line 13
    .line 14
    iget-object p1, p0, Ll/ib4;->j:Ll/g510;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/ib4$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/ib4$b;-><init>(Ll/ib4;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/g510;->i(Ll/u410;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/ib4;->j:Ll/g510;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/g510;->D()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "resetCamera\r\nvideoWidth:"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 47
    .line 48
    iget v1, v1, Ll/tow;->s:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",videoHeight:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 59
    .line 60
    iget v1, v1, Ll/tow;->t:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, ",visualWidth:"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 71
    .line 72
    iget v1, v1, Ll/tow;->u:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, ",visualHeight:"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 83
    .line 84
    iget v1, v1, Ll/tow;->v:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v1, ",encodeWidth:"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 95
    .line 96
    iget v1, v1, Ll/tow;->m:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, ",encodeHeight:"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 107
    .line 108
    iget v1, v1, Ll/tow;->n:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ",videoBitrate:"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 119
    .line 120
    iget v1, v1, Ll/tow;->H:I

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v1, ",audioBitrate:"

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 131
    .line 132
    iget v1, v1, Ll/tow;->S:I

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, ",videoFPS:"

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 143
    .line 144
    iget v1, v1, Ll/tow;->F:I

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v1, ",targetWidth"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 155
    .line 156
    invoke-virtual {v1}, Ll/row;->f()Ll/erf0;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v1, ",targetHeight"

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 173
    .line 174
    invoke-virtual {v1}, Ll/row;->f()Ll/erf0;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, ", renderFps"

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 191
    .line 192
    invoke-virtual {v1}, Ll/row;->h()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v1, ", degree"

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget v1, p0, Ll/ib4;->M:I

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {p1, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 217
    .line 218
    if-eqz p1, :cond_1

    .line 219
    .line 220
    iget v0, p0, Ll/ib4;->M:I

    .line 221
    .line 222
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 223
    .line 224
    invoke-interface {p1, v0, v1}, Ll/xpl;->F(ILl/row;)Z

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 228
    .line 229
    new-instance v0, Ll/ib4$c;

    .line 230
    .line 231
    invoke-direct {v0, p0}, Ll/ib4$c;-><init>(Ll/ib4;)V

    .line 232
    .line 233
    .line 234
    invoke-interface {p1, v0}, Ll/xpl;->e(Landroid/hardware/Camera$ErrorCallback;)V

    .line 235
    .line 236
    .line 237
    :cond_1
    const/4 p1, 0x0

    .line 238
    iput-boolean p1, p0, Ll/ib4;->t:Z

    .line 239
    .line 240
    invoke-virtual {p0}, Ll/ib4;->q2()Landroid/graphics/SurfaceTexture;

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 244
    .line 245
    if-eqz v0, :cond_2

    .line 246
    .line 247
    iget-object v1, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 248
    .line 249
    invoke-interface {v0, v1}, Ll/xpl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_2

    .line 254
    .line 255
    iget-object v0, p0, Ll/ib4;->o:Ll/q210$a;

    .line 256
    .line 257
    if-eqz v0, :cond_2

    .line 258
    .line 259
    const/16 v1, 0x4100

    .line 260
    .line 261
    const/4 v2, -0x1

    .line 262
    invoke-interface {v0, v1, v2, p1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    :cond_2
    return-void
.end method

.method public E(ILl/row;)V
    .locals 7

    .line 1
    iput-object p2, p0, Ll/ib4;->l:Ll/row;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ll/ib4;->s:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, p0, Ll/ib4;->U:Z

    .line 8
    .line 9
    iput p1, p0, Ll/ib4;->M:I

    .line 10
    .line 11
    const/16 v2, 0x4100

    .line 12
    .line 13
    :try_start_0
    iget-object v3, p0, Ll/ib4;->f:Ll/xpl;

    .line 14
    .line 15
    invoke-interface {v3, p1, p2}, Ll/xpl;->E(ILl/row;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    iget-object v3, p0, Ll/ib4;->o:Ll/q210$a;

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    const/4 v4, -0x5

    .line 26
    invoke-interface {v3, v2, v4, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    :catch_0
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v5, "startPreview degree:"

    .line 36
    .line 37
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v5, "Pipeline_Normal_pip->PIPLINE"

    .line 48
    .line 49
    invoke-virtual {v3, v5, v4}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-object p2, p0, Ll/ib4;->l:Ll/row;

    .line 53
    .line 54
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v6, "switchCamera line: 551 videoWidth:"

    .line 61
    .line 62
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 66
    .line 67
    iget v6, v6, Ll/tow;->s:I

    .line 68
    .line 69
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v6, ",videoHeight:"

    .line 73
    .line 74
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 78
    .line 79
    iget v6, v6, Ll/tow;->t:I

    .line 80
    .line 81
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v6, ",visualWidth:"

    .line 85
    .line 86
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 90
    .line 91
    iget v6, v6, Ll/tow;->u:I

    .line 92
    .line 93
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v6, ",visualHeight:"

    .line 97
    .line 98
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 102
    .line 103
    iget v6, v6, Ll/tow;->v:I

    .line 104
    .line 105
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v6, ",encodeWidth:"

    .line 109
    .line 110
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 114
    .line 115
    iget v6, v6, Ll/tow;->m:I

    .line 116
    .line 117
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v6, ",encodeHeight:"

    .line 121
    .line 122
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 126
    .line 127
    iget v6, v6, Ll/tow;->n:I

    .line 128
    .line 129
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v6, ",videoBitrate:"

    .line 133
    .line 134
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 138
    .line 139
    iget v6, v6, Ll/tow;->H:I

    .line 140
    .line 141
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v6, ",audioBitrate:"

    .line 145
    .line 146
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 150
    .line 151
    iget v6, v6, Ll/tow;->S:I

    .line 152
    .line 153
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v6, ",videoFPS:"

    .line 157
    .line 158
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget-object v6, p0, Ll/ib4;->i:Ll/tow;

    .line 162
    .line 163
    iget v6, v6, Ll/tow;->F:I

    .line 164
    .line 165
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v6, ",targetWidth"

    .line 169
    .line 170
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-virtual {v6}, Ll/erf0;->b()I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v6, ",targetHeight"

    .line 185
    .line 186
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-virtual {p2}, Ll/erf0;->a()I

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string p2, ", mCurrentDegree"

    .line 201
    .line 202
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string p1, ", renderFps"

    .line 209
    .line 210
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Ll/ib4;->l:Ll/row;

    .line 214
    .line 215
    invoke-virtual {p1}, Ll/row;->h()I

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {v3, v5, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 230
    .line 231
    if-eqz p1, :cond_1

    .line 232
    .line 233
    new-instance p1, Ll/erf0;

    .line 234
    .line 235
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 236
    .line 237
    iget v3, p2, Ll/tow;->e:I

    .line 238
    .line 239
    iget p2, p2, Ll/tow;->f:I

    .line 240
    .line 241
    invoke-direct {p1, v3, p2}, Ll/erf0;-><init>(II)V

    .line 242
    .line 243
    .line 244
    new-instance p2, Ll/erf0;

    .line 245
    .line 246
    const/16 v3, 0x9

    .line 247
    .line 248
    const/16 v4, 0x10

    .line 249
    .line 250
    invoke-direct {p2, v3, v4}, Ll/erf0;-><init>(II)V

    .line 251
    .line 252
    .line 253
    iget-object v3, p0, Ll/ib4;->f:Ll/xpl;

    .line 254
    .line 255
    invoke-interface {v3}, Ll/xpl;->m()I

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    invoke-static {p1, p2, v3}, Lcom/core/glcore/util/CameraUtil;->reScaleSize(Ll/erf0;Ll/erf0;I)Ll/erf0;

    .line 260
    .line 261
    .line 262
    :cond_1
    iget-object p1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 263
    .line 264
    if-eqz p1, :cond_3

    .line 265
    .line 266
    iget-object p1, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 267
    .line 268
    if-eqz p1, :cond_2

    .line 269
    .line 270
    const/4 p2, 0x0

    .line 271
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    :cond_2
    iget-object p1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 275
    .line 276
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 277
    .line 278
    .line 279
    new-instance p1, Landroid/os/HandlerThread;

    .line 280
    .line 281
    const-string p2, "HaniPreviewDataProcess"

    .line 282
    .line 283
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iput-object p1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 287
    .line 288
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 289
    .line 290
    .line 291
    new-instance p1, Landroid/os/Handler;

    .line 292
    .line 293
    iget-object p2, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 294
    .line 295
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 296
    .line 297
    .line 298
    move-result-object p2

    .line 299
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 300
    .line 301
    .line 302
    iput-object p1, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 303
    .line 304
    :cond_3
    iget-object p1, p0, Ll/ib4;->i:Ll/tow;

    .line 305
    .line 306
    iget p1, p1, Ll/tow;->s:I

    .line 307
    .line 308
    div-int/lit8 p1, p1, 0xc

    .line 309
    .line 310
    iput p1, p0, Ll/ib4;->y:I

    .line 311
    .line 312
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 313
    .line 314
    if-eqz p1, :cond_5

    .line 315
    .line 316
    invoke-interface {p1}, Ll/xpl;->i()Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    iget-object p2, p0, Ll/ib4;->f:Ll/xpl;

    .line 321
    .line 322
    if-eqz p1, :cond_4

    .line 323
    .line 324
    invoke-interface {p2}, Ll/xpl;->m()I

    .line 325
    .line 326
    .line 327
    move-result p1

    .line 328
    rsub-int p1, p1, 0x168

    .line 329
    .line 330
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 331
    .line 332
    .line 333
    const/4 p1, 0x2

    .line 334
    invoke-virtual {p0, p1}, Ll/gb20;->flipPosition(I)V

    .line 335
    .line 336
    .line 337
    goto :goto_0

    .line 338
    :cond_4
    invoke-interface {p2}, Ll/xpl;->m()I

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {p0, v1}, Ll/gb20;->flipPosition(I)V

    .line 346
    .line 347
    .line 348
    :cond_5
    :goto_0
    iput-boolean v0, p0, Ll/ib4;->t:Z

    .line 349
    .line 350
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 351
    .line 352
    if-eqz p1, :cond_6

    .line 353
    .line 354
    iget-object p2, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 355
    .line 356
    invoke-interface {p1, p2}, Ll/xpl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 357
    .line 358
    .line 359
    move-result p1

    .line 360
    if-nez p1, :cond_6

    .line 361
    .line 362
    iget-object p1, p0, Ll/ib4;->o:Ll/q210$a;

    .line 363
    .line 364
    if-eqz p1, :cond_6

    .line 365
    .line 366
    const/4 p2, -0x1

    .line 367
    invoke-interface {p1, v2, p2, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 368
    .line 369
    .line 370
    :cond_6
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 371
    .line 372
    if-eqz p1, :cond_7

    .line 373
    .line 374
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 379
    .line 380
    invoke-interface {p0}, Ll/xpl;->i()Z

    .line 381
    .line 382
    .line 383
    move-result p0

    .line 384
    invoke-virtual {p1, p0}, Ll/u6y;->X(I)V

    .line 385
    .line 386
    .line 387
    :cond_7
    return-void
.end method

.method public E1(ILl/row;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "startPreview"

    .line 6
    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/ib4;->s:Z

    .line 14
    .line 15
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    new-instance v1, Ll/biw;

    .line 20
    .line 21
    iget-object v3, p0, Ll/ib4;->i:Ll/tow;

    .line 22
    .line 23
    invoke-direct {v1, v3}, Ll/biw;-><init>(Ll/tow;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 27
    .line 28
    :cond_0
    iput-object p2, p0, Ll/ib4;->l:Ll/row;

    .line 29
    .line 30
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 31
    .line 32
    invoke-interface {v1, p0}, Ll/xpl;->I(Ll/xpl$d;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v4, "startPreview = "

    .line 42
    .line 43
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4}, Ll/erf0;->b()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v4, "x"

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Ll/erf0;->a()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    const-string v4, "CameraNV21PreviewInput"

    .line 78
    .line 79
    filled-new-array {v4, v3}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v1, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    new-instance v3, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v4, "startPreview(int degree, MRConfig mrConfig)\r\nvideoWidth:"

    .line 93
    .line 94
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 98
    .line 99
    iget v4, v4, Ll/tow;->s:I

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v4, ",videoHeight:"

    .line 105
    .line 106
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 110
    .line 111
    iget v4, v4, Ll/tow;->t:I

    .line 112
    .line 113
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v4, ",visualWidth:"

    .line 117
    .line 118
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 122
    .line 123
    iget v4, v4, Ll/tow;->u:I

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v4, ",visualHeight:"

    .line 129
    .line 130
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 134
    .line 135
    iget v4, v4, Ll/tow;->v:I

    .line 136
    .line 137
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v4, ",encodeWidth:"

    .line 141
    .line 142
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 146
    .line 147
    iget v4, v4, Ll/tow;->m:I

    .line 148
    .line 149
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v4, ",encodeHeight:"

    .line 153
    .line 154
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 158
    .line 159
    iget v4, v4, Ll/tow;->n:I

    .line 160
    .line 161
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v4, ",videoBitrate:"

    .line 165
    .line 166
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 170
    .line 171
    iget v4, v4, Ll/tow;->H:I

    .line 172
    .line 173
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v4, ",audioBitrate:"

    .line 177
    .line 178
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 182
    .line 183
    iget v4, v4, Ll/tow;->S:I

    .line 184
    .line 185
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v4, ",videoFPS:"

    .line 189
    .line 190
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    iget-object v4, p0, Ll/ib4;->i:Ll/tow;

    .line 194
    .line 195
    iget v4, v4, Ll/tow;->F:I

    .line 196
    .line 197
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v4, ",targetWidth"

    .line 201
    .line 202
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-virtual {v4}, Ll/erf0;->b()I

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    const-string v4, ",targetHeight"

    .line 217
    .line 218
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-virtual {v4}, Ll/erf0;->a()I

    .line 226
    .line 227
    .line 228
    move-result v4

    .line 229
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string v4, ", mCurrentDegree"

    .line 233
    .line 234
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    const-string v4, ", renderFps"

    .line 241
    .line 242
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    iget-object v4, p0, Ll/ib4;->l:Ll/row;

    .line 246
    .line 247
    invoke-virtual {v4}, Ll/row;->h()I

    .line 248
    .line 249
    .line 250
    move-result v4

    .line 251
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iput p1, p0, Ll/ib4;->M:I

    .line 262
    .line 263
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    new-instance v3, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string v4, "startPreview degree:"

    .line 270
    .line 271
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-virtual {v1, v2, v3}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 285
    .line 286
    new-instance v2, Ll/ib4$d;

    .line 287
    .line 288
    invoke-direct {v2, p0}, Ll/ib4$d;-><init>(Ll/ib4;)V

    .line 289
    .line 290
    .line 291
    invoke-interface {v1, v2}, Ll/xpl;->J(Ll/xpl$c;)V

    .line 292
    .line 293
    .line 294
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 295
    .line 296
    invoke-interface {v1, p1, p2}, Ll/xpl;->G(ILl/row;)Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-nez p1, :cond_2

    .line 301
    .line 302
    const-string p1, "Camera prepare Failed!"

    .line 303
    .line 304
    invoke-static {p1}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;)I

    .line 305
    .line 306
    .line 307
    iget-object p1, p0, Ll/ib4;->o:Ll/q210$a;

    .line 308
    .line 309
    if-eqz p1, :cond_1

    .line 310
    .line 311
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    const-string p2, "line 460 prepare error"

    .line 316
    .line 317
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object p2

    .line 321
    invoke-virtual {p1, p2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Ll/ib4;->o:Ll/q210$a;

    .line 325
    .line 326
    const/16 p2, 0x4100

    .line 327
    .line 328
    const/4 v1, -0x4

    .line 329
    invoke-interface {p1, p2, v1, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    :cond_1
    return v0

    .line 333
    :cond_2
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 334
    .line 335
    new-instance p2, Ll/ib4$e;

    .line 336
    .line 337
    invoke-direct {p2, p0}, Ll/ib4$e;-><init>(Ll/ib4;)V

    .line 338
    .line 339
    .line 340
    invoke-interface {p1, p2}, Ll/xpl;->e(Landroid/hardware/Camera$ErrorCallback;)V

    .line 341
    .line 342
    .line 343
    iget-object p1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 344
    .line 345
    if-eqz p1, :cond_4

    .line 346
    .line 347
    iget-object p1, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 348
    .line 349
    if-eqz p1, :cond_3

    .line 350
    .line 351
    const/4 p2, 0x0

    .line 352
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 353
    .line 354
    .line 355
    :cond_3
    iget-object p1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 356
    .line 357
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 358
    .line 359
    .line 360
    :cond_4
    new-instance p1, Landroid/os/HandlerThread;

    .line 361
    .line 362
    const-string p2, "HaniPreviewDataProcess"

    .line 363
    .line 364
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    iput-object p1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 368
    .line 369
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 370
    .line 371
    .line 372
    new-instance p1, Landroid/os/Handler;

    .line 373
    .line 374
    iget-object p2, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 375
    .line 376
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 377
    .line 378
    .line 379
    move-result-object p2

    .line 380
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 381
    .line 382
    .line 383
    iput-object p1, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 384
    .line 385
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 386
    .line 387
    invoke-interface {p1, p0}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 388
    .line 389
    .line 390
    iget-object p1, p0, Ll/ib4;->i:Ll/tow;

    .line 391
    .line 392
    iget p1, p1, Ll/tow;->s:I

    .line 393
    .line 394
    div-int/lit8 p1, p1, 0xc

    .line 395
    .line 396
    iput p1, p0, Ll/ib4;->y:I

    .line 397
    .line 398
    invoke-virtual {p0}, Ll/ib4;->q2()Landroid/graphics/SurfaceTexture;

    .line 399
    .line 400
    .line 401
    new-instance p1, Ll/erf0;

    .line 402
    .line 403
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 404
    .line 405
    iget v1, p2, Ll/tow;->e:I

    .line 406
    .line 407
    iget p2, p2, Ll/tow;->f:I

    .line 408
    .line 409
    invoke-direct {p1, v1, p2}, Ll/erf0;-><init>(II)V

    .line 410
    .line 411
    .line 412
    new-instance p2, Ll/erf0;

    .line 413
    .line 414
    const/16 v1, 0x9

    .line 415
    .line 416
    const/16 v2, 0x10

    .line 417
    .line 418
    invoke-direct {p2, v1, v2}, Ll/erf0;-><init>(II)V

    .line 419
    .line 420
    .line 421
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 422
    .line 423
    invoke-interface {v1}, Ll/xpl;->m()I

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    invoke-static {p1, p2, v1}, Lcom/core/glcore/util/CameraUtil;->reScaleSize(Ll/erf0;Ll/erf0;I)Ll/erf0;

    .line 428
    .line 429
    .line 430
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 431
    .line 432
    invoke-interface {p1}, Ll/xpl;->i()Z

    .line 433
    .line 434
    .line 435
    move-result p1

    .line 436
    iget-object p2, p0, Ll/ib4;->f:Ll/xpl;

    .line 437
    .line 438
    const/4 v1, 0x1

    .line 439
    if-eqz p1, :cond_5

    .line 440
    .line 441
    invoke-interface {p2}, Ll/xpl;->m()I

    .line 442
    .line 443
    .line 444
    move-result p1

    .line 445
    rsub-int p1, p1, 0x168

    .line 446
    .line 447
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 448
    .line 449
    .line 450
    const/4 p1, 0x2

    .line 451
    invoke-virtual {p0, p1}, Ll/gb20;->flipPosition(I)V

    .line 452
    .line 453
    .line 454
    goto :goto_0

    .line 455
    :cond_5
    invoke-interface {p2}, Ll/xpl;->m()I

    .line 456
    .line 457
    .line 458
    move-result p1

    .line 459
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {p0, v1}, Ll/gb20;->flipPosition(I)V

    .line 463
    .line 464
    .line 465
    :goto_0
    iput-boolean v0, p0, Ll/ib4;->t:Z

    .line 466
    .line 467
    iget-object p1, p0, Ll/ib4;->f:Ll/xpl;

    .line 468
    .line 469
    iget-object p2, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 470
    .line 471
    invoke-interface {p1, p2}, Ll/xpl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 472
    .line 473
    .line 474
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 475
    .line 476
    .line 477
    move-result-object p1

    .line 478
    iget-object p2, p0, Ll/ib4;->f:Ll/xpl;

    .line 479
    .line 480
    invoke-interface {p2}, Ll/xpl;->i()Z

    .line 481
    .line 482
    .line 483
    move-result p2

    .line 484
    invoke-virtual {p1, p2}, Ll/u6y;->X(I)V

    .line 485
    .line 486
    .line 487
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 488
    .line 489
    .line 490
    move-result-object p1

    .line 491
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 492
    .line 493
    iget-object p2, p2, Ll/tow;->k0:Ljava/util/List;

    .line 494
    .line 495
    invoke-virtual {p1, p2}, Ll/u6y;->Y(Ljava/util/List;)V

    .line 496
    .line 497
    .line 498
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 499
    .line 500
    .line 501
    move-result-object p1

    .line 502
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 503
    .line 504
    iget v0, p2, Ll/tow;->U:I

    .line 505
    .line 506
    iget p2, p2, Ll/tow;->T:I

    .line 507
    .line 508
    invoke-virtual {p1, v0, p2}, Ll/u6y;->o0(II)V

    .line 509
    .line 510
    .line 511
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 512
    .line 513
    .line 514
    move-result-object p1

    .line 515
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 516
    .line 517
    iget-boolean p2, p2, Ll/tow;->g0:Z

    .line 518
    .line 519
    invoke-virtual {p1, p2}, Ll/u6y;->q0(I)V

    .line 520
    .line 521
    .line 522
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    iget-object p2, p0, Ll/ib4;->i:Ll/tow;

    .line 527
    .line 528
    iget-object p2, p2, Ll/tow;->o0:Ljava/util/List;

    .line 529
    .line 530
    invoke-virtual {p1, p2}, Ll/u6y;->a0(Ljava/util/List;)V

    .line 531
    .line 532
    .line 533
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 534
    .line 535
    .line 536
    move-result-object p1

    .line 537
    invoke-virtual {p1, v1}, Ll/u6y;->k0(Z)V

    .line 538
    .line 539
    .line 540
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 541
    .line 542
    .line 543
    move-result-object p1

    .line 544
    iget-object p0, p0, Ll/ib4;->i:Ll/tow;

    .line 545
    .line 546
    iget p2, p0, Ll/tow;->e:I

    .line 547
    .line 548
    iget p0, p0, Ll/tow;->f:I

    .line 549
    .line 550
    invoke-virtual {p1, p2, p0}, Ll/u6y;->Z(II)V

    .line 551
    .line 552
    .line 553
    return v1
.end method

.method public G()V
    .locals 0

    .line 1
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->z(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I0()J
    .locals 2

    .line 1
    iget p0, p0, Ll/ib4;->u:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public J1(Ll/v94;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    return-void
.end method

.method public K(Ll/g510;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->j:Ll/g510;

    .line 2
    .line 3
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    return-void
.end method

.method public N()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "pausePreview >>>> 1"

    .line 6
    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "pausePreview >>>> 2"

    .line 21
    .line 22
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "CameraNV21PreviewInput"

    .line 30
    .line 31
    const-string v2, "pauseCamera"

    .line 32
    .line 33
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 41
    .line 42
    invoke-interface {p0}, Ll/xpl;->L()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public Q(Ll/ib4$l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->K:Ll/ib4$l;

    .line 2
    .line 3
    return-void
.end method

.method public R(Ll/nx3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->F:Ll/nx3;

    .line 2
    .line 3
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->B(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->u(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V(Landroid/hardware/Camera;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib4;->g:Landroid/hardware/Camera;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ib4;->m:Ll/xpl$d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/xpl$d;->V(Landroid/hardware/Camera;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Z(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ib4;->L:I

    .line 2
    .line 3
    return-void
.end method

.method public a()V
    .locals 9

    .line 1
    const-string v0, "stopPreview\uff1a"

    .line 2
    .line 3
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-object v1, p0, Ll/ib4;->n:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    const-string v5, "Pipeline_Normal_pip->PIPLINE"

    .line 17
    .line 18
    const-string v6, "stopPreview"

    .line 19
    .line 20
    invoke-virtual {v4, v5, v6}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v4, p0, Ll/ib4;->f:Ll/xpl;

    .line 24
    .line 25
    invoke-interface {v4, v3}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 26
    .line 27
    .line 28
    iget-object v4, p0, Ll/ib4;->f:Ll/xpl;

    .line 29
    .line 30
    invoke-interface {v4}, Ll/xpl;->a()I

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4, v2}, Ll/u6y;->k0(Z)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    const-string v5, "CameraNV21PreviewInput"

    .line 45
    .line 46
    new-instance v6, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 52
    .line 53
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, " this === "

    .line 57
    .line 58
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v0, " time === "

    .line 65
    .line 66
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 70
    .line 71
    .line 72
    move-result-wide v7

    .line 73
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    filled-new-array {v5, v0}, [Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v4, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    iput-object v3, p0, Ll/ib4;->f:Ll/xpl;

    .line 88
    .line 89
    iput v2, p0, Ll/ib4;->u:I

    .line 90
    .line 91
    iget-object v0, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 92
    .line 93
    if-eqz v0, :cond_1

    .line 94
    .line 95
    iget-object v0, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 96
    .line 97
    if-eqz v0, :cond_0

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iput-object v3, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :catchall_0
    move-exception p0

    .line 106
    goto :goto_1

    .line 107
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 110
    .line 111
    .line 112
    iput-object v3, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 113
    .line 114
    :cond_1
    monitor-exit v1

    .line 115
    goto :goto_2

    .line 116
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    throw p0

    .line 118
    :cond_2
    :goto_2
    iget-object v0, p0, Ll/ib4;->A:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 119
    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 123
    .line 124
    .line 125
    const-string v0, "live_mmcv"

    .line 126
    .line 127
    const-string v1, "stopPreview: VideoProcessor.Release"

    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    iput-object v3, p0, Ll/ib4;->A:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 133
    .line 134
    :cond_3
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->release()V

    .line 135
    .line 136
    .line 137
    iput-boolean v2, p0, Ll/ib4;->D:Z

    .line 138
    .line 139
    invoke-direct {p0}, Ll/ib4;->t2()V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public a1()Ll/v94;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xpl;->b(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gb20;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->g()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D SamplerY;uniform sampler2D SamplerUV;varying mediump vec2 coordinate;void main(){vec3 rgb;vec3 yuv;yuv.r = texture2D(SamplerY, coordinate).r - (16.0/255.0);\nyuv.g = texture2D(SamplerUV, coordinate).a - 0.5;\nyuv.b = texture2D(SamplerUV, coordinate).r - 0.5;\n mat3 colorConvertion = mat3(1.164, 1.164, 1.164,\n                             0.0, -0.392, 2.017,\n                             1.596, -0.813, 0.0);\n rgb = colorConvertion * yuv;   gl_FragColor = vec4(rgb, 1.0);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/xpl;->h()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public initShaderHandles()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gb20;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->v(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->y(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/v94;->r(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onData([B)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/u6y;->N()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance v1, Ll/ib4$f;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/ib4$f;-><init>(Ll/ib4;[B)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public onDrawFrame()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/gb20;->onDrawFrame()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p2(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ib4;->O:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {p0, v0, p1}, Ll/ib4;->s2(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/ib4;->O:Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2}, Ll/xpl;->k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public q(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->E(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q2()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/ib4;->I:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    new-instance v0, Ll/ib4$k;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/ib4$k;-><init>(Ll/ib4;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ib4;->H:Ll/ib4$k;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ib4$k;->f()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/ib4;->J:Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    return-object p0
.end method

.method public r()V
    .locals 11

    .line 1
    const-string v0, "releaseCamera2\uff1a"

    .line 2
    .line 3
    const-string v1, "releaseCamera2\uff1a"

    .line 4
    .line 5
    const-string v2, "releaseCamera2\uff1a"

    .line 6
    .line 7
    const-string v3, "releaseCamera1\uff1a"

    .line 8
    .line 9
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string v5, "Pipeline_Normal_pip->PIPLINE"

    .line 14
    .line 15
    const-string v6, "releaseCamera >>>> 1"

    .line 16
    .line 17
    invoke-virtual {v4, v5, v6}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    const-string v5, "CameraNV21PreviewInput"

    .line 25
    .line 26
    const-string v6, "releaseCamera"

    .line 27
    .line 28
    filled-new-array {v5, v6}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v4, v5}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Ll/ib4;->n:Ljava/lang/Object;

    .line 36
    .line 37
    monitor-enter v4

    .line 38
    :try_start_0
    iget-object v5, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    iget-object v5, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 44
    .line 45
    if-eqz v5, :cond_0

    .line 46
    .line 47
    invoke-virtual {v5, v6}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iput-object v6, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto/16 :goto_4

    .line 55
    .line 56
    :cond_0
    :goto_0
    iget-object v5, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 57
    .line 58
    invoke-virtual {v5}, Landroid/os/HandlerThread;->quit()Z

    .line 59
    .line 60
    .line 61
    iput-object v6, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 62
    .line 63
    :cond_1
    iget-object v5, p0, Ll/ib4;->f:Ll/xpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    if-eqz v5, :cond_2

    .line 66
    .line 67
    :try_start_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    const-string v7, "Pipeline_Normal_pip->PIPLINE"

    .line 72
    .line 73
    const-string v8, "releaseCamera >>>> 2"

    .line 74
    .line 75
    invoke-virtual {v5, v7, v8}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v5, p0, Ll/ib4;->f:Ll/xpl;

    .line 79
    .line 80
    invoke-interface {v5}, Ll/xpl;->release()V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    const-string v7, "CameraNV21PreviewInput"

    .line 88
    .line 89
    new-instance v8, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Ll/ib4;->f:Ll/xpl;

    .line 95
    .line 96
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v3, " this === "

    .line 100
    .line 101
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v3, " time === "

    .line 108
    .line 109
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 113
    .line 114
    .line 115
    move-result-wide v9

    .line 116
    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    filled-new-array {v7, v3}, [Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v5, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    iput-object v6, p0, Ll/ib4;->f:Ll/xpl;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 131
    .line 132
    :try_start_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    const-string v1, "CameraNV21PreviewInput"

    .line 137
    .line 138
    new-instance v3, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Ll/ib4;->f:Ll/xpl;

    .line 144
    .line 145
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v2, " this === "

    .line 149
    .line 150
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v2, " time === "

    .line 157
    .line 158
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 162
    .line 163
    .line 164
    move-result-wide v7

    .line 165
    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :catchall_1
    move-exception v1

    .line 181
    goto :goto_2

    .line 182
    :catch_0
    move-exception v2

    .line 183
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 184
    .line 185
    .line 186
    :try_start_4
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    const-string v2, "CameraNV21PreviewInput"

    .line 191
    .line 192
    new-instance v3, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget-object v1, p0, Ll/ib4;->f:Ll/xpl;

    .line 198
    .line 199
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string v1, " this === "

    .line 203
    .line 204
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v1, " time === "

    .line 211
    .line 212
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 216
    .line 217
    .line 218
    move-result-wide v7

    .line 219
    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    :goto_1
    iput-object v6, p0, Ll/ib4;->f:Ll/xpl;

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :goto_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    const-string v3, "CameraNV21PreviewInput"

    .line 241
    .line 242
    new-instance v5, Ljava/lang/StringBuilder;

    .line 243
    .line 244
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 248
    .line 249
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string v0, " this === "

    .line 253
    .line 254
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v0, " time === "

    .line 261
    .line 262
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 266
    .line 267
    .line 268
    move-result-wide v7

    .line 269
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    filled-new-array {v3, v0}, [Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {v2, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 281
    .line 282
    .line 283
    iput-object v6, p0, Ll/ib4;->f:Ll/xpl;

    .line 284
    .line 285
    throw v1

    .line 286
    :cond_2
    :goto_3
    invoke-direct {p0}, Ll/ib4;->t2()V

    .line 287
    .line 288
    .line 289
    monitor-exit v4

    .line 290
    return-void

    .line 291
    :goto_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 292
    throw p0
.end method

.method public s(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->x(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s1(Ll/ylg;Ll/yuf;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/ib4;->p:Landroid/os/HandlerThread;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ib4;->q:Landroid/os/Handler;

    .line 18
    .line 19
    new-instance v1, Ll/ib4$a;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, p2}, Ll/ib4$a;-><init>(Ll/ib4;Ll/ylg;Ll/yuf;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iput-object p2, p0, Ll/ib4;->G:Ll/yuf;

    .line 29
    .line 30
    return-void
.end method

.method public setExposureCompensation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/xpl;->setExposureCompensation(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWarpType(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/v94;->F(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    if-gt p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Ll/v94;->D(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->A(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->t(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib4;->E:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->w(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(II)Ll/erf0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/erf0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ib4;->i:Ll/tow;

    .line 8
    .line 9
    iget v2, v1, Ll/tow;->e:I

    .line 10
    .line 11
    iget v1, v1, Ll/tow;->f:I

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Ll/erf0;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ib4;->f:Ll/xpl;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/xpl;->m()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    new-instance v1, Ll/erf0;

    .line 23
    .line 24
    invoke-direct {v1, p1, p2}, Ll/erf0;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, p0, v1}, Lcom/core/glcore/util/CameraUtil;->rescalAspectRatio(Ll/erf0;ILl/erf0;)Ll/erf0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    new-instance p0, Ll/erf0;

    .line 33
    .line 34
    invoke-direct {p0, p1, p2}, Ll/erf0;-><init>(II)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public z()V
    .locals 6

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "resumePreview line 628:videoWidth:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 13
    .line 14
    iget v2, v2, Ll/tow;->s:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ",videoHeight:"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 25
    .line 26
    iget v2, v2, Ll/tow;->t:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ",visualWidth:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 37
    .line 38
    iget v2, v2, Ll/tow;->u:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ",visualHeight:"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 49
    .line 50
    iget v2, v2, Ll/tow;->v:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ",encodeWidth:"

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 61
    .line 62
    iget v2, v2, Ll/tow;->m:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ",encodeHeight:"

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 73
    .line 74
    iget v2, v2, Ll/tow;->n:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, ",videoBitrate:"

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 85
    .line 86
    iget v2, v2, Ll/tow;->H:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, ",audioBitrate:"

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 97
    .line 98
    iget v2, v2, Ll/tow;->S:I

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, ",videoFPS:"

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Ll/ib4;->i:Ll/tow;

    .line 109
    .line 110
    iget v2, v2, Ll/tow;->F:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, ",targetWidth"

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Ll/ib4;->l:Ll/row;

    .line 121
    .line 122
    invoke-virtual {v2}, Ll/row;->f()Ll/erf0;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v2}, Ll/erf0;->b()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v2, ",targetHeight"

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ll/ib4;->l:Ll/row;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/row;->f()Ll/erf0;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2}, Ll/erf0;->a()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, ", renderFps"

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Ll/ib4;->l:Ll/row;

    .line 157
    .line 158
    invoke-virtual {v2}, Ll/row;->h()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v2, ", degree"

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    iget v2, p0, Ll/ib4;->M:I

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 180
    .line 181
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const-string v1, "resumePreview"

    .line 189
    .line 190
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    new-instance v1, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v3, "resumePreview\uff1a"

    .line 200
    .line 201
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v4, p0, Ll/ib4;->f:Ll/xpl;

    .line 205
    .line 206
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v4, " this === "

    .line 210
    .line 211
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string v4, " time === "

    .line 218
    .line 219
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 223
    .line 224
    .line 225
    move-result-wide v4

    .line 226
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    const-string v4, "CameraNV21PreviewInput"

    .line 234
    .line 235
    filled-new-array {v4, v1}, [Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 243
    .line 244
    if-eqz v0, :cond_0

    .line 245
    .line 246
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    const-string v1, "resumePreview >>>> 1"

    .line 251
    .line 252
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :try_start_0
    iget-object v0, p0, Ll/ib4;->f:Ll/xpl;

    .line 256
    .line 257
    invoke-interface {v0}, Ll/xpl;->H()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :catch_0
    move-exception v0

    .line 262
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    new-instance v2, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    filled-new-array {v4, v0}, [Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {v1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    iget v0, p0, Ll/ib4;->M:I

    .line 290
    .line 291
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 292
    .line 293
    invoke-virtual {p0, v0, v1}, Ll/ib4;->E1(ILl/row;)Z

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    const-string v1, "resumePreview >>>> 2"

    .line 302
    .line 303
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    iget v0, p0, Ll/ib4;->M:I

    .line 307
    .line 308
    iget-object v1, p0, Ll/ib4;->l:Ll/row;

    .line 309
    .line 310
    invoke-virtual {p0, v0, v1}, Ll/ib4;->E1(ILl/row;)Z

    .line 311
    .line 312
    .line 313
    return-void
.end method
