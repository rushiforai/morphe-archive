.class public Ll/q0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q0f$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/cy3;

.field public final c:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
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
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;",
            "Ll/cy3;",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q0f;->a:Ll/mpy;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q0f;->b:Ll/cy3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/q0f;->c:Ll/wk90;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "EncodedMemoryCacheProducer"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "EncodedMemoryCacheProducer#produceResults"

    .line 10
    .line 11
    invoke-static {v1}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1, p2, v0}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Ll/q0f;->b:Ll/cy3;

    .line 26
    .line 27
    invoke-interface {p2}, Ll/yk90;->k()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-interface {v3, v2, v4}, Ll/cy3;->b(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const/4 v3, 0x4

    .line 40
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, 0x0

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    iget-object v2, p0, Ll/q0f;->a:Ll/mpy;

    .line 48
    .line 49
    invoke-interface {v2, v8}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 50
    .line 51
    .line 52
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move-object v2, v3

    .line 55
    :goto_0
    const-string v4, "memory_encoded"

    .line 56
    .line 57
    const/4 v5, 0x1

    .line 58
    const-string v11, "cached_value_found"

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    :try_start_1
    new-instance p0, Ll/n0f;

    .line 63
    .line 64
    invoke-direct {p0, v2}, Ll/n0f;-><init>(Ll/fb5;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 65
    .line 66
    .line 67
    :try_start_2
    invoke-interface {v1, p2, v0}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-eqz v6, :cond_2

    .line 72
    .line 73
    const-string v3, "true"

    .line 74
    .line 75
    invoke-static {v11, v3}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    goto :goto_1

    .line 80
    :catchall_0
    move-exception v0

    .line 81
    move-object p1, v0

    .line 82
    goto :goto_2

    .line 83
    :cond_2
    :goto_1
    invoke-interface {v1, p2, v0, v3}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 84
    .line 85
    .line 86
    invoke-interface {v1, p2, v0, v5}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p2, v4}, Ll/yk90;->B(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const/high16 p2, 0x3f800000    # 1.0f

    .line 93
    .line 94
    invoke-interface {p1, p2}, Ll/z06;->c(F)V

    .line 95
    .line 96
    .line 97
    invoke-interface {p1, p0, v5}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    .line 99
    .line 100
    :try_start_3
    invoke-static {p0}, Ll/n0f;->n(Ll/n0f;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 101
    .line 102
    .line 103
    :try_start_4
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/i9j;->d()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-eqz p0, :cond_7

    .line 111
    .line 112
    invoke-static {}, Ll/i9j;->b()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :catchall_1
    move-exception v0

    .line 117
    move-object p0, v0

    .line 118
    goto/16 :goto_4

    .line 119
    .line 120
    :goto_2
    :try_start_5
    invoke-static {p0}, Ll/n0f;->n(Ll/n0f;)V

    .line 121
    .line 122
    .line 123
    throw p1

    .line 124
    :cond_3
    invoke-interface {p2}, Ll/yk90;->I()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {v6}, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->getValue()I

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    sget-object v7, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->ENCODED_MEMORY_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 133
    .line 134
    invoke-virtual {v7}, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->getValue()I

    .line 135
    .line 136
    .line 137
    move-result v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 138
    const-string v12, "false"

    .line 139
    .line 140
    if-lt v6, v7, :cond_5

    .line 141
    .line 142
    :try_start_6
    invoke-interface {v1, p2, v0}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-eqz p0, :cond_4

    .line 147
    .line 148
    invoke-static {v11, v12}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    goto :goto_3

    .line 153
    :cond_4
    move-object p0, v3

    .line 154
    :goto_3
    invoke-interface {v1, p2, v0, p0}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 155
    .line 156
    .line 157
    const/4 p0, 0x0

    .line 158
    invoke-interface {v1, p2, v0, p0}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 159
    .line 160
    .line 161
    const-string p0, "nil-result"

    .line 162
    .line 163
    invoke-interface {p2, v4, p0}, Ll/yk90;->u(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-interface {p1, v3, v5}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 167
    .line 168
    .line 169
    :try_start_7
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 170
    .line 171
    .line 172
    invoke-static {}, Ll/i9j;->d()Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_7

    .line 177
    .line 178
    invoke-static {}, Ll/i9j;->b()V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_5
    :try_start_8
    new-instance v5, Ll/q0f$a;

    .line 183
    .line 184
    iget-object v7, p0, Ll/q0f;->a:Ll/mpy;

    .line 185
    .line 186
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    const/16 v6, 0x8

    .line 191
    .line 192
    invoke-virtual {v4, v6}, Lcom/facebook/imagepipeline/request/ImageRequest;->z(I)Z

    .line 193
    .line 194
    .line 195
    move-result v9

    .line 196
    invoke-interface {p2}, Ll/yk90;->m()Ll/tjm;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    invoke-interface {v4}, Ll/tjm;->n()Ll/ujm;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    invoke-virtual {v4}, Ll/ujm;->D()Z

    .line 205
    .line 206
    .line 207
    move-result v10

    .line 208
    move-object v6, p1

    .line 209
    invoke-direct/range {v5 .. v10}, Ll/q0f$a;-><init>(Ll/z06;Ll/mpy;Ll/by3;ZZ)V

    .line 210
    .line 211
    .line 212
    invoke-interface {v1, p2, v0}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-eqz p1, :cond_6

    .line 217
    .line 218
    invoke-static {v11, v12}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    :cond_6
    invoke-interface {v1, p2, v0, v3}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 223
    .line 224
    .line 225
    iget-object p0, p0, Ll/q0f;->c:Ll/wk90;

    .line 226
    .line 227
    invoke-interface {p0, v5, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 228
    .line 229
    .line 230
    :try_start_9
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 231
    .line 232
    .line 233
    invoke-static {}, Ll/i9j;->d()Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-eqz p0, :cond_7

    .line 238
    .line 239
    invoke-static {}, Ll/i9j;->b()V

    .line 240
    .line 241
    .line 242
    :cond_7
    return-void

    .line 243
    :goto_4
    :try_start_a
    invoke-static {v2}, Ll/fb5;->v(Ll/fb5;)V

    .line 244
    .line 245
    .line 246
    throw p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 247
    :catchall_2
    move-exception v0

    .line 248
    move-object p0, v0

    .line 249
    invoke-static {}, Ll/i9j;->d()Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    if-eqz p1, :cond_8

    .line 254
    .line 255
    invoke-static {}, Ll/i9j;->b()V

    .line 256
    .line 257
    .line 258
    :cond_8
    throw p0
.end method
