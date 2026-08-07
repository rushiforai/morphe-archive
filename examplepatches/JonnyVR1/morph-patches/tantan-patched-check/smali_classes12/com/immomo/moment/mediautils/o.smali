.class public Lcom/immomo/moment/mediautils/o;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/o$e;,
        Lcom/immomo/moment/mediautils/o$d;,
        Lcom/immomo/moment/mediautils/o$f;
    }
.end annotation


# instance fields
.field private A:J

.field private B:J

.field private C:Lcom/immomo/moment/mediautils/m$c;

.field private D:Lcom/immomo/moment/mediautils/m$e;

.field private a:Lcom/immomo/moment/mediautils/m;

.field private b:Lcom/immomo/moment/mediautils/n;

.field private c:I

.field private d:I

.field private e:Ljava/lang/Object;

.field private f:Ljava/lang/Object;

.field private g:Ljava/lang/Object;

.field private volatile h:Z

.field private i:Ljava/lang/Object;

.field private j:Z

.field private k:J

.field private l:J

.field private m:J

.field private final n:J

.field private o:J

.field private p:J

.field private q:J

.field private r:Lcom/immomo/moment/mediautils/o$d;

.field private s:Lcom/immomo/moment/mediautils/o$f;

.field private t:I

.field private u:Z

.field private v:Z

.field private w:I

.field private x:Landroid/media/MediaCodec$BufferInfo;

.field private y:Lcom/immomo/moment/mediautils/o$e;

.field private z:Landroid/os/HandlerThread;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 8
    .line 9
    new-instance v1, Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->f:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->g:Ljava/lang/Object;

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->h:Z

    .line 31
    .line 32
    new-instance v1, Ljava/lang/Object;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->i:Ljava/lang/Object;

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->j:Z

    .line 40
    .line 41
    const-wide/16 v1, 0x0

    .line 42
    .line 43
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 44
    .line 45
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 46
    .line 47
    const-wide/16 v3, -0x1

    .line 48
    .line 49
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 50
    .line 51
    const-wide/16 v5, 0x5ab4

    .line 52
    .line 53
    iput-wide v5, p0, Lcom/immomo/moment/mediautils/o;->n:J

    .line 54
    .line 55
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 56
    .line 57
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 58
    .line 59
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 63
    .line 64
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 65
    .line 66
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->u:Z

    .line 67
    .line 68
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->v:Z

    .line 69
    .line 70
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->w:I

    .line 71
    .line 72
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 73
    .line 74
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/immomo/moment/mediautils/o;->x:Landroid/media/MediaCodec$BufferInfo;

    .line 78
    .line 79
    new-instance v0, Lcom/immomo/moment/mediautils/o$a;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/o$a;-><init>(Lcom/immomo/moment/mediautils/o;)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 85
    .line 86
    new-instance v0, Lcom/immomo/moment/mediautils/o$b;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/o$b;-><init>(Lcom/immomo/moment/mediautils/o;)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 92
    .line 93
    return-void
.end method

