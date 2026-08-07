.class public final Ll/hir0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final q:Ll/ifr0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/bgw0;

.field public final c:Ll/bgw0;

.field public final d:Ll/bgw0;

.field public final e:Ll/iir0;

.field public f:Ll/ser0;

.field public g:I

.field public h:Z

.field public i:J

.field public j:I

.field public k:I

.field public l:I

.field public m:J

.field public n:Z

.field public o:Ll/fir0;

.field public p:Ll/kir0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/gir0;->b:Ll/gir0;

    .line 2
    .line 3
    sput-object v0, Ll/hir0;->q:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 11
    .line 12
    new-instance v0, Ll/bgw0;

    .line 13
    .line 14
    const/16 v1, 0x9

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/hir0;->b:Ll/bgw0;

    .line 20
    .line 21
    new-instance v0, Ll/bgw0;

    .line 22
    .line 23
    const/16 v1, 0xb

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/hir0;->c:Ll/bgw0;

    .line 29
    .line 30
    new-instance v0, Ll/bgw0;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/hir0;->d:Ll/bgw0;

    .line 36
    .line 37
    new-instance v0, Ll/iir0;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/iir0;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/hir0;->e:Ll/iir0;

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    iput v0, p0, Ll/hir0;->g:I

    .line 46
    .line 47
    return-void
.end method

