.class public final Ll/iug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iog0;


# instance fields
.field public a:Ll/ukg0;

.field public b:Ljava/util/ArrayList;

.field public c:J

.field public d:Ll/ffg0;

.field public final e:Ll/dhg0;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public final j:Ltech/sud/base/utils/SudStopwatch;

.field public final k:Ltech/sud/base/utils/SudStopwatch;

.field public final l:Ltech/sud/base/utils/SudStopwatch;

.field public final m:Ljava/util/ArrayList;

.field public n:I

.field public o:Z

.field public p:J

.field public q:Z

.field public r:Z

.field public s:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ll/dhg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ltech/sud/base/utils/SudStopwatch;

    .line 5
    .line 6
    invoke-direct {v0}, Ltech/sud/base/utils/SudStopwatch;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 10
    .line 11
    new-instance v0, Ltech/sud/base/utils/SudStopwatch;

    .line 12
    .line 13
    invoke-direct {v0}, Ltech/sud/base/utils/SudStopwatch;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 17
    .line 18
    new-instance v0, Ltech/sud/base/utils/SudStopwatch;

    .line 19
    .line 20
    invoke-direct {v0}, Ltech/sud/base/utils/SudStopwatch;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 31
    .line 32
    iput-object p1, p0, Ll/iug0;->e:Ll/dhg0;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/iug0;->d:Ll/ffg0;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v0, p0, Ll/ffg0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :try_start_1
    iput-boolean v0, p0, Ll/ffg0;->e:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/ffg0;->d:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object v1, p0, Ll/ffg0;->g:Ll/qwg0;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    monitor-exit p0

    .line 26
    throw v0

    .line 27
    :cond_1
    return-void
.end method

