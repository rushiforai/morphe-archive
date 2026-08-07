.class public abstract Ll/jvx0;
.super Ll/d0u0;
.source "SourceFile"


# instance fields
.field public final f:I

.field public final g:Ll/i2z0;


# direct methods
.method public constructor <init>(ZLl/i2z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d0u0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/jvx0;->g:Ll/i2z0;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/i2z0;->c()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/jvx0;->f:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .locals 3

    .line 1
    instance-of v0, p1, Landroid/util/Pair;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    check-cast p1, Landroid/util/Pair;

    .line 8
    .line 9
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/jvx0;->p(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, p1}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eq p1, v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/jvx0;->s(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/2addr p0, p1

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    return v1
.end method

.method public final d(ILl/hwt0;Z)Ll/hwt0;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/jvx0;->q(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/jvx0;->t(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0}, Ll/jvx0;->s(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    sub-int/2addr p1, v2

    .line 18
    invoke-virtual {v3, p1, p2, p3}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 19
    .line 20
    .line 21
    iget p1, p2, Ll/hwt0;->c:I

    .line 22
    .line 23
    add-int/2addr p1, v1

    .line 24
    iput p1, p2, Ll/hwt0;->c:I

    .line 25
    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/jvx0;->v(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p1, p2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, p2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 42
    .line 43
    :cond_0
    return-object p2
.end method

.method public final e(ILl/wyt0;J)Ll/wyt0;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/jvx0;->r(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/jvx0;->t(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0}, Ll/jvx0;->s(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    sub-int/2addr p1, v1

    .line 18
    invoke-virtual {v3, p1, p2, p3, p4}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/jvx0;->v(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object p1, Ll/wyt0;->p:Ljava/lang/Object;

    .line 26
    .line 27
    iget-object p3, p2, Ll/wyt0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p2, Ll/wyt0;->a:Ljava/lang/Object;

    .line 36
    .line 37
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :cond_0
    iput-object p0, p2, Ll/wyt0;->a:Ljava/lang/Object;

    .line 42
    .line 43
    iget p0, p2, Ll/wyt0;->n:I

    .line 44
    .line 45
    add-int/2addr p0, v2

    .line 46
    iput p0, p2, Ll/wyt0;->n:I

    .line 47
    .line 48
    iget p0, p2, Ll/wyt0;->o:I

    .line 49
    .line 50
    add-int/2addr p0, v2

    .line 51
    iput p0, p2, Ll/wyt0;->o:I

    .line 52
    .line 53
    return-object p2
.end method

.method public final f(I)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/jvx0;->q(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/jvx0;->s(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sub-int/2addr p1, v1

    .line 14
    invoke-virtual {v2, p1}, Ll/d0u0;->f(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, v0}, Ll/jvx0;->v(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final g(Z)I
    .locals 3

    .line 1
    iget v0, p0, Ll/jvx0;->f:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/jvx0;->g:Ll/i2z0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/i2z0;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 v0, 0x0

    .line 17
    :cond_2
    :goto_0
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/d0u0;->o()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Ll/jvx0;->w(IZ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    :goto_1
    return v1

    .line 34
    :cond_3
    invoke-virtual {p0, v0}, Ll/jvx0;->t(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Ll/d0u0;->g(Z)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-int/2addr v1, p0

    .line 47
    return v1
.end method

.method public final h(Z)I
    .locals 3

    .line 1
    iget v0, p0, Ll/jvx0;->f:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/jvx0;->g:Ll/i2z0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/i2z0;->b()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    add-int/2addr v0, v1

    .line 17
    :cond_2
    :goto_0
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/d0u0;->o()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Ll/jvx0;->x(IZ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    :goto_1
    return v1

    .line 34
    :cond_3
    invoke-virtual {p0, v0}, Ll/jvx0;->t(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Ll/d0u0;->h(Z)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-int/2addr v1, p0

    .line 47
    return v1
.end method

.method public final j(IIZ)I
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Ll/jvx0;->r(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/jvx0;->t(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sub-int/2addr p1, v1

    .line 14
    const/4 v3, 0x2

    .line 15
    if-ne p2, v3, :cond_0

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v4, p2

    .line 20
    :goto_0
    invoke-virtual {v2, p1, v4, p3}, Ll/d0u0;->j(IIZ)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 v2, -0x1

    .line 25
    if-eq p1, v2, :cond_1

    .line 26
    .line 27
    add-int/2addr v1, p1

    .line 28
    return v1

    .line 29
    :cond_1
    invoke-virtual {p0, v0, p3}, Ll/jvx0;->w(IZ)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    :goto_1
    if-eq p1, v2, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/d0u0;->o()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, p1, p3}, Ll/jvx0;->w(IZ)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    if-eq p1, v2, :cond_3

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/jvx0;->t(I)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-virtual {p0, p1}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p3}, Ll/d0u0;->g(Z)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    add-int/2addr p2, p0

    .line 65
    return p2

    .line 66
    :cond_3
    if-ne p2, v3, :cond_4

    .line 67
    .line 68
    invoke-virtual {p0, p3}, Ll/d0u0;->g(Z)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_4
    return v2
.end method

.method public final k(IIZ)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/jvx0;->r(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p2}, Ll/jvx0;->t(I)I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-virtual {p0, p2}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sub-int/2addr p1, p3

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, p1, v1, v1}, Ll/d0u0;->k(IIZ)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, -0x1

    .line 20
    if-eq p1, v0, :cond_0

    .line 21
    .line 22
    add-int/2addr p3, p1

    .line 23
    return p3

    .line 24
    :cond_0
    invoke-virtual {p0, p2, v1}, Ll/jvx0;->x(IZ)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    :goto_0
    if-eq p1, v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Ll/d0u0;->o()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0, p1, v1}, Ll/jvx0;->x(IZ)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    if-eq p1, v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/jvx0;->t(I)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {p0, p1}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, v1}, Ll/d0u0;->h(Z)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    add-int/2addr p2, p0

    .line 60
    return p2

    .line 61
    :cond_2
    return v0
.end method

.method public final n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/util/Pair;

    .line 3
    .line 4
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Ll/jvx0;->p(Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0, v1}, Ll/jvx0;->t(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0, v1}, Ll/jvx0;->u(I)Ll/d0u0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0, p2}, Ll/d0u0;->n(Ljava/lang/Object;Ll/hwt0;)Ll/hwt0;

    .line 21
    .line 22
    .line 23
    iget p0, p2, Ll/hwt0;->c:I

    .line 24
    .line 25
    add-int/2addr p0, v2

    .line 26
    iput p0, p2, Ll/hwt0;->c:I

    .line 27
    .line 28
    iput-object p1, p2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 29
    .line 30
    return-object p2
.end method

.method public abstract p(Ljava/lang/Object;)I
.end method

.method public abstract q(I)I
.end method

.method public abstract r(I)I
.end method

.method public abstract s(I)I
.end method

.method public abstract t(I)I
.end method

.method public abstract u(I)Ll/d0u0;
.end method

.method public abstract v(I)Ljava/lang/Object;
.end method

.method public final w(IZ)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/jvx0;->g:Ll/i2z0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/i2z0;->d(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Ll/jvx0;->f:I

    .line 11
    .line 12
    const/4 p2, -0x1

    .line 13
    add-int/2addr p0, p2

    .line 14
    if-lt p1, p0, :cond_1

    .line 15
    .line 16
    return p2

    .line 17
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    return p1
.end method

.method public final x(IZ)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/jvx0;->g:Ll/i2z0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/i2z0;->e(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    if-gtz p1, :cond_1

    .line 12
    .line 13
    return p0

    .line 14
    :cond_1
    add-int/2addr p1, p0

    .line 15
    return p1
.end method
