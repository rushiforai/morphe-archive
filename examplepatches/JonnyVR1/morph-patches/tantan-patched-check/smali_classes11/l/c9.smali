.class public final Ll/c9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hte;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/hg60;

.field public final b:Ll/ig60;

.field public final c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Ll/qfj0;

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:J

.field public k:Lcom/google/android/exoplayer2/k;

.field public l:I

.field public m:J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, v0}, Ll/c9;-><init>(Ljava/lang/String;)V

    return-void
.end method

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
    new-instance v0, Ll/hg60;

    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    new-array v1, v1, [B

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/hg60;-><init>([B)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/c9;->a:Ll/hg60;

    .line 14
    .line 15
    new-instance v1, Ll/ig60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/hg60;->a:[B

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/ig60;-><init>([B)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/c9;->b:Ll/ig60;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Ll/c9;->f:I

    .line 26
    .line 27
    iput v0, p0, Ll/c9;->g:I

    .line 28
    .line 29
    iput-boolean v0, p0, Ll/c9;->h:Z

    .line 30
    .line 31
    iput-boolean v0, p0, Ll/c9;->i:Z

    .line 32
    .line 33
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    iput-wide v0, p0, Ll/c9;->m:J

    .line 39
    .line 40
    iput-object p1, p0, Ll/c9;->c:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method

.method private f(Ll/ig60;[BI)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/c9;->g:I

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
    iget v1, p0, Ll/c9;->g:I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v1, v0}, Ll/ig60;->l([BII)V

    .line 16
    .line 17
    .line 18
    iget p1, p0, Ll/c9;->g:I

    .line 19
    .line 20
    add-int/2addr p1, v0

    .line 21
    iput p1, p0, Ll/c9;->g:I

    .line 22
    .line 23
    if-ne p1, p3, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private g()V
    .locals 5
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c9;->a:Ll/hg60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/hg60;->p(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/c9;->a:Ll/hg60;

    .line 8
    .line 9
    invoke-static {v0}, Ll/d9;->d(Ll/hg60;)Ll/d9$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/c9;->k:Lcom/google/android/exoplayer2/k;

    .line 14
    .line 15
    const-string v2, "audio/ac4"

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget v3, v0, Ll/d9$b;->c:I

    .line 20
    .line 21
    iget v4, v1, Lcom/google/android/exoplayer2/k;->y:I

    .line 22
    .line 23
    if-ne v3, v4, :cond_0

    .line 24
    .line 25
    iget v3, v0, Ll/d9$b;->b:I

    .line 26
    .line 27
    iget v4, v1, Lcom/google/android/exoplayer2/k;->z:I

    .line 28
    .line 29
    if-ne v3, v4, :cond_0

    .line 30
    .line 31
    iget-object v1, v1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer2/k$b;

    .line 40
    .line 41
    invoke-direct {v1}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Ll/c9;->d:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget v2, v0, Ll/d9$b;->c:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget v2, v0, Ll/d9$b;->b:I

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-object v2, p0, Ll/c9;->c:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iput-object v1, p0, Ll/c9;->k:Lcom/google/android/exoplayer2/k;

    .line 77
    .line 78
    iget-object v2, p0, Ll/c9;->e:Ll/qfj0;

    .line 79
    .line 80
    invoke-interface {v2, v1}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget v1, v0, Ll/d9$b;->d:I

    .line 84
    .line 85
    iput v1, p0, Ll/c9;->l:I

    .line 86
    .line 87
    iget v0, v0, Ll/d9$b;->e:I

    .line 88
    .line 89
    int-to-long v0, v0

    .line 90
    const-wide/32 v2, 0xf4240

    .line 91
    .line 92
    .line 93
    mul-long/2addr v0, v2

    .line 94
    iget-object v2, p0, Ll/c9;->k:Lcom/google/android/exoplayer2/k;

    .line 95
    .line 96
    iget v2, v2, Lcom/google/android/exoplayer2/k;->z:I

    .line 97
    .line 98
    int-to-long v2, v2

    .line 99
    div-long/2addr v0, v2

    .line 100
    iput-wide v0, p0, Ll/c9;->j:J

    .line 101
    .line 102
    return-void
.end method

.method private h(Ll/ig60;)Z
    .locals 5

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_6

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/c9;->h:Z

    .line 9
    .line 10
    const/16 v2, 0xac

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    move v1, v3

    .line 22
    :cond_1
    iput-boolean v1, p0, Ll/c9;->h:Z

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-ne v0, v2, :cond_3

    .line 30
    .line 31
    move v2, v3

    .line 32
    goto :goto_1

    .line 33
    :cond_3
    move v2, v1

    .line 34
    :goto_1
    iput-boolean v2, p0, Ll/c9;->h:Z

    .line 35
    .line 36
    const/16 v2, 0x40

    .line 37
    .line 38
    const/16 v4, 0x41

    .line 39
    .line 40
    if-eq v0, v2, :cond_4

    .line 41
    .line 42
    if-ne v0, v4, :cond_0

    .line 43
    .line 44
    :cond_4
    if-ne v0, v4, :cond_5

    .line 45
    .line 46
    move v1, v3

    .line 47
    :cond_5
    iput-boolean v1, p0, Ll/c9;->i:Z

    .line 48
    .line 49
    return v3

    .line 50
    :cond_6
    return v1
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/c9;->e:Ll/qfj0;

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
    if-lez v0, :cond_6

    .line 11
    .line 12
    iget v0, p0, Ll/c9;->f:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x2

    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    if-eq v0, v3, :cond_3

    .line 20
    .line 21
    if-eq v0, v2, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v2, p0, Ll/c9;->l:I

    .line 29
    .line 30
    iget v3, p0, Ll/c9;->g:I

    .line 31
    .line 32
    sub-int/2addr v2, v3

    .line 33
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v2, p0, Ll/c9;->e:Ll/qfj0;

    .line 38
    .line 39
    invoke-interface {v2, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 40
    .line 41
    .line 42
    iget v2, p0, Ll/c9;->g:I

    .line 43
    .line 44
    add-int/2addr v2, v0

    .line 45
    iput v2, p0, Ll/c9;->g:I

    .line 46
    .line 47
    iget v7, p0, Ll/c9;->l:I

    .line 48
    .line 49
    if-ne v2, v7, :cond_0

    .line 50
    .line 51
    iget-wide v4, p0, Ll/c9;->m:J

    .line 52
    .line 53
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    cmp-long v0, v4, v2

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v3, p0, Ll/c9;->e:Ll/qfj0;

    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    const/4 v9, 0x0

    .line 66
    const/4 v6, 0x1

    .line 67
    invoke-interface/range {v3 .. v9}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 68
    .line 69
    .line 70
    iget-wide v2, p0, Ll/c9;->m:J

    .line 71
    .line 72
    iget-wide v4, p0, Ll/c9;->j:J

    .line 73
    .line 74
    add-long/2addr v2, v4

    .line 75
    iput-wide v2, p0, Ll/c9;->m:J

    .line 76
    .line 77
    :cond_2
    iput v1, p0, Ll/c9;->f:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    iget-object v0, p0, Ll/c9;->b:Ll/ig60;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/16 v3, 0x10

    .line 87
    .line 88
    invoke-direct {p0, p1, v0, v3}, Ll/c9;->f(Ll/ig60;[BI)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_0

    .line 93
    .line 94
    invoke-direct {p0}, Ll/c9;->g()V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/c9;->b:Ll/ig60;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/c9;->e:Ll/qfj0;

    .line 103
    .line 104
    iget-object v1, p0, Ll/c9;->b:Ll/ig60;

    .line 105
    .line 106
    invoke-interface {v0, v1, v3}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 107
    .line 108
    .line 109
    iput v2, p0, Ll/c9;->f:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_4
    invoke-direct {p0, p1}, Ll/c9;->h(Ll/ig60;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_0

    .line 117
    .line 118
    iput v3, p0, Ll/c9;->f:I

    .line 119
    .line 120
    iget-object v0, p0, Ll/c9;->b:Ll/ig60;

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/16 v4, -0x54

    .line 127
    .line 128
    aput-byte v4, v0, v1

    .line 129
    .line 130
    iget-object v0, p0, Ll/c9;->b:Ll/ig60;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-boolean v1, p0, Ll/c9;->i:Z

    .line 137
    .line 138
    if-eqz v1, :cond_5

    .line 139
    .line 140
    const/16 v1, 0x41

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_5
    const/16 v1, 0x40

    .line 144
    .line 145
    :goto_1
    int-to-byte v1, v1

    .line 146
    aput-byte v1, v0, v3

    .line 147
    .line 148
    iput v2, p0, Ll/c9;->g:I

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_6
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/c9;->f:I

    .line 3
    .line 4
    iput v0, p0, Ll/c9;->g:I

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/c9;->h:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Ll/c9;->i:Z

    .line 9
    .line 10
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    iput-wide v0, p0, Ll/c9;->m:J

    .line 16
    .line 17
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
    iput-wide p1, p0, Ll/c9;->m:J

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
    iput-object v0, p0, Ll/c9;->d:Ljava/lang/String;

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
    iput-object p1, p0, Ll/c9;->e:Ll/qfj0;

    .line 20
    .line 21
    return-void
.end method
