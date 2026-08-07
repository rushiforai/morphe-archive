.class public final Ll/ytr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/nnw0;

.field public final b:Ll/bgw0;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:J

.field public g:J

.field public h:J


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/nnw0;

    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-direct {p1, v0, v1}, Ll/nnw0;-><init>(J)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/ytr0;->a:Ll/nnw0;

    .line 12
    .line 13
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    iput-wide v0, p0, Ll/ytr0;->f:J

    .line 19
    .line 20
    iput-wide v0, p0, Ll/ytr0;->g:J

    .line 21
    .line 22
    iput-wide v0, p0, Ll/ytr0;->h:J

    .line 23
    .line 24
    new-instance p1, Ll/bgw0;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;Ll/yfr0;I)I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gtz p3, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ytr0;->e(Ll/qer0;)I

    .line 5
    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    iget-boolean v1, p0, Ll/ytr0;->e:Z

    .line 9
    .line 10
    const/16 v2, 0x47

    .line 11
    .line 12
    const-wide/32 v3, 0x1b8a0

    .line 13
    .line 14
    .line 15
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    const/4 v7, 0x1

    .line 21
    if-nez v1, :cond_7

    .line 22
    .line 23
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 24
    .line 25
    .line 26
    move-result-wide v8

    .line 27
    invoke-static {v3, v4, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    long-to-int v1, v3

    .line 32
    int-to-long v3, v1

    .line 33
    sub-long/2addr v8, v3

    .line 34
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    cmp-long v3, v3, v8

    .line 39
    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    iput-wide v8, p2, Ll/yfr0;->a:J

    .line 43
    .line 44
    return v7

    .line 45
    :cond_1
    iget-object p2, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 46
    .line 47
    invoke-virtual {p2, v1}, Ll/bgw0;->h(I)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p1, Ll/fer0;

    .line 60
    .line 61
    invoke-virtual {p1, p2, v0, v1, v0}, Ll/fer0;->c([BIIZ)Z

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    add-int/lit16 v3, v1, -0xbc

    .line 75
    .line 76
    :goto_0
    if-lt v3, p2, :cond_6

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    const/4 v8, -0x4

    .line 83
    move v9, v0

    .line 84
    :goto_1
    const/4 v10, 0x4

    .line 85
    if-gt v8, v10, :cond_5

    .line 86
    .line 87
    mul-int/lit16 v10, v8, 0xbc

    .line 88
    .line 89
    add-int/2addr v10, v3

    .line 90
    if-lt v10, p2, :cond_2

    .line 91
    .line 92
    if-ge v10, v1, :cond_2

    .line 93
    .line 94
    aget-byte v10, v4, v10

    .line 95
    .line 96
    if-eq v10, v2, :cond_3

    .line 97
    .line 98
    :cond_2
    move v9, v0

    .line 99
    goto :goto_2

    .line 100
    :cond_3
    add-int/2addr v9, v7

    .line 101
    const/4 v10, 0x5

    .line 102
    if-ne v9, v10, :cond_4

    .line 103
    .line 104
    invoke-static {p1, v3, p3}, Ll/iur0;->b(Ll/bgw0;II)J

    .line 105
    .line 106
    .line 107
    move-result-wide v8

    .line 108
    cmp-long v4, v8, v5

    .line 109
    .line 110
    if-eqz v4, :cond_5

    .line 111
    .line 112
    move-wide v5, v8

    .line 113
    goto :goto_3

    .line 114
    :cond_4
    :goto_2
    add-int/lit8 v8, v8, 0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_5
    add-int/lit8 v3, v3, -0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_6
    :goto_3
    iput-wide v5, p0, Ll/ytr0;->g:J

    .line 121
    .line 122
    iput-boolean v7, p0, Ll/ytr0;->e:Z

    .line 123
    .line 124
    return v0

    .line 125
    :cond_7
    iget-wide v8, p0, Ll/ytr0;->g:J

    .line 126
    .line 127
    cmp-long v1, v8, v5

    .line 128
    .line 129
    if-nez v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Ll/ytr0;->e(Ll/qer0;)I

    .line 132
    .line 133
    .line 134
    return v0

    .line 135
    :cond_8
    iget-boolean v1, p0, Ll/ytr0;->d:Z

    .line 136
    .line 137
    if-nez v1, :cond_d

    .line 138
    .line 139
    invoke-interface {p1}, Ll/qer0;->zzd()J

    .line 140
    .line 141
    .line 142
    move-result-wide v8

    .line 143
    invoke-static {v3, v4, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 144
    .line 145
    .line 146
    move-result-wide v3

    .line 147
    long-to-int v1, v3

    .line 148
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 149
    .line 150
    .line 151
    move-result-wide v3

    .line 152
    const-wide/16 v8, 0x0

    .line 153
    .line 154
    cmp-long v3, v3, v8

    .line 155
    .line 156
    if-eqz v3, :cond_9

    .line 157
    .line 158
    iput-wide v8, p2, Ll/yfr0;->a:J

    .line 159
    .line 160
    return v7

    .line 161
    :cond_9
    iget-object p2, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 162
    .line 163
    invoke-virtual {p2, v1}, Ll/bgw0;->h(I)V

    .line 164
    .line 165
    .line 166
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 167
    .line 168
    .line 169
    iget-object p2, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 170
    .line 171
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    check-cast p1, Ll/fer0;

    .line 176
    .line 177
    invoke-virtual {p1, p2, v0, v1, v0}, Ll/fer0;->c([BIIZ)Z

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 181
    .line 182
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    :goto_4
    if-ge p2, v1, :cond_c

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    aget-byte v3, v3, p2

    .line 197
    .line 198
    if-eq v3, v2, :cond_a

    .line 199
    .line 200
    goto :goto_5

    .line 201
    :cond_a
    invoke-static {p1, p2, p3}, Ll/iur0;->b(Ll/bgw0;II)J

    .line 202
    .line 203
    .line 204
    move-result-wide v3

    .line 205
    cmp-long v8, v3, v5

    .line 206
    .line 207
    if-eqz v8, :cond_b

    .line 208
    .line 209
    move-wide v5, v3

    .line 210
    goto :goto_6

    .line 211
    :cond_b
    :goto_5
    add-int/lit8 p2, p2, 0x1

    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_c
    :goto_6
    iput-wide v5, p0, Ll/ytr0;->f:J

    .line 215
    .line 216
    iput-boolean v7, p0, Ll/ytr0;->d:Z

    .line 217
    .line 218
    return v0

    .line 219
    :cond_d
    iget-wide p2, p0, Ll/ytr0;->f:J

    .line 220
    .line 221
    cmp-long v1, p2, v5

    .line 222
    .line 223
    if-nez v1, :cond_e

    .line 224
    .line 225
    invoke-virtual {p0, p1}, Ll/ytr0;->e(Ll/qer0;)I

    .line 226
    .line 227
    .line 228
    return v0

    .line 229
    :cond_e
    iget-object v1, p0, Ll/ytr0;->a:Ll/nnw0;

    .line 230
    .line 231
    invoke-virtual {v1, p2, p3}, Ll/nnw0;->b(J)J

    .line 232
    .line 233
    .line 234
    move-result-wide p2

    .line 235
    iget-wide v2, p0, Ll/ytr0;->g:J

    .line 236
    .line 237
    invoke-virtual {v1, v2, v3}, Ll/nnw0;->c(J)J

    .line 238
    .line 239
    .line 240
    move-result-wide v1

    .line 241
    sub-long/2addr v1, p2

    .line 242
    iput-wide v1, p0, Ll/ytr0;->h:J

    .line 243
    .line 244
    invoke-virtual {p0, p1}, Ll/ytr0;->e(Ll/qer0;)I

    .line 245
    .line 246
    .line 247
    return v0
.end method

.method public final b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ytr0;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final c()Ll/nnw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ytr0;->a:Ll/nnw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ytr0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e(Ll/qer0;)I
    .locals 3

    .line 1
    sget-object v0, Ll/mpw0;->f:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget-object v1, p0, Ll/ytr0;->b:Ll/bgw0;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v1, v0, v2}, Ll/bgw0;->i([BI)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/ytr0;->c:Z

    .line 12
    .line 13
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 14
    .line 15
    .line 16
    return v2
.end method
