.class public abstract Ll/tyy0;
.super Ll/txy0;
.source "SourceFile"


# instance fields
.field public final h:Ljava/util/HashMap;

.field public i:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ll/btx0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/txy0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public abstract A(Ljava/lang/Object;Ll/mzy0;Ll/d0u0;)V
.end method

.method public final B(Ljava/lang/Object;Ll/mzy0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/xxy0;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/xxy0;-><init>(Ll/tyy0;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/yxy0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/yxy0;-><init>(Ll/tyy0;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/zxy0;

    .line 23
    .line 24
    invoke-direct {v2, p2, v0, v1}, Ll/zxy0;-><init>(Ll/mzy0;Ll/lzy0;Ll/yxy0;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/tyy0;->i:Landroid/os/Handler;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-interface {p2, p1, v1}, Ll/mzy0;->f(Landroid/os/Handler;Ll/m0z0;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/tyy0;->i:Landroid/os/Handler;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    invoke-interface {p2, p1, v1}, Ll/mzy0;->j(Landroid/os/Handler;Ll/buy0;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/tyy0;->j:Ll/btx0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/txy0;->o()Ll/voy0;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {p2, v0, p1, v1}, Ll/mzy0;->g(Ll/lzy0;Ll/btx0;Ll/voy0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/txy0;->z()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_0

    .line 62
    .line 63
    invoke-interface {p2, v0}, Ll/mzy0;->l(Ll/lzy0;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public C(Ljava/lang/Object;I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public D(Ljava/lang/Object;JLl/kzy0;)J
    .locals 0
    .param p4    # Ll/kzy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-wide p2
.end method

.method public abstract E(Ljava/lang/Object;Ll/kzy0;)Ll/kzy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public G()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/zxy0;

    .line 22
    .line 23
    iget-object v0, v0, Ll/zxy0;->a:Ll/mzy0;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/mzy0;->G()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public final t()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/zxy0;

    .line 22
    .line 23
    iget-object v1, v0, Ll/zxy0;->a:Ll/mzy0;

    .line 24
    .line 25
    iget-object v0, v0, Ll/zxy0;->b:Ll/lzy0;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ll/mzy0;->l(Ll/lzy0;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public final u()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/zxy0;

    .line 22
    .line 23
    iget-object v1, v0, Ll/zxy0;->a:Ll/mzy0;

    .line 24
    .line 25
    iget-object v0, v0, Ll/zxy0;->b:Ll/lzy0;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ll/mzy0;->n(Ll/lzy0;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public v(Ll/btx0;)V
    .locals 0
    .param p1    # Ll/btx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tyy0;->j:Ll/btx0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p1}, Ll/mpw0;->L(Landroid/os/Handler$Callback;)Landroid/os/Handler;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/tyy0;->i:Landroid/os/Handler;

    .line 9
    .line 10
    return-void
.end method

.method public x()V
    .locals 4
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/zxy0;

    .line 22
    .line 23
    iget-object v2, v1, Ll/zxy0;->a:Ll/mzy0;

    .line 24
    .line 25
    iget-object v3, v1, Ll/zxy0;->b:Ll/lzy0;

    .line 26
    .line 27
    invoke-interface {v2, v3}, Ll/mzy0;->h(Ll/lzy0;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, v1, Ll/zxy0;->a:Ll/mzy0;

    .line 31
    .line 32
    iget-object v3, v1, Ll/zxy0;->c:Ll/yxy0;

    .line 33
    .line 34
    invoke-interface {v2, v3}, Ll/mzy0;->e(Ll/m0z0;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v1, Ll/zxy0;->a:Ll/mzy0;

    .line 38
    .line 39
    iget-object v1, v1, Ll/zxy0;->c:Ll/yxy0;

    .line 40
    .line 41
    invoke-interface {v2, v1}, Ll/mzy0;->a(Ll/buy0;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object p0, p0, Ll/tyy0;->h:Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 48
    .line 49
    .line 50
    return-void
.end method
