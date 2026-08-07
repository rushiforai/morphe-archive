.class public abstract Ll/txy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mzy0;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Ljava/util/HashSet;

.field public final c:Ll/l0z0;

.field public final d:Ll/zty0;

.field public e:Landroid/os/Looper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Ll/d0u0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ll/voy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/txy0;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    new-instance v0, Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 18
    .line 19
    new-instance v0, Ll/l0z0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/l0z0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/txy0;->c:Ll/l0z0;

    .line 25
    .line 26
    new-instance v0, Ll/zty0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/zty0;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/txy0;->d:Ll/zty0;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public final a(Ll/buy0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txy0;->d:Ll/zty0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zty0;->c(Ll/buy0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final e(Ll/m0z0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txy0;->c:Ll/l0z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l0z0;->h(Ll/m0z0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Landroid/os/Handler;Ll/m0z0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txy0;->c:Ll/l0z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/l0z0;->b(Landroid/os/Handler;Ll/m0z0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(Ll/lzy0;Ll/btx0;Ll/voy0;)V
    .locals 3
    .param p2    # Ll/btx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/txy0;->e:Landroid/os/Looper;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-ne v1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v2, 0x0

    .line 14
    :cond_1
    :goto_0
    invoke-static {v2}, Ll/lev0;->d(Z)V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, Ll/txy0;->g:Ll/voy0;

    .line 18
    .line 19
    iget-object p3, p0, Ll/txy0;->f:Ll/d0u0;

    .line 20
    .line 21
    iget-object v1, p0, Ll/txy0;->a:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/txy0;->e:Landroid/os/Looper;

    .line 27
    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    iput-object v0, p0, Ll/txy0;->e:Landroid/os/Looper;

    .line 31
    .line 32
    iget-object p3, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 33
    .line 34
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ll/txy0;->v(Ll/btx0;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    if-eqz p3, :cond_3

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/txy0;->n(Ll/lzy0;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {p1, p0, p3}, Ll/lzy0;->a(Ll/mzy0;Ll/d0u0;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void
.end method

.method public final h(Ll/lzy0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/txy0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/txy0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Ll/txy0;->e:Landroid/os/Looper;

    .line 16
    .line 17
    iput-object p1, p0, Ll/txy0;->f:Ll/d0u0;

    .line 18
    .line 19
    iput-object p1, p0, Ll/txy0;->g:Ll/voy0;

    .line 20
    .line 21
    iget-object p1, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/txy0;->x()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p0, p1}, Ll/txy0;->l(Ll/lzy0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final j(Landroid/os/Handler;Ll/buy0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txy0;->d:Ll/zty0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zty0;->b(Landroid/os/Handler;Ll/buy0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l(Ll/lzy0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/HashSet;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/txy0;->t()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public synthetic m(Ll/trs0;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public final n(Ll/lzy0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/txy0;->e:Landroid/os/Looper;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/txy0;->u()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final o()Ll/voy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txy0;->g:Ll/voy0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final p(Ll/kzy0;)Ll/zty0;
    .locals 1
    .param p1    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/txy0;->d:Ll/zty0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Ll/zty0;->a(ILl/kzy0;)Ll/zty0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final q(ILl/kzy0;)Ll/zty0;
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/txy0;->d:Ll/zty0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1, p2}, Ll/zty0;->a(ILl/kzy0;)Ll/zty0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final r(Ll/kzy0;)Ll/l0z0;
    .locals 1
    .param p1    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/txy0;->c:Ll/l0z0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1}, Ll/l0z0;->a(ILl/kzy0;)Ll/l0z0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final s(ILl/kzy0;)Ll/l0z0;
    .locals 0
    .param p2    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/txy0;->c:Ll/l0z0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1, p2}, Ll/l0z0;->a(ILl/kzy0;)Ll/l0z0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public t()V
    .locals 0

    .line 1
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract v(Ll/btx0;)V
    .param p1    # Ll/btx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public final w(Ll/d0u0;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/txy0;->f:Ll/d0u0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/txy0;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Ll/lzy0;

    .line 17
    .line 18
    invoke-interface {v3, p0, p1}, Ll/lzy0;->a(Ll/mzy0;Ll/d0u0;)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public abstract x()V
.end method

.method public synthetic y()Ll/d0u0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/txy0;->b:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

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
