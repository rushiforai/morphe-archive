.class public final Ll/wmr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/sgr0;

.field public final b:Ll/jnr0;

.field public final c:Ll/bgw0;

.field public d:Ll/knr0;

.field public e:Ll/imr0;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public final j:Ll/bgw0;

.field public final k:Ll/bgw0;

.field public l:Z


# direct methods
.method public constructor <init>(Ll/sgr0;Ll/knr0;Ll/imr0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wmr0;->a:Ll/sgr0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wmr0;->d:Ll/knr0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wmr0;->e:Ll/imr0;

    .line 9
    .line 10
    new-instance p1, Ll/jnr0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/jnr0;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 16
    .line 17
    new-instance p1, Ll/bgw0;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/wmr0;->c:Ll/bgw0;

    .line 23
    .line 24
    new-instance p1, Ll/bgw0;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/wmr0;->j:Ll/bgw0;

    .line 31
    .line 32
    new-instance p1, Ll/bgw0;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/wmr0;->k:Ll/bgw0;

    .line 38
    .line 39
    invoke-virtual {p0, p2, p3}, Ll/wmr0;->h(Ll/knr0;Ll/imr0;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static bridge synthetic g(Ll/wmr0;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/wmr0;->l:Z

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic j(Ll/wmr0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wmr0;->l:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final a()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/wmr0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wmr0;->d:Ll/knr0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/knr0;->g:[I

    .line 8
    .line 9
    iget v1, p0, Ll/wmr0;->f:I

    .line 10
    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/jnr0;->j:[Z

    .line 17
    .line 18
    iget v1, p0, Ll/wmr0;->f:I

    .line 19
    .line 20
    aget-boolean v0, v0, v1

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_0
    invoke-virtual {p0}, Ll/wmr0;->f()Ll/inr0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/high16 p0, 0x40000000    # 2.0f

    .line 34
    .line 35
    or-int/2addr p0, v0

    .line 36
    return p0

    .line 37
    :cond_2
    return v0
.end method

.method public final b()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/wmr0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wmr0;->d:Ll/knr0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/knr0;->d:[I

    .line 8
    .line 9
    iget p0, p0, Ll/wmr0;->f:I

    .line 10
    .line 11
    aget p0, v0, p0

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/jnr0;->h:[I

    .line 17
    .line 18
    iget p0, p0, Ll/wmr0;->f:I

    .line 19
    .line 20
    aget p0, v0, p0

    .line 21
    .line 22
    return p0
.end method

.method public final c(II)I
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/wmr0;->f()Ll/inr0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget v2, v0, Ll/inr0;->d:I

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/jnr0;->n:Ll/bgw0;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, v0, Ll/inr0;->e:[B

    .line 19
    .line 20
    sget v2, Ll/mpw0;->a:I

    .line 21
    .line 22
    iget-object v2, p0, Ll/wmr0;->k:Ll/bgw0;

    .line 23
    .line 24
    array-length v3, v0

    .line 25
    invoke-virtual {v2, v0, v3}, Ll/bgw0;->i([BI)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/wmr0;->k:Ll/bgw0;

    .line 29
    .line 30
    move v2, v3

    .line 31
    :goto_0
    iget-object v3, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 32
    .line 33
    iget v4, p0, Ll/wmr0;->f:I

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ll/jnr0;->b(I)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    const/4 v4, 0x1

    .line 40
    if-nez v3, :cond_2

    .line 41
    .line 42
    if-eqz p2, :cond_3

    .line 43
    .line 44
    :cond_2
    move v5, v4

    .line 45
    goto :goto_1

    .line 46
    :cond_3
    move v5, v1

    .line 47
    :goto_1
    iget-object v6, p0, Ll/wmr0;->j:Ll/bgw0;

    .line 48
    .line 49
    if-eq v4, v5, :cond_4

    .line 50
    .line 51
    move v7, v1

    .line 52
    goto :goto_2

    .line 53
    :cond_4
    const/16 v7, 0x80

    .line 54
    .line 55
    :goto_2
    or-int/2addr v7, v2

    .line 56
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    int-to-byte v7, v7

    .line 61
    aput-byte v7, v8, v1

    .line 62
    .line 63
    invoke-virtual {v6, v1}, Ll/bgw0;->k(I)V

    .line 64
    .line 65
    .line 66
    iget-object v6, p0, Ll/wmr0;->a:Ll/sgr0;

    .line 67
    .line 68
    iget-object v7, p0, Ll/wmr0;->j:Ll/bgw0;

    .line 69
    .line 70
    invoke-interface {v6, v7, v4, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 71
    .line 72
    .line 73
    iget-object v6, p0, Ll/wmr0;->a:Ll/sgr0;

    .line 74
    .line 75
    invoke-interface {v6, v0, v2, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 76
    .line 77
    .line 78
    if-nez v5, :cond_5

    .line 79
    .line 80
    add-int/2addr v2, v4

    .line 81
    return v2

    .line 82
    :cond_5
    const/4 v0, 0x6

    .line 83
    const/4 v5, 0x3

    .line 84
    const/4 v6, 0x2

    .line 85
    const/16 v7, 0x8

    .line 86
    .line 87
    if-nez v3, :cond_6

    .line 88
    .line 89
    int-to-byte p2, p2

    .line 90
    iget-object v3, p0, Ll/wmr0;->c:Ll/bgw0;

    .line 91
    .line 92
    invoke-virtual {v3, v7}, Ll/bgw0;->h(I)V

    .line 93
    .line 94
    .line 95
    iget-object v3, p0, Ll/wmr0;->c:Ll/bgw0;

    .line 96
    .line 97
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    aput-byte v1, v8, v1

    .line 102
    .line 103
    aput-byte v4, v8, v4

    .line 104
    .line 105
    aput-byte v1, v8, v6

    .line 106
    .line 107
    aput-byte p2, v8, v5

    .line 108
    .line 109
    shr-int/lit8 p2, p1, 0x18

    .line 110
    .line 111
    and-int/lit16 p2, p2, 0xff

    .line 112
    .line 113
    int-to-byte p2, p2

    .line 114
    const/4 v1, 0x4

    .line 115
    aput-byte p2, v8, v1

    .line 116
    .line 117
    shr-int/lit8 p2, p1, 0x10

    .line 118
    .line 119
    and-int/lit16 p2, p2, 0xff

    .line 120
    .line 121
    int-to-byte p2, p2

    .line 122
    const/4 v1, 0x5

    .line 123
    aput-byte p2, v8, v1

    .line 124
    .line 125
    shr-int/lit8 p2, p1, 0x8

    .line 126
    .line 127
    and-int/lit16 p2, p2, 0xff

    .line 128
    .line 129
    int-to-byte p2, p2

    .line 130
    aput-byte p2, v8, v0

    .line 131
    .line 132
    and-int/lit16 p1, p1, 0xff

    .line 133
    .line 134
    int-to-byte p1, p1

    .line 135
    const/4 p2, 0x7

    .line 136
    aput-byte p1, v8, p2

    .line 137
    .line 138
    iget-object p0, p0, Ll/wmr0;->a:Ll/sgr0;

    .line 139
    .line 140
    invoke-interface {p0, v3, v7, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 141
    .line 142
    .line 143
    add-int/lit8 v2, v2, 0x9

    .line 144
    .line 145
    return v2

    .line 146
    :cond_6
    add-int/2addr v2, v4

    .line 147
    iget-object p1, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 148
    .line 149
    iget-object p1, p1, Ll/jnr0;->n:Ll/bgw0;

    .line 150
    .line 151
    invoke-virtual {p1}, Ll/bgw0;->F()I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    const/4 v8, -0x2

    .line 156
    invoke-virtual {p1, v8}, Ll/bgw0;->l(I)V

    .line 157
    .line 158
    .line 159
    mul-int/2addr v3, v0

    .line 160
    add-int/2addr v3, v6

    .line 161
    if-eqz p2, :cond_7

    .line 162
    .line 163
    iget-object v0, p0, Ll/wmr0;->c:Ll/bgw0;

    .line 164
    .line 165
    invoke-virtual {v0, v3}, Ll/bgw0;->h(I)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/wmr0;->c:Ll/bgw0;

    .line 169
    .line 170
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p1, v0, v1, v3}, Ll/bgw0;->g([BII)V

    .line 175
    .line 176
    .line 177
    aget-byte p1, v0, v6

    .line 178
    .line 179
    and-int/lit16 p1, p1, 0xff

    .line 180
    .line 181
    shl-int/2addr p1, v7

    .line 182
    aget-byte v1, v0, v5

    .line 183
    .line 184
    and-int/lit16 v1, v1, 0xff

    .line 185
    .line 186
    or-int/2addr p1, v1

    .line 187
    add-int/2addr p1, p2

    .line 188
    shr-int/lit8 p2, p1, 0x8

    .line 189
    .line 190
    and-int/lit16 p2, p2, 0xff

    .line 191
    .line 192
    int-to-byte p2, p2

    .line 193
    aput-byte p2, v0, v6

    .line 194
    .line 195
    and-int/lit16 p1, p1, 0xff

    .line 196
    .line 197
    int-to-byte p1, p1

    .line 198
    aput-byte p1, v0, v5

    .line 199
    .line 200
    iget-object p1, p0, Ll/wmr0;->c:Ll/bgw0;

    .line 201
    .line 202
    :cond_7
    iget-object p0, p0, Ll/wmr0;->a:Ll/sgr0;

    .line 203
    .line 204
    invoke-interface {p0, p1, v3, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 205
    .line 206
    .line 207
    add-int/2addr v2, v3

    .line 208
    return v2
.end method

.method public final d()J
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/wmr0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wmr0;->d:Ll/knr0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/knr0;->c:[J

    .line 8
    .line 9
    iget p0, p0, Ll/wmr0;->f:I

    .line 10
    .line 11
    aget-wide v1, v0, p0

    .line 12
    .line 13
    return-wide v1

    .line 14
    :cond_0
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/jnr0;->f:[J

    .line 17
    .line 18
    iget p0, p0, Ll/wmr0;->h:I

    .line 19
    .line 20
    aget-wide v1, v0, p0

    .line 21
    .line 22
    return-wide v1
.end method

.method public final e()J
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/wmr0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/wmr0;->d:Ll/knr0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/knr0;->f:[J

    .line 8
    .line 9
    iget p0, p0, Ll/wmr0;->f:I

    .line 10
    .line 11
    aget-wide v1, v0, p0

    .line 12
    .line 13
    return-wide v1

    .line 14
    :cond_0
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 15
    .line 16
    iget p0, p0, Ll/wmr0;->f:I

    .line 17
    .line 18
    iget-object v0, v0, Ll/jnr0;->i:[J

    .line 19
    .line 20
    aget-wide v1, v0, p0

    .line 21
    .line 22
    return-wide v1
.end method

.method public final f()Ll/inr0;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/wmr0;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 8
    .line 9
    iget-object v2, v0, Ll/jnr0;->a:Ll/imr0;

    .line 10
    .line 11
    sget v3, Ll/mpw0;->a:I

    .line 12
    .line 13
    iget v2, v2, Ll/imr0;->a:I

    .line 14
    .line 15
    iget-object v0, v0, Ll/jnr0;->m:Ll/inr0;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object p0, p0, Ll/wmr0;->d:Ll/knr0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/knr0;->a:Ll/hnr0;

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ll/hnr0;->a(I)Ll/inr0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-boolean p0, v0, Ll/inr0;->a:Z

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_2
    return-object v1
.end method

.method public final h(Ll/knr0;Ll/imr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wmr0;->d:Ll/knr0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wmr0;->e:Ll/imr0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/knr0;->a:Ll/hnr0;

    .line 6
    .line 7
    iget-object p1, p1, Ll/hnr0;->f:Ll/sqr0;

    .line 8
    .line 9
    iget-object p2, p0, Ll/wmr0;->a:Ll/sgr0;

    .line 10
    .line 11
    invoke-interface {p2, p1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wmr0;->i()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final i()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Ll/jnr0;->d:I

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    iput-wide v2, v0, Ll/jnr0;->p:J

    .line 9
    .line 10
    iput-boolean v1, v0, Ll/jnr0;->q:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Ll/jnr0;->k:Z

    .line 13
    .line 14
    iput-boolean v1, v0, Ll/jnr0;->o:Z

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-object v2, v0, Ll/jnr0;->m:Ll/inr0;

    .line 18
    .line 19
    iput v1, p0, Ll/wmr0;->f:I

    .line 20
    .line 21
    iput v1, p0, Ll/wmr0;->h:I

    .line 22
    .line 23
    iput v1, p0, Ll/wmr0;->g:I

    .line 24
    .line 25
    iput v1, p0, Ll/wmr0;->i:I

    .line 26
    .line 27
    iput-boolean v1, p0, Ll/wmr0;->l:Z

    .line 28
    .line 29
    return-void
.end method

.method public final k()Z
    .locals 5

    .line 1
    iget v0, p0, Ll/wmr0;->f:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Ll/wmr0;->f:I

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/wmr0;->l:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iget v0, p0, Ll/wmr0;->g:I

    .line 14
    .line 15
    add-int/2addr v0, v1

    .line 16
    iput v0, p0, Ll/wmr0;->g:I

    .line 17
    .line 18
    iget-object v3, p0, Ll/wmr0;->b:Ll/jnr0;

    .line 19
    .line 20
    iget-object v3, v3, Ll/jnr0;->g:[I

    .line 21
    .line 22
    iget v4, p0, Ll/wmr0;->h:I

    .line 23
    .line 24
    aget v3, v3, v4

    .line 25
    .line 26
    if-ne v0, v3, :cond_1

    .line 27
    .line 28
    add-int/2addr v4, v1

    .line 29
    iput v4, p0, Ll/wmr0;->h:I

    .line 30
    .line 31
    iput v2, p0, Ll/wmr0;->g:I

    .line 32
    .line 33
    return v2

    .line 34
    :cond_1
    return v1
.end method
