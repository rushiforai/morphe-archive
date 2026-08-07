.class public final Ll/yxy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/m0z0;
.implements Ll/buy0;


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Ll/l0z0;

.field public c:Ll/zty0;

.field public final synthetic d:Ll/tyy0;


# direct methods
.method public constructor <init>(Ll/tyy0;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Ll/txy0;->r(Ll/kzy0;)Ll/l0z0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/txy0;->p(Ll/kzy0;)Ll/zty0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/yxy0;->c:Ll/zty0;

    .line 18
    .line 19
    iput-object p2, p0, Ll/yxy0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final M(ILl/kzy0;Ll/bzy0;Ll/gzy0;)V
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/yxy0;->g(ILl/kzy0;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 9
    .line 10
    invoke-virtual {p0, p4, p2}, Ll/yxy0;->a(Ll/gzy0;Ll/kzy0;)Ll/gzy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p3, p0}, Ll/l0z0;->g(Ll/bzy0;Ll/gzy0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final N(ILl/kzy0;Ll/bzy0;Ll/gzy0;)V
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/yxy0;->g(ILl/kzy0;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 9
    .line 10
    invoke-virtual {p0, p4, p2}, Ll/yxy0;->a(Ll/gzy0;Ll/kzy0;)Ll/gzy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p3, p0}, Ll/l0z0;->d(Ll/bzy0;Ll/gzy0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final P(ILl/kzy0;Ll/bzy0;Ll/gzy0;)V
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/yxy0;->g(ILl/kzy0;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 9
    .line 10
    invoke-virtual {p0, p4, p2}, Ll/yxy0;->a(Ll/gzy0;Ll/kzy0;)Ll/gzy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p3, p0}, Ll/l0z0;->e(Ll/bzy0;Ll/gzy0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final U(ILl/kzy0;Ll/gzy0;)V
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/yxy0;->g(ILl/kzy0;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 9
    .line 10
    invoke-virtual {p0, p3, p2}, Ll/yxy0;->a(Ll/gzy0;Ll/kzy0;)Ll/gzy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Ll/l0z0;->c(Ll/gzy0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final a(Ll/gzy0;Ll/kzy0;)Ll/gzy0;
    .locals 12
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yxy0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    iget-wide v8, p1, Ll/gzy0;->c:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v8, v9, p2}, Ll/tyy0;->D(Ljava/lang/Object;JLl/kzy0;)J

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/yxy0;->a:Ljava/lang/Object;

    .line 13
    .line 14
    iget-wide v10, p1, Ll/gzy0;->d:J

    .line 15
    .line 16
    invoke-virtual {v0, p0, v10, v11, p2}, Ll/tyy0;->D(Ljava/lang/Object;JLl/kzy0;)J

    .line 17
    .line 18
    .line 19
    iget-wide v0, p1, Ll/gzy0;->c:J

    .line 20
    .line 21
    cmp-long p0, v8, v0

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    iget-wide v0, p1, Ll/gzy0;->d:J

    .line 26
    .line 27
    cmp-long p0, v10, v0

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_0
    iget v4, p1, Ll/gzy0;->a:I

    .line 33
    .line 34
    iget-object v5, p1, Ll/gzy0;->b:Ll/sqr0;

    .line 35
    .line 36
    new-instance v2, Ll/gzy0;

    .line 37
    .line 38
    const/4 v6, 0x0

    .line 39
    const/4 v7, 0x0

    .line 40
    const/4 v3, 0x1

    .line 41
    invoke-direct/range {v2 .. v11}, Ll/gzy0;-><init>(IILl/sqr0;ILjava/lang/Object;JJ)V

    .line 42
    .line 43
    .line 44
    return-object v2
.end method

.method public final g(ILl/kzy0;)Z
    .locals 2
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    iget-object v0, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/yxy0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {v0, v1, p2}, Ll/tyy0;->E(Ljava/lang/Object;Ll/kzy0;)Ll/kzy0;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return p1

    .line 16
    :cond_1
    const/4 p2, 0x0

    .line 17
    :goto_0
    iget-object v0, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/yxy0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-virtual {v0, v1, p1}, Ll/tyy0;->C(Ljava/lang/Object;I)I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 25
    .line 26
    iget v1, v0, Ll/l0z0;->a:I

    .line 27
    .line 28
    iget-object v0, v0, Ll/l0z0;->b:Ll/kzy0;

    .line 29
    .line 30
    invoke-static {v0, p2}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 37
    .line 38
    invoke-virtual {v0, p1, p2}, Ll/txy0;->s(ILl/kzy0;)Ll/l0z0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Ll/yxy0;->c:Ll/zty0;

    .line 45
    .line 46
    iget v1, v0, Ll/zty0;->a:I

    .line 47
    .line 48
    iget-object v0, v0, Ll/zty0;->b:Ll/kzy0;

    .line 49
    .line 50
    invoke-static {v0, p2}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Ll/yxy0;->d:Ll/tyy0;

    .line 57
    .line 58
    invoke-virtual {v0, p1, p2}, Ll/txy0;->q(ILl/kzy0;)Ll/zty0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Ll/yxy0;->c:Ll/zty0;

    .line 63
    .line 64
    :cond_3
    const/4 p0, 0x1

    .line 65
    return p0
.end method

.method public final w(ILl/kzy0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Ll/yxy0;->g(ILl/kzy0;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/yxy0;->b:Ll/l0z0;

    .line 9
    .line 10
    invoke-virtual {p0, p4, p2}, Ll/yxy0;->a(Ll/gzy0;Ll/kzy0;)Ll/gzy0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p3, p0, p5, p6}, Ll/l0z0;->f(Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
