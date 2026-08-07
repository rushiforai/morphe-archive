.class public Lcom/tantanapp/beatles/block/a;
.super Lcom/tantanapp/beatles/block/BlockBaseStrategy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/block/a$a;
    }
.end annotation


# instance fields
.field public volatile A:Z

.field public B:Lcom/tantanapp/beatles/block/a$a;

.field public volatile x:J

.field public volatile y:J

.field public volatile z:Z


# direct methods
.method public constructor <init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;-><init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/a;->x:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/a;->y:J

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/a;->z:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/a;->A:Z

    .line 14
    .line 15
    new-instance p1, Lcom/tantanapp/beatles/block/a$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/tantanapp/beatles/block/a$a;-><init>(Lcom/tantanapp/beatles/block/a;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/tantanapp/beatles/block/a;->B:Lcom/tantanapp/beatles/block/a$a;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/e43;->p()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->s:I

    .line 27
    .line 28
    invoke-virtual {p2}, Ll/e43;->l()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t:I

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->a(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic b(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic c(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic d(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic j()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/a;->B:Lcom/tantanapp/beatles/block/a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic n()Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->n()Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o(Landroid/os/Message;)V
    .locals 8

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
    if-eq p1, v3, :cond_4

    .line 8
    .line 9
    const/4 v3, 0x4

    .line 10
    if-eq p1, v3, :cond_0

    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    iget-wide v6, p0, Lcom/tantanapp/beatles/block/a;->x:J

    .line 19
    .line 20
    cmp-long p1, v4, v6

    .line 21
    .line 22
    if-ltz p1, :cond_3

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/a;->z:Z

    .line 25
    .line 26
    invoke-static {}, Ll/du2;->t()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_7

    .line 31
    .line 32
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 33
    .line 34
    iget-wide v6, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 35
    .line 36
    cmp-long p1, v6, v1

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 55
    .line 56
    iget-wide v6, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 57
    .line 58
    cmp-long v0, v6, v1

    .line 59
    .line 60
    if-eqz v0, :cond_7

    .line 61
    .line 62
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 63
    .line 64
    iget-wide v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 65
    .line 66
    sub-long v0, v4, v0

    .line 67
    .line 68
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 69
    .line 70
    invoke-virtual {v2}, Ll/e43;->l()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    int-to-long v2, v2

    .line 75
    cmp-long v0, v0, v2

    .line 76
    .line 77
    if-gez v0, :cond_2

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_2
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/a;->l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-wide v4, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b:J

    .line 92
    .line 93
    sget-object v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->HIGH:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 94
    .line 95
    iput-object v1, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c([Ljava/lang/StackTraceElement;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 101
    .line 102
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 103
    .line 104
    invoke-static {p1}, Ll/e1g0;->a([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {v1, v2, v3, p1}, Lcom/tantanapp/beatles/block/MessageHelper;->a(JLjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/zy0;->e()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 123
    .line 124
    invoke-virtual {p1}, Ll/e43;->q()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/tantanapp/beatles/block/a;->B:Lcom/tantanapp/beatles/block/a$a;

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/a$a;->l(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_3
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/a;->x:J

    .line 138
    .line 139
    invoke-virtual {p0, v3, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r(IJ)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 144
    .line 145
    .line 146
    move-result-wide v4

    .line 147
    iget-wide v6, p0, Lcom/tantanapp/beatles/block/a;->y:J

    .line 148
    .line 149
    cmp-long p1, v4, v6

    .line 150
    .line 151
    if-ltz p1, :cond_8

    .line 152
    .line 153
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/a;->A:Z

    .line 154
    .line 155
    invoke-static {}, Ll/du2;->t()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-nez p1, :cond_7

    .line 160
    .line 161
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 162
    .line 163
    iget-wide v6, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 164
    .line 165
    cmp-long p1, v6, v1

    .line 166
    .line 167
    if-nez p1, :cond_5

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 183
    .line 184
    iget-wide v6, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 185
    .line 186
    cmp-long v0, v6, v1

    .line 187
    .line 188
    if-eqz v0, :cond_7

    .line 189
    .line 190
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 191
    .line 192
    iget-wide v0, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 193
    .line 194
    sub-long/2addr v4, v0

    .line 195
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 196
    .line 197
    invoke-virtual {v0}, Ll/e43;->m()I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    int-to-long v0, v0

    .line 202
    cmp-long v0, v4, v0

    .line 203
    .line 204
    if-gez v0, :cond_6

    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_6
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/a;->l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->k(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    sget-object v1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;->LOW:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 218
    .line 219
    iput-object v1, v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e:Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;

    .line 220
    .line 221
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->c([Ljava/lang/StackTraceElement;)V

    .line 222
    .line 223
    .line 224
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 225
    .line 226
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 227
    .line 228
    invoke-static {p1}, Ll/e1g0;->a([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {v1, v2, v3, p1}, Lcom/tantanapp/beatles/block/MessageHelper;->a(JLjava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p1}, Ll/zy0;->e()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->b(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 247
    .line 248
    invoke-virtual {p1}, Ll/e43;->q()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {v0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->d(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Lcom/tantanapp/beatles/block/a;->B:Lcom/tantanapp/beatles/block/a$a;

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/a$a;->l(Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;)V

    .line 258
    .line 259
    .line 260
    :cond_7
    :goto_0
    return-void

    .line 261
    :cond_8
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/a;->y:J

    .line 262
    .line 263
    invoke-virtual {p0, v3, v0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r(IJ)V

    .line 264
    .line 265
    .line 266
    return-void
.end method

.method public bridge synthetic onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->onActivityDestroyed(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->onActivityStarted(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->onActivityStopped(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic s()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic t()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->u(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 5
    .line 6
    iget-wide v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 7
    .line 8
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/e43;->l()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    int-to-long v2, p1

    .line 15
    add-long/2addr v0, v2

    .line 16
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/a;->x:J

    .line 17
    .line 18
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 19
    .line 20
    iget-wide v0, p1, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->a:J

    .line 21
    .line 22
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/e43;->m()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-long v2, p1

    .line 29
    add-long/2addr v0, v2

    .line 30
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/a;->y:J

    .line 31
    .line 32
    iget-boolean p1, p0, Lcom/tantanapp/beatles/block/a;->A:Z

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 p1, 0x3

    .line 38
    iget-wide v1, p0, Lcom/tantanapp/beatles/block/a;->y:J

    .line 39
    .line 40
    invoke-virtual {p0, p1, v1, v2}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r(IJ)V

    .line 41
    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/a;->A:Z

    .line 44
    .line 45
    :cond_0
    iget-boolean p1, p0, Lcom/tantanapp/beatles/block/a;->z:Z

    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    const/4 p1, 0x4

    .line 50
    iget-wide v1, p0, Lcom/tantanapp/beatles/block/a;->x:J

    .line 51
    .line 52
    invoke-virtual {p0, p1, v1, v2}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r(IJ)V

    .line 53
    .line 54
    .line 55
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/a;->z:Z

    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->v()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/beatles/block/a;->B:Lcom/tantanapp/beatles/block/a$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
