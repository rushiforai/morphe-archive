.class public final Lcom/google/android/exoplayer2/i;
.super Lcom/google/android/exoplayer2/c;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/ExoPlayer;
.implements Lcom/google/android/exoplayer2/ExoPlayer$a;
.implements Lcom/google/android/exoplayer2/ExoPlayer$f;
.implements Lcom/google/android/exoplayer2/ExoPlayer$e;
.implements Lcom/google/android/exoplayer2/ExoPlayer$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/i$c;,
        Lcom/google/android/exoplayer2/i$d;,
        Lcom/google/android/exoplayer2/i$b;,
        Lcom/google/android/exoplayer2/i$e;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final A:Lcom/google/android/exoplayer2/b;

.field public final B:Lcom/google/android/exoplayer2/StreamVolumeManager;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final C:Ll/wop0;

.field public final D:Ll/kfq0;

.field public final E:J

.field public F:I

.field public G:Z

.field public H:I

.field public I:I

.field public J:Z

.field public K:I

.field public L:Z

.field public M:Ll/nke0;

.field public N:Ll/n8f0;

.field public O:Z

.field public P:Lcom/google/android/exoplayer2/t$b;

.field public Q:Lcom/google/android/exoplayer2/o;

.field public R:Lcom/google/android/exoplayer2/o;

.field public S:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public T:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public U:Landroid/media/AudioTrack;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public V:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public W:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public X:Landroid/view/SurfaceHolder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public Z:Z

.field public a0:Landroid/view/TextureView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/dgj0;

.field public b0:I

.field public final c:Lcom/google/android/exoplayer2/t$b;

.field public c0:I

.field public final d:Ll/wt5;

.field public d0:Ll/brf0;

.field public final e:Landroid/content/Context;

.field public e0:Ll/jid;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final f:Lcom/google/android/exoplayer2/t;

.field public f0:Ll/jid;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:[Lcom/google/android/exoplayer2/x;

.field public g0:I

.field public final h:Ll/cgj0;

.field public h0:Lcom/google/android/exoplayer2/audio/a;

.field public final i:Ll/sxk;

.field public i0:F

.field public final j:Lcom/google/android/exoplayer2/j$f;

.field public j0:Z

.field public final k:Lcom/google/android/exoplayer2/j;

.field public k0:Ll/qyb;

.field public final l:Ll/bqr;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bqr<",
            "Lcom/google/android/exoplayer2/t$d;",
            ">;"
        }
    .end annotation
.end field

.field public l0:Ll/iel0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final m:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/google/android/exoplayer2/ExoPlayer$b;",
            ">;"
        }
    .end annotation
.end field

.field public m0:Ll/gb4;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final n:Lcom/google/android/exoplayer2/c0$b;

.field public n0:Z

.field public final o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/i$e;",
            ">;"
        }
    .end annotation
.end field

.field public o0:Z

.field public final p:Z

.field public p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final q:Lcom/google/android/exoplayer2/source/i$a;

.field public q0:Z

.field public final r:Ll/dk0;

.field public r0:Z

.field public final s:Landroid/os/Looper;

.field public s0:Lcom/google/android/exoplayer2/h;

.field public final t:Ll/md2;

.field public t0:Ll/zjl0;

.field public final u:J

.field public u0:Lcom/google/android/exoplayer2/o;

.field public final v:J

.field public v0:Ll/fe80;

.field public final w:Ll/qa5;

.field public w0:I

.field public final x:Lcom/google/android/exoplayer2/i$c;

.field public x0:I

.field public final y:Lcom/google/android/exoplayer2/i$d;

.field public y0:J

