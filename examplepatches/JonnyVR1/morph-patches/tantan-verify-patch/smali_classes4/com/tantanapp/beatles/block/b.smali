.class public Lcom/tantanapp/beatles/block/b;
.super Lcom/tantanapp/beatles/block/BlockBaseStrategy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/block/b$a;
    }
.end annotation


# instance fields
.field public volatile A:J

.field public volatile B:Z

.field public volatile C:Z

.field public x:Lcom/tantanapp/beatles/block/b$a;

.field public volatile y:Z

.field public volatile z:J


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;-><init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/tantanapp/beatles/block/b$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/tantanapp/beatles/block/b$a;-><init>(Lcom/tantanapp/beatles/block/b;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/b;->y:Z

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/b;->z:J

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/b;->A:J

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/b;->B:Z

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/b;->C:Z

    .line 24
    .line 25
    invoke-virtual {p2}, Ll/e43;->n()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->s:I

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/e43;->l()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t:I

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/b;->y:Z

    .line 3
    .line 4
    return-void
.end method

.method public l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Landroid/os/Message;)V
    .locals 9

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const-wide/16 v1, -0x1

    .line 5
    .line 6
    const/4 v3, 0x3

    .line 7
    if-eq p1, v3, :cond_8

    .line 8
    .line 9
    const/4 v3, 0x5

    .line 10
    const/4 v4, 0x4

    .line 11
    if-eq p1, v4, :cond_0

    .line 12
    .line 13
    if-eq p1, v3, :cond_1

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v5

    .line 21
    iget-wide v7, p0, Lcom/tantanapp/beatles/block/b;->A:J

    .line 22
    .line 23
    cmp-long p1, v5, v7

    .line 24
    .line 25
    if-ltz p1, :cond_7

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/b;->y:Z

    .line 28
    .line 29
    :cond_1
    iget-boolean p1, p0, Lcom/tantanapp/beatles/block/b;->y:Z

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_2
    invoke-static {}, Ll/du2;->t()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_c

    .line 40
    .line 41
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 42
    .line 43
    iget-wide v4, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 44
    .line 45
    cmp-long p1, v4, v1

    .line 46
    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    goto/16 :goto_2

    .line 50
    .line 51
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v4

    .line 55
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 56
    .line 57
    iget-wide v6, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 58
    .line 59
    cmp-long p1, v6, v1

    .line 60
    .line 61
    if-eqz p1, :cond_6

    .line 62
    .line 63
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 64
    .line 65
    iget-wide v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 66
    .line 67
    sub-long v0, v4, v0

    .line 68
    .line 69
    const-wide/16 v6, 0x3e8

    .line 70
    .line 71
    cmp-long p1, v0, v6

    .line 72
    .line 73
    if-gez p1, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/b;->l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c([Ljava/lang/StackTraceElement;)V

    .line 99
    .line 100
    .line 101
    iput-wide v4, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 102
    .line 103
    iget-object p1, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/tantanapp/beatles/block/b$a;->n()V

    .line 106
    .line 107
    .line 108
    iget-boolean p1, p0, Lcom/tantanapp/beatles/block/b;->y:Z

    .line 109
    .line 110
    if-eqz p1, :cond_c

    .line 111
    .line 112
    iget-object p1, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->b:Ljava/util/LinkedList;

    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/e43;->l()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/lit16 v0, v0, -0x3e8

    .line 127
    .line 128
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 129
    .line 130
    invoke-virtual {v1}, Ll/e43;->n()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    div-int/2addr v0, v1

    .line 135
    if-lt p1, v0, :cond_5

    .line 136
    .line 137
    goto/16 :goto_2

    .line 138
    .line 139
    :cond_5
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b:Landroid/os/Handler;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/e43;->n()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    int-to-long v0, p0

    .line 148
    invoke-virtual {p1, v3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_6
    :goto_0
    iget-object p0, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/b$a;->m()V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_7
    const/4 p1, 0x0

    .line 159
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/b;->y:Z

    .line 160
    .line 161
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/b;->A:J

    .line 162
    .line 163
    invoke-virtual {p0, v4, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r(IJ)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_8
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 168
    .line 169
    .line 170
    move-result-wide v4

    .line 171
    iget-wide v6, p0, Lcom/tantanapp/beatles/block/b;->z:J

    .line 172
    .line 173
    cmp-long p1, v4, v6

    .line 174
    .line 175
    if-ltz p1, :cond_d

    .line 176
    .line 177
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/b;->B:Z

    .line 178
    .line 179
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 180
    .line 181
    iget-wide v6, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 182
    .line 183
    cmp-long p1, v6, v1

    .line 184
    .line 185
    if-eqz p1, :cond_c

    .line 186
    .line 187
    invoke-static {}, Ll/du2;->t()Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-eqz p1, :cond_9

    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {p1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 207
    .line 208
    iget-wide v6, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 209
    .line 210
    cmp-long v0, v6, v1

    .line 211
    .line 212
    if-eqz v0, :cond_b

    .line 213
    .line 214
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 215
    .line 216
    iget-wide v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 217
    .line 218
    sub-long v0, v4, v0

    .line 219
    .line 220
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 221
    .line 222
    invoke-virtual {v2}, Ll/e43;->l()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    int-to-long v2, v2

    .line 227
    cmp-long v0, v0, v2

    .line 228
    .line 229
    if-gez v0, :cond_a

    .line 230
    .line 231
    goto :goto_1

    .line 232
    :cond_a
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/b;->l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-wide v4, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 243
    .line 244
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    invoke-virtual {v1}, Ll/zy0;->e()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c([Ljava/lang/StackTraceElement;)V

    .line 256
    .line 257
    .line 258
    sget-object p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->HIGH:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 259
    .line 260
    iput-object p1, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 261
    .line 262
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 263
    .line 264
    invoke-virtual {p1}, Ll/e43;->q()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    iget-object p0, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 272
    .line 273
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/b$a;->l(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :cond_b
    :goto_1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 278
    .line 279
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/b$a;->m()V

    .line 280
    .line 281
    .line 282
    :cond_c
    :goto_2
    return-void

    .line 283
    :cond_d
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/b;->z:J

    .line 284
    .line 285
    invoke-virtual {p0, v3, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r(IJ)V

    .line 286
    .line 287
    .line 288
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->v()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/beatles/block/b;->x:Lcom/tantanapp/beatles/block/b$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
