.class public final Lcom/google/android/exoplayer2/source/n$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$e;
.implements Lcom/google/android/exoplayer2/source/e$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:J

.field public final b:Landroid/net/Uri;

.field public final c:Ll/p4g0;

.field public final d:Lcom/google/android/exoplayer2/source/m;

.field public final e:Ll/bsf;

.field public final f:Ll/wt5;

.field public final g:Ll/ll80;

.field public volatile h:Z

.field public i:Z

.field public j:J

.field public k:Lcom/google/android/exoplayer2/upstream/a;

.field public l:Ll/qfj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:Z

.field public final synthetic n:Lcom/google/android/exoplayer2/source/n;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/n;Landroid/net/Uri;Ll/g6c;Lcom/google/android/exoplayer2/source/m;Ll/bsf;Ll/wt5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/n$a;->b:Landroid/net/Uri;

    .line 7
    .line 8
    new-instance p1, Ll/p4g0;

    .line 9
    .line 10
    invoke-direct {p1, p3}, Ll/p4g0;-><init>(Ll/g6c;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 14
    .line 15
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 16
    .line 17
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/n$a;->e:Ll/bsf;

    .line 18
    .line 19
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/n$a;->f:Ll/wt5;

    .line 20
    .line 21
    new-instance p1, Ll/ll80;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/ll80;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/n$a;->g:Ll/ll80;

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/n$a;->i:Z

    .line 30
    .line 31
    invoke-static {}, Ll/mtv;->a()J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/n$a;->a:J

    .line 36
    .line 37
    const-wide/16 p1, 0x0

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/n$a;->i(J)Lcom/google/android/exoplayer2/upstream/a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/n$a;->k:Lcom/google/android/exoplayer2/upstream/a;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/source/n$a;)Ll/p4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/source/n$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/n$a;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/source/n$a;)Lcom/google/android/exoplayer2/upstream/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/n$a;->k:Lcom/google/android/exoplayer2/upstream/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/source/n$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/n$a;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic h(Lcom/google/android/exoplayer2/source/n$a;JJ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/source/n$a;->j(JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-nez v1, :cond_8

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/n$a;->h:Z

    .line 6
    .line 7
    if-nez v2, :cond_8

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const-wide/16 v3, -0x1

    .line 11
    .line 12
    :try_start_0
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->g:Ll/ll80;

    .line 13
    .line 14
    iget-wide v10, v5, Ll/ll80;->a:J

    .line 15
    .line 16
    invoke-virtual {p0, v10, v11}, Lcom/google/android/exoplayer2/source/n$a;->i(J)Lcom/google/android/exoplayer2/upstream/a;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    iput-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->k:Lcom/google/android/exoplayer2/upstream/a;

    .line 21
    .line 22
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 23
    .line 24
    invoke-virtual {v6, v5}, Ll/p4g0;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 25
    .line 26
    .line 27
    move-result-wide v5

    .line 28
    cmp-long v7, v5, v3

    .line 29
    .line 30
    if-eqz v7, :cond_0

    .line 31
    .line 32
    add-long/2addr v5, v10

    .line 33
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 34
    .line 35
    invoke-static {v7}, Lcom/google/android/exoplayer2/source/n;->D(Lcom/google/android/exoplayer2/source/n;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    move-wide v12, v5

    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto/16 :goto_4

    .line 42
    .line 43
    :goto_1
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 44
    .line 45
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 46
    .line 47
    invoke-virtual {v6}, Ll/p4g0;->a()Ljava/util/Map;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-static {v6}, Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;->a(Ljava/util/Map;)Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    invoke-static {v5, v6}, Lcom/google/android/exoplayer2/source/n;->F(Lcom/google/android/exoplayer2/source/n;Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;)Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;

    .line 56
    .line 57
    .line 58
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 59
    .line 60
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 61
    .line 62
    invoke-static {v6}, Lcom/google/android/exoplayer2/source/n;->E(Lcom/google/android/exoplayer2/source/n;)Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    if-eqz v6, :cond_1

    .line 67
    .line 68
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 69
    .line 70
    invoke-static {v6}, Lcom/google/android/exoplayer2/source/n;->E(Lcom/google/android/exoplayer2/source/n;)Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    iget v6, v6, Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;->metadataInterval:I

    .line 75
    .line 76
    const/4 v7, -0x1

    .line 77
    if-eq v6, v7, :cond_1

    .line 78
    .line 79
    new-instance v5, Lcom/google/android/exoplayer2/source/e;

    .line 80
    .line 81
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 82
    .line 83
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 84
    .line 85
    invoke-static {v7}, Lcom/google/android/exoplayer2/source/n;->E(Lcom/google/android/exoplayer2/source/n;)Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    iget v7, v7, Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;->metadataInterval:I

    .line 90
    .line 91
    invoke-direct {v5, v6, v7, p0}, Lcom/google/android/exoplayer2/source/e;-><init>(Ll/g6c;ILcom/google/android/exoplayer2/source/e$a;)V

    .line 92
    .line 93
    .line 94
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 95
    .line 96
    invoke-virtual {v6}, Lcom/google/android/exoplayer2/source/n;->N()Ll/qfj0;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    iput-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->l:Ll/qfj0;

    .line 101
    .line 102
    invoke-static {}, Lcom/google/android/exoplayer2/source/n;->G()Lcom/google/android/exoplayer2/k;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    invoke-interface {v6, v7}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    move-object v7, v5

    .line 110
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 111
    .line 112
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/n$a;->b:Landroid/net/Uri;

    .line 113
    .line 114
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 115
    .line 116
    invoke-virtual {v5}, Ll/p4g0;->a()Ljava/util/Map;

    .line 117
    .line 118
    .line 119
    move-result-object v9

    .line 120
    iget-object v14, p0, Lcom/google/android/exoplayer2/source/n$a;->e:Ll/bsf;

    .line 121
    .line 122
    invoke-interface/range {v6 .. v14}, Lcom/google/android/exoplayer2/source/m;->e(Ll/e6c;Landroid/net/Uri;Ljava/util/Map;JJLl/bsf;)V

    .line 123
    .line 124
    .line 125
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 126
    .line 127
    invoke-static {v5}, Lcom/google/android/exoplayer2/source/n;->E(Lcom/google/android/exoplayer2/source/n;)Lcom/google/android/exoplayer2/metadata/icy/IcyHeaders;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    if-eqz v5, :cond_2

    .line 132
    .line 133
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 134
    .line 135
    invoke-interface {v5}, Lcom/google/android/exoplayer2/source/m;->d()V

    .line 136
    .line 137
    .line 138
    :cond_2
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/n$a;->i:Z

    .line 139
    .line 140
    if-eqz v5, :cond_3

    .line 141
    .line 142
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 143
    .line 144
    iget-wide v6, p0, Lcom/google/android/exoplayer2/source/n$a;->j:J

    .line 145
    .line 146
    invoke-interface {v5, v10, v11, v6, v7}, Lcom/google/android/exoplayer2/source/m;->a(JJ)V

    .line 147
    .line 148
    .line 149
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/n$a;->i:Z

    .line 150
    .line 151
    :cond_3
    :goto_2
    if-nez v1, :cond_4

    .line 152
    .line 153
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/n$a;->h:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    .line 155
    if-nez v5, :cond_4

    .line 156
    .line 157
    :try_start_1
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->f:Ll/wt5;

    .line 158
    .line 159
    invoke-virtual {v5}, Ll/wt5;->a()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 160
    .line 161
    .line 162
    :try_start_2
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 163
    .line 164
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/n$a;->g:Ll/ll80;

    .line 165
    .line 166
    invoke-interface {v5, v6}, Lcom/google/android/exoplayer2/source/m;->c(Ll/ll80;)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 171
    .line 172
    invoke-interface {v5}, Lcom/google/android/exoplayer2/source/m;->b()J

    .line 173
    .line 174
    .line 175
    move-result-wide v5

    .line 176
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 177
    .line 178
    invoke-static {v7}, Lcom/google/android/exoplayer2/source/n;->H(Lcom/google/android/exoplayer2/source/n;)J

    .line 179
    .line 180
    .line 181
    move-result-wide v7

    .line 182
    add-long/2addr v7, v10

    .line 183
    cmp-long v7, v5, v7

    .line 184
    .line 185
    if-lez v7, :cond_3

    .line 186
    .line 187
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/n$a;->f:Ll/wt5;

    .line 188
    .line 189
    invoke-virtual {v7}, Ll/wt5;->c()Z

    .line 190
    .line 191
    .line 192
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 193
    .line 194
    invoke-static {v7}, Lcom/google/android/exoplayer2/source/n;->z(Lcom/google/android/exoplayer2/source/n;)Landroid/os/Handler;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 199
    .line 200
    invoke-static {v8}, Lcom/google/android/exoplayer2/source/n;->y(Lcom/google/android/exoplayer2/source/n;)Ljava/lang/Runnable;

    .line 201
    .line 202
    .line 203
    move-result-object v8

    .line 204
    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 205
    .line 206
    .line 207
    move-wide v10, v5

    .line 208
    goto :goto_2

    .line 209
    :catch_0
    new-instance v0, Ljava/io/InterruptedIOException;

    .line 210
    .line 211
    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 212
    .line 213
    .line 214
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 215
    :cond_4
    if-ne v1, v2, :cond_5

    .line 216
    .line 217
    move v1, v0

    .line 218
    goto :goto_3

    .line 219
    :cond_5
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 220
    .line 221
    invoke-interface {v2}, Lcom/google/android/exoplayer2/source/m;->b()J

    .line 222
    .line 223
    .line 224
    move-result-wide v5

    .line 225
    cmp-long v2, v5, v3

    .line 226
    .line 227
    if-eqz v2, :cond_6

    .line 228
    .line 229
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/n$a;->g:Ll/ll80;

    .line 230
    .line 231
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 232
    .line 233
    invoke-interface {v3}, Lcom/google/android/exoplayer2/source/m;->b()J

    .line 234
    .line 235
    .line 236
    move-result-wide v3

    .line 237
    iput-wide v3, v2, Ll/ll80;->a:J

    .line 238
    .line 239
    :cond_6
    :goto_3
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 240
    .line 241
    invoke-static {v2}, Ll/m6c;->a(Ll/g6c;)V

    .line 242
    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :goto_4
    if-eq v1, v2, :cond_7

    .line 247
    .line 248
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 249
    .line 250
    invoke-interface {v1}, Lcom/google/android/exoplayer2/source/m;->b()J

    .line 251
    .line 252
    .line 253
    move-result-wide v1

    .line 254
    cmp-long v1, v1, v3

    .line 255
    .line 256
    if-eqz v1, :cond_7

    .line 257
    .line 258
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/n$a;->g:Ll/ll80;

    .line 259
    .line 260
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/n$a;->d:Lcom/google/android/exoplayer2/source/m;

    .line 261
    .line 262
    invoke-interface {v2}, Lcom/google/android/exoplayer2/source/m;->b()J

    .line 263
    .line 264
    .line 265
    move-result-wide v2

    .line 266
    iput-wide v2, v1, Ll/ll80;->a:J

    .line 267
    .line 268
    :cond_7
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/n$a;->c:Ll/p4g0;

    .line 269
    .line 270
    invoke-static {p0}, Ll/m6c;->a(Ll/g6c;)V

    .line 271
    .line 272
    .line 273
    throw v0

    .line 274
    :cond_8
    return-void
.end method

.method public b(Ll/ig60;)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/n$a;->m:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/n$a;->j:J

    .line 7
    .line 8
    :goto_0
    move-wide v5, v2

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/source/n;->A(Lcom/google/android/exoplayer2/source/n;Z)J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    iget-wide v4, p0, Lcom/google/android/exoplayer2/source/n$a;->j:J

    .line 17
    .line 18
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    goto :goto_0

    .line 23
    :goto_1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 24
    .line 25
    .line 26
    move-result v8

    .line 27
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$a;->l:Ll/qfj0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    move-object v4, v0

    .line 34
    check-cast v4, Ll/qfj0;

    .line 35
    .line 36
    invoke-interface {v4, p1, v8}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 37
    .line 38
    .line 39
    const/4 v9, 0x0

    .line 40
    const/4 v10, 0x0

    .line 41
    const/4 v7, 0x1

    .line 42
    invoke-interface/range {v4 .. v10}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 43
    .line 44
    .line 45
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/n$a;->m:Z

    .line 46
    .line 47
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/n$a;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public final i(J)Lcom/google/android/exoplayer2/upstream/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/upstream/a$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/n$a;->b:Landroid/net/Uri;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer2/upstream/a$b;->h(J)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/n$a;->n:Lcom/google/android/exoplayer2/source/n;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/n;->C(Lcom/google/android/exoplayer2/source/n;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/upstream/a$b;->f(Ljava/lang/String;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x6

    .line 27
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/upstream/a$b;->b(I)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {}, Lcom/google/android/exoplayer2/source/n;->B()Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/upstream/a$b;->e(Ljava/util/Map;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final j(JJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/n$a;->g:Ll/ll80;

    .line 2
    .line 3
    iput-wide p1, v0, Ll/ll80;->a:J

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/google/android/exoplayer2/source/n$a;->j:J

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/n$a;->i:Z

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/n$a;->m:Z

    .line 12
    .line 13
    return-void
.end method
