.class public abstract Ll/ij1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/j0u;

.field public final b:Ljava/lang/String;

.field public c:Z

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/ij1;->b:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/ij1;->c:Z

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Ll/d3q;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/z0u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/z0u;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/z0u;->H()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/util/IntSet;",
            ")",
            "Ljava/util/List<",
            "Ll/z0u<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ij1;->a:Ll/j0u;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Ll/hj1;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/hj1;-><init>(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, p1, v1}, Ll/x7s;->s0(Ljava/util/List;Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public c(Ljava/util/List;)Ll/z0u;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ll/d3q<",
            "*>;>;)",
            "Ll/z0u<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/d3q;

    .line 16
    .line 17
    instance-of v0, p1, Ll/z0u;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    check-cast p1, Ll/z0u;

    .line 22
    .line 23
    iget-boolean v0, p1, Ll/z0u;->f:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    return-object p1

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public abstract d(Lcom/p1/mobile/putong/live/base/util/IntSet;)V
.end method

.method public final e(Ll/j0u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ij1;->a:Ll/j0u;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/d3q;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d3q<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ij1;->d:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ij1;->a:Ll/j0u;

    .line 9
    .line 10
    new-instance v0, Ll/gj1;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {v0, v1}, Ll/gj1;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final g(Ll/d3q;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d3q<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ij1;->a:Ll/j0u;

    .line 2
    .line 3
    new-instance v0, Ll/gj1;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, v1}, Ll/gj1;-><init>(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ij1;->a:Ll/j0u;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ij1;->c(Ljava/util/List;)Ll/z0u;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/z0u;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/z0u;->R()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/ij1;->g(Ll/d3q;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
