.class public Ll/q23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/cy3;

.field public final c:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/mpy;Ll/cy3;Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Ll/cy3;",
            "Ll/wk90<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q23;->a:Ll/mpy;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q23;->b:Ll/cy3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/q23;->c:Ll/wk90;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic c(Ll/q23;)Ll/mpy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q23;->a:Ll/mpy;

    return-object p0
.end method

.method public static f(Ll/nyk;Ll/yk90;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/nyk;->getExtras()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ll/lyk;->d(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "BitmapMemoryCacheProducer#produceResults"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, p2, v1}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {p2}, Ll/yk90;->k()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, p0, Ll/q23;->b:Ll/cy3;

    .line 32
    .line 33
    invoke-interface {v3, v1, v2}, Ll/cy3;->c(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/4 v3, 0x1

    .line 42
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Ll/q23;->a:Ll/mpy;

    .line 50
    .line 51
    invoke-interface {v2, v1}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 52
    .line 53
    .line 54
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move-object v2, v4

    .line 57
    :goto_0
    const-string v5, "memory_bitmap"

    .line 58
    .line 59
    const-string v6, "cached_value_found"

    .line 60
    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    :try_start_1
    invoke-virtual {v2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    check-cast v7, Ll/nyk;

    .line 68
    .line 69
    invoke-static {v7, p2}, Ll/q23;->f(Ll/nyk;Ll/yk90;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    check-cast v7, Ll/db5;

    .line 77
    .line 78
    invoke-interface {v7}, Ll/db5;->Y()Ll/qvb0;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-interface {v7}, Ll/qvb0;->a()Z

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    if-eqz v7, :cond_3

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v9

    .line 96
    invoke-interface {v0, p2, v9}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_2

    .line 101
    .line 102
    const-string v9, "true"

    .line 103
    .line 104
    invoke-static {v6, v9}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 105
    .line 106
    .line 107
    move-result-object v9

    .line 108
    goto :goto_1

    .line 109
    :cond_2
    move-object v9, v4

    .line 110
    :goto_1
    invoke-interface {v0, p2, v8, v9}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    invoke-interface {v0, p2, v8, v3}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ll/q23;->d()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    invoke-interface {p2, v5, v8}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    const/high16 v8, 0x3f800000    # 1.0f

    .line 128
    .line 129
    invoke-interface {p1, v8}, Ll/z06;->c(F)V

    .line 130
    .line 131
    .line 132
    :cond_3
    invoke-static {v7}, Ll/ji2;->k(Z)I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    invoke-interface {p1, v2, v8}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ll/fb5;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    .line 141
    .line 142
    if-eqz v7, :cond_4

    .line 143
    .line 144
    invoke-static {}, Ll/i9j;->d()Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-eqz p0, :cond_a

    .line 149
    .line 150
    invoke-static {}, Ll/i9j;->b()V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_4
    :try_start_2
    invoke-interface {p2}, Ll/yk90;->I()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->getValue()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    sget-object v7, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->BITMAP_MEMORY_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 163
    .line 164
    invoke-virtual {v7}, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->getValue()I

    .line 165
    .line 166
    .line 167
    move-result v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 168
    const-string v8, "false"

    .line 169
    .line 170
    if-lt v2, v7, :cond_6

    .line 171
    .line 172
    :try_start_3
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-interface {v0, p2, v2}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    if-eqz v2, :cond_5

    .line 185
    .line 186
    invoke-static {v6, v8}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    goto :goto_2

    .line 191
    :cond_5
    move-object v2, v4

    .line 192
    :goto_2
    invoke-interface {v0, p2, v1, v2}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    const/4 v2, 0x0

    .line 200
    invoke-interface {v0, p2, v1, v2}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0}, Ll/q23;->d()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-interface {p2, v5, p0}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-interface {p1, v4, v3}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 211
    .line 212
    .line 213
    invoke-static {}, Ll/i9j;->d()Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-eqz p0, :cond_a

    .line 218
    .line 219
    invoke-static {}, Ll/i9j;->b()V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_6
    :try_start_4
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    const/4 v3, 0x2

    .line 228
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    invoke-virtual {p0, p1, v1, v2}, Ll/q23;->g(Ll/z06;Ll/by3;Z)Ll/z06;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {p0}, Ll/q23;->e()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    invoke-interface {v0, p2, v2}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-eqz v2, :cond_7

    .line 249
    .line 250
    invoke-static {v6, v8}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 251
    .line 252
    .line 253
    move-result-object v4

    .line 254
    :cond_7
    invoke-interface {v0, p2, v1, v4}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 255
    .line 256
    .line 257
    invoke-static {}, Ll/i9j;->d()Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_8

    .line 262
    .line 263
    const-string v0, "mInputProducer.produceResult"

    .line 264
    .line 265
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    :cond_8
    iget-object p0, p0, Ll/q23;->c:Ll/wk90;

    .line 269
    .line 270
    invoke-interface {p0, p1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 271
    .line 272
    .line 273
    invoke-static {}, Ll/i9j;->d()Z

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    if-eqz p0, :cond_9

    .line 278
    .line 279
    invoke-static {}, Ll/i9j;->b()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 280
    .line 281
    .line 282
    :cond_9
    invoke-static {}, Ll/i9j;->d()Z

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    if-eqz p0, :cond_a

    .line 287
    .line 288
    invoke-static {}, Ll/i9j;->b()V

    .line 289
    .line 290
    .line 291
    :cond_a
    return-void

    .line 292
    :catchall_0
    move-exception p0

    .line 293
    invoke-static {}, Ll/i9j;->d()Z

    .line 294
    .line 295
    .line 296
    move-result p1

    .line 297
    if-eqz p1, :cond_b

    .line 298
    .line 299
    invoke-static {}, Ll/i9j;->b()V

    .line 300
    .line 301
    .line 302
    :cond_b
    throw p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "pipe_bg"

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "BitmapMemoryCacheProducer"

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/z06;Ll/by3;Z)Ll/z06;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
            "Ll/by3;",
            "Z)",
            "Ll/z06<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q23$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/q23$a;-><init>(Ll/q23;Ll/z06;Ll/by3;Z)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
