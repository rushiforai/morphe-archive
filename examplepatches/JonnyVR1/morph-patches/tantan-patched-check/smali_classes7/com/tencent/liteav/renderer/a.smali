.class public Lcom/tencent/liteav/renderer/a;
.super Lcom/tencent/liteav/renderer/e;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/renderer/a$a;
    }
.end annotation


# instance fields
.field private A:Lcom/tencent/liteav/renderer/c;

.field private B:Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

.field private C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

.field private D:Ljava/lang/Object;

.field private E:Ljava/lang/Object;

.field private F:Lcom/tencent/liteav/renderer/h;

.field private G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

.field private final H:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field a:Lcom/tencent/liteav/renderer/g;

.field b:Lcom/tencent/liteav/renderer/a$a;

.field c:Lcom/tencent/liteav/renderer/a$a;

.field private final q:I

.field private final r:I

.field private final s:I

.field private final t:I

.field private u:Ljava/lang/Object;

.field private v:Lcom/tencent/liteav/renderer/b;

.field private w:Landroid/graphics/SurfaceTexture;

.field private x:Lcom/tencent/liteav/renderer/c;

.field private y:Z

.field private z:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/e;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/renderer/a;->q:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/renderer/a;->r:I

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/liteav/renderer/a;->s:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/renderer/a;->t:I

    .line 12
    .line 13
    new-instance v0, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->D:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance v0, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->E:Ljava/lang/Object;

    .line 29
    .line 30
    new-instance v0, Ljava/util/LinkedList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->H:Ljava/util/Queue;

    .line 36
    .line 37
    const/16 v0, 0x10

    .line 38
    .line 39
    new-array v0, v0, [F

    .line 40
    .line 41
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->z:[F

    .line 42
    .line 43
    return-void
.end method

.method private a(Ljava/util/Queue;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)Z"
        }
    .end annotation

    .line 148
    monitor-enter p1

    .line 149
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    monitor-exit p1

    return v0

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 150
    :cond_0
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    .line 151
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_1

    return v0

    .line 152
    :cond_1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0

    .line 153
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private p()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/liteav/renderer/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lcom/tencent/liteav/renderer/c;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 8
    .line 9
    new-instance v0, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 15
    .line 16
    new-instance v0, Lcom/tencent/liteav/renderer/c;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-direct {v0, v1}, Lcom/tencent/liteav/renderer/c;-><init>(Z)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->A:Lcom/tencent/liteav/renderer/c;

    .line 23
    .line 24
    return-void
.end method

.method private q()Z
    .locals 12

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/a;->y:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p0, Lcom/tencent/liteav/renderer/a;->y:Z

    .line 9
    .line 10
    move-object v3, v2

    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto/16 :goto_5

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->B:Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    .line 16
    .line 17
    if-eqz v0, :cond_e

    .line 18
    .line 19
    iput-object v2, p0, Lcom/tencent/liteav/renderer/a;->B:Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    .line 20
    .line 21
    move-object v3, v0

    .line 22
    move v0, v1

    .line 23
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->g()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->h()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-static {v1, v1, v4, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 33
    .line 34
    .line 35
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    if-ne v4, v5, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/a;->b()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move-object v4, v2

    .line 46
    :goto_1
    iget-object v6, p0, Lcom/tencent/liteav/renderer/a;->c:Lcom/tencent/liteav/renderer/a$a;

    .line 47
    .line 48
    const v7, 0x8d40

    .line 49
    .line 50
    .line 51
    if-eqz v0, :cond_7

    .line 52
    .line 53
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->z:[F

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->a:Lcom/tencent/liteav/renderer/g;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 70
    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    if-eqz v2, :cond_4

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/tencent/liteav/renderer/c;->a()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->z:[F

    .line 80
    .line 81
    invoke-interface {v0, v1, v2}, Lcom/tencent/liteav/renderer/g;->a(I[F)I

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    if-eqz v2, :cond_4

    .line 86
    .line 87
    invoke-static {v7, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/c;->a(Landroid/graphics/SurfaceTexture;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_2
    if-eqz v6, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/c;->a()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 106
    .line 107
    if-nez v1, :cond_5

    .line 108
    .line 109
    new-instance v1, Lcom/tencent/liteav/renderer/h;

    .line 110
    .line 111
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-direct {v1, v2}, Lcom/tencent/liteav/renderer/h;-><init>(Ljava/lang/Boolean;)V

    .line 114
    .line 115
    .line 116
    iput-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/tencent/liteav/renderer/h;->b()V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 122
    .line 123
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/renderer/h;->a(Z)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 127
    .line 128
    const/16 v2, 0xb4

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/renderer/h;->b(I)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 134
    .line 135
    sget v2, Lcom/tencent/liteav/renderer/h;->a:I

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/renderer/h;->a(I)V

    .line 138
    .line 139
    .line 140
    :cond_5
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 141
    .line 142
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->z:[F

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/renderer/h;->a([F)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 148
    .line 149
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 150
    .line 151
    iget v3, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 152
    .line 153
    invoke-virtual {v1, v2, v3}, Lcom/tencent/liteav/renderer/h;->b(II)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 157
    .line 158
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 159
    .line 160
    iget v3, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 161
    .line 162
    invoke-virtual {v1, v2, v3}, Lcom/tencent/liteav/renderer/h;->a(II)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 166
    .line 167
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/renderer/h;->d(I)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->i()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->j()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iget v3, p0, Lcom/tencent/liteav/renderer/e;->k:I

    .line 180
    .line 181
    invoke-interface {v6, v0, v1, v2, v3}, Lcom/tencent/liteav/renderer/a$a;->onTextureProcess(IIII)V

    .line 182
    .line 183
    .line 184
    :cond_6
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 185
    .line 186
    if-ne v0, v5, :cond_d

    .line 187
    .line 188
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 189
    .line 190
    if-eqz v0, :cond_d

    .line 191
    .line 192
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/c;->a()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->z:[F

    .line 197
    .line 198
    invoke-virtual {p0, v4, v0, v1, v5}, Lcom/tencent/liteav/renderer/e;->a(Ljava/lang/Object;I[FZ)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_4

    .line 202
    .line 203
    :cond_7
    if-eqz v3, :cond_d

    .line 204
    .line 205
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 206
    .line 207
    if-eqz v0, :cond_d

    .line 208
    .line 209
    iget-object v8, p0, Lcom/tencent/liteav/renderer/a;->b:Lcom/tencent/liteav/renderer/a$a;

    .line 210
    .line 211
    const/4 v9, -0x1

    .line 212
    if-eqz v8, :cond_8

    .line 213
    .line 214
    iget v7, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 215
    .line 216
    iget v8, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 217
    .line 218
    invoke-virtual {v0, v7, v8}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setHasFrameBuffer(II)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 222
    .line 223
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->drawToTexture(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    iget-object v7, p0, Lcom/tencent/liteav/renderer/a;->b:Lcom/tencent/liteav/renderer/a$a;

    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->i()I

    .line 230
    .line 231
    .line 232
    move-result v8

    .line 233
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->j()I

    .line 234
    .line 235
    .line 236
    move-result v10

    .line 237
    iget v11, p0, Lcom/tencent/liteav/renderer/e;->k:I

    .line 238
    .line 239
    invoke-interface {v7, v0, v8, v10, v11}, Lcom/tencent/liteav/renderer/a$a;->onTextureProcess(IIII)V

    .line 240
    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_8
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 244
    .line 245
    if-nez v0, :cond_9

    .line 246
    .line 247
    invoke-static {v7, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 251
    .line 252
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->drawFrame(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;)V

    .line 253
    .line 254
    .line 255
    :cond_9
    move v0, v9

    .line 256
    :goto_3
    iget v7, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 257
    .line 258
    if-ne v7, v5, :cond_b

    .line 259
    .line 260
    if-ne v0, v9, :cond_a

    .line 261
    .line 262
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 263
    .line 264
    iget v7, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 265
    .line 266
    iget v8, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 267
    .line 268
    invoke-virtual {v0, v7, v8}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setHasFrameBuffer(II)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 272
    .line 273
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->drawToTexture(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;)I

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    :cond_a
    invoke-virtual {p0, v4, v0, v2, v1}, Lcom/tencent/liteav/renderer/e;->a(Ljava/lang/Object;I[FZ)V

    .line 278
    .line 279
    .line 280
    :cond_b
    if-eqz v6, :cond_d

    .line 281
    .line 282
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 283
    .line 284
    if-nez v0, :cond_c

    .line 285
    .line 286
    new-instance v0, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 287
    .line 288
    invoke-direct {v0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;-><init>()V

    .line 289
    .line 290
    .line 291
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 292
    .line 293
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->createTexture()V

    .line 294
    .line 295
    .line 296
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 297
    .line 298
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->flipVertical(Z)V

    .line 299
    .line 300
    .line 301
    :cond_c
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 302
    .line 303
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 304
    .line 305
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 306
    .line 307
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setHasFrameBuffer(II)V

    .line 308
    .line 309
    .line 310
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 311
    .line 312
    invoke-virtual {v0, v3}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->drawToTexture(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;)I

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->i()I

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->j()I

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->k:I

    .line 325
    .line 326
    invoke-interface {v6, v0, v1, v2, p0}, Lcom/tencent/liteav/renderer/a$a;->onTextureProcess(IIII)V

    .line 327
    .line 328
    .line 329
    :cond_d
    :goto_4
    return v5

    .line 330
    :cond_e
    :try_start_1
    monitor-exit p0

    .line 331
    return v1

    .line 332
    :goto_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 333
    throw v0
.end method


# virtual methods
.method public a()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 138
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    return-object p0
.end method

.method public a(II)V
    .locals 1

    .line 142
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/renderer/e;->a(II)V

    .line 143
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    if-eqz v0, :cond_0

    .line 144
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setVideoSize(II)V

    .line 145
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    if-eqz p0, :cond_1

    .line 146
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/renderer/c;->a(II)V

    :cond_1
    return-void
.end method

.method public a(IIIZI)V
    .locals 3

    .line 130
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->g()I

    move-result v0

    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->h()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 131
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->A:Lcom/tencent/liteav/renderer/c;

    if-eqz v0, :cond_0

    .line 132
    invoke-virtual {v0, p1, p4, p5}, Lcom/tencent/liteav/renderer/c;->a(IZI)V

    .line 133
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/tencent/liteav/renderer/e;->a(IIIZI)V

    .line 134
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    monitor-enter p1

    .line 135
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    if-eqz p0, :cond_1

    .line 136
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/b;->c()V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    .line 137
    :cond_1
    :goto_0
    monitor-exit p1

    return-void

    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 139
    invoke-super {p0, p1}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/SurfaceTexture;)V

    .line 140
    const-string p1, "TXCVideoRender"

    const-string v0, "play:vrender: create render thread when onSurfaceCreate"

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 141
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/a;->c(Ljava/lang/Object;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;III)V
    .locals 1

    .line 119
    monitor-enter p0

    .line 120
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->B:Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->release()V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_3

    .line 122
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->B:Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    .line 123
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/renderer/e;->a(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;III)V

    .line 125
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    monitor-enter p1

    .line 126
    :try_start_1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    if-eqz p0, :cond_1

    .line 127
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/b;->c()V

    goto :goto_1

    :catchall_1
    move-exception p0

    goto :goto_2

    .line 128
    :cond_1
    :goto_1
    monitor-exit p1

    return-void

    :goto_2
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p0

    .line 129
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public a(Lcom/tencent/liteav/renderer/a$a;)V
    .locals 1

    .line 116
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->b:Lcom/tencent/liteav/renderer/a$a;

    if-eqz p1, :cond_0

    .line 117
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    if-eqz p1, :cond_0

    .line 118
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    iget p0, p0, Lcom/tencent/liteav/renderer/e;->i:I

    invoke-virtual {p1, v0, p0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setHasFrameBuffer(II)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/renderer/g;)V
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->a:Lcom/tencent/liteav/renderer/g;

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 3

    .line 1
    const-string v0, "play:vrender: TXCGLRender initTextureRender "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->E:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->D:Ljava/lang/Object;

    .line 7
    .line 8
    const-string p1, "TXCVideoRender"

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/a;->p()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->f:I

    .line 33
    .line 34
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->g:I

    .line 35
    .line 36
    invoke-virtual {p1, v0, v2}, Lcom/tencent/liteav/renderer/d;->a(II)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    .line 40
    .line 41
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 42
    .line 43
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 44
    .line 45
    invoke-virtual {p1, v0, v2}, Lcom/tencent/liteav/renderer/d;->b(II)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/tencent/liteav/renderer/c;->b()V

    .line 56
    .line 57
    .line 58
    new-instance p1, Landroid/graphics/SurfaceTexture;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/c;->a()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-direct {p1, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->createTexture()V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->b:Lcom/tencent/liteav/renderer/a$a;

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 86
    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 90
    .line 91
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 92
    .line 93
    invoke-virtual {p1, v0, v2}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setHasFrameBuffer(II)V

    .line 94
    .line 95
    .line 96
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->A:Lcom/tencent/liteav/renderer/c;

    .line 97
    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/tencent/liteav/renderer/c;->b()V

    .line 101
    .line 102
    .line 103
    :cond_4
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->o:Lcom/tencent/liteav/renderer/f;

    .line 104
    .line 105
    if-eqz p1, :cond_5

    .line 106
    .line 107
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 108
    .line 109
    invoke-interface {p1, p0}, Lcom/tencent/liteav/renderer/f;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;)V

    .line 110
    .line 111
    .line 112
    :cond_5
    monitor-exit v1

    .line 113
    return-void

    .line 114
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    throw p0
.end method

.method public b()Ljava/lang/Object;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    monitor-enter v0

    .line 123
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/b;->a()Ljava/lang/Object;

    move-result-object p0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    :goto_0
    monitor-exit v0

    return-object p0

    .line 124
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public b(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 125
    invoke-super {p0, p1}, Lcom/tencent/liteav/renderer/e;->b(Landroid/graphics/SurfaceTexture;)V

    .line 126
    const-string p1, "TXCVideoRender"

    const-string v0, "play:vrender: quit render thread when onSurfaceRelease"

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/a;->e()V

    return-void
.end method

.method public b(Lcom/tencent/liteav/renderer/a$a;)V
    .locals 1

    .line 128
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->c:Lcom/tencent/liteav/renderer/a$a;

    if-eqz p1, :cond_0

    .line 129
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    if-eqz p1, :cond_0

    .line 130
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    iget p0, p0, Lcom/tencent/liteav/renderer/e;->i:I

    invoke-virtual {p1, v0, p0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->setHasFrameBuffer(II)V

    :cond_0
    return-void
.end method

.method public b(Ljava/lang/Object;)V
    .locals 4

    .line 1
    const-string v0, "play:vrender: TXCGLRender destroyTextureRender "

    .line 2
    .line 3
    const-string v1, "play:vrender: TXCGLRender destroyTextureRender ignore when not the same gl thread "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->E:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, p0, Lcom/tencent/liteav/renderer/a;->D:Ljava/lang/Object;

    .line 9
    .line 10
    if-eq v3, p1, :cond_0

    .line 11
    .line 12
    const-string p1, "TXCVideoRender"

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    monitor-exit v2

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->D:Ljava/lang/Object;

    .line 35
    .line 36
    const-string v1, "TXCVideoRender"

    .line 37
    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    :try_start_1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->o:Lcom/tencent/liteav/renderer/f;

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 58
    .line 59
    invoke-interface {v0, v1}, Lcom/tencent/liteav/renderer/f;->onSurfaceTextureDestroy(Landroid/graphics/SurfaceTexture;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    :try_start_2
    const-string v1, "TXCVideoRender"

    .line 65
    .line 66
    const-string v3, "callback failed."

    .line 67
    .line 68
    invoke-static {v1, v3, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/c;->c()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->x:Lcom/tencent/liteav/renderer/c;

    .line 79
    .line 80
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->onSurfaceDestroy()V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->C:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 88
    .line 89
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->A:Lcom/tencent/liteav/renderer/c;

    .line 90
    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/c;->c()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->A:Lcom/tencent/liteav/renderer/c;

    .line 97
    .line 98
    :cond_4
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->w:Landroid/graphics/SurfaceTexture;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 101
    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/h;->c()V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->F:Lcom/tencent/liteav/renderer/h;

    .line 108
    .line 109
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 110
    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/TXCYuvTextureRender;->onSurfaceDestroy()V

    .line 114
    .line 115
    .line 116
    iput-object p1, p0, Lcom/tencent/liteav/renderer/a;->G:Lcom/tencent/liteav/renderer/TXCYuvTextureRender;

    .line 117
    .line 118
    :cond_6
    monitor-exit v2

    .line 119
    return-void

    .line 120
    :goto_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 121
    throw p0
.end method

.method public c(Ljava/lang/Object;)V
    .locals 4

    .line 1
    const-string v0, "play:vrender: start render thread when running "

    .line 2
    .line 3
    const-string v1, "play:vrender: start render thread id "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/tencent/liteav/renderer/b;

    .line 13
    .line 14
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, v3}, Lcom/tencent/liteav/renderer/b;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/renderer/b;->a(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/b;->c()V

    .line 35
    .line 36
    .line 37
    const-string v0, "TXCVideoRender"

    .line 38
    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, ", glContext "

    .line 52
    .line 53
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, ", "

    .line 60
    .line 61
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    const-string p1, "TXCVideoRender"

    .line 78
    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v0, ", "

    .line 92
    .line 93
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :goto_0
    monitor-exit v2

    .line 107
    return-void

    .line 108
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    throw p0
.end method

.method public c()Z
    .locals 1

    .line 110
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/a;->H:Ljava/util/Queue;

    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/a;->a(Ljava/util/Queue;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/a;->q()Z

    move-result p0

    return p0
.end method

.method public d()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public e()V
    .locals 4

    .line 1
    const-string v0, "play:vrender: quit render thread id"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/tencent/liteav/renderer/b;->b()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/tencent/liteav/renderer/b;->c()V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-object v2, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 20
    .line 21
    const-string v2, "TXCVideoRender"

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, ", "

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

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
    :cond_0
    :goto_0
    monitor-exit v1

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/module/a;->finalize()V

    .line 2
    .line 3
    .line 4
    const-string v0, "play:vrender: quit render thread when finalize"

    .line 5
    .line 6
    const-string v1, "TXCVideoRender"

    .line 7
    .line 8
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/a;->e()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string v0, "quit render thread failed."

    .line 17
    .line 18
    invoke-static {v1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    const/4 p1, 0x1

    .line 3
    :try_start_0
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/a;->y:Z

    .line 4
    .line 5
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    iget-object p1, p0, Lcom/tencent/liteav/renderer/a;->u:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter p1

    .line 9
    :try_start_1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/a;->v:Lcom/tencent/liteav/renderer/b;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/b;->c()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p1

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p0

    .line 23
    :catchall_1
    move-exception p1

    .line 24
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 25
    throw p1
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method