.method public final b(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_5

    .line 6
    .line 7
    :cond_0
    sget-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v1, v1, Ll/gvg0;->l:Ll/rng0;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-boolean v1, v1, Ll/rng0;->a:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v1, v2

    .line 24
    :goto_0
    if-eqz v1, :cond_2

    .line 25
    .line 26
    new-instance v1, Ll/pug0;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/pug0;-><init>()V

    .line 29
    .line 30
    .line 31
    sget-object v3, Ll/utg0;->g:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v3, v1, Ll/pug0;->a:Ljava/lang/String;

    .line 34
    .line 35
    iget-wide v3, p0, Ll/iug0;->p:J

    .line 36
    .line 37
    iput-wide v3, v1, Ll/pug0;->b:J

    .line 38
    .line 39
    iget-object v0, v0, Ll/ukg0;->c:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v0, v1, Ll/pug0;->c:Ljava/lang/String;

    .line 42
    .line 43
    iget-boolean v0, p0, Ll/iug0;->o:Z

    .line 44
    .line 45
    iput-boolean v0, v1, Ll/pug0;->d:Z

    .line 46
    .line 47
    sget-object v0, Ll/tug0;->a:Ljava/util/concurrent/ExecutorService;

    .line 48
    .line 49
    new-instance v3, Ll/hsg0;

    .line 50
    .line 51
    invoke-direct {v3, v1}, Ll/hsg0;-><init>(Ll/pug0;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 58
    .line 59
    iget-object v1, p0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 60
    .line 61
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->getElapsedTimeInMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide v3

    .line 65
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Ll/ukg0;->o:Ljava/lang/Long;

    .line 70
    .line 71
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 72
    .line 73
    iget v1, p0, Ll/iug0;->n:I

    .line 74
    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Ll/ukg0;->p:Ljava/lang/Integer;

    .line 80
    .line 81
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 82
    .line 83
    iget-object v1, p0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 84
    .line 85
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->getElapsedTimeInMillis()J

    .line 86
    .line 87
    .line 88
    move-result-wide v3

    .line 89
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iput-object v1, v0, Ll/ukg0;->q:Ljava/lang/Long;

    .line 94
    .line 95
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 96
    .line 97
    sget-object v1, Ll/lmg0;->e:Ljava/lang/String;

    .line 98
    .line 99
    sget-object v1, Ll/khg0;->a:Ll/lmg0;

    .line 100
    .line 101
    iget v1, v1, Ll/lmg0;->a:I

    .line 102
    .line 103
    const/4 v3, 0x3

    .line 104
    if-ne v1, v3, :cond_3

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    const/4 v3, 0x2

    .line 108
    if-ne v1, v3, :cond_4

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    if-ne v1, v2, :cond_5

    .line 112
    .line 113
    iget-boolean v1, p0, Ll/iug0;->r:Z

    .line 114
    .line 115
    if-eqz v1, :cond_5

    .line 116
    .line 117
    :goto_1
    const/4 v2, 0x0

    .line 118
    :cond_5
    :goto_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Ll/ukg0;->r:Ljava/lang/Integer;

    .line 123
    .line 124
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/io/File;->getTotalSpace()J

    .line 135
    .line 136
    .line 137
    move-result-wide v2

    .line 138
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iput-object v2, v1, Ll/ukg0;->s:Ljava/lang/Long;

    .line 143
    .line 144
    iget-object v1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/io/File;->getUsableSpace()J

    .line 147
    .line 148
    .line 149
    move-result-wide v2

    .line 150
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, v1, Ll/ukg0;->t:Ljava/lang/Long;

    .line 155
    .line 156
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Ll/iug0;->d(Ll/ukg0;)V

    .line 159
    .line 160
    .line 161
    const/16 v0, 0x50

    .line 162
    .line 163
    if-ne p1, v0, :cond_6

    .line 164
    .line 165
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 166
    .line 167
    const/16 v0, -0x283f

    .line 168
    .line 169
    iput v0, p1, Ll/ukg0;->e:I

    .line 170
    .line 171
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iput-object v0, p1, Ll/ukg0;->m:Ljava/lang/Integer;

    .line 176
    .line 177
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 178
    .line 179
    const-string v0, "\u5f15\u64ce\u52a0\u8f7d\u8d85\u65f6"

    .line 180
    .line 181
    iput-object v0, p1, Ll/ukg0;->f:Ljava/lang/String;

    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_6
    const/16 v0, 0x55

    .line 185
    .line 186
    if-lt p1, v0, :cond_8

    .line 187
    .line 188
    const/16 v0, 0x64

    .line 189
    .line 190
    if-ge p1, v0, :cond_8

    .line 191
    .line 192
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 193
    .line 194
    const/16 v0, -0x2840

    .line 195
    .line 196
    iput v0, p1, Ll/ukg0;->e:I

    .line 197
    .line 198
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p1, Ll/ukg0;->m:Ljava/lang/Integer;

    .line 203
    .line 204
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 205
    .line 206
    const-string v0, "\u6e38\u620f\u52a0\u8f7d\u8d85\u65f6"

    .line 207
    .line 208
    iput-object v0, p1, Ll/ukg0;->f:Ljava/lang/String;

    .line 209
    .line 210
    :goto_3
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 211
    .line 212
    const-string v0, "loadGameTimeout"

    .line 213
    .line 214
    iput-object v0, p1, Ll/ukg0;->a:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {v0}, Ll/fug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p1, Ll/ukg0;->b:Ljava/lang/String;

    .line 221
    .line 222
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/iug0;->g()Lorg/json/JSONArray;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    if-eqz v0, :cond_7

    .line 229
    .line 230
    iget-object p1, p1, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 231
    .line 232
    const-string v1, "loadGame"

    .line 233
    .line 234
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 239
    .line 240
    .line 241
    :goto_4
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 242
    .line 243
    invoke-static {p1}, Ll/fug0;->b(Ll/ukg0;)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 247
    .line 248
    const-string v0, "loadGameFinished"

    .line 249
    .line 250
    iput-object v0, p1, Ll/ukg0;->a:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {v0}, Ll/fug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    iput-object v0, p1, Ll/ukg0;->b:Ljava/lang/String;

    .line 257
    .line 258
    iget-object p0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 259
    .line 260
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 261
    .line 262
    .line 263
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-static {p1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    iput-object p1, p0, Ll/ukg0;->c:Ljava/lang/String;

    .line 276
    .line 277
    :cond_8
    :goto_5
    return-void
.end method

.method public final c(Ljava/lang/String;ILorg/json/JSONObject;)V
    .locals 7

    .line 1
    const-string v0, "putStatsEvent:"

    .line 2
    .line 3
    iget-object v1, p0, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    iget-object v1, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 9
    .line 10
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 14
    .line 15
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->getElapsedTimeInMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    const-wide/32 v5, 0xf4240

    .line 24
    .line 25
    .line 26
    div-long/2addr v3, v5

    .line 27
    new-instance v5, Ll/tkg0;

    .line 28
    .line 29
    invoke-direct {v5}, Ll/tkg0;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, v5, Ll/tkg0;->a:Ljava/lang/String;

    .line 33
    .line 34
    iput p2, v5, Ll/tkg0;->b:I

    .line 35
    .line 36
    iput-object p3, v5, Ll/tkg0;->c:Lorg/json/JSONObject;

    .line 37
    .line 38
    iget-wide p1, p0, Ll/iug0;->c:J

    .line 39
    .line 40
    sub-long p1, v3, p1

    .line 41
    .line 42
    sub-long/2addr p1, v1

    .line 43
    iput-wide p1, v5, Ll/tkg0;->d:J

    .line 44
    .line 45
    iput-wide v1, v5, Ll/tkg0;->e:J

    .line 46
    .line 47
    iget-object p1, p0, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iput-wide v3, p0, Ll/iug0;->c:J

    .line 53
    .line 54
    iget-object p0, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 55
    .line 56
    invoke-virtual {p0}, Ltech/sud/base/utils/SudStopwatch;->reset()V

    .line 57
    .line 58
    .line 59
    const-string p0, "LoadGameStatsManager"

    .line 60
    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance p2, Lorg/json/JSONObject;

    .line 67
    .line 68
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string p3, "step"

    .line 72
    .line 73
    iget-object v0, v5, Ll/tkg0;->a:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p2, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    const-string p3, "percent"

    .line 79
    .line 80
    iget v0, v5, Ll/tkg0;->b:I

    .line 81
    .line 82
    invoke-virtual {p2, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 83
    .line 84
    .line 85
    const-string p3, "extra"

    .line 86
    .line 87
    iget-object v0, v5, Ll/tkg0;->c:Lorg/json/JSONObject;

    .line 88
    .line 89
    invoke-virtual {p2, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    const-string p3, "cost_time"

    .line 93
    .line 94
    iget-wide v0, v5, Ll/tkg0;->d:J

    .line 95
    .line 96
    invoke-virtual {p2, p3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    const-string p3, "pause_cost_time"

    .line 100
    .line 101
    iget-wide v0, v5, Ll/tkg0;->e:J

    .line 102
    .line 103
    invoke-virtual {p2, p3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :catch_0
    move-exception p0

    .line 118
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final d(Ll/ukg0;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    move v4, v1

    .line 25
    :cond_1
    :goto_0
    if-ge v4, v3, :cond_4

    .line 26
    .line 27
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    add-int/lit8 v4, v4, 0x1

    .line 32
    .line 33
    check-cast v5, Ll/bsg0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    if-eqz v7, :cond_3

    .line 44
    .line 45
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    check-cast v7, Ll/bsg0;

    .line 50
    .line 51
    iget-object v8, v7, Ll/bsg0;->a:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v9, v5, Ll/bsg0;->a:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    if-eqz v8, :cond_2

    .line 60
    .line 61
    iget-wide v8, v5, Ll/bsg0;->b:J

    .line 62
    .line 63
    iget-wide v10, v7, Ll/bsg0;->b:J

    .line 64
    .line 65
    cmp-long v7, v8, v10

    .line 66
    .line 67
    if-lez v7, :cond_1

    .line 68
    .line 69
    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    iget-object v2, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    :cond_5
    :goto_1
    iget-object v0, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_8

    .line 93
    .line 94
    if-nez p1, :cond_6

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_6
    new-instance v0, Lorg/json/JSONArray;

    .line 98
    .line 99
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/iug0;->m:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    :goto_2
    if-ge v1, v2, :cond_7

    .line 109
    .line 110
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    add-int/lit8 v1, v1, 0x1

    .line 115
    .line 116
    check-cast v3, Ll/bsg0;

    .line 117
    .line 118
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 119
    .line 120
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v5, "name"

    .line 124
    .line 125
    iget-object v6, v3, Ll/bsg0;->a:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    .line 129
    .line 130
    const-string v5, "mg_timestamp"

    .line 131
    .line 132
    iget-wide v6, v3, Ll/bsg0;->b:J

    .line 133
    .line 134
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    const-string v5, "app_timestamp"

    .line 138
    .line 139
    iget-wide v6, v3, Ll/bsg0;->c:J

    .line 140
    .line 141
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 142
    .line 143
    .line 144
    const-string v5, "cost_time"

    .line 145
    .line 146
    iget-wide v6, v3, Ll/bsg0;->d:J

    .line 147
    .line 148
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :catch_0
    move-exception v3

    .line 156
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 157
    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_7
    iget-object p0, p1, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 161
    .line 162
    const-string p1, "local_info_transfer"

    .line 163
    .line 164
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    :cond_8
    :goto_3
    return-void
.end method

.method public final e(Z)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/iug0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_b

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/iug0;->i:Z

    .line 6
    .line 7
    if-nez v0, :cond_b

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/iug0;->h:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/iug0;->q:Z

    .line 16
    .line 17
    if-eqz v0, :cond_9

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/iug0;->g:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_1
    iget-boolean v0, p0, Ll/iug0;->r:Z

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget-object v0, Ll/lmg0;->e:Ljava/lang/String;

    .line 31
    .line 32
    sget-object v0, Ll/khg0;->a:Ll/lmg0;

    .line 33
    .line 34
    iget v1, v0, Ll/lmg0;->a:I

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    if-ne v1, v2, :cond_9

    .line 38
    .line 39
    iget-object v0, v0, Ll/lmg0;->d:Landroid/app/Activity;

    .line 40
    .line 41
    iget-object v1, p0, Ll/iug0;->s:Ljava/lang/Object;

    .line 42
    .line 43
    if-ne v0, v1, :cond_9

    .line 44
    .line 45
    :goto_0
    const-string v0, "LoadGameStatsManager"

    .line 46
    .line 47
    const-string v1, "onLoadGameStateChanged \u505c\u6b62\u7b97\u6682\u505c\u65f6\u95f4 \u6e38\u620f\u6b63\u5e38run"

    .line 48
    .line 49
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 53
    .line 54
    invoke-virtual {v0}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 58
    .line 59
    invoke-virtual {v0}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 63
    .line 64
    invoke-virtual {v0}, Ltech/sud/base/utils/SudStopwatch;->start()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/iug0;->d:Ll/ffg0;

    .line 68
    .line 69
    const-wide/16 v1, 0x3e8

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    sget-object p1, Ll/utg0;->e:Ll/i0h0;

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    iget-object p1, p1, Ll/i0h0;->c:Ll/gvg0;

    .line 81
    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    iget v3, p1, Ll/gvg0;->j:I

    .line 85
    .line 86
    :cond_3
    int-to-long v3, v3

    .line 87
    mul-long/2addr v3, v1

    .line 88
    new-instance p1, Ll/ffg0;

    .line 89
    .line 90
    iget-object v0, p0, Ll/iug0;->e:Ll/dhg0;

    .line 91
    .line 92
    invoke-direct {p1, v3, v4, v0}, Ll/ffg0;-><init>(JLl/dhg0;)V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Ll/iug0;->d:Ll/ffg0;

    .line 96
    .line 97
    :cond_4
    iget-object p0, p0, Ll/iug0;->d:Ll/ffg0;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/ffg0;->b()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    if-nez v0, :cond_7

    .line 104
    .line 105
    sget-object p1, Ll/utg0;->e:Ll/i0h0;

    .line 106
    .line 107
    if-eqz p1, :cond_6

    .line 108
    .line 109
    iget-object p1, p1, Ll/i0h0;->c:Ll/gvg0;

    .line 110
    .line 111
    if-eqz p1, :cond_6

    .line 112
    .line 113
    iget v3, p1, Ll/gvg0;->j:I

    .line 114
    .line 115
    :cond_6
    int-to-long v3, v3

    .line 116
    mul-long/2addr v3, v1

    .line 117
    new-instance p1, Ll/ffg0;

    .line 118
    .line 119
    iget-object v0, p0, Ll/iug0;->e:Ll/dhg0;

    .line 120
    .line 121
    invoke-direct {p1, v3, v4, v0}, Ll/ffg0;-><init>(JLl/dhg0;)V

    .line 122
    .line 123
    .line 124
    iput-object p1, p0, Ll/iug0;->d:Ll/ffg0;

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/ffg0;->b()V

    .line 127
    .line 128
    .line 129
    :cond_7
    iget-object p0, p0, Ll/iug0;->d:Ll/ffg0;

    .line 130
    .line 131
    if-eqz p0, :cond_b

    .line 132
    .line 133
    monitor-enter p0

    .line 134
    :try_start_0
    iget-boolean p1, p0, Ll/ffg0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    .line 136
    if-eqz p1, :cond_8

    .line 137
    .line 138
    monitor-exit p0

    .line 139
    return-void

    .line 140
    :cond_8
    const/4 p1, 0x1

    .line 141
    :try_start_1
    iput-boolean p1, p0, Ll/ffg0;->e:Z

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/ffg0;->a()V

    .line 144
    .line 145
    .line 146
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 147
    return-void

    .line 148
    :catchall_0
    move-exception p1

    .line 149
    monitor-exit p0

    .line 150
    throw p1

    .line 151
    :cond_9
    :goto_1
    const-string v0, "LoadGameStatsManager"

    .line 152
    .line 153
    const-string v1, "onLoadGameStateChanged \u5f00\u59cb\u7b97\u6682\u505c\u65f6\u95f4"

    .line 154
    .line 155
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 159
    .line 160
    invoke-virtual {v0}, Ltech/sud/base/utils/SudStopwatch;->start()V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/iug0;->k:Ltech/sud/base/utils/SudStopwatch;

    .line 164
    .line 165
    invoke-virtual {v0}, Ltech/sud/base/utils/SudStopwatch;->start()V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 169
    .line 170
    invoke-virtual {v0}, Ltech/sud/base/utils/SudStopwatch;->stop()V

    .line 171
    .line 172
    .line 173
    if-eqz p1, :cond_a

    .line 174
    .line 175
    invoke-virtual {p0}, Ll/iug0;->a()V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_a
    invoke-virtual {p0}, Ll/iug0;->f()V

    .line 180
    .line 181
    .line 182
    :cond_b
    :goto_2
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/iug0;->d:Ll/ffg0;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v0, p0, Ll/ffg0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :try_start_1
    iput-boolean v0, p0, Ll/ffg0;->e:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/ffg0;->d:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object v1, p0, Ll/ffg0;->g:Ll/qwg0;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    monitor-exit p0

    .line 26
    throw v0

    .line 27
    :cond_1
    return-void
.end method

.method public final g()Lorg/json/JSONArray;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Lorg/json/JSONArray;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    :goto_0
    if-ge v2, v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    check-cast v3, Ll/tkg0;

    .line 28
    .line 29
    :try_start_0
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    new-instance v4, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v5, "step"

    .line 38
    .line 39
    iget-object v6, v3, Ll/tkg0;->a:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string v5, "percent"

    .line 45
    .line 46
    iget v6, v3, Ll/tkg0;->b:I

    .line 47
    .line 48
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    const-string v5, "extra"

    .line 52
    .line 53
    iget-object v6, v3, Ll/tkg0;->c:Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    const-string v5, "cost_time"

    .line 59
    .line 60
    iget-wide v6, v3, Ll/tkg0;->d:J

    .line 61
    .line 62
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string v5, "pause_cost_time"

    .line 66
    .line 67
    iget-wide v6, v3, Ll/tkg0;->e:J

    .line 68
    .line 69
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catch_0
    move-exception v3

    .line 77
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 78
    .line 79
    .line 80
    new-instance v4, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v5, "getStepsJSONArray fail:"

    .line 83
    .line 84
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v3}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v4, "LoadGameStatsManager"

    .line 99
    .line 100
    invoke-static {v4, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    return-object v0
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/iug0;->j:Ltech/sud/base/utils/SudStopwatch;

    .line 7
    .line 8
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->getElapsedTimeInMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Ll/ukg0;->o:Ljava/lang/Long;

    .line 17
    .line 18
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 19
    .line 20
    iget v1, p0, Ll/iug0;->n:I

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Ll/ukg0;->p:Ljava/lang/Integer;

    .line 27
    .line 28
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 29
    .line 30
    iget-object v1, p0, Ll/iug0;->l:Ltech/sud/base/utils/SudStopwatch;

    .line 31
    .line 32
    invoke-virtual {v1}, Ltech/sud/base/utils/SudStopwatch;->getElapsedTimeInMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Ll/ukg0;->q:Ljava/lang/Long;

    .line 41
    .line 42
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 43
    .line 44
    sget-object v1, Ll/lmg0;->e:Ljava/lang/String;

    .line 45
    .line 46
    sget-object v1, Ll/khg0;->a:Ll/lmg0;

    .line 47
    .line 48
    iget v1, v1, Ll/lmg0;->a:I

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    if-ne v1, v2, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v2, 0x2

    .line 55
    const/4 v3, 0x1

    .line 56
    if-ne v1, v2, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    if-ne v1, v3, :cond_3

    .line 60
    .line 61
    iget-boolean v1, p0, Ll/iug0;->r:Z

    .line 62
    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    :goto_0
    const/4 v3, 0x0

    .line 66
    :cond_3
    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Ll/ukg0;->r:Ljava/lang/Integer;

    .line 71
    .line 72
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/io/File;->getTotalSpace()J

    .line 83
    .line 84
    .line 85
    move-result-wide v2

    .line 86
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iput-object v2, v1, Ll/ukg0;->s:Ljava/lang/Long;

    .line 91
    .line 92
    iget-object v1, p0, Ll/iug0;->a:Ll/ukg0;

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/io/File;->getUsableSpace()J

    .line 95
    .line 96
    .line 97
    move-result-wide v2

    .line 98
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, v1, Ll/ukg0;->t:Ljava/lang/Long;

    .line 103
    .line 104
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ll/iug0;->d(Ll/ukg0;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 110
    .line 111
    iget-object v0, v0, Ll/ukg0;->a:Ljava/lang/String;

    .line 112
    .line 113
    const-string v1, "loadGameFinished"

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_4

    .line 120
    .line 121
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 122
    .line 123
    iput-object v1, v0, Ll/ukg0;->a:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v1}, Ll/fug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Ll/ukg0;->b:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-static {v1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Ll/ukg0;->c:Ljava/lang/String;

    .line 149
    .line 150
    :cond_4
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 151
    .line 152
    invoke-virtual {p0}, Ll/iug0;->g()Lorg/json/JSONArray;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    if-eqz v1, :cond_5

    .line 157
    .line 158
    iget-object v0, v0, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 159
    .line 160
    const-string v2, "loadGame"

    .line 161
    .line 162
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    :goto_2
    iget-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 170
    .line 171
    invoke-static {v0}, Ll/fug0;->b(Ll/ukg0;)V

    .line 172
    .line 173
    .line 174
    const/4 v0, 0x0

    .line 175
    iput-object v0, p0, Ll/iug0;->a:Ll/ukg0;

    .line 176
    .line 177
    iput-object v0, p0, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 178
    .line 179
    return-void
.end method
