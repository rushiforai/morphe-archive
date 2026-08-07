.class public final Ll/ixx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public c:J

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:F

.field public j:F

.field public k:F

.field public l:J

.field public m:J

.field public n:J


# direct methods
.method public synthetic constructor <init>(FFJFJJFLl/dxx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p6, p0, Ll/ixx0;->a:J

    .line 5
    .line 6
    iput-wide p8, p0, Ll/ixx0;->b:J

    .line 7
    .line 8
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    iput-wide p1, p0, Ll/ixx0;->c:J

    .line 14
    .line 15
    iput-wide p1, p0, Ll/ixx0;->d:J

    .line 16
    .line 17
    iput-wide p1, p0, Ll/ixx0;->f:J

    .line 18
    .line 19
    iput-wide p1, p0, Ll/ixx0;->g:J

    .line 20
    .line 21
    const p3, 0x3f7851ec    # 0.97f

    .line 22
    .line 23
    .line 24
    iput p3, p0, Ll/ixx0;->j:F

    .line 25
    .line 26
    const p3, 0x3f83d70a    # 1.03f

    .line 27
    .line 28
    .line 29
    iput p3, p0, Ll/ixx0;->i:F

    .line 30
    .line 31
    const/high16 p3, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput p3, p0, Ll/ixx0;->k:F

    .line 34
    .line 35
    iput-wide p1, p0, Ll/ixx0;->l:J

    .line 36
    .line 37
    iput-wide p1, p0, Ll/ixx0;->e:J

    .line 38
    .line 39
    iput-wide p1, p0, Ll/ixx0;->h:J

    .line 40
    .line 41
    iput-wide p1, p0, Ll/ixx0;->m:J

    .line 42
    .line 43
    iput-wide p1, p0, Ll/ixx0;->n:J

    .line 44
    .line 45
    return-void
.end method

.method public static f(JJF)J
    .locals 0

    .line 1
    long-to-float p0, p0

    .line 2
    long-to-float p1, p2

    .line 3
    const p2, 0x3f7fbe77    # 0.999f

    .line 4
    .line 5
    .line 6
    mul-float/2addr p0, p2

    .line 7
    const p2, 0x3a831200    # 9.999871E-4f

    .line 8
    .line 9
    .line 10
    mul-float/2addr p1, p2

    .line 11
    add-float/2addr p0, p1

    .line 12
    float-to-long p0, p0

    .line 13
    return-wide p0
.end method


# virtual methods
.method public final a(JJ)F
    .locals 11

    .line 1
    iget-wide v0, p0, Ll/ixx0;->c:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-eqz v0, :cond_8

    .line 13
    .line 14
    sub-long p3, p1, p3

    .line 15
    .line 16
    iget-wide v4, p0, Ll/ixx0;->m:J

    .line 17
    .line 18
    cmp-long v0, v4, v2

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iput-wide p3, p0, Ll/ixx0;->m:J

    .line 23
    .line 24
    const-wide/16 p3, 0x0

    .line 25
    .line 26
    iput-wide p3, p0, Ll/ixx0;->n:J

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const v0, 0x3f7fbe77    # 0.999f

    .line 30
    .line 31
    .line 32
    invoke-static {v4, v5, p3, p4, v0}, Ll/ixx0;->f(JJF)J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    invoke-static {p3, p4, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    iput-wide v4, p0, Ll/ixx0;->m:J

    .line 41
    .line 42
    sub-long/2addr p3, v4

    .line 43
    invoke-static {p3, p4}, Ljava/lang/Math;->abs(J)J

    .line 44
    .line 45
    .line 46
    move-result-wide p3

    .line 47
    iget-wide v4, p0, Ll/ixx0;->n:J

    .line 48
    .line 49
    invoke-static {v4, v5, p3, p4, v0}, Ll/ixx0;->f(JJF)J

    .line 50
    .line 51
    .line 52
    move-result-wide p3

    .line 53
    iput-wide p3, p0, Ll/ixx0;->n:J

    .line 54
    .line 55
    :goto_0
    iget-wide p3, p0, Ll/ixx0;->l:J

    .line 56
    .line 57
    cmp-long p3, p3, v2

    .line 58
    .line 59
    const-wide/16 v4, 0x3e8

    .line 60
    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 64
    .line 65
    .line 66
    move-result-wide p3

    .line 67
    iget-wide v6, p0, Ll/ixx0;->l:J

    .line 68
    .line 69
    sub-long/2addr p3, v6

    .line 70
    cmp-long p3, p3, v4

    .line 71
    .line 72
    if-ltz p3, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    iget p0, p0, Ll/ixx0;->k:F

    .line 76
    .line 77
    return p0

    .line 78
    :cond_2
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 79
    .line 80
    .line 81
    move-result-wide p3

    .line 82
    iput-wide p3, p0, Ll/ixx0;->l:J

    .line 83
    .line 84
    iget-wide p3, p0, Ll/ixx0;->m:J

    .line 85
    .line 86
    iget-wide v6, p0, Ll/ixx0;->n:J

    .line 87
    .line 88
    const-wide/16 v8, 0x3

    .line 89
    .line 90
    mul-long/2addr v6, v8

    .line 91
    add-long/2addr p3, v6

    .line 92
    iget-wide v6, p0, Ll/ixx0;->h:J

    .line 93
    .line 94
    cmp-long v0, v6, p3

    .line 95
    .line 96
    const v6, 0x33d6bf95    # 1.0E-7f

    .line 97
    .line 98
    .line 99
    const/high16 v7, -0x40800000    # -1.0f

    .line 100
    .line 101
    if-lez v0, :cond_5

    .line 102
    .line 103
    invoke-static {v4, v5}, Ll/mpw0;->F(J)J

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    iget v0, p0, Ll/ixx0;->k:F

    .line 108
    .line 109
    add-float/2addr v0, v7

    .line 110
    iget v4, p0, Ll/ixx0;->i:F

    .line 111
    .line 112
    add-float/2addr v4, v7

    .line 113
    iget-wide v7, p0, Ll/ixx0;->e:J

    .line 114
    .line 115
    iget-wide v9, p0, Ll/ixx0;->h:J

    .line 116
    .line 117
    long-to-float v2, v2

    .line 118
    mul-float/2addr v4, v2

    .line 119
    mul-float/2addr v0, v2

    .line 120
    float-to-long v2, v0

    .line 121
    float-to-long v4, v4

    .line 122
    add-long/2addr v2, v4

    .line 123
    sub-long/2addr v9, v2

    .line 124
    const/4 v0, 0x3

    .line 125
    new-array v2, v0, [J

    .line 126
    .line 127
    const/4 v3, 0x0

    .line 128
    aput-wide p3, v2, v3

    .line 129
    .line 130
    const/4 p3, 0x1

    .line 131
    aput-wide v7, v2, p3

    .line 132
    .line 133
    const/4 p4, 0x2

    .line 134
    aput-wide v9, v2, p4

    .line 135
    .line 136
    aget-wide v3, v2, v3

    .line 137
    .line 138
    :goto_2
    if-ge p3, v0, :cond_4

    .line 139
    .line 140
    aget-wide v7, v2, p3

    .line 141
    .line 142
    cmp-long p4, v7, v3

    .line 143
    .line 144
    if-gtz p4, :cond_3

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_3
    move-wide v3, v7

    .line 148
    :goto_3
    add-int/lit8 p3, p3, 0x1

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_4
    iput-wide v3, p0, Ll/ixx0;->h:J

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_5
    iget v0, p0, Ll/ixx0;->k:F

    .line 155
    .line 156
    add-float/2addr v0, v7

    .line 157
    const/4 v4, 0x0

    .line 158
    invoke-static {v4, v0}, Ljava/lang/Math;->max(FF)F

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    div-float/2addr v0, v6

    .line 163
    float-to-long v4, v0

    .line 164
    sub-long v4, p1, v4

    .line 165
    .line 166
    iget-wide v7, p0, Ll/ixx0;->h:J

    .line 167
    .line 168
    invoke-static {v4, v5, p3, p4}, Ljava/lang/Math;->min(JJ)J

    .line 169
    .line 170
    .line 171
    move-result-wide p3

    .line 172
    invoke-static {v7, v8, p3, p4}, Ljava/lang/Math;->max(JJ)J

    .line 173
    .line 174
    .line 175
    move-result-wide p3

    .line 176
    iput-wide p3, p0, Ll/ixx0;->h:J

    .line 177
    .line 178
    iget-wide v4, p0, Ll/ixx0;->g:J

    .line 179
    .line 180
    cmp-long v0, v4, v2

    .line 181
    .line 182
    if-eqz v0, :cond_6

    .line 183
    .line 184
    cmp-long v0, p3, v4

    .line 185
    .line 186
    if-lez v0, :cond_6

    .line 187
    .line 188
    iput-wide v4, p0, Ll/ixx0;->h:J

    .line 189
    .line 190
    move-wide v3, v4

    .line 191
    goto :goto_4

    .line 192
    :cond_6
    move-wide v3, p3

    .line 193
    :goto_4
    sub-long/2addr p1, v3

    .line 194
    iget-wide p3, p0, Ll/ixx0;->a:J

    .line 195
    .line 196
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    .line 197
    .line 198
    .line 199
    move-result-wide v2

    .line 200
    cmp-long p3, v2, p3

    .line 201
    .line 202
    if-gez p3, :cond_7

    .line 203
    .line 204
    iput v1, p0, Ll/ixx0;->k:F

    .line 205
    .line 206
    return v1

    .line 207
    :cond_7
    long-to-float p1, p1

    .line 208
    mul-float/2addr p1, v6

    .line 209
    add-float/2addr p1, v1

    .line 210
    iget p2, p0, Ll/ixx0;->j:F

    .line 211
    .line 212
    iget p3, p0, Ll/ixx0;->i:F

    .line 213
    .line 214
    invoke-static {p1, p3}, Ljava/lang/Math;->min(FF)F

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    iput p1, p0, Ll/ixx0;->k:F

    .line 223
    .line 224
    return p1

    .line 225
    :cond_8
    return v1
.end method

.method public final b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ixx0;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final c()V
    .locals 7

    .line 1
    iget-wide v0, p0, Ll/ixx0;->h:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-nez v4, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-wide v4, p0, Ll/ixx0;->b:J

    .line 14
    .line 15
    add-long/2addr v0, v4

    .line 16
    iput-wide v0, p0, Ll/ixx0;->h:J

    .line 17
    .line 18
    iget-wide v4, p0, Ll/ixx0;->g:J

    .line 19
    .line 20
    cmp-long v6, v4, v2

    .line 21
    .line 22
    if-eqz v6, :cond_1

    .line 23
    .line 24
    cmp-long v0, v0, v4

    .line 25
    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    iput-wide v4, p0, Ll/ixx0;->h:J

    .line 29
    .line 30
    :cond_1
    iput-wide v2, p0, Ll/ixx0;->l:J

    .line 31
    .line 32
    return-void
.end method

.method public final d(Ll/jfs0;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Ll/jfs0;->a:J

    .line 2
    .line 3
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    iput-wide v2, p0, Ll/ixx0;->c:J

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    iput-wide v2, p0, Ll/ixx0;->f:J

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Ll/ixx0;->g:J

    .line 25
    .line 26
    const p1, 0x3f7851ec    # 0.97f

    .line 27
    .line 28
    .line 29
    iput p1, p0, Ll/ixx0;->j:F

    .line 30
    .line 31
    const p1, 0x3f83d70a    # 1.03f

    .line 32
    .line 33
    .line 34
    iput p1, p0, Ll/ixx0;->i:F

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ixx0;->g()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final e(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ixx0;->d:J

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ixx0;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g()V
    .locals 7

    .line 1
    iget-wide v0, p0, Ll/ixx0;->c:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-eqz v4, :cond_2

    .line 11
    .line 12
    iget-wide v4, p0, Ll/ixx0;->d:J

    .line 13
    .line 14
    cmp-long v6, v4, v2

    .line 15
    .line 16
    if-nez v6, :cond_3

    .line 17
    .line 18
    iget-wide v4, p0, Ll/ixx0;->f:J

    .line 19
    .line 20
    cmp-long v6, v4, v2

    .line 21
    .line 22
    if-eqz v6, :cond_0

    .line 23
    .line 24
    cmp-long v6, v0, v4

    .line 25
    .line 26
    if-gez v6, :cond_0

    .line 27
    .line 28
    move-wide v0, v4

    .line 29
    :cond_0
    iget-wide v4, p0, Ll/ixx0;->g:J

    .line 30
    .line 31
    cmp-long v6, v4, v2

    .line 32
    .line 33
    if-eqz v6, :cond_1

    .line 34
    .line 35
    cmp-long v6, v0, v4

    .line 36
    .line 37
    if-lez v6, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move-wide v4, v0

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    move-wide v4, v2

    .line 43
    :cond_3
    :goto_0
    iget-wide v0, p0, Ll/ixx0;->e:J

    .line 44
    .line 45
    cmp-long v0, v0, v4

    .line 46
    .line 47
    if-nez v0, :cond_4

    .line 48
    .line 49
    return-void

    .line 50
    :cond_4
    iput-wide v4, p0, Ll/ixx0;->e:J

    .line 51
    .line 52
    iput-wide v4, p0, Ll/ixx0;->h:J

    .line 53
    .line 54
    iput-wide v2, p0, Ll/ixx0;->m:J

    .line 55
    .line 56
    iput-wide v2, p0, Ll/ixx0;->n:J

    .line 57
    .line 58
    iput-wide v2, p0, Ll/ixx0;->l:J

    .line 59
    .line 60
    return-void
.end method
