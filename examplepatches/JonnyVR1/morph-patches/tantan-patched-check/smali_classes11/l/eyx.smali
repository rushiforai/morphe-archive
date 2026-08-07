.class public final Ll/eyx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/source/h;

.field public final b:Ljava/lang/Object;

.field public final c:[Ll/xwd0;

.field public d:Z

.field public e:Z

.field public f:Ll/gyx;

.field public g:Z

.field public final h:[Z

.field public final i:[Lcom/google/android/exoplayer2/y;

.field public final j:Ll/cgj0;

.field public final k:Lcom/google/android/exoplayer2/q;

.field public l:Ll/eyx;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:Ll/ffj0;

.field public n:Ll/dgj0;

.field public o:J


# direct methods
.method public constructor <init>([Lcom/google/android/exoplayer2/y;JLl/cgj0;Ll/oj0;Lcom/google/android/exoplayer2/q;Ll/gyx;Ll/dgj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eyx;->i:[Lcom/google/android/exoplayer2/y;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/eyx;->o:J

    .line 7
    .line 8
    iput-object p4, p0, Ll/eyx;->j:Ll/cgj0;

    .line 9
    .line 10
    iput-object p6, p0, Ll/eyx;->k:Lcom/google/android/exoplayer2/q;

    .line 11
    .line 12
    move-object p2, p1

    .line 13
    iget-object p1, p7, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 14
    .line 15
    iget-object p3, p1, Ll/fyx;->a:Ljava/lang/Object;

    .line 16
    .line 17
    iput-object p3, p0, Ll/eyx;->b:Ljava/lang/Object;

    .line 18
    .line 19
    iput-object p7, p0, Ll/eyx;->f:Ll/gyx;

    .line 20
    .line 21
    sget-object p3, Ll/ffj0;->d:Ll/ffj0;

    .line 22
    .line 23
    iput-object p3, p0, Ll/eyx;->m:Ll/ffj0;

    .line 24
    .line 25
    iput-object p8, p0, Ll/eyx;->n:Ll/dgj0;

    .line 26
    .line 27
    array-length p3, p2

    .line 28
    new-array p3, p3, [Ll/xwd0;

    .line 29
    .line 30
    iput-object p3, p0, Ll/eyx;->c:[Ll/xwd0;

    .line 31
    .line 32
    array-length p2, p2

    .line 33
    new-array p2, p2, [Z

    .line 34
    .line 35
    iput-object p2, p0, Ll/eyx;->h:[Z

    .line 36
    .line 37
    move-object p3, p5

    .line 38
    iget-wide p4, p7, Ll/gyx;->b:J

    .line 39
    .line 40
    iget-wide p7, p7, Ll/gyx;->d:J

    .line 41
    .line 42
    move-object p2, p6

    .line 43
    move-wide p6, p7

    .line 44
    invoke-static/range {p1 .. p7}, Ll/eyx;->e(Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/q;Ll/oj0;JJ)Lcom/google/android/exoplayer2/source/h;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 49
    .line 50
    return-void
.end method

.method public static e(Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/q;Ll/oj0;JJ)Lcom/google/android/exoplayer2/source/h;
    .locals 0

    .line 1
    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/google/android/exoplayer2/q;->h(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-wide p2, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long p0, p5, p2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    new-instance p0, Lcom/google/android/exoplayer2/source/b;

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    const-wide/16 p3, 0x0

    .line 18
    .line 19
    invoke-direct/range {p0 .. p6}, Lcom/google/android/exoplayer2/source/b;-><init>(Lcom/google/android/exoplayer2/source/h;ZJJ)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    return-object p1
.end method

.method public static u(Lcom/google/android/exoplayer2/q;Lcom/google/android/exoplayer2/source/h;)V
    .locals 1

    .line 1
    :try_start_0
    instance-of v0, p1, Lcom/google/android/exoplayer2/source/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/google/android/exoplayer2/source/b;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/q;->z(Lcom/google/android/exoplayer2/source/h;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/q;->z(Lcom/google/android/exoplayer2/source/h;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    const-string p1, "MediaPeriodHolder"

    .line 19
    .line 20
    const-string v0, "Period release failed."

    .line 21
    .line 22
    invoke-static {p1, v0, p0}, Ll/kyv;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public A()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/google/android/exoplayer2/source/b;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/eyx;->f:Ll/gyx;

    .line 8
    .line 9
    iget-wide v1, p0, Ll/gyx;->d:J

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
    check-cast v0, Lcom/google/android/exoplayer2/source/b;

    .line 23
    .line 24
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/google/android/exoplayer2/source/b;->v(JJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public a(Ll/dgj0;JZ)J
    .locals 7

    .line 1
    iget-object v0, p0, Ll/eyx;->i:[Lcom/google/android/exoplayer2/y;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v6, v0, [Z

    .line 5
    .line 6
    move-object v1, p0

    .line 7
    move-object v2, p1

    .line 8
    move-wide v3, p2

    .line 9
    move v5, p4

    .line 10
    invoke-virtual/range {v1 .. v6}, Ll/eyx;->b(Ll/dgj0;JZ[Z)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    return-wide p0
.end method

.method public b(Ll/dgj0;JZ[Z)J
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p1, Ll/dgj0;->a:I

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    if-ge v1, v2, :cond_1

    .line 7
    .line 8
    iget-object v2, p0, Ll/eyx;->h:[Z

    .line 9
    .line 10
    if-nez p4, :cond_0

    .line 11
    .line 12
    iget-object v4, p0, Ll/eyx;->n:Ll/dgj0;

    .line 13
    .line 14
    invoke-virtual {p1, v4, v1}, Ll/dgj0;->b(Ll/dgj0;I)Z

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
    iget-object p4, p0, Ll/eyx;->c:[Ll/xwd0;

    .line 28
    .line 29
    invoke-virtual {p0, p4}, Ll/eyx;->g([Ll/xwd0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/eyx;->f()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/eyx;->n:Ll/dgj0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/eyx;->h()V

    .line 38
    .line 39
    .line 40
    iget-object v4, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 41
    .line 42
    iget-object v5, p1, Ll/dgj0;->c:[Ll/u9f;

    .line 43
    .line 44
    iget-object v6, p0, Ll/eyx;->h:[Z

    .line 45
    .line 46
    iget-object v7, p0, Ll/eyx;->c:[Ll/xwd0;

    .line 47
    .line 48
    move-wide v9, p2

    .line 49
    move-object/from16 v8, p5

    .line 50
    .line 51
    invoke-interface/range {v4 .. v10}, Lcom/google/android/exoplayer2/source/h;->r([Ll/u9f;[Z[Ll/xwd0;[ZJ)J

    .line 52
    .line 53
    .line 54
    move-result-wide p2

    .line 55
    iget-object p4, p0, Ll/eyx;->c:[Ll/xwd0;

    .line 56
    .line 57
    invoke-virtual {p0, p4}, Ll/eyx;->c([Ll/xwd0;)V

    .line 58
    .line 59
    .line 60
    iput-boolean v0, p0, Ll/eyx;->e:Z

    .line 61
    .line 62
    move p4, v0

    .line 63
    :goto_2
    iget-object v1, p0, Ll/eyx;->c:[Ll/xwd0;

    .line 64
    .line 65
    array-length v2, v1

    .line 66
    if-ge p4, v2, :cond_5

    .line 67
    .line 68
    aget-object v1, v1, p4

    .line 69
    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    invoke-virtual {p1, p4}, Ll/dgj0;->c(I)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-static {v1}, Ll/w11;->g(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/eyx;->i:[Lcom/google/android/exoplayer2/y;

    .line 80
    .line 81
    aget-object v1, v1, p4

    .line 82
    .line 83
    invoke-interface {v1}, Lcom/google/android/exoplayer2/y;->getTrackType()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const/4 v2, -0x2

    .line 88
    if-eq v1, v2, :cond_4

    .line 89
    .line 90
    iput-boolean v3, p0, Ll/eyx;->e:Z

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_2
    iget-object v1, p1, Ll/dgj0;->c:[Ll/u9f;

    .line 94
    .line 95
    aget-object v1, v1, p4

    .line 96
    .line 97
    if-nez v1, :cond_3

    .line 98
    .line 99
    move v1, v3

    .line 100
    goto :goto_3

    .line 101
    :cond_3
    move v1, v0

    .line 102
    :goto_3
    invoke-static {v1}, Ll/w11;->g(Z)V

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_4
    add-int/lit8 p4, p4, 0x1

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_5
    return-wide p2
.end method

.method public final c([Ll/xwd0;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/eyx;->i:[Lcom/google/android/exoplayer2/y;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/google/android/exoplayer2/y;->getTrackType()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, -0x2

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/eyx;->n:Ll/dgj0;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/dgj0;->c(I)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    new-instance v1, Ll/e0f;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/e0f;-><init>()V

    .line 27
    .line 28
    .line 29
    aput-object v1, p1, v0

    .line 30
    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-void
.end method

.method public d(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/eyx;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/eyx;->y(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iget-object p0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 13
    .line 14
    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/source/h;->c(J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/eyx;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    iget-object v1, p0, Ll/eyx;->n:Ll/dgj0;

    .line 10
    .line 11
    iget v2, v1, Ll/dgj0;->a:I

    .line 12
    .line 13
    if-ge v0, v2, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/dgj0;->c(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Ll/eyx;->n:Ll/dgj0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/dgj0;->c:[Ll/u9f;

    .line 22
    .line 23
    aget-object v2, v2, v0

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {v2}, Ll/u9f;->disable()V

    .line 30
    .line 31
    .line 32
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    :goto_1
    return-void
.end method

.method public final g([Ll/xwd0;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/eyx;->i:[Lcom/google/android/exoplayer2/y;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/google/android/exoplayer2/y;->getTrackType()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, -0x2

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    aput-object v1, p1, v0

    .line 18
    .line 19
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/eyx;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    iget-object v1, p0, Ll/eyx;->n:Ll/dgj0;

    .line 10
    .line 11
    iget v2, v1, Ll/dgj0;->a:I

    .line 12
    .line 13
    if-ge v0, v2, :cond_2

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/dgj0;->c(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Ll/eyx;->n:Ll/dgj0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/dgj0;->c:[Ll/u9f;

    .line 22
    .line 23
    aget-object v2, v2, v0

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {v2}, Ll/u9f;->enable()V

    .line 30
    .line 31
    .line 32
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    :goto_1
    return-void
.end method

.method public i()J
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/eyx;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/eyx;->f:Ll/gyx;

    .line 6
    .line 7
    iget-wide v0, p0, Ll/gyx;->b:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/eyx;->e:Z

    .line 11
    .line 12
    const-wide/high16 v1, -0x8000000000000000L

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/h;->d()J

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
    iget-object p0, p0, Ll/eyx;->f:Ll/gyx;

    .line 29
    .line 30
    iget-wide v0, p0, Ll/gyx;->e:J

    .line 31
    .line 32
    return-wide v0

    .line 33
    :cond_2
    return-wide v3
.end method

.method public j()Ll/eyx;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eyx;->l:Ll/eyx;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()J
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/eyx;->d:Z

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
    iget-object p0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/h;->f()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public l()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/eyx;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public m()J
    .locals 4

    .line 1
    iget-object v0, p0, Ll/eyx;->f:Ll/gyx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/gyx;->b:J

    .line 4
    .line 5
    iget-wide v2, p0, Ll/eyx;->o:J

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    return-wide v0
.end method

.method public n()Ll/ffj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyx;->m:Ll/ffj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/dgj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyx;->n:Ll/dgj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(FLcom/google/android/exoplayer2/c0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/eyx;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/google/android/exoplayer2/source/h;->m()Ll/ffj0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/eyx;->m:Ll/ffj0;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/eyx;->v(FLcom/google/android/exoplayer2/c0;)Ll/dgj0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p0, Ll/eyx;->f:Ll/gyx;

    .line 17
    .line 18
    iget-wide v0, p2, Ll/gyx;->b:J

    .line 19
    .line 20
    iget-wide v2, p2, Ll/gyx;->e:J

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
    const-wide/16 v0, 0x1

    .line 36
    .line 37
    sub-long/2addr v2, v0

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
    invoke-virtual {p0, p1, v0, v1, p2}, Ll/eyx;->a(Ll/dgj0;JZ)J

    .line 46
    .line 47
    .line 48
    move-result-wide p1

    .line 49
    iget-wide v0, p0, Ll/eyx;->o:J

    .line 50
    .line 51
    iget-object v2, p0, Ll/eyx;->f:Ll/gyx;

    .line 52
    .line 53
    iget-wide v3, v2, Ll/gyx;->b:J

    .line 54
    .line 55
    sub-long/2addr v3, p1

    .line 56
    add-long/2addr v0, v3

    .line 57
    iput-wide v0, p0, Ll/eyx;->o:J

    .line 58
    .line 59
    invoke-virtual {v2, p1, p2}, Ll/gyx;->b(J)Ll/gyx;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Ll/eyx;->f:Ll/gyx;

    .line 64
    .line 65
    return-void
.end method

.method public q()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/eyx;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/eyx;->e:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/google/android/exoplayer2/source/h;->d()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/high16 v2, -0x8000000000000000L

    .line 16
    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyx;->l:Ll/eyx;

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

.method public s(J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/eyx;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/eyx;->d:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/eyx;->y(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    invoke-interface {v0, p0, p1}, Lcom/google/android/exoplayer2/source/h;->e(J)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/eyx;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/eyx;->k:Lcom/google/android/exoplayer2/q;

    .line 5
    .line 6
    iget-object p0, p0, Ll/eyx;->a:Lcom/google/android/exoplayer2/source/h;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/eyx;->u(Lcom/google/android/exoplayer2/q;Lcom/google/android/exoplayer2/source/h;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v(FLcom/google/android/exoplayer2/c0;)Ll/dgj0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eyx;->j:Ll/cgj0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/eyx;->i:[Lcom/google/android/exoplayer2/y;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eyx;->n()Ll/ffj0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object p0, p0, Ll/eyx;->f:Ll/gyx;

    .line 10
    .line 11
    iget-object p0, p0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, p0, p2}, Ll/cgj0;->k([Lcom/google/android/exoplayer2/y;Ll/ffj0;Lcom/google/android/exoplayer2/source/i$b;Lcom/google/android/exoplayer2/c0;)Ll/dgj0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p2, p0, Ll/dgj0;->c:[Ll/u9f;

    .line 18
    .line 19
    array-length v0, p2

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ge v1, v0, :cond_1

    .line 22
    .line 23
    aget-object v2, p2, v1

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-interface {v2, p1}, Ll/u9f;->n(F)V

    .line 28
    .line 29
    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-object p0
.end method

.method public w(Ll/eyx;)V
    .locals 1
    .param p1    # Ll/eyx;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/eyx;->l:Ll/eyx;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/eyx;->f()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/eyx;->l:Ll/eyx;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/eyx;->h()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public x(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/eyx;->o:J

    .line 2
    .line 3
    return-void
.end method

.method public y(J)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/eyx;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    return-wide p1
.end method

.method public z(J)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/eyx;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-long/2addr p1, v0

    .line 6
    return-wide p1
.end method
