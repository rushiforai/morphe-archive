.class public final Ll/n2z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/izy0;
.implements Ll/hzy0;


# instance fields
.field public final a:Ll/izy0;

.field public final b:J

.field public c:Ll/hzy0;


# direct methods
.method public constructor <init>(Ll/izy0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n2z0;->a:Ll/izy0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/n2z0;->b:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/gay0;)Z
    .locals 4

    .line 1
    iget-wide v0, p1, Ll/gay0;->a:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/n2z0;->b:J

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/gay0;->a()Ll/z9y0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sub-long/2addr v0, v2

    .line 10
    invoke-virtual {p1, v0, v1}, Ll/z9y0;->e(J)Ll/z9y0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/z9y0;->g()Ll/gay0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ll/izy0;->a(Ll/gay0;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final b(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/n2z0;->b:J

    .line 2
    .line 3
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 4
    .line 5
    sub-long/2addr p1, v0

    .line 6
    invoke-interface {p0, p1, p2}, Ll/izy0;->b(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final bridge synthetic c(Ll/h2z0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/izy0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/n2z0;->c:Ll/hzy0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, p0}, Ll/g2z0;->c(Ll/h2z0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Ll/izy0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/n2z0;->c:Ll/hzy0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, p0}, Ll/hzy0;->d(Ll/izy0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J
    .locals 9

    .line 1
    array-length v0, p3

    .line 2
    new-array v4, v0, [Ll/f2z0;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    array-length v2, p3

    .line 7
    const/4 v8, 0x0

    .line 8
    if-ge v1, v2, :cond_1

    .line 9
    .line 10
    aget-object v2, p3, v1

    .line 11
    .line 12
    check-cast v2, Ll/m2z0;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/m2z0;->c()Ll/f2z0;

    .line 17
    .line 18
    .line 19
    move-result-object v8

    .line 20
    :cond_0
    aput-object v8, v4, v1

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p0, Ll/n2z0;->a:Ll/izy0;

    .line 26
    .line 27
    iget-wide v2, p0, Ll/n2z0;->b:J

    .line 28
    .line 29
    sub-long v6, p5, v2

    .line 30
    .line 31
    move-object v2, p1

    .line 32
    move-object v3, p2

    .line 33
    move-object v5, p4

    .line 34
    invoke-interface/range {v1 .. v7}, Ll/izy0;->e([Ll/n5z0;[Z[Ll/f2z0;[ZJ)J

    .line 35
    .line 36
    .line 37
    move-result-wide p1

    .line 38
    :goto_1
    array-length p4, p3

    .line 39
    if-ge v0, p4, :cond_5

    .line 40
    .line 41
    aget-object p4, v4, v0

    .line 42
    .line 43
    if-nez p4, :cond_2

    .line 44
    .line 45
    aput-object v8, p3, v0

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    aget-object p5, p3, v0

    .line 49
    .line 50
    if-eqz p5, :cond_3

    .line 51
    .line 52
    check-cast p5, Ll/m2z0;

    .line 53
    .line 54
    invoke-virtual {p5}, Ll/m2z0;->c()Ll/f2z0;

    .line 55
    .line 56
    .line 57
    move-result-object p5

    .line 58
    if-eq p5, p4, :cond_4

    .line 59
    .line 60
    :cond_3
    iget-wide p5, p0, Ll/n2z0;->b:J

    .line 61
    .line 62
    new-instance v1, Ll/m2z0;

    .line 63
    .line 64
    invoke-direct {v1, p4, p5, p6}, Ll/m2z0;-><init>(Ll/f2z0;J)V

    .line 65
    .line 66
    .line 67
    aput-object v1, p3, v0

    .line 68
    .line 69
    :cond_4
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    iget-wide p3, p0, Ll/n2z0;->b:J

    .line 73
    .line 74
    add-long/2addr p1, p3

    .line 75
    return-wide p1
.end method

.method public final f(JLl/gfy0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/n2z0;->b:J

    .line 2
    .line 3
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 4
    .line 5
    sub-long/2addr p1, v0

    .line 6
    invoke-interface {p0, p1, p2, p3}, Ll/izy0;->f(JLl/gfy0;)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    add-long/2addr p0, v0

    .line 11
    return-wide p0
.end method

.method public final g(JZ)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/n2z0;->b:J

    .line 2
    .line 3
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 4
    .line 5
    sub-long/2addr p1, v0

    .line 6
    const/4 p3, 0x0

    .line 7
    invoke-interface {p0, p1, p2, p3}, Ll/izy0;->g(JZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final h()Ll/izy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k(Ll/hzy0;J)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/n2z0;->c:Ll/hzy0;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/n2z0;->b:J

    .line 4
    .line 5
    sub-long/2addr p2, v0

    .line 6
    iget-object p1, p0, Ll/n2z0;->a:Ll/izy0;

    .line 7
    .line 8
    invoke-interface {p1, p0, p2, p3}, Ll/izy0;->k(Ll/hzy0;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final l(J)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/n2z0;->b:J

    .line 2
    .line 3
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 4
    .line 5
    sub-long/2addr p1, v0

    .line 6
    invoke-interface {p0, p1, p2}, Ll/izy0;->l(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    add-long/2addr p0, v0

    .line 11
    return-wide p0
.end method

.method public final zzb()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/izy0;->zzb()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/high16 v2, -0x8000000000000000L

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    return-wide v2

    .line 14
    :cond_0
    iget-wide v2, p0, Ll/n2z0;->b:J

    .line 15
    .line 16
    add-long/2addr v0, v2

    .line 17
    return-wide v0
.end method

.method public final zzc()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/izy0;->zzc()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/high16 v2, -0x8000000000000000L

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    return-wide v2

    .line 14
    :cond_0
    iget-wide v2, p0, Ll/n2z0;->b:J

    .line 15
    .line 16
    add-long/2addr v0, v2

    .line 17
    return-wide v0
.end method

.method public final zzd()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/izy0;->zzd()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v4, v0, v2

    .line 13
    .line 14
    if-nez v4, :cond_0

    .line 15
    .line 16
    return-wide v2

    .line 17
    :cond_0
    iget-wide v2, p0, Ll/n2z0;->b:J

    .line 18
    .line 19
    add-long/2addr v0, v2

    .line 20
    return-wide v0
.end method

.method public final zzh()Ll/q2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/izy0;->zzh()Ll/q2z0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzk()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/izy0;->zzk()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzp()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n2z0;->a:Ll/izy0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/izy0;->zzp()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
