.class public final Ll/eqd0;
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

.field public f:J

.field public g:J

.field public h:Z

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ll/zpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eqd0;->a:Ll/zpd0;

    .line 5
    .line 6
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    iput-wide v0, p0, Ll/eqd0;->c:J

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Ll/eqd0;->d:I

    .line 15
    .line 16
    iput p1, p0, Ll/eqd0;->e:I

    .line 17
    .line 18
    iput-wide v0, p0, Ll/eqd0;->f:J

    .line 19
    .line 20
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    iput-wide v0, p0, Ll/eqd0;->g:J

    .line 23
    .line 24
    return-void
.end method

.method private e()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/eqd0;->b:Ll/qfj0;

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
    iget-wide v2, p0, Ll/eqd0;->f:J

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/eqd0;->i:Z

    .line 13
    .line 14
    iget v5, p0, Ll/eqd0;->e:I

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
    iput v0, p0, Ll/eqd0;->e:I

    .line 23
    .line 24
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    iput-wide v0, p0, Ll/eqd0;->f:J

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Ll/eqd0;->h:Z

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/eqd0;->c:J

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    iput p1, p0, Ll/eqd0;->e:I

    .line 5
    .line 6
    iput-wide p3, p0, Ll/eqd0;->g:J

    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/ig60;JIZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/eqd0;->b:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p4}, Ll/eqd0;->f(Ll/ig60;I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    iget v0, p0, Ll/eqd0;->e:I

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    iget-boolean v0, p0, Ll/eqd0;->h:Z

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
    and-int/2addr v0, v2

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    move v0, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    :goto_0
    iput-boolean v0, p0, Ll/eqd0;->i:Z

    .line 33
    .line 34
    :cond_1
    iget-boolean v0, p0, Ll/eqd0;->j:Z

    .line 35
    .line 36
    if-nez v0, :cond_4

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/ig60;->f()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    add-int/lit8 v3, v0, 0x6

    .line 43
    .line 44
    invoke-virtual {p1, v3}, Ll/ig60;->U(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/ig60;->z()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    and-int/lit16 v3, v3, 0x3fff

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/ig60;->z()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    and-int/lit16 v4, v4, 0x3fff

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/eqd0;->a:Ll/zpd0;

    .line 63
    .line 64
    iget-object v0, v0, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 65
    .line 66
    iget v5, v0, Lcom/google/android/exoplayer2/k;->q:I

    .line 67
    .line 68
    if-ne v3, v5, :cond_2

    .line 69
    .line 70
    iget v5, v0, Lcom/google/android/exoplayer2/k;->r:I

    .line 71
    .line 72
    if-eq v4, v5, :cond_3

    .line 73
    .line 74
    :cond_2
    iget-object v5, p0, Ll/eqd0;->b:Ll/qfj0;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/k$b;->n0(I)Lcom/google/android/exoplayer2/k$b;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/k$b;->S(I)Lcom/google/android/exoplayer2/k$b;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {v5, v0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iput-boolean v2, p0, Ll/eqd0;->j:Z

    .line 96
    .line 97
    :cond_4
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget-object v2, p0, Ll/eqd0;->b:Ll/qfj0;

    .line 102
    .line 103
    invoke-interface {v2, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 104
    .line 105
    .line 106
    iget p1, p0, Ll/eqd0;->e:I

    .line 107
    .line 108
    if-ne p1, v1, :cond_5

    .line 109
    .line 110
    iput v0, p0, Ll/eqd0;->e:I

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_5
    add-int/2addr p1, v0

    .line 114
    iput p1, p0, Ll/eqd0;->e:I

    .line 115
    .line 116
    :goto_1
    iget-wide v0, p0, Ll/eqd0;->g:J

    .line 117
    .line 118
    iget-wide v4, p0, Ll/eqd0;->c:J

    .line 119
    .line 120
    const v6, 0x15f90

    .line 121
    .line 122
    .line 123
    move-wide v2, p2

    .line 124
    invoke-static/range {v0 .. v6}, Ll/cqd0;->a(JJJI)J

    .line 125
    .line 126
    .line 127
    move-result-wide p1

    .line 128
    iput-wide p1, p0, Ll/eqd0;->f:J

    .line 129
    .line 130
    if-eqz p5, :cond_6

    .line 131
    .line 132
    invoke-direct {p0}, Ll/eqd0;->e()V

    .line 133
    .line 134
    .line 135
    :cond_6
    iput p4, p0, Ll/eqd0;->d:I

    .line 136
    .line 137
    :cond_7
    return-void
.end method

.method public c(JI)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/eqd0;->c:J

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
    iput-wide p1, p0, Ll/eqd0;->c:J

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
    iput-object p1, p0, Ll/eqd0;->b:Ll/qfj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/eqd0;->a:Ll/zpd0;

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
    and-int/lit8 v1, v0, 0x10

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/16 v3, 0x10

    .line 9
    .line 10
    if-ne v1, v3, :cond_1

    .line 11
    .line 12
    and-int/lit8 v1, v0, 0x7

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iget-boolean p2, p0, Ll/eqd0;->h:Z

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget p2, p0, Ll/eqd0;->e:I

    .line 21
    .line 22
    if-lez p2, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Ll/eqd0;->e()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iput-boolean v2, p0, Ll/eqd0;->h:Z

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-boolean v1, p0, Ll/eqd0;->h:Z

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    const-string v5, "RtpVP8Reader"

    .line 34
    .line 35
    if-eqz v1, :cond_7

    .line 36
    .line 37
    iget p0, p0, Ll/eqd0;->d:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/wpd0;->b(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-ge p2, p0, :cond_2

    .line 44
    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d. Dropping packet."

    .line 58
    .line 59
    invoke-static {p1, p0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {v5, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return v4

    .line 67
    :cond_2
    :goto_0
    and-int/lit16 p0, v0, 0x80

    .line 68
    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    and-int/lit16 p2, p0, 0x80

    .line 76
    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    and-int/lit16 p2, p2, 0x80

    .line 84
    .line 85
    if-eqz p2, :cond_3

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Ll/ig60;->V(I)V

    .line 88
    .line 89
    .line 90
    :cond_3
    and-int/lit8 p2, p0, 0x40

    .line 91
    .line 92
    if-eqz p2, :cond_4

    .line 93
    .line 94
    invoke-virtual {p1, v2}, Ll/ig60;->V(I)V

    .line 95
    .line 96
    .line 97
    :cond_4
    and-int/lit8 p2, p0, 0x20

    .line 98
    .line 99
    if-nez p2, :cond_5

    .line 100
    .line 101
    and-int/2addr p0, v3

    .line 102
    if-eqz p0, :cond_6

    .line 103
    .line 104
    :cond_5
    invoke-virtual {p1, v2}, Ll/ig60;->V(I)V

    .line 105
    .line 106
    .line 107
    :cond_6
    return v2

    .line 108
    :cond_7
    const-string p0, "RTP packet is not the start of a new VP8 partition, skipping."

    .line 109
    .line 110
    invoke-static {v5, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return v4
.end method
