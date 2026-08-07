.class public final Ll/czy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/izy0;
.implements Ll/hzy0;


# instance fields
.field public final a:Ll/kzy0;

.field public final b:J

.field public c:Ll/mzy0;

.field public d:Ll/izy0;

.field public e:Ll/hzy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:J

.field public final g:Ll/c6z0;


# direct methods
.method public constructor <init>(Ll/kzy0;Ll/c6z0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/czy0;->a:Ll/kzy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/czy0;->g:Ll/c6z0;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/czy0;->b:J

    .line 9
    .line 10
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    iput-wide p1, p0, Ll/czy0;->f:J

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(Ll/gay0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/izy0;->a(Ll/gay0;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final b(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/izy0;->b(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final bridge synthetic c(Ll/h2z0;)V
    .locals 1

    .line 1
    check-cast p1, Ll/izy0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/czy0;->e:Ll/hzy0;

    .line 4
    .line 5
    sget v0, Ll/mpw0;->a:I

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d(Ll/izy0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/czy0;->e:Ll/hzy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/hzy0;->d(Ll/izy0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/czy0;->f:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-eqz v4, :cond_0

    .line 11
    .line 12
    iget-wide v4, p0, Ll/czy0;->b:J

    .line 13
    .line 14
    cmp-long v4, p5, v4

    .line 15
    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    move-wide p5, v0

    .line 19
    :cond_0
    iput-wide v2, p0, Ll/czy0;->f:J

    .line 20
    .line 21
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 22
    .line 23
    sget v0, Ll/mpw0;->a:I

    .line 24
    .line 25
    invoke-interface/range {p0 .. p6}, Ll/izy0;->e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide p0

    .line 29
    return-wide p0
.end method

.method public final f(JLl/gfy0;)J
    .locals 1

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/izy0;->f(JLl/gfy0;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public final g(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget p3, Ll/mpw0;->a:I

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    invoke-interface {p0, p1, p2, p3}, Ll/izy0;->g(JZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/czy0;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/czy0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final j(Ll/kzy0;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/czy0;->b:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/czy0;->p(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/czy0;->c:Ll/mzy0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Ll/czy0;->g:Ll/c6z0;

    .line 13
    .line 14
    invoke-interface {v2, p1, v3, v0, v1}, Ll/mzy0;->i(Ll/kzy0;Ll/c6z0;J)Ll/izy0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/czy0;->d:Ll/izy0;

    .line 19
    .line 20
    iget-object v2, p0, Ll/czy0;->e:Ll/hzy0;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-interface {p1, p0, v0, v1}, Ll/izy0;->k(Ll/hzy0;J)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final k(Ll/hzy0;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/czy0;->e:Ll/hzy0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/czy0;->d:Ll/izy0;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-wide p2, p0, Ll/czy0;->b:J

    .line 8
    .line 9
    invoke-virtual {p0, p2, p3}, Ll/czy0;->p(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide p2

    .line 13
    invoke-interface {p1, p0, p2, p3}, Ll/izy0;->k(Ll/hzy0;J)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final l(J)J
    .locals 1

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/izy0;->l(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public final m(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/czy0;->f:J

    .line 2
    .line 3
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/czy0;->c:Ll/mzy0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, v0}, Ll/mzy0;->k(Ll/izy0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final o(Ll/mzy0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/czy0;->c:Ll/mzy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/czy0;->c:Ll/mzy0;

    .line 12
    .line 13
    return-void
.end method

.method public final p(J)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/czy0;->f:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long p0, v0, v2

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    return-wide v0

    .line 13
    :cond_0
    return-wide p1
.end method

.method public final zzb()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0}, Ll/izy0;->zzb()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final zzc()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0}, Ll/izy0;->zzc()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final zzd()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0}, Ll/izy0;->zzd()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final zzh()Ll/q2z0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    sget v0, Ll/mpw0;->a:I

    .line 4
    .line 5
    invoke-interface {p0}, Ll/izy0;->zzh()Ll/q2z0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzk()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/izy0;->zzk()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/czy0;->c:Ll/mzy0;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ll/mzy0;->G()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final zzp()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/czy0;->d:Ll/izy0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/izy0;->zzp()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
