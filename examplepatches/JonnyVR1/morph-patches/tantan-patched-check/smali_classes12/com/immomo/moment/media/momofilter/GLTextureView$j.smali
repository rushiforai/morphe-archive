.class Lcom/immomo/moment/media/momofilter/GLTextureView$j;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/media/momofilter/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Z

.field private l:I

.field private m:I

.field private n:I

.field private o:Z

.field private p:Z

.field private q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private r:Z

.field private s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

.field private t:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/immomo/moment/media/momofilter/GLTextureView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/immomo/moment/media/momofilter/GLTextureView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->q:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->r:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l:I

    .line 16
    .line 17
    iput v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->m:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->o:Z

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->n:I

    .line 22
    .line 23
    iput-object p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->t:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic b(Lcom/immomo/moment/media/momofilter/GLTextureView$j;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->b:Z

    .line 2
    .line 3
    return p1
.end method

.method private d()V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v0, Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->t:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v0, v2}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 14
    .line 15
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 16
    .line 17
    move v3, v0

    .line 18
    move v4, v3

    .line 19
    move v5, v4

    .line 20
    move v7, v5

    .line 21
    move v8, v7

    .line 22
    move v9, v8

    .line 23
    move v10, v9

    .line 24
    move v11, v10

    .line 25
    move v12, v11

    .line 26
    move v13, v12

    .line 27
    const/4 v6, 0x0

    .line 28
    :goto_0
    const/4 v14, 0x0

    .line 29
    :goto_1
    :try_start_0
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 30
    .line 31
    .line 32
    move-result-object v15

    .line 33
    monitor-enter v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 34
    :goto_2
    :try_start_1
    iget-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->a:Z

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 39
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    monitor-enter v2

    .line 44
    :try_start_2
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l()V

    .line 45
    .line 46
    .line 47
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k()V

    .line 48
    .line 49
    .line 50
    monitor-exit v2

    .line 51
    return-void

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    throw v0

    .line 55
    :catchall_1
    move-exception v0

    .line 56
    goto/16 :goto_a

    .line 57
    .line 58
    :cond_0
    :try_start_3
    iget-object v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->q:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    iget-object v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->q:Ljava/util/ArrayList;

    .line 67
    .line 68
    const/4 v14, 0x0

    .line 69
    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    move-object v14, v2

    .line 74
    check-cast v14, Ljava/lang/Runnable;

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    goto/16 :goto_7

    .line 78
    .line 79
    :cond_1
    iget-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->d:Z

    .line 80
    .line 81
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->c:Z

    .line 82
    .line 83
    if-eq v2, v0, :cond_2

    .line 84
    .line 85
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->d:Z

    .line 86
    .line 87
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 92
    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_2
    const/4 v0, 0x0

    .line 96
    :goto_3
    iget-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k:Z

    .line 97
    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l()V

    .line 101
    .line 102
    .line 103
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k()V

    .line 104
    .line 105
    .line 106
    const/4 v2, 0x0

    .line 107
    iput-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k:Z

    .line 108
    .line 109
    const/4 v5, 0x1

    .line 110
    :cond_3
    if-eqz v3, :cond_4

    .line 111
    .line 112
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l()V

    .line 113
    .line 114
    .line 115
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k()V

    .line 116
    .line 117
    .line 118
    const/4 v3, 0x0

    .line 119
    :cond_4
    if-eqz v0, :cond_5

    .line 120
    .line 121
    iget-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 122
    .line 123
    if-eqz v2, :cond_5

    .line 124
    .line 125
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l()V

    .line 126
    .line 127
    .line 128
    :cond_5
    if-eqz v0, :cond_8

    .line 129
    .line 130
    iget-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 131
    .line 132
    if-eqz v2, :cond_8

    .line 133
    .line 134
    iget-object v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->t:Ljava/lang/ref/WeakReference;

    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Lcom/immomo/moment/media/momofilter/GLTextureView;

    .line 141
    .line 142
    if-nez v2, :cond_6

    .line 143
    .line 144
    const/4 v2, 0x0

    .line 145
    goto :goto_4

    .line 146
    :cond_6
    invoke-static {v2}, Lcom/immomo/moment/media/momofilter/GLTextureView;->i(Lcom/immomo/moment/media/momofilter/GLTextureView;)Z

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    :goto_4
    if-eqz v2, :cond_7

    .line 151
    .line 152
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v2}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->d()Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_8

    .line 161
    .line 162
    :cond_7
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k()V

    .line 163
    .line 164
    .line 165
    :cond_8
    if-eqz v0, :cond_9

    .line 166
    .line 167
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->e()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_9

    .line 176
    .line 177
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->e()V

    .line 180
    .line 181
    .line 182
    :cond_9
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->e:Z

    .line 183
    .line 184
    if-nez v0, :cond_b

    .line 185
    .line 186
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->g:Z

    .line 187
    .line 188
    if-nez v0, :cond_b

    .line 189
    .line 190
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 191
    .line 192
    if-eqz v0, :cond_a

    .line 193
    .line 194
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l()V

    .line 195
    .line 196
    .line 197
    :cond_a
    const/4 v0, 0x1

    .line 198
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->g:Z

    .line 199
    .line 200
    const/4 v2, 0x0

    .line 201
    iput-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->f:Z

    .line 202
    .line 203
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 208
    .line 209
    .line 210
    :cond_b
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->e:Z

    .line 211
    .line 212
    if-eqz v0, :cond_c

    .line 213
    .line 214
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->g:Z

    .line 215
    .line 216
    if-eqz v0, :cond_c

    .line 217
    .line 218
    const/4 v2, 0x0

    .line 219
    iput-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->g:Z

    .line 220
    .line 221
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 226
    .line 227
    .line 228
    :cond_c
    if-eqz v4, :cond_d

    .line 229
    .line 230
    const/4 v0, 0x1

    .line 231
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->p:Z

    .line 232
    .line 233
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 238
    .line 239
    .line 240
    const/4 v4, 0x0

    .line 241
    const/4 v13, 0x0

    .line 242
    :cond_d
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->f()Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-eqz v0, :cond_1e

    .line 247
    .line 248
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 249
    .line 250
    if-nez v0, :cond_f

    .line 251
    .line 252
    if-eqz v5, :cond_e

    .line 253
    .line 254
    const/4 v5, 0x0

    .line 255
    goto :goto_5

    .line 256
    :cond_e
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0, v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->g(Lcom/immomo/moment/media/momofilter/GLTextureView$j;)Z

    .line 261
    .line 262
    .line 263
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 264
    if-eqz v0, :cond_f

    .line 265
    .line 266
    :try_start_4
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 267
    .line 268
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->h()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 269
    .line 270
    .line 271
    const/4 v0, 0x1

    .line 272
    :try_start_5
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 273
    .line 274
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 279
    .line 280
    .line 281
    const/4 v7, 0x1

    .line 282
    goto :goto_5

    .line 283
    :catch_0
    move-exception v0

    .line 284
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    invoke-virtual {v2, v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->c(Lcom/immomo/moment/media/momofilter/GLTextureView$j;)V

    .line 289
    .line 290
    .line 291
    throw v0

    .line 292
    :cond_f
    :goto_5
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 293
    .line 294
    if-eqz v0, :cond_10

    .line 295
    .line 296
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 297
    .line 298
    if-nez v0, :cond_10

    .line 299
    .line 300
    const/4 v0, 0x1

    .line 301
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 302
    .line 303
    const/4 v8, 0x1

    .line 304
    const/4 v9, 0x1

    .line 305
    const/4 v10, 0x1

    .line 306
    :cond_10
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 307
    .line 308
    if-eqz v0, :cond_1e

    .line 309
    .line 310
    iget-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->r:Z

    .line 311
    .line 312
    if-eqz v0, :cond_11

    .line 313
    .line 314
    iget v11, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l:I

    .line 315
    .line 316
    iget v12, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->m:I

    .line 317
    .line 318
    const/4 v2, 0x0

    .line 319
    iput-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->r:Z

    .line 320
    .line 321
    const/4 v8, 0x1

    .line 322
    const/4 v10, 0x1

    .line 323
    const/4 v13, 0x1

    .line 324
    goto :goto_6

    .line 325
    :cond_11
    const/4 v2, 0x0

    .line 326
    :goto_6
    iput-boolean v2, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->o:Z

    .line 327
    .line 328
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 333
    .line 334
    .line 335
    :goto_7
    monitor-exit v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 336
    if-eqz v14, :cond_12

    .line 337
    .line 338
    :try_start_6
    invoke-interface {v14}, Ljava/lang/Runnable;->run()V

    .line 339
    .line 340
    .line 341
    move v0, v2

    .line 342
    goto/16 :goto_0

    .line 343
    .line 344
    :catchall_2
    move-exception v0

    .line 345
    goto/16 :goto_b

    .line 346
    .line 347
    :cond_12
    if-eqz v8, :cond_14

    .line 348
    .line 349
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 350
    .line 351
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->b()Z

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    if-eqz v0, :cond_13

    .line 356
    .line 357
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 358
    .line 359
    .line 360
    move-result-object v8

    .line 361
    monitor-enter v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 362
    const/4 v0, 0x1

    .line 363
    :try_start_7
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->j:Z

    .line 364
    .line 365
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 370
    .line 371
    .line 372
    monitor-exit v8

    .line 373
    move v8, v2

    .line 374
    goto :goto_8

    .line 375
    :catchall_3
    move-exception v0

    .line 376
    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 377
    :try_start_8
    throw v0

    .line 378
    :cond_13
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 379
    .line 380
    .line 381
    move-result-object v15

    .line 382
    monitor-enter v15
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 383
    const/4 v0, 0x1

    .line 384
    :try_start_9
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->j:Z

    .line 385
    .line 386
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->f:Z

    .line 387
    .line 388
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 393
    .line 394
    .line 395
    monitor-exit v15

    .line 396
    move v0, v2

    .line 397
    goto/16 :goto_1

    .line 398
    .line 399
    :catchall_4
    move-exception v0

    .line 400
    monitor-exit v15
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 401
    :try_start_a
    throw v0

    .line 402
    :cond_14
    :goto_8
    if-eqz v9, :cond_15

    .line 403
    .line 404
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 405
    .line 406
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->a()Ljavax/microedition/khronos/opengles/GL;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    .line 411
    .line 412
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 413
    .line 414
    .line 415
    move-result-object v6

    .line 416
    invoke-virtual {v6, v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->a(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 417
    .line 418
    .line 419
    move-object v6, v0

    .line 420
    move v9, v2

    .line 421
    :cond_15
    if-eqz v7, :cond_17

    .line 422
    .line 423
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->t:Ljava/lang/ref/WeakReference;

    .line 424
    .line 425
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    check-cast v0, Lcom/immomo/moment/media/momofilter/GLTextureView;

    .line 430
    .line 431
    if-eqz v0, :cond_16

    .line 432
    .line 433
    invoke-static {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView;->a(Lcom/immomo/moment/media/momofilter/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    iget-object v7, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 438
    .line 439
    iget-object v7, v7, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->e:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 440
    .line 441
    invoke-interface {v0, v6, v7}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 442
    .line 443
    .line 444
    :cond_16
    move v7, v2

    .line 445
    :cond_17
    if-eqz v10, :cond_19

    .line 446
    .line 447
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->t:Ljava/lang/ref/WeakReference;

    .line 448
    .line 449
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    check-cast v0, Lcom/immomo/moment/media/momofilter/GLTextureView;

    .line 454
    .line 455
    if-eqz v0, :cond_18

    .line 456
    .line 457
    invoke-static {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView;->a(Lcom/immomo/moment/media/momofilter/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    invoke-interface {v0, v6, v11, v12}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 462
    .line 463
    .line 464
    :cond_18
    move v10, v2

    .line 465
    :cond_19
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->t:Ljava/lang/ref/WeakReference;

    .line 466
    .line 467
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    check-cast v0, Lcom/immomo/moment/media/momofilter/GLTextureView;

    .line 472
    .line 473
    if-eqz v0, :cond_1a

    .line 474
    .line 475
    invoke-static {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView;->a(Lcom/immomo/moment/media/momofilter/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    invoke-interface {v0, v6}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 480
    .line 481
    .line 482
    :cond_1a
    iget-object v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 483
    .line 484
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->i()I

    .line 485
    .line 486
    .line 487
    move-result v0

    .line 488
    const/16 v15, 0x3000

    .line 489
    .line 490
    if-eq v0, v15, :cond_1c

    .line 491
    .line 492
    const/16 v15, 0x300e

    .line 493
    .line 494
    if-eq v0, v15, :cond_1b

    .line 495
    .line 496
    const-string v15, "GLThread"

    .line 497
    .line 498
    const-string v2, "eglSwapBuffers"

    .line 499
    .line 500
    invoke-static {v15, v2, v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->g(Ljava/lang/String;Ljava/lang/String;I)V

    .line 501
    .line 502
    .line 503
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    monitor-enter v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 508
    const/4 v0, 0x1

    .line 509
    :try_start_b
    iput-boolean v0, v1, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->f:Z

    .line 510
    .line 511
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 512
    .line 513
    .line 514
    move-result-object v15

    .line 515
    invoke-virtual {v15}, Ljava/lang/Object;->notifyAll()V

    .line 516
    .line 517
    .line 518
    monitor-exit v2

    .line 519
    goto :goto_9

    .line 520
    :catchall_5
    move-exception v0

    .line 521
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 522
    :try_start_c
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 523
    :cond_1b
    const/4 v0, 0x1

    .line 524
    move v3, v0

    .line 525
    goto :goto_9

    .line 526
    :cond_1c
    const/4 v0, 0x1

    .line 527
    :goto_9
    if-eqz v13, :cond_1d

    .line 528
    .line 529
    move v4, v0

    .line 530
    :cond_1d
    const/4 v0, 0x0

    .line 531
    goto/16 :goto_1

    .line 532
    .line 533
    :cond_1e
    :try_start_d
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    .line 538
    .line 539
    .line 540
    const/4 v0, 0x0

    .line 541
    goto/16 :goto_2

    .line 542
    .line 543
    :goto_a
    monitor-exit v15
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 544
    :try_start_e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 545
    :goto_b
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 546
    .line 547
    .line 548
    move-result-object v2

    .line 549
    monitor-enter v2

    .line 550
    :try_start_f
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l()V

    .line 551
    .line 552
    .line 553
    invoke-direct {v1}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k()V

    .line 554
    .line 555
    .line 556
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 557
    throw v0

    .line 558
    :catchall_6
    move-exception v0

    .line 559
    :try_start_10
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 560
    throw v0
.end method

.method private f()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->e:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->f:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l:I

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->m:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->o:Z

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget p0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->n:I

    .line 27
    .line 28
    if-ne p0, v1, :cond_1

    .line 29
    .line 30
    :cond_0
    return v1

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private k()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->e()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 12
    .line 13
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->c(Lcom/immomo/moment/media/momofilter/GLTextureView$j;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->s:Lcom/immomo/moment/media/momofilter/GLTextureView$i;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$i;->c()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->i:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public c()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget p0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->n:I

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return p0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method

.method public e(II)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->l:I

    .line 7
    .line 8
    iput p2, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->m:I

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->r:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->o:Z

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->p:Z

    .line 17
    .line 18
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->b:Z

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->d:Z

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->p:Z

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->a()Z

    .line 38
    .line 39
    .line 40
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    :try_start_1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    monitor-exit v0

    .line 62
    return-void

    .line 63
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    throw p0
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->a:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    :try_start_1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    throw p0
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->k:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->o:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public j(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-gt p1, v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iput p1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->n:I

    .line 12
    .line 13
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0

    .line 25
    :cond_0
    const-string p0, "renderMode"

    .line 26
    .line 27
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x1

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->e:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->j:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->g:Z

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->j:Z

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    iget-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    :try_start_1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    monitor-exit v0

    .line 50
    return-void

    .line 51
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    throw p0
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->e:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->g:Z

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    :try_start_1
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 45
    throw p0
.end method

.method public run()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GLThread "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$j;->d()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :catch_0
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->f(Lcom/immomo/moment/media/momofilter/GLTextureView$j;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    invoke-static {}, Lcom/immomo/moment/media/momofilter/GLTextureView;->h()Lcom/immomo/moment/media/momofilter/GLTextureView$k;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, p0}, Lcom/immomo/moment/media/momofilter/GLTextureView$k;->f(Lcom/immomo/moment/media/momofilter/GLTextureView$j;)V

    .line 39
    .line 40
    .line 41
    throw v0
.end method
