.class public final Ll/h710;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hte;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/ig60;

.field public final b:Ll/i710$a;

.field public final c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/qfj0;

.field public e:Ljava/lang/String;

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:J

.field public k:I

.field public l:J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, v0}, Ll/h710;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/h710;->f:I

    .line 6
    .line 7
    new-instance v1, Ll/ig60;

    .line 8
    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-direct {v1, v2}, Ll/ig60;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/h710;->a:Ll/ig60;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/ig60;->e()[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, -0x1

    .line 20
    aput-byte v2, v1, v0

    .line 21
    .line 22
    new-instance v0, Ll/i710$a;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/i710$a;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/h710;->b:Ll/i710$a;

    .line 28
    .line 29
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    iput-wide v0, p0, Ll/h710;->l:J

    .line 35
    .line 36
    iput-object p1, p0, Ll/h710;->c:Ljava/lang/String;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h710;->d:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_3

    .line 11
    .line 12
    iget v0, p0, Ll/h710;->f:I

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/h710;->g(Ll/ig60;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, Ll/h710;->h(Ll/ig60;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {p0, p1}, Ll/h710;->f(Ll/ig60;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/h710;->f:I

    .line 3
    .line 4
    iput v0, p0, Ll/h710;->g:I

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/h710;->i:Z

    .line 7
    .line 8
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    iput-wide v0, p0, Ll/h710;->l:J

    .line 14
    .line 15
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
    iput-wide p1, p0, Ll/h710;->l:J

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public e(Ll/bsf;Ll/jkj0$d;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/jkj0$d;->a()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/jkj0$d;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/h710;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/jkj0$d;->c()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-interface {p1, p2, v0}, Ll/bsf;->b(II)Ll/qfj0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/h710;->d:Ll/qfj0;

    .line 20
    .line 21
    return-void
.end method

.method public final f(Ll/ig60;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    :goto_0
    if-ge v1, v2, :cond_3

    .line 14
    .line 15
    aget-byte v3, v0, v1

    .line 16
    .line 17
    and-int/lit16 v4, v3, 0xff

    .line 18
    .line 19
    const/16 v5, 0xff

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v7, 0x1

    .line 23
    if-ne v4, v5, :cond_0

    .line 24
    .line 25
    move v4, v7

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    move v4, v6

    .line 28
    :goto_1
    iget-boolean v5, p0, Ll/h710;->i:Z

    .line 29
    .line 30
    if-eqz v5, :cond_1

    .line 31
    .line 32
    and-int/lit16 v3, v3, 0xe0

    .line 33
    .line 34
    const/16 v5, 0xe0

    .line 35
    .line 36
    if-ne v3, v5, :cond_1

    .line 37
    .line 38
    move v3, v7

    .line 39
    goto :goto_2

    .line 40
    :cond_1
    move v3, v6

    .line 41
    :goto_2
    iput-boolean v4, p0, Ll/h710;->i:Z

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    add-int/lit8 v2, v1, 0x1

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Ll/ig60;->U(I)V

    .line 48
    .line 49
    .line 50
    iput-boolean v6, p0, Ll/h710;->i:Z

    .line 51
    .line 52
    iget-object p1, p0, Ll/h710;->a:Ll/ig60;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    aget-byte v0, v0, v1

    .line 59
    .line 60
    aput-byte v0, p1, v7

    .line 61
    .line 62
    const/4 p1, 0x2

    .line 63
    iput p1, p0, Ll/h710;->g:I

    .line 64
    .line 65
    iput v7, p0, Ll/h710;->f:I

    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    invoke-virtual {p1, v2}, Ll/ig60;->U(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final g(Ll/ig60;)V
    .locals 7
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/h710;->k:I

    .line 6
    .line 7
    iget v2, p0, Ll/h710;->g:I

    .line 8
    .line 9
    sub-int/2addr v1, v2

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/h710;->d:Ll/qfj0;

    .line 15
    .line 16
    invoke-interface {v1, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 17
    .line 18
    .line 19
    iget p1, p0, Ll/h710;->g:I

    .line 20
    .line 21
    add-int/2addr p1, v0

    .line 22
    iput p1, p0, Ll/h710;->g:I

    .line 23
    .line 24
    iget v4, p0, Ll/h710;->k:I

    .line 25
    .line 26
    if-ge p1, v4, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-wide v1, p0, Ll/h710;->l:J

    .line 30
    .line 31
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    cmp-long p1, v1, v5

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/h710;->d:Ll/qfj0;

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    const/4 v6, 0x0

    .line 44
    const/4 v3, 0x1

    .line 45
    invoke-interface/range {v0 .. v6}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 46
    .line 47
    .line 48
    iget-wide v0, p0, Ll/h710;->l:J

    .line 49
    .line 50
    iget-wide v2, p0, Ll/h710;->j:J

    .line 51
    .line 52
    add-long/2addr v0, v2

    .line 53
    iput-wide v0, p0, Ll/h710;->l:J

    .line 54
    .line 55
    :cond_1
    const/4 p1, 0x0

    .line 56
    iput p1, p0, Ll/h710;->g:I

    .line 57
    .line 58
    iput p1, p0, Ll/h710;->f:I

    .line 59
    .line 60
    return-void
.end method

.method public final h(Ll/ig60;)V
    .locals 7
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/h710;->g:I

    .line 6
    .line 7
    const/4 v2, 0x4

    .line 8
    rsub-int/lit8 v1, v1, 0x4

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Ll/h710;->a:Ll/ig60;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/ig60;->e()[B

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v3, p0, Ll/h710;->g:I

    .line 21
    .line 22
    invoke-virtual {p1, v1, v3, v0}, Ll/ig60;->l([BII)V

    .line 23
    .line 24
    .line 25
    iget p1, p0, Ll/h710;->g:I

    .line 26
    .line 27
    add-int/2addr p1, v0

    .line 28
    iput p1, p0, Ll/h710;->g:I

    .line 29
    .line 30
    if-ge p1, v2, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p0, Ll/h710;->a:Ll/ig60;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/h710;->b:Ll/i710$a;

    .line 40
    .line 41
    iget-object v1, p0, Ll/h710;->a:Ll/ig60;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/ig60;->q()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p1, v1}, Ll/i710$a;->a(I)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    const/4 v1, 0x1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    iput v0, p0, Ll/h710;->g:I

    .line 55
    .line 56
    iput v1, p0, Ll/h710;->f:I

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    iget-object p1, p0, Ll/h710;->b:Ll/i710$a;

    .line 60
    .line 61
    iget v3, p1, Ll/i710$a;->c:I

    .line 62
    .line 63
    iput v3, p0, Ll/h710;->k:I

    .line 64
    .line 65
    iget-boolean v3, p0, Ll/h710;->h:Z

    .line 66
    .line 67
    if-nez v3, :cond_2

    .line 68
    .line 69
    iget v3, p1, Ll/i710$a;->g:I

    .line 70
    .line 71
    int-to-long v3, v3

    .line 72
    const-wide/32 v5, 0xf4240

    .line 73
    .line 74
    .line 75
    mul-long/2addr v3, v5

    .line 76
    iget p1, p1, Ll/i710$a;->d:I

    .line 77
    .line 78
    int-to-long v5, p1

    .line 79
    div-long/2addr v3, v5

    .line 80
    iput-wide v3, p0, Ll/h710;->j:J

    .line 81
    .line 82
    new-instance p1, Lcom/google/android/exoplayer2/k$b;

    .line 83
    .line 84
    invoke-direct {p1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Ll/h710;->e:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object v3, p0, Ll/h710;->b:Ll/i710$a;

    .line 94
    .line 95
    iget-object v3, v3, Ll/i710$a;->b:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    const/16 v3, 0x1000

    .line 102
    .line 103
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->Y(I)Lcom/google/android/exoplayer2/k$b;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v3, p0, Ll/h710;->b:Ll/i710$a;

    .line 108
    .line 109
    iget v3, v3, Ll/i710$a;->e:I

    .line 110
    .line 111
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v3, p0, Ll/h710;->b:Ll/i710$a;

    .line 116
    .line 117
    iget v3, v3, Ll/i710$a;->d:I

    .line 118
    .line 119
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget-object v3, p0, Ll/h710;->c:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object v3, p0, Ll/h710;->d:Ll/qfj0;

    .line 134
    .line 135
    invoke-interface {v3, p1}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 136
    .line 137
    .line 138
    iput-boolean v1, p0, Ll/h710;->h:Z

    .line 139
    .line 140
    :cond_2
    iget-object p1, p0, Ll/h710;->a:Ll/ig60;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/h710;->d:Ll/qfj0;

    .line 146
    .line 147
    iget-object v0, p0, Ll/h710;->a:Ll/ig60;

    .line 148
    .line 149
    invoke-interface {p1, v0, v2}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 150
    .line 151
    .line 152
    const/4 p1, 0x2

    .line 153
    iput p1, p0, Ll/h710;->f:I

    .line 154
    .line 155
    return-void
.end method