.field public final z:Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "goog.exo.exoplayer"

    .line 2
    .line 3
    invoke-static {v0}, Ll/t9f;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/ExoPlayer$c;Lcom/google/android/exoplayer2/t;)V
    .locals 31
    .param p2    # Lcom/google/android/exoplayer2/t;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, " [ExoPlayerLib/2.19.1] ["

    .line 6
    .line 7
    const-string v3, "Init "

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/google/android/exoplayer2/c;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v4, Ll/wt5;

    .line 13
    .line 14
    invoke-direct {v4}, Ll/wt5;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v4, v1, Lcom/google/android/exoplayer2/i;->d:Ll/wt5;

    .line 18
    .line 19
    :try_start_0
    const-string v5, "ExoPlayerImpl"

    .line 20
    .line 21
    new-instance v6, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    sget-object v2, Ll/bmk0;->e:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, "]"

    .line 46
    .line 47
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v5, v2}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v2, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iput-object v2, v1, Lcom/google/android/exoplayer2/i;->e:Landroid/content/Context;

    .line 64
    .line 65
    iget-object v3, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->i:Ll/adj;

    .line 66
    .line 67
    iget-object v5, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->b:Ll/qa5;

    .line 68
    .line 69
    invoke-interface {v3, v5}, Ll/adj;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    move-object v13, v3

    .line 74
    check-cast v13, Ll/dk0;

    .line 75
    .line 76
    iput-object v13, v1, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 77
    .line 78
    iget-object v3, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->k:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 79
    .line 80
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 81
    .line 82
    iget-object v3, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->l:Lcom/google/android/exoplayer2/audio/a;

    .line 83
    .line 84
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 85
    .line 86
    iget v3, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->r:I

    .line 87
    .line 88
    iput v3, v1, Lcom/google/android/exoplayer2/i;->b0:I

    .line 89
    .line 90
    iget v3, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->s:I

    .line 91
    .line 92
    iput v3, v1, Lcom/google/android/exoplayer2/i;->c0:I

    .line 93
    .line 94
    iget-boolean v3, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->p:Z

    .line 95
    .line 96
    iput-boolean v3, v1, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 97
    .line 98
    iget-wide v5, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->z:J

    .line 99
    .line 100
    iput-wide v5, v1, Lcom/google/android/exoplayer2/i;->E:J

    .line 101
    .line 102
    new-instance v9, Lcom/google/android/exoplayer2/i$c;

    .line 103
    .line 104
    const/4 v3, 0x0

    .line 105
    invoke-direct {v9, v1, v3}, Lcom/google/android/exoplayer2/i$c;-><init>(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/i$a;)V

    .line 106
    .line 107
    .line 108
    iput-object v9, v1, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 109
    .line 110
    new-instance v5, Lcom/google/android/exoplayer2/i$d;

    .line 111
    .line 112
    invoke-direct {v5, v3}, Lcom/google/android/exoplayer2/i$d;-><init>(Lcom/google/android/exoplayer2/i$a;)V

    .line 113
    .line 114
    .line 115
    iput-object v5, v1, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 116
    .line 117
    new-instance v8, Landroid/os/Handler;

    .line 118
    .line 119
    iget-object v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->j:Landroid/os/Looper;

    .line 120
    .line 121
    invoke-direct {v8, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 122
    .line 123
    .line 124
    iget-object v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->d:Ll/b7h0;

    .line 125
    .line 126
    invoke-interface {v6}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    move-object v7, v6

    .line 131
    check-cast v7, Ll/lzc0;

    .line 132
    .line 133
    move-object v10, v9

    .line 134
    move-object v11, v9

    .line 135
    move-object v12, v9

    .line 136
    invoke-interface/range {v7 .. v12}, Ll/lzc0;->a(Landroid/os/Handler;Ll/wjl0;Lcom/google/android/exoplayer2/audio/c;Ll/asi0;Ll/ga00;)[Lcom/google/android/exoplayer2/x;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    iput-object v6, v1, Lcom/google/android/exoplayer2/i;->g:[Lcom/google/android/exoplayer2/x;

    .line 141
    .line 142
    array-length v7, v6

    .line 143
    if-lez v7, :cond_0

    .line 144
    .line 145
    const/4 v7, 0x1

    .line 146
    goto :goto_0

    .line 147
    :cond_0
    const/4 v7, 0x0

    .line 148
    :goto_0
    invoke-static {v7}, Ll/w11;->g(Z)V

    .line 149
    .line 150
    .line 151
    iget-object v7, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->f:Ll/b7h0;

    .line 152
    .line 153
    invoke-interface {v7}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    check-cast v7, Ll/cgj0;

    .line 158
    .line 159
    iput-object v7, v1, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 160
    .line 161
    iget-object v12, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->e:Ll/b7h0;

    .line 162
    .line 163
    invoke-interface {v12}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v12

    .line 167
    check-cast v12, Lcom/google/android/exoplayer2/source/i$a;

    .line 168
    .line 169
    iput-object v12, v1, Lcom/google/android/exoplayer2/i;->q:Lcom/google/android/exoplayer2/source/i$a;

    .line 170
    .line 171
    iget-object v12, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->h:Ll/b7h0;

    .line 172
    .line 173
    invoke-interface {v12}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v12

    .line 177
    check-cast v12, Ll/md2;

    .line 178
    .line 179
    iput-object v12, v1, Lcom/google/android/exoplayer2/i;->t:Ll/md2;

    .line 180
    .line 181
    iget-boolean v14, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->t:Z

    .line 182
    .line 183
    iput-boolean v14, v1, Lcom/google/android/exoplayer2/i;->p:Z

    .line 184
    .line 185
    iget-object v14, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->u:Ll/nke0;

    .line 186
    .line 187
    iput-object v14, v1, Lcom/google/android/exoplayer2/i;->M:Ll/nke0;

    .line 188
    .line 189
    iget-wide v14, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->v:J

    .line 190
    .line 191
    iput-wide v14, v1, Lcom/google/android/exoplayer2/i;->u:J

    .line 192
    .line 193
    iget-wide v14, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->w:J

    .line 194
    .line 195
    iput-wide v14, v1, Lcom/google/android/exoplayer2/i;->v:J

    .line 196
    .line 197
    iget-boolean v14, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->A:Z

    .line 198
    .line 199
    iput-boolean v14, v1, Lcom/google/android/exoplayer2/i;->O:Z

    .line 200
    .line 201
    iget-object v14, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->j:Landroid/os/Looper;

    .line 202
    .line 203
    iput-object v14, v1, Lcom/google/android/exoplayer2/i;->s:Landroid/os/Looper;

    .line 204
    .line 205
    iget-object v15, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->b:Ll/qa5;

    .line 206
    .line 207
    iput-object v15, v1, Lcom/google/android/exoplayer2/i;->w:Ll/qa5;

    .line 208
    .line 209
    if-nez p2, :cond_1

    .line 210
    .line 211
    move-object v11, v1

    .line 212
    goto :goto_1

    .line 213
    :cond_1
    move-object/from16 v11, p2

    .line 214
    .line 215
    :goto_1
    iput-object v11, v1, Lcom/google/android/exoplayer2/i;->f:Lcom/google/android/exoplayer2/t;

    .line 216
    .line 217
    new-instance v3, Ll/bqr;

    .line 218
    .line 219
    new-instance v10, Ll/n8f;

    .line 220
    .line 221
    invoke-direct {v10, v1}, Ll/n8f;-><init>(Lcom/google/android/exoplayer2/i;)V

    .line 222
    .line 223
    .line 224
    invoke-direct {v3, v14, v15, v10}, Ll/bqr;-><init>(Landroid/os/Looper;Ll/qa5;Ll/bqr$b;)V

    .line 225
    .line 226
    .line 227
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 228
    .line 229
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 230
    .line 231
    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 232
    .line 233
    .line 234
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->m:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 235
    .line 236
    new-instance v3, Ljava/util/ArrayList;

    .line 237
    .line 238
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 239
    .line 240
    .line 241
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 242
    .line 243
    new-instance v3, Ll/n8f0$a;

    .line 244
    .line 245
    const/4 v10, 0x0

    .line 246
    invoke-direct {v3, v10}, Ll/n8f0$a;-><init>(I)V

    .line 247
    .line 248
    .line 249
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 250
    .line 251
    move-object v3, v8

    .line 252
    new-instance v8, Ll/dgj0;

    .line 253
    .line 254
    array-length v10, v6

    .line 255
    new-array v10, v10, [Ll/jzc0;

    .line 256
    .line 257
    move-object/from16 p2, v3

    .line 258
    .line 259
    array-length v3, v6

    .line 260
    new-array v3, v3, [Ll/u9f;

    .line 261
    .line 262
    move-object/from16 v24, v4

    .line 263
    .line 264
    sget-object v4, Lcom/google/android/exoplayer2/d0;->b:Lcom/google/android/exoplayer2/d0;

    .line 265
    .line 266
    move-object/from16 v18, v5

    .line 267
    .line 268
    const/4 v5, 0x0

    .line 269
    invoke-direct {v8, v10, v3, v4, v5}, Ll/dgj0;-><init>([Ll/jzc0;[Ll/u9f;Lcom/google/android/exoplayer2/d0;Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    iput-object v8, v1, Lcom/google/android/exoplayer2/i;->b:Ll/dgj0;

    .line 273
    .line 274
    new-instance v3, Lcom/google/android/exoplayer2/c0$b;

    .line 275
    .line 276
    invoke-direct {v3}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 277
    .line 278
    .line 279
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 280
    .line 281
    new-instance v3, Lcom/google/android/exoplayer2/t$b$a;

    .line 282
    .line 283
    invoke-direct {v3}, Lcom/google/android/exoplayer2/t$b$a;-><init>()V

    .line 284
    .line 285
    .line 286
    const/16 v4, 0x13

    .line 287
    .line 288
    new-array v4, v4, [I

    .line 289
    .line 290
    fill-array-data v4, :array_0

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/t$b$a;->c([I)Lcom/google/android/exoplayer2/t$b$a;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    invoke-virtual {v7}, Ll/cgj0;->h()Z

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    const/16 v5, 0x1d

    .line 302
    .line 303
    invoke-virtual {v3, v5, v4}, Lcom/google/android/exoplayer2/t$b$a;->d(IZ)Lcom/google/android/exoplayer2/t$b$a;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->q:Z

    .line 308
    .line 309
    const/16 v5, 0x17

    .line 310
    .line 311
    invoke-virtual {v3, v5, v4}, Lcom/google/android/exoplayer2/t$b$a;->d(IZ)Lcom/google/android/exoplayer2/t$b$a;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->q:Z

    .line 316
    .line 317
    const/16 v5, 0x19

    .line 318
    .line 319
    invoke-virtual {v3, v5, v4}, Lcom/google/android/exoplayer2/t$b$a;->d(IZ)Lcom/google/android/exoplayer2/t$b$a;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->q:Z

    .line 324
    .line 325
    const/16 v5, 0x21

    .line 326
    .line 327
    invoke-virtual {v3, v5, v4}, Lcom/google/android/exoplayer2/t$b$a;->d(IZ)Lcom/google/android/exoplayer2/t$b$a;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->q:Z

    .line 332
    .line 333
    const/16 v5, 0x1a

    .line 334
    .line 335
    invoke-virtual {v3, v5, v4}, Lcom/google/android/exoplayer2/t$b$a;->d(IZ)Lcom/google/android/exoplayer2/t$b$a;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->q:Z

    .line 340
    .line 341
    const/16 v5, 0x22

    .line 342
    .line 343
    invoke-virtual {v3, v5, v4}, Lcom/google/android/exoplayer2/t$b$a;->d(IZ)Lcom/google/android/exoplayer2/t$b$a;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/t$b$a;->e()Lcom/google/android/exoplayer2/t$b;

    .line 348
    .line 349
    .line 350
    move-result-object v3

    .line 351
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->c:Lcom/google/android/exoplayer2/t$b;

    .line 352
    .line 353
    new-instance v4, Lcom/google/android/exoplayer2/t$b$a;

    .line 354
    .line 355
    invoke-direct {v4}, Lcom/google/android/exoplayer2/t$b$a;-><init>()V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v4, v3}, Lcom/google/android/exoplayer2/t$b$a;->b(Lcom/google/android/exoplayer2/t$b;)Lcom/google/android/exoplayer2/t$b$a;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    const/4 v4, 0x4

    .line 363
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/t$b$a;->a(I)Lcom/google/android/exoplayer2/t$b$a;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    const/16 v5, 0xa

    .line 368
    .line 369
    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer2/t$b$a;->a(I)Lcom/google/android/exoplayer2/t$b$a;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/t$b$a;->e()Lcom/google/android/exoplayer2/t$b;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->P:Lcom/google/android/exoplayer2/t$b;

    .line 378
    .line 379
    const/4 v3, 0x0

    .line 380
    invoke-interface {v15, v14, v3}, Ll/qa5;->c(Landroid/os/Looper;Landroid/os/Handler$Callback;)Ll/sxk;

    .line 381
    .line 382
    .line 383
    move-result-object v10

    .line 384
    iput-object v10, v1, Lcom/google/android/exoplayer2/i;->i:Ll/sxk;

    .line 385
    .line 386
    new-instance v3, Ll/o8f;

    .line 387
    .line 388
    invoke-direct {v3, v1}, Ll/o8f;-><init>(Lcom/google/android/exoplayer2/i;)V

    .line 389
    .line 390
    .line 391
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->j:Lcom/google/android/exoplayer2/j$f;

    .line 392
    .line 393
    invoke-static {v8}, Ll/fe80;->k(Ll/dgj0;)Ll/fe80;

    .line 394
    .line 395
    .line 396
    move-result-object v10

    .line 397
    iput-object v10, v1, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 398
    .line 399
    invoke-interface {v13, v11, v14}, Ll/dk0;->G(Lcom/google/android/exoplayer2/t;Landroid/os/Looper;)V

    .line 400
    .line 401
    .line 402
    sget v10, Ll/bmk0;->a:I

    .line 403
    .line 404
    const/16 v11, 0x1f

    .line 405
    .line 406
    if-ge v10, v11, :cond_2

    .line 407
    .line 408
    new-instance v11, Ll/bf80;

    .line 409
    .line 410
    invoke-direct {v11}, Ll/bf80;-><init>()V

    .line 411
    .line 412
    .line 413
    :goto_2
    move-object/from16 v22, v11

    .line 414
    .line 415
    move v11, v5

    .line 416
    goto :goto_3

    .line 417
    :catchall_0
    move-exception v0

    .line 418
    goto/16 :goto_9

    .line 419
    .line 420
    :cond_2
    iget-boolean v11, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->B:Z

    .line 421
    .line 422
    invoke-static {v2, v1, v11}, Lcom/google/android/exoplayer2/i$b;->a(Landroid/content/Context;Lcom/google/android/exoplayer2/i;Z)Ll/bf80;

    .line 423
    .line 424
    .line 425
    move-result-object v11

    .line 426
    goto :goto_2

    .line 427
    :goto_3
    new-instance v5, Lcom/google/android/exoplayer2/j;

    .line 428
    .line 429
    iget-object v11, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->g:Ll/b7h0;

    .line 430
    .line 431
    invoke-interface {v11}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v11

    .line 435
    check-cast v11, Ll/ltv;

    .line 436
    .line 437
    move-object/from16 v20, v9

    .line 438
    .line 439
    move-object v9, v11

    .line 440
    iget v11, v1, Lcom/google/android/exoplayer2/i;->F:I

    .line 441
    .line 442
    move/from16 v21, v10

    .line 443
    .line 444
    move-object v10, v12

    .line 445
    iget-boolean v12, v1, Lcom/google/android/exoplayer2/i;->G:Z

    .line 446
    .line 447
    move-object/from16 v19, v14

    .line 448
    .line 449
    const/16 v23, 0xa

    .line 450
    .line 451
    iget-object v14, v1, Lcom/google/android/exoplayer2/i;->M:Ll/nke0;

    .line 452
    .line 453
    move-object/from16 v25, v20

    .line 454
    .line 455
    move-object/from16 v20, v15

    .line 456
    .line 457
    iget-object v15, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->x:Lcom/google/android/exoplayer2/m;

    .line 458
    .line 459
    move-object/from16 v26, v5

    .line 460
    .line 461
    iget-wide v4, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->y:J

    .line 462
    .line 463
    move-object/from16 v27, v2

    .line 464
    .line 465
    iget-boolean v2, v1, Lcom/google/android/exoplayer2/i;->O:Z

    .line 466
    .line 467
    move/from16 v28, v2

    .line 468
    .line 469
    iget-object v2, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->C:Landroid/os/Looper;

    .line 470
    .line 471
    move-object/from16 v29, p2

    .line 472
    .line 473
    move-object/from16 v23, v2

    .line 474
    .line 475
    move-wide/from16 v16, v4

    .line 476
    .line 477
    move-object/from16 v4, v18

    .line 478
    .line 479
    move/from16 v30, v21

    .line 480
    .line 481
    move-object/from16 v5, v26

    .line 482
    .line 483
    move/from16 v18, v28

    .line 484
    .line 485
    const/4 v2, 0x0

    .line 486
    move-object/from16 v21, v3

    .line 487
    .line 488
    move-object/from16 v3, v25

    .line 489
    .line 490
    invoke-direct/range {v5 .. v23}, Lcom/google/android/exoplayer2/j;-><init>([Lcom/google/android/exoplayer2/x;Ll/cgj0;Ll/dgj0;Ll/ltv;Ll/md2;IZLl/dk0;Ll/nke0;Lcom/google/android/exoplayer2/m;JZLandroid/os/Looper;Ll/qa5;Lcom/google/android/exoplayer2/j$f;Ll/bf80;Landroid/os/Looper;)V

    .line 491
    .line 492
    .line 493
    move-object v6, v5

    .line 494
    move-object/from16 v5, v19

    .line 495
    .line 496
    iput-object v6, v1, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 497
    .line 498
    const/high16 v8, 0x3f800000    # 1.0f

    .line 499
    .line 500
    iput v8, v1, Lcom/google/android/exoplayer2/i;->i0:F

    .line 501
    .line 502
    iput v2, v1, Lcom/google/android/exoplayer2/i;->F:I

    .line 503
    .line 504
    sget-object v8, Lcom/google/android/exoplayer2/o;->I:Lcom/google/android/exoplayer2/o;

    .line 505
    .line 506
    iput-object v8, v1, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 507
    .line 508
    iput-object v8, v1, Lcom/google/android/exoplayer2/i;->R:Lcom/google/android/exoplayer2/o;

    .line 509
    .line 510
    iput-object v8, v1, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 511
    .line 512
    const/4 v8, -0x1

    .line 513
    iput v8, v1, Lcom/google/android/exoplayer2/i;->w0:I

    .line 514
    .line 515
    const/16 v8, 0x15

    .line 516
    .line 517
    move/from16 v9, v30

    .line 518
    .line 519
    if-ge v9, v8, :cond_3

    .line 520
    .line 521
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/i;->D0(I)I

    .line 522
    .line 523
    .line 524
    move-result v8

    .line 525
    iput v8, v1, Lcom/google/android/exoplayer2/i;->g0:I

    .line 526
    .line 527
    goto :goto_4

    .line 528
    :cond_3
    invoke-static/range {v27 .. v27}, Ll/bmk0;->G(Landroid/content/Context;)I

    .line 529
    .line 530
    .line 531
    move-result v8

    .line 532
    iput v8, v1, Lcom/google/android/exoplayer2/i;->g0:I

    .line 533
    .line 534
    :goto_4
    sget-object v8, Ll/qyb;->c:Ll/qyb;

    .line 535
    .line 536
    iput-object v8, v1, Lcom/google/android/exoplayer2/i;->k0:Ll/qyb;

    .line 537
    .line 538
    const/4 v8, 0x1

    .line 539
    iput-boolean v8, v1, Lcom/google/android/exoplayer2/i;->n0:Z

    .line 540
    .line 541
    invoke-virtual {v1, v13}, Lcom/google/android/exoplayer2/i;->addListener(Lcom/google/android/exoplayer2/t$d;)V

    .line 542
    .line 543
    .line 544
    new-instance v9, Landroid/os/Handler;

    .line 545
    .line 546
    invoke-direct {v9, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 547
    .line 548
    .line 549
    invoke-interface {v10, v9, v13}, Ll/md2;->d(Landroid/os/Handler;Ll/md2$a;)V

    .line 550
    .line 551
    .line 552
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/i;->addAudioOffloadListener(Lcom/google/android/exoplayer2/ExoPlayer$b;)V

    .line 553
    .line 554
    .line 555
    iget-wide v9, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->c:J

    .line 556
    .line 557
    const-wide/16 v11, 0x0

    .line 558
    .line 559
    cmp-long v5, v9, v11

    .line 560
    .line 561
    if-lez v5, :cond_4

    .line 562
    .line 563
    invoke-virtual {v6, v9, v10}, Lcom/google/android/exoplayer2/j;->x(J)V

    .line 564
    .line 565
    .line 566
    :cond_4
    new-instance v5, Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;

    .line 567
    .line 568
    iget-object v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 569
    .line 570
    move-object/from16 v9, v29

    .line 571
    .line 572
    invoke-direct {v5, v6, v9, v3}, Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/exoplayer2/AudioBecomingNoisyManager$a;)V

    .line 573
    .line 574
    .line 575
    iput-object v5, v1, Lcom/google/android/exoplayer2/i;->z:Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;

    .line 576
    .line 577
    iget-boolean v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->o:Z

    .line 578
    .line 579
    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;->b(Z)V

    .line 580
    .line 581
    .line 582
    new-instance v5, Lcom/google/android/exoplayer2/b;

    .line 583
    .line 584
    iget-object v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 585
    .line 586
    invoke-direct {v5, v6, v9, v3}, Lcom/google/android/exoplayer2/b;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/exoplayer2/b$b;)V

    .line 587
    .line 588
    .line 589
    iput-object v5, v1, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 590
    .line 591
    iget-boolean v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->m:Z

    .line 592
    .line 593
    if-eqz v6, :cond_5

    .line 594
    .line 595
    iget-object v6, v1, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 596
    .line 597
    goto :goto_5

    .line 598
    :cond_5
    const/4 v6, 0x0

    .line 599
    :goto_5
    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer2/b;->m(Lcom/google/android/exoplayer2/audio/a;)V

    .line 600
    .line 601
    .line 602
    iget-boolean v5, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->q:Z

    .line 603
    .line 604
    if-eqz v5, :cond_6

    .line 605
    .line 606
    new-instance v5, Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 607
    .line 608
    iget-object v6, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 609
    .line 610
    invoke-direct {v5, v6, v9, v3}, Lcom/google/android/exoplayer2/StreamVolumeManager;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/exoplayer2/StreamVolumeManager$b;)V

    .line 611
    .line 612
    .line 613
    iput-object v5, v1, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 614
    .line 615
    iget-object v3, v1, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 616
    .line 617
    iget v3, v3, Lcom/google/android/exoplayer2/audio/a;->c:I

    .line 618
    .line 619
    invoke-static {v3}, Ll/bmk0;->j0(I)I

    .line 620
    .line 621
    .line 622
    move-result v3

    .line 623
    invoke-virtual {v5, v3}, Lcom/google/android/exoplayer2/StreamVolumeManager;->m(I)V

    .line 624
    .line 625
    .line 626
    goto :goto_6

    .line 627
    :cond_6
    const/4 v3, 0x0

    .line 628
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 629
    .line 630
    :goto_6
    new-instance v3, Ll/wop0;

    .line 631
    .line 632
    iget-object v5, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 633
    .line 634
    invoke-direct {v3, v5}, Ll/wop0;-><init>(Landroid/content/Context;)V

    .line 635
    .line 636
    .line 637
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 638
    .line 639
    iget v5, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->n:I

    .line 640
    .line 641
    if-eqz v5, :cond_7

    .line 642
    .line 643
    move v10, v8

    .line 644
    goto :goto_7

    .line 645
    :cond_7
    move v10, v2

    .line 646
    :goto_7
    invoke-virtual {v3, v10}, Ll/wop0;->a(Z)V

    .line 647
    .line 648
    .line 649
    new-instance v3, Ll/kfq0;

    .line 650
    .line 651
    iget-object v5, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->a:Landroid/content/Context;

    .line 652
    .line 653
    invoke-direct {v3, v5}, Ll/kfq0;-><init>(Landroid/content/Context;)V

    .line 654
    .line 655
    .line 656
    iput-object v3, v1, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 657
    .line 658
    iget v0, v0, Lcom/google/android/exoplayer2/ExoPlayer$c;->n:I

    .line 659
    .line 660
    const/4 v5, 0x2

    .line 661
    if-ne v0, v5, :cond_8

    .line 662
    .line 663
    move v10, v8

    .line 664
    goto :goto_8

    .line 665
    :cond_8
    move v10, v2

    .line 666
    :goto_8
    invoke-virtual {v3, v10}, Ll/kfq0;->a(Z)V

    .line 667
    .line 668
    .line 669
    iget-object v0, v1, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 670
    .line 671
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->p0(Lcom/google/android/exoplayer2/StreamVolumeManager;)Lcom/google/android/exoplayer2/h;

    .line 672
    .line 673
    .line 674
    move-result-object v0

    .line 675
    iput-object v0, v1, Lcom/google/android/exoplayer2/i;->s0:Lcom/google/android/exoplayer2/h;

    .line 676
    .line 677
    sget-object v0, Ll/zjl0;->e:Ll/zjl0;

    .line 678
    .line 679
    iput-object v0, v1, Lcom/google/android/exoplayer2/i;->t0:Ll/zjl0;

    .line 680
    .line 681
    sget-object v0, Ll/brf0;->c:Ll/brf0;

    .line 682
    .line 683
    iput-object v0, v1, Lcom/google/android/exoplayer2/i;->d0:Ll/brf0;

    .line 684
    .line 685
    iget-object v0, v1, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 686
    .line 687
    invoke-virtual {v7, v0}, Ll/cgj0;->l(Lcom/google/android/exoplayer2/audio/a;)V

    .line 688
    .line 689
    .line 690
    iget v0, v1, Lcom/google/android/exoplayer2/i;->g0:I

    .line 691
    .line 692
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 693
    .line 694
    .line 695
    move-result-object v0

    .line 696
    const/16 v11, 0xa

    .line 697
    .line 698
    invoke-virtual {v1, v8, v11, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 699
    .line 700
    .line 701
    iget v0, v1, Lcom/google/android/exoplayer2/i;->g0:I

    .line 702
    .line 703
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 704
    .line 705
    .line 706
    move-result-object v0

    .line 707
    invoke-virtual {v1, v5, v11, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 708
    .line 709
    .line 710
    iget-object v0, v1, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 711
    .line 712
    const/4 v2, 0x3

    .line 713
    invoke-virtual {v1, v8, v2, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 714
    .line 715
    .line 716
    iget v0, v1, Lcom/google/android/exoplayer2/i;->b0:I

    .line 717
    .line 718
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 719
    .line 720
    .line 721
    move-result-object v0

    .line 722
    const/4 v2, 0x4

    .line 723
    invoke-virtual {v1, v5, v2, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 724
    .line 725
    .line 726
    iget v0, v1, Lcom/google/android/exoplayer2/i;->c0:I

    .line 727
    .line 728
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    const/4 v2, 0x5

    .line 733
    invoke-virtual {v1, v5, v2, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 734
    .line 735
    .line 736
    iget-boolean v0, v1, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 737
    .line 738
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 739
    .line 740
    .line 741
    move-result-object v0

    .line 742
    const/16 v2, 0x9

    .line 743
    .line 744
    invoke-virtual {v1, v8, v2, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 745
    .line 746
    .line 747
    const/4 v0, 0x7

    .line 748
    invoke-virtual {v1, v5, v0, v4}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 749
    .line 750
    .line 751
    const/4 v0, 0x6

    .line 752
    const/16 v2, 0x8

    .line 753
    .line 754
    invoke-virtual {v1, v0, v2, v4}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 755
    .line 756
    .line 757
    invoke-virtual/range {v24 .. v24}, Ll/wt5;->e()Z

    .line 758
    .line 759
    .line 760
    return-void

    .line 761
    :goto_9
    iget-object v1, v1, Lcom/google/android/exoplayer2/i;->d:Ll/wt5;

    .line 762
    .line 763
    invoke-virtual {v1}, Ll/wt5;->e()Z

    .line 764
    .line 765
    .line 766
    throw v0

    .line 767
    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x1f
        0x14
        0x1e
        0x15
        0x16
        0x18
        0x1b
        0x1c
        0x20
    .end array-data
.end method

.method public static synthetic A(Lcom/google/android/exoplayer2/t$d;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/ExoTimeoutException;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/ExoTimeoutException;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/16 v1, 0x3eb

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForUnexpected(Ljava/lang/RuntimeException;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p0, v0}, Lcom/google/android/exoplayer2/t$d;->J(Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic B(Lcom/google/android/exoplayer2/n;ILcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Lcom/google/android/exoplayer2/t$d;->o0(Lcom/google/android/exoplayer2/n;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static B0(Ll/fe80;)J
    .locals 6

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/c0$d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/google/android/exoplayer2/c0$b;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 12
    .line 13
    iget-object v3, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 14
    .line 15
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {v2, v3, v1}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 18
    .line 19
    .line 20
    iget-wide v2, p0, Ll/fe80;->c:J

    .line 21
    .line 22
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    cmp-long v2, v2, v4

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 32
    .line 33
    iget v1, v1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 34
    .line 35
    invoke-virtual {p0, v1, v0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$d;->e()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    return-wide v0

    .line 44
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    iget-wide v2, p0, Ll/fe80;->c:J

    .line 49
    .line 50
    add-long/2addr v0, v2

    .line 51
    return-wide v0
.end method

.method public static synthetic C(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->s(Lcom/google/android/exoplayer2/s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic D(ZLcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->a(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fe80;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->R(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic F(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/fe80;->g:Z

    .line 2
    .line 3
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/t$d;->A(Z)V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p0, Ll/fe80;->g:Z

    .line 7
    .line 8
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->i0(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic G(Ll/agj0;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->K(Ll/agj0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/fe80;->l:Z

    .line 2
    .line 3
    iget p0, p0, Ll/fe80;->e:I

    .line 4
    .line 5
    invoke-interface {p1, v0, p0}, Lcom/google/android/exoplayer2/t$d;->n0(ZI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic I(ILcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->u0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(ZLcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->F(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->T:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic L(Lcom/google/android/exoplayer2/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic M(Lcom/google/android/exoplayer2/i;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic N(Lcom/google/android/exoplayer2/i;Ll/qyb;)Ll/qyb;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->k0:Ll/qyb;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic O(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/o;)Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic Q(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->o0()Lcom/google/android/exoplayer2/o;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/o;)Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic T(Lcom/google/android/exoplayer2/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/i;->Z:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U(Lcom/google/android/exoplayer2/i;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Lcom/google/android/exoplayer2/i;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Lcom/google/android/exoplayer2/i;Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->P0(Landroid/graphics/SurfaceTexture;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Lcom/google/android/exoplayer2/i;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->M0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y(ZI)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/i;->y0(ZI)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic Z(Lcom/google/android/exoplayer2/i;ZII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/i;->T0(ZII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/StreamVolumeManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b0(Lcom/google/android/exoplayer2/StreamVolumeManager;)Lcom/google/android/exoplayer2/h;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->p0(Lcom/google/android/exoplayer2/StreamVolumeManager;)Lcom/google/android/exoplayer2/h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c0(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->s0:Lcom/google/android/exoplayer2/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d0(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/h;)Lcom/google/android/exoplayer2/h;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->s0:Lcom/google/android/exoplayer2/h;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic e0(Lcom/google/android/exoplayer2/i;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->W0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/google/android/exoplayer2/i;Ll/jid;)Ll/jid;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->e0:Ll/jid;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h0(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->S:Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->R:Lcom/google/android/exoplayer2/o;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->r0(Lcom/google/android/exoplayer2/o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i0(Lcom/google/android/exoplayer2/i;Ll/zjl0;)Ll/zjl0;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->t0:Ll/zjl0;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic j(IILcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Lcom/google/android/exoplayer2/t$d;->f0(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Lcom/google/android/exoplayer2/o;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->E(Lcom/google/android/exoplayer2/o;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Lcom/google/android/exoplayer2/i;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->V:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->I(Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic l0(Lcom/google/android/exoplayer2/i;Ll/jid;)Ll/jid;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->f0:Ll/jid;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic m(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->J(Lcom/google/android/exoplayer2/PlaybackException;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe80;->i:Ll/dgj0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dgj0;->d:Lcom/google/android/exoplayer2/d0;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->h0(Lcom/google/android/exoplayer2/d0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->P:Lcom/google/android/exoplayer2/t$b;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->T(Lcom/google/android/exoplayer2/t$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Ll/fe80;ILcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/fe80;->l:Z

    .line 2
    .line 3
    invoke-interface {p2, p0, p1}, Lcom/google/android/exoplayer2/t$d;->O(ZI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static p0(Lcom/google/android/exoplayer2/StreamVolumeManager;)Lcom/google/android/exoplayer2/h;
    .locals 3
    .param p0    # Lcom/google/android/exoplayer2/StreamVolumeManager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/h$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/h$b;-><init>(I)V

    .line 5
    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->e()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v2, v1

    .line 15
    :goto_0
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/h$b;->g(I)Lcom/google/android/exoplayer2/h$b;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->d()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    :cond_1
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/h$b;->f(I)Lcom/google/android/exoplayer2/h$b;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/h$b;->e()Lcom/google/android/exoplayer2/h;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic q(Lcom/google/android/exoplayer2/audio/a;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->M(Lcom/google/android/exoplayer2/audio/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(ILcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->D(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/j$e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->i:Ll/sxk;

    .line 2
    .line 3
    new-instance v1, Ll/v8f;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/v8f;-><init>(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/j$e;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic t(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/fe80;->e:I

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->U(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic u(Ll/fe80;ILcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    invoke-interface {p2, p0, p1}, Lcom/google/android/exoplayer2/t$d;->C(Lcom/google/android/exoplayer2/c0;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v(Ll/fe80;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/fe80;->m:I

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->S(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic w(ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p3, p0}, Lcom/google/android/exoplayer2/t$d;->g0(I)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p3, p1, p2, p0}, Lcom/google/android/exoplayer2/t$d;->z(Lcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic x(FLcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->k0(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/t$d;Ll/zri;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->f:Lcom/google/android/exoplayer2/t;

    .line 2
    .line 3
    new-instance v0, Lcom/google/android/exoplayer2/t$c;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Lcom/google/android/exoplayer2/t$c;-><init>(Ll/zri;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, p0, v0}, Lcom/google/android/exoplayer2/t$d;->l0(Lcom/google/android/exoplayer2/t;Lcom/google/android/exoplayer2/t$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static y0(ZI)I
    .locals 1

    .line 1
    const/4 v0, 0x1

    if-eqz p0, :cond_0

    if-eq p1, v0, :cond_0

    const/4 p0, 0x2

    return p0

    :cond_0
    return v0
.end method

.method public static synthetic z(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/j$e;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->C0(Lcom/google/android/exoplayer2/j$e;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A0(ILl/fe80;I)Lcom/google/android/exoplayer2/t$e;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Lcom/google/android/exoplayer2/c0$b;

    .line 6
    .line 7
    invoke-direct {v2}, Lcom/google/android/exoplayer2/c0$b;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 11
    .line 12
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, -0x1

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    iget-object v3, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 20
    .line 21
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 22
    .line 23
    iget-object v5, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 24
    .line 25
    invoke-virtual {v5, v3, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 26
    .line 27
    .line 28
    iget v5, v2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 29
    .line 30
    iget-object v6, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 31
    .line 32
    invoke-virtual {v6, v3}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    iget-object v7, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 37
    .line 38
    iget-object v8, v0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 39
    .line 40
    invoke-virtual {v7, v5, v8}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    iget-object v7, v7, Lcom/google/android/exoplayer2/c0$d;->a:Ljava/lang/Object;

    .line 45
    .line 46
    iget-object v8, v0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 47
    .line 48
    iget-object v8, v8, Lcom/google/android/exoplayer2/c0$d;->c:Lcom/google/android/exoplayer2/n;

    .line 49
    .line 50
    move-object v9, v3

    .line 51
    move v10, v6

    .line 52
    move-object v6, v7

    .line 53
    move v7, v5

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const/4 v3, 0x0

    .line 56
    move/from16 v7, p3

    .line 57
    .line 58
    move-object v6, v3

    .line 59
    move-object v8, v6

    .line 60
    move-object v9, v8

    .line 61
    move v10, v4

    .line 62
    :goto_0
    iget-object v3, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 63
    .line 64
    if-nez p1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iget-object v5, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 71
    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    iget v0, v5, Ll/fyx;->b:I

    .line 75
    .line 76
    iget v3, v5, Ll/fyx;->c:I

    .line 77
    .line 78
    invoke-virtual {v2, v0, v3}, Lcom/google/android/exoplayer2/c0$b;->e(II)J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    invoke-static {v1}, Lcom/google/android/exoplayer2/i;->B0(Ll/fe80;)J

    .line 83
    .line 84
    .line 85
    move-result-wide v4

    .line 86
    goto :goto_2

    .line 87
    :cond_1
    iget v3, v5, Ll/fyx;->e:I

    .line 88
    .line 89
    if-eq v3, v4, :cond_2

    .line 90
    .line 91
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->B0(Ll/fe80;)J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    :goto_1
    move-wide v4, v2

    .line 98
    goto :goto_2

    .line 99
    :cond_2
    iget-wide v3, v2, Lcom/google/android/exoplayer2/c0$b;->e:J

    .line 100
    .line 101
    iget-wide v11, v2, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 102
    .line 103
    add-long v2, v3, v11

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget-wide v2, v1, Ll/fe80;->r:J

    .line 113
    .line 114
    invoke-static {v1}, Lcom/google/android/exoplayer2/i;->B0(Ll/fe80;)J

    .line 115
    .line 116
    .line 117
    move-result-wide v4

    .line 118
    goto :goto_2

    .line 119
    :cond_4
    iget-wide v2, v2, Lcom/google/android/exoplayer2/c0$b;->e:J

    .line 120
    .line 121
    iget-wide v4, v1, Ll/fe80;->r:J

    .line 122
    .line 123
    add-long/2addr v2, v4

    .line 124
    goto :goto_1

    .line 125
    :goto_2
    new-instance v0, Lcom/google/android/exoplayer2/t$e;

    .line 126
    .line 127
    invoke-static {v2, v3}, Ll/bmk0;->l1(J)J

    .line 128
    .line 129
    .line 130
    move-result-wide v11

    .line 131
    invoke-static {v4, v5}, Ll/bmk0;->l1(J)J

    .line 132
    .line 133
    .line 134
    move-result-wide v13

    .line 135
    iget-object v1, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 136
    .line 137
    iget v15, v1, Ll/fyx;->b:I

    .line 138
    .line 139
    iget v1, v1, Ll/fyx;->c:I

    .line 140
    .line 141
    move-object v5, v0

    .line 142
    move/from16 v16, v1

    .line 143
    .line 144
    invoke-direct/range {v5 .. v16}, Lcom/google/android/exoplayer2/t$e;-><init>(Ljava/lang/Object;ILcom/google/android/exoplayer2/n;Ljava/lang/Object;IJJII)V

    .line 145
    .line 146
    .line 147
    return-object v5
.end method

.method public final C0(Lcom/google/android/exoplayer2/j$e;)V
    .locals 12

    .line 1
    iget v2, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 2
    .line 3
    iget v3, p1, Lcom/google/android/exoplayer2/j$e;->c:I

    .line 4
    .line 5
    sub-int/2addr v2, v3

    .line 6
    iput v2, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 7
    .line 8
    iget-boolean v3, p1, Lcom/google/android/exoplayer2/j$e;->d:Z

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    iget v3, p1, Lcom/google/android/exoplayer2/j$e;->e:I

    .line 14
    .line 15
    iput v3, p0, Lcom/google/android/exoplayer2/i;->I:I

    .line 16
    .line 17
    iput-boolean v4, p0, Lcom/google/android/exoplayer2/i;->J:Z

    .line 18
    .line 19
    :cond_0
    iget-boolean v3, p1, Lcom/google/android/exoplayer2/j$e;->f:Z

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    iget v3, p1, Lcom/google/android/exoplayer2/j$e;->g:I

    .line 24
    .line 25
    iput v3, p0, Lcom/google/android/exoplayer2/i;->K:I

    .line 26
    .line 27
    :cond_1
    if-nez v2, :cond_b

    .line 28
    .line 29
    iget-object v2, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 30
    .line 31
    iget-object v2, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 34
    .line 35
    iget-object v3, v3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const/4 v5, 0x0

    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_2

    .line 49
    .line 50
    const/4 v3, -0x1

    .line 51
    iput v3, p0, Lcom/google/android/exoplayer2/i;->w0:I

    .line 52
    .line 53
    const-wide/16 v6, 0x0

    .line 54
    .line 55
    iput-wide v6, p0, Lcom/google/android/exoplayer2/i;->y0:J

    .line 56
    .line 57
    iput v5, p0, Lcom/google/android/exoplayer2/i;->x0:I

    .line 58
    .line 59
    :cond_2
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_4

    .line 64
    .line 65
    move-object v3, v2

    .line 66
    check-cast v3, Lcom/google/android/exoplayer2/v;

    .line 67
    .line 68
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/v;->J()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    iget-object v7, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-ne v6, v7, :cond_3

    .line 83
    .line 84
    move v6, v4

    .line 85
    goto :goto_0

    .line 86
    :cond_3
    move v6, v5

    .line 87
    :goto_0
    invoke-static {v6}, Ll/w11;->g(Z)V

    .line 88
    .line 89
    .line 90
    move v6, v5

    .line 91
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    if-ge v6, v7, :cond_4

    .line 96
    .line 97
    iget-object v7, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    check-cast v7, Lcom/google/android/exoplayer2/i$e;

    .line 104
    .line 105
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    check-cast v8, Lcom/google/android/exoplayer2/c0;

    .line 110
    .line 111
    invoke-static {v7, v8}, Lcom/google/android/exoplayer2/i$e;->c(Lcom/google/android/exoplayer2/i$e;Lcom/google/android/exoplayer2/c0;)Lcom/google/android/exoplayer2/c0;

    .line 112
    .line 113
    .line 114
    add-int/lit8 v6, v6, 0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    iget-boolean v3, p0, Lcom/google/android/exoplayer2/i;->J:Z

    .line 118
    .line 119
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    if-eqz v3, :cond_9

    .line 125
    .line 126
    iget-object v3, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 127
    .line 128
    iget-object v3, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 129
    .line 130
    iget-object v8, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 131
    .line 132
    iget-object v8, v8, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 133
    .line 134
    invoke-virtual {v3, v8}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_6

    .line 139
    .line 140
    iget-object v3, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 141
    .line 142
    iget-wide v8, v3, Ll/fe80;->d:J

    .line 143
    .line 144
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 145
    .line 146
    iget-wide v10, v3, Ll/fe80;->r:J

    .line 147
    .line 148
    cmp-long v3, v8, v10

    .line 149
    .line 150
    if-eqz v3, :cond_5

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_5
    move v4, v5

    .line 154
    :cond_6
    :goto_2
    if-eqz v4, :cond_a

    .line 155
    .line 156
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_8

    .line 161
    .line 162
    iget-object v3, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 163
    .line 164
    iget-object v3, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 165
    .line 166
    invoke-virtual {v3}, Ll/fyx;->b()Z

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    if-eqz v3, :cond_7

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_7
    iget-object v3, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 174
    .line 175
    iget-object v6, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 176
    .line 177
    iget-wide v7, v3, Ll/fe80;->d:J

    .line 178
    .line 179
    invoke-virtual {p0, v2, v6, v7, v8}, Lcom/google/android/exoplayer2/i;->H0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;J)J

    .line 180
    .line 181
    .line 182
    move-result-wide v2

    .line 183
    :goto_3
    move-wide v6, v2

    .line 184
    goto :goto_5

    .line 185
    :cond_8
    :goto_4
    iget-object v2, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 186
    .line 187
    iget-wide v2, v2, Ll/fe80;->d:J

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_9
    move v4, v5

    .line 191
    :cond_a
    :goto_5
    iput-boolean v5, p0, Lcom/google/android/exoplayer2/i;->J:Z

    .line 192
    .line 193
    iget-object v1, p1, Lcom/google/android/exoplayer2/j$e;->b:Ll/fe80;

    .line 194
    .line 195
    iget v3, p0, Lcom/google/android/exoplayer2/i;->K:I

    .line 196
    .line 197
    iget v5, p0, Lcom/google/android/exoplayer2/i;->I:I

    .line 198
    .line 199
    const/4 v8, -0x1

    .line 200
    const/4 v9, 0x0

    .line 201
    const/4 v2, 0x1

    .line 202
    move-object v0, p0

    .line 203
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 204
    .line 205
    .line 206
    :cond_b
    return-void
.end method

.method public final D0(I)I
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eq v0, p1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v1, Landroid/media/AudioTrack;

    .line 24
    .line 25
    const/4 v2, 0x3

    .line 26
    const/4 v7, 0x0

    .line 27
    const/16 v3, 0xfa0

    .line 28
    .line 29
    const/4 v4, 0x4

    .line 30
    const/4 v5, 0x2

    .line 31
    const/4 v6, 0x2

    .line 32
    move v8, p1

    .line 33
    invoke-direct/range {v1 .. v8}, Landroid/media/AudioTrack;-><init>(IIIIIII)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method public final E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;
    .locals 21
    .param p3    # Landroid/util/Pair;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fe80;",
            "Lcom/google/android/exoplayer2/c0;",
            "Landroid/util/Pair<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;)",
            "Ll/fe80;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v4, 0x1

    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v3, 0x0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    move v3, v4

    .line 20
    :goto_1
    invoke-static {v3}, Ll/w11;->a(Z)V

    .line 21
    .line 22
    .line 23
    move-object/from16 v3, p1

    .line 24
    .line 25
    iget-object v5, v3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 26
    .line 27
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/i;->u0(Ll/fe80;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v6

    .line 31
    invoke-virtual/range {p1 .. p2}, Ll/fe80;->j(Lcom/google/android/exoplayer2/c0;)Ll/fe80;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/fe80;->l()Lcom/google/android/exoplayer2/source/i$b;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    iget-wide v1, v0, Lcom/google/android/exoplayer2/i;->y0:J

    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 48
    .line 49
    .line 50
    move-result-wide v10

    .line 51
    sget-object v18, Ll/ffj0;->d:Ll/ffj0;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->b:Ll/dgj0;

    .line 54
    .line 55
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 56
    .line 57
    .line 58
    move-result-object v20

    .line 59
    const-wide/16 v16, 0x0

    .line 60
    .line 61
    move-wide v12, v10

    .line 62
    move-wide v14, v10

    .line 63
    move-object/from16 v19, v0

    .line 64
    .line 65
    invoke-virtual/range {v8 .. v20}, Ll/fe80;->d(Lcom/google/android/exoplayer2/source/i$b;JJJJLl/ffj0;Ll/dgj0;Ljava/util/List;)Ll/fe80;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, v9}, Ll/fe80;->c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 74
    .line 75
    iput-wide v1, v0, Ll/fe80;->p:J

    .line 76
    .line 77
    return-object v0

    .line 78
    :cond_2
    iget-object v3, v8, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 79
    .line 80
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 81
    .line 82
    invoke-static {v2}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    check-cast v9, Landroid/util/Pair;

    .line 87
    .line 88
    iget-object v9, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 89
    .line 90
    invoke-virtual {v3, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    if-nez v9, :cond_3

    .line 95
    .line 96
    new-instance v10, Lcom/google/android/exoplayer2/source/i$b;

    .line 97
    .line 98
    iget-object v11, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 99
    .line 100
    invoke-direct {v10, v11}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_3
    iget-object v10, v8, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 105
    .line 106
    :goto_2
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v2, Ljava/lang/Long;

    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 111
    .line 112
    .line 113
    move-result-wide v11

    .line 114
    invoke-static {v6, v7}, Ll/bmk0;->J0(J)J

    .line 115
    .line 116
    .line 117
    move-result-wide v6

    .line 118
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_4

    .line 123
    .line 124
    iget-object v2, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 125
    .line 126
    invoke-virtual {v5, v3, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 131
    .line 132
    .line 133
    move-result-wide v2

    .line 134
    sub-long/2addr v6, v2

    .line 135
    :cond_4
    if-eqz v9, :cond_5

    .line 136
    .line 137
    cmp-long v2, v11, v6

    .line 138
    .line 139
    if-gez v2, :cond_6

    .line 140
    .line 141
    :cond_5
    move v1, v9

    .line 142
    move-object v9, v10

    .line 143
    move-wide v10, v11

    .line 144
    goto/16 :goto_6

    .line 145
    .line 146
    :cond_6
    if-nez v2, :cond_a

    .line 147
    .line 148
    iget-object v2, v8, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 149
    .line 150
    iget-object v2, v2, Ll/fyx;->a:Ljava/lang/Object;

    .line 151
    .line 152
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    const/4 v3, -0x1

    .line 157
    if-eq v2, v3, :cond_8

    .line 158
    .line 159
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 160
    .line 161
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/c0;->j(ILcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iget v2, v2, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 166
    .line 167
    iget-object v3, v10, Ll/fyx;->a:Ljava/lang/Object;

    .line 168
    .line 169
    iget-object v4, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 170
    .line 171
    invoke-virtual {v1, v3, v4}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    iget v3, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 176
    .line 177
    if-eq v2, v3, :cond_7

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_7
    return-object v8

    .line 181
    :cond_8
    :goto_3
    iget-object v2, v10, Ll/fyx;->a:Ljava/lang/Object;

    .line 182
    .line 183
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 184
    .line 185
    invoke-virtual {v1, v2, v3}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v10}, Ll/fyx;->b()Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 193
    .line 194
    if-eqz v1, :cond_9

    .line 195
    .line 196
    iget v1, v10, Ll/fyx;->b:I

    .line 197
    .line 198
    iget v2, v10, Ll/fyx;->c:I

    .line 199
    .line 200
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/c0$b;->e(II)J

    .line 201
    .line 202
    .line 203
    move-result-wide v0

    .line 204
    :goto_4
    move-object v9, v10

    .line 205
    goto :goto_5

    .line 206
    :cond_9
    iget-wide v0, v0, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 207
    .line 208
    goto :goto_4

    .line 209
    :goto_5
    iget-wide v10, v8, Ll/fe80;->r:J

    .line 210
    .line 211
    iget-wide v12, v8, Ll/fe80;->r:J

    .line 212
    .line 213
    iget-wide v14, v8, Ll/fe80;->d:J

    .line 214
    .line 215
    iget-wide v2, v8, Ll/fe80;->r:J

    .line 216
    .line 217
    sub-long v16, v0, v2

    .line 218
    .line 219
    iget-object v2, v8, Ll/fe80;->h:Ll/ffj0;

    .line 220
    .line 221
    iget-object v3, v8, Ll/fe80;->i:Ll/dgj0;

    .line 222
    .line 223
    iget-object v4, v8, Ll/fe80;->j:Ljava/util/List;

    .line 224
    .line 225
    move-object/from16 v18, v2

    .line 226
    .line 227
    move-object/from16 v19, v3

    .line 228
    .line 229
    move-object/from16 v20, v4

    .line 230
    .line 231
    invoke-virtual/range {v8 .. v20}, Ll/fe80;->d(Lcom/google/android/exoplayer2/source/i$b;JJJJLl/ffj0;Ll/dgj0;Ljava/util/List;)Ll/fe80;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v2, v9}, Ll/fe80;->c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    iput-wide v0, v2, Ll/fe80;->p:J

    .line 240
    .line 241
    return-object v2

    .line 242
    :cond_a
    move-object v9, v10

    .line 243
    invoke-virtual {v9}, Ll/fyx;->b()Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    xor-int/2addr v0, v4

    .line 248
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 249
    .line 250
    .line 251
    iget-wide v0, v8, Ll/fe80;->q:J

    .line 252
    .line 253
    sub-long v2, v11, v6

    .line 254
    .line 255
    sub-long/2addr v0, v2

    .line 256
    const-wide/16 v2, 0x0

    .line 257
    .line 258
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 259
    .line 260
    .line 261
    move-result-wide v16

    .line 262
    iget-wide v0, v8, Ll/fe80;->p:J

    .line 263
    .line 264
    iget-object v2, v8, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 265
    .line 266
    iget-object v3, v8, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 267
    .line 268
    invoke-virtual {v2, v3}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    if-eqz v2, :cond_b

    .line 273
    .line 274
    add-long v0, v11, v16

    .line 275
    .line 276
    :cond_b
    iget-object v2, v8, Ll/fe80;->h:Ll/ffj0;

    .line 277
    .line 278
    iget-object v3, v8, Ll/fe80;->i:Ll/dgj0;

    .line 279
    .line 280
    iget-object v4, v8, Ll/fe80;->j:Ljava/util/List;

    .line 281
    .line 282
    move-wide v10, v11

    .line 283
    move-wide v12, v10

    .line 284
    move-wide v14, v10

    .line 285
    move-object/from16 v18, v2

    .line 286
    .line 287
    move-object/from16 v19, v3

    .line 288
    .line 289
    move-object/from16 v20, v4

    .line 290
    .line 291
    invoke-virtual/range {v8 .. v20}, Ll/fe80;->d(Lcom/google/android/exoplayer2/source/i$b;JJJJLl/ffj0;Ll/dgj0;Ljava/util/List;)Ll/fe80;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    iput-wide v0, v2, Ll/fe80;->p:J

    .line 296
    .line 297
    return-object v2

    .line 298
    :goto_6
    invoke-virtual {v9}, Ll/fyx;->b()Z

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    xor-int/2addr v2, v4

    .line 303
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 304
    .line 305
    .line 306
    if-nez v1, :cond_c

    .line 307
    .line 308
    sget-object v2, Ll/ffj0;->d:Ll/ffj0;

    .line 309
    .line 310
    :goto_7
    move-object/from16 v18, v2

    .line 311
    .line 312
    goto :goto_8

    .line 313
    :cond_c
    iget-object v2, v8, Ll/fe80;->h:Ll/ffj0;

    .line 314
    .line 315
    goto :goto_7

    .line 316
    :goto_8
    if-nez v1, :cond_d

    .line 317
    .line 318
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->b:Ll/dgj0;

    .line 319
    .line 320
    :goto_9
    move-object/from16 v19, v0

    .line 321
    .line 322
    goto :goto_a

    .line 323
    :cond_d
    iget-object v0, v8, Ll/fe80;->i:Ll/dgj0;

    .line 324
    .line 325
    goto :goto_9

    .line 326
    :goto_a
    if-nez v1, :cond_e

    .line 327
    .line 328
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    :goto_b
    move-object/from16 v20, v0

    .line 333
    .line 334
    goto :goto_c

    .line 335
    :cond_e
    iget-object v0, v8, Ll/fe80;->j:Ljava/util/List;

    .line 336
    .line 337
    goto :goto_b

    .line 338
    :goto_c
    const-wide/16 v16, 0x0

    .line 339
    .line 340
    move-wide v12, v10

    .line 341
    move-wide v14, v10

    .line 342
    invoke-virtual/range {v8 .. v20}, Ll/fe80;->d(Lcom/google/android/exoplayer2/source/i$b;JJJJLl/ffj0;Ll/dgj0;Ljava/util/List;)Ll/fe80;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-virtual {v0, v9}, Ll/fe80;->c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    iput-wide v10, v0, Ll/fe80;->p:J

    .line 351
    .line 352
    return-object v0
.end method

.method public final F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/c0;",
            "IJ)",
            "Landroid/util/Pair<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iput p2, p0, Lcom/google/android/exoplayer2/i;->w0:I

    .line 8
    .line 9
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    cmp-long p1, p3, p1

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    const-wide/16 p3, 0x0

    .line 19
    .line 20
    :cond_0
    iput-wide p3, p0, Lcom/google/android/exoplayer2/i;->y0:J

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/google/android/exoplayer2/i;->x0:I

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const/4 v0, -0x1

    .line 28
    if-eq p2, v0, :cond_3

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-lt p2, v0, :cond_2

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    :goto_0
    move v3, p2

    .line 38
    goto :goto_2

    .line 39
    :cond_3
    :goto_1
    iget-boolean p2, p0, Lcom/google/android/exoplayer2/i;->G:Z

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/c0;->e(Z)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iget-object p3, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 46
    .line 47
    invoke-virtual {p1, p2, p3}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/c0$d;->d()J

    .line 52
    .line 53
    .line 54
    move-result-wide p3

    .line 55
    goto :goto_0

    .line 56
    :goto_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 59
    .line 60
    invoke-static {p3, p4}, Ll/bmk0;->J0(J)J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    move-object v0, p1

    .line 65
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public final G0(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->d0:Ll/brf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/brf0;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->d0:Ll/brf0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/brf0;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eq p2, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    new-instance v0, Ll/brf0;

    .line 20
    .line 21
    invoke-direct {v0, p1, p2}, Ll/brf0;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->d0:Ll/brf0;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 27
    .line 28
    new-instance v1, Ll/s8f;

    .line 29
    .line 30
    invoke-direct {v1, p1, p2}, Ll/s8f;-><init>(II)V

    .line 31
    .line 32
    .line 33
    const/16 v2, 0x18

    .line 34
    .line 35
    invoke-virtual {v0, v2, v1}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/brf0;

    .line 39
    .line 40
    invoke-direct {v0, p1, p2}, Ll/brf0;-><init>(II)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x2

    .line 44
    const/16 p2, 0xe

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final H0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;J)J
    .locals 1

    .line 1
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$b;->q()J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    add-long/2addr p3, p0

    .line 15
    return-wide p3
.end method

.method public final I0(Ll/fe80;II)Ll/fe80;
    .locals 8

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->u0(Ll/fe80;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v4

    .line 9
    iget-object v1, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    iget v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 18
    .line 19
    const/4 v7, 0x1

    .line 20
    add-int/2addr v0, v7

    .line 21
    iput v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer2/i;->J0(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->q0()Lcom/google/android/exoplayer2/c0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    move-object v0, p0

    .line 31
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/i;->x0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p1, v2, p0}, Lcom/google/android/exoplayer2/i;->E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget p1, p0, Ll/fe80;->e:I

    .line 40
    .line 41
    if-eq p1, v7, :cond_0

    .line 42
    .line 43
    const/4 v1, 0x4

    .line 44
    if-eq p1, v1, :cond_0

    .line 45
    .line 46
    if-ge p2, p3, :cond_0

    .line 47
    .line 48
    if-ne p3, v6, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-lt v3, p1, :cond_0

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/fe80;->h(I)Ll/fe80;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :cond_0
    iget-object p1, v0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 65
    .line 66
    invoke-virtual {p1, p2, p3, v0}, Lcom/google/android/exoplayer2/j;->r0(IILl/n8f0;)V

    .line 67
    .line 68
    .line 69
    return-object p0
.end method

.method public final J0(II)V
    .locals 2

    .line 1
    add-int/lit8 v0, p2, -0x1

    .line 2
    .line 3
    :goto_0
    if-lt v0, p1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    add-int/lit8 v0, v0, -0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 14
    .line 15
    invoke-interface {v0, p1, p2}, Ll/n8f0;->f(II)Ll/n8f0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 20
    .line 21
    return-void
.end method

.method public final K0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v2, 0x2710

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;->g(Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView$b;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->a0:Landroid/view/TextureView;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 43
    .line 44
    if-eq v0, v2, :cond_1

    .line 45
    .line 46
    const-string v0, "ExoPlayerImpl"

    .line 47
    .line 48
    const-string v2, "SurfaceTextureListener already unset or replaced."

    .line 49
    .line 50
    invoke-static {v0, v2}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->a0:Landroid/view/TextureView;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iput-object v1, p0, Lcom/google/android/exoplayer2/i;->a0:Landroid/view/TextureView;

    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 62
    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 66
    .line 67
    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 71
    .line 72
    :cond_3
    return-void
.end method

.method public final L0(IILjava/lang/Object;)V
    .locals 5
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->g:[Lcom/google/android/exoplayer2/x;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_1

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-interface {v3}, Lcom/google/android/exoplayer2/x;->getTrackType()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-ne v4, p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3, p2}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3, p3}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public final M0()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/i;->i0:F

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/b;->g()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    mul-float/2addr v0, v1

    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {p0, v2, v1, v0}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final N0(Ljava/util/List;IJZ)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;IJZ)V"
        }
    .end annotation

    .line 1
    move/from16 v1, p2

    .line 2
    .line 3
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 4
    .line 5
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentPosition()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    iget v5, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    add-int/2addr v5, v6

    .line 17
    iput v5, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 18
    .line 19
    iget-object v5, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    const/4 v7, 0x0

    .line 26
    if-nez v5, :cond_0

    .line 27
    .line 28
    iget-object v5, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    invoke-virtual {p0, v7, v5}, Lcom/google/android/exoplayer2/i;->J0(II)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0, v7, p1}, Lcom/google/android/exoplayer2/i;->m0(ILjava/util/List;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v9

    .line 41
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->q0()Lcom/google/android/exoplayer2/c0;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    if-nez v8, :cond_1

    .line 50
    .line 51
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    if-ge v1, v8, :cond_2

    .line 56
    .line 57
    :cond_1
    move-wide/from16 v10, p3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    new-instance v0, Lcom/google/android/exoplayer2/IllegalSeekPositionException;

    .line 61
    .line 62
    move-wide/from16 v10, p3

    .line 63
    .line 64
    invoke-direct {v0, v5, v1, v10, v11}, Lcom/google/android/exoplayer2/IllegalSeekPositionException;-><init>(Lcom/google/android/exoplayer2/c0;IJ)V

    .line 65
    .line 66
    .line 67
    throw v0

    .line 68
    :goto_0
    const/4 v8, -0x1

    .line 69
    if-eqz p5, :cond_3

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/i;->G:Z

    .line 72
    .line 73
    invoke-virtual {v5, v1}, Lcom/google/android/exoplayer2/c0;->e(Z)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    :goto_1
    move v10, v1

    .line 83
    goto :goto_2

    .line 84
    :cond_3
    if-ne v1, v8, :cond_4

    .line 85
    .line 86
    move v10, v2

    .line 87
    move-wide v2, v3

    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move-wide v2, v10

    .line 90
    goto :goto_1

    .line 91
    :goto_2
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 92
    .line 93
    invoke-virtual {p0, v5, v10, v2, v3}, Lcom/google/android/exoplayer2/i;->F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {p0, v1, v5, v4}, Lcom/google/android/exoplayer2/i;->E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iget v4, v1, Ll/fe80;->e:I

    .line 102
    .line 103
    if-eq v10, v8, :cond_7

    .line 104
    .line 105
    if-eq v4, v6, :cond_7

    .line 106
    .line 107
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    if-nez v4, :cond_6

    .line 112
    .line 113
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-lt v10, v4, :cond_5

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_5
    const/4 v4, 0x2

    .line 121
    goto :goto_4

    .line 122
    :cond_6
    :goto_3
    const/4 v4, 0x4

    .line 123
    :cond_7
    :goto_4
    invoke-virtual {v1, v4}, Ll/fe80;->h(I)Ll/fe80;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget-object v8, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 128
    .line 129
    invoke-static {v2, v3}, Ll/bmk0;->J0(J)J

    .line 130
    .line 131
    .line 132
    move-result-wide v11

    .line 133
    iget-object v13, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 134
    .line 135
    invoke-virtual/range {v8 .. v13}, Lcom/google/android/exoplayer2/j;->T0(Ljava/util/List;IJLl/n8f0;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 139
    .line 140
    iget-object v2, v2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 141
    .line 142
    iget-object v2, v2, Ll/fyx;->a:Ljava/lang/Object;

    .line 143
    .line 144
    iget-object v3, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 145
    .line 146
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-nez v2, :cond_8

    .line 153
    .line 154
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 155
    .line 156
    iget-object v2, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-nez v2, :cond_8

    .line 163
    .line 164
    move v4, v6

    .line 165
    goto :goto_5

    .line 166
    :cond_8
    move v4, v7

    .line 167
    :goto_5
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/i;->v0(Ll/fe80;)J

    .line 168
    .line 169
    .line 170
    move-result-wide v6

    .line 171
    const/4 v8, -0x1

    .line 172
    const/4 v9, 0x0

    .line 173
    const/4 v2, 0x0

    .line 174
    const/4 v3, 0x1

    .line 175
    const/4 v5, 0x4

    .line 176
    move-object v0, p0

    .line 177
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public final O0(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/i;->Z:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 7
    .line 8
    invoke-interface {p1, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 12
    .line 13
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/Surface;->isValid()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 26
    .line 27
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0, v0, v0}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final P0(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/view/Surface;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->W:Landroid/view/Surface;

    .line 10
    .line 11
    return-void
.end method

.method public final Q0(Ljava/lang/Object;)V
    .locals 9
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->g:[Lcom/google/android/exoplayer2/x;

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    :goto_0
    const/4 v5, 0x1

    .line 12
    if-ge v4, v2, :cond_1

    .line 13
    .line 14
    aget-object v6, v1, v4

    .line 15
    .line 16
    invoke-interface {v6}, Lcom/google/android/exoplayer2/x;->getTrackType()I

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    const/4 v8, 0x2

    .line 21
    if-ne v7, v8, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {v6, v5}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {v5, p1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->V:Ljava/lang/Object;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    if-eq v1, p1, :cond_3

    .line 50
    .line 51
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/google/android/exoplayer2/u;

    .line 66
    .line 67
    iget-wide v6, p0, Lcom/google/android/exoplayer2/i;->E:J

    .line 68
    .line 69
    invoke-virtual {v1, v6, v7}, Lcom/google/android/exoplayer2/u;->a(J)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :catch_0
    move v3, v5

    .line 74
    goto :goto_2

    .line 75
    :catch_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 80
    .line 81
    .line 82
    :cond_2
    :goto_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->V:Ljava/lang/Object;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->W:Landroid/view/Surface;

    .line 85
    .line 86
    if-ne v0, v1, :cond_3

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    .line 89
    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->W:Landroid/view/Surface;

    .line 93
    .line 94
    :cond_3
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->V:Ljava/lang/Object;

    .line 95
    .line 96
    if-eqz v3, :cond_4

    .line 97
    .line 98
    new-instance p1, Lcom/google/android/exoplayer2/ExoTimeoutException;

    .line 99
    .line 100
    const/4 v0, 0x3

    .line 101
    invoke-direct {p1, v0}, Lcom/google/android/exoplayer2/ExoTimeoutException;-><init>(I)V

    .line 102
    .line 103
    .line 104
    const/16 v0, 0x3eb

    .line 105
    .line 106
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForUnexpected(Ljava/lang/RuntimeException;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->R0(Lcom/google/android/exoplayer2/ExoPlaybackException;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void
.end method

.method public final R0(Lcom/google/android/exoplayer2/ExoPlaybackException;)V
    .locals 12
    .param p1    # Lcom/google/android/exoplayer2/ExoPlaybackException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 2
    .line 3
    iget-object v1, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/fe80;->c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 10
    .line 11
    iput-wide v1, v0, Ll/fe80;->p:J

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, v0, Ll/fe80;->q:J

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Ll/fe80;->h(I)Ll/fe80;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/fe80;->f(Lcom/google/android/exoplayer2/ExoPlaybackException;)Ll/fe80;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_0
    move-object v3, v0

    .line 29
    iget p1, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 30
    .line 31
    add-int/2addr p1, v1

    .line 32
    iput p1, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 33
    .line 34
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/j;->q1()V

    .line 37
    .line 38
    .line 39
    const/4 v10, -0x1

    .line 40
    const/4 v11, 0x0

    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v5, 0x1

    .line 43
    const/4 v6, 0x0

    .line 44
    const/4 v7, 0x5

    .line 45
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    move-object v2, p0

    .line 51
    invoke-virtual/range {v2 .. v11}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final S0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->P:Lcom/google/android/exoplayer2/t$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->f:Lcom/google/android/exoplayer2/t;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->c:Lcom/google/android/exoplayer2/t$b;

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/bmk0;->I(Lcom/google/android/exoplayer2/t;Lcom/google/android/exoplayer2/t$b;)Lcom/google/android/exoplayer2/t$b;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Lcom/google/android/exoplayer2/i;->P:Lcom/google/android/exoplayer2/t$b;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/t$b;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 20
    .line 21
    new-instance v1, Ll/x8f;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/x8f;-><init>(Lcom/google/android/exoplayer2/i;)V

    .line 24
    .line 25
    .line 26
    const/16 p0, 0xd

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final T0(ZII)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-eq p2, p1, :cond_0

    .line 7
    .line 8
    move p1, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p1, v0

    .line 11
    :goto_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    if-eq p2, v1, :cond_1

    .line 14
    .line 15
    move v0, v1

    .line 16
    :cond_1
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 17
    .line 18
    iget-boolean v2, p2, Ll/fe80;->l:Z

    .line 19
    .line 20
    if-ne v2, p1, :cond_2

    .line 21
    .line 22
    iget v2, p2, Ll/fe80;->m:I

    .line 23
    .line 24
    if-ne v2, v0, :cond_2

    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    iget v2, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 28
    .line 29
    add-int/2addr v2, v1

    .line 30
    iput v2, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 31
    .line 32
    iget-boolean v1, p2, Ll/fe80;->o:Z

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p2}, Ll/fe80;->a()Ll/fe80;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    :cond_3
    invoke-virtual {p2, p1, v0}, Ll/fe80;->e(ZI)Ll/fe80;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 45
    .line 46
    invoke-virtual {p2, p1, v0}, Lcom/google/android/exoplayer2/j;->X0(ZI)V

    .line 47
    .line 48
    .line 49
    const/4 v9, -0x1

    .line 50
    const/4 v10, 0x0

    .line 51
    const/4 v3, 0x0

    .line 52
    const/4 v5, 0x0

    .line 53
    const/4 v6, 0x5

    .line 54
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    move-object v1, p0

    .line 60
    move v4, p3

    .line 61
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final U0(Ll/fe80;IIZIJIZ)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 8
    .line 9
    iget-object v3, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 10
    .line 11
    iget-object v4, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 12
    .line 13
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/c0;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    xor-int/lit8 v5, v7, 0x1

    .line 18
    .line 19
    move/from16 v3, p4

    .line 20
    .line 21
    move/from16 v4, p5

    .line 22
    .line 23
    move/from16 v6, p9

    .line 24
    .line 25
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer2/i;->t0(Ll/fe80;Ll/fe80;ZIZZ)Landroid/util/Pair;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    iget-object v3, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v3, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iget-object v5, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v5, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    iget-object v6, v0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 46
    .line 47
    const/4 v8, 0x0

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    iget-object v9, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 51
    .line 52
    invoke-virtual {v9}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    if-nez v9, :cond_0

    .line 57
    .line 58
    iget-object v8, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 59
    .line 60
    iget-object v9, v1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 61
    .line 62
    iget-object v9, v9, Ll/fyx;->a:Ljava/lang/Object;

    .line 63
    .line 64
    iget-object v10, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 65
    .line 66
    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    iget v8, v8, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 71
    .line 72
    iget-object v9, v1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 73
    .line 74
    iget-object v10, v0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 75
    .line 76
    invoke-virtual {v9, v8, v10}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    iget-object v8, v8, Lcom/google/android/exoplayer2/c0$d;->c:Lcom/google/android/exoplayer2/n;

    .line 81
    .line 82
    :cond_0
    sget-object v9, Lcom/google/android/exoplayer2/o;->I:Lcom/google/android/exoplayer2/o;

    .line 83
    .line 84
    iput-object v9, v0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 85
    .line 86
    :cond_1
    if-nez v3, :cond_2

    .line 87
    .line 88
    iget-object v9, v2, Ll/fe80;->j:Ljava/util/List;

    .line 89
    .line 90
    iget-object v10, v1, Ll/fe80;->j:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v9, v10}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    if-nez v9, :cond_3

    .line 97
    .line 98
    :cond_2
    iget-object v6, v0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 99
    .line 100
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/o;->b()Lcom/google/android/exoplayer2/o$b;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    iget-object v9, v1, Ll/fe80;->j:Ljava/util/List;

    .line 105
    .line 106
    invoke-virtual {v6, v9}, Lcom/google/android/exoplayer2/o$b;->L(Ljava/util/List;)Lcom/google/android/exoplayer2/o$b;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/o$b;->H()Lcom/google/android/exoplayer2/o;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    iput-object v6, v0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/i;->o0()Lcom/google/android/exoplayer2/o;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    :cond_3
    iget-object v9, v0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 121
    .line 122
    invoke-virtual {v6, v9}, Lcom/google/android/exoplayer2/o;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v9

    .line 126
    iput-object v6, v0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 127
    .line 128
    iget-boolean v6, v2, Ll/fe80;->l:Z

    .line 129
    .line 130
    iget-boolean v10, v1, Ll/fe80;->l:Z

    .line 131
    .line 132
    const/4 v11, 0x0

    .line 133
    const/4 v12, 0x1

    .line 134
    if-eq v6, v10, :cond_4

    .line 135
    .line 136
    move v6, v12

    .line 137
    goto :goto_0

    .line 138
    :cond_4
    move v6, v11

    .line 139
    :goto_0
    iget v10, v2, Ll/fe80;->e:I

    .line 140
    .line 141
    iget v13, v1, Ll/fe80;->e:I

    .line 142
    .line 143
    if-eq v10, v13, :cond_5

    .line 144
    .line 145
    move v10, v12

    .line 146
    goto :goto_1

    .line 147
    :cond_5
    move v10, v11

    .line 148
    :goto_1
    if-nez v10, :cond_6

    .line 149
    .line 150
    if-eqz v6, :cond_7

    .line 151
    .line 152
    :cond_6
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/i;->W0()V

    .line 153
    .line 154
    .line 155
    :cond_7
    iget-boolean v13, v2, Ll/fe80;->g:Z

    .line 156
    .line 157
    iget-boolean v14, v1, Ll/fe80;->g:Z

    .line 158
    .line 159
    if-eq v13, v14, :cond_8

    .line 160
    .line 161
    move v13, v12

    .line 162
    goto :goto_2

    .line 163
    :cond_8
    move v13, v11

    .line 164
    :goto_2
    if-eqz v13, :cond_9

    .line 165
    .line 166
    invoke-virtual {v0, v14}, Lcom/google/android/exoplayer2/i;->V0(Z)V

    .line 167
    .line 168
    .line 169
    :cond_9
    if-nez v7, :cond_a

    .line 170
    .line 171
    iget-object v7, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 172
    .line 173
    new-instance v14, Ll/e8f;

    .line 174
    .line 175
    move/from16 v15, p2

    .line 176
    .line 177
    invoke-direct {v14, v1, v15}, Ll/e8f;-><init>(Ll/fe80;I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v7, v11, v14}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 181
    .line 182
    .line 183
    :cond_a
    if-eqz p4, :cond_b

    .line 184
    .line 185
    move/from16 v7, p8

    .line 186
    .line 187
    invoke-virtual {v0, v4, v2, v7}, Lcom/google/android/exoplayer2/i;->A0(ILl/fe80;I)Lcom/google/android/exoplayer2/t$e;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    move-wide/from16 v14, p6

    .line 192
    .line 193
    invoke-virtual {v0, v14, v15}, Lcom/google/android/exoplayer2/i;->z0(J)Lcom/google/android/exoplayer2/t$e;

    .line 194
    .line 195
    .line 196
    move-result-object v11

    .line 197
    iget-object v14, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 198
    .line 199
    new-instance v15, Ll/b9f;

    .line 200
    .line 201
    invoke-direct {v15, v4, v7, v11}, Ll/b9f;-><init>(ILcom/google/android/exoplayer2/t$e;Lcom/google/android/exoplayer2/t$e;)V

    .line 202
    .line 203
    .line 204
    const/16 v4, 0xb

    .line 205
    .line 206
    invoke-virtual {v14, v4, v15}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 207
    .line 208
    .line 209
    :cond_b
    if-eqz v3, :cond_c

    .line 210
    .line 211
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 212
    .line 213
    new-instance v4, Ll/c9f;

    .line 214
    .line 215
    invoke-direct {v4, v8, v5}, Ll/c9f;-><init>(Lcom/google/android/exoplayer2/n;I)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v3, v12, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 219
    .line 220
    .line 221
    :cond_c
    iget-object v3, v2, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 222
    .line 223
    iget-object v4, v1, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 224
    .line 225
    if-eq v3, v4, :cond_d

    .line 226
    .line 227
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 228
    .line 229
    new-instance v4, Ll/d9f;

    .line 230
    .line 231
    invoke-direct {v4, v1}, Ll/d9f;-><init>(Ll/fe80;)V

    .line 232
    .line 233
    .line 234
    const/16 v5, 0xa

    .line 235
    .line 236
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 237
    .line 238
    .line 239
    iget-object v3, v1, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 240
    .line 241
    if-eqz v3, :cond_d

    .line 242
    .line 243
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 244
    .line 245
    new-instance v4, Ll/e9f;

    .line 246
    .line 247
    invoke-direct {v4, v1}, Ll/e9f;-><init>(Ll/fe80;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 251
    .line 252
    .line 253
    :cond_d
    iget-object v3, v2, Ll/fe80;->i:Ll/dgj0;

    .line 254
    .line 255
    iget-object v4, v1, Ll/fe80;->i:Ll/dgj0;

    .line 256
    .line 257
    if-eq v3, v4, :cond_e

    .line 258
    .line 259
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 260
    .line 261
    iget-object v4, v4, Ll/dgj0;->e:Ljava/lang/Object;

    .line 262
    .line 263
    invoke-virtual {v3, v4}, Ll/cgj0;->i(Ljava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 267
    .line 268
    new-instance v4, Ll/f9f;

    .line 269
    .line 270
    invoke-direct {v4, v1}, Ll/f9f;-><init>(Ll/fe80;)V

    .line 271
    .line 272
    .line 273
    const/4 v5, 0x2

    .line 274
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 275
    .line 276
    .line 277
    :cond_e
    if-nez v9, :cond_f

    .line 278
    .line 279
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 280
    .line 281
    iget-object v4, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 282
    .line 283
    new-instance v5, Ll/f8f;

    .line 284
    .line 285
    invoke-direct {v5, v3}, Ll/f8f;-><init>(Lcom/google/android/exoplayer2/o;)V

    .line 286
    .line 287
    .line 288
    const/16 v3, 0xe

    .line 289
    .line 290
    invoke-virtual {v4, v3, v5}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 291
    .line 292
    .line 293
    :cond_f
    if-eqz v13, :cond_10

    .line 294
    .line 295
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 296
    .line 297
    new-instance v4, Ll/g8f;

    .line 298
    .line 299
    invoke-direct {v4, v1}, Ll/g8f;-><init>(Ll/fe80;)V

    .line 300
    .line 301
    .line 302
    const/4 v5, 0x3

    .line 303
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 304
    .line 305
    .line 306
    :cond_10
    if-nez v10, :cond_11

    .line 307
    .line 308
    if-eqz v6, :cond_12

    .line 309
    .line 310
    :cond_11
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 311
    .line 312
    new-instance v4, Ll/h8f;

    .line 313
    .line 314
    invoke-direct {v4, v1}, Ll/h8f;-><init>(Ll/fe80;)V

    .line 315
    .line 316
    .line 317
    const/4 v5, -0x1

    .line 318
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 319
    .line 320
    .line 321
    :cond_12
    if-eqz v10, :cond_13

    .line 322
    .line 323
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 324
    .line 325
    new-instance v4, Ll/i8f;

    .line 326
    .line 327
    invoke-direct {v4, v1}, Ll/i8f;-><init>(Ll/fe80;)V

    .line 328
    .line 329
    .line 330
    const/4 v5, 0x4

    .line 331
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 332
    .line 333
    .line 334
    :cond_13
    if-eqz v6, :cond_14

    .line 335
    .line 336
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 337
    .line 338
    new-instance v4, Ll/p8f;

    .line 339
    .line 340
    move/from16 v5, p3

    .line 341
    .line 342
    invoke-direct {v4, v1, v5}, Ll/p8f;-><init>(Ll/fe80;I)V

    .line 343
    .line 344
    .line 345
    const/4 v5, 0x5

    .line 346
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 347
    .line 348
    .line 349
    :cond_14
    iget v3, v2, Ll/fe80;->m:I

    .line 350
    .line 351
    iget v4, v1, Ll/fe80;->m:I

    .line 352
    .line 353
    if-eq v3, v4, :cond_15

    .line 354
    .line 355
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 356
    .line 357
    new-instance v4, Ll/y8f;

    .line 358
    .line 359
    invoke-direct {v4, v1}, Ll/y8f;-><init>(Ll/fe80;)V

    .line 360
    .line 361
    .line 362
    const/4 v5, 0x6

    .line 363
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 364
    .line 365
    .line 366
    :cond_15
    invoke-virtual {v2}, Ll/fe80;->n()Z

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    invoke-virtual {v1}, Ll/fe80;->n()Z

    .line 371
    .line 372
    .line 373
    move-result v4

    .line 374
    if-eq v3, v4, :cond_16

    .line 375
    .line 376
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 377
    .line 378
    new-instance v4, Ll/z8f;

    .line 379
    .line 380
    invoke-direct {v4, v1}, Ll/z8f;-><init>(Ll/fe80;)V

    .line 381
    .line 382
    .line 383
    const/4 v5, 0x7

    .line 384
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 385
    .line 386
    .line 387
    :cond_16
    iget-object v3, v2, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 388
    .line 389
    iget-object v4, v1, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 390
    .line 391
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/s;->equals(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    move-result v3

    .line 395
    if-nez v3, :cond_17

    .line 396
    .line 397
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 398
    .line 399
    new-instance v4, Ll/a9f;

    .line 400
    .line 401
    invoke-direct {v4, v1}, Ll/a9f;-><init>(Ll/fe80;)V

    .line 402
    .line 403
    .line 404
    const/16 v5, 0xc

    .line 405
    .line 406
    invoke-virtual {v3, v5, v4}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 407
    .line 408
    .line 409
    :cond_17
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/i;->S0()V

    .line 410
    .line 411
    .line 412
    iget-object v3, v0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 413
    .line 414
    invoke-virtual {v3}, Ll/bqr;->f()V

    .line 415
    .line 416
    .line 417
    iget-boolean v2, v2, Ll/fe80;->o:Z

    .line 418
    .line 419
    iget-boolean v3, v1, Ll/fe80;->o:Z

    .line 420
    .line 421
    if-eq v2, v3, :cond_18

    .line 422
    .line 423
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->m:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 424
    .line 425
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    if-eqz v2, :cond_18

    .line 434
    .line 435
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    check-cast v2, Lcom/google/android/exoplayer2/ExoPlayer$b;

    .line 440
    .line 441
    iget-boolean v3, v1, Ll/fe80;->o:Z

    .line 442
    .line 443
    invoke-interface {v2, v3}, Lcom/google/android/exoplayer2/ExoPlayer$b;->u(Z)V

    .line 444
    .line 445
    .line 446
    goto :goto_3

    .line 447
    :cond_18
    return-void
.end method

.method public final V0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/PriorityTaskManager;->a(I)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/PriorityTaskManager;->b(I)V

    .line 26
    .line 27
    .line 28
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final W0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlaybackState()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_3

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eq v0, v3, :cond_1

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    if-eq v0, v3, :cond_1

    .line 14
    .line 15
    const/4 v2, 0x4

    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->experimentalIsSleepingForOffload()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlayWhenReady()Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_2

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    move v1, v2

    .line 38
    :cond_2
    invoke-virtual {v3, v1}, Ll/wop0;->b(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlayWhenReady()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {v0, p0}, Ll/kfq0;->b(Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/wop0;->b(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/kfq0;->b(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final X0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->d:Ll/wt5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wt5;->b()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getApplicationLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getApplicationLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "Player is accessed on the wrong thread.\nCurrent thread: \'%s\'\nExpected thread: \'%s\'\nSee https://developer.android.com/guide/topics/media/issues/player-accessed-on-wrong-thread"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/i;->n0:Z

    .line 51
    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/i;->o0:Z

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    .line 63
    .line 64
    .line 65
    :goto_0
    const-string v2, "ExoPlayerImpl"

    .line 66
    .line 67
    invoke-static {v2, v0, v1}, Ll/kyv;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/i;->o0:Z

    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method public addAnalyticsListener(Ll/hk0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/hk0;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/dk0;->d0(Ll/hk0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public addAudioOffloadListener(Lcom/google/android/exoplayer2/ExoPlayer$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->m:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addListener(Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/bqr;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public addMediaItems(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/n;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/i;->r0(Ljava/util/List;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/i;->addMediaSources(ILjava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public addMediaSource(ILcom/google/android/exoplayer2/source/i;)V
    .locals 0

    .line 12
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 13
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/i;->addMediaSources(ILjava/util/List;)V

    return-void
.end method

.method public addMediaSource(Lcom/google/android/exoplayer2/source/i;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->addMediaSources(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public addMediaSources(ILjava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ltz p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    invoke-static {v2}, Ll/w11;->a(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    iget p1, p0, Lcom/google/android/exoplayer2/i;->w0:I

    .line 33
    .line 34
    const/4 v2, -0x1

    .line 35
    if-ne p1, v2, :cond_1

    .line 36
    .line 37
    move v0, v1

    .line 38
    :cond_1
    invoke-virtual {p0, p2, v0}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;Z)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 43
    .line 44
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/i;->n0(Ll/fe80;ILjava/util/List;)Ll/fe80;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/4 v9, -0x1

    .line 49
    const/4 v10, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v4, 0x1

    .line 52
    const/4 v5, 0x0

    .line 53
    const/4 v6, 0x5

    .line 54
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    move-object v1, p0

    .line 60
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public addMediaSources(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)V"
        }
    .end annotation

    .line 64
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/i;->addMediaSources(ILjava/util/List;)V

    return-void
.end method

.method public c(IJIZ)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v3, 0x0

    .line 10
    :goto_0
    invoke-static {v3}, Ll/w11;->a(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 14
    .line 15
    invoke-interface {v3}, Ll/dk0;->X()V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 19
    .line 20
    iget-object v3, v3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-nez v4, :cond_1

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->t()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-lt p1, v4, :cond_1

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget v4, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 36
    .line 37
    add-int/2addr v4, v2

    .line 38
    iput v4, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->isPlayingAd()Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_2

    .line 45
    .line 46
    const-string v1, "ExoPlayerImpl"

    .line 47
    .line 48
    const-string v3, "seekTo ignored because an ad is playing"

    .line 49
    .line 50
    invoke-static {v1, v3}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Lcom/google/android/exoplayer2/j$e;

    .line 54
    .line 55
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 56
    .line 57
    invoke-direct {v1, v3}, Lcom/google/android/exoplayer2/j$e;-><init>(Ll/fe80;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/j$e;->b(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->j:Lcom/google/android/exoplayer2/j$f;

    .line 64
    .line 65
    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/j$f;->a(Lcom/google/android/exoplayer2/j$e;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 70
    .line 71
    iget v4, v2, Ll/fe80;->e:I

    .line 72
    .line 73
    const/4 v5, 0x3

    .line 74
    if-eq v4, v5, :cond_3

    .line 75
    .line 76
    const/4 v5, 0x4

    .line 77
    if-ne v4, v5, :cond_4

    .line 78
    .line 79
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-nez v4, :cond_4

    .line 84
    .line 85
    :cond_3
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 86
    .line 87
    const/4 v4, 0x2

    .line 88
    invoke-virtual {v2, v4}, Ll/fe80;->h(I)Ll/fe80;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    :cond_4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentMediaItemIndex()I

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    invoke-virtual {p0, v3, p1, p2, p3}, Lcom/google/android/exoplayer2/i;->F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-virtual {p0, v2, v3, v6}, Lcom/google/android/exoplayer2/i;->E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iget-object v6, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 105
    .line 106
    invoke-static {p2, p3}, Ll/bmk0;->J0(J)J

    .line 107
    .line 108
    .line 109
    move-result-wide v4

    .line 110
    invoke-virtual {v6, v3, p1, v4, v5}, Lcom/google/android/exoplayer2/j;->F0(Lcom/google/android/exoplayer2/c0;IJ)V

    .line 111
    .line 112
    .line 113
    const/4 v5, 0x1

    .line 114
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/i;->v0(Ll/fe80;)J

    .line 115
    .line 116
    .line 117
    move-result-wide v6

    .line 118
    move-object v1, v2

    .line 119
    const/4 v2, 0x0

    .line 120
    const/4 v3, 0x1

    .line 121
    const/4 v4, 0x1

    .line 122
    move-object v0, p0

    .line 123
    move v9, p5

    .line 124
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public clearAuxEffectInfo()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wj1;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, v2}, Ll/wj1;-><init>(IF)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->setAuxEffectInfo(Ll/wj1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public clearCameraMotionListener(Ll/gb4;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->m0:Ll/gb4;

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 p1, 0x8

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public clearVideoFrameMetadataListener(Ll/iel0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l0:Ll/iel0;

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x7

    .line 16
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public clearVideoSurface()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, v0}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public clearVideoSurface(Landroid/view/Surface;)V
    .locals 1
    .param p1    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    if-eqz p1, :cond_0

    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->V:Ljava/lang/Object;

    if-ne p1, v0, :cond_0

    .line 18
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->clearVideoSurface()V

    :cond_0
    return-void
.end method

.method public clearVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1    # Landroid/view/SurfaceHolder;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->clearVideoSurface()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public clearVideoSurfaceView(Landroid/view/SurfaceView;)V
    .locals 0
    .param p1    # Landroid/view/SurfaceView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->clearVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public clearVideoTextureView(Landroid/view/TextureView;)V
    .locals 1
    .param p1    # Landroid/view/TextureView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->a0:Landroid/view/TextureView;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->clearVideoSurface()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public createMessage(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public decreaseDeviceVolume()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->c(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public decreaseDeviceVolume(I)V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 14
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    if-eqz p0, :cond_0

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/StreamVolumeManager;->c(I)V

    :cond_0
    return-void
.end method

.method public experimentalIsSleepingForOffload()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/fe80;->o:Z

    .line 7
    .line 8
    return p0
.end method

.method public experimentalSetOffloadSchedulingEnabled(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/j;->y(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->m:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/google/android/exoplayer2/ExoPlayer$b;

    .line 26
    .line 27
    invoke-interface {v0, p1}, Lcom/google/android/exoplayer2/ExoPlayer$b;->I(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public getAnalyticsCollector()Ll/dk0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 5
    .line 6
    return-object p0
.end method

.method public getApplicationLooper()Landroid/os/Looper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->s:Landroid/os/Looper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioAttributes()Lcom/google/android/exoplayer2/audio/a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 5
    .line 6
    return-object p0
.end method

.method public getAudioComponent()Lcom/google/android/exoplayer2/ExoPlayer$a;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public getAudioDecoderCounters()Ll/jid;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->f0:Ll/jid;

    .line 5
    .line 6
    return-object p0
.end method

.method public getAudioFormat()Lcom/google/android/exoplayer2/k;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->T:Lcom/google/android/exoplayer2/k;

    .line 5
    .line 6
    return-object p0
.end method

.method public getAudioSessionId()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/exoplayer2/i;->g0:I

    .line 5
    .line 6
    return p0
.end method

.method public getAvailableCommands()Lcom/google/android/exoplayer2/t$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->P:Lcom/google/android/exoplayer2/t$b;

    .line 5
    .line 6
    return-object p0
.end method

.method public getBufferedPosition()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->isPlayingAd()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 11
    .line 12
    iget-object v1, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 13
    .line 14
    iget-object v0, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ll/fyx;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 23
    .line 24
    iget-wide v0, p0, Ll/fe80;->p:J

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    return-wide v0

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getDuration()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    return-wide v0

    .line 36
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getContentBufferedPosition()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    return-wide v0
.end method

.method public getClock()Ll/qa5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->w:Ll/qa5;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBufferedPosition()J
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-wide v0, p0, Lcom/google/android/exoplayer2/i;->y0:J

    .line 15
    .line 16
    return-wide v0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 18
    .line 19
    iget-object v1, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 20
    .line 21
    iget-wide v1, v1, Ll/fyx;->d:J

    .line 22
    .line 23
    iget-object v3, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 24
    .line 25
    iget-wide v3, v3, Ll/fyx;->d:J

    .line 26
    .line 27
    cmp-long v1, v1, v3

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentMediaItemIndex()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iget-object p0, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 38
    .line 39
    invoke-virtual {v0, v1, p0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$d;->f()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    return-wide v0

    .line 48
    :cond_1
    iget-wide v0, v0, Ll/fe80;->p:J

    .line 49
    .line 50
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 51
    .line 52
    iget-object v2, v2, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/fyx;->b()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 61
    .line 62
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 63
    .line 64
    iget-object v0, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 65
    .line 66
    iget-object v0, v0, Ll/fyx;->a:Ljava/lang/Object;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 69
    .line 70
    invoke-virtual {v1, v0, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 75
    .line 76
    iget-object v1, v1, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 77
    .line 78
    iget v1, v1, Ll/fyx;->b:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/c0$b;->i(I)J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    const-wide/high16 v3, -0x8000000000000000L

    .line 85
    .line 86
    cmp-long v3, v1, v3

    .line 87
    .line 88
    if-nez v3, :cond_2

    .line 89
    .line 90
    iget-wide v0, v0, Lcom/google/android/exoplayer2/c0$b;->d:J

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    move-wide v0, v1

    .line 94
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 95
    .line 96
    iget-object v3, v2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 97
    .line 98
    iget-object v2, v2, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 99
    .line 100
    invoke-virtual {p0, v3, v2, v0, v1}, Lcom/google/android/exoplayer2/i;->H0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;J)J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    return-wide v0
.end method

.method public getContentPosition()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->u0(Ll/fe80;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    return-wide v0
.end method

.method public getCurrentAdGroupIndex()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->isPlayingAd()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 11
    .line 12
    iget-object p0, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 13
    .line 14
    iget p0, p0, Ll/fyx;->b:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, -0x1

    .line 18
    return p0
.end method

.method public getCurrentAdIndexInAdGroup()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->isPlayingAd()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 11
    .line 12
    iget-object p0, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 13
    .line 14
    iget p0, p0, Ll/fyx;->c:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, -0x1

    .line 18
    return p0
.end method

.method public getCurrentCues()Ll/qyb;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->k0:Ll/qyb;

    .line 5
    .line 6
    return-object p0
.end method

.method public getCurrentMediaItemIndex()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, -0x1

    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return p0
.end method

.method public getCurrentPeriodIndex()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget p0, p0, Lcom/google/android/exoplayer2/i;->x0:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 18
    .line 19
    iget-object v0, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 22
    .line 23
    iget-object p0, p0, Ll/fyx;->a:Ljava/lang/Object;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->v0(Ll/fe80;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public getCurrentTimeline()Lcom/google/android/exoplayer2/c0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    return-object p0
.end method

.method public getCurrentTrackGroups()Ll/ffj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->h:Ll/ffj0;

    .line 7
    .line 8
    return-object p0
.end method

.method public getCurrentTrackSelections()Ll/wfj0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wfj0;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 7
    .line 8
    iget-object p0, p0, Ll/fe80;->i:Ll/dgj0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/dgj0;->c:[Ll/u9f;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/wfj0;-><init>([Ll/vfj0;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public getCurrentTracks()Lcom/google/android/exoplayer2/d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->i:Ll/dgj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dgj0;->d:Lcom/google/android/exoplayer2/d0;

    .line 9
    .line 10
    return-object p0
.end method

.method public getDeviceComponent()Lcom/google/android/exoplayer2/ExoPlayer$d;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public getDeviceInfo()Lcom/google/android/exoplayer2/h;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->s0:Lcom/google/android/exoplayer2/h;

    .line 5
    .line 6
    return-object p0
.end method

.method public getDeviceVolume()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->g()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public getDuration()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->isPlayingAd()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 11
    .line 12
    iget-object v1, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 13
    .line 14
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 15
    .line 16
    iget-object v2, v1, Ll/fyx;->a:Ljava/lang/Object;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 24
    .line 25
    iget v0, v1, Ll/fyx;->b:I

    .line 26
    .line 27
    iget v1, v1, Ll/fyx;->c:I

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/c0$b;->e(II)J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    return-wide v0

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c;->getContentDuration()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    return-wide v0
.end method

.method public getMaxSeekToPreviousPosition()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0xbb8

    .line 5
    .line 6
    return-wide v0
.end method

.method public getMediaMetadata()Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->Q:Lcom/google/android/exoplayer2/o;

    .line 5
    .line 6
    return-object p0
.end method

.method public getPauseAtEndOfMediaItems()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/i;->O:Z

    .line 5
    .line 6
    return p0
.end method

.method public getPlayWhenReady()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/fe80;->l:Z

    .line 7
    .line 8
    return p0
.end method

.method public getPlaybackLooper()Landroid/os/Looper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/j;->F()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPlaybackParameters()Lcom/google/android/exoplayer2/s;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 7
    .line 8
    return-object p0
.end method

.method public getPlaybackState()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget p0, p0, Ll/fe80;->e:I

    .line 7
    .line 8
    return p0
.end method

.method public getPlaybackSuppressionReason()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget p0, p0, Ll/fe80;->m:I

    .line 7
    .line 8
    return p0
.end method

.method public getPlayerError()Lcom/google/android/exoplayer2/ExoPlaybackException;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 7
    .line 8
    return-object p0
.end method

.method public bridge synthetic getPlayerError()Lcom/google/android/exoplayer2/PlaybackException;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlayerError()Lcom/google/android/exoplayer2/ExoPlaybackException;

    move-result-object p0

    return-object p0
.end method

.method public getPlaylistMetadata()Lcom/google/android/exoplayer2/o;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->R:Lcom/google/android/exoplayer2/o;

    .line 5
    .line 6
    return-object p0
.end method

.method public getRenderer(I)Lcom/google/android/exoplayer2/x;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->g:[Lcom/google/android/exoplayer2/x;

    .line 5
    .line 6
    aget-object p0, p0, p1

    .line 7
    .line 8
    return-object p0
.end method

.method public getRendererCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->g:[Lcom/google/android/exoplayer2/x;

    .line 5
    .line 6
    array-length p0, p0

    .line 7
    return p0
.end method

.method public getRendererType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->g:[Lcom/google/android/exoplayer2/x;

    .line 5
    .line 6
    aget-object p0, p0, p1

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/google/android/exoplayer2/x;->getTrackType()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getRepeatMode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/exoplayer2/i;->F:I

    .line 5
    .line 6
    return p0
.end method

.method public getSeekBackIncrement()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/google/android/exoplayer2/i;->u:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public getSeekForwardIncrement()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/google/android/exoplayer2/i;->v:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public getSeekParameters()Ll/nke0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->M:Ll/nke0;

    .line 5
    .line 6
    return-object p0
.end method

.method public getShuffleModeEnabled()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/i;->G:Z

    .line 5
    .line 6
    return p0
.end method

.method public getSkipSilenceEnabled()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 5
    .line 6
    return p0
.end method

.method public getSurfaceSize()Ll/brf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->d0:Ll/brf0;

    .line 5
    .line 6
    return-object p0
.end method

.method public getTextComponent()Lcom/google/android/exoplayer2/ExoPlayer$e;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public getTotalBufferedDuration()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-wide v0, p0, Ll/fe80;->q:J

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public getTrackSelectionParameters()Ll/agj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/cgj0;->c()Ll/agj0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getTrackSelector()Ll/cgj0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 5
    .line 6
    return-object p0
.end method

.method public getVideoChangeFrameRateStrategy()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/exoplayer2/i;->c0:I

    .line 5
    .line 6
    return p0
.end method

.method public getVideoComponent()Lcom/google/android/exoplayer2/ExoPlayer$f;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public getVideoDecoderCounters()Ll/jid;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->e0:Ll/jid;

    .line 5
    .line 6
    return-object p0
.end method

.method public getVideoFormat()Lcom/google/android/exoplayer2/k;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->S:Lcom/google/android/exoplayer2/k;

    .line 5
    .line 6
    return-object p0
.end method

.method public getVideoScalingMode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/exoplayer2/i;->b0:I

    .line 5
    .line 6
    return p0
.end method

.method public getVideoSize()Ll/zjl0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->t0:Ll/zjl0;

    .line 5
    .line 6
    return-object p0
.end method

.method public getVolume()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/google/android/exoplayer2/i;->i0:F

    .line 5
    .line 6
    return p0
.end method

.method public increaseDeviceVolume()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->i(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public increaseDeviceVolume(I)V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 14
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    if-eqz p0, :cond_0

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/StreamVolumeManager;->i(I)V

    :cond_0
    return-void
.end method

.method public isDeviceMuted()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->j()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/fe80;->g:Z

    .line 7
    .line 8
    return p0
.end method

.method public isPlayingAd()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/fyx;->b()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public isTunnelingEnabled()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fe80;->i:Ll/dgj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dgj0;->b:[Ll/jzc0;

    .line 9
    .line 10
    array-length v0, p0

    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    if-ge v2, v0, :cond_1

    .line 14
    .line 15
    aget-object v3, p0, v2

    .line 16
    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    iget-boolean v3, v3, Ll/jzc0;->a:Z

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return v1
.end method

.method public final m0(ILjava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/q$c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Lcom/google/android/exoplayer2/q$c;

    .line 14
    .line 15
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/google/android/exoplayer2/source/i;

    .line 20
    .line 21
    iget-boolean v4, p0, Lcom/google/android/exoplayer2/i;->p:Z

    .line 22
    .line 23
    invoke-direct {v2, v3, v4}, Lcom/google/android/exoplayer2/q$c;-><init>(Lcom/google/android/exoplayer2/source/i;Z)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 30
    .line 31
    add-int v4, v1, p1

    .line 32
    .line 33
    new-instance v5, Lcom/google/android/exoplayer2/i$e;

    .line 34
    .line 35
    iget-object v6, v2, Lcom/google/android/exoplayer2/q$c;->b:Ljava/lang/Object;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/google/android/exoplayer2/q$c;->a:Lcom/google/android/exoplayer2/source/g;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/g;->x()Lcom/google/android/exoplayer2/c0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {v5, v6, v2}, Lcom/google/android/exoplayer2/i$e;-><init>(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v3, v4, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-interface {p2, p1, v1}, Ll/n8f0;->g(II)Ll/n8f0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 63
    .line 64
    return-object v0
.end method

.method public moveMediaItems(III)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    if-gt p1, p2, :cond_0

    .line 8
    .line 9
    if-ltz p3, :cond_0

    .line 10
    .line 11
    move v4, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v4, 0x0

    .line 14
    :goto_0
    invoke-static {v4}, Ll/w11;->a(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v4, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    sub-int v1, v7, p1

    .line 28
    .line 29
    sub-int v1, v4, v1

    .line 30
    .line 31
    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    .line 32
    .line 33
    .line 34
    move-result v8

    .line 35
    if-ge p1, v4, :cond_2

    .line 36
    .line 37
    if-eq p1, v7, :cond_2

    .line 38
    .line 39
    if-ne p1, v8, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget v2, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 47
    .line 48
    add-int/2addr v2, v3

    .line 49
    iput v2, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 50
    .line 51
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v2, p1, v7, v8}, Ll/bmk0;->I0(Ljava/util/List;III)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->q0()Lcom/google/android/exoplayer2/c0;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v9, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 61
    .line 62
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    iget-object v4, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 67
    .line 68
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/i;->u0(Ll/fe80;)J

    .line 69
    .line 70
    .line 71
    move-result-wide v4

    .line 72
    move-object v0, p0

    .line 73
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/i;->x0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p0, v9, v2, v1}, Lcom/google/android/exoplayer2/i;->E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 84
    .line 85
    invoke-virtual {v2, p1, v7, v8, v3}, Lcom/google/android/exoplayer2/j;->g0(IIILl/n8f0;)V

    .line 86
    .line 87
    .line 88
    const/4 v8, -0x1

    .line 89
    const/4 v9, 0x0

    .line 90
    const/4 v2, 0x0

    .line 91
    const/4 v3, 0x1

    .line 92
    const/4 v4, 0x0

    .line 93
    const/4 v5, 0x5

    .line 94
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 100
    .line 101
    .line 102
    :cond_2
    :goto_1
    return-void
.end method

.method public final n0(Ll/fe80;ILjava/util/List;)Ll/fe80;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fe80;",
            "I",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)",
            "Ll/fe80;"
        }
    .end annotation

    .line 1
    iget-object v1, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    iget v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    iput v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 8
    .line 9
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer2/i;->m0(ILjava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->q0()Lcom/google/android/exoplayer2/c0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->u0(Ll/fe80;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    move-object v0, p0

    .line 26
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/i;->x0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p1, v2, p0}, Lcom/google/android/exoplayer2/i;->E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-object p1, v0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 37
    .line 38
    invoke-virtual {p1, p2, p3, v0}, Lcom/google/android/exoplayer2/j;->n(ILjava/util/List;Ll/n8f0;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public final o0()Lcom/google/android/exoplayer2/o;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentTimeline()Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentMediaItemIndex()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-object v2, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/google/android/exoplayer2/c0$d;->c:Lcom/google/android/exoplayer2/n;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->u0:Lcom/google/android/exoplayer2/o;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/o;->b()Lcom/google/android/exoplayer2/o$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object v0, v0, Lcom/google/android/exoplayer2/n;->e:Lcom/google/android/exoplayer2/o;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/o$b;->J(Lcom/google/android/exoplayer2/o;)Lcom/google/android/exoplayer2/o$b;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/o$b;->H()Lcom/google/android/exoplayer2/o;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public prepare()V
    .locals 14

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlayWhenReady()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-virtual {v1, v0, v2}, Lcom/google/android/exoplayer2/b;->p(ZI)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/i;->y0(ZI)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {p0, v0, v1, v3}, Lcom/google/android/exoplayer2/i;->T0(ZII)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 23
    .line 24
    iget v1, v0, Ll/fe80;->e:I

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    if-eq v1, v3, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Ll/fe80;->f(Lcom/google/android/exoplayer2/ExoPlaybackException;)Ll/fe80;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const/4 v2, 0x4

    .line 44
    :cond_1
    invoke-virtual {v0, v2}, Ll/fe80;->h(I)Ll/fe80;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 49
    .line 50
    add-int/2addr v0, v3

    .line 51
    iput v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 52
    .line 53
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->l0()V

    .line 56
    .line 57
    .line 58
    const/4 v12, -0x1

    .line 59
    const/4 v13, 0x0

    .line 60
    const/4 v6, 0x1

    .line 61
    const/4 v7, 0x1

    .line 62
    const/4 v8, 0x0

    .line 63
    const/4 v9, 0x5

    .line 64
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    move-object v4, p0

    .line 70
    invoke-virtual/range {v4 .. v13}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public prepare(Lcom/google/android/exoplayer2/source/i;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 74
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 75
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->setMediaSource(Lcom/google/android/exoplayer2/source/i;)V

    .line 76
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->prepare()V

    return-void
.end method

.method public prepare(Lcom/google/android/exoplayer2/source/i;ZZ)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 77
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 78
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/i;->setMediaSource(Lcom/google/android/exoplayer2/source/i;Z)V

    .line 79
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->prepare()V

    return-void
.end method

.method public final q0()Lcom/google/android/exoplayer2/c0;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/v;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/google/android/exoplayer2/v;-><init>(Ljava/util/Collection;Ll/n8f0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final r0(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/n;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->q:Lcom/google/android/exoplayer2/source/i$a;

    .line 14
    .line 15
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/google/android/exoplayer2/n;

    .line 20
    .line 21
    invoke-interface {v2, v3}, Lcom/google/android/exoplayer2/source/i$a;->c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-object v0
.end method

.method public release()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Release "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " [ExoPlayerLib/2.19.1] ["

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    sget-object v1, Ll/bmk0;->e:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "] ["

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/t9f;->b()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, "]"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "ExoPlayerImpl"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 56
    .line 57
    .line 58
    sget v0, Ll/bmk0;->a:I

    .line 59
    .line 60
    const/16 v1, 0x15

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    if-ge v0, v1, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 66
    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    .line 70
    .line 71
    .line 72
    iput-object v2, p0, Lcom/google/android/exoplayer2/i;->U:Landroid/media/AudioTrack;

    .line 73
    .line 74
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->z:Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;->b(Z)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->k()V

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ll/wop0;->b(Z)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ll/kfq0;->b(Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/b;->i()V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/j;->n0()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_2

    .line 109
    .line 110
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 111
    .line 112
    new-instance v3, Ll/k8f;

    .line 113
    .line 114
    invoke-direct {v3}, Ll/k8f;-><init>()V

    .line 115
    .line 116
    .line 117
    const/16 v4, 0xa

    .line 118
    .line 119
    invoke-virtual {v0, v4, v3}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/bqr;->i()V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->i:Ll/sxk;

    .line 128
    .line 129
    invoke-interface {v0, v2}, Ll/sxk;->d(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->t:Ll/md2;

    .line 133
    .line 134
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 135
    .line 136
    invoke-interface {v0, v3}, Ll/md2;->h(Ll/md2$a;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 140
    .line 141
    iget-boolean v3, v0, Ll/fe80;->o:Z

    .line 142
    .line 143
    if-eqz v3, :cond_3

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/fe80;->a()Ll/fe80;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 150
    .line 151
    :cond_3
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 152
    .line 153
    const/4 v3, 0x1

    .line 154
    invoke-virtual {v0, v3}, Ll/fe80;->h(I)Ll/fe80;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 159
    .line 160
    iget-object v4, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 161
    .line 162
    invoke-virtual {v0, v4}, Ll/fe80;->c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 167
    .line 168
    iget-wide v4, v0, Ll/fe80;->r:J

    .line 169
    .line 170
    iput-wide v4, v0, Ll/fe80;->p:J

    .line 171
    .line 172
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 173
    .line 174
    const-wide/16 v4, 0x0

    .line 175
    .line 176
    iput-wide v4, v0, Ll/fe80;->q:J

    .line 177
    .line 178
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 179
    .line 180
    invoke-interface {v0}, Ll/dk0;->release()V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 184
    .line 185
    invoke-virtual {v0}, Ll/cgj0;->j()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->W:Landroid/view/Surface;

    .line 192
    .line 193
    if-eqz v0, :cond_4

    .line 194
    .line 195
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 196
    .line 197
    .line 198
    iput-object v2, p0, Lcom/google/android/exoplayer2/i;->W:Landroid/view/Surface;

    .line 199
    .line 200
    :cond_4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 201
    .line 202
    if-eqz v0, :cond_5

    .line 203
    .line 204
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 205
    .line 206
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/PriorityTaskManager;->b(I)V

    .line 213
    .line 214
    .line 215
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 216
    .line 217
    :cond_5
    sget-object v0, Ll/qyb;->c:Ll/qyb;

    .line 218
    .line 219
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->k0:Ll/qyb;

    .line 220
    .line 221
    iput-boolean v3, p0, Lcom/google/android/exoplayer2/i;->r0:Z

    .line 222
    .line 223
    return-void
.end method

.method public removeAnalyticsListener(Ll/hk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->r:Ll/dk0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ll/hk0;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/dk0;->e0(Ll/hk0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public removeAudioOffloadListener(Lcom/google/android/exoplayer2/ExoPlayer$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->m:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public removeListener(Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 5
    .line 6
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/bqr;->j(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public removeMediaItems(II)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    if-lt p2, p1, :cond_0

    .line 8
    .line 9
    move v1, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    invoke-static {v1}, Ll/w11;->a(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-ge p1, v1, :cond_2

    .line 26
    .line 27
    if-ne p1, p2, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 31
    .line 32
    invoke-virtual {p0, v1, p1, p2}, Lcom/google/android/exoplayer2/i;->I0(Ll/fe80;II)Ll/fe80;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget-object p1, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 37
    .line 38
    iget-object p1, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 39
    .line 40
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 41
    .line 42
    iget-object p2, p2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 43
    .line 44
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    xor-int/lit8 v6, p1, 0x1

    .line 51
    .line 52
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/i;->v0(Ll/fe80;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v8

    .line 56
    const/4 v10, -0x1

    .line 57
    const/4 v11, 0x0

    .line 58
    const/4 v4, 0x0

    .line 59
    const/4 v5, 0x1

    .line 60
    const/4 v7, 0x4

    .line 61
    move-object v2, p0

    .line 62
    invoke-virtual/range {v2 .. v11}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    return-void
.end method

.method public replaceMediaItems(IILjava/util/List;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/n;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ltz p1, :cond_0

    .line 7
    .line 8
    if-lt p2, p1, :cond_0

    .line 9
    .line 10
    move v2, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v2, v0

    .line 13
    :goto_0
    invoke-static {v2}, Ll/w11;->a(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-le p1, v2, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/i;->r0(Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    iget p1, p0, Lcom/google/android/exoplayer2/i;->w0:I

    .line 42
    .line 43
    const/4 p2, -0x1

    .line 44
    if-ne p1, p2, :cond_2

    .line 45
    .line 46
    move v0, v1

    .line 47
    :cond_2
    invoke-virtual {p0, p3, v0}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 52
    .line 53
    invoke-virtual {p0, v0, p2, p3}, Lcom/google/android/exoplayer2/i;->n0(Ll/fe80;ILjava/util/List;)Ll/fe80;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-virtual {p0, p3, p1, p2}, Lcom/google/android/exoplayer2/i;->I0(Ll/fe80;II)Ll/fe80;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object p1, v3, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 62
    .line 63
    iget-object p1, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 64
    .line 65
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 66
    .line 67
    iget-object p2, p2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 68
    .line 69
    iget-object p2, p2, Ll/fyx;->a:Ljava/lang/Object;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    xor-int/lit8 v6, p1, 0x1

    .line 76
    .line 77
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/i;->v0(Ll/fe80;)J

    .line 78
    .line 79
    .line 80
    move-result-wide v8

    .line 81
    const/4 v10, -0x1

    .line 82
    const/4 v11, 0x0

    .line 83
    const/4 v4, 0x0

    .line 84
    const/4 v5, 0x1

    .line 85
    const/4 v7, 0x4

    .line 86
    move-object v2, p0

    .line 87
    invoke-virtual/range {v2 .. v11}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Lcom/google/android/exoplayer2/u;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 12
    .line 13
    iget-object v4, v3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 14
    .line 15
    const/4 v3, -0x1

    .line 16
    if-ne v0, v3, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :cond_0
    move v5, v0

    .line 20
    iget-object v6, p0, Lcom/google/android/exoplayer2/i;->w:Ll/qa5;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/j;->F()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    move-object v3, p1

    .line 27
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer2/u;-><init>(Lcom/google/android/exoplayer2/u$a;Lcom/google/android/exoplayer2/u$b;Lcom/google/android/exoplayer2/c0;ILl/qa5;Landroid/os/Looper;)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public setAudioAttributes(Lcom/google/android/exoplayer2/audio/a;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->r0:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->h0:Lcom/google/android/exoplayer2/audio/a;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget v1, p1, Lcom/google/android/exoplayer2/audio/a;->c:I

    .line 29
    .line 30
    invoke-static {v1}, Ll/bmk0;->j0(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/StreamVolumeManager;->m(I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 38
    .line 39
    new-instance v1, Ll/j8f;

    .line 40
    .line 41
    invoke-direct {v1, p1}, Ll/j8f;-><init>(Lcom/google/android/exoplayer2/audio/a;)V

    .line 42
    .line 43
    .line 44
    const/16 v2, 0x14

    .line 45
    .line 46
    invoke-virtual {v0, v2, v1}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 50
    .line 51
    if-eqz p2, :cond_3

    .line 52
    .line 53
    move-object p2, p1

    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 p2, 0x0

    .line 56
    :goto_0
    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer2/b;->m(Lcom/google/android/exoplayer2/audio/a;)V

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Ll/cgj0;->l(Lcom/google/android/exoplayer2/audio/a;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlayWhenReady()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iget-object p2, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlaybackState()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p2, p1, v0}, Lcom/google/android/exoplayer2/b;->p(ZI)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    invoke-static {p1, p2}, Lcom/google/android/exoplayer2/i;->y0(ZI)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/exoplayer2/i;->T0(ZII)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/bqr;->f()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public setAudioSessionId(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/exoplayer2/i;->g0:I

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/16 v0, 0x15

    .line 10
    .line 11
    if-nez p1, :cond_2

    .line 12
    .line 13
    sget p1, Ll/bmk0;->a:I

    .line 14
    .line 15
    if-ge p1, v0, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->D0(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->e:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {p1}, Ll/bmk0;->G(Landroid/content/Context;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget v1, Ll/bmk0;->a:I

    .line 31
    .line 32
    if-ge v1, v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->D0(I)I

    .line 35
    .line 36
    .line 37
    :cond_3
    :goto_0
    iput p1, p0, Lcom/google/android/exoplayer2/i;->g0:I

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const/16 v3, 0xa

    .line 45
    .line 46
    invoke-virtual {p0, v1, v3, v2}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p0, v1, v3, v2}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 58
    .line 59
    new-instance v1, Ll/r8f;

    .line 60
    .line 61
    invoke-direct {v1, p1}, Ll/r8f;-><init>(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0, v1}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public setAuxEffectInfo(Ll/wj1;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x6

    .line 6
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCameraMotionListener(Ll/gb4;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->m0:Ll/gb4;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setDeviceMuted(Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->l(ZI)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setDeviceMuted(ZI)V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 14
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    if-eqz p0, :cond_0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/StreamVolumeManager;->l(ZI)V

    :cond_0
    return-void
.end method

.method public setDeviceVolume(I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->n(II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setDeviceVolume(II)V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 14
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->B:Lcom/google/android/exoplayer2/StreamVolumeManager;

    if-eqz p0, :cond_0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/StreamVolumeManager;->n(II)V

    :cond_0
    return-void
.end method

.method public setForegroundMode(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->L:Z

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/i;->L:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/j;->P0(Z)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    new-instance p1, Lcom/google/android/exoplayer2/ExoTimeoutException;

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    invoke-direct {p1, v0}, Lcom/google/android/exoplayer2/ExoTimeoutException;-><init>(I)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x3eb

    .line 25
    .line 26
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/ExoPlaybackException;->createForUnexpected(Ljava/lang/RuntimeException;I)Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->R0(Lcom/google/android/exoplayer2/ExoPlaybackException;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public setHandleAudioBecomingNoisy(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->r0:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->z:Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/AudioBecomingNoisyManager;->b(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setMediaItems(Ljava/util/List;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/n;",
            ">;IJ)V"
        }
    .end annotation

    .line 12
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 13
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->r0(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;IJ)V

    return-void
.end method

.method public setMediaItems(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/n;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->r0(Ljava/util/List;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setMediaSource(Lcom/google/android/exoplayer2/source/i;)V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 14
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;)V

    return-void
.end method

.method public setMediaSource(Lcom/google/android/exoplayer2/source/i;J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;IJ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setMediaSource(Lcom/google/android/exoplayer2/source/i;Z)V
    .locals 0

    .line 15
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 16
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;Z)V

    return-void
.end method

.method public setMediaSources(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer2/i;->setMediaSources(Ljava/util/List;Z)V

    return-void
.end method

.method public setMediaSources(Ljava/util/List;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;IJ)V"
        }
    .end annotation

    .line 19
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    .line 20
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/i;->N0(Ljava/util/List;IJZ)V

    return-void
.end method

.method public setMediaSources(Ljava/util/List;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/i;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v2, -0x1

    .line 5
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    move v5, p2

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/i;->N0(Ljava/util/List;IJZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setPauseAtEndOfMediaItems(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->O:Z

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/i;->O:Z

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->V0(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setPlayWhenReady(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlaybackState()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, p1, v1}, Lcom/google/android/exoplayer2/b;->p(ZI)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/i;->y0(ZI)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/i;->T0(ZII)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setPlaybackParameters(Lcom/google/android/exoplayer2/s;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 9
    .line 10
    iget-object v0, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/s;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/fe80;->g(Lcom/google/android/exoplayer2/s;)Ll/fe80;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    iput v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 30
    .line 31
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/j;->Z0(Lcom/google/android/exoplayer2/s;)V

    .line 34
    .line 35
    .line 36
    const/4 v9, -0x1

    .line 37
    const/4 v10, 0x0

    .line 38
    const/4 v3, 0x0

    .line 39
    const/4 v4, 0x1

    .line 40
    const/4 v5, 0x0

    .line 41
    const/4 v6, 0x5

    .line 42
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    move-object v1, p0

    .line 48
    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public setPlaylistMetadata(Lcom/google/android/exoplayer2/o;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->R:Lcom/google/android/exoplayer2/o;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/o;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->R:Lcom/google/android/exoplayer2/o;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 19
    .line 20
    new-instance v0, Ll/w8f;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/w8f;-><init>(Lcom/google/android/exoplayer2/i;)V

    .line 23
    .line 24
    .line 25
    const/16 p0, 0xf

    .line 26
    .line 27
    invoke-virtual {p1, p0, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setPreferredAudioDevice(Landroid/media/AudioDeviceInfo;)V
    .locals 2
    .param p1    # Landroid/media/AudioDeviceInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setPriorityTaskManager(Lcom/google/android/exoplayer2/util/PriorityTaskManager;)V
    .locals 2
    .param p1    # Lcom/google/android/exoplayer2/util/PriorityTaskManager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 5
    .line 6
    invoke-static {v0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 19
    .line 20
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/PriorityTaskManager;->b(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    if-eqz p1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->isLoading()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/util/PriorityTaskManager;->a(I)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/i;->q0:Z

    .line 45
    .line 46
    :goto_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->p0:Lcom/google/android/exoplayer2/util/PriorityTaskManager;

    .line 47
    .line 48
    return-void
.end method

.method public setRepeatMode(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/exoplayer2/i;->F:I

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    iput p1, p0, Lcom/google/android/exoplayer2/i;->F:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/j;->b1(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 16
    .line 17
    new-instance v1, Ll/q8f;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/q8f;-><init>(I)V

    .line 20
    .line 21
    .line 22
    const/16 p1, 0x8

    .line 23
    .line 24
    invoke-virtual {v0, p1, v1}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->S0()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/bqr;->f()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setSeekParameters(Ll/nke0;)V
    .locals 1
    .param p1    # Ll/nke0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Ll/nke0;->g:Ll/nke0;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->M:Ll/nke0;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/nke0;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->M:Ll/nke0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j;->d1(Ll/nke0;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setShuffleModeEnabled(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->G:Z

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/i;->G:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/j;->f1(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 16
    .line 17
    new-instance v1, Ll/t8f;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ll/t8f;-><init>(Z)V

    .line 20
    .line 21
    .line 22
    const/16 p1, 0x9

    .line 23
    .line 24
    invoke-virtual {v0, p1, v1}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->S0()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/bqr;->f()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public setShuffleOrder(Ll/n8f0;)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/n8f0;->getLength()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->o:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    move v0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->N:Ll/n8f0;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->q0()Lcom/google/android/exoplayer2/c0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentMediaItemIndex()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentPosition()J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    invoke-virtual {p0, v0, v3, v4, v5}, Lcom/google/android/exoplayer2/i;->F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0, v1, v0, v3}, Lcom/google/android/exoplayer2/i;->E0(Ll/fe80;Lcom/google/android/exoplayer2/c0;Landroid/util/Pair;)Ll/fe80;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    iget v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 48
    .line 49
    add-int/2addr v0, v2

    .line 50
    iput v0, p0, Lcom/google/android/exoplayer2/i;->H:I

    .line 51
    .line 52
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->k:Lcom/google/android/exoplayer2/j;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/j;->h1(Ll/n8f0;)V

    .line 55
    .line 56
    .line 57
    const/4 v12, -0x1

    .line 58
    const/4 v13, 0x0

    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v7, 0x1

    .line 61
    const/4 v8, 0x0

    .line 62
    const/4 v9, 0x5

    .line 63
    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    move-object v4, p0

    .line 69
    invoke-virtual/range {v4 .. v13}, Lcom/google/android/exoplayer2/i;->U0(Ll/fe80;IIZIJIZ)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public setSkipSilenceEnabled(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/i;->j0:Z

    .line 10
    .line 11
    const/16 v0, 0x9

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 22
    .line 23
    new-instance v0, Ll/l8f;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/l8f;-><init>(Z)V

    .line 26
    .line 27
    .line 28
    const/16 p1, 0x17

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setTrackSelectionParameters(Ll/agj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/cgj0;->h()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/cgj0;->c()Ll/agj0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ll/agj0;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->h:Ll/cgj0;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ll/cgj0;->m(Ll/agj0;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 31
    .line 32
    new-instance v0, Ll/u8f;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/u8f;-><init>(Ll/agj0;)V

    .line 35
    .line 36
    .line 37
    const/16 p1, 0x13

    .line 38
    .line 39
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public setVideoChangeFrameRateStrategy(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/google/android/exoplayer2/i;->c0:I

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput p1, p0, Lcom/google/android/exoplayer2/i;->c0:I

    .line 10
    .line 11
    const/4 v0, 0x5

    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {p0, v1, v0, p1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setVideoEffects(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ype;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    const/16 v1, 0xd

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setVideoFrameMetadataListener(Ll/iel0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->l0:Ll/iel0;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x7

    .line 13
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setVideoScalingMode(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/exoplayer2/i;->b0:I

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-virtual {p0, v1, v0, p1}, Lcom/google/android/exoplayer2/i;->L0(IILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setVideoSurface(Landroid/view/Surface;)V
    .locals 0
    .param p1    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, -0x1

    .line 15
    :goto_0
    invoke-virtual {p0, p1, p1}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1    # Landroid/view/SurfaceHolder;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->clearVideoSurface()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/i;->Z:Z

    .line 15
    .line 16
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->X:Landroid/view/SurfaceHolder;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 19
    .line 20
    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-virtual {p0, p1, p1}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public setVideoSurfaceView(Landroid/view/SurfaceView;)V
    .locals 2
    .param p1    # Landroid/view/SurfaceView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/adl0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->O0(Landroid/view/SurfaceHolder;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    instance-of v0, p1, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 27
    .line 28
    .line 29
    move-object v0, p1

    .line 30
    check-cast v0, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->y:Lcom/google/android/exoplayer2/i$d;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->s0(Lcom/google/android/exoplayer2/u$b;)Lcom/google/android/exoplayer2/u;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/16 v1, 0x2710

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/u;->n(I)Lcom/google/android/exoplayer2/u;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/u;->m(Ljava/lang/Object;)Lcom/google/android/exoplayer2/u;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/u;->l()Lcom/google/android/exoplayer2/u;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;->d(Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView$b;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->Y:Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView;->getVideoSurface()Landroid/view/Surface;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->O0(Landroid/view/SurfaceHolder;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    if-nez p1, :cond_2

    .line 80
    .line 81
    const/4 p1, 0x0

    .line 82
    goto :goto_0

    .line 83
    :cond_2
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->setVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public setVideoTextureView(Landroid/view/TextureView;)V
    .locals 2
    .param p1    # Landroid/view/TextureView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->clearVideoSurface()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->K0()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/google/android/exoplayer2/i;->a0:Landroid/view/TextureView;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const-string v0, "ExoPlayerImpl"

    .line 22
    .line 23
    const-string v1, "Replacing existing SurfaceTextureListener."

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->x:Lcom/google/android/exoplayer2/i$c;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/TextureView;->isAvailable()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move-object v0, v1

    .line 46
    :goto_0
    if-nez v0, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/i;->Q0(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    invoke-virtual {p0, p1, p1}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->P0(Landroid/graphics/SurfaceTexture;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/i;->G0(II)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public setVolume(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Ll/bmk0;->p(FFF)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Lcom/google/android/exoplayer2/i;->i0:F

    .line 12
    .line 13
    cmpl-float v0, v0, p1

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput p1, p0, Lcom/google/android/exoplayer2/i;->i0:F

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->M0()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->l:Ll/bqr;

    .line 24
    .line 25
    new-instance v0, Ll/m8f;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/m8f;-><init>(F)V

    .line 28
    .line 29
    .line 30
    const/16 p1, 0x16

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setWakeMode(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq p1, v1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ll/wop0;->a(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ll/kfq0;->a(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ll/wop0;->a(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/kfq0;->a(Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->C:Ll/wop0;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/wop0;->a(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->D:Ll/kfq0;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/kfq0;->a(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public stop()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->X0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->A:Lcom/google/android/exoplayer2/b;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getPlayWhenReady()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/b;->p(ZI)I

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/i;->R0(Lcom/google/android/exoplayer2/ExoPlaybackException;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/qyb;

    .line 19
    .line 20
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 25
    .line 26
    iget-wide v2, v2, Ll/fe80;->r:J

    .line 27
    .line 28
    invoke-direct {v0, v1, v2, v3}, Ll/qyb;-><init>(Ljava/util/List;J)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/google/android/exoplayer2/i;->k0:Ll/qyb;

    .line 32
    .line 33
    return-void
.end method

.method public final t0(Ll/fe80;Ll/fe80;ZIZZ)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fe80;",
            "Ll/fe80;",
            "ZIZZ)",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p2, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    iget-object v2, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    new-instance p0, Landroid/util/Pair;

    .line 23
    .line 24
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const/4 v5, 0x3

    .line 39
    if-eq v3, v4, :cond_1

    .line 40
    .line 41
    new-instance p0, Landroid/util/Pair;

    .line 42
    .line 43
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    iget-object v3, p2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 54
    .line 55
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 58
    .line 59
    invoke-virtual {v1, v3, v4}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iget v3, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 64
    .line 65
    iget-object v4, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 66
    .line 67
    invoke-virtual {v1, v3, v4}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v1, v1, Lcom/google/android/exoplayer2/c0$d;->a:Ljava/lang/Object;

    .line 72
    .line 73
    iget-object v3, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 74
    .line 75
    iget-object v3, v3, Ll/fyx;->a:Ljava/lang/Object;

    .line 76
    .line 77
    iget-object v4, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 78
    .line 79
    invoke-virtual {v2, v3, v4}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    iget v3, v3, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 84
    .line 85
    iget-object p0, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 86
    .line 87
    invoke-virtual {v2, v3, p0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-object p0, p0, Lcom/google/android/exoplayer2/c0$d;->a:Ljava/lang/Object;

    .line 92
    .line 93
    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    const/4 v1, 0x2

    .line 98
    const/4 v2, 0x1

    .line 99
    if-nez p0, :cond_5

    .line 100
    .line 101
    if-eqz p3, :cond_2

    .line 102
    .line 103
    if-nez p4, :cond_2

    .line 104
    .line 105
    move v5, v2

    .line 106
    goto :goto_0

    .line 107
    :cond_2
    if-eqz p3, :cond_3

    .line 108
    .line 109
    if-ne p4, v2, :cond_3

    .line 110
    .line 111
    move v5, v1

    .line 112
    goto :goto_0

    .line 113
    :cond_3
    if-eqz p5, :cond_4

    .line 114
    .line 115
    :goto_0
    new-instance p0, Landroid/util/Pair;

    .line 116
    .line 117
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 118
    .line 119
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_4
    invoke-static {}, Ll/wpg0;->a()V

    .line 128
    .line 129
    .line 130
    const/4 p0, 0x0

    .line 131
    return-object p0

    .line 132
    :cond_5
    if-eqz p3, :cond_6

    .line 133
    .line 134
    if-nez p4, :cond_6

    .line 135
    .line 136
    iget-object p0, p2, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 137
    .line 138
    iget-wide v3, p0, Ll/fyx;->d:J

    .line 139
    .line 140
    iget-object p0, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 141
    .line 142
    iget-wide p0, p0, Ll/fyx;->d:J

    .line 143
    .line 144
    cmp-long p0, v3, p0

    .line 145
    .line 146
    if-gez p0, :cond_6

    .line 147
    .line 148
    new-instance p0, Landroid/util/Pair;

    .line 149
    .line 150
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 151
    .line 152
    const/4 p2, 0x0

    .line 153
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_6
    if-eqz p3, :cond_7

    .line 162
    .line 163
    if-ne p4, v2, :cond_7

    .line 164
    .line 165
    if-eqz p6, :cond_7

    .line 166
    .line 167
    new-instance p0, Landroid/util/Pair;

    .line 168
    .line 169
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 170
    .line 171
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    return-object p0

    .line 179
    :cond_7
    new-instance p0, Landroid/util/Pair;

    .line 180
    .line 181
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 182
    .line 183
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    return-object p0
.end method

.method public final u0(Ll/fe80;)J
    .locals 4

    .line 1
    iget-object v0, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fyx;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 10
    .line 11
    iget-object v1, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    iget-object v1, v1, Ll/fyx;->a:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 18
    .line 19
    .line 20
    iget-wide v0, p1, Ll/fe80;->c:J

    .line 21
    .line 22
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    cmp-long v0, v0, v2

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->w0(Ll/fe80;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p0, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 38
    .line 39
    invoke-virtual {v0, p1, p0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$d;->d()J

    .line 44
    .line 45
    .line 46
    move-result-wide p0

    .line 47
    return-wide p0

    .line 48
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/c0$b;->p()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    iget-wide p0, p1, Ll/fe80;->c:J

    .line 55
    .line 56
    invoke-static {p0, p1}, Ll/bmk0;->l1(J)J

    .line 57
    .line 58
    .line 59
    move-result-wide p0

    .line 60
    add-long/2addr v0, p0

    .line 61
    return-wide v0

    .line 62
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/i;->v0(Ll/fe80;)J

    .line 63
    .line 64
    .line 65
    move-result-wide p0

    .line 66
    invoke-static {p0, p1}, Ll/bmk0;->l1(J)J

    .line 67
    .line 68
    .line 69
    move-result-wide p0

    .line 70
    return-wide p0
.end method

.method public final v0(Ll/fe80;)J
    .locals 3

    .line 1
    iget-object v0, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide p0, p0, Lcom/google/android/exoplayer2/i;->y0:J

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/bmk0;->J0(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    return-wide p0

    .line 16
    :cond_0
    iget-boolean v0, p1, Ll/fe80;->o:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/fe80;->m()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-wide v0, p1, Ll/fe80;->r:J

    .line 26
    .line 27
    :goto_0
    iget-object v2, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/fyx;->b()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    return-wide v0

    .line 36
    :cond_2
    iget-object v2, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 37
    .line 38
    iget-object p1, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 39
    .line 40
    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/google/android/exoplayer2/i;->H0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;J)J

    .line 41
    .line 42
    .line 43
    move-result-wide p0

    .line 44
    return-wide p0
.end method

.method public final w0(Ll/fe80;)I
    .locals 1

    .line 1
    iget-object v0, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/google/android/exoplayer2/i;->w0:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget-object v0, p1, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 13
    .line 14
    iget-object p1, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 15
    .line 16
    iget-object p1, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p0}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget p0, p0, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 25
    .line 26
    return p0
.end method

.method public final x0(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;
    .locals 17
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/c0;",
            "Lcom/google/android/exoplayer2/c0;",
            "IJ)",
            "Landroid/util/Pair<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p2

    .line 4
    .line 5
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    const/4 v10, -0x1

    .line 15
    if-nez v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {v7}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v12, v0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 25
    .line 26
    iget-object v13, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 27
    .line 28
    invoke-static/range {p4 .. p5}, Ll/bmk0;->J0(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v15

    .line 32
    move-object/from16 v11, p1

    .line 33
    .line 34
    move/from16 v14, p3

    .line 35
    .line 36
    invoke-virtual/range {v11 .. v16}, Lcom/google/android/exoplayer2/c0;->n(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IJ)Landroid/util/Pair;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Landroid/util/Pair;

    .line 45
    .line 46
    iget-object v5, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 47
    .line 48
    invoke-virtual {v7, v5}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eq v2, v10, :cond_1

    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_1
    iget-object v1, v0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 56
    .line 57
    iget-object v2, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 58
    .line 59
    iget v3, v0, Lcom/google/android/exoplayer2/i;->F:I

    .line 60
    .line 61
    iget-boolean v4, v0, Lcom/google/android/exoplayer2/i;->G:Z

    .line 62
    .line 63
    move-object/from16 v6, p1

    .line 64
    .line 65
    invoke-static/range {v1 .. v7}, Lcom/google/android/exoplayer2/j;->D0(Lcom/google/android/exoplayer2/c0$d;Lcom/google/android/exoplayer2/c0$b;IZLjava/lang/Object;Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/c0;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v2, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 72
    .line 73
    invoke-virtual {v7, v1, v2}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 74
    .line 75
    .line 76
    iget-object v1, v0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 77
    .line 78
    iget v1, v1, Lcom/google/android/exoplayer2/c0$b;->c:I

    .line 79
    .line 80
    iget-object v2, v0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 81
    .line 82
    invoke-virtual {v7, v1, v2}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/c0$d;->d()J

    .line 87
    .line 88
    .line 89
    move-result-wide v2

    .line 90
    invoke-virtual {v0, v7, v1, v2, v3}, Lcom/google/android/exoplayer2/i;->F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    return-object v0

    .line 95
    :cond_2
    invoke-virtual {v0, v7, v10, v8, v9}, Lcom/google/android/exoplayer2/i;->F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    return-object v0

    .line 100
    :cond_3
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_4

    .line 105
    .line 106
    invoke-virtual {v7}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_4

    .line 111
    .line 112
    const/4 v1, 0x1

    .line 113
    goto :goto_1

    .line 114
    :cond_4
    const/4 v1, 0x0

    .line 115
    :goto_1
    if-eqz v1, :cond_5

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_5
    move/from16 v10, p3

    .line 119
    .line 120
    :goto_2
    if-eqz v1, :cond_6

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_6
    move-wide/from16 v8, p4

    .line 124
    .line 125
    :goto_3
    invoke-virtual {v0, v7, v10, v8, v9}, Lcom/google/android/exoplayer2/i;->F0(Lcom/google/android/exoplayer2/c0;IJ)Landroid/util/Pair;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    return-object v0
.end method

.method public final z0(J)Lcom/google/android/exoplayer2/t$e;
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/i;->getCurrentMediaItemIndex()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 6
    .line 7
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0;->u()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 16
    .line 17
    iget-object v1, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    iget-object v1, v1, Ll/fyx;->a:Ljava/lang/Object;

    .line 20
    .line 21
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->n:Lcom/google/android/exoplayer2/c0$b;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v3}, Lcom/google/android/exoplayer2/c0;->l(Ljava/lang/Object;Lcom/google/android/exoplayer2/c0$b;)Lcom/google/android/exoplayer2/c0$b;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 29
    .line 30
    iget-object v0, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/c0;->f(Ljava/lang/Object;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v3, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 37
    .line 38
    iget-object v3, v3, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 39
    .line 40
    iget-object v4, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 41
    .line 42
    invoke-virtual {v3, v2, v4}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v3, v3, Lcom/google/android/exoplayer2/c0$d;->a:Ljava/lang/Object;

    .line 47
    .line 48
    iget-object v4, p0, Lcom/google/android/exoplayer2/c;->a:Lcom/google/android/exoplayer2/c0$d;

    .line 49
    .line 50
    iget-object v4, v4, Lcom/google/android/exoplayer2/c0$d;->c:Lcom/google/android/exoplayer2/n;

    .line 51
    .line 52
    move-object v5, v4

    .line 53
    move-object v4, v1

    .line 54
    move-object v1, v3

    .line 55
    move-object v3, v5

    .line 56
    :goto_0
    move v5, v0

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/4 v1, 0x0

    .line 59
    const/4 v0, -0x1

    .line 60
    move-object v3, v1

    .line 61
    move-object v4, v3

    .line 62
    goto :goto_0

    .line 63
    :goto_1
    invoke-static {p1, p2}, Ll/bmk0;->l1(J)J

    .line 64
    .line 65
    .line 66
    move-result-wide v6

    .line 67
    new-instance v0, Lcom/google/android/exoplayer2/t$e;

    .line 68
    .line 69
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 70
    .line 71
    iget-object p1, p1, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/fyx;->b()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    iget-object p1, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/google/android/exoplayer2/i;->B0(Ll/fe80;)J

    .line 82
    .line 83
    .line 84
    move-result-wide p1

    .line 85
    invoke-static {p1, p2}, Ll/bmk0;->l1(J)J

    .line 86
    .line 87
    .line 88
    move-result-wide p1

    .line 89
    move-wide v8, p1

    .line 90
    goto :goto_2

    .line 91
    :cond_1
    move-wide v8, v6

    .line 92
    :goto_2
    iget-object p0, p0, Lcom/google/android/exoplayer2/i;->v0:Ll/fe80;

    .line 93
    .line 94
    iget-object p0, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 95
    .line 96
    iget v10, p0, Ll/fyx;->b:I

    .line 97
    .line 98
    iget v11, p0, Ll/fyx;->c:I

    .line 99
    .line 100
    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer2/t$e;-><init>(Ljava/lang/Object;ILcom/google/android/exoplayer2/n;Ljava/lang/Object;IJJII)V

    .line 101
    .line 102
    .line 103
    return-object v0
.end method