.method private A(J)Z
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    iget-object v3, v0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v3

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v6, v1, v4

    .line 11
    .line 12
    if-eqz v6, :cond_7

    .line 13
    .line 14
    :try_start_0
    iget-object v6, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 15
    .line 16
    const/4 v7, 0x0

    .line 17
    if-nez v6, :cond_0

    .line 18
    .line 19
    monitor-exit v3

    .line 20
    return v7

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    iput v7, v0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 25
    .line 26
    iput-wide v4, v0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 27
    .line 28
    iput-wide v4, v0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 29
    .line 30
    iput-wide v4, v0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 31
    .line 32
    iput-wide v4, v0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 33
    .line 34
    iput v7, v0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 35
    .line 36
    const-wide/16 v7, -0x1

    .line 37
    .line 38
    iput-wide v7, v0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 39
    .line 40
    iput-wide v7, v0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 41
    .line 42
    invoke-virtual {v6}, Lcom/immomo/moment/mediautils/n;->e()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    const/4 v9, 0x1

    .line 47
    if-eqz v6, :cond_3

    .line 48
    .line 49
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    move-wide v11, v1

    .line 58
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v13

    .line 62
    if-eqz v13, :cond_3

    .line 63
    .line 64
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v13

    .line 68
    check-cast v13, Lcom/immomo/moment/mediautils/n$a;

    .line 69
    .line 70
    iget-wide v14, v13, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 71
    .line 72
    move-wide/from16 v16, v4

    .line 73
    .line 74
    iget-wide v4, v13, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 75
    .line 76
    sub-long v4, v14, v4

    .line 77
    .line 78
    sub-long/2addr v11, v4

    .line 79
    cmp-long v4, v11, v16

    .line 80
    .line 81
    if-gtz v4, :cond_1

    .line 82
    .line 83
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 84
    .line 85
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/n;->f()Ljava/util/Map;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    iget-object v5, v13, Lcom/immomo/moment/mediautils/n$a;->c:Ljava/lang/String;

    .line 90
    .line 91
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    move-object v14, v4

    .line 96
    check-cast v14, Lcom/immomo/moment/mediautils/m;

    .line 97
    .line 98
    iput-object v14, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 99
    .line 100
    iget-wide v4, v13, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 101
    .line 102
    iget-wide v6, v13, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 103
    .line 104
    iget-object v8, v13, Lcom/immomo/moment/mediautils/n$a;->d:Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result v19

    .line 110
    move-wide v15, v4

    .line 111
    move-wide/from16 v17, v6

    .line 112
    .line 113
    invoke-virtual/range {v14 .. v19}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_1
    if-ne v10, v9, :cond_2

    .line 118
    .line 119
    cmp-long v4, v14, v7

    .line 120
    .line 121
    if-nez v4, :cond_2

    .line 122
    .line 123
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 124
    .line 125
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/n;->f()Ljava/util/Map;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    iget-object v5, v13, Lcom/immomo/moment/mediautils/n$a;->c:Ljava/lang/String;

    .line 130
    .line 131
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    move-object v14, v4

    .line 136
    check-cast v14, Lcom/immomo/moment/mediautils/m;

    .line 137
    .line 138
    iput-object v14, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 139
    .line 140
    iget-wide v4, v13, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 141
    .line 142
    iget-wide v6, v13, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 143
    .line 144
    iget-object v8, v13, Lcom/immomo/moment/mediautils/n$a;->d:Ljava/lang/Boolean;

    .line 145
    .line 146
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 147
    .line 148
    .line 149
    move-result v19

    .line 150
    move-wide v15, v4

    .line 151
    move-wide/from16 v17, v6

    .line 152
    .line 153
    invoke-virtual/range {v14 .. v19}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_2
    iget v4, v0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 158
    .line 159
    add-int/2addr v4, v9

    .line 160
    iput v4, v0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 161
    .line 162
    move-wide/from16 v4, v16

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_3
    :goto_1
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 166
    .line 167
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->l()I

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    iput v4, v0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 172
    .line 173
    and-int/2addr v4, v9

    .line 174
    if-eqz v4, :cond_4

    .line 175
    .line 176
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 177
    .line 178
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 179
    .line 180
    invoke-virtual {v4, v5}, Lcom/immomo/moment/mediautils/m;->u(Lcom/immomo/moment/mediautils/m$c;)V

    .line 181
    .line 182
    .line 183
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 184
    .line 185
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->e()Landroid/media/MediaFormat;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    if-eqz v4, :cond_4

    .line 190
    .line 191
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 192
    .line 193
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 194
    .line 195
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/m;->e()Landroid/media/MediaFormat;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

    .line 200
    .line 201
    .line 202
    :cond_4
    iget v4, v0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 203
    .line 204
    and-int/lit8 v4, v4, 0x10

    .line 205
    .line 206
    if-eqz v4, :cond_5

    .line 207
    .line 208
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 209
    .line 210
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 211
    .line 212
    invoke-virtual {v4, v5}, Lcom/immomo/moment/mediautils/m;->z(Lcom/immomo/moment/mediautils/m$e;)V

    .line 213
    .line 214
    .line 215
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 216
    .line 217
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->m()Landroid/media/MediaFormat;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    if-eqz v4, :cond_5

    .line 222
    .line 223
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 224
    .line 225
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 226
    .line 227
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/m;->m()Landroid/media/MediaFormat;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/m$e;->d(Landroid/media/MediaFormat;)V

    .line 232
    .line 233
    .line 234
    :cond_5
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 235
    .line 236
    if-eqz v4, :cond_6

    .line 237
    .line 238
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 239
    .line 240
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/m;->j()I

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/o$d;->e(I)V

    .line 245
    .line 246
    .line 247
    :cond_6
    iget-object v0, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 248
    .line 249
    invoke-virtual {v0, v1, v2}, Lcom/immomo/moment/mediautils/m;->C(J)Z

    .line 250
    .line 251
    .line 252
    monitor-exit v3

    .line 253
    return v9

    .line 254
    :cond_7
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/o;->z()Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    monitor-exit v3

    .line 259
    return v0

    .line 260
    :goto_2
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    throw v0
.end method

