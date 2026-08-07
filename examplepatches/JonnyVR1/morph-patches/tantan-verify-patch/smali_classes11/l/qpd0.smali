.class public final Ll/qpd0;
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

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:J

.field public k:J

.field public l:Z


# direct methods
.method public constructor <init>(Ll/zpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qpd0;->a:Ll/zpd0;

    .line 5
    .line 6
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    iput-wide v0, p0, Ll/qpd0;->c:J

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Ll/qpd0;->e:I

    .line 15
    .line 16
    return-void
.end method

.method private e()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/qpd0;->b:Ll/qfj0;

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
    iget-wide v2, p0, Ll/qpd0;->k:J

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/qpd0;->h:Z

    .line 13
    .line 14
    iget v5, p0, Ll/qpd0;->d:I

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
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Ll/qpd0;->d:I

    .line 23
    .line 24
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    iput-wide v1, p0, Ll/qpd0;->k:J

    .line 30
    .line 31
    iput-boolean v0, p0, Ll/qpd0;->h:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Ll/qpd0;->l:Z

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/qpd0;->c:J

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/qpd0;->d:I

    .line 5
    .line 6
    iput-wide p3, p0, Ll/qpd0;->j:J

    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/ig60;JIZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qpd0;->b:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    and-int/lit16 v2, v1, 0x400

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x1

    .line 18
    if-lez v2, :cond_0

    .line 19
    .line 20
    move v2, v4

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v2, v3

    .line 23
    :goto_0
    and-int/lit16 v5, v1, 0x200

    .line 24
    .line 25
    const-string v6, "RtpH263Reader"

    .line 26
    .line 27
    if-nez v5, :cond_b

    .line 28
    .line 29
    and-int/lit16 v5, v1, 0x1f8

    .line 30
    .line 31
    if-nez v5, :cond_b

    .line 32
    .line 33
    and-int/lit8 v1, v1, 0x7

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    goto/16 :goto_2

    .line 38
    .line 39
    :cond_1
    iget-boolean v1, p0, Ll/qpd0;->l:Z

    .line 40
    .line 41
    if-eqz v2, :cond_4

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget v1, p0, Ll/qpd0;->d:I

    .line 46
    .line 47
    if-lez v1, :cond_2

    .line 48
    .line 49
    invoke-direct {p0}, Ll/qpd0;->e()V

    .line 50
    .line 51
    .line 52
    :cond_2
    iput-boolean v4, p0, Ll/qpd0;->l:Z

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/ig60;->j()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    and-int/lit16 v1, v1, 0xfc

    .line 59
    .line 60
    const/16 v2, 0x80

    .line 61
    .line 62
    if-ge v1, v2, :cond_3

    .line 63
    .line 64
    const-string p0, "Picture start Code (PSC) missing, dropping packet."

    .line 65
    .line 66
    invoke-static {v6, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    aput-byte v3, v1, v0

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    add-int/lit8 v2, v0, 0x1

    .line 81
    .line 82
    aput-byte v3, v1, v2

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    if-eqz v1, :cond_a

    .line 89
    .line 90
    iget v0, p0, Ll/qpd0;->e:I

    .line 91
    .line 92
    invoke-static {v0}, Ll/wpd0;->b(I)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-ge p4, v0, :cond_5

    .line 97
    .line 98
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const-string p1, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d. Dropping packet."

    .line 111
    .line 112
    invoke-static {p1, p0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {v6, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_5
    :goto_1
    iget v0, p0, Ll/qpd0;->d:I

    .line 121
    .line 122
    if-nez v0, :cond_8

    .line 123
    .line 124
    iget-boolean v0, p0, Ll/qpd0;->i:Z

    .line 125
    .line 126
    invoke-virtual {p0, p1, v0}, Ll/qpd0;->f(Ll/ig60;Z)V

    .line 127
    .line 128
    .line 129
    iget-boolean v0, p0, Ll/qpd0;->i:Z

    .line 130
    .line 131
    if-nez v0, :cond_8

    .line 132
    .line 133
    iget-boolean v0, p0, Ll/qpd0;->h:Z

    .line 134
    .line 135
    if-eqz v0, :cond_8

    .line 136
    .line 137
    iget v0, p0, Ll/qpd0;->f:I

    .line 138
    .line 139
    iget-object v1, p0, Ll/qpd0;->a:Ll/zpd0;

    .line 140
    .line 141
    iget-object v1, v1, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 142
    .line 143
    iget v2, v1, Lcom/google/android/exoplayer2/k;->q:I

    .line 144
    .line 145
    if-ne v0, v2, :cond_6

    .line 146
    .line 147
    iget v0, p0, Ll/qpd0;->g:I

    .line 148
    .line 149
    iget v2, v1, Lcom/google/android/exoplayer2/k;->r:I

    .line 150
    .line 151
    if-eq v0, v2, :cond_7

    .line 152
    .line 153
    :cond_6
    iget-object v0, p0, Ll/qpd0;->b:Ll/qfj0;

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget v2, p0, Ll/qpd0;->f:I

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget v2, p0, Ll/qpd0;->g:I

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-interface {v0, v1}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 176
    .line 177
    .line 178
    :cond_7
    iput-boolean v4, p0, Ll/qpd0;->i:Z

    .line 179
    .line 180
    :cond_8
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    iget-object v1, p0, Ll/qpd0;->b:Ll/qfj0;

    .line 185
    .line 186
    invoke-interface {v1, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 187
    .line 188
    .line 189
    iget p1, p0, Ll/qpd0;->d:I

    .line 190
    .line 191
    add-int/2addr p1, v0

    .line 192
    iput p1, p0, Ll/qpd0;->d:I

    .line 193
    .line 194
    iget-wide v0, p0, Ll/qpd0;->j:J

    .line 195
    .line 196
    iget-wide v4, p0, Ll/qpd0;->c:J

    .line 197
    .line 198
    const v6, 0x15f90

    .line 199
    .line 200
    .line 201
    move-wide v2, p2

    .line 202
    invoke-static/range {v0 .. v6}, Ll/cqd0;->a(JJJI)J

    .line 203
    .line 204
    .line 205
    move-result-wide p1

    .line 206
    iput-wide p1, p0, Ll/qpd0;->k:J

    .line 207
    .line 208
    if-eqz p5, :cond_9

    .line 209
    .line 210
    invoke-direct {p0}, Ll/qpd0;->e()V

    .line 211
    .line 212
    .line 213
    :cond_9
    iput p4, p0, Ll/qpd0;->e:I

    .line 214
    .line 215
    return-void

    .line 216
    :cond_a
    const-string p0, "First payload octet of the H263 packet is not the beginning of a new H263 partition, Dropping current packet."

    .line 217
    .line 218
    invoke-static {v6, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_b
    :goto_2
    const-string p0, "Dropping packet: video reduncancy coding is not supported, packet header VRC, or PLEN or PEBIT is non-zero"

    .line 223
    .line 224
    invoke-static {v6, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public c(JI)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/qpd0;->c:J

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
    iput-wide p1, p0, Ll/qpd0;->c:J

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
    iput-object p1, p0, Ll/qpd0;->b:Ll/qfj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/qpd0;->a:Ll/zpd0;

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

.method public final f(Ll/ig60;Z)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/ig60;->J()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const/16 v3, 0xa

    .line 10
    .line 11
    shr-long/2addr v1, v3

    .line 12
    const-wide/16 v3, 0x3f

    .line 13
    .line 14
    and-long/2addr v1, v3

    .line 15
    const-wide/16 v3, 0x20

    .line 16
    .line 17
    cmp-long v1, v1, v3

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/ig60;->j()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    shr-int/lit8 v3, v1, 0x1

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    and-int/2addr v3, v4

    .line 30
    if-nez p2, :cond_1

    .line 31
    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    shr-int/lit8 p2, v1, 0x2

    .line 35
    .line 36
    and-int/lit8 p2, p2, 0x7

    .line 37
    .line 38
    if-ne p2, v4, :cond_0

    .line 39
    .line 40
    const/16 p2, 0x80

    .line 41
    .line 42
    iput p2, p0, Ll/qpd0;->f:I

    .line 43
    .line 44
    const/16 p2, 0x60

    .line 45
    .line 46
    iput p2, p0, Ll/qpd0;->g:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    add-int/lit8 p2, p2, -0x2

    .line 50
    .line 51
    const/16 v1, 0xb0

    .line 52
    .line 53
    shl-int/2addr v1, p2

    .line 54
    iput v1, p0, Ll/qpd0;->f:I

    .line 55
    .line 56
    const/16 v1, 0x90

    .line 57
    .line 58
    shl-int p2, v1, p2

    .line 59
    .line 60
    iput p2, p0, Ll/qpd0;->g:I

    .line 61
    .line 62
    :cond_1
    :goto_0
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 63
    .line 64
    .line 65
    if-nez v3, :cond_2

    .line 66
    .line 67
    move v2, v4

    .line 68
    :cond_2
    iput-boolean v2, p0, Ll/qpd0;->h:Z

    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 72
    .line 73
    .line 74
    iput-boolean v2, p0, Ll/qpd0;->h:Z

    .line 75
    .line 76
    return-void
.end method
