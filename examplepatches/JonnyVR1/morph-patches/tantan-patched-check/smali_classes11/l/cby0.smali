.class public final Ll/cby0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/hwt0;

.field public final b:Ll/wyt0;

.field public final c:Ll/wfy0;

.field public final d:Ll/usv0;

.field public e:J

.field public f:I

.field public g:Z

.field public h:Ll/oay0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/oay0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ll/oay0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:I

.field public l:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:J

.field public final n:Ll/b7y0;


# direct methods
.method public constructor <init>(Ll/wfy0;Ll/usv0;Ll/b7y0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cby0;->c:Ll/wfy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cby0;->d:Ll/usv0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/cby0;->n:Ll/b7y0;

    .line 9
    .line 10
    new-instance p1, Ll/hwt0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/hwt0;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/cby0;->a:Ll/hwt0;

    .line 16
    .line 17
    new-instance p1, Ll/wyt0;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/wyt0;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/cby0;->b:Ll/wyt0;

    .line 23
    .line 24
    return-void
.end method

.method public static A(Ll/d0u0;Ljava/lang/Object;JJLl/wyt0;Ll/hwt0;)Ll/kzy0;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p7}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 2
    .line 3
    .line 4
    iget v0, p7, Ll/hwt0;->c:I

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-virtual {p0, v0, p6, v1, v2}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    invoke-virtual {p7}, Ll/hwt0;->b()I

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1, p7}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 18
    .line 19
    .line 20
    move-wide v0, p2

    .line 21
    invoke-virtual {p7, v0, v1}, Ll/hwt0;->d(J)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const/4 p0, -0x1

    .line 26
    if-ne p2, p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p7, v0, v1}, Ll/hwt0;->c(J)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    new-instance p2, Ll/kzy0;

    .line 33
    .line 34
    invoke-direct {p2, p1, p4, p5, p0}, Ll/kzy0;-><init>(Ljava/lang/Object;JI)V

    .line 35
    .line 36
    .line 37
    return-object p2

    .line 38
    :cond_0
    invoke-virtual {p7, p2}, Ll/hwt0;->e(I)I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    new-instance p0, Ll/kzy0;

    .line 43
    .line 44
    invoke-direct/range {p0 .. p5}, Ll/kzy0;-><init>(Ljava/lang/Object;IIJ)V

    .line 45
    .line 46
    .line 47
    return-object p0
.end method

