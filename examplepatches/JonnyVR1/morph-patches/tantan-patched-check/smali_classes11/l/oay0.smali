.class public final Ll/oay0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/izy0;

.field public final b:Ljava/lang/Object;

.field public final c:[Ll/f2z0;

.field public d:Z

.field public e:Z

.field public f:Ll/tay0;

.field public g:Z

.field public final h:[Z

.field public final i:[Ll/afy0;

.field public final j:Ll/t5z0;

.field public final k:Ll/bdy0;

.field public l:Ll/oay0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:Ll/q2z0;

.field public n:Ll/u5z0;

.field public o:J


# direct methods
.method public constructor <init>([Ll/afy0;JLl/t5z0;Ll/c6z0;Ll/bdy0;Ll/tay0;Ll/u5z0;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oay0;->i:[Ll/afy0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/oay0;->o:J

    .line 7
    .line 8
    iput-object p4, p0, Ll/oay0;->j:Ll/t5z0;

    .line 9
    .line 10
    iput-object p6, p0, Ll/oay0;->k:Ll/bdy0;

    .line 11
    .line 12
    iget-object p1, p7, Ll/tay0;->a:Ll/kzy0;

    .line 13
    .line 14
    iget-object p2, p1, Ll/kzy0;->a:Ljava/lang/Object;

    .line 15
    .line 16
    iput-object p2, p0, Ll/oay0;->b:Ljava/lang/Object;

    .line 17
    .line 18
    iput-object p7, p0, Ll/oay0;->f:Ll/tay0;

    .line 19
    .line 20
    sget-object p2, Ll/q2z0;->d:Ll/q2z0;

    .line 21
    .line 22
    iput-object p2, p0, Ll/oay0;->m:Ll/q2z0;

    .line 23
    .line 24
    iput-object p8, p0, Ll/oay0;->n:Ll/u5z0;

    .line 25
    .line 26
    const/4 p2, 0x2

    .line 27
    new-array p3, p2, [Ll/f2z0;

    .line 28
    .line 29
    iput-object p3, p0, Ll/oay0;->c:[Ll/f2z0;

    .line 30
    .line 31
    new-array p2, p2, [Z

    .line 32
    .line 33
    iput-object p2, p0, Ll/oay0;->h:[Z

    .line 34
    .line 35
    iget-wide p2, p7, Ll/tay0;->b:J

    .line 36
    .line 37
    iget-wide v5, p7, Ll/tay0;->d:J

    .line 38
    .line 39
    invoke-virtual {p6, p1, p5, p2, p3}, Ll/bdy0;->p(Ll/kzy0;Ll/c6z0;J)Ll/izy0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    cmp-long p1, v5, p1

    .line 49
    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    new-instance v0, Ll/wxy0;

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    const-wide/16 v3, 0x0

    .line 56
    .line 57
    invoke-direct/range {v0 .. v6}, Ll/wxy0;-><init>(Ll/izy0;ZJJ)V

    .line 58
    .line 59
    .line 60
    move-object v1, v0

    .line 61
    :cond_0
    iput-object v1, p0, Ll/oay0;->a:Ll/izy0;

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public final a(Ll/u5z0;JZ)J
    .locals 6

    .line 1
    const/4 p4, 0x2

    .line 2
    new-array v5, p4, [Z

    .line 3
    .line 4
    const/4 v4, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move-wide v2, p2

    .line 8
    invoke-virtual/range {v0 .. v5}, Ll/oay0;->b(Ll/u5z0;JZ[Z)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    return-wide p0
.end method

.method public final b(Ll/u5z0;JZ[Z)J
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p1, Ll/u5z0;->a:I

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    if-ge v1, v2, :cond_1

    .line 7
    .line 8
    iget-object v2, p0, Ll/oay0;->h:[Z

    .line 9
    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    iget-object v4, p0, Ll/oay0;->n:Ll/u5z0;

    .line 13
    .line 14
    invoke-virtual {p1, v4, v1}, Ll/u5z0;->a(Ll/u5z0;I)Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    move v3, v0

    .line 22
    :goto_1
    aput-boolean v3, v2, v1

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v1, v0

    .line 28
    :goto_2
    iget-object v2, p0, Ll/oay0;->i:[Ll/afy0;

    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    if-ge v1, v4, :cond_2

    .line 32
    .line 33
    aget-object v2, v2, v1

    .line 34
    .line 35
    invoke-interface {v2}, Ll/afy0;->c()I

    .line 36
    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    invoke-virtual {p0}, Ll/oay0;->s()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/oay0;->n:Ll/u5z0;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/oay0;->t()V

    .line 47
    .line 48
    .line 49
    iget-object v5, p0, Ll/oay0;->a:Ll/izy0;

    .line 50
    .line 51
    iget-object v6, p1, Ll/u5z0;->c:[Ll/n5z0;

    .line 52
    .line 53
    iget-object v7, p0, Ll/oay0;->h:[Z

    .line 54
    .line 55
    iget-object v8, p0, Ll/oay0;->c:[Ll/f2z0;

    .line 56
    .line 57
    move-wide v10, p2

    .line 58
    move-object/from16 v9, p5

    .line 59
    .line 60
    invoke-interface/range {v5 .. v11}, Ll/izy0;->e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J

    .line 61
    .line 62
    .line 63
    move-result-wide p2

    .line 64
    move v1, v0

    .line 65
    :goto_3
    iget-object v2, p0, Ll/oay0;->i:[Ll/afy0;

    .line 66
    .line 67
    if-ge v1, v4, :cond_3

    .line 68
    .line 69
    aget-object v2, v2, v1

    .line 70
    .line 71
    invoke-interface {v2}, Ll/afy0;->c()I

    .line 72
    .line 73
    .line 74
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_3
    iput-boolean v0, p0, Ll/oay0;->e:Z

    .line 78
    .line 79
    move v1, v0

    .line 80
    :goto_4
    iget-object v2, p0, Ll/oay0;->c:[Ll/f2z0;

    .line 81
    .line 82
    if-ge v1, v4, :cond_6

    .line 83
    .line 84
    aget-object v2, v2, v1

    .line 85
    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    invoke-virtual {p1, v1}, Ll/u5z0;->b(I)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 93
    .line 94
    .line 95
    iget-object v2, p0, Ll/oay0;->i:[Ll/afy0;

    .line 96
    .line 97
    aget-object v2, v2, v1

    .line 98
    .line 99
    invoke-interface {v2}, Ll/afy0;->c()I

    .line 100
    .line 101
    .line 102
    iput-boolean v3, p0, Ll/oay0;->e:Z

    .line 103
    .line 104
    goto :goto_6

    .line 105
    :cond_4
    iget-object v2, p1, Ll/u5z0;->c:[Ll/n5z0;

    .line 106
    .line 107
    aget-object v2, v2, v1

    .line 108
    .line 109
    if-nez v2, :cond_5

    .line 110
    .line 111
    move v2, v3

    .line 112
    goto :goto_5

    .line 113
    :cond_5
    move v2, v0

    .line 114
    :goto_5
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 115
    .line 116
    .line 117
    :goto_6
    add-int/lit8 v1, v1, 0x1

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_6
    return-wide p2
.end method

.method public final c()J
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/oay0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/oay0;->f:Ll/tay0;

    .line 6
    .line 7
    iget-wide v0, p0, Ll/tay0;->b:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/oay0;->e:Z

    .line 11
    .line 12
    const-wide/high16 v1, -0x8000000000000000L

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/oay0;->a:Ll/izy0;

    .line 17
    .line 18
    invoke-interface {v0}, Ll/izy0;->zzb()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move-wide v3, v1

    .line 24
    :goto_0
    cmp-long v0, v3, v1

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object p0, p0, Ll/oay0;->f:Ll/tay0;

    .line 29
    .line 30
    iget-wide v0, p0, Ll/tay0;->e:J

    .line 31
    .line 32
    return-wide v0

    .line 33
    :cond_2
    return-wide v3
.end method

.method public final d()J
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/oay0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/oay0;->a:Ll/izy0;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/izy0;->zzc()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public final e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/oay0;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final f()J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/oay0;->f:Ll/tay0;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/tay0;->b:J

    .line 4
    .line 5
    iget-wide v2, p0, Ll/oay0;->o:J

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    return-wide v0
.end method

.method public final g()Ll/oay0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oay0;->l:Ll/oay0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Ll/q2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oay0;->m:Ll/q2z0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Ll/u5z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oay0;->n:Ll/u5z0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(FLl/d0u0;)Ll/u5z0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/oay0;->m:Ll/q2z0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/oay0;->f:Ll/tay0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/tay0;->a:Ll/kzy0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/oay0;->j:Ll/t5z0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/oay0;->i:[Ll/afy0;

    .line 10
    .line 11
    invoke-virtual {v1, p0, p1, v0, p2}, Ll/t5z0;->e([Ll/afy0;Ll/q2z0;Ll/kzy0;Ll/d0u0;)Ll/u5z0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p0, Ll/u5z0;->c:[Ll/n5z0;

    .line 16
    .line 17
    array-length p2, p1

    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    if-ge v0, p2, :cond_0

    .line 20
    .line 21
    aget-object v1, p1, v0

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-object p0
.end method

.method public final k(JFJ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/oay0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iget-wide v0, p0, Ll/oay0;->o:J

    .line 9
    .line 10
    sub-long/2addr p1, v0

    .line 11
    new-instance v0, Ll/z9y0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/z9y0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1, p2}, Ll/z9y0;->e(J)Ll/z9y0;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ll/z9y0;->f(F)Ll/z9y0;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p4, p5}, Ll/z9y0;->d(J)Ll/z9y0;

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/gay0;

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-direct {p1, v0, p2}, Ll/gay0;-><init>(Ll/z9y0;Ll/cay0;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/oay0;->a:Ll/izy0;

    .line 32
    .line 33
    invoke-interface {p0, p1}, Ll/izy0;->a(Ll/gay0;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final l(FLl/d0u0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/oay0;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/oay0;->a:Ll/izy0;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/izy0;->zzh()Ll/q2z0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/oay0;->m:Ll/q2z0;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/oay0;->j(FLl/d0u0;)Ll/u5z0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p0, Ll/oay0;->f:Ll/tay0;

    .line 17
    .line 18
    iget-wide v0, p2, Ll/tay0;->b:J

    .line 19
    .line 20
    iget-wide v2, p2, Ll/tay0;->e:J

    .line 21
    .line 22
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    cmp-long p2, v2, v4

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    cmp-long p2, v0, v2

    .line 32
    .line 33
    if-ltz p2, :cond_0

    .line 34
    .line 35
    const-wide/16 v0, -0x1

    .line 36
    .line 37
    add-long/2addr v2, v0

    .line 38
    const-wide/16 v0, 0x0

    .line 39
    .line 40
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    :cond_0
    const/4 p2, 0x0

    .line 45
    invoke-virtual {p0, p1, v0, v1, p2}, Ll/oay0;->a(Ll/u5z0;JZ)J

    .line 46
    .line 47
    .line 48
    move-result-wide p1

    .line 49
    iget-wide v0, p0, Ll/oay0;->o:J

    .line 50
    .line 51
    iget-object v2, p0, Ll/oay0;->f:Ll/tay0;

    .line 52
    .line 53
    iget-wide v3, v2, Ll/tay0;->b:J

    .line 54
    .line 55
    sub-long/2addr v3, p1

    .line 56
    add-long/2addr v0, v3

    .line 57
    iput-wide v0, p0, Ll/oay0;->o:J

    .line 58
    .line 59
    invoke-virtual {v2, p1, p2}, Ll/tay0;->b(J)Ll/tay0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Ll/oay0;->f:Ll/tay0;

    .line 64
    .line 65
    return-void
.end method

.method public final m(J)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/oay0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/oay0;->d:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/oay0;->a:Ll/izy0;

    .line 13
    .line 14
    iget-wide v1, p0, Ll/oay0;->o:J

    .line 15
    .line 16
    sub-long/2addr p1, v1

    .line 17
    invoke-interface {v0, p1, p2}, Ll/izy0;->b(J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/oay0;->s()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/oay0;->a:Ll/izy0;

    .line 5
    .line 6
    :try_start_0
    instance-of v1, v0, Ll/wxy0;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/oay0;->k:Ll/bdy0;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    check-cast v0, Ll/wxy0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/wxy0;->a:Ll/izy0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/bdy0;->i(Ll/izy0;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, v0}, Ll/bdy0;->i(Ll/izy0;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    const-string v0, "MediaPeriodHolder"

    .line 26
    .line 27
    const-string v1, "Period release failed."

    .line 28
    .line 29
    invoke-static {v0, v1, p0}, Ll/y4w0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final o(Ll/oay0;)V
    .locals 1
    .param p1    # Ll/oay0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/oay0;->l:Ll/oay0;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/oay0;->s()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/oay0;->l:Ll/oay0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/oay0;->t()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final p(J)V
    .locals 0

    .line 1
    const-wide p1, 0xe8d4a51000L

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    iput-wide p1, p0, Ll/oay0;->o:J

    .line 7
    .line 8
    return-void
.end method

.method public final q()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/oay0;->a:Ll/izy0;

    .line 2
    .line 3
    instance-of v1, v0, Ll/wxy0;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/oay0;->f:Ll/tay0;

    .line 8
    .line 9
    iget-wide v1, p0, Ll/tay0;->d:J

    .line 10
    .line 11
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long p0, v1, v3

    .line 17
    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    const-wide/high16 v1, -0x8000000000000000L

    .line 21
    .line 22
    :cond_0
    check-cast v0, Ll/wxy0;

    .line 23
    .line 24
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    invoke-virtual {v0, v3, v4, v1, v2}, Ll/wxy0;->h(JJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final r()Z
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/oay0;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/oay0;->e:Z

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/oay0;->a:Ll/izy0;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/izy0;->zzb()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    const-wide/high16 v5, -0x8000000000000000L

    .line 18
    .line 19
    cmp-long p0, v3, v5

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    return v2

    .line 25
    :cond_1
    return v1
.end method

.method public final s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/oay0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Ll/oay0;->n:Ll/u5z0;

    .line 9
    .line 10
    iget v2, v1, Ll/u5z0;->a:I

    .line 11
    .line 12
    if-ge v0, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/u5z0;->b(I)Z

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/oay0;->n:Ll/u5z0;

    .line 18
    .line 19
    iget-object v1, v1, Ll/u5z0;->c:[Ll/n5z0;

    .line 20
    .line 21
    aget-object v1, v1, v0

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public final t()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/oay0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Ll/oay0;->n:Ll/u5z0;

    .line 9
    .line 10
    iget v2, v1, Ll/u5z0;->a:I

    .line 11
    .line 12
    if-ge v0, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/u5z0;->b(I)Z

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/oay0;->n:Ll/u5z0;

    .line 18
    .line 19
    iget-object v1, v1, Ll/u5z0;->c:[Ll/n5z0;

    .line 20
    .line 21
    aget-object v1, v1, v0

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public final u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oay0;->l:Ll/oay0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
