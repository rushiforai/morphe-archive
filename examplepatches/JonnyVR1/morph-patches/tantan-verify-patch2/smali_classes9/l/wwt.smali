.class public Ll/wwt;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ubu;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:Ll/ubu;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public c:Ll/ubu;
    .annotation build Landroidx/annotation/NonNull;
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
    invoke-static {}, Ll/ubu;->o()Ll/ubu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/wwt;->a:Ll/ubu;

    .line 9
    .line 10
    invoke-static {}, Ll/ubu;->o()Ll/ubu;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/wwt;->b:Ll/ubu;

    .line 15
    .line 16
    invoke-static {}, Ll/ubu;->o()Ll/ubu;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/wwt;->c:Ll/ubu;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()Ll/wwt;
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wwt;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/wwt;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/wwt;->a:Ll/ubu;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/ubu;->n()Ll/ubu;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/wwt;->j(Ll/ubu;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/wwt;->b:Ll/ubu;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/ubu;->n()Ll/ubu;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/wwt;->i(Ll/ubu;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ubu;->n()Ll/ubu;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Ll/wwt;->k(Ll/ubu;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public b()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wwt;->a:Ll/ubu;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/ubu;->p()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/wwt;->b:Ll/ubu;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/ubu;->p()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ubu;->p()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    new-instance p0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public c()I
    .locals 2

    .line 1
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wwt;->a:Ll/ubu;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/ubu;->p()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/wwt;->b:Ll/ubu;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/ubu;->p()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ubu;->p()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public d()Ll/ubu;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wwt;->b:Ll/ubu;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/ubu;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wwt;->a:Ll/ubu;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/wwt;

    .line 20
    .line 21
    iget-object v2, p0, Ll/wwt;->a:Ll/ubu;

    .line 22
    .line 23
    iget-object v3, p1, Ll/wwt;->a:Ll/ubu;

    .line 24
    .line 25
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Ll/wwt;->b:Ll/ubu;

    .line 32
    .line 33
    iget-object v3, p1, Ll/wwt;->b:Ll/ubu;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 42
    .line 43
    iget-object p1, p1, Ll/wwt;->c:Ll/ubu;

    .line 44
    .line 45
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    return v0

    .line 52
    :cond_2
    :goto_0
    return v1
.end method

.method public f(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wwt;->a:Ll/ubu;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Ll/ubu;->s(I)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lt v1, p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v1, p0, Ll/wwt;->b:Ll/ubu;

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ll/ubu;->s(I)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-lt v1, p1, :cond_1

    .line 33
    .line 34
    :goto_0
    return-object v0

    .line 35
    :cond_1
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/ubu;->s(I)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method public g()Ll/ubu;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wwt;->a:Ll/ubu;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/wwt;->b:Ll/ubu;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wwt;->a:Ll/ubu;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wwt;->b:Ll/ubu;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wwt;->c:Ll/ubu;

    .line 6
    .line 7
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public i(Ll/ubu;)V
    .locals 0
    .param p1    # Ll/ubu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/wwt;->b:Ll/ubu;

    .line 2
    .line 3
    return-void
.end method

.method public j(Ll/ubu;)V
    .locals 0
    .param p1    # Ll/ubu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/wwt;->a:Ll/ubu;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ll/ubu;)V
    .locals 0
    .param p1    # Ll/ubu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/wwt;->c:Ll/ubu;

    .line 2
    .line 3
    return-void
.end method