.method public static final c(Ll/kzy0;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/kzy0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/kzy0;->e:I

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method


# virtual methods
.method public final B()V
    .locals 4

    .line 1
    new-instance v0, Ll/mqw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mqw0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/cby0;->h:Ll/oay0;

    .line 7
    .line 8
    :goto_0
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v2, v1, Ll/oay0;->f:Ll/tay0;

    .line 11
    .line 12
    iget-object v2, v2, Ll/tay0;->a:Ll/kzy0;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ll/oay0;->g()Ll/oay0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Ll/cby0;->i:Ll/oay0;

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v1, v1, Ll/oay0;->f:Ll/tay0;

    .line 29
    .line 30
    iget-object v1, v1, Ll/tay0;->a:Ll/kzy0;

    .line 31
    .line 32
    :goto_1
    iget-object v2, p0, Ll/cby0;->d:Ll/usv0;

    .line 33
    .line 34
    new-instance v3, Ll/xay0;

    .line 35
    .line 36
    invoke-direct {v3, p0, v0, v1}, Ll/xay0;-><init>(Ll/cby0;Ll/mqw0;Ll/kzy0;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v2, v3}, Ll/usv0;->g(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final C(Ll/d0u0;Ll/kzy0;Z)Z
    .locals 7

    .line 1
    iget-object p2, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object p2, p0, Ll/cby0;->a:Ll/hwt0;

    .line 8
    .line 9
    const/4 v6, 0x0

    .line 10
    invoke-virtual {p1, v1, p2, v6}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget p2, p2, Ll/hwt0;->c:I

    .line 15
    .line 16
    iget-object v0, p0, Ll/cby0;->b:Ll/wyt0;

    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0, v2, v3}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-boolean p2, p2, Ll/wyt0;->h:Z

    .line 25
    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    iget-object v2, p0, Ll/cby0;->a:Ll/hwt0;

    .line 29
    .line 30
    iget-object v3, p0, Ll/cby0;->b:Ll/wyt0;

    .line 31
    .line 32
    iget v4, p0, Ll/cby0;->f:I

    .line 33
    .line 34
    iget-boolean v5, p0, Ll/cby0;->g:Z

    .line 35
    .line 36
    move-object v0, p1

    .line 37
    invoke-virtual/range {v0 .. v5}, Ll/d0u0;->i(ILl/hwt0;Ll/wyt0;IZ)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    const/4 p1, -0x1

    .line 42
    if-ne p0, p1, :cond_0

    .line 43
    .line 44
    if-eqz p3, :cond_0

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_0
    return v6
.end method

.method public final a(Ll/d0u0;Ll/kzy0;)Z
    .locals 4

    .line 1
    invoke-static {p2}, Ll/cby0;->c(Ll/kzy0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object v2, p0, Ll/cby0;->a:Ll/hwt0;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v2}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Ll/hwt0;->c:I

    .line 18
    .line 19
    iget-object p2, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object p0, p0, Ll/cby0;->b:Ll/wyt0;

    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    invoke-virtual {p1, v0, p0, v2, v3}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget p0, p0, Ll/wyt0;->o:I

    .line 34
    .line 35
    if-ne p0, p2, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v1
.end method

.method public final b(Ll/d0u0;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v2, v0, Ll/oay0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    move v3, v2

    .line 14
    :goto_0
    iget-object v4, p0, Ll/cby0;->a:Ll/hwt0;

    .line 15
    .line 16
    iget-object v5, p0, Ll/cby0;->b:Ll/wyt0;

    .line 17
    .line 18
    iget v6, p0, Ll/cby0;->f:I

    .line 19
    .line 20
    iget-boolean v7, p0, Ll/cby0;->g:Z

    .line 21
    .line 22
    move-object v2, p1

    .line 23
    invoke-virtual/range {v2 .. v7}, Ll/d0u0;->i(ILl/hwt0;Ll/wyt0;IZ)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, v0, Ll/oay0;->f:Ll/tay0;

    .line 37
    .line 38
    iget-boolean p1, p1, Ll/tay0;->g:Z

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/4 v4, -0x1

    .line 52
    if-eq v3, v4, :cond_4

    .line 53
    .line 54
    if-nez p1, :cond_2

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    iget-object v4, p1, Ll/oay0;->b:Ljava/lang/Object;

    .line 58
    .line 59
    invoke-virtual {v2, v4}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eq v4, v3, :cond_3

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    move-object v0, p1

    .line 67
    move-object p1, v2

    .line 68
    goto :goto_0

    .line 69
    :cond_4
    :goto_2
    invoke-virtual {p0, v0}, Ll/cby0;->q(Ll/oay0;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget-object v3, v0, Ll/oay0;->f:Ll/tay0;

    .line 74
    .line 75
    invoke-virtual {p0, v2, v3}, Ll/cby0;->k(Ll/d0u0;Ll/tay0;)Ll/tay0;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iput-object p0, v0, Ll/oay0;->f:Ll/tay0;

    .line 80
    .line 81
    if-nez p1, :cond_5

    .line 82
    .line 83
    return v1

    .line 84
    :cond_5
    const/4 p0, 0x0

    .line 85
    return p0
.end method

.method public final d()Ll/oay0;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v2, p0, Ll/cby0;->i:Ll/oay0;

    .line 8
    .line 9
    if-ne v0, v2, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iput-object v2, p0, Ll/cby0;->i:Ll/oay0;

    .line 16
    .line 17
    :cond_1
    invoke-virtual {v0}, Ll/oay0;->n()V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/cby0;->k:I

    .line 21
    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    iput v0, p0, Ll/cby0;->k:I

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iput-object v1, p0, Ll/cby0;->j:Ll/oay0;

    .line 29
    .line 30
    iget-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 31
    .line 32
    iget-object v1, v0, Ll/oay0;->b:Ljava/lang/Object;

    .line 33
    .line 34
    iput-object v1, p0, Ll/cby0;->l:Ljava/lang/Object;

    .line 35
    .line 36
    iget-object v0, v0, Ll/oay0;->f:Ll/tay0;

    .line 37
    .line 38
    iget-object v0, v0, Ll/tay0;->a:Ll/kzy0;

    .line 39
    .line 40
    iget-wide v0, v0, Ll/kzy0;->d:J

    .line 41
    .line 42
    iput-wide v0, p0, Ll/cby0;->m:J

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/cby0;->B()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/cby0;->h:Ll/oay0;

    .line 56
    .line 57
    return-object p0
.end method

.method public final e()Ll/oay0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cby0;->i:Ll/oay0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/cby0;->i:Ll/oay0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/cby0;->B()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/cby0;->i:Ll/oay0;

    .line 16
    .line 17
    invoke-static {p0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public final f(Ll/tay0;)Ll/oay0;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide v0, 0xe8d4a51000L

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Ll/oay0;->e()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iget-object v0, v0, Ll/oay0;->f:Ll/tay0;

    .line 16
    .line 17
    iget-wide v3, v0, Ll/tay0;->e:J

    .line 18
    .line 19
    add-long/2addr v1, v3

    .line 20
    iget-wide v3, p1, Ll/tay0;->b:J

    .line 21
    .line 22
    sub-long v0, v1, v3

    .line 23
    .line 24
    :goto_0
    iget-object v2, p0, Ll/cby0;->n:Ll/b7y0;

    .line 25
    .line 26
    iget-object v2, v2, Ll/b7y0;->a:Lcom/google/android/gms/internal/ads/b7;

    .line 27
    .line 28
    invoke-static {v2, p1, v0, v1}, Lcom/google/android/gms/internal/ads/b7;->U(Lcom/google/android/gms/internal/ads/b7;Ll/tay0;J)Ll/oay0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/oay0;->o(Ll/oay0;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iput-object p1, p0, Ll/cby0;->h:Ll/oay0;

    .line 41
    .line 42
    iput-object p1, p0, Ll/cby0;->i:Ll/oay0;

    .line 43
    .line 44
    :goto_1
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Ll/cby0;->l:Ljava/lang/Object;

    .line 46
    .line 47
    iput-object p1, p0, Ll/cby0;->j:Ll/oay0;

    .line 48
    .line 49
    iget v0, p0, Ll/cby0;->k:I

    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    iput v0, p0, Ll/cby0;->k:I

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/cby0;->B()V

    .line 56
    .line 57
    .line 58
    return-object p1
.end method

.method public final g()Ll/oay0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cby0;->j:Ll/oay0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Ll/oay0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cby0;->h:Ll/oay0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Ll/oay0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cby0;->i:Ll/oay0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(JLl/edy0;)Ll/tay0;
    .locals 8
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v2, p3, Ll/edy0;->a:Ll/d0u0;

    .line 6
    .line 7
    iget-object v3, p3, Ll/edy0;->b:Ll/kzy0;

    .line 8
    .line 9
    iget-wide v4, p3, Ll/edy0;->c:J

    .line 10
    .line 11
    iget-wide v6, p3, Ll/edy0;->r:J

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    invoke-virtual/range {v1 .. v7}, Ll/cby0;->x(Ll/d0u0;Ll/kzy0;JJ)Ll/tay0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    move-object v1, p0

    .line 20
    iget-object p0, p3, Ll/edy0;->a:Ll/d0u0;

    .line 21
    .line 22
    invoke-virtual {v1, p0, v0, p1, p2}, Ll/cby0;->w(Ll/d0u0;Ll/oay0;J)Ll/tay0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final k(Ll/d0u0;Ll/tay0;)Ll/tay0;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v2, Ll/tay0;->a:Ll/kzy0;

    .line 8
    .line 9
    invoke-static {v3}, Ll/cby0;->c(Ll/kzy0;)Z

    .line 10
    .line 11
    .line 12
    move-result v11

    .line 13
    invoke-virtual {v0, v1, v3}, Ll/cby0;->a(Ll/d0u0;Ll/kzy0;)Z

    .line 14
    .line 15
    .line 16
    move-result v12

    .line 17
    invoke-virtual {v0, v1, v3, v11}, Ll/cby0;->C(Ll/d0u0;Ll/kzy0;Z)Z

    .line 18
    .line 19
    .line 20
    move-result v13

    .line 21
    iget-object v4, v2, Ll/tay0;->a:Ll/kzy0;

    .line 22
    .line 23
    iget-object v4, v4, Ll/kzy0;->a:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v5, v0, Ll/cby0;->a:Ll/hwt0;

    .line 26
    .line 27
    invoke-virtual {v1, v4, v5}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ll/kzy0;->b()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v4, -0x1

    .line 35
    const-wide/16 v5, 0x0

    .line 36
    .line 37
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    iget v1, v3, Ll/kzy0;->e:I

    .line 45
    .line 46
    if-ne v1, v4, :cond_1

    .line 47
    .line 48
    :cond_0
    move-wide v9, v7

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object v9, v0, Ll/cby0;->a:Ll/hwt0;

    .line 51
    .line 52
    invoke-virtual {v9, v1}, Ll/hwt0;->i(I)J

    .line 53
    .line 54
    .line 55
    move-wide v9, v5

    .line 56
    :goto_0
    invoke-virtual {v3}, Ll/kzy0;->b()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iget-object v1, v0, Ll/cby0;->a:Ll/hwt0;

    .line 63
    .line 64
    iget v5, v3, Ll/kzy0;->b:I

    .line 65
    .line 66
    iget v6, v3, Ll/kzy0;->c:I

    .line 67
    .line 68
    invoke-virtual {v1, v5, v6}, Ll/hwt0;->h(II)J

    .line 69
    .line 70
    .line 71
    move-result-wide v5

    .line 72
    :goto_1
    move-wide v14, v9

    .line 73
    move-wide v8, v5

    .line 74
    move-wide v6, v14

    .line 75
    goto :goto_2

    .line 76
    :cond_2
    cmp-long v1, v9, v7

    .line 77
    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    move-wide v8, v5

    .line 81
    move-wide v6, v8

    .line 82
    goto :goto_2

    .line 83
    :cond_3
    iget-object v1, v0, Ll/cby0;->a:Ll/hwt0;

    .line 84
    .line 85
    iget-wide v5, v1, Ll/hwt0;->d:J

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :goto_2
    invoke-virtual {v3}, Ll/kzy0;->b()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_4

    .line 93
    .line 94
    iget-object v0, v0, Ll/cby0;->a:Ll/hwt0;

    .line 95
    .line 96
    iget v1, v3, Ll/kzy0;->b:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/hwt0;->n(I)Z

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_4
    iget v1, v3, Ll/kzy0;->e:I

    .line 103
    .line 104
    if-eq v1, v4, :cond_5

    .line 105
    .line 106
    iget-object v0, v0, Ll/cby0;->a:Ll/hwt0;

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ll/hwt0;->n(I)Z

    .line 109
    .line 110
    .line 111
    :cond_5
    :goto_3
    new-instance v0, Ll/tay0;

    .line 112
    .line 113
    iget-wide v4, v2, Ll/tay0;->b:J

    .line 114
    .line 115
    iget-wide v1, v2, Ll/tay0;->c:J

    .line 116
    .line 117
    const/4 v10, 0x0

    .line 118
    move-wide v14, v1

    .line 119
    move-object v1, v3

    .line 120
    move-wide v2, v4

    .line 121
    move-wide v4, v14

    .line 122
    invoke-direct/range {v0 .. v13}, Ll/tay0;-><init>(Ll/kzy0;JJJJZZZZ)V

    .line 123
    .line 124
    .line 125
    return-object v0
.end method

.method public final l(Ll/d0u0;Ljava/lang/Object;J)Ll/kzy0;
    .locals 10

    .line 1
    iget-object v3, p0, Ll/cby0;->a:Ll/hwt0;

    .line 2
    .line 3
    invoke-virtual {p1, p2, v3}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    iget v3, v3, Ll/hwt0;->c:I

    .line 8
    .line 9
    iget-object v4, p0, Ll/cby0;->l:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    const/4 v9, -0x1

    .line 13
    if-eqz v4, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1, v4}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eq v4, v9, :cond_1

    .line 20
    .line 21
    iget-object v6, p0, Ll/cby0;->a:Ll/hwt0;

    .line 22
    .line 23
    invoke-virtual {p1, v4, v6, v5}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget v4, v4, Ll/hwt0;->c:I

    .line 28
    .line 29
    if-ne v4, v3, :cond_1

    .line 30
    .line 31
    iget-wide v3, p0, Ll/cby0;->m:J

    .line 32
    .line 33
    :cond_0
    :goto_0
    move-wide v5, v3

    .line 34
    goto :goto_3

    .line 35
    :cond_1
    iget-object v4, p0, Ll/cby0;->h:Ll/oay0;

    .line 36
    .line 37
    :goto_1
    if-eqz v4, :cond_3

    .line 38
    .line 39
    iget-object v6, v4, Ll/oay0;->b:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-virtual {v6, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    if-eqz v6, :cond_2

    .line 46
    .line 47
    iget-object v3, v4, Ll/oay0;->f:Ll/tay0;

    .line 48
    .line 49
    iget-object v3, v3, Ll/tay0;->a:Ll/kzy0;

    .line 50
    .line 51
    iget-wide v3, v3, Ll/kzy0;->d:J

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-virtual {v4}, Ll/oay0;->g()Ll/oay0;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    goto :goto_1

    .line 59
    :cond_3
    iget-object v4, p0, Ll/cby0;->h:Ll/oay0;

    .line 60
    .line 61
    :goto_2
    if-eqz v4, :cond_5

    .line 62
    .line 63
    iget-object v6, v4, Ll/oay0;->b:Ljava/lang/Object;

    .line 64
    .line 65
    invoke-virtual {p1, v6}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    if-eq v6, v9, :cond_4

    .line 70
    .line 71
    iget-object v7, p0, Ll/cby0;->a:Ll/hwt0;

    .line 72
    .line 73
    invoke-virtual {p1, v6, v7, v5}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    iget v6, v6, Ll/hwt0;->c:I

    .line 78
    .line 79
    if-ne v6, v3, :cond_4

    .line 80
    .line 81
    iget-object v3, v4, Ll/oay0;->f:Ll/tay0;

    .line 82
    .line 83
    iget-object v3, v3, Ll/tay0;->a:Ll/kzy0;

    .line 84
    .line 85
    iget-wide v3, v3, Ll/kzy0;->d:J

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    invoke-virtual {v4}, Ll/oay0;->g()Ll/oay0;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    goto :goto_2

    .line 93
    :cond_5
    iget-wide v3, p0, Ll/cby0;->e:J

    .line 94
    .line 95
    const-wide/16 v5, 0x1

    .line 96
    .line 97
    add-long/2addr v5, v3

    .line 98
    iput-wide v5, p0, Ll/cby0;->e:J

    .line 99
    .line 100
    iget-object v5, p0, Ll/cby0;->h:Ll/oay0;

    .line 101
    .line 102
    if-nez v5, :cond_0

    .line 103
    .line 104
    iput-object p2, p0, Ll/cby0;->l:Ljava/lang/Object;

    .line 105
    .line 106
    iput-wide v3, p0, Ll/cby0;->m:J

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :goto_3
    iget-object v3, p0, Ll/cby0;->a:Ll/hwt0;

    .line 110
    .line 111
    invoke-virtual {p1, p2, v3}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 112
    .line 113
    .line 114
    iget-object v3, p0, Ll/cby0;->a:Ll/hwt0;

    .line 115
    .line 116
    iget-object v4, p0, Ll/cby0;->b:Ll/wyt0;

    .line 117
    .line 118
    iget v3, v3, Ll/hwt0;->c:I

    .line 119
    .line 120
    const-wide/16 v7, 0x0

    .line 121
    .line 122
    invoke-virtual {p1, v3, v4, v7, v8}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 123
    .line 124
    .line 125
    invoke-virtual/range {p1 .. p2}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    move-object v2, p2

    .line 130
    :goto_4
    iget-object v7, p0, Ll/cby0;->b:Ll/wyt0;

    .line 131
    .line 132
    iget v4, v7, Ll/wyt0;->n:I

    .line 133
    .line 134
    iget-object v8, p0, Ll/cby0;->a:Ll/hwt0;

    .line 135
    .line 136
    if-lt v3, v4, :cond_7

    .line 137
    .line 138
    const/4 v4, 0x1

    .line 139
    invoke-virtual {p1, v3, v8, v4}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 140
    .line 141
    .line 142
    iget-object v4, p0, Ll/cby0;->a:Ll/hwt0;

    .line 143
    .line 144
    invoke-virtual {v4}, Ll/hwt0;->b()I

    .line 145
    .line 146
    .line 147
    iget-object v4, p0, Ll/cby0;->a:Ll/hwt0;

    .line 148
    .line 149
    iget-wide v7, v4, Ll/hwt0;->d:J

    .line 150
    .line 151
    invoke-virtual {v4, v7, v8}, Ll/hwt0;->d(J)I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    if-eq v4, v9, :cond_6

    .line 156
    .line 157
    iget-object v2, p0, Ll/cby0;->a:Ll/hwt0;

    .line 158
    .line 159
    iget-object v2, v2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 160
    .line 161
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    :cond_6
    add-int/lit8 v3, v3, -0x1

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_7
    move-object v1, p1

    .line 168
    move-wide v3, p3

    .line 169
    invoke-static/range {v1 .. v8}, Ll/cby0;->A(Ll/d0u0;Ljava/lang/Object;JJLl/wyt0;Ll/hwt0;)Ll/kzy0;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    return-object v0
.end method

.method public final m()V
    .locals 3

    .line 1
    iget v0, p0, Ll/cby0;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v1, v0, Ll/oay0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    iput-object v1, p0, Ll/cby0;->l:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object v1, v0, Ll/oay0;->f:Ll/tay0;

    .line 16
    .line 17
    iget-object v1, v1, Ll/tay0;->a:Ll/kzy0;

    .line 18
    .line 19
    iget-wide v1, v1, Ll/kzy0;->d:J

    .line 20
    .line 21
    iput-wide v1, p0, Ll/cby0;->m:J

    .line 22
    .line 23
    :goto_0
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/oay0;->n()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/oay0;->g()Ll/oay0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 35
    .line 36
    iput-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 37
    .line 38
    iput-object v0, p0, Ll/cby0;->i:Ll/oay0;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput v0, p0, Ll/cby0;->k:I

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/cby0;->B()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic n(Ll/mqw0;Ll/kzy0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cby0;->c:Ll/wfy0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1, p2}, Ll/wfy0;->J(Ljava/util/List;Ll/kzy0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final o(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cby0;->j:Ll/oay0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/oay0;->m(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final p(Ll/izy0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cby0;->j:Ll/oay0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/oay0;->a:Ll/izy0;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final q(Ll/oay0;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    iput-object p1, p0, Ll/cby0;->j:Ll/oay0;

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1}, Ll/oay0;->g()Ll/oay0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/oay0;->g()Ll/oay0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/cby0;->i:Ll/oay0;

    .line 30
    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/cby0;->h:Ll/oay0;

    .line 34
    .line 35
    iput-object v0, p0, Ll/cby0;->i:Ll/oay0;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    move v1, v0

    .line 39
    :cond_1
    invoke-virtual {p1}, Ll/oay0;->n()V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Ll/cby0;->k:I

    .line 43
    .line 44
    add-int/lit8 v0, v0, -0x1

    .line 45
    .line 46
    iput v0, p0, Ll/cby0;->k:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    iget-object p1, p0, Ll/cby0;->j:Ll/oay0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p1, v0}, Ll/oay0;->o(Ll/oay0;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/cby0;->B()V

    .line 59
    .line 60
    .line 61
    return v1
.end method

.method public final r()Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, v0, Ll/oay0;->f:Ll/tay0;

    .line 7
    .line 8
    iget-boolean v2, v2, Ll/tay0;->i:Z

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oay0;->r()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/cby0;->j:Ll/oay0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/oay0;->f:Ll/tay0;

    .line 22
    .line 23
    iget-wide v4, v0, Ll/tay0;->e:J

    .line 24
    .line 25
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    cmp-long v0, v4, v6

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget p0, p0, Ll/cby0;->k:I

    .line 35
    .line 36
    const/16 v0, 0x64

    .line 37
    .line 38
    if-ge p0, v0, :cond_0

    .line 39
    .line 40
    return v1

    .line 41
    :cond_0
    return v3

    .line 42
    :cond_1
    return v1
.end method

.method public final s(Ll/d0u0;JJ)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/cby0;->h:Ll/oay0;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    :goto_0
    const/4 v4, 0x1

    .line 9
    if-eqz v2, :cond_b

    .line 10
    .line 11
    iget-object v5, v2, Ll/oay0;->f:Ll/tay0;

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v1, v5}, Ll/cby0;->k(Ll/d0u0;Ll/tay0;)Ll/tay0;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    move-wide/from16 v7, p2

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    move-wide/from16 v7, p2

    .line 24
    .line 25
    invoke-virtual {v0, v1, v3, v7, v8}, Ll/cby0;->w(Ll/d0u0;Ll/oay0;J)Ll/tay0;

    .line 26
    .line 27
    .line 28
    move-result-object v9

    .line 29
    if-nez v9, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Ll/cby0;->q(Ll/oay0;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    return v4

    .line 38
    :cond_1
    return v6

    .line 39
    :cond_2
    iget-wide v10, v5, Ll/tay0;->b:J

    .line 40
    .line 41
    iget-wide v12, v9, Ll/tay0;->b:J

    .line 42
    .line 43
    cmp-long v10, v10, v12

    .line 44
    .line 45
    if-nez v10, :cond_9

    .line 46
    .line 47
    iget-object v10, v5, Ll/tay0;->a:Ll/kzy0;

    .line 48
    .line 49
    iget-object v11, v9, Ll/tay0;->a:Ll/kzy0;

    .line 50
    .line 51
    invoke-virtual {v10, v11}, Ll/kzy0;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v10

    .line 55
    if-eqz v10, :cond_9

    .line 56
    .line 57
    move-object v3, v9

    .line 58
    :goto_1
    iget-wide v9, v5, Ll/tay0;->c:J

    .line 59
    .line 60
    invoke-virtual {v3, v9, v10}, Ll/tay0;->a(J)Ll/tay0;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    iput-object v9, v2, Ll/oay0;->f:Ll/tay0;

    .line 65
    .line 66
    iget-wide v9, v5, Ll/tay0;->e:J

    .line 67
    .line 68
    const-wide v11, -0x7fffffffffffffffL    # -4.9E-324

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    cmp-long v5, v9, v11

    .line 74
    .line 75
    iget-wide v13, v3, Ll/tay0;->e:J

    .line 76
    .line 77
    if-eqz v5, :cond_8

    .line 78
    .line 79
    cmp-long v5, v9, v13

    .line 80
    .line 81
    if-nez v5, :cond_3

    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_3
    invoke-virtual {v2}, Ll/oay0;->q()V

    .line 85
    .line 86
    .line 87
    iget-wide v7, v3, Ll/tay0;->e:J

    .line 88
    .line 89
    cmp-long v1, v7, v11

    .line 90
    .line 91
    if-nez v1, :cond_4

    .line 92
    .line 93
    const-wide v7, 0x7fffffffffffffffL

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_4
    invoke-virtual {v2}, Ll/oay0;->e()J

    .line 100
    .line 101
    .line 102
    move-result-wide v9

    .line 103
    add-long/2addr v7, v9

    .line 104
    :goto_2
    iget-object v1, v0, Ll/cby0;->i:Ll/oay0;

    .line 105
    .line 106
    if-ne v2, v1, :cond_6

    .line 107
    .line 108
    iget-object v1, v2, Ll/oay0;->f:Ll/tay0;

    .line 109
    .line 110
    iget-boolean v1, v1, Ll/tay0;->f:Z

    .line 111
    .line 112
    const-wide/high16 v9, -0x8000000000000000L

    .line 113
    .line 114
    cmp-long v1, p4, v9

    .line 115
    .line 116
    if-eqz v1, :cond_5

    .line 117
    .line 118
    cmp-long v1, p4, v7

    .line 119
    .line 120
    if-ltz v1, :cond_6

    .line 121
    .line 122
    :cond_5
    move v1, v4

    .line 123
    goto :goto_3

    .line 124
    :cond_6
    move v1, v6

    .line 125
    :goto_3
    invoke-virtual {v0, v2}, Ll/cby0;->q(Ll/oay0;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_7

    .line 130
    .line 131
    if-nez v1, :cond_7

    .line 132
    .line 133
    return v4

    .line 134
    :cond_7
    return v6

    .line 135
    :cond_8
    :goto_4
    invoke-virtual {v2}, Ll/oay0;->g()Ll/oay0;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    move-object v15, v3

    .line 140
    move-object v3, v2

    .line 141
    move-object v2, v15

    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_9
    invoke-virtual {v0, v3}, Ll/cby0;->q(Ll/oay0;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_a

    .line 149
    .line 150
    return v4

    .line 151
    :cond_a
    return v6

    .line 152
    :cond_b
    return v4
.end method

.method public final t(Ll/d0u0;I)Z
    .locals 0

    .line 1
    iput p2, p0, Ll/cby0;->f:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cby0;->b(Ll/d0u0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final u(Ll/d0u0;Z)Z
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/cby0;->g:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cby0;->b(Ll/d0u0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final v(Ll/d0u0;Ljava/lang/Object;I)J
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cby0;->a:Ll/hwt0;

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/cby0;->a:Ll/hwt0;

    .line 7
    .line 8
    invoke-virtual {p1, p3}, Ll/hwt0;->i(I)J

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/cby0;->a:Ll/hwt0;

    .line 12
    .line 13
    invoke-virtual {p0, p3}, Ll/hwt0;->k(I)J

    .line 14
    .line 15
    .line 16
    const-wide/16 p0, 0x0

    .line 17
    .line 18
    return-wide p0
.end method

.method public final w(Ll/d0u0;Ll/oay0;J)Ll/tay0;
    .locals 19
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v9, p2

    .line 6
    .line 7
    iget-object v10, v9, Ll/oay0;->f:Ll/tay0;

    .line 8
    .line 9
    invoke-virtual {v9}, Ll/oay0;->e()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    iget-wide v4, v10, Ll/tay0;->e:J

    .line 14
    .line 15
    add-long/2addr v2, v4

    .line 16
    iget-boolean v4, v10, Ll/tay0;->g:Z

    .line 17
    .line 18
    sub-long v7, v2, p3

    .line 19
    .line 20
    iget-object v11, v10, Ll/tay0;->a:Ll/kzy0;

    .line 21
    .line 22
    const/4 v12, -0x1

    .line 23
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    if-eqz v4, :cond_5

    .line 26
    .line 27
    iget-object v4, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-virtual {v1, v4}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    iget v5, v0, Ll/cby0;->f:I

    .line 34
    .line 35
    iget-boolean v6, v0, Ll/cby0;->g:Z

    .line 36
    .line 37
    move-wide v15, v2

    .line 38
    move v2, v4

    .line 39
    iget-object v4, v0, Ll/cby0;->b:Ll/wyt0;

    .line 40
    .line 41
    iget-object v3, v0, Ll/cby0;->a:Ll/hwt0;

    .line 42
    .line 43
    move-wide v13, v15

    .line 44
    const/16 p3, 0x0

    .line 45
    .line 46
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    invoke-virtual/range {v1 .. v6}, Ll/d0u0;->i(ILl/hwt0;Ll/wyt0;IZ)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-ne v2, v12, :cond_0

    .line 56
    .line 57
    return-object p3

    .line 58
    :cond_0
    iget-object v3, v0, Ll/cby0;->a:Ll/hwt0;

    .line 59
    .line 60
    const/4 v4, 0x1

    .line 61
    invoke-virtual {v1, v2, v3, v4}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget v4, v3, Ll/hwt0;->c:I

    .line 66
    .line 67
    iget-object v3, v0, Ll/cby0;->a:Ll/hwt0;

    .line 68
    .line 69
    iget-object v3, v3, Ll/hwt0;->b:Ljava/lang/Object;

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    iget-object v5, v10, Ll/tay0;->a:Ll/kzy0;

    .line 75
    .line 76
    iget-wide v5, v5, Ll/kzy0;->d:J

    .line 77
    .line 78
    iget-object v11, v0, Ll/cby0;->b:Ll/wyt0;

    .line 79
    .line 80
    invoke-virtual {v1, v4, v11, v13, v14}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    iget v11, v11, Ll/wyt0;->n:I

    .line 85
    .line 86
    if-ne v11, v2, :cond_3

    .line 87
    .line 88
    iget-object v2, v0, Ll/cby0;->b:Ll/wyt0;

    .line 89
    .line 90
    iget-object v3, v0, Ll/cby0;->a:Ll/hwt0;

    .line 91
    .line 92
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    invoke-static {v13, v14, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 98
    .line 99
    .line 100
    move-result-wide v7

    .line 101
    invoke-virtual/range {v1 .. v8}, Ll/d0u0;->m(Ll/wyt0;Ll/hwt0;IJJ)Landroid/util/Pair;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    if-nez v2, :cond_1

    .line 106
    .line 107
    return-object p3

    .line 108
    :cond_1
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 109
    .line 110
    iget-object v1, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v1, Ljava/lang/Long;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 115
    .line 116
    .line 117
    move-result-wide v1

    .line 118
    invoke-virtual {v9}, Ll/oay0;->g()Ll/oay0;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    if-eqz v4, :cond_2

    .line 123
    .line 124
    iget-object v5, v4, Ll/oay0;->b:Ljava/lang/Object;

    .line 125
    .line 126
    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    if-eqz v5, :cond_2

    .line 131
    .line 132
    iget-object v4, v4, Ll/oay0;->f:Ll/tay0;

    .line 133
    .line 134
    iget-object v4, v4, Ll/tay0;->a:Ll/kzy0;

    .line 135
    .line 136
    iget-wide v5, v4, Ll/kzy0;->d:J

    .line 137
    .line 138
    :goto_0
    move-wide v13, v1

    .line 139
    move-object v2, v3

    .line 140
    move-wide v3, v13

    .line 141
    move-wide/from16 v13, v17

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_2
    iget-wide v5, v0, Ll/cby0;->e:J

    .line 145
    .line 146
    const-wide/16 v7, 0x1

    .line 147
    .line 148
    add-long/2addr v7, v5

    .line 149
    iput-wide v7, v0, Ll/cby0;->e:J

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_3
    move-object v2, v3

    .line 153
    move-wide v3, v13

    .line 154
    :goto_1
    iget-object v7, v0, Ll/cby0;->b:Ll/wyt0;

    .line 155
    .line 156
    iget-object v8, v0, Ll/cby0;->a:Ll/hwt0;

    .line 157
    .line 158
    move-object/from16 v1, p1

    .line 159
    .line 160
    invoke-static/range {v1 .. v8}, Ll/cby0;->A(Ll/d0u0;Ljava/lang/Object;JJLl/wyt0;Ll/hwt0;)Ll/kzy0;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    cmp-long v5, v13, v17

    .line 165
    .line 166
    if-eqz v5, :cond_4

    .line 167
    .line 168
    iget-wide v5, v10, Ll/tay0;->c:J

    .line 169
    .line 170
    cmp-long v5, v5, v17

    .line 171
    .line 172
    if-eqz v5, :cond_4

    .line 173
    .line 174
    iget-object v5, v10, Ll/tay0;->a:Ll/kzy0;

    .line 175
    .line 176
    iget-object v5, v5, Ll/kzy0;->a:Ljava/lang/Object;

    .line 177
    .line 178
    iget-object v6, v0, Ll/cby0;->a:Ll/hwt0;

    .line 179
    .line 180
    invoke-virtual {v1, v5, v6}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    invoke-virtual {v5}, Ll/hwt0;->b()I

    .line 185
    .line 186
    .line 187
    iget-object v5, v0, Ll/cby0;->a:Ll/hwt0;

    .line 188
    .line 189
    invoke-virtual {v5}, Ll/hwt0;->g()I

    .line 190
    .line 191
    .line 192
    :cond_4
    move-wide v5, v3

    .line 193
    move-wide v3, v13

    .line 194
    invoke-virtual/range {v0 .. v6}, Ll/cby0;->x(Ll/d0u0;Ll/kzy0;JJ)Ll/tay0;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    return-object v0

    .line 199
    :cond_5
    move-wide v13, v2

    .line 200
    const/16 p3, 0x0

    .line 201
    .line 202
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    iget-object v2, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 208
    .line 209
    iget-object v3, v0, Ll/cby0;->a:Ll/hwt0;

    .line 210
    .line 211
    invoke-virtual {v1, v2, v3}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v11}, Ll/kzy0;->b()Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v2, :cond_a

    .line 219
    .line 220
    iget v3, v11, Ll/kzy0;->b:I

    .line 221
    .line 222
    iget-object v2, v0, Ll/cby0;->a:Ll/hwt0;

    .line 223
    .line 224
    invoke-virtual {v2, v3}, Ll/hwt0;->a(I)I

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-ne v2, v12, :cond_6

    .line 229
    .line 230
    return-object p3

    .line 231
    :cond_6
    iget-object v2, v0, Ll/cby0;->a:Ll/hwt0;

    .line 232
    .line 233
    iget v4, v11, Ll/kzy0;->c:I

    .line 234
    .line 235
    invoke-virtual {v2, v3, v4}, Ll/hwt0;->f(II)I

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    if-gez v4, :cond_7

    .line 240
    .line 241
    iget-object v2, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 242
    .line 243
    iget-wide v5, v10, Ll/tay0;->c:J

    .line 244
    .line 245
    iget-wide v7, v11, Ll/kzy0;->d:J

    .line 246
    .line 247
    invoke-virtual/range {v0 .. v8}, Ll/cby0;->y(Ll/d0u0;Ljava/lang/Object;IIJJ)Ll/tay0;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    return-object v0

    .line 252
    :cond_7
    move-object v9, v0

    .line 253
    iget-wide v0, v10, Ll/tay0;->c:J

    .line 254
    .line 255
    cmp-long v2, v0, v17

    .line 256
    .line 257
    if-nez v2, :cond_9

    .line 258
    .line 259
    iget-object v1, v9, Ll/cby0;->b:Ll/wyt0;

    .line 260
    .line 261
    iget-object v2, v9, Ll/cby0;->a:Ll/hwt0;

    .line 262
    .line 263
    iget v3, v2, Ll/hwt0;->c:I

    .line 264
    .line 265
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    invoke-static {v13, v14, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 271
    .line 272
    .line 273
    move-result-wide v6

    .line 274
    move-object/from16 v0, p1

    .line 275
    .line 276
    invoke-virtual/range {v0 .. v7}, Ll/d0u0;->m(Ll/wyt0;Ll/hwt0;IJJ)Landroid/util/Pair;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    move-object v2, v0

    .line 281
    if-nez v1, :cond_8

    .line 282
    .line 283
    return-object p3

    .line 284
    :cond_8
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 285
    .line 286
    check-cast v0, Ljava/lang/Long;

    .line 287
    .line 288
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 289
    .line 290
    .line 291
    move-result-wide v0

    .line 292
    goto :goto_2

    .line 293
    :cond_9
    move-object/from16 v2, p1

    .line 294
    .line 295
    :goto_2
    iget-object v3, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 296
    .line 297
    iget v4, v11, Ll/kzy0;->b:I

    .line 298
    .line 299
    invoke-virtual {v9, v2, v3, v4}, Ll/cby0;->v(Ll/d0u0;Ljava/lang/Object;I)J

    .line 300
    .line 301
    .line 302
    iget-object v2, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 303
    .line 304
    invoke-static {v13, v14, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 305
    .line 306
    .line 307
    move-result-wide v3

    .line 308
    iget-wide v5, v10, Ll/tay0;->c:J

    .line 309
    .line 310
    iget-wide v7, v11, Ll/kzy0;->d:J

    .line 311
    .line 312
    move-object/from16 v1, p1

    .line 313
    .line 314
    move-object v0, v9

    .line 315
    invoke-virtual/range {v0 .. v8}, Ll/cby0;->z(Ll/d0u0;Ljava/lang/Object;JJJ)Ll/tay0;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    return-object v0

    .line 320
    :cond_a
    iget v1, v11, Ll/kzy0;->e:I

    .line 321
    .line 322
    if-eq v1, v12, :cond_b

    .line 323
    .line 324
    iget-object v2, v0, Ll/cby0;->a:Ll/hwt0;

    .line 325
    .line 326
    invoke-virtual {v2, v1}, Ll/hwt0;->m(I)Z

    .line 327
    .line 328
    .line 329
    :cond_b
    iget-object v1, v0, Ll/cby0;->a:Ll/hwt0;

    .line 330
    .line 331
    iget v2, v11, Ll/kzy0;->e:I

    .line 332
    .line 333
    invoke-virtual {v1, v2}, Ll/hwt0;->e(I)I

    .line 334
    .line 335
    .line 336
    move-result v4

    .line 337
    invoke-virtual {v1, v2}, Ll/hwt0;->n(I)Z

    .line 338
    .line 339
    .line 340
    iget-object v1, v0, Ll/cby0;->a:Ll/hwt0;

    .line 341
    .line 342
    iget v2, v11, Ll/kzy0;->e:I

    .line 343
    .line 344
    invoke-virtual {v1, v2}, Ll/hwt0;->a(I)I

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    iget-object v2, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 349
    .line 350
    if-eq v4, v1, :cond_c

    .line 351
    .line 352
    iget v3, v11, Ll/kzy0;->e:I

    .line 353
    .line 354
    iget-wide v5, v10, Ll/tay0;->e:J

    .line 355
    .line 356
    iget-wide v7, v11, Ll/kzy0;->d:J

    .line 357
    .line 358
    move-object/from16 v1, p1

    .line 359
    .line 360
    invoke-virtual/range {v0 .. v8}, Ll/cby0;->y(Ll/d0u0;Ljava/lang/Object;IIJJ)Ll/tay0;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    return-object v0

    .line 365
    :cond_c
    move-object/from16 v1, p1

    .line 366
    .line 367
    iget v3, v11, Ll/kzy0;->e:I

    .line 368
    .line 369
    invoke-virtual {v0, v1, v2, v3}, Ll/cby0;->v(Ll/d0u0;Ljava/lang/Object;I)J

    .line 370
    .line 371
    .line 372
    iget-object v2, v11, Ll/kzy0;->a:Ljava/lang/Object;

    .line 373
    .line 374
    iget-wide v5, v10, Ll/tay0;->e:J

    .line 375
    .line 376
    iget-wide v7, v11, Ll/kzy0;->d:J

    .line 377
    .line 378
    const-wide/16 v3, 0x0

    .line 379
    .line 380
    invoke-virtual/range {v0 .. v8}, Ll/cby0;->z(Ll/d0u0;Ljava/lang/Object;JJJ)Ll/tay0;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    return-object v0
.end method

.method public final x(Ll/d0u0;Ll/kzy0;JJ)Ll/tay0;
    .locals 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cby0;->a:Ll/hwt0;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ll/kzy0;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v3, p2, Ll/kzy0;->a:Ljava/lang/Object;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v4, p2, Ll/kzy0;->b:I

    .line 17
    .line 18
    iget v5, p2, Ll/kzy0;->c:I

    .line 19
    .line 20
    iget-wide v8, p2, Ll/kzy0;->d:J

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    move-object v2, p1

    .line 24
    move-wide v6, p3

    .line 25
    invoke-virtual/range {v1 .. v9}, Ll/cby0;->y(Ll/d0u0;Ljava/lang/Object;IIJJ)Ll/tay0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    iget-wide v8, p2, Ll/kzy0;->d:J

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    move-object v2, p1

    .line 34
    move-wide v6, p3

    .line 35
    move-wide v4, p5

    .line 36
    invoke-virtual/range {v1 .. v9}, Ll/cby0;->z(Ll/d0u0;Ljava/lang/Object;JJJ)Ll/tay0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final y(Ll/d0u0;Ljava/lang/Object;IIJJ)Ll/tay0;
    .locals 14

    .line 1
    new-instance v0, Ll/kzy0;

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    move-wide/from16 v4, p7

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Ll/kzy0;-><init>(Ljava/lang/Object;IIJ)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Ll/kzy0;->a:Ljava/lang/Object;

    .line 15
    .line 16
    iget v2, v0, Ll/kzy0;->b:I

    .line 17
    .line 18
    iget v3, v0, Ll/kzy0;->c:I

    .line 19
    .line 20
    iget-object v4, p0, Ll/cby0;->a:Ll/hwt0;

    .line 21
    .line 22
    invoke-virtual {p1, v1, v4}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, v2, v3}, Ll/hwt0;->h(II)J

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    iget-object p1, p0, Ll/cby0;->a:Ll/hwt0;

    .line 31
    .line 32
    move/from16 v2, p3

    .line 33
    .line 34
    invoke-virtual {p1, v2}, Ll/hwt0;->e(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    move/from16 v3, p4

    .line 39
    .line 40
    if-ne v3, p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ll/cby0;->a:Ll/hwt0;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/hwt0;->j()J

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Ll/cby0;->a:Ll/hwt0;

    .line 48
    .line 49
    iget p1, v0, Ll/kzy0;->b:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/hwt0;->n(I)Z

    .line 52
    .line 53
    .line 54
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    cmp-long p0, v8, p0

    .line 60
    .line 61
    const-wide/16 v1, 0x0

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    cmp-long p0, v8, v1

    .line 66
    .line 67
    if-gtz p0, :cond_1

    .line 68
    .line 69
    const-wide/16 p0, -0x1

    .line 70
    .line 71
    add-long/2addr p0, v8

    .line 72
    invoke-static {v1, v2, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    :cond_1
    move-wide v2, v1

    .line 77
    move-object v1, v0

    .line 78
    new-instance v0, Ll/tay0;

    .line 79
    .line 80
    const/4 v12, 0x0

    .line 81
    const/4 v13, 0x0

    .line 82
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    const/4 v10, 0x0

    .line 88
    const/4 v11, 0x0

    .line 89
    move-wide/from16 v4, p5

    .line 90
    .line 91
    invoke-direct/range {v0 .. v13}, Ll/tay0;-><init>(Ll/kzy0;JJJJZZZZ)V

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method public final z(Ll/d0u0;Ljava/lang/Object;JJJ)Ll/tay0;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-wide/from16 v3, p3

    .line 8
    .line 9
    iget-object v5, v0, Ll/cby0;->a:Ll/hwt0;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v5}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 12
    .line 13
    .line 14
    iget-object v5, v0, Ll/cby0;->a:Ll/hwt0;

    .line 15
    .line 16
    invoke-virtual {v5, v3, v4}, Ll/hwt0;->c(J)I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    const/4 v6, -0x1

    .line 21
    if-eq v5, v6, :cond_0

    .line 22
    .line 23
    iget-object v7, v0, Ll/cby0;->a:Ll/hwt0;

    .line 24
    .line 25
    invoke-virtual {v7, v5}, Ll/hwt0;->m(I)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v7, v0, Ll/cby0;->a:Ll/hwt0;

    .line 29
    .line 30
    if-ne v5, v6, :cond_1

    .line 31
    .line 32
    invoke-virtual {v7}, Ll/hwt0;->b()I

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {v7, v5}, Ll/hwt0;->n(I)Z

    .line 37
    .line 38
    .line 39
    :goto_0
    new-instance v9, Ll/kzy0;

    .line 40
    .line 41
    move-wide/from16 v7, p7

    .line 42
    .line 43
    invoke-direct {v9, v2, v7, v8, v5}, Ll/kzy0;-><init>(Ljava/lang/Object;JI)V

    .line 44
    .line 45
    .line 46
    invoke-static {v9}, Ll/cby0;->c(Ll/kzy0;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v0, v1, v9}, Ll/cby0;->a(Ll/d0u0;Ll/kzy0;)Z

    .line 51
    .line 52
    .line 53
    move-result v20

    .line 54
    invoke-virtual {v0, v1, v9, v2}, Ll/cby0;->C(Ll/d0u0;Ll/kzy0;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v21

    .line 58
    if-eq v5, v6, :cond_2

    .line 59
    .line 60
    iget-object v1, v0, Ll/cby0;->a:Ll/hwt0;

    .line 61
    .line 62
    invoke-virtual {v1, v5}, Ll/hwt0;->n(I)Z

    .line 63
    .line 64
    .line 65
    :cond_2
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    const-wide/16 v10, 0x0

    .line 71
    .line 72
    if-eq v5, v6, :cond_3

    .line 73
    .line 74
    iget-object v1, v0, Ll/cby0;->a:Ll/hwt0;

    .line 75
    .line 76
    invoke-virtual {v1, v5}, Ll/hwt0;->i(I)J

    .line 77
    .line 78
    .line 79
    move-wide v5, v10

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    move-wide v5, v7

    .line 82
    :goto_1
    cmp-long v1, v5, v7

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    move-wide v14, v10

    .line 87
    move-wide/from16 v16, v14

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    iget-object v0, v0, Ll/cby0;->a:Ll/hwt0;

    .line 91
    .line 92
    iget-wide v0, v0, Ll/hwt0;->d:J

    .line 93
    .line 94
    move-wide/from16 v16, v0

    .line 95
    .line 96
    move-wide v14, v5

    .line 97
    :goto_2
    cmp-long v0, v16, v7

    .line 98
    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    cmp-long v0, v3, v16

    .line 102
    .line 103
    if-ltz v0, :cond_5

    .line 104
    .line 105
    const-wide/16 v0, -0x1

    .line 106
    .line 107
    add-long v0, v16, v0

    .line 108
    .line 109
    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 110
    .line 111
    .line 112
    move-result-wide v0

    .line 113
    move-wide v10, v0

    .line 114
    goto :goto_3

    .line 115
    :cond_5
    move-wide v10, v3

    .line 116
    :goto_3
    new-instance v8, Ll/tay0;

    .line 117
    .line 118
    const/16 v18, 0x0

    .line 119
    .line 120
    move-wide/from16 v12, p5

    .line 121
    .line 122
    move/from16 v19, v2

    .line 123
    .line 124
    invoke-direct/range {v8 .. v21}, Ll/tay0;-><init>(Ll/kzy0;JJJJZZZZ)V

    .line 125
    .line 126
    .line 127
    return-object v8
.end method
