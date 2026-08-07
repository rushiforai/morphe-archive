.class public final Ll/eir0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final n:Ll/ifr0;


# instance fields
.field public final a:[B

.field public final b:Ll/bgw0;

.field public final c:Ll/jfr0;

.field public d:Ll/ser0;

.field public e:Ll/sgr0;

.field public f:I

.field public g:Lcom/google/android/gms/internal/ads/zzby;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/ofr0;

.field public i:I

.field public j:I

.field public k:Ll/qhr0;

.field public l:I

.field public m:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/rhr0;->b:Ll/rhr0;

    .line 2
    .line 3
    sput-object v0, Ll/eir0;->n:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, v0}, Ll/eir0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x2a

    .line 5
    .line 6
    new-array p1, p1, [B

    .line 7
    .line 8
    iput-object p1, p0, Ll/eir0;->a:[B

    .line 9
    .line 10
    new-instance p1, Ll/bgw0;

    .line 11
    .line 12
    const v0, 0x8000

    .line 13
    .line 14
    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {p1, v0, v1}, Ll/bgw0;-><init>([BI)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/eir0;->b:Ll/bgw0;

    .line 22
    .line 23
    new-instance p1, Ll/jfr0;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/jfr0;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/eir0;->c:Ll/jfr0;

    .line 29
    .line 30
    iput v1, p0, Ll/eir0;->f:I

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;Z)J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/eir0;->h:Ll/ofr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    :goto_0
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/lit8 v1, v1, -0x10

    .line 15
    .line 16
    if-gt v0, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/eir0;->h:Ll/ofr0;

    .line 22
    .line 23
    iget v2, p0, Ll/eir0;->j:I

    .line 24
    .line 25
    iget-object v3, p0, Ll/eir0;->c:Ll/jfr0;

    .line 26
    .line 27
    invoke-static {p1, v1, v2, v3}, Ll/kfr0;->c(Ll/bgw0;Ll/ofr0;ILl/jfr0;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/eir0;->c:Ll/jfr0;

    .line 37
    .line 38
    iget-wide p0, p0, Ll/jfr0;->a:J

    .line 39
    .line 40
    return-wide p0

    .line 41
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    if-eqz p2, :cond_5

    .line 45
    .line 46
    :goto_1
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iget v1, p0, Ll/eir0;->i:I

    .line 51
    .line 52
    sub-int/2addr p2, v1

    .line 53
    if-gt v0, p2, :cond_4

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 56
    .line 57
    .line 58
    :try_start_0
    iget-object p2, p0, Ll/eir0;->h:Ll/ofr0;

    .line 59
    .line 60
    iget v1, p0, Ll/eir0;->j:I

    .line 61
    .line 62
    iget-object v2, p0, Ll/eir0;->c:Ll/jfr0;

    .line 63
    .line 64
    invoke-static {p1, p2, v1, v2}, Ll/kfr0;->c(Ll/bgw0;Ll/ofr0;ILl/jfr0;)Z

    .line 65
    .line 66
    .line 67
    move-result p2
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    goto :goto_2

    .line 69
    :catch_0
    const/4 p2, 0x0

    .line 70
    :goto_2
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-le v1, v2, :cond_2

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_2
    if-eqz p2, :cond_3

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/eir0;->c:Ll/jfr0;

    .line 87
    .line 88
    iget-wide p0, p0, Ll/jfr0;->a:J

    .line 89
    .line 90
    return-wide p0

    .line 91
    :cond_3
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-virtual {p1, p0}, Ll/bgw0;->k(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_5
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 103
    .line 104
    .line 105
    :goto_4
    const-wide/16 p0, -0x1

    .line 106
    .line 107
    return-wide p0
.end method

.method public final b()V
    .locals 11

    .line 1
    iget-wide v0, p0, Ll/eir0;->m:J

    .line 2
    .line 3
    const-wide/32 v2, 0xf4240

    .line 4
    .line 5
    .line 6
    mul-long/2addr v0, v2

    .line 7
    iget-object v2, p0, Ll/eir0;->h:Ll/ofr0;

    .line 8
    .line 9
    sget v3, Ll/mpw0;->a:I

    .line 10
    .line 11
    iget v2, v2, Ll/ofr0;->e:I

    .line 12
    .line 13
    int-to-long v2, v2

    .line 14
    div-long v5, v0, v2

    .line 15
    .line 16
    iget-object v4, p0, Ll/eir0;->e:Ll/sgr0;

    .line 17
    .line 18
    iget v8, p0, Ll/eir0;->l:I

    .line 19
    .line 20
    const/4 v9, 0x0

    .line 21
    const/4 v10, 0x0

    .line 22
    const/4 v7, 0x1

    .line 23
    invoke-interface/range {v4 .. v10}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final c(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p1, p1, v0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iput p2, p0, Ll/eir0;->f:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p1, p0, Ll/eir0;->k:Ll/qhr0;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1, p3, p4}, Ll/ber0;->d(J)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    cmp-long p1, p3, v0

    .line 19
    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    const-wide/16 v0, -0x1

    .line 24
    .line 25
    :goto_1
    iput-wide v0, p0, Ll/eir0;->m:J

    .line 26
    .line 27
    iput p2, p0, Ll/eir0;->l:I

    .line 28
    .line 29
    iget-object p0, p0, Ll/eir0;->b:Ll/bgw0;

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/bgw0;->h(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0}, Ll/lfr0;->a(Ll/qer0;Z)Lcom/google/android/gms/internal/ads/zzby;

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/bgw0;

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast p1, Ll/fer0;

    .line 16
    .line 17
    invoke-virtual {p1, v2, p0, v1, p0}, Ll/fer0;->c([BIIZ)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/bgw0;->J()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    const-wide/32 v2, 0x664c6143

    .line 25
    .line 26
    .line 27
    cmp-long p1, v0, v2

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    :cond_0
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/eir0;->d:Ll/ser0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/eir0;->e:Ll/sgr0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/ser0;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Ll/eir0;->f:I

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v2, :cond_17

    .line 10
    .line 11
    const/4 v5, 0x2

    .line 12
    if-eq v2, v3, :cond_16

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x3

    .line 16
    const/4 v8, 0x4

    .line 17
    if-eq v2, v5, :cond_14

    .line 18
    .line 19
    if-eq v2, v7, :cond_d

    .line 20
    .line 21
    const-wide/16 v9, -0x1

    .line 22
    .line 23
    if-eq v2, v8, :cond_9

    .line 24
    .line 25
    iget-object v2, v0, Ll/eir0;->e:Ll/sgr0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    iget-object v2, v0, Ll/eir0;->h:Ll/ofr0;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    iget-object v5, v0, Ll/eir0;->k:Ll/qhr0;

    .line 36
    .line 37
    if-eqz v5, :cond_0

    .line 38
    .line 39
    invoke-virtual {v5}, Ll/ber0;->e()Z

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-eqz v6, :cond_0

    .line 44
    .line 45
    move-object/from16 v6, p2

    .line 46
    .line 47
    invoke-virtual {v5, v1, v6}, Ll/ber0;->a(Ll/qer0;Ll/yfr0;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    return v0

    .line 52
    :cond_0
    iget-wide v5, v0, Ll/eir0;->m:J

    .line 53
    .line 54
    cmp-long v5, v5, v9

    .line 55
    .line 56
    if-nez v5, :cond_1

    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/kfr0;->b(Ll/qer0;Ll/ofr0;)J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    iput-wide v1, v0, Ll/eir0;->m:J

    .line 63
    .line 64
    return v4

    .line 65
    :cond_1
    iget-object v2, v0, Ll/eir0;->b:Ll/bgw0;

    .line 66
    .line 67
    invoke-virtual {v2}, Ll/bgw0;->t()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    const v6, 0x8000

    .line 72
    .line 73
    .line 74
    if-ge v5, v6, :cond_4

    .line 75
    .line 76
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    sub-int/2addr v6, v5

    .line 81
    invoke-interface {v1, v2, v5, v6}, Ll/qer0;->a([BII)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    const/4 v2, -0x1

    .line 86
    if-ne v1, v2, :cond_2

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    move v3, v4

    .line 90
    :goto_0
    iget-object v6, v0, Ll/eir0;->b:Ll/bgw0;

    .line 91
    .line 92
    if-nez v3, :cond_3

    .line 93
    .line 94
    add-int/2addr v5, v1

    .line 95
    invoke-virtual {v6, v5}, Ll/bgw0;->j(I)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    invoke-virtual {v6}, Ll/bgw0;->q()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_5

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/eir0;->b()V

    .line 106
    .line 107
    .line 108
    return v2

    .line 109
    :cond_4
    move v3, v4

    .line 110
    :cond_5
    :goto_1
    iget-object v1, v0, Ll/eir0;->b:Ll/bgw0;

    .line 111
    .line 112
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    iget v5, v0, Ll/eir0;->l:I

    .line 117
    .line 118
    iget v6, v0, Ll/eir0;->i:I

    .line 119
    .line 120
    if-ge v5, v6, :cond_6

    .line 121
    .line 122
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    sub-int/2addr v6, v5

    .line 127
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    invoke-virtual {v1, v5}, Ll/bgw0;->l(I)V

    .line 132
    .line 133
    .line 134
    :cond_6
    iget-object v1, v0, Ll/eir0;->b:Ll/bgw0;

    .line 135
    .line 136
    invoke-virtual {v0, v1, v3}, Ll/eir0;->a(Ll/bgw0;Z)J

    .line 137
    .line 138
    .line 139
    move-result-wide v5

    .line 140
    iget-object v1, v0, Ll/eir0;->b:Ll/bgw0;

    .line 141
    .line 142
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    sub-int/2addr v3, v2

    .line 147
    invoke-virtual {v1, v2}, Ll/bgw0;->k(I)V

    .line 148
    .line 149
    .line 150
    iget-object v1, v0, Ll/eir0;->e:Ll/sgr0;

    .line 151
    .line 152
    iget-object v2, v0, Ll/eir0;->b:Ll/bgw0;

    .line 153
    .line 154
    invoke-static {v1, v2, v3}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 155
    .line 156
    .line 157
    iget v1, v0, Ll/eir0;->l:I

    .line 158
    .line 159
    add-int/2addr v1, v3

    .line 160
    iput v1, v0, Ll/eir0;->l:I

    .line 161
    .line 162
    cmp-long v1, v5, v9

    .line 163
    .line 164
    if-eqz v1, :cond_7

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/eir0;->b()V

    .line 167
    .line 168
    .line 169
    iput v4, v0, Ll/eir0;->l:I

    .line 170
    .line 171
    iput-wide v5, v0, Ll/eir0;->m:J

    .line 172
    .line 173
    :cond_7
    iget-object v1, v0, Ll/eir0;->b:Ll/bgw0;

    .line 174
    .line 175
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    const/16 v3, 0x10

    .line 180
    .line 181
    if-lt v2, v3, :cond_8

    .line 182
    .line 183
    return v4

    .line 184
    :cond_8
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-static {v3, v5, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    .line 202
    .line 203
    iget-object v1, v0, Ll/eir0;->b:Ll/bgw0;

    .line 204
    .line 205
    invoke-virtual {v1, v4}, Ll/bgw0;->k(I)V

    .line 206
    .line 207
    .line 208
    iget-object v0, v0, Ll/eir0;->b:Ll/bgw0;

    .line 209
    .line 210
    invoke-virtual {v0, v2}, Ll/bgw0;->j(I)V

    .line 211
    .line 212
    .line 213
    return v4

    .line 214
    :cond_9
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 215
    .line 216
    .line 217
    new-instance v2, Ll/bgw0;

    .line 218
    .line 219
    invoke-direct {v2, v5}, Ll/bgw0;-><init>(I)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    move-object v7, v1

    .line 227
    check-cast v7, Ll/fer0;

    .line 228
    .line 229
    invoke-virtual {v7, v3, v4, v5, v4}, Ll/fer0;->c([BIIZ)Z

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2}, Ll/bgw0;->F()I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    shr-int/lit8 v3, v2, 0x2

    .line 237
    .line 238
    const/16 v5, 0x3ffe

    .line 239
    .line 240
    if-ne v3, v5, :cond_c

    .line 241
    .line 242
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 243
    .line 244
    .line 245
    iput v2, v0, Ll/eir0;->j:I

    .line 246
    .line 247
    iget-object v2, v0, Ll/eir0;->d:Ll/ser0;

    .line 248
    .line 249
    sget v3, Ll/mpw0;->a:I

    .line 250
    .line 251
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 252
    .line 253
    .line 254
    move-result-wide v14

    .line 255
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 256
    .line 257
    .line 258
    move-result-wide v16

    .line 259
    iget-object v12, v0, Ll/eir0;->h:Ll/ofr0;

    .line 260
    .line 261
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 262
    .line 263
    .line 264
    iget-object v1, v12, Ll/ofr0;->k:Ll/nfr0;

    .line 265
    .line 266
    if-eqz v1, :cond_a

    .line 267
    .line 268
    new-instance v1, Ll/mfr0;

    .line 269
    .line 270
    invoke-direct {v1, v12, v14, v15}, Ll/mfr0;-><init>(Ll/ofr0;J)V

    .line 271
    .line 272
    .line 273
    goto :goto_2

    .line 274
    :cond_a
    cmp-long v1, v16, v9

    .line 275
    .line 276
    const-wide/16 v5, 0x0

    .line 277
    .line 278
    if-eqz v1, :cond_b

    .line 279
    .line 280
    iget-wide v7, v12, Ll/ofr0;->j:J

    .line 281
    .line 282
    cmp-long v1, v7, v5

    .line 283
    .line 284
    if-lez v1, :cond_b

    .line 285
    .line 286
    new-instance v11, Ll/qhr0;

    .line 287
    .line 288
    iget v13, v0, Ll/eir0;->j:I

    .line 289
    .line 290
    invoke-direct/range {v11 .. v17}, Ll/qhr0;-><init>(Ll/ofr0;IJJ)V

    .line 291
    .line 292
    .line 293
    iput-object v11, v0, Ll/eir0;->k:Ll/qhr0;

    .line 294
    .line 295
    invoke-virtual {v11}, Ll/ber0;->b()Ll/bgr0;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    goto :goto_2

    .line 300
    :cond_b
    new-instance v1, Ll/agr0;

    .line 301
    .line 302
    invoke-virtual {v12}, Ll/ofr0;->a()J

    .line 303
    .line 304
    .line 305
    move-result-wide v7

    .line 306
    invoke-direct {v1, v7, v8, v5, v6}, Ll/agr0;-><init>(JJ)V

    .line 307
    .line 308
    .line 309
    :goto_2
    invoke-interface {v2, v1}, Ll/ser0;->j(Ll/bgr0;)V

    .line 310
    .line 311
    .line 312
    const/4 v1, 0x5

    .line 313
    iput v1, v0, Ll/eir0;->f:I

    .line 314
    .line 315
    return v4

    .line 316
    :cond_c
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 317
    .line 318
    .line 319
    const-string v0, "First frame does not start with sync code."

    .line 320
    .line 321
    invoke-static {v0, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    throw v0

    .line 326
    :cond_d
    iget-object v2, v0, Ll/eir0;->h:Ll/ofr0;

    .line 327
    .line 328
    :cond_e
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 329
    .line 330
    .line 331
    new-instance v3, Ll/dfw0;

    .line 332
    .line 333
    new-array v5, v8, [B

    .line 334
    .line 335
    invoke-direct {v3, v5, v8}, Ll/dfw0;-><init>([BI)V

    .line 336
    .line 337
    .line 338
    iget-object v5, v3, Ll/dfw0;->a:[B

    .line 339
    .line 340
    move-object v6, v1

    .line 341
    check-cast v6, Ll/fer0;

    .line 342
    .line 343
    invoke-virtual {v6, v5, v4, v8, v4}, Ll/fer0;->c([BIIZ)Z

    .line 344
    .line 345
    .line 346
    invoke-virtual {v3}, Ll/dfw0;->o()Z

    .line 347
    .line 348
    .line 349
    move-result v5

    .line 350
    const/4 v9, 0x7

    .line 351
    invoke-virtual {v3, v9}, Ll/dfw0;->d(I)I

    .line 352
    .line 353
    .line 354
    move-result v9

    .line 355
    const/16 v10, 0x18

    .line 356
    .line 357
    invoke-virtual {v3, v10}, Ll/dfw0;->d(I)I

    .line 358
    .line 359
    .line 360
    move-result v3

    .line 361
    add-int/2addr v3, v8

    .line 362
    const/4 v10, 0x6

    .line 363
    if-nez v9, :cond_f

    .line 364
    .line 365
    const/16 v2, 0x26

    .line 366
    .line 367
    new-array v3, v2, [B

    .line 368
    .line 369
    invoke-virtual {v6, v3, v4, v2, v4}, Ll/fer0;->b([BIIZ)Z

    .line 370
    .line 371
    .line 372
    new-instance v2, Ll/ofr0;

    .line 373
    .line 374
    invoke-direct {v2, v3, v8}, Ll/ofr0;-><init>([BI)V

    .line 375
    .line 376
    .line 377
    goto :goto_3

    .line 378
    :cond_f
    if-eqz v2, :cond_13

    .line 379
    .line 380
    if-ne v9, v7, :cond_10

    .line 381
    .line 382
    new-instance v9, Ll/bgw0;

    .line 383
    .line 384
    invoke-direct {v9, v3}, Ll/bgw0;-><init>(I)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 388
    .line 389
    .line 390
    move-result-object v11

    .line 391
    invoke-virtual {v6, v11, v4, v3, v4}, Ll/fer0;->b([BIIZ)Z

    .line 392
    .line 393
    .line 394
    invoke-static {v9}, Ll/lfr0;->b(Ll/bgw0;)Ll/nfr0;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    invoke-virtual {v2, v3}, Ll/ofr0;->f(Ll/nfr0;)Ll/ofr0;

    .line 399
    .line 400
    .line 401
    move-result-object v2

    .line 402
    goto :goto_3

    .line 403
    :cond_10
    if-ne v9, v8, :cond_11

    .line 404
    .line 405
    new-instance v9, Ll/bgw0;

    .line 406
    .line 407
    invoke-direct {v9, v3}, Ll/bgw0;-><init>(I)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 411
    .line 412
    .line 413
    move-result-object v11

    .line 414
    invoke-virtual {v6, v11, v4, v3, v4}, Ll/fer0;->b([BIIZ)Z

    .line 415
    .line 416
    .line 417
    invoke-virtual {v9, v8}, Ll/bgw0;->l(I)V

    .line 418
    .line 419
    .line 420
    invoke-static {v9, v4, v4}, Ll/ygr0;->c(Ll/bgw0;ZZ)Ll/vgr0;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    iget-object v3, v3, Ll/vgr0;->b:[Ljava/lang/String;

    .line 425
    .line 426
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 427
    .line 428
    .line 429
    move-result-object v3

    .line 430
    invoke-virtual {v2, v3}, Ll/ofr0;->g(Ljava/util/List;)Ll/ofr0;

    .line 431
    .line 432
    .line 433
    move-result-object v2

    .line 434
    goto :goto_3

    .line 435
    :cond_11
    if-ne v9, v10, :cond_12

    .line 436
    .line 437
    new-instance v9, Ll/bgw0;

    .line 438
    .line 439
    invoke-direct {v9, v3}, Ll/bgw0;-><init>(I)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 443
    .line 444
    .line 445
    move-result-object v11

    .line 446
    invoke-virtual {v6, v11, v4, v3, v4}, Ll/fer0;->b([BIIZ)Z

    .line 447
    .line 448
    .line 449
    invoke-virtual {v9, v8}, Ll/bgw0;->l(I)V

    .line 450
    .line 451
    .line 452
    invoke-static {v9}, Lcom/google/android/gms/internal/ads/zzafw;->a(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzafw;

    .line 453
    .line 454
    .line 455
    move-result-object v3

    .line 456
    invoke-static {v3}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 457
    .line 458
    .line 459
    move-result-object v3

    .line 460
    invoke-virtual {v2, v3}, Ll/ofr0;->e(Ljava/util/List;)Ll/ofr0;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    goto :goto_3

    .line 465
    :cond_12
    invoke-virtual {v6, v3, v4}, Ll/fer0;->k(IZ)Z

    .line 466
    .line 467
    .line 468
    :goto_3
    sget v3, Ll/mpw0;->a:I

    .line 469
    .line 470
    iput-object v2, v0, Ll/eir0;->h:Ll/ofr0;

    .line 471
    .line 472
    if-eqz v5, :cond_e

    .line 473
    .line 474
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 475
    .line 476
    .line 477
    iget v1, v2, Ll/ofr0;->c:I

    .line 478
    .line 479
    invoke-static {v1, v10}, Ljava/lang/Math;->max(II)I

    .line 480
    .line 481
    .line 482
    move-result v1

    .line 483
    iput v1, v0, Ll/eir0;->i:I

    .line 484
    .line 485
    iget-object v1, v0, Ll/eir0;->e:Ll/sgr0;

    .line 486
    .line 487
    iget-object v2, v0, Ll/eir0;->h:Ll/ofr0;

    .line 488
    .line 489
    iget-object v3, v0, Ll/eir0;->a:[B

    .line 490
    .line 491
    iget-object v5, v0, Ll/eir0;->g:Lcom/google/android/gms/internal/ads/zzby;

    .line 492
    .line 493
    invoke-virtual {v2, v3, v5}, Ll/ofr0;->c([BLcom/google/android/gms/internal/ads/zzby;)Ll/sqr0;

    .line 494
    .line 495
    .line 496
    move-result-object v2

    .line 497
    invoke-interface {v1, v2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 498
    .line 499
    .line 500
    iput v8, v0, Ll/eir0;->f:I

    .line 501
    .line 502
    return v4

    .line 503
    :cond_13
    invoke-static {}, Ll/fig0;->a()V

    .line 504
    .line 505
    .line 506
    return v4

    .line 507
    :cond_14
    new-instance v2, Ll/bgw0;

    .line 508
    .line 509
    invoke-direct {v2, v8}, Ll/bgw0;-><init>(I)V

    .line 510
    .line 511
    .line 512
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 513
    .line 514
    .line 515
    move-result-object v3

    .line 516
    check-cast v1, Ll/fer0;

    .line 517
    .line 518
    invoke-virtual {v1, v3, v4, v8, v4}, Ll/fer0;->b([BIIZ)Z

    .line 519
    .line 520
    .line 521
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 522
    .line 523
    .line 524
    move-result-wide v1

    .line 525
    const-wide/32 v8, 0x664c6143

    .line 526
    .line 527
    .line 528
    cmp-long v1, v1, v8

    .line 529
    .line 530
    if-nez v1, :cond_15

    .line 531
    .line 532
    iput v7, v0, Ll/eir0;->f:I

    .line 533
    .line 534
    return v4

    .line 535
    :cond_15
    const-string v0, "Failed to read FLAC stream marker."

    .line 536
    .line 537
    invoke-static {v0, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    throw v0

    .line 542
    :cond_16
    iget-object v2, v0, Ll/eir0;->a:[B

    .line 543
    .line 544
    move-object v3, v1

    .line 545
    check-cast v3, Ll/fer0;

    .line 546
    .line 547
    const/16 v6, 0x2a

    .line 548
    .line 549
    invoke-virtual {v3, v2, v4, v6, v4}, Ll/fer0;->c([BIIZ)Z

    .line 550
    .line 551
    .line 552
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 553
    .line 554
    .line 555
    iput v5, v0, Ll/eir0;->f:I

    .line 556
    .line 557
    return v4

    .line 558
    :cond_17
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 559
    .line 560
    .line 561
    invoke-interface {v1}, Ll/qer0;->zze()J

    .line 562
    .line 563
    .line 564
    move-result-wide v5

    .line 565
    invoke-static {v1, v3}, Ll/lfr0;->a(Ll/qer0;Z)Lcom/google/android/gms/internal/ads/zzby;

    .line 566
    .line 567
    .line 568
    move-result-object v2

    .line 569
    invoke-interface {v1}, Ll/qer0;->zze()J

    .line 570
    .line 571
    .line 572
    move-result-wide v7

    .line 573
    sub-long/2addr v7, v5

    .line 574
    check-cast v1, Ll/fer0;

    .line 575
    .line 576
    long-to-int v5, v7

    .line 577
    invoke-virtual {v1, v5, v4}, Ll/fer0;->k(IZ)Z

    .line 578
    .line 579
    .line 580
    iput-object v2, v0, Ll/eir0;->g:Lcom/google/android/gms/internal/ads/zzby;

    .line 581
    .line 582
    iput v3, v0, Ll/eir0;->f:I

    .line 583
    .line 584
    return v4
.end method