.method private final b()V
    .locals 6
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "extractorOutput"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/hir0;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/hir0;->f:Ll/ser0;

    .line 6
    .line 7
    new-instance v1, Ll/agr0;

    .line 8
    .line 9
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    invoke-direct {v1, v2, v3, v4, v5}, Ll/agr0;-><init>(JJ)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1}, Ll/ser0;->j(Ll/bgr0;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Ll/hir0;->n:Z

    .line 24
    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;)Ll/bgw0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/hir0;->l:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/hir0;->d:Ll/bgw0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/bgw0;->r()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/hir0;->d:Ll/bgw0;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/bgw0;->r()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/2addr v0, v0

    .line 19
    iget v1, p0, Ll/hir0;->l:I

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    new-array v0, v0, [B

    .line 26
    .line 27
    invoke-virtual {v2, v0, v3}, Ll/bgw0;->i([BI)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v2, v3}, Ll/bgw0;->k(I)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Ll/hir0;->d:Ll/bgw0;

    .line 35
    .line 36
    iget v1, p0, Ll/hir0;->l:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/bgw0;->j(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/hir0;->d:Ll/bgw0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget v1, p0, Ll/hir0;->l:I

    .line 48
    .line 49
    check-cast p1, Ll/fer0;

    .line 50
    .line 51
    invoke-virtual {p1, v0, v3, v1, v3}, Ll/fer0;->b([BIIZ)Z

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/hir0;->d:Ll/bgw0;

    .line 55
    .line 56
    return-object p0
.end method

.method public final c(JJ)V
    .locals 0

    .line 1
    const-wide/16 p3, 0x0

    .line 2
    .line 3
    cmp-long p1, p1, p3

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput p1, p0, Ll/hir0;->g:I

    .line 10
    .line 11
    iput-boolean p2, p0, Ll/hir0;->h:Z

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x3

    .line 15
    iput p1, p0, Ll/hir0;->g:I

    .line 16
    .line 17
    :goto_0
    iput p2, p0, Ll/hir0;->j:I

    .line 18
    .line 19
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
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, p1

    .line 8
    check-cast v1, Ll/fer0;

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v1, v0, v3, v2, v3}, Ll/fer0;->c([BIIZ)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/bgw0;->D()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const v2, 0x464c56

    .line 27
    .line 28
    .line 29
    if-eq v0, v2, :cond_0

    .line 30
    .line 31
    return v3

    .line 32
    :cond_0
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v2, 0x2

    .line 39
    invoke-virtual {v1, v0, v3, v2, v3}, Ll/fer0;->c([BIIZ)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/bgw0;->F()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    and-int/lit16 v0, v0, 0xfa

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    return v3

    .line 58
    :cond_1
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v2, 0x4

    .line 65
    invoke-virtual {v1, v0, v3, v2, v3}, Ll/fer0;->c([BIIZ)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/bgw0;->v()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 80
    .line 81
    .line 82
    check-cast p1, Ll/fer0;

    .line 83
    .line 84
    invoke-virtual {p1, v0, v3}, Ll/fer0;->j(IZ)Z

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p1, v0, v3, v2, v3}, Ll/fer0;->c([BIIZ)Z

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/hir0;->a:Ll/bgw0;

    .line 97
    .line 98
    invoke-virtual {p1, v3}, Ll/bgw0;->k(I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/hir0;->a:Ll/bgw0;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_2

    .line 108
    .line 109
    const/4 p0, 0x1

    .line 110
    return p0

    .line 111
    :cond_2
    return v3
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hir0;->f:Ll/ser0;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 16
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
    iget-object v2, v0, Ll/hir0;->f:Ll/ser0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    :cond_0
    :goto_0
    iget v2, v0, Ll/hir0;->g:I

    .line 11
    .line 12
    const/4 v3, -0x1

    .line 13
    const/16 v4, 0x9

    .line 14
    .line 15
    const/16 v5, 0x8

    .line 16
    .line 17
    const/4 v6, 0x2

    .line 18
    const/4 v7, 0x4

    .line 19
    const/4 v8, 0x0

    .line 20
    const/4 v9, 0x1

    .line 21
    if-eq v2, v9, :cond_e

    .line 22
    .line 23
    const/4 v10, 0x3

    .line 24
    if-eq v2, v6, :cond_d

    .line 25
    .line 26
    if-eq v2, v10, :cond_b

    .line 27
    .line 28
    if-ne v2, v7, :cond_a

    .line 29
    .line 30
    iget-boolean v2, v0, Ll/hir0;->h:Z

    .line 31
    .line 32
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-wide v2, v0, Ll/hir0;->i:J

    .line 40
    .line 41
    iget-wide v14, v0, Ll/hir0;->m:J

    .line 42
    .line 43
    add-long/2addr v2, v14

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget-object v2, v0, Ll/hir0;->e:Ll/iir0;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/iir0;->d()J

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    cmp-long v2, v2, v12

    .line 52
    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    const-wide/16 v2, 0x0

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget-wide v2, v0, Ll/hir0;->m:J

    .line 59
    .line 60
    :goto_1
    iget v14, v0, Ll/hir0;->k:I

    .line 61
    .line 62
    if-ne v14, v5, :cond_4

    .line 63
    .line 64
    iget-object v14, v0, Ll/hir0;->o:Ll/fir0;

    .line 65
    .line 66
    if-eqz v14, :cond_5

    .line 67
    .line 68
    invoke-direct {v0}, Ll/hir0;->b()V

    .line 69
    .line 70
    .line 71
    iget-object v4, v0, Ll/hir0;->o:Ll/fir0;

    .line 72
    .line 73
    invoke-virtual/range {p0 .. p1}, Ll/hir0;->a(Ll/qer0;)Ll/bgw0;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-virtual {v4, v5, v2, v3}, Ll/jir0;->c(Ll/bgw0;J)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    :cond_3
    :goto_2
    move v3, v9

    .line 82
    goto :goto_3

    .line 83
    :cond_4
    move v5, v14

    .line 84
    :cond_5
    if-ne v5, v4, :cond_6

    .line 85
    .line 86
    iget-object v4, v0, Ll/hir0;->p:Ll/kir0;

    .line 87
    .line 88
    if-eqz v4, :cond_7

    .line 89
    .line 90
    invoke-direct {v0}, Ll/hir0;->b()V

    .line 91
    .line 92
    .line 93
    iget-object v4, v0, Ll/hir0;->p:Ll/kir0;

    .line 94
    .line 95
    invoke-virtual/range {p0 .. p1}, Ll/hir0;->a(Ll/qer0;)Ll/bgw0;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v4, v5, v2, v3}, Ll/jir0;->c(Ll/bgw0;J)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    goto :goto_2

    .line 104
    :cond_6
    const/16 v4, 0x12

    .line 105
    .line 106
    if-ne v5, v4, :cond_7

    .line 107
    .line 108
    iget-boolean v4, v0, Ll/hir0;->n:Z

    .line 109
    .line 110
    if-nez v4, :cond_7

    .line 111
    .line 112
    iget-object v4, v0, Ll/hir0;->e:Ll/iir0;

    .line 113
    .line 114
    invoke-virtual/range {p0 .. p1}, Ll/hir0;->a(Ll/qer0;)Ll/bgw0;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v4, v5, v2, v3}, Ll/jir0;->c(Ll/bgw0;J)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iget-object v3, v0, Ll/hir0;->e:Ll/iir0;

    .line 123
    .line 124
    invoke-virtual {v3}, Ll/iir0;->d()J

    .line 125
    .line 126
    .line 127
    move-result-wide v4

    .line 128
    cmp-long v14, v4, v12

    .line 129
    .line 130
    if-eqz v14, :cond_3

    .line 131
    .line 132
    iget-object v14, v0, Ll/hir0;->f:Ll/ser0;

    .line 133
    .line 134
    new-instance v15, Ll/ufr0;

    .line 135
    .line 136
    invoke-virtual {v3}, Ll/iir0;->e()[J

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    invoke-virtual {v3}, Ll/iir0;->f()[J

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-direct {v15, v10, v3, v4, v5}, Ll/ufr0;-><init>([J[JJ)V

    .line 145
    .line 146
    .line 147
    invoke-interface {v14, v15}, Ll/ser0;->j(Ll/bgr0;)V

    .line 148
    .line 149
    .line 150
    iput-boolean v9, v0, Ll/hir0;->n:Z

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_7
    iget v2, v0, Ll/hir0;->l:I

    .line 154
    .line 155
    move-object v3, v1

    .line 156
    check-cast v3, Ll/fer0;

    .line 157
    .line 158
    invoke-virtual {v3, v2, v8}, Ll/fer0;->k(IZ)Z

    .line 159
    .line 160
    .line 161
    move v2, v8

    .line 162
    move v3, v2

    .line 163
    :goto_3
    iget-boolean v4, v0, Ll/hir0;->h:Z

    .line 164
    .line 165
    if-nez v4, :cond_9

    .line 166
    .line 167
    if-eqz v2, :cond_9

    .line 168
    .line 169
    iput-boolean v9, v0, Ll/hir0;->h:Z

    .line 170
    .line 171
    iget-object v2, v0, Ll/hir0;->e:Ll/iir0;

    .line 172
    .line 173
    invoke-virtual {v2}, Ll/iir0;->d()J

    .line 174
    .line 175
    .line 176
    move-result-wide v4

    .line 177
    cmp-long v2, v4, v12

    .line 178
    .line 179
    if-nez v2, :cond_8

    .line 180
    .line 181
    iget-wide v4, v0, Ll/hir0;->m:J

    .line 182
    .line 183
    neg-long v10, v4

    .line 184
    goto :goto_4

    .line 185
    :cond_8
    const-wide/16 v10, 0x0

    .line 186
    .line 187
    :goto_4
    iput-wide v10, v0, Ll/hir0;->i:J

    .line 188
    .line 189
    :cond_9
    iput v7, v0, Ll/hir0;->j:I

    .line 190
    .line 191
    iput v6, v0, Ll/hir0;->g:I

    .line 192
    .line 193
    if-eqz v3, :cond_0

    .line 194
    .line 195
    return v8

    .line 196
    :cond_a
    invoke-static {}, Ll/wpg0;->a()V

    .line 197
    .line 198
    .line 199
    return v8

    .line 200
    :cond_b
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 201
    .line 202
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    const/16 v4, 0xb

    .line 207
    .line 208
    invoke-interface {v1, v2, v8, v4, v9}, Ll/qer0;->b([BIIZ)Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-nez v2, :cond_c

    .line 213
    .line 214
    return v3

    .line 215
    :cond_c
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 216
    .line 217
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 218
    .line 219
    .line 220
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 221
    .line 222
    invoke-virtual {v2}, Ll/bgw0;->B()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    iput v2, v0, Ll/hir0;->k:I

    .line 227
    .line 228
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 229
    .line 230
    invoke-virtual {v2}, Ll/bgw0;->D()I

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    iput v2, v0, Ll/hir0;->l:I

    .line 235
    .line 236
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 237
    .line 238
    invoke-virtual {v2}, Ll/bgw0;->D()I

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    int-to-long v2, v2

    .line 243
    iput-wide v2, v0, Ll/hir0;->m:J

    .line 244
    .line 245
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 246
    .line 247
    invoke-virtual {v2}, Ll/bgw0;->B()I

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    shl-int/lit8 v2, v2, 0x18

    .line 252
    .line 253
    iget-wide v3, v0, Ll/hir0;->m:J

    .line 254
    .line 255
    int-to-long v5, v2

    .line 256
    or-long v2, v5, v3

    .line 257
    .line 258
    const-wide/16 v4, 0x3e8

    .line 259
    .line 260
    mul-long/2addr v2, v4

    .line 261
    iput-wide v2, v0, Ll/hir0;->m:J

    .line 262
    .line 263
    iget-object v2, v0, Ll/hir0;->c:Ll/bgw0;

    .line 264
    .line 265
    invoke-virtual {v2, v10}, Ll/bgw0;->l(I)V

    .line 266
    .line 267
    .line 268
    iput v7, v0, Ll/hir0;->g:I

    .line 269
    .line 270
    goto/16 :goto_0

    .line 271
    .line 272
    :cond_d
    iget v2, v0, Ll/hir0;->j:I

    .line 273
    .line 274
    move-object v3, v1

    .line 275
    check-cast v3, Ll/fer0;

    .line 276
    .line 277
    invoke-virtual {v3, v2, v8}, Ll/fer0;->k(IZ)Z

    .line 278
    .line 279
    .line 280
    iput v8, v0, Ll/hir0;->j:I

    .line 281
    .line 282
    iput v10, v0, Ll/hir0;->g:I

    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :cond_e
    iget-object v2, v0, Ll/hir0;->b:Ll/bgw0;

    .line 287
    .line 288
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-interface {v1, v2, v8, v4, v9}, Ll/qer0;->b([BIIZ)Z

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    if-nez v2, :cond_f

    .line 297
    .line 298
    return v3

    .line 299
    :cond_f
    iget-object v2, v0, Ll/hir0;->b:Ll/bgw0;

    .line 300
    .line 301
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 302
    .line 303
    .line 304
    iget-object v2, v0, Ll/hir0;->b:Ll/bgw0;

    .line 305
    .line 306
    invoke-virtual {v2, v7}, Ll/bgw0;->l(I)V

    .line 307
    .line 308
    .line 309
    iget-object v2, v0, Ll/hir0;->b:Ll/bgw0;

    .line 310
    .line 311
    invoke-virtual {v2}, Ll/bgw0;->B()I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    and-int/lit8 v3, v2, 0x4

    .line 316
    .line 317
    and-int/2addr v2, v9

    .line 318
    if-eqz v3, :cond_10

    .line 319
    .line 320
    iget-object v3, v0, Ll/hir0;->o:Ll/fir0;

    .line 321
    .line 322
    if-nez v3, :cond_10

    .line 323
    .line 324
    new-instance v3, Ll/fir0;

    .line 325
    .line 326
    iget-object v7, v0, Ll/hir0;->f:Ll/ser0;

    .line 327
    .line 328
    invoke-interface {v7, v5, v9}, Ll/ser0;->i(II)Ll/sgr0;

    .line 329
    .line 330
    .line 331
    move-result-object v5

    .line 332
    invoke-direct {v3, v5}, Ll/fir0;-><init>(Ll/sgr0;)V

    .line 333
    .line 334
    .line 335
    iput-object v3, v0, Ll/hir0;->o:Ll/fir0;

    .line 336
    .line 337
    :cond_10
    if-eqz v2, :cond_11

    .line 338
    .line 339
    iget-object v2, v0, Ll/hir0;->p:Ll/kir0;

    .line 340
    .line 341
    if-nez v2, :cond_11

    .line 342
    .line 343
    new-instance v2, Ll/kir0;

    .line 344
    .line 345
    iget-object v3, v0, Ll/hir0;->f:Ll/ser0;

    .line 346
    .line 347
    invoke-interface {v3, v4, v6}, Ll/ser0;->i(II)Ll/sgr0;

    .line 348
    .line 349
    .line 350
    move-result-object v3

    .line 351
    invoke-direct {v2, v3}, Ll/kir0;-><init>(Ll/sgr0;)V

    .line 352
    .line 353
    .line 354
    iput-object v2, v0, Ll/hir0;->p:Ll/kir0;

    .line 355
    .line 356
    :cond_11
    iget-object v2, v0, Ll/hir0;->f:Ll/ser0;

    .line 357
    .line 358
    invoke-interface {v2}, Ll/ser0;->c()V

    .line 359
    .line 360
    .line 361
    iget-object v2, v0, Ll/hir0;->b:Ll/bgw0;

    .line 362
    .line 363
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 364
    .line 365
    .line 366
    move-result v2

    .line 367
    add-int/lit8 v2, v2, -0x5

    .line 368
    .line 369
    iput v2, v0, Ll/hir0;->j:I

    .line 370
    .line 371
    iput v6, v0, Ll/hir0;->g:I

    .line 372
    .line 373
    goto/16 :goto_0
.end method
