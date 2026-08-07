.class Lcom/bumptech/glide/load/engine/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/e;
.implements Ll/t5c$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/e;",
        "Ll/t5c$a<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lcom/bumptech/glide/load/engine/e$a;

.field private final b:Lcom/bumptech/glide/load/engine/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/f<",
            "*>;"
        }
    .end annotation
.end field

.field private c:I

.field private d:I

.field private e:Ll/kzq;

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/re00<",
            "Ljava/io/File;",
            "*>;>;"
        }
    .end annotation
.end field

.field private g:I

.field private volatile h:Ll/re00$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/re00$a<",
            "*>;"
        }
    .end annotation
.end field

.field private i:Ljava/io/File;

.field private j:Lcom/bumptech/glide/load/engine/r;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/f;Lcom/bumptech/glide/load/engine/e$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/f<",
            "*>;",
            "Lcom/bumptech/glide/load/engine/e$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/bumptech/glide/load/engine/q;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/q;->a:Lcom/bumptech/glide/load/engine/e$a;

    .line 10
    .line 11
    return-void
.end method

.method private d()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->g:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/q;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ge v0, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method


# virtual methods
.method public a()Z
    .locals 13

    .line 1
    const-string v0, "Failed to find any load path from "

    .line 2
    .line 3
    const-string v1, "ResourceCacheGenerator.startNext"

    .line 4
    .line 5
    invoke-static {v1}, Ll/d4k;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/f;->c()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/d4k;->e()V

    .line 22
    .line 23
    .line 24
    return v3

    .line 25
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/f;->m()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_2

    .line 36
    .line 37
    const-class v1, Ljava/io/File;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/f;->r()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/d4k;->e()V

    .line 52
    .line 53
    .line 54
    return v3

    .line 55
    :cond_1
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 56
    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->i()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v0, " to "

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/f;->r()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-direct {v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw v1

    .line 93
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->f:Ljava/util/List;

    .line 94
    .line 95
    const/4 v4, 0x1

    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/q;->d()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_3

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_3
    const/4 v0, 0x0

    .line 106
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 107
    .line 108
    :cond_4
    :goto_1
    if-nez v3, :cond_5

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/q;->d()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_5

    .line 115
    .line 116
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->f:Ljava/util/List;

    .line 117
    .line 118
    iget v1, p0, Lcom/bumptech/glide/load/engine/q;->g:I

    .line 119
    .line 120
    add-int/lit8 v2, v1, 0x1

    .line 121
    .line 122
    iput v2, p0, Lcom/bumptech/glide/load/engine/q;->g:I

    .line 123
    .line 124
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ll/re00;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->i:Ljava/io/File;

    .line 131
    .line 132
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 133
    .line 134
    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/f;->t()I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 139
    .line 140
    invoke-virtual {v5}, Lcom/bumptech/glide/load/engine/f;->f()I

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    iget-object v6, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 145
    .line 146
    invoke-virtual {v6}, Lcom/bumptech/glide/load/engine/f;->k()Ll/u560;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-interface {v0, v1, v2, v5, v6}, Ll/re00;->a(Ljava/lang/Object;IILl/u560;)Ll/re00$a;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 155
    .line 156
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 157
    .line 158
    if-eqz v0, :cond_4

    .line 159
    .line 160
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 161
    .line 162
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 163
    .line 164
    iget-object v1, v1, Ll/re00$a;->c:Ll/t5c;

    .line 165
    .line 166
    invoke-interface {v1}, Ll/t5c;->a()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/f;->u(Ljava/lang/Class;)Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eqz v0, :cond_4

    .line 175
    .line 176
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 177
    .line 178
    iget-object v0, v0, Ll/re00$a;->c:Ll/t5c;

    .line 179
    .line 180
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/f;->l()Lcom/bumptech/glide/Priority;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-interface {v0, v1, p0}, Ll/t5c;->d(Lcom/bumptech/glide/Priority;Ll/t5c$a;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 187
    .line 188
    .line 189
    move v3, v4

    .line 190
    goto :goto_1

    .line 191
    :cond_5
    invoke-static {}, Ll/d4k;->e()V

    .line 192
    .line 193
    .line 194
    return v3

    .line 195
    :cond_6
    :goto_2
    :try_start_3
    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->d:I

    .line 196
    .line 197
    add-int/2addr v0, v4

    .line 198
    iput v0, p0, Lcom/bumptech/glide/load/engine/q;->d:I

    .line 199
    .line 200
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    if-lt v0, v5, :cond_8

    .line 205
    .line 206
    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->c:I

    .line 207
    .line 208
    add-int/2addr v0, v4

    .line 209
    iput v0, p0, Lcom/bumptech/glide/load/engine/q;->c:I

    .line 210
    .line 211
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 212
    .line 213
    .line 214
    move-result v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 215
    if-lt v0, v4, :cond_7

    .line 216
    .line 217
    invoke-static {}, Ll/d4k;->e()V

    .line 218
    .line 219
    .line 220
    return v3

    .line 221
    :cond_7
    :try_start_4
    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->d:I

    .line 222
    .line 223
    :cond_8
    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->c:I

    .line 224
    .line 225
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    move-object v6, v0

    .line 230
    check-cast v6, Ll/kzq;

    .line 231
    .line 232
    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->d:I

    .line 233
    .line 234
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    move-object v11, v0

    .line 239
    check-cast v11, Ljava/lang/Class;

    .line 240
    .line 241
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 242
    .line 243
    invoke-virtual {v0, v11}, Lcom/bumptech/glide/load/engine/f;->s(Ljava/lang/Class;)Ll/tgj0;

    .line 244
    .line 245
    .line 246
    move-result-object v10

    .line 247
    new-instance v4, Lcom/bumptech/glide/load/engine/r;

    .line 248
    .line 249
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 250
    .line 251
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->b()Ll/o01;

    .line 252
    .line 253
    .line 254
    move-result-object v5

    .line 255
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 256
    .line 257
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->p()Ll/kzq;

    .line 258
    .line 259
    .line 260
    move-result-object v7

    .line 261
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 262
    .line 263
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->t()I

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->f()I

    .line 270
    .line 271
    .line 272
    move-result v9

    .line 273
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 274
    .line 275
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->k()Ll/u560;

    .line 276
    .line 277
    .line 278
    move-result-object v12

    .line 279
    invoke-direct/range {v4 .. v12}, Lcom/bumptech/glide/load/engine/r;-><init>(Ll/o01;Ll/kzq;Ll/kzq;IILl/tgj0;Ljava/lang/Class;Ll/u560;)V

    .line 280
    .line 281
    .line 282
    iput-object v4, p0, Lcom/bumptech/glide/load/engine/q;->j:Lcom/bumptech/glide/load/engine/r;

    .line 283
    .line 284
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 285
    .line 286
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->d()Ll/z3e;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->j:Lcom/bumptech/glide/load/engine/r;

    .line 291
    .line 292
    invoke-interface {v0, v4}, Ll/z3e;->a(Ll/kzq;)Ljava/io/File;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->i:Ljava/io/File;

    .line 297
    .line 298
    if-eqz v0, :cond_2

    .line 299
    .line 300
    iput-object v6, p0, Lcom/bumptech/glide/load/engine/q;->e:Ll/kzq;

    .line 301
    .line 302
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->b:Lcom/bumptech/glide/load/engine/f;

    .line 303
    .line 304
    invoke-virtual {v4, v0}, Lcom/bumptech/glide/load/engine/f;->j(Ljava/io/File;)Ljava/util/List;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->f:Ljava/util/List;

    .line 309
    .line 310
    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->g:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :catchall_0
    move-exception v0

    .line 315
    move-object p0, v0

    .line 316
    invoke-static {}, Ll/d4k;->e()V

    .line 317
    .line 318
    .line 319
    throw p0
.end method

.method public b(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->a:Lcom/bumptech/glide/load/engine/e$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->e:Ll/kzq;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 6
    .line 7
    iget-object v3, v2, Ll/re00$a;->c:Ll/t5c;

    .line 8
    .line 9
    sget-object v4, Lcom/bumptech/glide/load/DataSource;->RESOURCE_DISK_CACHE:Lcom/bumptech/glide/load/DataSource;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->j:Lcom/bumptech/glide/load/engine/r;

    .line 12
    .line 13
    move-object v2, p1

    .line 14
    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/e$a;->h(Ll/kzq;Ljava/lang/Object;Ll/t5c;Lcom/bumptech/glide/load/DataSource;Ll/kzq;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(Ljava/lang/Exception;)V
    .locals 3
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->a:Lcom/bumptech/glide/load/engine/e$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->j:Lcom/bumptech/glide/load/engine/r;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 6
    .line 7
    iget-object p0, p0, Ll/re00$a;->c:Ll/t5c;

    .line 8
    .line 9
    sget-object v2, Lcom/bumptech/glide/load/DataSource;->RESOURCE_DISK_CACHE:Lcom/bumptech/glide/load/DataSource;

    .line 10
    .line 11
    invoke-interface {v0, v1, p1, p0, v2}, Lcom/bumptech/glide/load/engine/e$a;->f(Ll/kzq;Ljava/lang/Exception;Ll/t5c;Lcom/bumptech/glide/load/DataSource;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/q;->h:Ll/re00$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/re00$a;->c:Ll/t5c;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/t5c;->cancel()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
