.class public final Ll/e2z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sgr0;


# instance fields
.field public A:Z

.field public B:Z

.field public C:Ll/juy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final a:Ll/y1z0;

.field public final b:Ll/a2z0;

.field public final c:Ll/l2z0;

.field public final d:Ll/huy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Ll/zty0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Ll/d2z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:I

.field public i:[J

.field public j:[J

.field public k:[I

.field public l:[I

.field public m:[J

.field public n:[Ll/ggr0;

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:J

.field public t:J

.field public u:J

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public z:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/c6z0;Ll/huy0;Ll/zty0;)V
    .locals 0
    .param p2    # Ll/huy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/zty0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/e2z0;->d:Ll/huy0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/e2z0;->e:Ll/zty0;

    .line 7
    .line 8
    new-instance p2, Ll/y1z0;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Ll/y1z0;-><init>(Ll/c6z0;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 14
    .line 15
    new-instance p1, Ll/a2z0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/a2z0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/e2z0;->b:Ll/a2z0;

    .line 21
    .line 22
    const/16 p1, 0x3e8

    .line 23
    .line 24
    iput p1, p0, Ll/e2z0;->h:I

    .line 25
    .line 26
    new-array p2, p1, [J

    .line 27
    .line 28
    iput-object p2, p0, Ll/e2z0;->i:[J

    .line 29
    .line 30
    new-array p2, p1, [J

    .line 31
    .line 32
    iput-object p2, p0, Ll/e2z0;->j:[J

    .line 33
    .line 34
    new-array p2, p1, [J

    .line 35
    .line 36
    iput-object p2, p0, Ll/e2z0;->m:[J

    .line 37
    .line 38
    new-array p2, p1, [I

    .line 39
    .line 40
    iput-object p2, p0, Ll/e2z0;->l:[I

    .line 41
    .line 42
    new-array p2, p1, [I

    .line 43
    .line 44
    iput-object p2, p0, Ll/e2z0;->k:[I

    .line 45
    .line 46
    new-array p1, p1, [Ll/ggr0;

    .line 47
    .line 48
    iput-object p1, p0, Ll/e2z0;->n:[Ll/ggr0;

    .line 49
    .line 50
    new-instance p1, Ll/l2z0;

    .line 51
    .line 52
    sget-object p2, Ll/z1z0;->a:Ll/z1z0;

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ll/l2z0;-><init>(Ll/hkv0;)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 58
    .line 59
    const-wide/high16 p1, -0x8000000000000000L

    .line 60
    .line 61
    iput-wide p1, p0, Ll/e2z0;->s:J

    .line 62
    .line 63
    iput-wide p1, p0, Ll/e2z0;->t:J

    .line 64
    .line 65
    iput-wide p1, p0, Ll/e2z0;->u:J

    .line 66
    .line 67
    const/4 p1, 0x1

    .line 68
    iput-boolean p1, p0, Ll/e2z0;->x:Z

    .line 69
    .line 70
    iput-boolean p1, p0, Ll/e2z0;->w:Z

    .line 71
    .line 72
    iput-boolean p1, p0, Ll/e2z0;->A:Z

    .line 73
    .line 74
    return-void
.end method

.method public static synthetic D(Ll/c2z0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c2z0;->b:Ll/guy0;

    .line 2
    .line 3
    sget p0, Ll/fuy0;->a:I

    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final declared-synchronized A()Ll/sqr0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/e2z0;->x:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    :try_start_1
    iget-object v0, p0, Ll/e2z0;->z:Ll/sqr0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-object v0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 15
    throw v0
.end method

.method public final B(JZZ)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, p2, v0, p4}, Ll/e2z0;->k(JZZ)J

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    invoke-virtual {p3, p0, p1}, Ll/y1z0;->c(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final C()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/e2z0;->l()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Ll/y1z0;->c(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final E()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e2z0;->C:Ll/juy0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/juy0;->a()Lcom/google/android/gms/internal/ads/zzrq;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method

.method public final F()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/e2z0;->C()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/e2z0;->p()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final G()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/e2z0;->H(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2z0;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final H(Z)V
    .locals 4
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/y1z0;->f()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/e2z0;->o:I

    .line 8
    .line 9
    iput v0, p0, Ll/e2z0;->p:I

    .line 10
    .line 11
    iput v0, p0, Ll/e2z0;->q:I

    .line 12
    .line 13
    iput v0, p0, Ll/e2z0;->r:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Ll/e2z0;->w:Z

    .line 17
    .line 18
    const-wide/high16 v2, -0x8000000000000000L

    .line 19
    .line 20
    iput-wide v2, p0, Ll/e2z0;->s:J

    .line 21
    .line 22
    iput-wide v2, p0, Ll/e2z0;->t:J

    .line 23
    .line 24
    iput-wide v2, p0, Ll/e2z0;->u:J

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/e2z0;->v:Z

    .line 27
    .line 28
    iget-object v0, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/l2z0;->d()V

    .line 31
    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Ll/e2z0;->y:Ll/sqr0;

    .line 37
    .line 38
    iput-object p1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 39
    .line 40
    iput-boolean v1, p0, Ll/e2z0;->x:Z

    .line 41
    .line 42
    iput-boolean v1, p0, Ll/e2z0;->A:Z

    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final I(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/e2z0;->s:J

    .line 2
    .line 3
    return-void
.end method

.method public final J(Ll/d2z0;)V
    .locals 0
    .param p1    # Ll/d2z0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/e2z0;->f:Ll/d2z0;

    .line 2
    .line 3
    return-void
.end method

.method public final declared-synchronized K(I)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget v1, p0, Ll/e2z0;->r:I

    .line 6
    .line 7
    add-int/2addr v1, p1

    .line 8
    iget v2, p0, Ll/e2z0;->o:I

    .line 9
    .line 10
    if-gt v1, v2, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Ll/e2z0;->r:I

    .line 20
    .line 21
    add-int/2addr v0, p1

    .line 22
    iput v0, p0, Ll/e2z0;->r:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public final declared-synchronized L()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/e2z0;->v:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public final declared-synchronized M(Z)Z
    .locals 3
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/e2z0;->r()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    if-nez p1, :cond_2

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/e2z0;->v:Z

    .line 12
    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    iget-object p1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ll/e2z0;->g:Ll/sqr0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    if-eq p1, v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    monitor-exit p0

    .line 26
    return v0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v1, v0

    .line 30
    :cond_2
    :goto_0
    monitor-exit p0

    .line 31
    return v1

    .line 32
    :cond_3
    :try_start_1
    iget-object p1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 33
    .line 34
    iget v0, p0, Ll/e2z0;->p:I

    .line 35
    .line 36
    iget v2, p0, Ll/e2z0;->r:I

    .line 37
    .line 38
    add-int/2addr v0, v2

    .line 39
    invoke-virtual {p1, v0}, Ll/l2z0;->a(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/c2z0;

    .line 44
    .line 45
    iget-object p1, p1, Ll/c2z0;->a:Ll/sqr0;

    .line 46
    .line 47
    iget-object v0, p0, Ll/e2z0;->g:Ll/sqr0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    .line 49
    if-eq p1, v0, :cond_4

    .line 50
    .line 51
    monitor-exit p0

    .line 52
    return v1

    .line 53
    :cond_4
    :try_start_2
    iget p1, p0, Ll/e2z0;->r:I

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/e2z0;->i(I)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Ll/e2z0;->s(I)Z

    .line 60
    .line 61
    .line 62
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    monitor-exit p0

    .line 64
    return p1

    .line 65
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 66
    throw p1
.end method

.method public final declared-synchronized N(I)Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/e2z0;->q()V

    .line 3
    .line 4
    .line 5
    iget v0, p0, Ll/e2z0;->p:I

    .line 6
    .line 7
    if-lt p1, v0, :cond_1

    .line 8
    .line 9
    iget v1, p0, Ll/e2z0;->o:I

    .line 10
    .line 11
    add-int/2addr v1, v0

    .line 12
    if-le p1, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-wide/high16 v1, -0x8000000000000000L

    .line 16
    .line 17
    iput-wide v1, p0, Ll/e2z0;->s:J

    .line 18
    .line 19
    sub-int/2addr p1, v0

    .line 20
    iput p1, p0, Ll/e2z0;->r:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    monitor-exit p0

    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw p1
.end method

.method public final a(Ll/bgw0;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/y1z0;->h(Ll/bgw0;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b(Ll/nyy0;IZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/y1z0;->a(Ll/nyy0;IZ)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final c(JIIILl/ggr0;)V
    .locals 8
    .param p6    # Ll/ggr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/e2z0;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    and-int/lit8 v0, p3, 0x1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/e2z0;->w:Z

    .line 12
    .line 13
    :cond_1
    iget-boolean v0, p0, Ll/e2z0;->A:Z

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-wide v0, p0, Ll/e2z0;->s:J

    .line 18
    .line 19
    cmp-long v0, p1, v0

    .line 20
    .line 21
    if-ltz v0, :cond_4

    .line 22
    .line 23
    and-int/lit8 v0, p3, 0x1

    .line 24
    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    iget-boolean v0, p0, Ll/e2z0;->B:Z

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "SampleQueue"

    .line 38
    .line 39
    const-string v2, "Overriding unexpected non-sync sample for format: "

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    iput-boolean v0, p0, Ll/e2z0;->B:Z

    .line 50
    .line 51
    :cond_2
    or-int/lit8 p3, p3, 0x1

    .line 52
    .line 53
    :cond_3
    move v3, p3

    .line 54
    goto :goto_1

    .line 55
    :cond_4
    :goto_0
    return-void

    .line 56
    :goto_1
    iget-object p3, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 57
    .line 58
    int-to-long v0, p4

    .line 59
    invoke-virtual {p3}, Ll/y1z0;->b()J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    sub-long/2addr v4, v0

    .line 64
    int-to-long v0, p5

    .line 65
    sub-long/2addr v4, v0

    .line 66
    move-object v0, p0

    .line 67
    move-wide v1, p1

    .line 68
    move v6, p4

    .line 69
    move-object v7, p6

    .line 70
    invoke-virtual/range {v0 .. v7}, Ll/e2z0;->n(JIJILl/ggr0;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final d(Ll/sqr0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/e2z0;->y:Ll/sqr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2z0;->t(Ll/sqr0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/e2z0;->f:Ll/d2z0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/d2z0;->n(Ll/sqr0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic e(Ll/nyy0;IZ)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/fgr0;->a(Ll/sgr0;Ll/nyy0;IZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic f(Ll/bgw0;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final declared-synchronized g(JZ)Z
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/e2z0;->q()V

    .line 3
    .line 4
    .line 5
    iget v0, p0, Ll/e2z0;->r:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/e2z0;->i(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Ll/e2z0;->r()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v7, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/e2z0;->m:[J

    .line 19
    .line 20
    aget-wide v3, v1, v2

    .line 21
    .line 22
    cmp-long v1, p1, v3

    .line 23
    .line 24
    if-ltz v1, :cond_0

    .line 25
    .line 26
    iget-wide v3, p0, Ll/e2z0;->u:J

    .line 27
    .line 28
    cmp-long v1, p1, v3

    .line 29
    .line 30
    const/4 v8, 0x1

    .line 31
    if-lez v1, :cond_1

    .line 32
    .line 33
    if-eqz p3, :cond_0

    .line 34
    .line 35
    move p3, v8

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v1, p0

    .line 38
    goto :goto_4

    .line 39
    :cond_1
    :goto_0
    iget-boolean v1, p0, Ll/e2z0;->A:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 40
    .line 41
    iget v3, p0, Ll/e2z0;->o:I

    .line 42
    .line 43
    const/4 v9, -0x1

    .line 44
    if-eqz v1, :cond_6

    .line 45
    .line 46
    sub-int/2addr v3, v0

    .line 47
    move v0, v7

    .line 48
    :goto_1
    if-ge v0, v3, :cond_4

    .line 49
    .line 50
    :try_start_1
    iget-object v1, p0, Ll/e2z0;->m:[J

    .line 51
    .line 52
    aget-wide v4, v1, v2

    .line 53
    .line 54
    cmp-long v1, v4, p1

    .line 55
    .line 56
    if-gez v1, :cond_3

    .line 57
    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    iget v1, p0, Ll/e2z0;->h:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    .line 62
    if-ne v2, v1, :cond_2

    .line 63
    .line 64
    move v2, v7

    .line 65
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    move-object p1, v0

    .line 70
    move-object v1, p0

    .line 71
    goto :goto_5

    .line 72
    :cond_3
    move-object v1, p0

    .line 73
    move-wide v4, p1

    .line 74
    move v3, v0

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    move-object v1, p0

    .line 77
    move-wide v4, p1

    .line 78
    if-eqz p3, :cond_5

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_5
    move v3, v9

    .line 82
    goto :goto_2

    .line 83
    :cond_6
    sub-int/2addr v3, v0

    .line 84
    const/4 v6, 0x1

    .line 85
    move-object v1, p0

    .line 86
    move-wide v4, p1

    .line 87
    :try_start_2
    invoke-virtual/range {v1 .. v6}, Ll/e2z0;->h(IIJZ)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    :goto_2
    if-ne v3, v9, :cond_7

    .line 92
    .line 93
    goto :goto_4

    .line 94
    :cond_7
    iput-wide v4, v1, Ll/e2z0;->s:J

    .line 95
    .line 96
    iget p0, v1, Ll/e2z0;->r:I

    .line 97
    .line 98
    add-int/2addr p0, v3

    .line 99
    iput p0, v1, Ll/e2z0;->r:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 100
    .line 101
    monitor-exit v1

    .line 102
    return v8

    .line 103
    :catchall_1
    move-exception v0

    .line 104
    :goto_3
    move-object p1, v0

    .line 105
    goto :goto_5

    .line 106
    :catchall_2
    move-exception v0

    .line 107
    move-object v1, p0

    .line 108
    goto :goto_3

    .line 109
    :goto_4
    monitor-exit v1

    .line 110
    return v7

    .line 111
    :goto_5
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 112
    throw p1
.end method

.method public final h(IIJZ)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    move v2, v0

    .line 4
    :goto_0
    if-ge v2, p2, :cond_4

    .line 5
    .line 6
    iget-object v3, p0, Ll/e2z0;->m:[J

    .line 7
    .line 8
    aget-wide v4, v3, p1

    .line 9
    .line 10
    cmp-long v3, v4, p3

    .line 11
    .line 12
    if-gtz v3, :cond_4

    .line 13
    .line 14
    if-eqz p5, :cond_0

    .line 15
    .line 16
    iget-object v4, p0, Ll/e2z0;->l:[I

    .line 17
    .line 18
    aget v4, v4, p1

    .line 19
    .line 20
    and-int/lit8 v4, v4, 0x1

    .line 21
    .line 22
    if-eqz v4, :cond_2

    .line 23
    .line 24
    :cond_0
    if-nez v3, :cond_1

    .line 25
    .line 26
    return v2

    .line 27
    :cond_1
    move v1, v2

    .line 28
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    iget v3, p0, Ll/e2z0;->h:I

    .line 31
    .line 32
    if-ne p1, v3, :cond_3

    .line 33
    .line 34
    move p1, v0

    .line 35
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_4
    return v1
.end method

.method public final i(I)I
    .locals 1

    .line 1
    iget v0, p0, Ll/e2z0;->q:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iget p0, p0, Ll/e2z0;->h:I

    .line 5
    .line 6
    if-ge v0, p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sub-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public final declared-synchronized j(Ll/l9y0;Ll/evx0;ZZLl/a2z0;)I
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p2, Ll/evx0;->e:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e2z0;->r()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x4

    .line 10
    const/4 v2, -0x3

    .line 11
    const/4 v3, -0x5

    .line 12
    if-nez v0, :cond_4

    .line 13
    .line 14
    if-nez p4, :cond_3

    .line 15
    .line 16
    iget-boolean p4, p0, Ll/e2z0;->v:Z

    .line 17
    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-object p2, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    if-nez p3, :cond_1

    .line 26
    .line 27
    iget-object p3, p0, Ll/e2z0;->g:Ll/sqr0;

    .line 28
    .line 29
    if-eq p2, p3, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto/16 :goto_3

    .line 34
    .line 35
    :cond_1
    :goto_0
    invoke-virtual {p0, p2, p1}, Ll/e2z0;->o(Ll/sqr0;Ll/l9y0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return v3

    .line 40
    :cond_2
    monitor-exit p0

    .line 41
    return v2

    .line 42
    :cond_3
    :goto_1
    const/4 p1, 0x4

    .line 43
    :try_start_1
    invoke-virtual {p2, p1}, Ll/fux0;->c(I)V

    .line 44
    .line 45
    .line 46
    const-wide/high16 p3, -0x8000000000000000L

    .line 47
    .line 48
    iput-wide p3, p2, Ll/evx0;->f:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    monitor-exit p0

    .line 51
    return v1

    .line 52
    :cond_4
    :try_start_2
    iget-object v0, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 53
    .line 54
    iget v4, p0, Ll/e2z0;->p:I

    .line 55
    .line 56
    iget v5, p0, Ll/e2z0;->r:I

    .line 57
    .line 58
    add-int/2addr v4, v5

    .line 59
    invoke-virtual {v0, v4}, Ll/l2z0;->a(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ll/c2z0;

    .line 64
    .line 65
    iget-object v0, v0, Ll/c2z0;->a:Ll/sqr0;

    .line 66
    .line 67
    if-nez p3, :cond_a

    .line 68
    .line 69
    iget-object p3, p0, Ll/e2z0;->g:Ll/sqr0;

    .line 70
    .line 71
    if-eq v0, p3, :cond_5

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_5
    iget p1, p0, Ll/e2z0;->r:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/e2z0;->i(I)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {p0, p1}, Ll/e2z0;->s(I)Z

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    if-nez p3, :cond_6

    .line 85
    .line 86
    const/4 p1, 0x1

    .line 87
    iput-boolean p1, p2, Ll/evx0;->e:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    .line 89
    monitor-exit p0

    .line 90
    return v2

    .line 91
    :cond_6
    :try_start_3
    iget-object p3, p0, Ll/e2z0;->l:[I

    .line 92
    .line 93
    aget p3, p3, p1

    .line 94
    .line 95
    invoke-virtual {p2, p3}, Ll/fux0;->c(I)V

    .line 96
    .line 97
    .line 98
    iget p3, p0, Ll/e2z0;->r:I

    .line 99
    .line 100
    iget v0, p0, Ll/e2z0;->o:I

    .line 101
    .line 102
    add-int/lit8 v0, v0, -0x1

    .line 103
    .line 104
    if-ne p3, v0, :cond_8

    .line 105
    .line 106
    if-nez p4, :cond_7

    .line 107
    .line 108
    iget-boolean p3, p0, Ll/e2z0;->v:Z

    .line 109
    .line 110
    if-eqz p3, :cond_8

    .line 111
    .line 112
    :cond_7
    const/high16 p3, 0x20000000

    .line 113
    .line 114
    invoke-virtual {p2, p3}, Ll/fux0;->a(I)V

    .line 115
    .line 116
    .line 117
    :cond_8
    iget-object p3, p0, Ll/e2z0;->m:[J

    .line 118
    .line 119
    aget-wide v2, p3, p1

    .line 120
    .line 121
    iput-wide v2, p2, Ll/evx0;->f:J

    .line 122
    .line 123
    iget-wide p3, p0, Ll/e2z0;->s:J

    .line 124
    .line 125
    cmp-long p3, v2, p3

    .line 126
    .line 127
    if-gez p3, :cond_9

    .line 128
    .line 129
    const/high16 p3, -0x80000000

    .line 130
    .line 131
    invoke-virtual {p2, p3}, Ll/fux0;->a(I)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p2, p0, Ll/e2z0;->k:[I

    .line 135
    .line 136
    aget p2, p2, p1

    .line 137
    .line 138
    iput p2, p5, Ll/a2z0;->a:I

    .line 139
    .line 140
    iget-object p2, p0, Ll/e2z0;->j:[J

    .line 141
    .line 142
    aget-wide p3, p2, p1

    .line 143
    .line 144
    iput-wide p3, p5, Ll/a2z0;->b:J

    .line 145
    .line 146
    iget-object p2, p0, Ll/e2z0;->n:[Ll/ggr0;

    .line 147
    .line 148
    aget-object p1, p2, p1

    .line 149
    .line 150
    iput-object p1, p5, Ll/a2z0;->c:Ll/ggr0;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 151
    .line 152
    monitor-exit p0

    .line 153
    return v1

    .line 154
    :cond_a
    :goto_2
    :try_start_4
    invoke-virtual {p0, v0, p1}, Ll/e2z0;->o(Ll/sqr0;Ll/l9y0;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 155
    .line 156
    .line 157
    monitor-exit p0

    .line 158
    return v3

    .line 159
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 160
    throw p1
.end method

.method public final declared-synchronized k(JZZ)J
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget p3, p0, Ll/e2z0;->o:I

    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/e2z0;->m:[J

    .line 7
    .line 8
    iget v2, p0, Ll/e2z0;->q:I

    .line 9
    .line 10
    aget-wide v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 11
    .line 12
    cmp-long v0, p1, v3

    .line 13
    .line 14
    if-gez v0, :cond_1

    .line 15
    .line 16
    :cond_0
    move-object v1, p0

    .line 17
    goto :goto_2

    .line 18
    :cond_1
    if-eqz p4, :cond_2

    .line 19
    .line 20
    :try_start_1
    iget p4, p0, Ll/e2z0;->r:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    if-eq p4, p3, :cond_2

    .line 23
    .line 24
    add-int/lit8 p3, p4, 0x1

    .line 25
    .line 26
    :cond_2
    move v3, p3

    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    move-object p1, v0

    .line 30
    move-object v1, p0

    .line 31
    goto :goto_3

    .line 32
    :goto_0
    const/4 v6, 0x0

    .line 33
    move-object v1, p0

    .line 34
    move-wide v4, p1

    .line 35
    :try_start_2
    invoke-virtual/range {v1 .. v6}, Ll/e2z0;->h(IIJZ)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 p1, -0x1

    .line 40
    if-eq p0, p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {v1, p0}, Ll/e2z0;->m(I)J

    .line 43
    .line 44
    .line 45
    move-result-wide p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 46
    monitor-exit v1

    .line 47
    return-wide p0

    .line 48
    :catchall_1
    move-exception v0

    .line 49
    :goto_1
    move-object p1, v0

    .line 50
    goto :goto_3

    .line 51
    :catchall_2
    move-exception v0

    .line 52
    move-object v1, p0

    .line 53
    goto :goto_1

    .line 54
    :cond_3
    :goto_2
    monitor-exit v1

    .line 55
    const-wide/16 p0, -0x1

    .line 56
    .line 57
    return-wide p0

    .line 58
    :goto_3
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    throw p1
.end method

.method public final declared-synchronized l()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/e2z0;->o:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    :try_start_1
    invoke-virtual {p0, v0}, Ll/e2z0;->m(I)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    monitor-exit p0

    .line 15
    return-wide v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 18
    throw v0
.end method

.method public final m(I)J
    .locals 11
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/e2z0;->t:J

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    const-wide/high16 v3, -0x8000000000000000L

    .line 5
    .line 6
    const/4 v5, -0x1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    add-int/lit8 v6, p1, -0x1

    .line 11
    .line 12
    invoke-virtual {p0, v6}, Ll/e2z0;->i(I)I

    .line 13
    .line 14
    .line 15
    move-result v6

    .line 16
    move v7, v2

    .line 17
    :goto_0
    if-ge v7, p1, :cond_3

    .line 18
    .line 19
    iget-object v8, p0, Ll/e2z0;->m:[J

    .line 20
    .line 21
    aget-wide v9, v8, v6

    .line 22
    .line 23
    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->max(JJ)J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    iget-object v8, p0, Ll/e2z0;->l:[I

    .line 28
    .line 29
    aget v8, v8, v6

    .line 30
    .line 31
    and-int/lit8 v8, v8, 0x1

    .line 32
    .line 33
    if-eqz v8, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    add-int/lit8 v6, v6, -0x1

    .line 37
    .line 38
    if-ne v6, v5, :cond_2

    .line 39
    .line 40
    iget v6, p0, Ll/e2z0;->h:I

    .line 41
    .line 42
    add-int/2addr v6, v5

    .line 43
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    :goto_1
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iput-wide v0, p0, Ll/e2z0;->t:J

    .line 51
    .line 52
    iget v0, p0, Ll/e2z0;->o:I

    .line 53
    .line 54
    sub-int/2addr v0, p1

    .line 55
    iput v0, p0, Ll/e2z0;->o:I

    .line 56
    .line 57
    iget v0, p0, Ll/e2z0;->p:I

    .line 58
    .line 59
    add-int/2addr v0, p1

    .line 60
    iput v0, p0, Ll/e2z0;->p:I

    .line 61
    .line 62
    iget v1, p0, Ll/e2z0;->q:I

    .line 63
    .line 64
    add-int/2addr v1, p1

    .line 65
    iput v1, p0, Ll/e2z0;->q:I

    .line 66
    .line 67
    iget v3, p0, Ll/e2z0;->h:I

    .line 68
    .line 69
    if-lt v1, v3, :cond_4

    .line 70
    .line 71
    sub-int/2addr v1, v3

    .line 72
    iput v1, p0, Ll/e2z0;->q:I

    .line 73
    .line 74
    :cond_4
    iget v1, p0, Ll/e2z0;->r:I

    .line 75
    .line 76
    sub-int/2addr v1, p1

    .line 77
    iput v1, p0, Ll/e2z0;->r:I

    .line 78
    .line 79
    if-gez v1, :cond_5

    .line 80
    .line 81
    iput v2, p0, Ll/e2z0;->r:I

    .line 82
    .line 83
    :cond_5
    iget-object p1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/l2z0;->e(I)V

    .line 86
    .line 87
    .line 88
    iget p1, p0, Ll/e2z0;->o:I

    .line 89
    .line 90
    if-nez p1, :cond_7

    .line 91
    .line 92
    iget p1, p0, Ll/e2z0;->q:I

    .line 93
    .line 94
    if-nez p1, :cond_6

    .line 95
    .line 96
    iget p1, p0, Ll/e2z0;->h:I

    .line 97
    .line 98
    :cond_6
    add-int/2addr p1, v5

    .line 99
    iget-object v0, p0, Ll/e2z0;->j:[J

    .line 100
    .line 101
    aget-wide v1, v0, p1

    .line 102
    .line 103
    iget-object p0, p0, Ll/e2z0;->k:[I

    .line 104
    .line 105
    aget p0, p0, p1

    .line 106
    .line 107
    int-to-long p0, p0

    .line 108
    add-long/2addr v1, p0

    .line 109
    return-wide v1

    .line 110
    :cond_7
    iget-object p1, p0, Ll/e2z0;->j:[J

    .line 111
    .line 112
    iget p0, p0, Ll/e2z0;->q:I

    .line 113
    .line 114
    aget-wide p0, p1, p0

    .line 115
    .line 116
    return-wide p0
.end method

.method public final declared-synchronized n(JIJILl/ggr0;)V
    .locals 8
    .param p7    # Ll/ggr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/e2z0;->o:I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/e2z0;->i(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v3, p0, Ll/e2z0;->j:[J

    .line 15
    .line 16
    aget-wide v4, v3, v0

    .line 17
    .line 18
    iget-object v3, p0, Ll/e2z0;->k:[I

    .line 19
    .line 20
    aget v0, v3, v0

    .line 21
    .line 22
    int-to-long v6, v0

    .line 23
    add-long/2addr v4, v6

    .line 24
    cmp-long v0, v4, p4

    .line 25
    .line 26
    if-gtz v0, :cond_0

    .line 27
    .line 28
    move v0, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v0, v2

    .line 31
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto/16 :goto_3

    .line 37
    .line 38
    :cond_1
    :goto_1
    const/high16 v0, 0x20000000

    .line 39
    .line 40
    and-int/2addr v0, p3

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    move v0, v1

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move v0, v2

    .line 46
    :goto_2
    iput-boolean v0, p0, Ll/e2z0;->v:Z

    .line 47
    .line 48
    iget-wide v3, p0, Ll/e2z0;->u:J

    .line 49
    .line 50
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    iput-wide v3, p0, Ll/e2z0;->u:J

    .line 55
    .line 56
    iget v0, p0, Ll/e2z0;->o:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/e2z0;->i(I)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v3, p0, Ll/e2z0;->m:[J

    .line 63
    .line 64
    aput-wide p1, v3, v0

    .line 65
    .line 66
    iget-object p1, p0, Ll/e2z0;->j:[J

    .line 67
    .line 68
    aput-wide p4, p1, v0

    .line 69
    .line 70
    iget-object p1, p0, Ll/e2z0;->k:[I

    .line 71
    .line 72
    aput p6, p1, v0

    .line 73
    .line 74
    iget-object p1, p0, Ll/e2z0;->l:[I

    .line 75
    .line 76
    aput p3, p1, v0

    .line 77
    .line 78
    iget-object p1, p0, Ll/e2z0;->n:[Ll/ggr0;

    .line 79
    .line 80
    aput-object p7, p1, v0

    .line 81
    .line 82
    iget-object p1, p0, Ll/e2z0;->i:[J

    .line 83
    .line 84
    const-wide/16 p2, 0x0

    .line 85
    .line 86
    aput-wide p2, p1, v0

    .line 87
    .line 88
    iget-object p1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/l2z0;->f()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    iget-object p1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/l2z0;->b()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Ll/c2z0;

    .line 103
    .line 104
    iget-object p1, p1, Ll/c2z0;->a:Ll/sqr0;

    .line 105
    .line 106
    iget-object p2, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Ll/sqr0;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_4

    .line 113
    .line 114
    :cond_3
    iget-object p1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 115
    .line 116
    const/4 p2, 0x0

    .line 117
    if-eqz p1, :cond_6

    .line 118
    .line 119
    iget-object p3, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 120
    .line 121
    sget-object p4, Ll/guy0;->a:Ll/guy0;

    .line 122
    .line 123
    iget p5, p0, Ll/e2z0;->p:I

    .line 124
    .line 125
    iget p6, p0, Ll/e2z0;->o:I

    .line 126
    .line 127
    add-int/2addr p5, p6

    .line 128
    new-instance p6, Ll/c2z0;

    .line 129
    .line 130
    invoke-direct {p6, p1, p4, p2}, Ll/c2z0;-><init>(Ll/sqr0;Ll/guy0;Ll/b2z0;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p3, p5, p6}, Ll/l2z0;->c(ILjava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    :cond_4
    iget p1, p0, Ll/e2z0;->o:I

    .line 137
    .line 138
    add-int/2addr p1, v1

    .line 139
    iput p1, p0, Ll/e2z0;->o:I

    .line 140
    .line 141
    iget p2, p0, Ll/e2z0;->h:I

    .line 142
    .line 143
    if-ne p1, p2, :cond_5

    .line 144
    .line 145
    add-int/lit16 p1, p2, 0x3e8

    .line 146
    .line 147
    new-array p3, p1, [J

    .line 148
    .line 149
    new-array p4, p1, [J

    .line 150
    .line 151
    new-array p5, p1, [J

    .line 152
    .line 153
    new-array p6, p1, [I

    .line 154
    .line 155
    new-array p7, p1, [I

    .line 156
    .line 157
    new-array v0, p1, [Ll/ggr0;

    .line 158
    .line 159
    iget v1, p0, Ll/e2z0;->q:I

    .line 160
    .line 161
    sub-int/2addr p2, v1

    .line 162
    iget-object v3, p0, Ll/e2z0;->j:[J

    .line 163
    .line 164
    invoke-static {v3, v1, p4, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    .line 166
    .line 167
    iget-object v1, p0, Ll/e2z0;->m:[J

    .line 168
    .line 169
    iget v3, p0, Ll/e2z0;->q:I

    .line 170
    .line 171
    invoke-static {v1, v3, p5, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Ll/e2z0;->l:[I

    .line 175
    .line 176
    iget v3, p0, Ll/e2z0;->q:I

    .line 177
    .line 178
    invoke-static {v1, v3, p6, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Ll/e2z0;->k:[I

    .line 182
    .line 183
    iget v3, p0, Ll/e2z0;->q:I

    .line 184
    .line 185
    invoke-static {v1, v3, p7, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Ll/e2z0;->n:[Ll/ggr0;

    .line 189
    .line 190
    iget v3, p0, Ll/e2z0;->q:I

    .line 191
    .line 192
    invoke-static {v1, v3, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Ll/e2z0;->i:[J

    .line 196
    .line 197
    iget v3, p0, Ll/e2z0;->q:I

    .line 198
    .line 199
    invoke-static {v1, v3, p3, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    .line 201
    .line 202
    iget v1, p0, Ll/e2z0;->q:I

    .line 203
    .line 204
    iget-object v3, p0, Ll/e2z0;->j:[J

    .line 205
    .line 206
    invoke-static {v3, v2, p4, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 207
    .line 208
    .line 209
    iget-object v3, p0, Ll/e2z0;->m:[J

    .line 210
    .line 211
    invoke-static {v3, v2, p5, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 212
    .line 213
    .line 214
    iget-object v3, p0, Ll/e2z0;->l:[I

    .line 215
    .line 216
    invoke-static {v3, v2, p6, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 217
    .line 218
    .line 219
    iget-object v3, p0, Ll/e2z0;->k:[I

    .line 220
    .line 221
    invoke-static {v3, v2, p7, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    .line 223
    .line 224
    iget-object v3, p0, Ll/e2z0;->n:[Ll/ggr0;

    .line 225
    .line 226
    invoke-static {v3, v2, v0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    .line 228
    .line 229
    iget-object v3, p0, Ll/e2z0;->i:[J

    .line 230
    .line 231
    invoke-static {v3, v2, p3, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    .line 233
    .line 234
    iput-object p4, p0, Ll/e2z0;->j:[J

    .line 235
    .line 236
    iput-object p5, p0, Ll/e2z0;->m:[J

    .line 237
    .line 238
    iput-object p6, p0, Ll/e2z0;->l:[I

    .line 239
    .line 240
    iput-object p7, p0, Ll/e2z0;->k:[I

    .line 241
    .line 242
    iput-object v0, p0, Ll/e2z0;->n:[Ll/ggr0;

    .line 243
    .line 244
    iput-object p3, p0, Ll/e2z0;->i:[J

    .line 245
    .line 246
    iput v2, p0, Ll/e2z0;->q:I

    .line 247
    .line 248
    iput p1, p0, Ll/e2z0;->h:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    .line 250
    monitor-exit p0

    .line 251
    return-void

    .line 252
    :cond_5
    monitor-exit p0

    .line 253
    return-void

    .line 254
    :cond_6
    :try_start_1
    throw p2

    .line 255
    :goto_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 256
    throw p1
.end method

.method public final o(Ll/sqr0;Ll/l9y0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/e2z0;->g:Ll/sqr0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move-object v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v2, v0, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 9
    .line 10
    :goto_0
    iput-object p1, p0, Ll/e2z0;->g:Ll/sqr0;

    .line 11
    .line 12
    iget-object v3, p1, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 13
    .line 14
    iget-object v4, p0, Ll/e2z0;->d:Ll/huy0;

    .line 15
    .line 16
    invoke-interface {v4, p1}, Ll/huy0;->a(Ll/sqr0;)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    invoke-virtual {p1, v4}, Ll/sqr0;->c(I)Ll/sqr0;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    iput-object v4, p2, Ll/l9y0;->a:Ll/sqr0;

    .line 25
    .line 26
    iget-object v4, p0, Ll/e2z0;->C:Ll/juy0;

    .line 27
    .line 28
    iput-object v4, p2, Ll/l9y0;->b:Ll/juy0;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-static {v2, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    return-void

    .line 40
    :cond_2
    :goto_1
    iget-object p1, p1, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 41
    .line 42
    if-nez p1, :cond_3

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_3
    new-instance v1, Ll/juy0;

    .line 46
    .line 47
    new-instance p1, Lcom/google/android/gms/internal/ads/zzrq;

    .line 48
    .line 49
    new-instance v0, Lcom/google/android/gms/internal/ads/zzsb;

    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/ads/zzsb;-><init>(I)V

    .line 53
    .line 54
    .line 55
    const/16 v2, 0x1771

    .line 56
    .line 57
    invoke-direct {p1, v0, v2}, Lcom/google/android/gms/internal/ads/zzrq;-><init>(Ljava/lang/Throwable;I)V

    .line 58
    .line 59
    .line 60
    invoke-direct {v1, p1}, Ll/juy0;-><init>(Lcom/google/android/gms/internal/ads/zzrq;)V

    .line 61
    .line 62
    .line 63
    :goto_2
    iput-object v1, p0, Ll/e2z0;->C:Ll/juy0;

    .line 64
    .line 65
    iput-object v1, p2, Ll/l9y0;->b:Ll/juy0;

    .line 66
    .line 67
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e2z0;->C:Ll/juy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/e2z0;->C:Ll/juy0;

    .line 7
    .line 8
    iput-object v0, p0, Ll/e2z0;->g:Ll/sqr0;

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final declared-synchronized q()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput v0, p0, Ll/e2z0;->r:I

    .line 4
    .line 5
    iget-object v0, p0, Ll/e2z0;->a:Ll/y1z0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/y1z0;->g()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method

.method public final r()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/e2z0;->r:I

    .line 2
    .line 3
    iget p0, p0, Ll/e2z0;->o:I

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final s(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e2z0;->C:Ll/juy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/e2z0;->l:[I

    .line 6
    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public final declared-synchronized t(Ll/sqr0;)Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/e2z0;->x:Z

    .line 4
    .line 5
    iget-object v1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 6
    .line 7
    invoke-static {p1, v1}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return v0

    .line 15
    :cond_0
    :try_start_1
    iget-object v1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/l2z0;->f()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/l2z0;->b()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/c2z0;

    .line 30
    .line 31
    iget-object v1, v1, Ll/c2z0;->a:Ll/sqr0;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ll/sqr0;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ll/e2z0;->c:Ll/l2z0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/l2z0;->b()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ll/c2z0;

    .line 46
    .line 47
    iget-object p1, p1, Ll/c2z0;->a:Ll/sqr0;

    .line 48
    .line 49
    iput-object p1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iput-object p1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 55
    .line 56
    :goto_0
    iget-boolean p1, p0, Ll/e2z0;->A:Z

    .line 57
    .line 58
    iget-object v1, p0, Ll/e2z0;->z:Ll/sqr0;

    .line 59
    .line 60
    iget-object v2, v1, Ll/sqr0;->l:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, v1, Ll/sqr0;->i:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2, v1}, Ll/a8t0;->f(Ljava/lang/String;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    and-int/2addr p1, v1

    .line 69
    iput-boolean p1, p0, Ll/e2z0;->A:Z

    .line 70
    .line 71
    iput-boolean v0, p0, Ll/e2z0;->B:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    monitor-exit p0

    .line 74
    const/4 p0, 0x1

    .line 75
    return p0

    .line 76
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    throw p1
.end method

.method public final u()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e2z0;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public final v()I
    .locals 1

    .line 1
    iget v0, p0, Ll/e2z0;->p:I

    .line 2
    .line 3
    iget p0, p0, Ll/e2z0;->r:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final declared-synchronized w(JZ)I
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/e2z0;->r:I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/e2z0;->i(I)I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    invoke-virtual {p0}, Ll/e2z0;->r()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v7, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/e2z0;->m:[J

    .line 16
    .line 17
    aget-wide v3, v1, v2

    .line 18
    .line 19
    cmp-long v1, p1, v3

    .line 20
    .line 21
    if-gez v1, :cond_1

    .line 22
    .line 23
    :cond_0
    move-object v1, p0

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    iget-wide v3, p0, Ll/e2z0;->u:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 26
    .line 27
    cmp-long v1, p1, v3

    .line 28
    .line 29
    if-lez v1, :cond_3

    .line 30
    .line 31
    if-nez p3, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    :try_start_1
    iget p1, p0, Ll/e2z0;->o:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    sub-int/2addr p1, v0

    .line 37
    monitor-exit p0

    .line 38
    return p1

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object p1, v0

    .line 41
    move-object v1, p0

    .line 42
    goto :goto_3

    .line 43
    :cond_3
    :goto_0
    :try_start_2
    iget p3, p0, Ll/e2z0;->o:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 44
    .line 45
    sub-int v3, p3, v0

    .line 46
    .line 47
    const/4 v6, 0x1

    .line 48
    move-object v1, p0

    .line 49
    move-wide v4, p1

    .line 50
    :try_start_3
    invoke-virtual/range {v1 .. v6}, Ll/e2z0;->h(IIJZ)I

    .line 51
    .line 52
    .line 53
    move-result p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 54
    const/4 p1, -0x1

    .line 55
    monitor-exit v1

    .line 56
    if-ne p0, p1, :cond_4

    .line 57
    .line 58
    return v7

    .line 59
    :cond_4
    return p0

    .line 60
    :catchall_1
    move-exception v0

    .line 61
    :goto_1
    move-object p1, v0

    .line 62
    goto :goto_3

    .line 63
    :catchall_2
    move-exception v0

    .line 64
    move-object v1, p0

    .line 65
    goto :goto_1

    .line 66
    :goto_2
    monitor-exit v1

    .line 67
    return v7

    .line 68
    :goto_3
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 69
    throw p1
.end method

.method public final x()I
    .locals 1

    .line 1
    iget v0, p0, Ll/e2z0;->p:I

    .line 2
    .line 3
    iget p0, p0, Ll/e2z0;->o:I

    .line 4
    .line 5
    add-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public final y(Ll/l9y0;Ll/evx0;IZ)I
    .locals 8
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    and-int/lit8 v0, p3, 0x2

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v5, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    move v5, v0

    .line 10
    :goto_0
    iget-object v7, p0, Ll/e2z0;->b:Ll/a2z0;

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p2

    .line 15
    move v6, p4

    .line 16
    invoke-virtual/range {v2 .. v7}, Ll/e2z0;->j(Ll/l9y0;Ll/evx0;ZZLl/a2z0;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 p1, -0x4

    .line 21
    if-ne p0, p1, :cond_5

    .line 22
    .line 23
    invoke-virtual {v4}, Ll/fux0;->f()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_4

    .line 28
    .line 29
    and-int/lit8 p0, p3, 0x1

    .line 30
    .line 31
    and-int/lit8 p2, p3, 0x4

    .line 32
    .line 33
    if-nez p2, :cond_2

    .line 34
    .line 35
    iget-object p2, v2, Ll/e2z0;->a:Ll/y1z0;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    iget-object p0, v2, Ll/e2z0;->b:Ll/a2z0;

    .line 40
    .line 41
    invoke-virtual {p2, v4, p0}, Ll/y1z0;->d(Ll/evx0;Ll/a2z0;)V

    .line 42
    .line 43
    .line 44
    return p1

    .line 45
    :cond_1
    iget-object p0, v2, Ll/e2z0;->b:Ll/a2z0;

    .line 46
    .line 47
    invoke-virtual {p2, v4, p0}, Ll/y1z0;->e(Ll/evx0;Ll/a2z0;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    if-eqz p0, :cond_3

    .line 52
    .line 53
    return p1

    .line 54
    :cond_3
    :goto_1
    iget p0, v2, Ll/e2z0;->r:I

    .line 55
    .line 56
    add-int/2addr p0, v1

    .line 57
    iput p0, v2, Ll/e2z0;->r:I

    .line 58
    .line 59
    :cond_4
    return p1

    .line 60
    :cond_5
    return p0
.end method

.method public final declared-synchronized z()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/e2z0;->u:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-wide v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method
