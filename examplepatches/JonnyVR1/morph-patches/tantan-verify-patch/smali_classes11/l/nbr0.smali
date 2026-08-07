.class public final Ll/nbr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/mbr0;

.field public final b:Ll/vbr0;

.field public c:Z

.field public d:I

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:F

.field public j:Ll/mfv0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/mbr0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/nbr0;->a:Ll/mbr0;

    .line 5
    .line 6
    new-instance p2, Ll/vbr0;

    .line 7
    .line 8
    invoke-direct {p2, p1}, Ll/vbr0;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Ll/nbr0;->d:I

    .line 15
    .line 16
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    iput-wide p1, p0, Ll/nbr0;->e:J

    .line 22
    .line 23
    iput-wide p1, p0, Ll/nbr0;->g:J

    .line 24
    .line 25
    iput-wide p1, p0, Ll/nbr0;->h:J

    .line 26
    .line 27
    const/high16 p1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    iput p1, p0, Ll/nbr0;->i:F

    .line 30
    .line 31
    sget-object p1, Ll/mfv0;->a:Ll/mfv0;

    .line 32
    .line 33
    iput-object p1, p0, Ll/nbr0;->j:Ll/mfv0;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a(JJJJZLl/lbr0;)I
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v4, p3

    .line 6
    .line 7
    move-object/from16 v10, p10

    .line 8
    .line 9
    invoke-static {v10}, Ll/lbr0;->g(Ll/lbr0;)V

    .line 10
    .line 11
    .line 12
    iget-wide v6, v0, Ll/nbr0;->e:J

    .line 13
    .line 14
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    cmp-long v3, v6, v8

    .line 20
    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    iput-wide v4, v0, Ll/nbr0;->e:J

    .line 24
    .line 25
    :cond_0
    iget-wide v6, v0, Ll/nbr0;->g:J

    .line 26
    .line 27
    cmp-long v3, v6, v1

    .line 28
    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    iget-object v3, v0, Ll/nbr0;->b:Ll/vbr0;

    .line 32
    .line 33
    invoke-virtual {v3, v1, v2}, Ll/vbr0;->d(J)V

    .line 34
    .line 35
    .line 36
    iput-wide v1, v0, Ll/nbr0;->g:J

    .line 37
    .line 38
    :cond_1
    sub-long/2addr v1, v4

    .line 39
    iget v3, v0, Ll/nbr0;->i:F

    .line 40
    .line 41
    float-to-double v6, v3

    .line 42
    iget-boolean v3, v0, Ll/nbr0;->c:Z

    .line 43
    .line 44
    long-to-double v1, v1

    .line 45
    div-double/2addr v1, v6

    .line 46
    double-to-long v1, v1

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 50
    .line 51
    .line 52
    move-result-wide v6

    .line 53
    invoke-static {v6, v7}, Ll/mpw0;->F(J)J

    .line 54
    .line 55
    .line 56
    move-result-wide v6

    .line 57
    sub-long v6, v6, p5

    .line 58
    .line 59
    sub-long/2addr v1, v6

    .line 60
    :cond_2
    invoke-static {v10, v1, v2}, Ll/lbr0;->e(Ll/lbr0;J)V

    .line 61
    .line 62
    .line 63
    invoke-static {v10}, Ll/lbr0;->a(Ll/lbr0;)J

    .line 64
    .line 65
    .line 66
    move-result-wide v1

    .line 67
    iget-wide v6, v0, Ll/nbr0;->h:J

    .line 68
    .line 69
    cmp-long v3, v6, v8

    .line 70
    .line 71
    const/4 v11, 0x3

    .line 72
    const/4 v12, 0x2

    .line 73
    const/4 v13, 0x1

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    const/16 p1, 0x0

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    iget v3, v0, Ll/nbr0;->d:I

    .line 80
    .line 81
    if-eqz v3, :cond_7

    .line 82
    .line 83
    if-eq v3, v13, :cond_6

    .line 84
    .line 85
    if-eq v3, v12, :cond_5

    .line 86
    .line 87
    if-ne v3, v11, :cond_4

    .line 88
    .line 89
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 90
    .line 91
    .line 92
    move-result-wide v14

    .line 93
    invoke-static {v14, v15}, Ll/mpw0;->F(J)J

    .line 94
    .line 95
    .line 96
    move-result-wide v14

    .line 97
    const/16 p1, 0x0

    .line 98
    .line 99
    iget-wide v6, v0, Ll/nbr0;->f:J

    .line 100
    .line 101
    sub-long/2addr v14, v6

    .line 102
    iget-boolean v3, v0, Ll/nbr0;->c:Z

    .line 103
    .line 104
    if-eqz v3, :cond_8

    .line 105
    .line 106
    iget-object v3, v0, Ll/nbr0;->a:Ll/mbr0;

    .line 107
    .line 108
    invoke-interface {v3, v1, v2, v14, v15}, Ll/mbr0;->i(JJ)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_8

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    invoke-static {}, Ll/wpg0;->a()V

    .line 116
    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    return v0

    .line 120
    :cond_5
    const/16 p1, 0x0

    .line 121
    .line 122
    cmp-long v1, v4, p7

    .line 123
    .line 124
    if-ltz v1, :cond_8

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_6
    const/16 p1, 0x0

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_7
    const/16 p1, 0x0

    .line 131
    .line 132
    iget-boolean v1, v0, Ll/nbr0;->c:Z

    .line 133
    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    :goto_0
    return p1

    .line 137
    :cond_8
    :goto_1
    iget-boolean v1, v0, Ll/nbr0;->c:Z

    .line 138
    .line 139
    const/4 v14, 0x5

    .line 140
    if-eqz v1, :cond_f

    .line 141
    .line 142
    iget-wide v1, v0, Ll/nbr0;->e:J

    .line 143
    .line 144
    cmp-long v1, v4, v1

    .line 145
    .line 146
    if-nez v1, :cond_9

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_9
    iget-object v1, v0, Ll/nbr0;->b:Ll/vbr0;

    .line 150
    .line 151
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 152
    .line 153
    .line 154
    move-result-wide v2

    .line 155
    invoke-static {v10}, Ll/lbr0;->a(Ll/lbr0;)J

    .line 156
    .line 157
    .line 158
    move-result-wide v6

    .line 159
    const-wide/16 v15, 0x3e8

    .line 160
    .line 161
    mul-long/2addr v6, v15

    .line 162
    add-long/2addr v6, v2

    .line 163
    invoke-virtual {v1, v6, v7}, Ll/vbr0;->a(J)J

    .line 164
    .line 165
    .line 166
    move-result-wide v6

    .line 167
    invoke-static {v10, v6, v7}, Ll/lbr0;->f(Ll/lbr0;J)V

    .line 168
    .line 169
    .line 170
    invoke-static {v10}, Ll/lbr0;->b(Ll/lbr0;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v6

    .line 174
    sub-long/2addr v6, v2

    .line 175
    div-long/2addr v6, v15

    .line 176
    invoke-static {v10, v6, v7}, Ll/lbr0;->e(Ll/lbr0;J)V

    .line 177
    .line 178
    .line 179
    iget-wide v1, v0, Ll/nbr0;->h:J

    .line 180
    .line 181
    cmp-long v1, v1, v8

    .line 182
    .line 183
    if-eqz v1, :cond_a

    .line 184
    .line 185
    move v9, v13

    .line 186
    goto :goto_2

    .line 187
    :cond_a
    move/from16 v9, p1

    .line 188
    .line 189
    :goto_2
    iget-object v1, v0, Ll/nbr0;->a:Ll/mbr0;

    .line 190
    .line 191
    invoke-static {v10}, Ll/lbr0;->a(Ll/lbr0;)J

    .line 192
    .line 193
    .line 194
    move-result-wide v2

    .line 195
    move-wide/from16 v6, p5

    .line 196
    .line 197
    move/from16 v8, p9

    .line 198
    .line 199
    invoke-interface/range {v1 .. v9}, Ll/mbr0;->j(JJJZZ)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_b

    .line 204
    .line 205
    const/4 v0, 0x4

    .line 206
    return v0

    .line 207
    :cond_b
    iget-object v2, v0, Ll/nbr0;->a:Ll/mbr0;

    .line 208
    .line 209
    invoke-static {v10}, Ll/lbr0;->a(Ll/lbr0;)J

    .line 210
    .line 211
    .line 212
    move-result-wide v3

    .line 213
    move-wide/from16 v5, p5

    .line 214
    .line 215
    move/from16 v7, p9

    .line 216
    .line 217
    invoke-interface/range {v2 .. v7}, Ll/mbr0;->x(JJZ)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-eqz v0, :cond_d

    .line 222
    .line 223
    if-eqz v9, :cond_c

    .line 224
    .line 225
    return v11

    .line 226
    :cond_c
    return v12

    .line 227
    :cond_d
    invoke-static {v10}, Ll/lbr0;->a(Ll/lbr0;)J

    .line 228
    .line 229
    .line 230
    move-result-wide v0

    .line 231
    const-wide/32 v2, 0xc350

    .line 232
    .line 233
    .line 234
    cmp-long v0, v0, v2

    .line 235
    .line 236
    if-lez v0, :cond_e

    .line 237
    .line 238
    return v14

    .line 239
    :cond_e
    return v13

    .line 240
    :cond_f
    :goto_3
    return v14
.end method

.method public final b()V
    .locals 1

    .line 1
    iget v0, p0, Ll/nbr0;->d:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput v0, p0, Ll/nbr0;->d:I

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final c()V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    iput-wide v0, p0, Ll/nbr0;->h:J

    .line 7
    .line 8
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/nbr0;->q(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final e(Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/nbr0;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/nbr0;->q(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/nbr0;->c:Z

    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Ll/nbr0;->f:J

    .line 13
    .line 14
    iget-object p0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/vbr0;->g()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/nbr0;->c:Z

    .line 3
    .line 4
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide v0, p0, Ll/nbr0;->h:J

    .line 10
    .line 11
    iget-object p0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vbr0;->h()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vbr0;->f()V

    .line 4
    .line 5
    .line 6
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    iput-wide v0, p0, Ll/nbr0;->g:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/nbr0;->e:J

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {p0, v2}, Ll/nbr0;->q(I)V

    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Ll/nbr0;->h:J

    .line 20
    .line 21
    return-void
.end method

.method public final j(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vbr0;->j(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final k(Ll/mfv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nbr0;->j:Ll/mfv0;

    .line 2
    .line 3
    return-void
.end method

.method public final l(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vbr0;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m(Landroid/view/Surface;)V
    .locals 1
    .param p1    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/vbr0;->i(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Ll/nbr0;->q(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final n(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/nbr0;->i:F

    .line 2
    .line 3
    iget-object p0, p0, Ll/nbr0;->b:Ll/vbr0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/vbr0;->e(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final o(Z)Z
    .locals 8

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget p1, p0, Ll/nbr0;->d:I

    .line 10
    .line 11
    const/4 v3, 0x3

    .line 12
    if-ne p1, v3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-wide v3, p0, Ll/nbr0;->h:J

    .line 16
    .line 17
    cmp-long p1, v3, v0

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v4

    .line 26
    iget-wide v6, p0, Ll/nbr0;->h:J

    .line 27
    .line 28
    cmp-long p1, v4, v6

    .line 29
    .line 30
    if-ltz p1, :cond_1

    .line 31
    .line 32
    move v2, v3

    .line 33
    :goto_0
    iput-wide v0, p0, Ll/nbr0;->h:J

    .line 34
    .line 35
    :cond_1
    return v2

    .line 36
    :cond_2
    return v3
.end method

.method public final p()Z
    .locals 4

    .line 1
    iget v0, p0, Ll/nbr0;->d:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    iput v1, p0, Ll/nbr0;->d:I

    .line 5
    .line 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    invoke-static {v2, v3}, Ll/mpw0;->F(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iput-wide v2, p0, Ll/nbr0;->f:J

    .line 15
    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final q(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/nbr0;->d:I

    .line 2
    .line 3
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/nbr0;->d:I

    .line 8
    .line 9
    return-void
.end method
