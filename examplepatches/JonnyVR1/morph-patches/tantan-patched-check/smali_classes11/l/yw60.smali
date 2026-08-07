.class public final Ll/yw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jkj0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/hte;

.field public final b:Ll/hg60;

.field public c:I

.field public d:I

.field public e:Ll/h0j0;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Z

.field public l:J


# direct methods
.method public constructor <init>(Ll/hte;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yw60;->a:Ll/hte;

    .line 5
    .line 6
    new-instance p1, Ll/hg60;

    .line 7
    .line 8
    const/16 v0, 0xa

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    invoke-direct {p1, v0}, Ll/hg60;-><init>([B)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/yw60;->b:Ll/hg60;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Ll/yw60;->c:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a(Ll/ig60;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/yw60;->e:Ll/h0j0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    and-int/lit8 v0, p2, 0x1

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x2

    .line 11
    const/4 v4, 0x1

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    iget v0, p0, Ll/yw60;->c:I

    .line 15
    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    if-eq v0, v4, :cond_3

    .line 19
    .line 20
    const-string v5, "PesReader"

    .line 21
    .line 22
    if-eq v0, v3, :cond_2

    .line 23
    .line 24
    if-ne v0, v2, :cond_1

    .line 25
    .line 26
    iget v0, p0, Ll/yw60;->j:I

    .line 27
    .line 28
    if-eq v0, v1, :cond_0

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v6, "Unexpected start indicator: expected "

    .line 33
    .line 34
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget v6, p0, Ll/yw60;->j:I

    .line 38
    .line 39
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v6, " more bytes"

    .line 43
    .line 44
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v5, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/yw60;->a:Ll/hte;

    .line 55
    .line 56
    invoke-interface {v0}, Ll/hte;->c()V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    const-string v0, "Unexpected start indicator reading extended header"

    .line 65
    .line 66
    invoke-static {v5, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    :goto_0
    invoke-virtual {p0, v4}, Ll/yw60;->g(I)V

    .line 70
    .line 71
    .line 72
    :cond_4
    :goto_1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-lez v0, :cond_d

    .line 77
    .line 78
    iget v0, p0, Ll/yw60;->c:I

    .line 79
    .line 80
    if-eqz v0, :cond_c

    .line 81
    .line 82
    const/4 v5, 0x0

    .line 83
    if-eq v0, v4, :cond_a

    .line 84
    .line 85
    if-eq v0, v3, :cond_8

    .line 86
    .line 87
    if-ne v0, v2, :cond_7

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget v6, p0, Ll/yw60;->j:I

    .line 94
    .line 95
    if-ne v6, v1, :cond_5

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    sub-int v5, v0, v6

    .line 99
    .line 100
    :goto_2
    if-lez v5, :cond_6

    .line 101
    .line 102
    sub-int/2addr v0, v5

    .line 103
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    add-int/2addr v5, v0

    .line 108
    invoke-virtual {p1, v5}, Ll/ig60;->T(I)V

    .line 109
    .line 110
    .line 111
    :cond_6
    iget-object v5, p0, Ll/yw60;->a:Ll/hte;

    .line 112
    .line 113
    invoke-interface {v5, p1}, Ll/hte;->a(Ll/ig60;)V

    .line 114
    .line 115
    .line 116
    iget v5, p0, Ll/yw60;->j:I

    .line 117
    .line 118
    if-eq v5, v1, :cond_4

    .line 119
    .line 120
    sub-int/2addr v5, v0

    .line 121
    iput v5, p0, Ll/yw60;->j:I

    .line 122
    .line 123
    if-nez v5, :cond_4

    .line 124
    .line 125
    iget-object v0, p0, Ll/yw60;->a:Ll/hte;

    .line 126
    .line 127
    invoke-interface {v0}, Ll/hte;->c()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v4}, Ll/yw60;->g(I)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_7
    invoke-static {}, Ll/wpg0;->a()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_8
    const/16 v0, 0xa

    .line 139
    .line 140
    iget v6, p0, Ll/yw60;->i:I

    .line 141
    .line 142
    invoke-static {v0, v6}, Ljava/lang/Math;->min(II)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iget-object v6, p0, Ll/yw60;->b:Ll/hg60;

    .line 147
    .line 148
    iget-object v6, v6, Ll/hg60;->a:[B

    .line 149
    .line 150
    invoke-virtual {p0, p1, v6, v0}, Ll/yw60;->d(Ll/ig60;[BI)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_4

    .line 155
    .line 156
    const/4 v0, 0x0

    .line 157
    iget v6, p0, Ll/yw60;->i:I

    .line 158
    .line 159
    invoke-virtual {p0, p1, v0, v6}, Ll/yw60;->d(Ll/ig60;[BI)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_4

    .line 164
    .line 165
    invoke-virtual {p0}, Ll/yw60;->f()V

    .line 166
    .line 167
    .line 168
    iget-boolean v0, p0, Ll/yw60;->k:Z

    .line 169
    .line 170
    if-eqz v0, :cond_9

    .line 171
    .line 172
    const/4 v5, 0x4

    .line 173
    :cond_9
    or-int/2addr p2, v5

    .line 174
    iget-object v0, p0, Ll/yw60;->a:Ll/hte;

    .line 175
    .line 176
    iget-wide v5, p0, Ll/yw60;->l:J

    .line 177
    .line 178
    invoke-interface {v0, v5, v6, p2}, Ll/hte;->d(JI)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v2}, Ll/yw60;->g(I)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_a
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 186
    .line 187
    iget-object v0, v0, Ll/hg60;->a:[B

    .line 188
    .line 189
    const/16 v6, 0x9

    .line 190
    .line 191
    invoke-virtual {p0, p1, v0, v6}, Ll/yw60;->d(Ll/ig60;[BI)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_4

    .line 196
    .line 197
    invoke-virtual {p0}, Ll/yw60;->e()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_b

    .line 202
    .line 203
    move v5, v3

    .line 204
    :cond_b
    invoke-virtual {p0, v5}, Ll/yw60;->g(I)V

    .line 205
    .line 206
    .line 207
    goto/16 :goto_1

    .line 208
    .line 209
    :cond_c
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    invoke-virtual {p1, v0}, Ll/ig60;->V(I)V

    .line 214
    .line 215
    .line 216
    goto/16 :goto_1

    .line 217
    .line 218
    :cond_d
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/yw60;->c:I

    .line 3
    .line 4
    iput v0, p0, Ll/yw60;->d:I

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/yw60;->h:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/yw60;->a:Ll/hte;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/hte;->b()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c(Ll/h0j0;Ll/bsf;Ll/jkj0$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yw60;->e:Ll/h0j0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yw60;->a:Ll/hte;

    .line 4
    .line 5
    invoke-interface {p0, p2, p3}, Ll/hte;->e(Ll/bsf;Ll/jkj0$d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d(Ll/ig60;[BI)Z
    .locals 3
    .param p2    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/yw60;->d:I

    .line 6
    .line 7
    sub-int v1, p3, v1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    if-nez p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/ig60;->V(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget v2, p0, Ll/yw60;->d:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, v2, v0}, Ll/ig60;->l([BII)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget p1, p0, Ll/yw60;->d:I

    .line 29
    .line 30
    add-int/2addr p1, v0

    .line 31
    iput p1, p0, Ll/yw60;->d:I

    .line 32
    .line 33
    if-ne p1, p3, :cond_2

    .line 34
    .line 35
    return v1

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public final e()Z
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/hg60;->p(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 8
    .line 9
    const/16 v2, 0x18

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v2, "PesReader"

    .line 16
    .line 17
    const/4 v3, -0x1

    .line 18
    const/4 v4, 0x1

    .line 19
    if-eq v0, v4, :cond_0

    .line 20
    .line 21
    new-instance v4, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v5, "Unexpected start code prefix: "

    .line 24
    .line 25
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v2, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput v3, p0, Ll/yw60;->j:I

    .line 39
    .line 40
    return v1

    .line 41
    :cond_0
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 42
    .line 43
    const/16 v1, 0x8

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/hg60;->r(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 49
    .line 50
    const/16 v5, 0x10

    .line 51
    .line 52
    invoke-virtual {v0, v5}, Ll/hg60;->h(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 57
    .line 58
    const/4 v6, 0x5

    .line 59
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 60
    .line 61
    .line 62
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 63
    .line 64
    invoke-virtual {v5}, Ll/hg60;->g()Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    iput-boolean v5, p0, Ll/yw60;->k:Z

    .line 69
    .line 70
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 71
    .line 72
    const/4 v6, 0x2

    .line 73
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 74
    .line 75
    .line 76
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 77
    .line 78
    invoke-virtual {v5}, Ll/hg60;->g()Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    iput-boolean v5, p0, Ll/yw60;->f:Z

    .line 83
    .line 84
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 85
    .line 86
    invoke-virtual {v5}, Ll/hg60;->g()Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    iput-boolean v5, p0, Ll/yw60;->g:Z

    .line 91
    .line 92
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 93
    .line 94
    const/4 v6, 0x6

    .line 95
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 99
    .line 100
    invoke-virtual {v5, v1}, Ll/hg60;->h(I)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    iput v1, p0, Ll/yw60;->i:I

    .line 105
    .line 106
    if-nez v0, :cond_1

    .line 107
    .line 108
    iput v3, p0, Ll/yw60;->j:I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    add-int/lit8 v0, v0, -0x3

    .line 112
    .line 113
    sub-int/2addr v0, v1

    .line 114
    iput v0, p0, Ll/yw60;->j:I

    .line 115
    .line 116
    if-gez v0, :cond_2

    .line 117
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string v1, "Found negative packet payload size: "

    .line 121
    .line 122
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget v1, p0, Ll/yw60;->j:I

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {v2, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iput v3, p0, Ll/yw60;->j:I

    .line 138
    .line 139
    :cond_2
    :goto_0
    return v4
.end method

.method public final f()V
    .locals 10
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "timestampAdjuster"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/hg60;->p(I)V

    .line 5
    .line 6
    .line 7
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    iput-wide v0, p0, Ll/yw60;->l:J

    .line 13
    .line 14
    iget-boolean v0, p0, Ll/yw60;->f:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    invoke-virtual {v0, v1}, Ll/hg60;->r(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/yw60;->b:Ll/hg60;

    .line 25
    .line 26
    const/4 v2, 0x3

    .line 27
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    int-to-long v3, v0

    .line 32
    const/16 v0, 0x1e

    .line 33
    .line 34
    shl-long/2addr v3, v0

    .line 35
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 36
    .line 37
    const/4 v6, 0x1

    .line 38
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 39
    .line 40
    .line 41
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 42
    .line 43
    const/16 v7, 0xf

    .line 44
    .line 45
    invoke-virtual {v5, v7}, Ll/hg60;->h(I)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    shl-int/2addr v5, v7

    .line 50
    int-to-long v8, v5

    .line 51
    or-long/2addr v3, v8

    .line 52
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 55
    .line 56
    .line 57
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 58
    .line 59
    invoke-virtual {v5, v7}, Ll/hg60;->h(I)I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    int-to-long v8, v5

    .line 64
    or-long/2addr v3, v8

    .line 65
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 66
    .line 67
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 68
    .line 69
    .line 70
    iget-boolean v5, p0, Ll/yw60;->h:Z

    .line 71
    .line 72
    if-nez v5, :cond_0

    .line 73
    .line 74
    iget-boolean v5, p0, Ll/yw60;->g:Z

    .line 75
    .line 76
    if-eqz v5, :cond_0

    .line 77
    .line 78
    iget-object v5, p0, Ll/yw60;->b:Ll/hg60;

    .line 79
    .line 80
    invoke-virtual {v5, v1}, Ll/hg60;->r(I)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Ll/yw60;->b:Ll/hg60;

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ll/hg60;->h(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    int-to-long v1, v1

    .line 90
    shl-long v0, v1, v0

    .line 91
    .line 92
    iget-object v2, p0, Ll/yw60;->b:Ll/hg60;

    .line 93
    .line 94
    invoke-virtual {v2, v6}, Ll/hg60;->r(I)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/yw60;->b:Ll/hg60;

    .line 98
    .line 99
    invoke-virtual {v2, v7}, Ll/hg60;->h(I)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    shl-int/2addr v2, v7

    .line 104
    int-to-long v8, v2

    .line 105
    or-long/2addr v0, v8

    .line 106
    iget-object v2, p0, Ll/yw60;->b:Ll/hg60;

    .line 107
    .line 108
    invoke-virtual {v2, v6}, Ll/hg60;->r(I)V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Ll/yw60;->b:Ll/hg60;

    .line 112
    .line 113
    invoke-virtual {v2, v7}, Ll/hg60;->h(I)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    int-to-long v7, v2

    .line 118
    or-long/2addr v0, v7

    .line 119
    iget-object v2, p0, Ll/yw60;->b:Ll/hg60;

    .line 120
    .line 121
    invoke-virtual {v2, v6}, Ll/hg60;->r(I)V

    .line 122
    .line 123
    .line 124
    iget-object v2, p0, Ll/yw60;->e:Ll/h0j0;

    .line 125
    .line 126
    invoke-virtual {v2, v0, v1}, Ll/h0j0;->b(J)J

    .line 127
    .line 128
    .line 129
    iput-boolean v6, p0, Ll/yw60;->h:Z

    .line 130
    .line 131
    :cond_0
    iget-object v0, p0, Ll/yw60;->e:Ll/h0j0;

    .line 132
    .line 133
    invoke-virtual {v0, v3, v4}, Ll/h0j0;->b(J)J

    .line 134
    .line 135
    .line 136
    move-result-wide v0

    .line 137
    iput-wide v0, p0, Ll/yw60;->l:J

    .line 138
    .line 139
    :cond_1
    return-void
.end method

.method public final g(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/yw60;->c:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/yw60;->d:I

    .line 5
    .line 6
    return-void
.end method
