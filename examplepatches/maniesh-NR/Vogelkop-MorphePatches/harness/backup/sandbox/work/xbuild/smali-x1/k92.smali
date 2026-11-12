.class public final Lk92;
.super Lc53;
.source "SourceFile"


# instance fields
.field public d:Ljava/util/ArrayList;

.field public final synthetic e:Lyue;


# direct methods
.method public constructor <init>(Lyue;Ljava/lang/Object;Loqe;Lv82;)V
    .registers 5

    iput-object p1, p0, Lk92;->e:Lyue;

    invoke-direct {p0, p2, p3, p4}, Lc53;-><init>(Ljava/lang/Object;Loqe;Lv82;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lk92;->e:Lyue;

    iget-object v1, v0, Lyue;->f:Lk92;

    if-ne v1, p0, :cond_1b

    iget-object v1, v0, Lyue;->d:Ll0n;

    iget-object v2, v1, Ll0n;->d:Lvz5;

    if-eqz v2, :cond_f

    invoke-virtual {v2}, Lvz5;->a()V

    :cond_f
    iget-object v2, v1, Ll0n;->e:Lvz5;

    const/4 v3, 0x0

    if-eqz v2, :cond_19

    invoke-virtual {v2}, Lvz5;->a()V

    iput-object v3, v1, Ll0n;->e:Lvz5;

    :cond_19
    iput-object v3, v0, Lyue;->f:Lk92;

    :cond_1b
    invoke-super {p0}, Lc53;->a()V

    return-void
.end method

.method public final b()Z
    .registers 1

    iget-object p0, p0, Lk92;->d:Ljava/util/ArrayList;

    if-eqz p0, :cond_c

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final c()V
    .registers 5

    iget-object v0, p0, Lc53;->c:Lv82;

    invoke-virtual {v0, p0}, Lv82;->b(Lc53;)V

    iget-object v0, p0, Lk92;->e:Lyue;

    iget-object v1, v0, Lyue;->f:Lk92;

    if-eqz v1, :cond_e

    invoke-virtual {v1}, Lk92;->a()V

    :cond_e
    iput-object p0, v0, Lyue;->f:Lk92;

    iget-object p0, v0, Lyue;->d:Ll0n;

    invoke-virtual {p0}, Ll0n;->b()Lza9;

    move-result-object v0

    iget-object v1, p0, Ll0n;->e:Lvz5;

    if-nez v1, :cond_46

    iget-object v2, p0, Ll0n;->c:Lj92;

    if-eqz v2, :cond_46

    iget-boolean v2, v0, Lza9;->a:Z

    if-nez v2, :cond_26

    iget-boolean v3, v0, Lza9;->b:Z

    if-eqz v3, :cond_46

    :cond_26
    iget-boolean v3, p0, Ll0n;->g:Z

    if-eqz v3, :cond_43

    iget-object v3, p0, Ll0n;->h:Ljava/lang/Object;

    if-eqz v3, :cond_43

    if-nez v1, :cond_46

    if-nez v2, :cond_3f

    iget-object v1, p0, Ll0n;->d:Lvz5;

    if-eqz v1, :cond_3f

    iget-boolean p0, v0, Lza9;->b:Z

    if-eqz p0, :cond_46

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lvz5;->c(Ljava/util/EnumSet;)V

    goto :goto_46

    :cond_3f
    invoke-virtual {p0, v2}, Ll0n;->d(Z)V

    goto :goto_46

    :cond_43
    invoke-virtual {p0}, Ll0n;->e()V

    :cond_46
    :goto_46
    return-void
.end method

.method public final d(Ljava/util/List;Z)V
    .registers 4

    iget-object v0, p0, Lk92;->d:Ljava/util/ArrayList;

    if-nez v0, :cond_13

    instance-of p2, p1, Ljava/util/ArrayList;

    if-nez p2, :cond_e

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object p1, p2

    :cond_e
    check-cast p1, Ljava/util/ArrayList;

    iput-object p1, p0, Lk92;->d:Ljava/util/ArrayList;

    return-void

    :cond_13
    if-eqz p2, :cond_19

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void

    :cond_19
    const/4 p0, 0x0

    invoke-interface {v0, p0, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    return-void
.end method
