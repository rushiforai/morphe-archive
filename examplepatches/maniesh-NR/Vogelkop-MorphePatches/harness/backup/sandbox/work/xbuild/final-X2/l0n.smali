.class public final Ll0n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final a:Lt7j;

.field public final b:Lg77;

.field public c:Lj92;

.field public d:Lvz5;

.field public e:Lvz5;

.field public f:Z

.field public g:Z

.field public h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lt7j;Lg77;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll0n;->a:Lt7j;

    iput-object p2, p0, Ll0n;->b:Lg77;

    invoke-virtual {p0}, Ll0n;->e()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Ll0n;->h:Ljava/lang/Object;

    if-eqz v0, :cond_19

    iget-object v0, p0, Ll0n;->d:Lvz5;

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    iput-boolean v0, p0, Ll0n;->g:Z

    iget-object v0, p0, Ll0n;->c:Lj92;

    if-eqz v0, :cond_18

    invoke-interface {v0}, Lj92;->h()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Ll0n;->e()V

    :cond_18
    return-void

    :cond_19
    invoke-virtual {p0}, Ll0n;->f()V

    return-void
.end method

.method public final b()Lza9;
    .registers 5

    new-instance v0, Lza9;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Ll0n;->c:Lj92;

    invoke-interface {p0}, Lj92;->b()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcdg;

    iget-boolean v2, v0, Lza9;->a:Z

    iget-object v3, v1, Lcdg;->a:Ll5b;

    iget-boolean v3, v3, Ll5b;->b:Z

    or-int/2addr v2, v3

    iput-boolean v2, v0, Lza9;->a:Z

    iget-boolean v2, v0, Lza9;->b:Z

    iget-object v3, v1, Lcdg;->b:Ll5b;

    iget-boolean v3, v3, Ll5b;->b:Z

    if-nez v3, :cond_34

    iget-object v1, v1, Lcdg;->c:Ll5b;

    iget-boolean v1, v1, Ll5b;->b:Z

    if-nez v1, :cond_34

    const/4 v1, 0x0

    goto :goto_35

    :cond_34
    const/4 v1, 0x1

    :goto_35
    or-int/2addr v2, v1

    iput-boolean v2, v0, Lza9;->b:Z

    goto :goto_f

    :cond_39
    return-object v0
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 10

    iget-object v0, p0, Ll0n;->d:Lvz5;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_52

    if-eqz p1, :cond_4f

    move-object v3, p1

    check-cast v3, Lz05;

    iget-object v0, v0, Lvz5;->e:Ljava/lang/Object;

    check-cast v0, Lz05;

    iget-object v4, v0, Lz05;->i:Lbre;

    iget-object v5, v3, Lz05;->i:Lbre;

    if-nez v4, :cond_1b

    if-nez v5, :cond_19

    move v4, v2

    goto :goto_1f

    :cond_19
    move v4, v1

    goto :goto_1f

    :cond_1b
    invoke-virtual {v4, v5}, Lbre;->equals(Ljava/lang/Object;)Z

    move-result v4

    :goto_1f
    if-eqz v4, :cond_4f

    iget-boolean v4, v0, Lz05;->k:Z

    iget-boolean v5, v3, Lz05;->k:Z

    if-ne v4, v5, :cond_4f

    iget-object v4, v0, Lqtm;->d:Ljava/lang/String;

    iget-object v5, v3, Lqtm;->d:Ljava/lang/String;

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4f

    iget-object v4, v0, Ld93;->a:Lyla;

    iget-object v4, v4, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Ld93;->a:Lyla;

    iget-object v5, v5, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4f

    iget-wide v4, v0, Ld93;->b:J

    iget-wide v6, v3, Ld93;->b:J

    cmp-long v0, v4, v6

    if-eqz v0, :cond_52

    :cond_4f
    invoke-virtual {p0}, Ll0n;->f()V

    :cond_52
    iput-boolean v1, p0, Ll0n;->f:Z

    iput-object p1, p0, Ll0n;->h:Ljava/lang/Object;

    iput-boolean v2, p0, Ll0n;->g:Z

    iget-object p1, p0, Ll0n;->c:Lj92;

    if-nez p1, :cond_5d

    return-void

    :cond_5d
    invoke-virtual {p0}, Ll0n;->b()Lza9;

    move-result-object p1

    iget-boolean v0, p1, Lza9;->a:Z

    if-nez v0, :cond_6a

    iget-boolean p1, p1, Lza9;->b:Z

    if-nez p1, :cond_6a

    return-void

    :cond_6a
    iget-object p1, p0, Ll0n;->h:Ljava/lang/Object;

    if-eqz p1, :cond_7c

    iget-object p1, p0, Ll0n;->e:Lvz5;

    if-eqz p1, :cond_78

    invoke-virtual {p1}, Lvz5;->a()V

    const/4 p1, 0x0

    iput-object p1, p0, Ll0n;->e:Lvz5;

    :cond_78
    invoke-virtual {p0, v2}, Ll0n;->d(Z)V

    return-void

    :cond_7c
    iget-object p0, p0, Ll0n;->c:Lj92;

    invoke-interface {p0}, Lj92;->onFailure()V

    return-void
