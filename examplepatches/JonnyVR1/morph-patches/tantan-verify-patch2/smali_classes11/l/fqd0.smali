.class public final Ll/fqd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aqd0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/zpd0;

.field public b:Ll/qfj0;

.field public c:J

.field public d:J

.field public e:I

.field public f:I

.field public g:J

.field public h:I

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Ll/zpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fqd0;->a:Ll/zpd0;

    .line 5
    .line 6
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    iput-wide v0, p0, Ll/fqd0;->c:J

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Ll/fqd0;->f:I

    .line 15
    .line 16
    iput-wide v0, p0, Ll/fqd0;->g:J

    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Ll/fqd0;->d:J

    .line 21
    .line 22
    iput p1, p0, Ll/fqd0;->e:I

    .line 23
    .line 24
    iput p1, p0, Ll/fqd0;->h:I

    .line 25
    .line 26
    iput p1, p0, Ll/fqd0;->i:I

    .line 27
    .line 28
    return-void
.end method

.method private e()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/fqd0;->b:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, v0

    .line 8
    check-cast v1, Ll/qfj0;

    .line 9
    .line 10
    iget-wide v2, p0, Ll/fqd0;->g:J

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/fqd0;->l:Z

    .line 13
    .line 14
    iget v5, p0, Ll/fqd0;->f:I

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x0

    .line 18
    invoke-interface/range {v1 .. v7}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Ll/fqd0;->f:I

    .line 23
    .line 24
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    iput-wide v0, p0, Ll/fqd0;->g:J

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Ll/fqd0;->j:Z

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fqd0;->c:J

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    iput p1, p0, Ll/fqd0;->f:I

    .line 5
    .line 6
    iput-wide p3, p0, Ll/fqd0;->d:J

    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/ig60;JIZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fqd0;->b:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p4}, Ll/fqd0;->f(Ll/ig60;I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    iget v0, p0, Ll/fqd0;->f:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    const/4 v2, -0x1

    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    iget-boolean v0, p0, Ll/fqd0;->j:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/ig60;->j()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    and-int/lit8 v0, v0, 0x4

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    move v0, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    :goto_0
    iput-boolean v0, p0, Ll/fqd0;->l:Z

    .line 34
    .line 35
    :cond_1
    iget-boolean v0, p0, Ll/fqd0;->k:Z

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    iget v0, p0, Ll/fqd0;->h:I

    .line 40
    .line 41
    if-eq v0, v2, :cond_4

    .line 42
    .line 43
    iget v3, p0, Ll/fqd0;->i:I

    .line 44
    .line 45
    if-eq v3, v2, :cond_4

    .line 46
    .line 47
    iget-object v4, p0, Ll/fqd0;->a:Ll/zpd0;

    .line 48
    .line 49
    iget-object v4, v4, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 50
    .line 51
    iget v5, v4, Lcom/google/android/exoplayer2/k;->q:I

    .line 52
    .line 53
    if-ne v0, v5, :cond_2

    .line 54
    .line 55
    iget v0, v4, Lcom/google/android/exoplayer2/k;->r:I

    .line 56
    .line 57
    if-eq v3, v0, :cond_3

    .line 58
    .line 59
    :cond_2
    iget-object v0, p0, Ll/fqd0;->b:Ll/qfj0;

    .line 60
    .line 61
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget v4, p0, Ll/fqd0;->h:I

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iget v4, p0, Ll/fqd0;->i:I

    .line 72
    .line 73
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-interface {v0, v3}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 82
    .line 83
    .line 84
    :cond_3
    iput-boolean v1, p0, Ll/fqd0;->k:Z

    .line 85
    .line 86
    :cond_4
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iget-object v1, p0, Ll/fqd0;->b:Ll/qfj0;

    .line 91
    .line 92
    invoke-interface {v1, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 93
    .line 94
    .line 95
    iget p1, p0, Ll/fqd0;->f:I

    .line 96
    .line 97
    if-ne p1, v2, :cond_5

    .line 98
    .line 99
    iput v0, p0, Ll/fqd0;->f:I

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_5
    add-int/2addr p1, v0

    .line 103
    iput p1, p0, Ll/fqd0;->f:I

    .line 104
    .line 105
    :goto_1
    iget-wide v0, p0, Ll/fqd0;->d:J

    .line 106
    .line 107
    iget-wide v4, p0, Ll/fqd0;->c:J

    .line 108
    .line 109
    const v6, 0x15f90

    .line 110
    .line 111
    .line 112
    move-wide v2, p2

    .line 113
    invoke-static/range {v0 .. v6}, Ll/cqd0;->a(JJJI)J

    .line 114
    .line 115
    .line 116
    move-result-wide p1

    .line 117
    iput-wide p1, p0, Ll/fqd0;->g:J

    .line 118
    .line 119
    if-eqz p5, :cond_6

    .line 120
    .line 121
    invoke-direct {p0}, Ll/fqd0;->e()V

    .line 122
    .line 123
    .line 124
    :cond_6
    iput p4, p0, Ll/fqd0;->e:I

    .line 125
    .line 126
    :cond_7
    return-void
.end method

.method public c(JI)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/fqd0;->c:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long p3, v0, v2

    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    const/4 p3, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p3, 0x0

    .line 15
    :goto_0
    invoke-static {p3}, Ll/w11;->g(Z)V

    .line 16
    .line 17
    .line 18
    iput-wide p1, p0, Ll/fqd0;->c:J

    .line 19
    .line 20
    return-void
.end method

.method public d(Ll/bsf;I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-interface {p1, p2, v0}, Ll/bsf;->b(II)Ll/qfj0;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iput-object p1, p0, Ll/fqd0;->b:Ll/qfj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/fqd0;->a:Ll/zpd0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final f(Ll/ig60;I)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v1, v0, 0x8

    .line 6
    .line 7
    iget-boolean v2, p0, Ll/fqd0;->j:Z

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x1

    .line 11
    const/16 v5, 0x8

    .line 12
    .line 13
    if-ne v1, v5, :cond_1

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget p2, p0, Ll/fqd0;->f:I

    .line 18
    .line 19
    if-lez p2, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Ll/fqd0;->e()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iput-boolean v4, p0, Ll/fqd0;->j:Z

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string v1, "RtpVp9Reader"

    .line 28
    .line 29
    if-eqz v2, :cond_c

    .line 30
    .line 31
    iget v2, p0, Ll/fqd0;->e:I

    .line 32
    .line 33
    invoke-static {v2}, Ll/wpd0;->b(I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-ge p2, v2, :cond_2

    .line 38
    .line 39
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d. Dropping packet."

    .line 52
    .line 53
    invoke-static {p1, p0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v3

    .line 61
    :cond_2
    :goto_0
    and-int/lit16 p2, v0, 0x80

    .line 62
    .line 63
    if-eqz p2, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    and-int/lit16 p2, p2, 0x80

    .line 70
    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-ge p2, v4, :cond_3

    .line 78
    .line 79
    return v3

    .line 80
    :cond_3
    and-int/lit8 p2, v0, 0x10

    .line 81
    .line 82
    if-nez p2, :cond_4

    .line 83
    .line 84
    move v1, v4

    .line 85
    goto :goto_1

    .line 86
    :cond_4
    move v1, v3

    .line 87
    :goto_1
    const-string v2, "VP9 flexible mode is not supported."

    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    and-int/lit8 v1, v0, 0x20

    .line 93
    .line 94
    if-eqz v1, :cond_6

    .line 95
    .line 96
    invoke-virtual {p1, v4}, Ll/ig60;->V(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-ge v1, v4, :cond_5

    .line 104
    .line 105
    return v3

    .line 106
    :cond_5
    if-nez p2, :cond_6

    .line 107
    .line 108
    invoke-virtual {p1, v4}, Ll/ig60;->V(I)V

    .line 109
    .line 110
    .line 111
    :cond_6
    and-int/lit8 p2, v0, 0x2

    .line 112
    .line 113
    if-eqz p2, :cond_b

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    shr-int/lit8 v0, p2, 0x5

    .line 120
    .line 121
    and-int/lit8 v0, v0, 0x7

    .line 122
    .line 123
    and-int/lit8 v1, p2, 0x10

    .line 124
    .line 125
    if-eqz v1, :cond_8

    .line 126
    .line 127
    add-int/2addr v0, v4

    .line 128
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    mul-int/lit8 v2, v0, 0x4

    .line 133
    .line 134
    if-ge v1, v2, :cond_7

    .line 135
    .line 136
    return v3

    .line 137
    :cond_7
    move v1, v3

    .line 138
    :goto_2
    if-ge v1, v0, :cond_8

    .line 139
    .line 140
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    iput v2, p0, Ll/fqd0;->h:I

    .line 145
    .line 146
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    iput v2, p0, Ll/fqd0;->i:I

    .line 151
    .line 152
    add-int/lit8 v1, v1, 0x1

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_8
    and-int/lit8 p0, p2, 0x8

    .line 156
    .line 157
    if-eqz p0, :cond_b

    .line 158
    .line 159
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-ge p2, p0, :cond_9

    .line 168
    .line 169
    return v3

    .line 170
    :cond_9
    move p2, v3

    .line 171
    :goto_3
    if-ge p2, p0, :cond_b

    .line 172
    .line 173
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    and-int/lit8 v0, v0, 0xc

    .line 178
    .line 179
    shr-int/lit8 v0, v0, 0x2

    .line 180
    .line 181
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-ge v1, v0, :cond_a

    .line 186
    .line 187
    return v3

    .line 188
    :cond_a
    invoke-virtual {p1, v0}, Ll/ig60;->V(I)V

    .line 189
    .line 190
    .line 191
    add-int/lit8 p2, p2, 0x1

    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_b
    return v4

    .line 195
    :cond_c
    const-string p0, "First payload octet of the RTP packet is not the beginning of a new VP9 partition, Dropping current packet."

    .line 196
    .line 197
    invoke-static {v1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    return v3
.end method
