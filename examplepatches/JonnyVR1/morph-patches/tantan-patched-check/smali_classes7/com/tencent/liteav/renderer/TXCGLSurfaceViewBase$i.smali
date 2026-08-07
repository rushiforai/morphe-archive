.class Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
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

.field private s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

.field private t:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;",
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
            "Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;",
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
    iput-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->q:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->r:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l:I

    .line 16
    .line 17
    iput v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->m:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->o:Z

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->n:I

    .line 22
    .line 23
    iput-object p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;Z)Z
    .locals 0

    .line 71
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->b:Z

    return p1
.end method

.method private j()V
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
    new-instance v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v0, v2}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 14
    .line 15
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 16
    .line 17
    move v0, v2

    .line 18
    move v4, v0

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
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iget-boolean v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a:Z

    .line 35
    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 39
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    monitor-enter v2

    .line 44
    :try_start_2
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k()V

    .line 45
    .line 46
    .line 47
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l()V

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
    goto/16 :goto_e

    .line 57
    .line 58
    :cond_0
    :try_start_3
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->q:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-nez v3, :cond_1

    .line 65
    .line 66
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->q:Ljava/util/ArrayList;

    .line 67
    .line 68
    const/4 v14, 0x0

    .line 69
    invoke-virtual {v3, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    move-object v14, v3

    .line 74
    check-cast v14, Ljava/lang/Runnable;

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    goto/16 :goto_a

    .line 78
    .line 79
    :cond_1
    iget-boolean v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->d:Z

    .line 80
    .line 81
    iget-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->c:Z

    .line 82
    .line 83
    if-eq v3, v2, :cond_2

    .line 84
    .line 85
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->d:Z

    .line 86
    .line 87
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 92
    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_2
    const/4 v2, 0x0

    .line 96
    :goto_3
    iget-boolean v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k:Z

    .line 97
    .line 98
    if-eqz v3, :cond_3

    .line 99
    .line 100
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k()V

    .line 101
    .line 102
    .line 103
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l()V

    .line 104
    .line 105
    .line 106
    const/4 v3, 0x0

    .line 107
    iput-boolean v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k:Z

    .line 108
    .line 109
    const/4 v5, 0x1

    .line 110
    :cond_3
    if-eqz v0, :cond_4

    .line 111
    .line 112
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k()V

    .line 113
    .line 114
    .line 115
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l()V

    .line 116
    .line 117
    .line 118
    const/4 v3, 0x0

    .line 119
    goto :goto_4

    .line 120
    :cond_4
    move v3, v0

    .line 121
    :goto_4
    if-eqz v2, :cond_5

    .line 122
    .line 123
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 124
    .line 125
    if-eqz v0, :cond_5

    .line 126
    .line 127
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k()V

    .line 128
    .line 129
    .line 130
    :cond_5
    if-eqz v2, :cond_8

    .line 131
    .line 132
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 133
    .line 134
    if-eqz v0, :cond_8

    .line 135
    .line 136
    iget-object v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;

    .line 143
    .line 144
    if-nez v0, :cond_6

    .line 145
    .line 146
    const/4 v0, 0x0

    .line 147
    goto :goto_5

    .line 148
    :cond_6
    invoke-static {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->a(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    :goto_5
    if-eqz v0, :cond_7

    .line 153
    .line 154
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->a()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    :cond_7
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l()V

    .line 165
    .line 166
    .line 167
    :cond_8
    if-eqz v2, :cond_9

    .line 168
    .line 169
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->b()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_9

    .line 178
    .line 179
    iget-object v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->h()V

    .line 182
    .line 183
    .line 184
    :cond_9
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e:Z

    .line 185
    .line 186
    if-nez v0, :cond_b

    .line 187
    .line 188
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g:Z

    .line 189
    .line 190
    if-nez v0, :cond_b

    .line 191
    .line 192
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 193
    .line 194
    if-eqz v0, :cond_a

    .line 195
    .line 196
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k()V

    .line 197
    .line 198
    .line 199
    :cond_a
    const/4 v2, 0x1

    .line 200
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g:Z

    .line 201
    .line 202
    const/4 v2, 0x0

    .line 203
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->f:Z

    .line 204
    .line 205
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 210
    .line 211
    .line 212
    :cond_b
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e:Z

    .line 213
    .line 214
    if-eqz v0, :cond_c

    .line 215
    .line 216
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g:Z

    .line 217
    .line 218
    if-eqz v0, :cond_c

    .line 219
    .line 220
    const/4 v2, 0x0

    .line 221
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g:Z

    .line 222
    .line 223
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 228
    .line 229
    .line 230
    :cond_c
    if-eqz v4, :cond_d

    .line 231
    .line 232
    const/4 v2, 0x1

    .line 233
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->p:Z

    .line 234
    .line 235
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 240
    .line 241
    .line 242
    const/4 v4, 0x0

    .line 243
    const/4 v11, 0x0

    .line 244
    :cond_d
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->m()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_1e

    .line 249
    .line 250
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 251
    .line 252
    if-nez v0, :cond_f

    .line 253
    .line 254
    if-eqz v5, :cond_e

    .line 255
    .line 256
    const/4 v5, 0x0

    .line 257
    goto :goto_8

    .line 258
    :cond_e
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->b(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;)Z

    .line 263
    .line 264
    .line 265
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 266
    if-eqz v0, :cond_f

    .line 267
    .line 268
    :try_start_4
    iget-object v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 269
    .line 270
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->a()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 271
    .line 272
    .line 273
    :goto_6
    const/4 v2, 0x1

    .line 274
    goto :goto_7

    .line 275
    :catch_0
    move-exception v0

    .line 276
    :try_start_5
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-virtual {v2, v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->c(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;)V

    .line 281
    .line 282
    .line 283
    const-string v2, "TXCGLSurfaceViewBase"

    .line 284
    .line 285
    const-string v7, "egl start error "

    .line 286
    .line 287
    invoke-static {v2, v7, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 288
    .line 289
    .line 290
    goto :goto_6

    .line 291
    :goto_7
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 292
    .line 293
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 298
    .line 299
    .line 300
    const/4 v7, 0x1

    .line 301
    :cond_f
    :goto_8
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 302
    .line 303
    if-eqz v0, :cond_10

    .line 304
    .line 305
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 306
    .line 307
    if-nez v0, :cond_10

    .line 308
    .line 309
    const/4 v2, 0x1

    .line 310
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 311
    .line 312
    const/4 v8, 0x1

    .line 313
    const/4 v9, 0x1

    .line 314
    const/4 v10, 0x1

    .line 315
    :cond_10
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 316
    .line 317
    if-eqz v0, :cond_1e

    .line 318
    .line 319
    iget-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->r:Z

    .line 320
    .line 321
    if-eqz v0, :cond_11

    .line 322
    .line 323
    iget v12, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l:I

    .line 324
    .line 325
    iget v13, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->m:I

    .line 326
    .line 327
    const/4 v2, 0x0

    .line 328
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->r:Z

    .line 329
    .line 330
    const/4 v8, 0x1

    .line 331
    const/4 v10, 0x1

    .line 332
    const/4 v11, 0x1

    .line 333
    goto :goto_9

    .line 334
    :cond_11
    const/4 v2, 0x0

    .line 335
    :goto_9
    iput-boolean v2, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->o:Z

    .line 336
    .line 337
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 342
    .line 343
    .line 344
    move v0, v3

    .line 345
    :goto_a
    monitor-exit v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 346
    if-eqz v14, :cond_12

    .line 347
    .line 348
    :try_start_6
    invoke-interface {v14}, Ljava/lang/Runnable;->run()V

    .line 349
    .line 350
    .line 351
    goto/16 :goto_0

    .line 352
    .line 353
    :catchall_2
    move-exception v0

    .line 354
    goto/16 :goto_f

    .line 355
    .line 356
    :cond_12
    if-eqz v8, :cond_14

    .line 357
    .line 358
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 359
    .line 360
    invoke-virtual {v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->b()Z

    .line 361
    .line 362
    .line 363
    move-result v3

    .line 364
    if-eqz v3, :cond_13

    .line 365
    .line 366
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    monitor-enter v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 371
    const/4 v8, 0x1

    .line 372
    :try_start_7
    iput-boolean v8, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->j:Z

    .line 373
    .line 374
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 375
    .line 376
    .line 377
    move-result-object v8

    .line 378
    invoke-virtual {v8}, Ljava/lang/Object;->notifyAll()V

    .line 379
    .line 380
    .line 381
    monitor-exit v3

    .line 382
    move v8, v2

    .line 383
    goto :goto_b

    .line 384
    :catchall_3
    move-exception v0

    .line 385
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 386
    :try_start_8
    throw v0

    .line 387
    :cond_13
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    monitor-enter v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 392
    const/4 v15, 0x1

    .line 393
    :try_start_9
    iput-boolean v15, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->j:Z

    .line 394
    .line 395
    iput-boolean v15, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->f:Z

    .line 396
    .line 397
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 398
    .line 399
    .line 400
    move-result-object v15

    .line 401
    invoke-virtual {v15}, Ljava/lang/Object;->notifyAll()V

    .line 402
    .line 403
    .line 404
    monitor-exit v3

    .line 405
    goto/16 :goto_1

    .line 406
    .line 407
    :catchall_4
    move-exception v0

    .line 408
    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 409
    :try_start_a
    throw v0

    .line 410
    :cond_14
    :goto_b
    if-eqz v9, :cond_15

    .line 411
    .line 412
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 413
    .line 414
    invoke-virtual {v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->e()Ljavax/microedition/khronos/opengles/GL;

    .line 415
    .line 416
    .line 417
    move-result-object v3

    .line 418
    check-cast v3, Ljavax/microedition/khronos/opengles/GL10;

    .line 419
    .line 420
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 421
    .line 422
    .line 423
    move-result-object v6

    .line 424
    invoke-virtual {v6, v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->a(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 425
    .line 426
    .line 427
    move v9, v2

    .line 428
    move-object v6, v3

    .line 429
    :cond_15
    if-eqz v7, :cond_17

    .line 430
    .line 431
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 432
    .line 433
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v3

    .line 437
    check-cast v3, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;

    .line 438
    .line 439
    if-eqz v3, :cond_16

    .line 440
    .line 441
    invoke-static {v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 442
    .line 443
    .line 444
    move-result-object v3

    .line 445
    iget-object v7, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 446
    .line 447
    iget-object v7, v7, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->d:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 448
    .line 449
    invoke-interface {v3, v6, v7}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 450
    .line 451
    .line 452
    :cond_16
    move v7, v2

    .line 453
    :cond_17
    if-eqz v10, :cond_19

    .line 454
    .line 455
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 456
    .line 457
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    move-result-object v3

    .line 461
    check-cast v3, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;

    .line 462
    .line 463
    if-eqz v3, :cond_18

    .line 464
    .line 465
    invoke-static {v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 466
    .line 467
    .line 468
    move-result-object v3

    .line 469
    invoke-interface {v3, v6, v12, v13}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 470
    .line 471
    .line 472
    :cond_18
    move v10, v2

    .line 473
    :cond_19
    iget-object v3, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 474
    .line 475
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v3

    .line 479
    check-cast v3, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;

    .line 480
    .line 481
    const/16 v15, 0x3000

    .line 482
    .line 483
    if-eqz v3, :cond_1a

    .line 484
    .line 485
    invoke-static {v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->b(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;)Landroid/opengl/GLSurfaceView$Renderer;

    .line 486
    .line 487
    .line 488
    move-result-object v2

    .line 489
    invoke-interface {v2, v6}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {v3}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->c()I

    .line 493
    .line 494
    .line 495
    move-result v2

    .line 496
    goto :goto_c

    .line 497
    :cond_1a
    move v2, v15

    .line 498
    :goto_c
    if-eq v2, v15, :cond_1c

    .line 499
    .line 500
    const/16 v3, 0x300e

    .line 501
    .line 502
    if-eq v2, v3, :cond_1b

    .line 503
    .line 504
    const-string v3, "GLThread"

    .line 505
    .line 506
    const-string v15, "eglSwapBuffers"

    .line 507
    .line 508
    invoke-static {v3, v15, v2}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->a(Ljava/lang/String;Ljava/lang/String;I)V

    .line 509
    .line 510
    .line 511
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 512
    .line 513
    .line 514
    move-result-object v2

    .line 515
    monitor-enter v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 516
    const/4 v15, 0x1

    .line 517
    :try_start_b
    iput-boolean v15, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->f:Z

    .line 518
    .line 519
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 520
    .line 521
    .line 522
    move-result-object v3

    .line 523
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 524
    .line 525
    .line 526
    monitor-exit v2

    .line 527
    goto :goto_d

    .line 528
    :catchall_5
    move-exception v0

    .line 529
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 530
    :try_start_c
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 531
    :cond_1b
    const/4 v15, 0x1

    .line 532
    move v0, v15

    .line 533
    goto :goto_d

    .line 534
    :cond_1c
    const/4 v15, 0x1

    .line 535
    :goto_d
    if-eqz v11, :cond_1d

    .line 536
    .line 537
    move v4, v15

    .line 538
    :cond_1d
    const/4 v2, 0x0

    .line 539
    goto/16 :goto_1

    .line 540
    .line 541
    :cond_1e
    :try_start_d
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    .line 546
    .line 547
    .line 548
    move v0, v3

    .line 549
    const/4 v2, 0x0

    .line 550
    goto/16 :goto_2

    .line 551
    .line 552
    :goto_e
    monitor-exit v15
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 553
    :try_start_e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 554
    :goto_f
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 555
    .line 556
    .line 557
    move-result-object v2

    .line 558
    monitor-enter v2

    .line 559
    :try_start_f
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k()V

    .line 560
    .line 561
    .line 562
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l()V

    .line 563
    .line 564
    .line 565
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 566
    throw v0

    .line 567
    :catchall_6
    move-exception v0

    .line 568
    :try_start_10
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 569
    throw v0
.end method

.method private k()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->g()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->h()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->t:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iput-boolean v0, v1, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f:Z

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->c(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method private m()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->f:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l:I

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->m:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->o:Z

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->n:I

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


# virtual methods
.method public a(I)V
    .locals 1

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-gt p1, v0, :cond_0

    .line 66
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    move-result-object v0

    monitor-enter v0

    .line 67
    :try_start_0
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->n:I

    .line 68
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 69
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 70
    :cond_0
    const-string p0, "renderMode"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a(II)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->l:I

    .line 7
    .line 8
    iput p2, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->m:I

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->r:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->o:Z

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->p:Z

    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->b:Z

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->d:Z

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->p:Z

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->d()Z

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
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 72
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    move-result-object v0

    monitor-enter v0

    .line 73
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->q:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 75
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 76
    :cond_0
    const-string p0, "r must not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 65
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->c()Z

    move-result p0

    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->s:Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->i:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->m()Z

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

.method public e()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget p0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->n:I

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

.method public f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iput-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->j:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g:Z

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->j:Z

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    :try_start_1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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

.method public g()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iput-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->e:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->g:Z

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    :try_start_1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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

.method public h()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iput-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->a:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    :try_start_1
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->k:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

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
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;->j()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :catch_0
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->a(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    invoke-static {}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase;->f()Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, p0}, Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$j;->a(Lcom/tencent/liteav/renderer/TXCGLSurfaceViewBase$i;)V

    .line 39
    .line 40
    .line 41
    throw v0
.end method