.end method

.method public final d(Z)V
    .registers 7

    iget-object v0, p0, Ll0n;->h:Ljava/lang/Object;

    check-cast v0, Lz05;

    new-instance v1, Lvz5;

    iget-object v2, p0, Ll0n;->b:Lg77;

    iget-object v3, v2, Lg77;->b:Ljava/lang/Object;

    check-cast v3, Lqre;

    iget-object v4, v2, Lg77;->a:Ljava/lang/Object;

    check-cast v4, Ls9i;

    iget-object v2, v2, Lg77;->c:Ljava/lang/Object;

    check-cast v2, Lx5f;

    invoke-direct {v1, v0, v3, v4, v2}, Lvz5;-><init>(Lz05;Lqre;Ls9i;Lx5f;)V

    iput-object v1, p0, Ll0n;->e:Lvz5;

    if-eqz p1, :cond_1e

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_24

    :cond_1e
    iget-object p1, p0, Ll0n;->c:Lj92;

    invoke-interface {p1}, Lj92;->f()Ljava/util/List;

    move-result-object p1

    :goto_24
    iget-object v0, p0, Ll0n;->e:Lvz5;

    new-instance v1, Lqt6;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lqt6;->f:Ljava/lang/Object;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lqt6;->c:Ljava/lang/Object;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lqt6;->d:Ljava/lang/Object;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lqt6;->e:Ljava/lang/Object;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iput-object v1, v0, Lvz5;->i:Ljava/lang/Object;

    iget-object p1, p0, Ll0n;->d:Lvz5;

    if-eqz p1, :cond_4e

    invoke-virtual {p1}, Lvz5;->a()V

    :cond_4e
    iget-object p0, p0, Ll0n;->e:Lvz5;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lvz5;->c(Ljava/util/EnumSet;)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-boolean v0, p0, Ll0n;->f:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll0n;->f:Z

    iget-object v0, p0, Ll0n;->a:Lt7j;

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    :cond_c
    return-void
.end method

.method public final f()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Ll0n;->g:Z

    const/4 v0, 0x0

    iput-object v0, p0, Ll0n;->h:Ljava/lang/Object;

    iget-object v1, p0, Ll0n;->d:Lvz5;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lvz5;->a()V

    iput-object v0, p0, Ll0n;->d:Lvz5;

    :cond_f
    iget-object v1, p0, Ll0n;->e:Lvz5;

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Lvz5;->a()V

    iput-object v0, p0, Ll0n;->e:Lvz5;

    :cond_18
    iget-object v0, p0, Ll0n;->c:Lj92;

    if-eqz v0, :cond_37

    invoke-interface {v0}, Lj92;->h()Z

    move-result v0

    if-eqz v0, :cond_37

    iget-object v0, p0, Ll0n;->c:Lj92;

    invoke-interface {v0}, Lj92;->a()V

    invoke-virtual {p0}, Ll0n;->b()Lza9;

    move-result-object v0

    iget-boolean v1, v0, Lza9;->a:Z

    if-nez v1, :cond_34

    iget-boolean v0, v0, Lza9;->b:Z

    if-nez v0, :cond_34

    return-void

    :cond_34
    invoke-virtual {p0}, Ll0n;->e()V

    :cond_37
    return-void
.end method