.method private D(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/m;->o()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->s:Lcom/immomo/moment/mediautils/o$f;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/immomo/moment/mediautils/o$f;->a()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method private G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/m;->r(Ljava/lang/Boolean;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private H()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput v1, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 10
    .line 11
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 12
    .line 13
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 14
    .line 15
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 16
    .line 17
    iput v1, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 18
    .line 19
    const-wide/16 v4, -0x1

    .line 20
    .line 21
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 22
    .line 23
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 24
    .line 25
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/o;->B:J

    .line 26
    .line 27
    invoke-direct {p0, v4, v5}, Lcom/immomo/moment/mediautils/o;->A(J)Z

    .line 28
    .line 29
    .line 30
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->B:J

    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method private I()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/m;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private K(J)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    monitor-exit v1

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v4, p1, v2

    .line 18
    .line 19
    if-ltz v4, :cond_9

    .line 20
    .line 21
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 22
    .line 23
    if-eqz v4, :cond_1

    .line 24
    .line 25
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->o()V

    .line 26
    .line 27
    .line 28
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    invoke-virtual {v4, v5}, Lcom/immomo/moment/mediautils/m;->u(Lcom/immomo/moment/mediautils/m$c;)V

    .line 32
    .line 33
    .line 34
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Lcom/immomo/moment/mediautils/m;->z(Lcom/immomo/moment/mediautils/m$e;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/4 v4, 0x0

    .line 40
    iput v4, v0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 41
    .line 42
    iput-wide v2, v0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 43
    .line 44
    iput-wide v2, v0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 45
    .line 46
    iput-wide v2, v0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 47
    .line 48
    iput-wide v2, v0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 49
    .line 50
    iput v4, v0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 51
    .line 52
    const-wide/16 v4, -0x1

    .line 53
    .line 54
    iput-wide v4, v0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 55
    .line 56
    iput-wide v4, v0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 57
    .line 58
    iget-object v6, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 59
    .line 60
    invoke-virtual {v6}, Lcom/immomo/moment/mediautils/n;->e()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    const/4 v7, 0x1

    .line 65
    if-eqz v6, :cond_5

    .line 66
    .line 67
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    move-wide/from16 v9, p1

    .line 76
    .line 77
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    if-eqz v11, :cond_4

    .line 82
    .line 83
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    check-cast v11, Lcom/immomo/moment/mediautils/n$a;

    .line 88
    .line 89
    iget-wide v12, v11, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 90
    .line 91
    iget-wide v14, v11, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 92
    .line 93
    sub-long v16, v12, v14

    .line 94
    .line 95
    sub-long v9, v9, v16

    .line 96
    .line 97
    cmp-long v18, v9, v2

    .line 98
    .line 99
    if-gtz v18, :cond_2

    .line 100
    .line 101
    add-long v9, v9, v16

    .line 102
    .line 103
    add-long v2, v9, v14

    .line 104
    .line 105
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 106
    .line 107
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/n;->f()Ljava/util/Map;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    iget-object v5, v11, Lcom/immomo/moment/mediautils/n$a;->c:Ljava/lang/String;

    .line 112
    .line 113
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    move-object v12, v4

    .line 118
    check-cast v12, Lcom/immomo/moment/mediautils/m;

    .line 119
    .line 120
    iput-object v12, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 121
    .line 122
    iget-wide v13, v11, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 123
    .line 124
    iget-wide v4, v11, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 125
    .line 126
    iget-object v6, v11, Lcom/immomo/moment/mediautils/n$a;->d:Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 129
    .line 130
    .line 131
    move-result v17

    .line 132
    move-wide v15, v4

    .line 133
    invoke-virtual/range {v12 .. v17}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_2
    if-ne v8, v7, :cond_3

    .line 138
    .line 139
    cmp-long v12, v12, v4

    .line 140
    .line 141
    if-nez v12, :cond_3

    .line 142
    .line 143
    add-long v2, v9, v14

    .line 144
    .line 145
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 146
    .line 147
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/n;->f()Ljava/util/Map;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    iget-object v5, v11, Lcom/immomo/moment/mediautils/n$a;->c:Ljava/lang/String;

    .line 152
    .line 153
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    move-object v12, v4

    .line 158
    check-cast v12, Lcom/immomo/moment/mediautils/m;

    .line 159
    .line 160
    iput-object v12, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 161
    .line 162
    iget-wide v13, v11, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 163
    .line 164
    iget-wide v4, v11, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 165
    .line 166
    iget-object v6, v11, Lcom/immomo/moment/mediautils/n$a;->d:Ljava/lang/Boolean;

    .line 167
    .line 168
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 169
    .line 170
    .line 171
    move-result v17

    .line 172
    move-wide v15, v4

    .line 173
    invoke-virtual/range {v12 .. v17}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_3
    iget v11, v0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 178
    .line 179
    add-int/2addr v11, v7

    .line 180
    iput v11, v0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_4
    move-wide v2, v9

    .line 184
    goto :goto_1

    .line 185
    :cond_5
    move-wide/from16 v2, p1

    .line 186
    .line 187
    :goto_1
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 188
    .line 189
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->l()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    iput v4, v0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 194
    .line 195
    and-int/2addr v4, v7

    .line 196
    if-eqz v4, :cond_6

    .line 197
    .line 198
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 199
    .line 200
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 201
    .line 202
    invoke-virtual {v4, v5}, Lcom/immomo/moment/mediautils/m;->u(Lcom/immomo/moment/mediautils/m$c;)V

    .line 203
    .line 204
    .line 205
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 206
    .line 207
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->e()Landroid/media/MediaFormat;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    if-eqz v4, :cond_6

    .line 212
    .line 213
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 214
    .line 215
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 216
    .line 217
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/m;->e()Landroid/media/MediaFormat;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

    .line 222
    .line 223
    .line 224
    :cond_6
    iget v4, v0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 225
    .line 226
    and-int/lit8 v4, v4, 0x10

    .line 227
    .line 228
    if-eqz v4, :cond_7

    .line 229
    .line 230
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 231
    .line 232
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 233
    .line 234
    invoke-virtual {v4, v5}, Lcom/immomo/moment/mediautils/m;->z(Lcom/immomo/moment/mediautils/m$e;)V

    .line 235
    .line 236
    .line 237
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 238
    .line 239
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/m;->m()Landroid/media/MediaFormat;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    if-eqz v4, :cond_7

    .line 244
    .line 245
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 246
    .line 247
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 248
    .line 249
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/m;->m()Landroid/media/MediaFormat;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/m$e;->d(Landroid/media/MediaFormat;)V

    .line 254
    .line 255
    .line 256
    :cond_7
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 257
    .line 258
    if-eqz v4, :cond_8

    .line 259
    .line 260
    iget-object v5, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 261
    .line 262
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/m;->j()I

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/o$d;->e(I)V

    .line 267
    .line 268
    .line 269
    :cond_8
    iget-object v4, v0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 270
    .line 271
    invoke-virtual {v4, v2, v3}, Lcom/immomo/moment/mediautils/m;->C(J)Z

    .line 272
    .line 273
    .line 274
    :cond_9
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    iget-object v0, v0, Lcom/immomo/moment/mediautils/o;->s:Lcom/immomo/moment/mediautils/o$f;

    .line 276
    .line 277
    if-eqz v0, :cond_a

    .line 278
    .line 279
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/o$f;->b()V

    .line 280
    .line 281
    .line 282
    :cond_a
    return-void

    .line 283
    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 284
    throw v0
.end method

.method public static synthetic a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/moment/mediautils/o;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c(Lcom/immomo/moment/mediautils/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/o;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/immomo/moment/mediautils/o;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic e(Lcom/immomo/moment/mediautils/o;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->A:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Lcom/immomo/moment/mediautils/o;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/o;->A:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic g(Lcom/immomo/moment/mediautils/o;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/o;->K(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/immomo/moment/mediautils/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/o;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/immomo/moment/mediautils/o;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->i:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Lcom/immomo/moment/mediautils/o;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/o;->j:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic k(Lcom/immomo/moment/mediautils/o;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/o;->G(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/immomo/moment/mediautils/o;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic m(Lcom/immomo/moment/mediautils/o;J)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 2
    .line 3
    add-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public static synthetic n(Lcom/immomo/moment/mediautils/o;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic o(Lcom/immomo/moment/mediautils/o;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic p(Lcom/immomo/moment/mediautils/o;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic q(Lcom/immomo/moment/mediautils/o;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic r(Lcom/immomo/moment/mediautils/o;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic s(Lcom/immomo/moment/mediautils/o;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic t(Lcom/immomo/moment/mediautils/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/o;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/immomo/moment/mediautils/o;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/o;->D(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lcom/immomo/moment/mediautils/o;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/o;->h:Z

    .line 2
    .line 3
    return p1
.end method

.method private y()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 9
    .line 10
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/o;->z()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Lcom/immomo/moment/mediautils/o$c;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/o$c;-><init>(Lcom/immomo/moment/mediautils/o;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x2

    .line 28
    invoke-static {p0, v0}, Ll/lyi0;->d(ILjava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private z()Z
    .locals 11

    .line 1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    const-string v0, "EditProcess"

    .line 5
    .line 6
    const-string v2, " MediaSourceManager initSource Start"

    .line 7
    .line 8
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    monitor-exit v1

    .line 17
    return v2

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    move-object p0, v0

    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    iput v2, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/n;->e()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 32
    .line 33
    iget-object v3, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/immomo/moment/mediautils/n;->e()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x1

    .line 44
    if-ge v0, v3, :cond_6

    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/m;->o()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/m;->u(Lcom/immomo/moment/mediautils/m$c;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/m;->z(Lcom/immomo/moment/mediautils/m$e;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/n;->e()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget v2, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 71
    .line 72
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/immomo/moment/mediautils/n$a;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/n;->f()Ljava/util/Map;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object v3, v0, Lcom/immomo/moment/mediautils/n$a;->c:Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    move-object v5, v2

    .line 91
    check-cast v5, Lcom/immomo/moment/mediautils/m;

    .line 92
    .line 93
    iput-object v5, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 94
    .line 95
    iget-wide v6, v0, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 96
    .line 97
    iget-wide v8, v0, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 98
    .line 99
    iget-object v0, v0, Lcom/immomo/moment/mediautils/n$a;->d:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    invoke-virtual/range {v5 .. v10}, Lcom/immomo/moment/mediautils/m;->t(JJZ)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/m;->l()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput v0, p0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 115
    .line 116
    and-int/2addr v0, v4

    .line 117
    if-eqz v0, :cond_2

    .line 118
    .line 119
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 120
    .line 121
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/m;->u(Lcom/immomo/moment/mediautils/m$c;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/m;->e()Landroid/media/MediaFormat;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    if-eqz v0, :cond_2

    .line 133
    .line 134
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->C:Lcom/immomo/moment/mediautils/m$c;

    .line 135
    .line 136
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 137
    .line 138
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/m;->e()Landroid/media/MediaFormat;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-interface {v0, v2}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

    .line 143
    .line 144
    .line 145
    :cond_2
    iget v0, p0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 146
    .line 147
    and-int/lit8 v0, v0, 0x10

    .line 148
    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 152
    .line 153
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Lcom/immomo/moment/mediautils/m;->z(Lcom/immomo/moment/mediautils/m$e;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/m;->m()Landroid/media/MediaFormat;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    if-eqz v0, :cond_3

    .line 165
    .line 166
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->D:Lcom/immomo/moment/mediautils/m$e;

    .line 167
    .line 168
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 169
    .line 170
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/m;->m()Landroid/media/MediaFormat;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-interface {v0, v2}, Lcom/immomo/moment/mediautils/m$e;->d(Landroid/media/MediaFormat;)V

    .line 175
    .line 176
    .line 177
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 178
    .line 179
    if-eqz v0, :cond_4

    .line 180
    .line 181
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 182
    .line 183
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/m;->j()I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-interface {v0, v2}, Lcom/immomo/moment/mediautils/o$d;->e(I)V

    .line 188
    .line 189
    .line 190
    :cond_4
    iget v0, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 191
    .line 192
    if-eqz v0, :cond_5

    .line 193
    .line 194
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 195
    .line 196
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 197
    .line 198
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 199
    .line 200
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_5
    const-wide/16 v2, 0x0

    .line 204
    .line 205
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 206
    .line 207
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 208
    .line 209
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 210
    .line 211
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 212
    .line 213
    :goto_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/m;->B()Z

    .line 216
    .line 217
    .line 218
    monitor-exit v1

    .line 219
    return v4

    .line 220
    :cond_6
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->u:Z

    .line 221
    .line 222
    if-eqz v0, :cond_9

    .line 223
    .line 224
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 225
    .line 226
    if-eqz v0, :cond_7

    .line 227
    .line 228
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/o$d;->a()V

    .line 229
    .line 230
    .line 231
    :cond_7
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 232
    .line 233
    if-eqz p0, :cond_8

    .line 234
    .line 235
    const/4 v0, 0x5

    .line 236
    invoke-virtual {p0, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 241
    .line 242
    .line 243
    :cond_8
    monitor-exit v1

    .line 244
    return v4

    .line 245
    :cond_9
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->v:Z

    .line 246
    .line 247
    if-eqz v0, :cond_b

    .line 248
    .line 249
    iput v2, p0, Lcom/immomo/moment/mediautils/o;->t:I

    .line 250
    .line 251
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 252
    .line 253
    if-eqz p0, :cond_a

    .line 254
    .line 255
    invoke-interface {p0}, Lcom/immomo/moment/mediautils/o$d;->f()V

    .line 256
    .line 257
    .line 258
    :cond_a
    monitor-exit v1

    .line 259
    return v4

    .line 260
    :cond_b
    iget v0, p0, Lcom/immomo/moment/mediautils/o;->w:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    .line 262
    iget-object v3, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 263
    .line 264
    if-ne v0, v4, :cond_d

    .line 265
    .line 266
    if-eqz v3, :cond_c

    .line 267
    .line 268
    :try_start_1
    invoke-virtual {v3, v4}, Lcom/immomo/moment/mediautils/m;->x(Z)V

    .line 269
    .line 270
    .line 271
    :cond_c
    monitor-exit v1

    .line 272
    return v2

    .line 273
    :cond_d
    if-eqz v3, :cond_e

    .line 274
    .line 275
    invoke-virtual {v3}, Lcom/immomo/moment/mediautils/m;->o()V

    .line 276
    .line 277
    .line 278
    :cond_e
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 279
    .line 280
    if-eqz p0, :cond_f

    .line 281
    .line 282
    invoke-interface {p0}, Lcom/immomo/moment/mediautils/o$d;->onFinished()V

    .line 283
    .line 284
    .line 285
    :cond_f
    monitor-exit v1

    .line 286
    return v4

    .line 287
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 288
    throw p0
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/immomo/moment/mediautils/o;->C(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public C(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->h:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/o;->g:Ljava/lang/Object;

    .line 23
    .line 24
    monitor-enter p1

    .line 25
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->h:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :try_start_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->g:Ljava/lang/Object;

    .line 30
    .line 31
    const-wide/16 v1, 0x5

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    monitor-exit p1

    .line 45
    return-void

    .line 46
    :goto_1
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p0
.end method

.method public E(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x6

    .line 6
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public F()V
    .locals 5

    .line 1
    const-string v0, "EditProcess"

    .line 2
    .line 3
    const-string v1, "SourceManager released !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->h:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/o;->j:Z

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->z:Landroid/os/HandlerThread;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->z:Landroid/os/HandlerThread;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 26
    .line 27
    monitor-enter v0

    .line 28
    :try_start_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/n;->g()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->a:Lcom/immomo/moment/mediautils/m;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    iput v1, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 46
    .line 47
    iput v1, p0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 48
    .line 49
    const-wide/16 v1, 0x0

    .line 50
    .line 51
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->k:J

    .line 52
    .line 53
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->l:J

    .line 54
    .line 55
    const-wide/16 v3, -0x1

    .line 56
    .line 57
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/o;->m:J

    .line 58
    .line 59
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->o:J

    .line 60
    .line 61
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/o;->p:J

    .line 62
    .line 63
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/o;->q:J

    .line 64
    .line 65
    monitor-exit v0

    .line 66
    return-void

    .line 67
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    throw p0
.end method

.method public J(J)Z
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/o;->A:J

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x4

    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public L(Lcom/immomo/moment/mediautils/o$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/o;->r:Lcom/immomo/moment/mediautils/o$d;

    .line 2
    .line 3
    return-void
.end method

.method public M(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-le p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iput p1, p0, Lcom/immomo/moment/mediautils/o;->w:I

    .line 8
    .line 9
    :cond_1
    :goto_0
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/o;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public O(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/o;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public P(Lcom/immomo/moment/mediautils/o$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/o;->s:Lcom/immomo/moment/mediautils/o$f;

    .line 2
    .line 3
    return-void
.end method

.method public Q()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->z:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    new-instance v0, Landroid/os/HandlerThread;

    .line 10
    .line 11
    const-string v1, "MediasourceManager"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/moment/mediautils/o;->z:Landroid/os/HandlerThread;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/immomo/moment/mediautils/o$e;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/immomo/moment/mediautils/o;->z:Landroid/os/HandlerThread;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, p0, v1}, Lcom/immomo/moment/mediautils/o$e;-><init>(Lcom/immomo/moment/mediautils/o;Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 33
    .line 34
    :cond_1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/o;->z()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public w(Lcom/immomo/moment/mediautils/n;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/o;->b:Lcom/immomo/moment/mediautils/n;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public x(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 5
    .line 6
    or-int/2addr p1, v1

    .line 7
    iput p1, p0, Lcom/immomo/moment/mediautils/o;->d:I

    .line 8
    .line 9
    iget v1, p0, Lcom/immomo/moment/mediautils/o;->c:I

    .line 10
    .line 11
    if-ne p1, v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o;->y:Lcom/immomo/moment/mediautils/o$e;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
