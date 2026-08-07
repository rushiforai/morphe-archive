.class public final Ll/e9r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hte;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/ig60;

.field public final c:Ll/hg60;

.field public d:Ll/qfj0;

.field public e:Ljava/lang/String;

.field public f:Lcom/google/android/exoplayer2/k;

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:J

.field public l:Z

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:J

.field public r:I

.field public s:J

.field public t:I

.field public u:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e9r;->a:Ljava/lang/String;

    .line 5
    .line 6
    new-instance p1, Ll/ig60;

    .line 7
    .line 8
    const/16 v0, 0x400

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/ig60;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/e9r;->b:Ll/ig60;

    .line 14
    .line 15
    new-instance v0, Ll/hg60;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {v0, p1}, Ll/hg60;-><init>([B)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/e9r;->c:Ll/hg60;

    .line 25
    .line 26
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    iput-wide v0, p0, Ll/e9r;->k:J

    .line 32
    .line 33
    return-void
.end method

.method public static f(Ll/hg60;)J
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/hg60;->h(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    mul-int/lit8 v0, v0, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/hg60;->h(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    int-to-long v0, p0

    .line 15
    return-wide v0
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/e9r;->d:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_7

    .line 11
    .line 12
    iget v0, p0, Ll/e9r;->g:I

    .line 13
    .line 14
    const/16 v1, 0x56

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_6

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    const/4 v4, 0x0

    .line 21
    if-eq v0, v2, :cond_4

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    if-eq v0, v3, :cond_2

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget v1, p0, Ll/e9r;->i:I

    .line 33
    .line 34
    iget v2, p0, Ll/e9r;->h:I

    .line 35
    .line 36
    sub-int/2addr v1, v2

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v1, p0, Ll/e9r;->c:Ll/hg60;

    .line 42
    .line 43
    iget-object v1, v1, Ll/hg60;->a:[B

    .line 44
    .line 45
    iget v2, p0, Ll/e9r;->h:I

    .line 46
    .line 47
    invoke-virtual {p1, v1, v2, v0}, Ll/ig60;->l([BII)V

    .line 48
    .line 49
    .line 50
    iget v1, p0, Ll/e9r;->h:I

    .line 51
    .line 52
    add-int/2addr v1, v0

    .line 53
    iput v1, p0, Ll/e9r;->h:I

    .line 54
    .line 55
    iget v0, p0, Ll/e9r;->i:I

    .line 56
    .line 57
    if-ne v1, v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Ll/e9r;->c:Ll/hg60;

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Ll/hg60;->p(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/e9r;->c:Ll/hg60;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/e9r;->g(Ll/hg60;)V

    .line 67
    .line 68
    .line 69
    iput v4, p0, Ll/e9r;->g:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    iget v0, p0, Ll/e9r;->j:I

    .line 77
    .line 78
    and-int/lit16 v0, v0, -0xe1

    .line 79
    .line 80
    shl-int/lit8 v0, v0, 0x8

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    or-int/2addr v0, v2

    .line 87
    iput v0, p0, Ll/e9r;->i:I

    .line 88
    .line 89
    iget-object v2, p0, Ll/e9r;->b:Ll/ig60;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/ig60;->e()[B

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    array-length v2, v2

    .line 96
    if-le v0, v2, :cond_3

    .line 97
    .line 98
    iget v0, p0, Ll/e9r;->i:I

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ll/e9r;->m(I)V

    .line 101
    .line 102
    .line 103
    :cond_3
    iput v4, p0, Ll/e9r;->h:I

    .line 104
    .line 105
    iput v1, p0, Ll/e9r;->g:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_4
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    and-int/lit16 v2, v0, 0xe0

    .line 113
    .line 114
    const/16 v5, 0xe0

    .line 115
    .line 116
    if-ne v2, v5, :cond_5

    .line 117
    .line 118
    iput v0, p0, Ll/e9r;->j:I

    .line 119
    .line 120
    iput v3, p0, Ll/e9r;->g:I

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    if-eq v0, v1, :cond_0

    .line 124
    .line 125
    iput v4, p0, Ll/e9r;->g:I

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_6
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-ne v0, v1, :cond_0

    .line 133
    .line 134
    iput v2, p0, Ll/e9r;->g:I

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_7
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/e9r;->g:I

    .line 3
    .line 4
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide v1, p0, Ll/e9r;->k:J

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/e9r;->l:Z

    .line 12
    .line 13
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(JI)V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long p3, p1, v0

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/e9r;->k:J

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public e(Ll/bsf;Ll/jkj0$d;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/jkj0$d;->a()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/jkj0$d;->c()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-interface {p1, v0, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/e9r;->d:Ll/qfj0;

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/jkj0$d;->b()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/e9r;->e:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public final g(Ll/hg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/hg60;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/e9r;->l:Z

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/e9r;->l(Ll/hg60;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-boolean v0, p0, Ll/e9r;->l:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    iget v0, p0, Ll/e9r;->m:I

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-nez v0, :cond_4

    .line 23
    .line 24
    iget v0, p0, Ll/e9r;->n:I

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/e9r;->j(Ll/hg60;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, p1, v0}, Ll/e9r;->k(Ll/hg60;I)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Ll/e9r;->p:Z

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-wide v0, p0, Ll/e9r;->q:J

    .line 40
    .line 41
    long-to-int p0, v0

    .line 42
    invoke-virtual {p1, p0}, Ll/hg60;->r(I)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_1
    return-void

    .line 46
    :cond_3
    invoke-static {v1, v1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    throw p0

    .line 51
    :cond_4
    invoke-static {v1, v1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    throw p0
.end method

.method public final h(Ll/hg60;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/hg60;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {p1, v1}, Ll/z1;->e(Ll/hg60;Z)Ll/z1$b;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, v1, Ll/z1$b;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v2, p0, Ll/e9r;->u:Ljava/lang/String;

    .line 13
    .line 14
    iget v2, v1, Ll/z1$b;->a:I

    .line 15
    .line 16
    iput v2, p0, Ll/e9r;->r:I

    .line 17
    .line 18
    iget v1, v1, Ll/z1$b;->b:I

    .line 19
    .line 20
    iput v1, p0, Ll/e9r;->t:I

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/hg60;->b()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sub-int/2addr v0, p0

    .line 27
    return v0
.end method

.method public final i(Ll/hg60;)V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p1, v0}, Ll/hg60;->h(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    iput v1, p0, Ll/e9r;->o:I

    .line 7
    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    if-eq v1, p0, :cond_3

    .line 12
    .line 13
    const/4 v2, 0x6

    .line 14
    if-eq v1, v0, :cond_2

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    if-eq v1, v0, :cond_2

    .line 18
    .line 19
    const/4 v0, 0x5

    .line 20
    if-eq v1, v0, :cond_2

    .line 21
    .line 22
    if-eq v1, v2, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x7

    .line 25
    if-ne v1, v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    invoke-virtual {p1, p0}, Ll/hg60;->r(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-virtual {p1, v2}, Ll/hg60;->r(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    const/16 p0, 0x9

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ll/hg60;->r(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_4
    const/16 p0, 0x8

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Ll/hg60;->r(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final j(Ll/hg60;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/e9r;->o:I

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    const/16 v0, 0x8

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/hg60;->h(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/2addr p0, v0

    .line 13
    const/16 v1, 0xff

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    invoke-static {p0, p0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    throw p0
.end method

.method public final k(Ll/hg60;I)V
    .locals 8
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/hg60;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v1, v0, 0x7

    .line 6
    .line 7
    iget-object v2, p0, Ll/e9r;->b:Ll/ig60;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    shr-int/lit8 p1, v0, 0x3

    .line 12
    .line 13
    invoke-virtual {v2, p1}, Ll/ig60;->U(I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v2}, Ll/ig60;->e()[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    mul-int/lit8 v1, p2, 0x8

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {p1, v0, v2, v1}, Ll/hg60;->i([BII)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/e9r;->b:Ll/ig60;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Ll/ig60;->U(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Ll/e9r;->d:Ll/qfj0;

    .line 33
    .line 34
    iget-object v0, p0, Ll/e9r;->b:Ll/ig60;

    .line 35
    .line 36
    invoke-interface {p1, v0, p2}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 37
    .line 38
    .line 39
    iget-wide v2, p0, Ll/e9r;->k:J

    .line 40
    .line 41
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    cmp-long p1, v2, v0

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object v1, p0, Ll/e9r;->d:Ll/qfj0;

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    const/4 v7, 0x0

    .line 54
    const/4 v4, 0x1

    .line 55
    move v5, p2

    .line 56
    invoke-interface/range {v1 .. v7}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 57
    .line 58
    .line 59
    iget-wide p1, p0, Ll/e9r;->k:J

    .line 60
    .line 61
    iget-wide v0, p0, Ll/e9r;->s:J

    .line 62
    .line 63
    add-long/2addr p1, v0

    .line 64
    iput-wide p1, p0, Ll/e9r;->k:J

    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public final l(Ll/hg60;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ll/hg60;->h(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/hg60;->h(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v3, v2

    .line 15
    :goto_0
    iput v3, p0, Ll/e9r;->m:I

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-nez v3, :cond_9

    .line 19
    .line 20
    if-ne v1, v0, :cond_1

    .line 21
    .line 22
    invoke-static {p1}, Ll/e9r;->f(Ll/hg60;)J

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p1}, Ll/hg60;->g()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_8

    .line 30
    .line 31
    const/4 v3, 0x6

    .line 32
    invoke-virtual {p1, v3}, Ll/hg60;->h(I)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iput v3, p0, Ll/e9r;->n:I

    .line 37
    .line 38
    const/4 v3, 0x4

    .line 39
    invoke-virtual {p1, v3}, Ll/hg60;->h(I)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v5, 0x3

    .line 44
    invoke-virtual {p1, v5}, Ll/hg60;->h(I)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-nez v3, :cond_7

    .line 49
    .line 50
    if-nez v5, :cond_7

    .line 51
    .line 52
    const/16 v3, 0x8

    .line 53
    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/hg60;->e()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {p0, p1}, Ll/e9r;->h(Ll/hg60;)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-virtual {p1, v4}, Ll/hg60;->p(I)V

    .line 65
    .line 66
    .line 67
    add-int/lit8 v4, v5, 0x7

    .line 68
    .line 69
    div-int/2addr v4, v3

    .line 70
    new-array v4, v4, [B

    .line 71
    .line 72
    invoke-virtual {p1, v4, v2, v5}, Ll/hg60;->i([BII)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Lcom/google/android/exoplayer2/k$b;

    .line 76
    .line 77
    invoke-direct {v2}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object v5, p0, Ll/e9r;->e:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    const-string v5, "audio/mp4a-latm"

    .line 87
    .line 88
    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v5, p0, Ll/e9r;->u:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer2/k$b;->K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iget v5, p0, Ll/e9r;->t:I

    .line 99
    .line 100
    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iget v5, p0, Ll/e9r;->r:I

    .line 105
    .line 106
    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/k$b;->V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    iget-object v4, p0, Ll/e9r;->a:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget-object v4, p0, Ll/e9r;->f:Lcom/google/android/exoplayer2/k;

    .line 129
    .line 130
    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/k;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    if-nez v4, :cond_3

    .line 135
    .line 136
    iput-object v2, p0, Ll/e9r;->f:Lcom/google/android/exoplayer2/k;

    .line 137
    .line 138
    iget v4, v2, Lcom/google/android/exoplayer2/k;->z:I

    .line 139
    .line 140
    int-to-long v4, v4

    .line 141
    const-wide/32 v6, 0x3d090000

    .line 142
    .line 143
    .line 144
    div-long/2addr v6, v4

    .line 145
    iput-wide v6, p0, Ll/e9r;->s:J

    .line 146
    .line 147
    iget-object v4, p0, Ll/e9r;->d:Ll/qfj0;

    .line 148
    .line 149
    invoke-interface {v4, v2}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_2
    invoke-static {p1}, Ll/e9r;->f(Ll/hg60;)J

    .line 154
    .line 155
    .line 156
    move-result-wide v4

    .line 157
    long-to-int v2, v4

    .line 158
    invoke-virtual {p0, p1}, Ll/e9r;->h(Ll/hg60;)I

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    sub-int/2addr v2, v4

    .line 163
    invoke-virtual {p1, v2}, Ll/hg60;->r(I)V

    .line 164
    .line 165
    .line 166
    :cond_3
    :goto_1
    invoke-virtual {p0, p1}, Ll/e9r;->i(Ll/hg60;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Ll/hg60;->g()Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    iput-boolean v2, p0, Ll/e9r;->p:Z

    .line 174
    .line 175
    const-wide/16 v4, 0x0

    .line 176
    .line 177
    iput-wide v4, p0, Ll/e9r;->q:J

    .line 178
    .line 179
    if-eqz v2, :cond_5

    .line 180
    .line 181
    if-ne v1, v0, :cond_4

    .line 182
    .line 183
    invoke-static {p1}, Ll/e9r;->f(Ll/hg60;)J

    .line 184
    .line 185
    .line 186
    move-result-wide v0

    .line 187
    iput-wide v0, p0, Ll/e9r;->q:J

    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_4
    invoke-virtual {p1}, Ll/hg60;->g()Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    iget-wide v1, p0, Ll/e9r;->q:J

    .line 195
    .line 196
    shl-long/2addr v1, v3

    .line 197
    invoke-virtual {p1, v3}, Ll/hg60;->h(I)I

    .line 198
    .line 199
    .line 200
    move-result v4

    .line 201
    int-to-long v4, v4

    .line 202
    add-long/2addr v1, v4

    .line 203
    iput-wide v1, p0, Ll/e9r;->q:J

    .line 204
    .line 205
    if-nez v0, :cond_4

    .line 206
    .line 207
    :cond_5
    :goto_2
    invoke-virtual {p1}, Ll/hg60;->g()Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-eqz p0, :cond_6

    .line 212
    .line 213
    invoke-virtual {p1, v3}, Ll/hg60;->r(I)V

    .line 214
    .line 215
    .line 216
    :cond_6
    return-void

    .line 217
    :cond_7
    invoke-static {v4, v4}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    throw p0

    .line 222
    :cond_8
    invoke-static {v4, v4}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    throw p0

    .line 227
    :cond_9
    invoke-static {v4, v4}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    throw p0
.end method

.method public final m(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e9r;->b:Ll/ig60;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ig60;->Q(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/e9r;->c:Ll/hg60;

    .line 7
    .line 8
    iget-object p0, p0, Ll/e9r;->b:Ll/ig60;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Ll/hg60;->n([B)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
